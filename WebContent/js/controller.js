app
		.controller(
				'myCtrl',
				function(accessFac, $scope, $http, $sessionStorage, $location,
						$cookies) {

					/*
					 * $sessionStorage.userId = "chayan";
					 * $sessionStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 =
					 * "role"; console.log("$sessionStorage.userId",
					 * $sessionStorage.userId); console .log(
					 * "$sessionStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1",
					 * $sessionStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1);
					 */
					$scope.sessionActive = accessFac.checkIfAdmin();
					$scope.$watch(function() {
						return $sessionStorage.userId;
					}, function(newVal, oldVal) {
						if (oldVal !== newVal && newVal === undefined) {
							console.log('It is undefined');
						}
						console.log('chnged');
						console.log($sessionStorage.userId);
						$scope.sessionActive = accessFac.checkIfUser();
						$scope.userId = $sessionStorage.userId;
						console.log("$scope.sessionActive",
								$scope.sessionActive)
					});
					$scope.$watch(function() {
						return $sessionStorage.userName;
					},
							function(newVal, oldVal) {
								if (oldVal !== newVal && newVal === undefined) {
									console.log('It is undefined');
								}

								$scope.userName = 'Welcome '
										+ $sessionStorage.userName;

							})

					// $sessionStorage.userId = "chayan123";

					// console.log("sessionActive", sessionActive);

					$scope.getAllSports = function() {
						console.log("view method");
						$http.get('project/getAllSports').then(
								function(response) {
									console.log(response.data);
									$scope.employee = response.data;

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
					$scope.events = function() {
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
					$scope.advTeams = function() {
						console.log("Team Register method");
						$location.path('/advTeams');
					};
					$scope.updateScore = function() {
						console.log("Update score method");
						$location.path('/updateScore');
					};

					$scope.login = function(user) {
						console.log(user);
						$scope.logout();
						$http
								.post('project/login', user)
								.then(
										function(response) {

											// debugger;
											console.log(response.data);
											if (response.data.userId == null) {
												bootbox
														.alert("Incorrect credentails.");
											} else {
												console.log("Hello User");
												/*
												 * $cookies.put("userId",
												 * response.data.userId);
												 * 
												 * $cookies.put(
												 * "_f7c2e09ca07304e85f9563435e6ca31534ee2ca1",
												 * response.data.userPassword);
												 */
												$sessionStorage.userId = response.data.userId;
												$sessionStorage.userName = response.data.userName;
												$sessionStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 = response.data.userPassword;

												$location.path("/home");
											}

										}, function error(response) {
											console.log(response);

											console.log("Login failed");

										});
						console.log("login");

					};
					$scope.logout = function(user) {
						console.log(user);
						$http
								.post('project/logout', user)
								.then(
										function(response) {
											console.log(response.data);
											$sessionStorage.userId = "";
											$sessionStorage.userName = "";
											$sessionStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 = "";
											// $sessionStorage.clear();
											$location.path("/login");
											//$window.localStorage.clear();

										},
										function error(response) {
											console.log(response);

											console
													.log("User logged out failed");

										});
						console.log("logout");

					};

					$scope.changePass = function(change) {
						debugger;
						console.log(change);
						change.userId = $sessionStorage.userId;
						$http
								.post('project/changePass', change)
								.then(
										function(changed) {

											console.log(changed);
											$scope.checkStatus = false;
											if (changed.data == 0) {
												bootbox
														.alert("Current Password is wrong!");

											}

											else {
												bootbox
														.alert("Password Changed Successfully.");

											}

										},
										function error() {
											// console.log(response);
											bootbox
													.alert("Error occured while changing password!");

										});

					};

				});