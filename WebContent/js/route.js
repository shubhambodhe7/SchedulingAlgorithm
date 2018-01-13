var app = angular.module("app", [ "ngRoute", "ngStorage", 'ui.bootstrap',
		'ngSanitize', 'ngAnimate', 'long2know', 'ui.bootstrap', 'ui.router',
		'ui' ]);

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

var getMaxPlayersInTeamForEvent = function(eventId) {
	return [
			"$http",
			"$route",
			function($http, $route) {
				// debugger;
				var maxPlayers = 10;
				console.log("eventId", eventId);
				console.log("$route.current.params.token",
						$route.current.params.token);
				var promise = $http.get('project/getEventDetails/' + eventId);

				promise.then(function(empdata) {
					console.log(empdata.data);
					maxPlayers = empdata.data[0].maxPlayers;
					console.log(" $scope.maxPlayers " + maxPlayers);

				},

				function(error) {
					console.log(error);
				});

				return maxPlayers;
			} ]
};

app.config(function($routeProvider, $httpProvider, $locationProvider) {
	$routeProvider.when("/", {
		templateUrl : "partials/error.html"
	}).when("/register", {
		templateUrl : "partials/register.html"
	}).when("/login", {
		templateUrl : "partials/login.html"
	}).when("/displayEvents", {
		templateUrl : "partials/displayEvents.html"
	}).when(
			"/teamRegister/:eventId",
			{
				templateUrl : "partials/teamRegister.html",
				controller : "teamCtrl",
				resolve : {
					maxPlayersInTeam : function($http,$route) {
						var eventId = $route.current.params.eventId;
						console.log("$routeParams.eventId"
								+ $route.current.params.eventId);
						return $http.get('project/getEventDetails/' + eventId)
								.then(function(response) {
									return response.data[0].maxPlayers;
								})
					}
				// maxPlayersInTeam : getMaxPlayersInTeamForEvent(1)
				}
			}).otherwise({
		redirect : '/'
	});
});
