app.controller('myCtrl', function($scope, $http, $localStorage, $location,
		authenticate) {
	$scope.name = "John Doe";
	console.log($scope.name);

	// //

	$scope.login = function(user) {
		console.log(user);
		$localStorage.loggedIn = false;
		$http.post('project/login', user).then(function(userdata) {
			console.log(userdata.data);

			console.log("Hello User");
			$location.path("/register");

		}, function error(userdata) {
			console.log(userdata);

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

	$scope.teamRegister = function() {
		console.log("Team Register method");
		$location.path('/teamRegister/1');
	};

	$scope.login = function(user) {
		console.log(user);
		$localStorage.loggedIn = false;
		$http.post('project/login', user).then(function(userdata) {
			console.log(userdata.data);

			console.log("Hello User");
			$location.path("/register");

		}, function error(userdata) {
			console.log(userdata);

			console.log("Login failed");

		});
		authenticate.checkLogin();
	};
	$scope.logout = function(user) {
		console.log(user);
		$localStorage.loggedIn = false;
		$http.post('project/logout', user).then(function(userdata) {
			console.log(userdata.data);

			console.log("User logged out");
			$location.path("/register");

		}, function error(userdata) {
			console.log(userdata);

			console.log("User logged out failed");

		});
		authenticate.checkLogin();
	};

	$scope.addEvent = function(event) {

		$http.post('project/addEvent', event).then(function(userdata) {
			console.log(userdata.data);
			bootbox.alert("registered");
		}, function error(userdata) {
			console.log(userdata);

		});
	};

});