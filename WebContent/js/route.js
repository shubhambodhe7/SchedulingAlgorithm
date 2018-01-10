var app = angular.module("app", [ "ngRoute", "ngStorage", 'ui.bootstrap',
		'ngSanitize', 'ngAnimate' ]);

app.service('authenticate', function($http) {

	return {
		checkLogin : function() {
			$http.get('project/getUser').then(function(userdata) {
				console.log(userdata.data);
				console.log("session active");

				return true;
			}, function error(userdata) {
				console.log(userdata);

				console.log("session failed");
				return false;
			});
		}
	}
});

app.config(function($routeProvider) {
	$routeProvider.when("/", {
		templateUrl : "partials/error.html"
	}).when("/register", {
		templateUrl : "partials/register.html"
	}).when("/login", {
		templateUrl : "partials/login.html"
	}).when("/displayEvents", {
		templateUrl : "partials/displayEvents.html"
	}).otherwise({
		redirect : '/'
	});
});
