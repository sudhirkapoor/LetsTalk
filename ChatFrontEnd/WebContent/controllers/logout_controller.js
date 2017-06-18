app.controller('LogoutController', function($scope, $http, $location,
		$rootScope) {
	$rootScope.isUserLoggedIn = false;
	$scope.logoutUser = function() {
		$rootScope.isUserLoggedIn = false;
		Session.clear();
		
	    $location.path('/login');
	}
})
