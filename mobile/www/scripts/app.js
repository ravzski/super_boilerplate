(function() {
  angular.module('client', ['ionic']).config(function($stateProvider, $urlRouterProvider) {
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
    return $urlRouterProvider.otherwise('/home');
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
