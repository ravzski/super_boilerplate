angular.module('client').factory 'Like',
  ['$resource',
  ($resource) ->

    Like = $resource "/api/likes/:id", {id: "@id"},
      {
        update:
          method: 'PATCH'
      }

    Like
  ]
