app.controller('teamCtrl', function($scope, $http, $localStorage, $location) {

	var vm = this, getRandomInt = function(min, max) {
		return Math.floor(Math.random() * (max - min + 1) + min);
	};

	vm.options2 = [];
	for (var i = 0; i < 100; i++) {
		//console.log(i);
		vm.options2.push({
			key : i + 1,
			value : 'Prop' + (i + 1).toString()
		});
	}

});
