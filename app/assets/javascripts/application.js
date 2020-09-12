// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//ヘッダーの高さ分だけコンテンツを下げる
    $(document).on ("turbolinks:load", function(){
    var height=$("header").height();
    $("body").css("margin-top", height + 10);//10pxだけ余裕をもたせる
    /*e.preventDefault();*/
    function scrollChk(){
        var scroll = $(window).scrollTop();
        var windowHeight = $(window).height();
      
          jQuery('.scroll-animation').not('.active').each(function(){
              var pos = $(this).offset().top;
      
              if (scroll > pos - windowHeight){
                  $(this).addClass("active");
              }
          });
      }
      $(window).scroll(function (){
          scrollChk();
      });
      $('body').on('touchmove', function() {
          scrollChk();
      });
});

//「閉じる」を押したらアラートボックスを閉じる
$(document).on('click', '.button_close',function(){
    $(".alert-box").hide();
});
