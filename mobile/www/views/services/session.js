(function() {
  var module;

  module = function($resource) {
    var Session;
    Session = $resource(BASE + "/api/session", null, {
      login: {
        method: 'POST'
      },
      getCurrentUser: {
        method: 'GET',
        isArray: false
      },
      logout: {
        method: 'DELETE'
      }
    });
    return Session;
  };

  module.$inject = ['$resource'];

  angular.module('client').factory('Session', module);

}).call(this);
