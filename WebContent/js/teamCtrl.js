app
		.controller(
				'teamCtrl',
				function(event, $scope, $http, $localStorage, $location,
						$modalInstance) {

					// var userId = 3;
					$scope.userId = 'chayan.agrawal@ves.ac.in';
					$scope.maxPlayers = event.maxPlayers;
					$scope.eventName = event.eventName;
					$scope.eventId = event.eventId;
					$scope.yearOfEng;
					$scope.dept;
					$scope.classroom;
					$scope.options = [];
					$scope.selectedPlayers = [];

					getEligiblePlayers($scope.userId);

					function getEligiblePlayers(userId) {

						$http
								.get('project/getEligiblePlayers/' + userId)
								.then(
										function(response) {
											console.log(response.data);
											$scope.yearOfEng = response.data[0].yearOfEng;
											$scope.dept = response.data[0].dept;
											$scope.classroom = response.data[0].classroom;

											for (var i = 0; i < response.data.length; i++) { //
												$scope.options
														.push({
															key : response.data[i].userId,
															value : response.data[i].userName
														});
											}

										},
										function myError(response) {
											bootbox
													.alert("Error occurred while fetching participants list!");
										});

					}
					;

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};

					$scope.registerTeam = function(data) {
						debugger;

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
												+ $scope.classroom + '/'
												+ $scope.dept + '/'
												+ $scope.yearOfEng + '/'
												+ $scope.eventId + '/'
												+ JSON.stringify(temp))
								.then(
										function(response) {
											console.log(response.data);
											if (response.data == -4) {
												bootbox
														.alert("One of the participant has already registered as a referee for this event!");
											} else if (response.data == -3) {
												bootbox
														.alert("One of the participant has already registered for this event!");
											} else if (response.data == -2) {
												bootbox
														.alert("Team with same name for this event already exists!");
											} else if (response.data == -1) {
												$modalInstance
														.dismiss('cancel');
												bootbox
														.alert("Registration failed!");
											} else {
												$modalInstance
														.dismiss('cancel');
												bootbox
														.alert("Registration successful!");
											}

										},
										function error(response) {
											console.log(response);
											$modalInstance.dismiss('cancel');
											bootbox
													.alert("Registration failed!");

										});
					}

				});
