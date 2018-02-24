app
		.controller(
				'eventCtrl',
				function($scope, $http, $sessionStorage, $location, $modal,
						$log, $route) {

					var userId = 'chayan.agrawal@ves.ac.in';
					$scope.$watch('data.eventId', function() {
						$scope.eventHeads = [];
						getEligibleEventHeads($scope.data.eventId);

					});

					$scope.allRounds = [ 'Final Winner', 'Finalists',
							'Semi Finalists', 'Quarter Finalists',
							'Pre quarter finalists ', 'Participated',
							'Seed Final Winner', 'Seed Finalists',
							'Seed Semi Finalists', 'Seed Quarter Finalists',
							'Seed Pre quarter finalists ', 'Seed Participated' ];

					$scope
							.$watch(
									'data.allEventId',
									function() {
										$scope.teamList = [];
										getTeamsForEvent($scope.data.allEventId);
										if (getMaxNumParticipants($scope.data.allEventId) != 1) {
											$scope.rounds = [ 'Final Winner',
													'Finalists',
													'Semi Finalists',
													'Quarter Finalists',
													'Pre quarter finalists ',
													'Participated' ];
										} else {
											$scope.rounds = [
													'Final Winner',
													'Seed Final Winner',
													'Seed Finalists',
													'Seed Semi Finalists',
													'Seed Quarter Finalists',
													'Seed Pre quarter finalists ',
													'Seed Participated' ];
										}
									});
					$scope.$watch('data.teams', function() {

					});

					init();

					function init() {

						$scope.maxPlayers = event.maxPlayers;
						$scope.eventName = event.eventName;
						$scope.eventId = event.eventId;
						$scope.yearOfEng;
						$scope.dept;
						$scope.options = [];
						$scope.selectedPlayers = [];
						$scope.eventList = [];
						$scope.mainEventList = [];
						$scope.eventHeads = [];
						$scope.allEventList = [];
						$scope.teamList = [];
						$scope.currEventWinners = [];
						$scope.loading = false;

						getPendingEvents();
						getAllEvents();
						getEventList();
						getMainEvents();
						getClassPoints();
						getMyRegistrations();
						getSchedule();
						// getEligibleEventHeads(1);

						console.log("view method");

					}

					function getAllEvents() {

						$http.get(
								'project/getEventDetailsAsPerUser/'
										+ $sessionStorage.userId).then(
								function(response) {
									console.log(response.data);
									$scope.events = response.data.reverse();

								}, function myError(response) {
									$scope.myWelcome = response.statusText;
								});
					}
					function getSchedule() {

						$http.get('project/getSchedule').then(
								function(response) {
									console.log("getSchedule" + response.data);
									$scope.schedule = response.data;

								}, function myError(response) {
									$scope.myWelcome = response.statusText;
								});
					}

					function getClassPoints() {

						$http.get(
								'project/getClassPoints/'
										+ $sessionStorage.userId).then(
								function(response) {
									// debugger;
									console.log(response.data);
									$scope.classScore = response.data;

								}, function myError(response) {
									$scope.myWelcome = response.statusText;
								});
					}
					;
					function getMyRegistrations() {

						$http.get(
								'project/getMyRegistrations/'
										+ $sessionStorage.userId).then(
								function(response) {
									// debugger;
									console.log(response.data);
									$scope.myRegistration = response.data;

								}, function myError(response) {
									$scope.myWelcome = response.statusText;
								});
					}
					;
					function getEventList() {
						$http
								.get('project/getAllEvents')
								.then(
										function(response) {
											console.log(response.data);
											$scope.eventListForDel = response.data;
											$scope.eventListDisplay = response.data
													.reverse();
											for (var i = response.data.length - 1; i >= 0; i--) { //
												$scope.allEventList
														.push({
															key : response.data[i].eventId,
															value : response.data[i].eventName
														});
											}

										},
										function myError(response) {
											$scope.myWelcome = response.statusText;
										});
					}
					;

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
					;

					$scope.addEvent = function(event) {
						$http.post('project/addEvent', event).then(
								function(response) {
									console.log(response.data);
									bootbox.alert("Event added successfully.");
									$location.path('/displayEvents');
								}, function error(response) {
									console.log(response);

								});

					};
					$scope.registerForEvent = function(eventId) {
						// bootbox.alert(eventId);
						console.log(eventId)
						console.log("getMaxNumParticipants(eventId)"
								+ getMaxNumParticipants(eventId))
						if (getMaxNumParticipants(eventId) == 1) {
							$http
									.get(
											'project/registerForIndEvent/'
													+ $sessionStorage.userId
													+ '/' + eventId)
									.then(
											function(response) {
												console.log(response.data);
												if (response.data == -3) {
													bootbox
															.alert("You have already registered for this event in other seed");
												} else if (response.data == -2) {
													bootbox
															.alert("Someone from your class has already participated in this seed. Try your luck with other seed!");
												} else if (response.data == -1) {
													bootbox
															.alert("You have already registered for this event!");
												} else {
													bootbox
															.alert("Registration successfully");

												}
											},
											function error(response) {
												console.log(response);

												bootbox
														.alert("Registration failed");

											});
						} else {
							$http
									.get(
											'project/checkIfTeamAlreadyRegistered/'
													+ $sessionStorage.userId
													+ '/' + eventId)
									.then(
											function(response) {
												console.log(response.data);

												if (!response.data) {
													var modalInstance = $modal
															.open({
																templateUrl : 'partials/teamRegister.html',
																controller : 'teamCtrl',
																resolve : {
																	checkIfTeamAlreadyRegistered : function() {

																		return $http
																				.get(
																						'project/checkIfTeamAlreadyRegistered/'
																								+ $sessionStorage.userId
																								+ '/'
																								+ eventId)
																				.then(
																						function(
																								response) {
																							console
																									.log(response.data);

																							return response.data;

																						},
																						function error(
																								response) {
																							console
																									.log(response);

																						}

																				);

																	},
																	event : function(
																			$http) {

																		return $http
																				.get(
																						'project/getEventDetails/'
																								+ $sessionStorage.userId
																								+ '/'
																								+ eventId)
																				.then(
																						function(
																								response) {
																							return response.data[0];
																						})
																	}
																}
															});

												} else {
													bootbox
															.alert("Team from your class has already registered of this event!");
												}

											}, function error(response) {
												console.log(response);

											}

									);

							/*
							 * modalInstance.result.then(function(selectedItems) { //
							 * products = selectedItems; }, function() {
							 * $log.info('Modal dismissed at: ' + new Date());
							 * });
							 */

							// bootbox.alert("more than 1 plyer");
						}

					};
					$scope.applyAsReferee = function(eventId) {
						console.log(eventId);

						$http
								.get(
										'project/registerAsEventHead/'
												+ $sessionStorage.userId + '/'
												+ eventId)
								.then(
										function(response) {
											console.log(response.data);
											if (response.data == -2) {
												bootbox
														.alert("You have already registered as participant for this event hence you cannot become a refree!");
											} else if (response.data == -1) {
												bootbox
														.alert("You have already registered");
											} else {
												bootbox
														.alert("Registered successfully");
											}

										}, function error(response) {
											console.log(response);

											bootbox.alert("registered failed");

										});

					};
					// ///////////////////

					function getEligiblePlayers(userId) {
						// debugger;
						$http
								.get('project/getEligiblePlayers/' + userId)
								.then(
										function(response) {
											console.log(response.data);
											$scope.yearOfEng = response.data[0].yearOfEng;
											$scope.dept = response.data[0].dept;
											$scope.options = [];

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
					function getPendingEvents() {

						$http
								.get(
										'project/getPendingEventsForRefreeAssignment')
								.then(
										function(response) {
											console.log(response.data);
											$scope.eventList = [];
											for (var i = 0; i < response.data.length; i++) { //
												$scope.eventList
														.push({
															key : response.data[i].eventId,
															value : response.data[i].eventName
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
								.get('project/getEligibleEventHeads/' + eventId)
								.then(
										function(response) {
											console.log(response.data);
											$scope.eventHeads = [];
											for (var i = 0; i < response.data.length; i++) { //
												$scope.eventHeads
														.push({
															key : response.data[i].userId,
															value : response.data[i].userName
														});
											}

										}, function myError(response) {

										});

					}
					;
					function getTeamsForEvent(eventId) {
						console.log(eventId);
						$http
								.post('project/getTeamsForEvent', eventId)
								.then(
										function(response) {
											console.log(response.data);
											$scope.teamList = [];
											for (var i = 0; i < response.data.length; i++) { //
												$scope.teamList
														.push({
															key : response.data[i].teamId,
															value : response.data[i].teamName
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
									if (response.data > 0) {
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
					$scope.advanceTeam = function(data) {
						console.log(data);
						// $scope.data = data;
						// //debugger;
						var temp = [];// data.teams;

						for (var i = 0; i < data.teams.length; i++) { //
							temp.push({
								teamId : parseInt(data.teams[i].key),
								teamName : data.teams[i].value
							});
						}
						console.log(temp);
						$http
								.get(
										'project/advanceTeam/' + data.round
												+ '/' + data.allEventId + '/'

												+ JSON.stringify(temp))
								.then(
										function(response) {
											console.log(response.data);
											if (response.data == -1) {
												bootbox
														.alert("Operation failed");

											} else {
												bootbox
														.alert("Teams have been advanced to round "
																+ data.round
																+ " successfully");
											}
											getPendingEvents();

										}, function error(response) {
											console.log(response);

											bootbox.alert("Assignment failed");

										});

					};

					function getMainEvents() {

						$http
								.get('project/getMainEvents')
								.then(
										function(response) {
											console.log(response.data);
											$scope.mainEventList = [];
											for (var i = 0; i < response.data.length; i++) { //
												$scope.mainEventList
														.push({
															key : response.data[i].mainEventId,
															value : response.data[i].mainEventName
														});
											}

										},
										function myError(response) {
											bootbox
													.alert("Error occurred while fetching events list!");
										});

					}
					;

					$scope.deleteEvent = function(eventId) {
						bootbox
								.confirm(
										"Are you sure?",
										function(result) {
											if (result) {
												$http
														.get(
																'project/deleteEvent/'
																		+ eventId)
														.then(
																function(
																		response) {
																	console
																			.log(response.data);

																	if (response.data == 1) {
																		bootbox
																				.alert("Event deleted succesfully!");
																	} else {
																		bootbox
																				.alert("Event deletion failed!");

																	}
																	$route
																			.reload();
																},
																function error(
																		response) {
																	console
																			.log(response);

																	bootbox
																			.alert("Event deletion failed!");

																}

														);
											}
											getEventList();

										});
					}

					$scope.getClickedEventWinners = function(eventId) {
						// $scope.currEventWinners = [];
						$http.get('project/getWinners/' + eventId).then(
								function(response) {
									console.log(response.data);
									$scope.currEventWinners = response.data;

								}, function myError(response) {
									$scope.myWelcome = response.statusText;
								});
					}

					$scope.unregisterForEvent = function(eventId) {
						// bootbox.alert(eventId);
						bootbox
								.confirm(
										"Are you sure?",
										function(result) {
											if (result) {
												$http
														.get(
																'project/unregisterForIndEvent/'
																		+ $sessionStorage.userId
																		+ '/'
																		+ eventId)
														.then(
																function(
																		response) {
																	console
																			.log(response.data);

																	if (response.data >= 0) {
																		bootbox
																				.alert("Unregistration successful!");

																	} else {
																		bootbox
																				.alert("Unregistration failed");

																	}
																	$route
																			.reload();
																},
																function error(
																		response) {
																	console
																			.log(response);

																	bootbox
																			.alert("Unregistration failed");

																});

											}
											;
										})
					}
					$scope.generateSchedule = function(genSch) {
						// debugger;
						$scope.loading = true;
						// $scope.currEventWinners = [];
						$http
								.get(
										'project/generateSchedule/'
												+ genSch.date + '/'
												+ genSch.round)
								.then(
										function(response) {

											console.log(response.data);
											$scope.currEventWinners = response.data;
											if (response.data > 0) {
												bootbox
														.alert("Schedule generated.");
												getSchedule();

											} else if (response.data == 0) {
												bootbox
														.alert("Schedule generation failed!");
											} else {
												bootbox
														.alert("Error occured while generating schedule!")
											}
											$scope.loading = false;

										},
										function myError(response) {
											$scope.myWelcome = response.statusText;
											$scope.loading = false;
										});
					}
					$scope.changePass = function(change) {
						debugger;
						console.log(change);
						change.userId = $sessionStorage.userId;
						$http
								.post('project/changePass', change)
								.then(
										function(changed) {

											console.log(changed);
											$scope.checkStatus = false;
											if (changed.data == 0) {
												bootbox
														.alert("Current Password is wrong!");

											}

											else {
												bootbox
														.alert("Password Changed Successfully.");

											}

										},
										function error() {
											// console.log(response);
											bootbox
													.alert("Error occured while changing password!");

										});

					};

				});