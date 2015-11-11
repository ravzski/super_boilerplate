angular.module('client')
  .controller 'StartCtrl', ($scope)->

    $scope.reset = ->
      $scope.questions = [
        {
          id: 1
          content: "I have a good balance between work and relaxation"
          answer: null
        },
        {
          id: 2
          content: "My social network provides me with opportunities to participate in joyful activities?"
          answer: null
        }
      ]

      $scope.currentQuestion = 1
      $scope.showWarning = false
      $scope.currentHeading = "Question 1 of 2"

    $scope.setAnswer =(obj,answer)->
      obj.answer = answer

    $scope.next =(obj)->
      if !!obj.answer
        $scope.currentQuestion = 2
        $scope.showWarning = false
        $scope.currentHeading = "Question 2 of 2"
      else
        $scope.showWarning = true

    $scope.back =(obj)->
      $scope.currentQuestion = 1
      $scope.showWarning = false
      $scope.currentHeading = "Question 1 of 2"
