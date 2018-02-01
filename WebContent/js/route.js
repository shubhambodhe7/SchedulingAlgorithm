var app = angular.module("app", [ "ngRoute", "ngStorage", 'ui.bootstrap',
		'ngSanitize', 'ngAnimate', 'long2know', 'ui.bootstrap', 'ui.router',
		'ui', 'ngMessages', 'ngCookies' ]);

app.factory('accessFac', function($http, $log, $q, $cookieStore) {
	return {
		checkIfAdmin : function() {
			return ($cookieStore.get('roleName') == 'admin')
		},
		checkIfUser : function() {

			return ($cookieStore.get('roleName') == 'normal')

		}
	}

});
app.config(function($routeProvider, $httpProvider, $locationProvider) {
	$routeProvider.when("/", {
		templateUrl : "partials/error.html"
	}).when("/login", {
		templateUrl : "partials/login.html"
	}).when("/register", {
		templateUrl : "partials/register.html",
		resolve : {
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
		redirect : '/'
	});

});
