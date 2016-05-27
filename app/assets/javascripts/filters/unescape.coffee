app.filter 'unescape', ['$sce', ($sce) ->
    (text) -> $sce.trustAsHtml(text);
]
