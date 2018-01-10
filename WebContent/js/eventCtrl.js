app.controller('eventCtrl', function($scope, $http, $localStorage, $location) {

	function init() {
		console.log("view method");
		$http.get('project/getAllEvents').then(function(empdata) {
			console.log(empdata.data);
			$scope.events = empdata.data;

		}, function myError(response) {
			$scope.myWelcome = response.statusText;
		});
		// $location.path('/register');
	}
	init();

	$scope.registerForEvent = function(eventId) {

		$http.get('project/registerForEvent/' + 1 + '/' + eventId).then(
				function(userdata) {
					console.log(userdata.data);

					bootbox.alert("registered");
					$location.path("/register");

				}, function error(userdata) {
					console.log(userdata);

					bootbox.alert("Registration failed");

				});

	};
	$scope.applyAsReferee = function(eventId) {
		console.log(eventId);

		$http.get('project/registerAsEventHead/' + 1 + '/' + eventId).then(
				function(response) {
					console.log(response.data);
					if (response.data == -1) {
						bootbox.alert("you have already registered");
					} else {
						bootbox.alert("registered");
					}

				}, function error(userdata) {
					console.log(userdata);

					bootbox.alert("registered failed");

				});

	};

});