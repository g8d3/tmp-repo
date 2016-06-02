app
  .controller 'TweetCtrl', ['$scope', '$http', '$document',
    ($scope, $http, $document) ->

      angular.element(document).ready -> $('.modal-trigger').leanModal()

      $scope.formData = {}

      $scope.tweet = ->
        $http.post('/tweets/tweet.json', @formData).then (response) ->
          console.log response.data

  ]
