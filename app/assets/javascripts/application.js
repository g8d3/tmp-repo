// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require twitter_widgets
//= require js/materialize.min
//= require_tree .


twttr.ready(function (twttr) {

  twttr.events.bind('rendered',function (event) {

    var $el = $(event.target);
    $el.css({ display: 'inline-block' });

  });
});

$(function () {

    $('a').click(function (e) {
      e.preventDefault();
      var href = $(e.target).attr('href');
      var offset = $('nav').height() - 2;

      $("html, body").animate({ scrollTop: $(href).offset().top - offset }, 500);
    });

});
