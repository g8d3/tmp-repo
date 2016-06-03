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

# ******** Angular START *************
# Enable these

#= require angular
#= require inflection.min
#= require ngInflection
#= require_self
#= require_tree .

# These are not used yet

# require angular-route
# require lodash
# require restangular

# ******** Angular END *************


# ******** Ractive START *************
#= require ractive
#= require welcome
#= require string.min
# ******** Ractive END *************



window.shutdownMVC = (MVC) ->
  switch MVC
    when 'ractive' then Ractive = ->
    when 'angular'
      $ -> $('.card[ng-repeat]').remove()
      $('[ng-app]').removeAttr('ng-app')
      # angular.module = ->
      #   config: angular.module
      #   controller: angular.module
      #   directive: angular.module
      #   filter: angular.module

shutdownMVC 'angular'

window.app = angular.module('app', ['ngInflection'])
  .config([
    "$httpProvider", ($httpProvider) ->
      csrfToken = $('meta[name=csrf-token]').attr('content')

      $httpProvider.defaults.headers.common['X-CSRF-Token'] = csrfToken
  ])

$ ->

  $.get '/tweets/ten_latest.json', (data) ->

    Ractive.DEBUG = false
    window.ractive = new Ractive
      el: '#ractive'
      template: '#ractive-template'
      data:
        tweetsByCategory: data
        S: S

      onrender: -> twttr.widgets.load()

# angular.module('app', ['Restangular', 'app.controllers', 'app.models'])
