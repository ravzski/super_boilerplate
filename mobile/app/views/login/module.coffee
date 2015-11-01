angular.module('client')
  .controller 'LoginCtrl', ($scope)->
    $scope.content =
      heading: 'App Home'
      tagline: 'Here is the home screen'
