module = angular.module("GrocerySummary", [])


module.directive 'grocerySummary',
['$window',
($window) ->
  replace: true
  templateUrl: 'modules/grocery_summary/template.html'
  restrict: 'E'
  link: (scope, element, attrs) ->
    stickyClass = "sticky"
    angular.element($window).bind 'scroll', (e) ->
      if $window.pageYOffset >= element.prop('offsetTop')
        element.addClass stickyClass
      else
        element.removeClass stickyClass


]
