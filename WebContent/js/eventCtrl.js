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

	function getMaxNumParticipants(eventId) {
		for (e in $scope.events) {
			if (e.eventId == eventId) {
				return e.maxPlayers;
			}
		}
	}
	$scope.registerForEvent = function(eventId) {
		if (getMaxNumParticipants() == 1) {
			$http.get('project/registerForEvent/' + 1 + '/' + eventId).then(
					function(userdata) {
						console.log(userdata.data);

<<<<<<< HEAD
		$http.get('project/registerForIndEvent/' + 1 + '/' + eventId).then(
				function(userdata) {
					console.log(userdata.data);

					bootbox.alert("registered");
					$location.path("/register");
=======
						bootbox.alert("registered");
						$location.path("/register");
>>>>>>> shubham

					}, function error(userdata) {
						console.log(userdata);

						bootbox.alert("registered failed");

					});
		}

	};
	$scope.applyAsReferee = function(eventId) {
		console.log(eventId);

		$http.get('project/registerAsEventHead/' + 1 + '/' + eventId).then(
				function(response) {
					console.log(response.data);
					if (response.data == -1) {
						bootbox.alert("You have already registered");
					} else {
						bootbox.alert("Registered successfully");
					}

				}, function error(userdata) {
					console.log(userdata);

					bootbox.alert("registered failed");

				});

	};

});