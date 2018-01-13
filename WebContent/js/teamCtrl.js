app.controller('teamCtrl', function(maxPlayersInTeam, $scope, $http,
		$localStorage, $location) {

	var userId = 2;
	$scope.maxPlayers = maxPlayersInTeam;
	$scope.options = [];

	getEligiblePlayers(userId);

	function getEligiblePlayers(userId) {

		$http.get('project/getEligiblePlayers/' + userId).then(
				function(empdata) {
					console.log(empdata.data);
					// console.log(empdata.data.length);
					// $scope.options = empdata.data;
					// $scope.events = empdata.data;

					for (var i = 0; i < empdata.data.length; i++) { //
						$scope.options.push({
							key : empdata.data[i].userId,
							value : empdata.data[i].userName
						});
					}

					// console.log($scope.options);

				}, function myError(response) {
					$scope.myWelcome = response.statusText;
				});

	}
	;

	function getMaxPlayersInTeamForEvent(eventId) {

		var promise = $http.get('project/getEventDetails/' + eventId);

		promise.then(function(empdata) {
			console.log(empdata.data);
			$scope.maxPlayers = empdata.data[0].maxPlayers;
			console.log(" $scope.maxPlayers " + $scope.maxPlayers);

		}, function myError(response) {
			$scope.myWelcome = response.statusText;
			$scope.maxPlayers = 0;
		});

		console.log("maxPlayers " + $scope.maxPlayers);

	}
	;

});
