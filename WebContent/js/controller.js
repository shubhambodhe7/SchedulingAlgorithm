app.controller('myCtrl', function($scope, $http, $localStorage, $location,
		authenticate) {
	$scope.name = "John Doe";
	console.log($scope.name);

	// //

	$scope.login = function(user) {
		console.log(user);
		$localStorage.loggedIn = false;
		$http.post('project/login', user).then(function(response) {
			console.log(response.data);

			console.log("Hello User");
			$location.path("/register");

		}, function error(response) {
			console.log(response);

			console.log("Login failed");

		});
		authenticate.checkLogin();
	};
	//

	$scope.getAllSports = function() {
		console.log("view method");
		$http.get('project/getAllSports').then(function(empdata) {
			console.log(empdata.data);
			$scope.employee = empdata.data;

		}, function myError(response) {
			$scope.myWelcome = response.statusText;
		});
		// $location.path('/register');
	};
	$scope.dologin = function() {
		console.log("Login method");
		$location.path('/login');
	};

	$scope.register = function() {
		console.log("Register method");
		$location.path('/register');
	};
	$scope.register = function() {
		console.log("Events method");
		$location.path('/displayEvents');
	};

	$scope.teamRegister = function() {
		console.log("Team Register method");
		$location.path('/teamRegister/1');
	};
	$scope.assignReferee = function() {
		console.log("Team Register method");
		$location.path('/assignReferee');
	};

	$scope.login = function(user) {
		console.log(user);
		$localStorage.loggedIn = false;
		$http.post('project/login', user).then(function(response) {
			console.log(response.data);

			console.log("Hello User");
			$location.path("/register");

		}, function error(response) {
			console.log(response);

			console.log("Login failed");

		});
		authenticate.checkLogin();
	};
	$scope.logout = function(user) {
		console.log(user);
		$localStorage.loggedIn = false;
		$http.post('project/logout', user).then(function(response) {
			console.log(response.data);

			console.log("User logged out");
			$location.path("/register");

		}, function error(response) {
			console.log(response);

			console.log("User logged out failed");

		});
		authenticate.checkLogin();
	};

	$scope.addEvent = function(event) {

		$http.post('project/addEvent', event).then(function(response) {
			console.log(response.data);
			bootbox.alert("registered");
		}, function error(response) {
			console.log(response);

		});
	};

});