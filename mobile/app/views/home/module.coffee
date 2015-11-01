angular.module('client')
  .controller 'HomeCtrl', ($scope)->
    $scope.content =
      heading: 'App Home'
      tagline: 'Here is the home screen'
