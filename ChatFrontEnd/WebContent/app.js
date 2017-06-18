var app = angular.module('chatApp', [ 'ngRoute', 'ngResource' ]);

app.config(function($routeProvider) {

	$routeProvider.when('/login', {
		templateUrl : 'lib/views/login.html',
		controller : 'LoginController',

	}).when('/signup', {
		templateUrl : 'lib/views/signup.html',
		controller : 'UserController',
	})

	.when('/logout', {
		template : '', 
		controller : 'LogoutController'
	})

	.when('/home', {
		templateUrl : 'lib/views/home.html',
		controller : 'UserController',

	});
});
