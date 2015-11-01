angular.module('client')
  .controller 'LoginCtrl', ($scope, Session, User)->

    $scope.credentials =
      email: ""
      password: ""

    $scope.login = ->
      Session.login(credentials: $scope.credentials).$promise
        .then (data) ->
          debugger
        .finally ->
          debugger
