(function() {
  angular.module('client', ['ionic', 'ngSanitize', 'ui.router', 'ngResource']);

  angular.module('client').config(function($stateProvider, $urlRouterProvider, $locationProvider) {
    $stateProvider.state('login', {
      url: '/login',
      controller: 'LoginCtrl',
      templateUrl: 'views/login/template.html'
    });
    $stateProvider.state('register', {
      url: '/register',
      controller: 'RegisterCtrl',
      templateUrl: 'views/register/template.html'
    });
    return $urlRouterProvider.otherwise('/login');
  }).run(function($ionicPlatform) {
    return $ionicPlatform.ready(function() {
      var ref, ref1;
      if ((ref = window.cordova) != null ? (ref1 = ref.plugins) != null ? ref1.Keyboard : void 0 : void 0) {
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      }
      if (window.StatusBar) {
        return StatusBar.styleDefault();
      }
    });
  });

}).call(this);
