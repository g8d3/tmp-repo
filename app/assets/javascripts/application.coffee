# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require twitter_widgets
#= require js/materialize.min
#= require angular
#= require inflection.min
#= require ngInflection
# require angular-route
# require lodash
# require restangular
#= require_self
#= require_tree .


window.app = angular.module('app', ['ngInflection'])
  .config([
    "$httpProvider", ($httpProvider) ->
      csrfToken = $('meta[name=csrf-token]').attr('content')

      $httpProvider.defaults.headers.common['X-CSRF-Token'] = csrfToken
  ])

# angular.module('app', ['Restangular', 'app.controllers', 'app.models'])
