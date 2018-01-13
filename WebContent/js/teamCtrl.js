app
		.controller(
				'teamCtrl',
				function(event, $scope, $http, $localStorage, $location) {

					var userId = 2;
					$scope.maxPlayers = event.maxPlayers;
					$scope.eventName = event.eventName;
					$scope.eventId = event.eventId;
					$scope.yearOfEng;
					$scope.dept;
					$scope.options = [];

					getEligiblePlayers(userId);

					function getEligiblePlayers(userId) {

						$http
								.get('project/getEligiblePlayers/' + userId)
								.then(
										function(empdata) {
											console.log(empdata.data);
											$scope.yearOfEng = empdata.data[0].yearOfEng;
											$scope.dept = empdata.data[0].dept;

											for (var i = 0; i < empdata.data.length; i++) { //
												$scope.options
														.push({
															key : empdata.data[i].userId,
															value : empdata.data[i].userName
														});
											}

										},
										function myError(response) {
											bootbox
													.alert("Error occurred while fetching participants list!");
										});

					}
					;

					$scope.registerTeam = function(data) {
						$scope.data = data;

						console.log("data" + $scope.data.option[0]);
						var temp = [];
						for (var i = 0; i < $scope.data.option.length; i++) { //
							temp.push({
								playerId : parseInt($scope.options[i].key),
								playerName : $scope.options[i].value
							});
						}
						var varyearOfEng = $scope.yearOfEng;
						var vardept = $scope.dept;
						$scope.payload = {
							yearOfEng : varyearOfEng,
							dept : vardept,
							players : temp
						};

						$http
								.get(
										'project/registerForTeamEvent/'
												+ $scope.data.teamName + '/'
												+ $scope.dept + '/'
												+ $scope.yearOfEng + '/'
												+ $scope.eventId + '/'
												+ JSON.stringify(temp))
								.then(
										function(response) {
											console.log(response.data);
											if (response.data == -3) {
												bootbox
														.alert("One of the participant has already registered for this event!");
											} else if (response.data == -2) {
												bootbox
														.alert("Team with same name for this event already exists!");
											} else if (response.data == -1) {
												bootbox
														.alert("Registration failed!");
											} else {
												bootbox
														.alert("Registration successful!");
											}

										},
										function error(response) {
											console.log(response);
											bootbox
													.alert("Registration failed!");

										});
					}

				});
