(function() {
  angular.module('client').controller('StartCtrl', function($scope) {
    $scope.reset = function() {
      $scope.questions = [
        {
          id: 1,
          content: "I have a good balance between work and relaxation",
          answer: null
        }, {
          id: 2,
          content: "My social network provides me with opportunities to participate in joyful activities?",
          answer: null
        }
      ];
      $scope.currentQuestion = 1;
      $scope.showWarning = false;
      return $scope.currentHeading = "Question 1 of 2";
    };
    $scope.setAnswer = function(obj, answer) {
      return obj.answer = answer;
    };
    $scope.next = function(obj) {
      if (!!obj.answer) {
        $scope.currentQuestion = 2;
        $scope.showWarning = false;
        return $scope.currentHeading = "Question 2 of 2";
      } else {
        return $scope.showWarning = true;
      }
    };
    return $scope.back = function(obj) {
      $scope.currentQuestion = 1;
      $scope.showWarning = false;
      return $scope.currentHeading = "Question 1 of 2";
    };
  });

}).call(this);
