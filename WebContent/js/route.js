var app = angular.module("app", [ "ngRoute", "ngStorage", 'ui.bootstrap',
		'ngSanitize', 'ngAnimate', 'long2know', 'ui.bootstrap', 'ui.router',
		'ui', 'ngMessages', 'ngCookies' ]);
/*
 * window.onbeforeunload = function() {
 * localStorage.removeItem("_f7c2e09ca07304e85f9563435e6ca31534ee2ca1");
 * localStorage.removeItem("userId"); localStorage.removeItem("userName");
 * return ''; };
 */
app.config(function($routeProvider, $httpProvider, $locationProvider) {
	$routeProvider.when("/", {
		templateUrl : "partials/home.html",
		controller : "myCtrl",
		resolve : {
			check : function(accessFac, $location) {
				if (!accessFac.checkIfUser()) {
					$location.path('/login');
				}
			}
		}
	}).when("/login", {
		templateUrl : "partials/login.html",
		controller : "myCtrl",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfUser()) {
					$location.path('/login');
				}
			}
		}
	}).when("/register", {
		templateUrl : "partials/register.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}
	}).when("/home", {
		templateUrl : "partials/home.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfUser()) {
					$location.path('/login');
				}
			}
		}
	}).when("/displayEvents", {
		templateUrl : "partials/displayEvents.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfUser()) {
					$location.path('/login');
				}
			}
		}
	}).when("/winners", {
		templateUrl : "partials/winners.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfUser()) {
					$location.path('/login');
				}
			}
		}
	}).when("/classScore", {
		templateUrl : "partials/classScore.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfUser()) {
					$location.path('/login');
				}
			}
		}
	}).when("/allClassScore", {
		templateUrl : "partials/allClassScore.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfUser()) {
					$location.path('/login');
				}
			}
		}
	}).when("/deleteEvents", {
		templateUrl : "partials/deleteEvents.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}
	}).when("/myRegistrations", {
		templateUrl : "partials/myRegistrations.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfUser()) {
					$location.path('/login');
				}
			}
		}
	}).when("/assignReferee", {
		templateUrl : "partials/assignReferee.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}
	}).when("/advTeams", {
		templateUrl : "partials/advanceTeams.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}
	}).when("/updateScore", {
		templateUrl : "partials/updateScore.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}
	})

	.when("/changePassword", {
		templateUrl : "partials/changePassword.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfUser()) {
					$location.path('/login');
				}
			}
		}
	}).when("/generateSchedule", {
		templateUrl : "partials/generateSchedule.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}
	}).

	when("/publicHoliday", {
		templateUrl : "partials/publicHoliday.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}

	})

	.when("/viewSchedule", {
		templateUrl : "partials/viewSchedule.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfUser()) {
					$location.path('/login');
				}
			}
		}
	})

	.when("/viewMySchedule", {
		templateUrl : "partials/viewMySchedule.html",
		resolve : {
			sessionActive : function(accessFac) {
				return accessFac.checkIfUser();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfUser()) {
					$location.path('/login');
				}
			}
		}
	})

	.when(
			"/teamRegister/:userId/:eventId",
			{
				templateUrl : "partials/teamRegister.html",
				controller : "teamCtrl",
				resolve : {

					event : function($http, $route) {
						var eventId = $route.current.params.eventId;
						var userId = $route.current.params.userId;
						console.log("$routeParams.eventId : "
								+ $route.current.params.eventId);
						return $http.get(
								'project/getEventDetails/' + userId + '/'
										+ eventId).then(function(response) {
							return response.data[0];
						})
					}

				}
			}).otherwise({
		redirect : '/login'
	});

});

app
		.factory(
				'accessFac',
				function($sessionStorage) {
					return {
						checkIfAdmin : function() {
							return ($sessionStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 == 'd033e22ae348aeb5660fc2140aec35850c4da997')
						},
						checkIfUser : function() {

							return ($sessionStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 == '9c2a6e4809aeef7b7712ca4db05a681452f4f748' || $sessionStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 == 'd033e22ae348aeb5660fc2140aec35850c4da997')

						}
					}

				});
