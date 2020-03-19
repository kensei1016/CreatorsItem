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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require bootstrap-tagsinput.min
//= require_tree .

$(document).on('turbolinks:load', function() {
  $(function() {
    $('.header__user-icon').click(function() {
      $('.header__account-menu').toggle();
    })
  });
});

//アカウントメニューが開いているとき他の場所をクリックすると、
//メニューを閉じる
$(document).on('click', function(event) {
  if(!$(event.target).closest('.header__user-profile-group').length) {
    $('.header__account-menu').hide();
  }
});