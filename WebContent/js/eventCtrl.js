app
		.controller(
				'eventCtrl',
				function($scope, $http, $localStorage, $location) {

					var userId = 2;
					$scope.$watch('data.eventId', function() {
						$scope.eventHeads = [];
						getEligibleEventHeads($scope.data.eventId);
					});
					function init() {

						$scope.maxPlayers = event.maxPlayers;
						$scope.eventName = event.eventName;
						$scope.eventId = event.eventId;
						$scope.yearOfEng;
						$scope.dept;
						$scope.options = [];
						$scope.eventList = [];
						$scope.eventHeads = [];
						getPendingEvents();
						// getEligibleEventHeads(1);

						console.log("view method");
						$http.get('project/getAllEvents').then(
								function(empdata) {
									console.log(empdata.data);
									$scope.events = empdata.data;

								}, function myError(response) {
									$scope.myWelcome = response.statusText;
								});

					}

					init();

					function getMaxNumParticipants(eventId) {
						for (var i = 0; i < $scope.events.length; ++i) {
							/*
							 * console.log("eo : " + i + " : " +
							 * $scope.events[i].eventId + " : " +
							 * $scope.events[i].maxPlayers);
							 */if ($scope.events[i].eventId == eventId) {
								console.log("e" + $scope.events[i].maxPlayers);
								return $scope.events[i].maxPlayers;
							}
						}
					}
					$scope.registerForEvent = function(eventId) {
						// bootbox.alert(eventId);
						console.log(eventId)
						console.log("getMaxNumParticipants(eventId)"
								+ getMaxNumParticipants(eventId))
						if (getMaxNumParticipants(eventId) == 1) {
							$http
									.get(
											'project/registerForIndEvent/' + 1
													+ '/' + eventId)
									.then(
											function(response) {
												console.log(response.data);

												if (response.data == -1) {
													bootbox
															.alert("You have already registered as referee!");
												} else {
													bootbox
															.alert("Registered successfully");
												}

											},
											function error(response) {
												console.log(response);

												bootbox
														.alert("Registration failed");

											});
						} else {
							bootbox.alert("more than 1 plyer");
						}

					};
					$scope.applyAsReferee = function(eventId) {
						console.log(eventId);

						$http.get(
								'project/registerAsEventHead/' + 1 + '/'
										+ eventId).then(function(response) {
							console.log(response.data);
							if (response.data == -1) {
								bootbox.alert("You have already registered");
							} else {
								bootbox.alert("Registered successfully");
							}

						}, function error(response) {
							console.log(response);

							bootbox.alert("registered failed");

						});

					};
					// ///////////////////
					getEligiblePlayers(userId);

					function getEligiblePlayers(userId) {

						$http
								.get('project/getEligiblePlayers/' + userId)
								.then(
										function(empdata) {
											console.log(empdata.data);
											$scope.yearOfEng = empdata.data[0].yearOfEng;
											$scope.dept = empdata.data[0].dept;
											$scope.options = [];

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
					function getPendingEvents() {

						$http
								.get(
										'project/getPendingEventsForRefreeAssignment')
								.then(
										function(empdata) {
											console.log(empdata.data);
											$scope.eventList = [];
											for (var i = 0; i < empdata.data.length; i++) { //
												$scope.eventList
														.push({
															key : empdata.data[i].eventId,
															value : empdata.data[i].eventName
														});
											}

										},
										function myError(response) {
											bootbox
													.alert("Error occurred while fetching events list!");
										});

					}
					;

					function getEligibleEventHeads(eventId) {
						console.log(eventId);
						$http
								.post('project/getEligibleEventHeads', eventId)
								.then(
										function(empdata) {
											console.log(empdata.data);
											$scope.eventHeads = [];
											for (var i = 0; i < empdata.data.length; i++) { //
												$scope.eventHeads
														.push({
															key : empdata.data[i].userId,
															value : empdata.data[i].userName
														});
											}

										}, function myError(response) {

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

					$scope.assignReferee = function(data) {
						console.log(data);

						$http
								.get(
										'project/assignRefereeForEvent/'
												+ data.eventHeadId + '/'
												+ data.eventId)
								.then(function(response) {
									console.log(response.data);
									if (response.data == 1) {
										bootbox.alert("Assignment successful");
									} else {
										bootbox.alert("Assignment failed");
									}
									getPendingEvents();

								}, function error(response) {
									console.log(response);

									bootbox.alert("Assignment failed");

								});

					};

				});