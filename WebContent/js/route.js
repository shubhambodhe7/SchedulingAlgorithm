var app = angular.module("app", [ "ngRoute", "ngStorage", 'ui.bootstrap',
		'ngSanitize', 'ngAnimate', 'long2know', 'ui.bootstrap', 'ui.router',
		'ui' ]);

app.service('authenticate', function($http) {

	return {
		checkLogin : function() {
			$http.get('project/getUser').then(function(response) {
				console.log(response.data);
				console.log("session active");

				return true;
			}, function error(response) {
				console.log(response);

				console.log("session failed");
				return false;
			});
		}
	}
});

app.config(function($routeProvider, $httpProvider, $locationProvider) {
	$routeProvider.when("/", {
		templateUrl : "partials/error.html"
	}).when("/register", {
		templateUrl : "partials/register.html"
	}).when("/login", {
		templateUrl : "partials/login.html"
	}).when("/displayEvents", {
		templateUrl : "partials/displayEvents.html"
	}).when("/assignReferee", {
		templateUrl : "partials/assignReferee.html"
	}).when(
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
