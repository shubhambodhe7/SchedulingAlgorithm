app
		.controller(
				'myCtrl',
				function(accessFac, $scope, $http, $localStorage, $location,
						$cookies) {

					/*
					 * $localStorage.userId = "chayan";
					 * $localStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 =
					 * "role"; console.log("$localStorage.userId",
					 * $localStorage.userId); console .log(
					 * "$localStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1",
					 * $localStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1);
					 */
					$scope.sessionActive = accessFac.checkIfAdmin();
					$scope.$watch(function() {
						return $localStorage.userId;
					}, function(newVal, oldVal) {
						if (oldVal !== newVal && newVal === undefined) {
							console.log('It is undefined');
						}
						console.log('chnged');
						console.log($localStorage.userId);
						$scope.sessionActive = accessFac.checkIfAdmin();
						console.log("$scope.sessionActive",
								$scope.sessionActive)
					})

					// $localStorage.userId = "chayan123";

					// console.log("sessionActive", sessionActive);

					var expireDate = new Date();
					expireDate.setDate(expireDate.getMinutes() + 30);
					$cookies.put('userId',
							'_f7c2e09ca07304e85f9563435e6ca31534ee2ca1', {
								'expires' : expireDate
							});

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
												$localStorage.userId = response.data.userId;
												$localStorage.userName = response.data.userName;
												$localStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 = response.data.userPassword;

												$location.path("/register");
											}

										}, function error(response) {
											console.log(response);

											console.log("Login failed");

										});
						console.log("login");

					};
					$scope.logout = function(user) {
						console.log(user);
						$localStorage.loggedIn = false;
						$http
								.post('project/logout', user)
								.then(
										function(response) {
											console.log(response.data);

											/*
											 * console.log("User logged out");
											 * $cookies.remove("userId");
											 * $cookies
											 * .remove("_f7c2e09ca07304e85f9563435e6ca31534ee2ca1");
											 */
											$localStorage.userId = "";
											$localStorage._f7c2e09ca07304e85f9563435e6ca31534ee2ca1 = "";

											$location.path("/login");

										},
										function error(response) {
											console.log(response);

											console
													.log("User logged out failed");

										});
						console.log("logout");

					};

					$scope.changePass = function(change) {

						console.log(change);
						$http
								.post('project/changePass', change)
								.success(
										function(changed) {

											console.log(changed);
											$scope.checkStatus = false;
											if (changed == 0) {
												bootbox
														.alert("Old Password is wrong");

											}

											else {
												bootbox
														.alert("Password Changed Successfully.");

											}

										}).error(function() {
									console.log(updated);
									bootbox.alert("Error in update");

								});

					};

				});