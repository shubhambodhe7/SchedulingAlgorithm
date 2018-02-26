app.controller('assignRefereeCtrl', function(assignRefereeData, $scope, $http,
		$location, $modalInstance, $sessionStorage) {
	console.log("assignRefereeData : " + assignRefereeData);
	$scope.assignRefereeModalData = assignRefereeData;

	$scope.eventHeads = [];
	getEligibleEventHeads($scope.assignRefereeModalData.eventId);

	function getEligibleEventHeads(eventId) {
		debugger;
		console.log(eventId);
		$http.get('project/getEligibleEventHeads/' + eventId).then(
				function(response) {
					console.log(response.data);
					$scope.eventHeads = [];
					for (var i = 0; i < response.data.length; i++) { //
						$scope.eventHeads.push({
							key : response.data[i].userId,
							value : response.data[i].userName
						});
					}

				}, function myError(response) {

				});

	}
	;

	$scope.cancel = function() {
		$modalInstance.dismiss('cancel');
	};
	
	$scope.assignReferee = function(data) {
		console.log(data);

		$http.get(
				'project/assignRefereeForEvent/' + data.eventHeadId + '/'
						+ $scope.assignRefereeModalData.eventId + '/'
						+ $scope.assignRefereeModalData.gameId).then(
				function(response) {
					console.log(response.data);
					if (response.data > 0) {
						bootbox.alert("Event head assigned successfully.");
					} else {
						bootbox.alert("Event head assignment failed!");
					}
					$modalInstance.dismiss('cancel');

				}, function error(response) {
					console.log(response);

					bootbox.alert("Error occured while assigning eventhead!");
					$modalInstance.dismiss('cancel');
				});

	};

});
