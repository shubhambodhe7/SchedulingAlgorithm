var app = angular.module("app", [ "ngRoute", "ngStorage", 'ui.bootstrap',
		'ngSanitize', 'ngAnimate', 'long2know', 'ui.bootstrap', 'ui.router',
		'ui', 'ngMessages', 'ngCookies' ]);

app.config(function($routeProvider, $httpProvider, $locationProvider) {
	$routeProvider.when("/", {
		templateUrl : "partials/login.html"
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
				return accessFac.checkIfAdmin();

			},
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}
	}).when("/displayEvents", {
		templateUrl : "partials/displayEvents.html",
		resolve : {
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}
	}).when("/assignReferee", {
		templateUrl : "partials/assignReferee.html",
		resolve : {
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}
	}).when("/advTeams", {
		templateUrl : "partials/advanceTeams.html",
		resolve : {
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}
	}).when("/updateScore", {
		templateUrl : "partials/updateScore.html",
		resolve : {
			check : function(accessFac, $location) {
				if (!accessFac.checkIfAdmin()) {
					$location.path('/login');
				}
			}
		}
	})

	.when(
			"/teamRegister/:eventId",
			{
				templateUrl : "partials/teamRegister.html",
				controller : "teamCtrl",
				resolve : {

					event : function($http, $route) {
						var eventId = $route.current.params.eventId;
						console.log("$routeParams.eventId : "
								+ $route.current.params.eventId);
						return $http.get('project/getEventDetails/' + eventId)
								.then(function(response) {
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
				function($localStorage) {
					return {
						checkIfAdmin : function() {
							return ($localStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 == 'd033e22ae348aeb5660fc2140aec35850c4da997')
						},
						checkIfUser : function() {

							return ($localStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 == '9c2a6e4809aeef7b7712ca4db05a681452f4f748' || $localStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 == 'd033e22ae348aeb5660fc2140aec35850c4da997')

						}
					}

				});

app.factory('$localstorage', [ '$window', function($window) {
	return {
		set : function(key, value) {
			$window.localStorage[key] = value;
		},

		get : function(key, defaultValue) {
			return $window.localStorage[key] || defaultValue;
		},

		setObject : function(key, value) {
			$window.localStorage[key] = JSON.stringify(value);
		},

		getObject : function(key) {
			return JSON.parse($window.localStorage[key] || '{}');
		}
	}
} ]);
