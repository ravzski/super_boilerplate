(function() {
  angular.module('client').controller('LoginCtrl', function($scope, Session, User) {
    $scope.credentials = {
      email: "",
      password: ""
    };
    return $scope.login = function() {
      return Session.login({
        credentials: $scope.credentials
      }).$promise.then(function(data) {
        debugger;
      })["finally"](function() {
        debugger;
      });
    };
  });

}).call(this);
