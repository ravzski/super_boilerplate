Ctrl = ($scope,$rootScope,Grocery,GroceryItem,Product,Like,$filter)->


  $scope.uiState =
    modal: false

  $scope.temp =
    grocery_item: null

  $scope.months = MONTHS
  $scope.divisions = DIVISIONS
  $scope.query =
  	year: moment().format("YYYY")
  	month:  $scope.months[parseInt(moment().format("M"))-1]
  $scope.query.divisions = if moment().format("DD") > 15 then DIVISIONS[1] else DIVISIONS[0]

  $scope.grocery = null
  $scope.products = []
  $scope.csvHeaders = ['Category', 'Product', 'Stock Level', 'Quantity', 'Price', 'Total']
  $scope.csvFileName = null

  init = ->
    Product.query().$promise
      .then (data) ->
        $scope.products = data

    $scope.getCollection()

  $scope.getCollection = ->
    Grocery.getList(month: $scope.query.month.key, year: $scope.query.year, half: $scope.query.divisions.key).$promise
      .then (data) ->
        $scope.grocery = data
      .finally ->
        NProgress.done()

  $scope.getLikeIcon =(item)->
    icon = ""
    if item.is_liked_by_current_user
      icon = "icon-heart"
    else
      icon = "icon-heart-empty"

    return icon

  $scope.updateLikeIcon =(item) ->
    obj = $filter('filter')($scope.products, name: item.product_name)[0]
    if item.is_liked_by_current_user
      Like.remove(id: 0, product_id: item.product_id).$promise
    else
      Like.save(product_id: item.product_id).$promise

    item.is_liked_by_current_user = !item.is_liked_by_current_user
    obj.is_liked_by_current_user = item.is_liked_by_current_user

  $scope.toggleModal =(obj,item) ->
    $scope.temp.grocery_item = angular.copy item
    obj.modal = !obj.modal

  $scope.delete =(obj,index) ->
    swal DELETE_WARNING, ->
      GroceryItem.remove({id: obj.id,grocery_id: $scope.grocery.id}).$promise
        .then (data) ->
          $rootScope.growl.success(MESSAGES.DELETE_SUCCESS)
          $scope.grocery.items[index].grocery_items.splice($scope.grocery.items[index].grocery_items.indexOf(obj),1)
          $scope.grocery.items[index].total_price -= obj.quantity*obj.price
          $scope.grocery.overall_total -= obj.price*obj.quantity
  $scope.search = ->
    NProgress.start()

  $scope.getGroceryArray = ->
    groceryArray = []

    for gi in $scope.grocery.items
      groceryArray.push [gi.product_category_name]

      for item in gi.grocery_items
        groceryArray.push ['', item.product_name, item.product_status, item.quantity, item.price, item.total]

    $scope.csvFileName = $scope.query.month.value + " " + $scope.query.year + " " + $scope.query.divisions.value + ".csv"

    groceryArray

  init()


Ctrl.$inject = ['$scope','$rootScope','Grocery','GroceryItem','Product','Like','$filter']
angular.module('client').controller('GroceriesCtrl', Ctrl)
