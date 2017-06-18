app.controller('UserController', function($scope,$http,$location) {

$scope.createUser=function(){
    
	 var newPassword = document.getElementById('password').value;
	    var minNumberofChars = 8;
	    var maxNumberofChars = 16;
	    var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
	    alert(newPassword); 
	    if(newPassword.length < minNumberofChars || newPassword.length > maxNumberofChars){
	        alert('small password')
	    }
	    if(!regularExpression.test(newPassword)) {
	        alert("password should contain atleast one number and one special character");
	        
	    }
	
	
 $scope.role="ROLE_USER";
 $scope.enable=1;


if($scope.name!==null||$scope.password!==null||$scope.username!==null){
	alert('Welcome to MyChatfvf');
      $http.get('http://localhost:8588/chat/user/'+$scope.username+'/'+$scope.name+'/'+$scope.password).success(function(data, status, headers, config) {

alert('Welcome to MyChat');
    $location.path('/login');          

    }).error(function(data, status, headers, config) {
        if(status===409)
        alert('User already available');
        
    });
    }
    else{
        alert('Feilds Can\'t be blank');
    }
};
});
