app
		.controller(
				'teamCtrl',
				function(event, $scope, $http,
						$localStorage, $location, $modalInstance,
						$sessionStorage) {
					
					console.log(event);
					$scope.maxPlayers = event.maxPlayers;
					$scope.eventName = event.eventName;
					$scope.eventId = event.eventId;
					$scope.yearOfEng;
					$scope.dept;
					$scope.classroom;
					$scope.options = [];
					

					getEligiblePlayers($sessionStorage.userId);

					function getEligiblePlayers(userId) {

						$http
								.get('project/getEligiblePlayers/' + userId)
								.then(
										function(response) {
											console.log(response.data);
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

						console.log("data" + $scope.data.selectedPlayers[0].key);
						var temp = [];
						for (var i = 0; i < $scope.data.selectedPlayers.length; i++) { //
							temp.push({
								playerId : $scope.data.selectedPlayers[i].key,
								playerName : $scope.data.selectedPlayers[i].value

							});
						}
						var varyearOfEng = $scope.yearOfEng;
						var vardept = $scope.dept;
						var params = {
							classroom : $scope.classroom,
							eventId : $scope.eventId,
							players : JSON.stringify(temp)
						};

						$http
								.post('project/registerForTeamEvent/', params)
								.then(
										function(response) {
											console.log(response.data);
											if (response.data == -2) {
												bootbox
														.alert("Team from your class has already registered of this event!");
											} else if (response.data == -1) {
												$modalInstance
														.dismiss('cancel');
												bootbox
														.alert("Team Registration failed!");
											} else {
												$modalInstance
														.dismiss('cancel');
												bootbox
														.alert("Team Registered successfully.");
											}

										},
										function error(response) {
											console.log(response);
											$modalInstance.dismiss('cancel');
											bootbox
													.alert("Error occured while registering team!");

										});
					}

				});
