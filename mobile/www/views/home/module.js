(function() {
  angular.module('client').controller('HomeCtrl', function($scope) {
    return $scope.content = {
      heading: 'App Home',
      tagline: 'Here is the home screen'
    };
  });

}).call(this);
