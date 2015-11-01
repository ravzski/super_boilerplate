(function() {
  angular.module('client').controller('LoginCtrl', function($scope) {
    return $scope.content = {
      heading: 'App Home',
      tagline: 'Here is the home screen'
    };
  });

}).call(this);
