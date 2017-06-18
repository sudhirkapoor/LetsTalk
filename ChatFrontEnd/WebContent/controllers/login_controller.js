app.controller('LoginController', function($scope, $http, $location,$rootScope) {

	$scope.loginUser = function() {

//		alert($scope.username + '' + $scope.password);
		$http.post('http://localhost:8588/chat/login/'+$scope.username+'/'+$scope.password).success(function(data, status, headers, config) {

			alert('Welcome to MyChat');
			$rootScope.isUserLoggedIn = true;
			    $location.path('/home');          

			    }).error(function(data, status, headers, config, statusText) {

					if (statusText === 'NOT_FOUND')
						alert('User Not Found Try Again');
			        
			    });
			 
			   
			};
			});

		