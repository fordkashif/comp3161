app.controller("LoginController", function($scope, $http, $state){
    
    //Variables
    $scope.signUpInfo = {
        firstname: undefined,
        lastname: undefined,
        username: undefined,
        password: undefined,
        address: undefined,
        email: undefined
    }
    
    $scope.loginInfo = {
        email: undefined,
        password: undefined
    }
    
    var result = {
        test: undefined
    }
    
    result.test = {
        test: "test",
        test2: "test2",
        test3: "testers"
    }
    
    result.test = JSON.stringify(result.test);
    
    //Functions
    
    $scope.signUserUp = function (){
        var data = {
            firstname: $scope.signUpInfo.firstname,
            lastname: $scope.signUpInfo.lastnam,
            username: $scope.signUpInfo.username,
            password: $scope.signUpInfo.password,
            address: $scope.signUpInfo.address,
            email: $scope.signUpInfo.email
        }
        
        $http.post("endpoints/signup.php", data).success(function(response){
            console.log(response);
            localStorage.setItem("token", JSON.stringify(response));
            $state.go("application");
        }).error(function(error){
            console.error(error);
        });
    };
    
    $scope.loginUser = function () {
         var data = {
            username: $scope.loginInfo.username,
            password: $scope.loginInfo.password
        }
        
        $http.post("endpoints/login.php", data).success(function(response){
            console.log(response);
            localStorage.setItem("token", JSON.stringify(response));
            $state.go("application", result);
        }).error(function(error){
            console.error(error);
        });
    
    }
    
    //Init

})