angular.module('client').run [
  '$rootScope','$location','$state','$window','$http','Session','User', ($rootScope,$location,$state,$window,$http,Session,User) ->

    # authenticator flag serves as
    # a flagger if on state change, the token is still valid
    $rootScope.authenticatorFlag = true
    $rootScope.polling = false


    $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      # this will happen if there is already a cookie
      # and if the user just refreshes the page
      # thus clearing the rootScope.currentUser
      authToken = localStorage.getItem('AuthToken')
      userId = localStorage.getItem('UserId')

      if $rootScope.authenticatorFlag
        event.preventDefault()
        $rootScope.authenticatorFlag = false
        $http.defaults.headers.common.AuthToken = authToken
        $http.defaults.headers.common.UserId = userId

        if !!authToken
          Session.getCurrentUser().$promise
            .then (data) ->
              $rootScope.currentUser = new User(data)
              evalState toState,toParams
            .catch (err) ->
              unless err.message == "transition prevented"
                $rootScope.authenticatorFlag = true
                localStorage.removeItem('AuthToken')
                localStorage.removeItem('UserId')
                localStorage.removeItem('SearchApiLink')
                $state.go("login")
        else
          evalState toState,toParams

    # resets the authenticator flag
    # so that it will go authentication on every state change (if state is authenticable)
    $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
      $rootScope.authenticatorFlag = true
      NProgress.start()

    # Refactor?
    # this works perfectly though
    evalState =(toState,toParams)->
      if !!toState.data.authenticated && !!$rootScope.currentUser
        $state.go(toState.name, toParams)
      else if !!toState.data.unauthenticated && !!$rootScope.currentUser
        $state.go(ROOT_PATH)
      else if !!toState.data.unauthenticated && !$rootScope.currentUser
        $state.go(toState.name, toParams)
      else
        $state.go("login")


]
