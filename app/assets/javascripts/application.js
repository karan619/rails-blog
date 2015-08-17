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
//= require jquery.turbolinks
//= require materialize-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  init_navbar();
  init_loader();
  // handle_links();
  $('nav li a').on('click',   function() {
      $("body").after('<h1 class="progress"><div class="indeterminate" ></div></h1>'); });
  window.onbeforeunload = premove;
});

function init_loader(){
    $(document).on('page:fetch',   function() {
      $("body").after('<h1 class="progress"><div class="indeterminate" ></div></h1>'); });
    $(document).on('page:load',  function() {$(".progress").remove(); });
}

function handle_links(){
  $('a').attr('target', "_blank");
  $('nav li a').attr('target', "");
}

function init_navbar () {
  $(".button-collapse").sideNav();
}

function premove(){
  $(".progress").remove();
}


