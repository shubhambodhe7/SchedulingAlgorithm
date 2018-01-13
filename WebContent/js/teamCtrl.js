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
											// console.log(empdata.data.length);
											// $scope.options = empdata.data;
											// $scope.events = empdata.data;

											for (var i = 0; i < empdata.data.length; i++) { //
												$scope.options
														.push({
															key : empdata.data[i].userId,
															value : empdata.data[i].userName
														});
											}

											// console.log($scope.options);

										},
										function myError(response) {
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
										function(userdata) {
											console.log(userdata.data);
											if (userdata.data == -3) {
												bootbox
														.alert("One of the participant has already registered for this event!");
											} else if (userdata.data == -2) {
												bootbox
														.alert("Team with same name for this event already exists!");
											} else if (userdata.data == -1) {
												bootbox
														.alert("Registration failed!");
											} else {
												bootbox
														.alert("Registration successful!");
											}

										},
										function error(userdata) {
											console.log(userdata);
											bootbox
													.alert("Registration failed!");

										});
					}

				});
