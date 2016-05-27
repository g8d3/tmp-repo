app
  .controller 'GridsCtrl', ['$scope', '$http', '$timeout',
    ($scope, $http, $timeout) ->

      $http.get('/tweets/ten_latest.json').then (response) ->
        $scope.data = response.data

      $scope.renderTwitter = ->
        $timeout((->twttr.widgets.load()), 0)
  ]
