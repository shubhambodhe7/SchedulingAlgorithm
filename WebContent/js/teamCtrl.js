app.controller('teamCtrl', function(event, $scope, $http, $localStorage,
		$location) {

	var userId = 2;
	$scope.maxPlayers = event.maxPlayers;
	$scope.eventName = event.eventName;
	$scope.eventId = event.eventId;
	$scope.yearOfEng;
	$scope.dept;
	$scope.options = [];
	$scope.payload = [];

	getEligiblePlayers(userId);

	function getEligiblePlayers(userId) {

		$http.get('project/getEligiblePlayers/' + userId).then(
				function(empdata) {
					console.log(empdata.data);
					$scope.yearOfEng = empdata.data[0].yearOfEng;
					$scope.dept = empdata.data[0].dept;
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

	$scope.registerTeam = function(data) {
		$scope.data = data;

		console.log("data" + $scope.data.option[0]);
		var temp = [];
		for (var i = 0; i < $scope.data.option.length; i++) { //
			temp.push({
				playerId : $scope.options[i].key,
				playerName : $scope.options[i].value
			});
		}
		var varyearOfEng = $scope.yearOfEng;
		var vardept = $scope.dept;
		$scope.payload.push({
			yearOfEng : varyearOfEng,
			dept : vardept,
			players : temp
		});

		$http.post('project/registerForTeamEvent', $scope.payload).then(
				function(userdata) {
					console.log(userdata.data);
					bootbox.alert("registered");
				}, function error(userdata) {
					console.log(userdata);

				});
	}

});
