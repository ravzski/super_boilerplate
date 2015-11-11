(function() {
  angular.module('client', ['ionic', 'ngSanitize', 'ui.router', 'ngResource', 'ngIOS9UIWebViewPatch']);

  angular.module('client').config(function($stateProvider, $urlRouterProvider, $locationProvider) {
    $stateProvider.state('exams', {
      url: '/exams',
      controller: 'ExamsCtrl',
      templateUrl: 'views/exams/template.html'
    });
    $stateProvider.state('start', {
      cache: false,
      url: '/start',
      controller: 'StartCtrl',
      templateUrl: 'views/start/template.html'
    });
    $stateProvider.state('home', {
      url: '/home',
      controller: 'HomeCtrl',
      templateUrl: 'views/home/template.html'
    });
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
    $stateProvider.state('radar', {
      cache: false,
      url: '/radar',
      controller: 'GraphsCtrl',
      templateUrl: 'views/graphs/radar.html'
    });
    $stateProvider.state('core', {
      cache: false,
      url: '/core',
      controller: 'GraphsCtrl',
      templateUrl: 'views/graphs/core.html'
    });
    $stateProvider.state('environment', {
      cache: false,
      url: '/environment',
      controller: 'GraphsCtrl',
      templateUrl: 'views/graphs/environment.html'
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
