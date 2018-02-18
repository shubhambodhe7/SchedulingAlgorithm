app
		.controller(
				'DatepickerCtrl',
				function($scope, $http) {			
			
			$scope.currDate = new Date();
					
			$scope.holiday = { dt : null,
							occasion : "" };
	
		
		function resetHoliday() {
						$scope.holiday = { dt : null,
								occasion : "" };
					};

					$scope.deleteHoliday = function(del) {
						bootbox
								.confirm({
									title : "Are you sure you want to delete this day from public holidays?",
									message : "Day: " + del.date + "  Occasion: " + del.occasion,
									buttons : {
										cancel : {
											label: 'No',
								            className: 'btn-danger'
										},
										confirm : {
											label: 'Yes',
								            className: 'btn-success'
										}
									},
									callback : function(result) {
										console
												.log('This was logged in the callback: '
														+ result);
										if (result){
											$http
										.get('project/deletePublicHoliday/' + del.rowId)
										.then(
												function(response) {
													console.log(response.data);
													if (response.data > 0) {
														bootbox
																.alert("Public holiday deleted successfully.");
																getAllPublicHoliday();
																
																
													} else {
														bootbox
																.alert("Public holiday deletion failed!");
													}
													
												},
												function error(response) {
													console.log(response);

													bootbox
															.alert("Error in deleting holiday!");

												});
									};
									}
								});
								

						
					};

					$scope.addPublicHoliday = function(holiday) {
						console.log(holiday);

						if (holiday.dt == null){
							bootbox
							.alert("Please select date!");
						} else if (holiday.occasion === ""){
							bootbox
							.alert("Please enter occasion name!");
						} else {
						
						
						$http
								.get(
										'project/addPublicHoliday/'
												+ holiday.dt + '/'
												+ holiday.occasion)
								.then(
										function(response) {
											console.log(response.data);
											if (response.data > 0) {
												bootbox
														.alert("Public holiday added successfully");
														getAllPublicHoliday();
														resetHoliday();
											} else {
												bootbox
														.alert("Public holiday addition failed");
											}

										},
										function error(response) {
											console.log(response);

											bootbox
													.alert("Public holiday addition failed");

										});
						};
					};
					getAllPublicHoliday();
					function getAllPublicHoliday() {
						
						$http
								.get('project/getPublicHoliday')
								.then(
										function(response) {
											console.log(response.data);
											$scope.publicHolidays = response.data;
											
											for (var i = 0; i < $scope.publicHolidays.length; ++i) {
												
												viewDate = new Date($scope.publicHolidays[i].date);
												$scope.publicHolidays[i].date = viewDate.toDateString();
											}
											
											
										
										},
										function error(response) {
											console.log(response);

											bootbox
													.alert("Error in fetching holidays list!");

										});
					}
					;

			
				});