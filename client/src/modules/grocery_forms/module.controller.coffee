angular.module('GroceryForms').controller 'ItemModalCtrl',
['$scope','$rootScope','GroceryItem'
($scope,$rootScope,GroceryItem) ->

  $scope.disableAction = false
  $scope.form = null
  $scope.temp =
    product: id: null

  $scope.currentProducts = []
  for obj in $scope.products
    $scope.currentProducts.push(obj) if obj.product_category_id ==  $scope.category.product_category_id

  $scope.temp.product.price = $scope.groceryItem.price if !!$scope.groceryItem

  $scope.toggleModal = ->
    $scope.form.$submitted = false
    $scope.category.modal = false
    $scope.temp.product = null

  $scope.submit = ->
    $scope.form.$submitted = true
    if $scope.form.$valid && (!!$scope.temp.product || !!$scope.groceryItem.id)
      $scope.disableAction = true
      evalAction()
    else
      $rootScope.growl.error(MESSAGES.FORM_ERROR)

  evalAction = ->
    if !!$scope.groceryItem.id
      update()
    else
      create()

  create =->
    obj =
      product_id: $scope.temp.product.id
      product_name: $scope.temp.product.name
      price: $scope.temp.product.price
      total: $scope.temp.product.price*$scope.groceryItem.quantity
      quantity: $scope.groceryItem.quantity
      product_status: $scope.temp.product.status
      is_liked_by_current_user: $scope.temp.product.is_liked_by_current_user
      total_likes: $scope.temp.product.total_likes

    GroceryItem.save(grocery_id: $scope.grocery.id, grocery_item: obj).$promise
      .then (data) ->
        obj.id = data.id
        $scope.category.grocery_items.unshift obj
        $scope.category.total_price += obj.price*obj.quantity
        $scope.grocery.overall_total += obj.price*obj.quantity
        $rootScope.growl.success(MESSAGES.CREATE_SUCCESS)
        $scope.form.$submitted = false
        $scope.temp.product = null
        $scope.groceryItem.quantity = 0
      .finally ->
        $scope.disableAction = false

  update =->
    obj =
      quantity: $scope.groceryItem.quantity
    GroceryItem.update({grocery_id: $scope.grocery.id, id: $scope.groceryItem.id, grocery_item: obj}).$promise
      .then (data) ->
        updateCollection()
        $rootScope.growl.success(MESSAGES.UPDATE_SUCCESS)
        $scope.toggleModal()
      .finally ->
        $scope.disableAction = false

  updateCollection = ->
    # updates categories total
    total = 0
    for obj in $scope.category.grocery_items
      obj.quantity  = $scope.groceryItem.quantity if obj.id == $scope.groceryItem.id
      total += obj.quantity*obj.price
    $scope.category.total_price = total

    # updates overall total
    total = 0
    for obj in $scope.grocery.items
      total += obj.total_price
    $scope.grocery.overall_total = total

]
