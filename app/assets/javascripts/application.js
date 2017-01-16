// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets
//= require chosen-jquery
//= require ckeditor/init
//= require i18n
//= require i18n.js
//= require i18n/translations

$(document).on('turbolinks:load', function() {
  $(function(){
    $('.button-collapse').sideNav();
    $('.parallax').parallax();
  });

  Materialize.updateTextFields();

  $('.modal').modal();

  $('.admin-tour-form').on('click', '.btn-add-field', function (e) {
    e.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data("id"), "g");
    $(this).before($(this).data("fields").replace(regexp, time));
    $('.datepicker').pickadate({
      format: I18n.t('datepicker.format')
    });
    $('select').material_select();
  }).on('click', '.btn-remove-field', function () {
    var count = $(this).parent().parent().
      siblings('.nested-tour-item:visible').length + 1;
    if (count <= 1) {
      alert(I18n.t('js.alert.remove_tour_item'));
    } else {
      $(this).prev('input[type=hidden]').val('1');
      $(this).parent().parent().hide();
    }
  });

  $('.datepicker').pickadate({
    format: I18n.t('datepicker.format')
  });

  $('select').material_select();
});
