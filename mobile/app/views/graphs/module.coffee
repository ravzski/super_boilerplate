angular.module('client')
  .controller 'GraphsCtrl', ($scope)->

    $scope.currentChart = 1

    $scope.toggleCurrent=(current)->
      $scope.currentChart = current

    radarChartData =
      labels: [
        'Health'
        'Exercise'
        'Relationships'
        'Home Environment'
        'Play'
        'Money'
        'Work'
        'Life Purpose'
        'Spirituality'
        'Self Esteem'
      ]
      datasets: [
        {
          label: 'My First dataset'
          fillColor: 'rgba(220,220,220,0.2)'
          strokeColor: 'rgba(220,220,220,1)'
          pointColor: 'rgba(220,220,220,1)'
          pointStrokeColor: '#fff'
          pointHighlightFill: '#fff'
          pointHighlightStroke: 'rgba(220,220,220,1)'
          data: [
            65
            59
            90
            81
            56
            55
            40
          ]
        }
        {
          label: 'My Second dataset'
          fillColor: 'rgba(151,187,205,0.2)'
          strokeColor: 'rgba(151,187,205,1)'
          pointColor: 'rgba(151,187,205,1)'
          pointStrokeColor: '#fff'
          pointHighlightFill: '#fff'
          pointHighlightStroke: 'rgba(151,187,205,1)'
          data: [
            28
            48
            40
            19
            96
            27
            100
          ]
        }
      ]


    coreData =
      labels: [
        'Certainty'
        'Variety'
        'Connection'
        'Significance'
      ]
      datasets: [
        {
          label: 'My First dataset'
          fillColor: 'rgba(220,220,220,0.5)'
          strokeColor: 'rgba(220,220,220,0.8)'
          highlightFill: 'rgba(220,220,220,0.75)'
          highlightStroke: 'rgba(220,220,220,1)'
          data: [
            40
            50
            10
            40
          ]
        }
      ]

    envData =
      labels: [
        'Personal'
        'Social'
        'Work'
      ]
      datasets: [
        {
          label: 'My First dataset'
          fillColor: 'rgba(220,220,220,0.5)'
          strokeColor: 'rgba(220,220,220,0.8)'
          highlightFill: 'rgba(220,220,220,0.75)'
          highlightStroke: 'rgba(220,220,220,1)'
          data: [
            40
            50
            10
          ]
        }
      ]

    barOptions =
      barShowStroke : true
      barValueSpacing : 10
      scaleOverride: true
      scaleSteps: 10
      scaleStepWidth: 10
      scaleStartValue: 0

    myRadar = new Chart(document.getElementById('radar').getContext('2d')).Radar(radarChartData)
    bar = new Chart(document.getElementById('core').getContext('2d')).Bar(coreData,barOptions)
    bar = new Chart(document.getElementById('env').getContext('2d')).Bar(envData,barOptions)
