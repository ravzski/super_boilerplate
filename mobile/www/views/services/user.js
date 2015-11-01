(function() {
  var module;

  module = function($resource) {
    var User;
    User = $resource(BASE + "/api/users/:id", {
      id: '@id'
    }, {
      index: {
        method: 'GET',
        isArray: false
      },
      getList: {
        method: 'GET',
        isArray: false
      },
      update: {
        method: 'PATCH'
      },
      search: {
        method: 'GET',
        isArray: true,
        url: "/api/users/search"
      }
    });
    User.prototype.fullName = function() {
      return this.first_name + " " + this.last_name;
    };
    return User;
  };

  module.$inject = ['$resource'];

  angular.module('client').factory('User', module);

}).call(this);
