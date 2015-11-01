angular.module(
  'client',
  [
    'ionic',
    'ngSanitize',
    'ui.router',
    'ngResource'
  ]
)


angular.module('client')
  .config ($stateProvider, $urlRouterProvider,$locationProvider)->
    # $locationProvider.html5Mode(true)

    #
    # $stateProvider.state 'home',
    #   url:         '/home'
    #   controller:  'HomeCtrl'
    #   templateUrl: 'views/home/template.html'

    $stateProvider.state 'login',
      url:         '/login'
      controller:  'LoginCtrl'
      templateUrl: 'views/login/template.html'

    $stateProvider.state 'register',
      url:         '/register'
      controller:  'RegisterCtrl'
      templateUrl: 'views/register/template.html'

    # TODO: create an error page that captures the details
    #       of the errors and submits them to us for debugging
    $urlRouterProvider.otherwise('/login')

  .run ($ionicPlatform)->

    $ionicPlatform.ready  ->
      if window.cordova?.plugins?.Keyboard
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)
      StatusBar.styleDefault() if window.StatusBar
