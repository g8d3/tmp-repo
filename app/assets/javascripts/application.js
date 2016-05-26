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
//= require masonry.pkgd.min
//= require js/materialize.min
//= require_tree .


$.getScript('//platform.twitter.com/widgets.js', function(){
  twttr.ready(function (twttr) {

    twttr.events.bind('rendered',function (event) {

      var $el = $(event.target);
      $el.css({ display: 'inline-block' });

    });


    twttr.events.bind('loaded',function (event) {

      setGrid = function (colWidth,fitWidth) {
        $('.grid').masonry({
          // options
          itemSelector: '.twitter-tweet',
          fitWidth: fitWidth,
          columnWidth: colWidth
        });
      };


      setTimeout(function () {
        $('.twitter-tweet-error').hide()
        setGrid(510, true);
      }, 1500)

      $('.grid>*').fadeIn();

    });

  });
});
