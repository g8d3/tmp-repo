app.directive 'repeatDone', ->
  (scope, element, attrs) ->
    if (scope.$last) # all are rendered
      scope.$eval(attrs.repeatDone);
