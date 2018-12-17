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
//= require dropzone
//= require jquery.easy-autocomplete
//= require_tree .
//= require toastr
//= require trix
//= require selectize
//= require tabler/tabler
//= require tabler/vendors/bootstrap.bundle.min
//= require tabler/vendors/circle-progress.min
//= require tabler/vendors/jquery.sparkline.min
//= require tabler/core
//= require jquery.slick
toastr.options = {
  "closeButton": true,
  "progressBar": true,
  "positionClass": "toast-bottom-right",
  "showDuration": "10000",
  "timeOut": "10000"
};