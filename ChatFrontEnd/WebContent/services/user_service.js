app.factory('UserDetail', ['$resource', function ($resource) {
    //$resource() function returns an object of resource class
	$scope.isUserLoggedIn = false;
    return $resource(
            'http://localhost:8080/chat/user/:id', 
            {id: '@id'},
            {
                update: {
                      method: 'PUT' // To send the HTTP Put request when calling this custom update method.
                }
                 
            }
    );
}]);
