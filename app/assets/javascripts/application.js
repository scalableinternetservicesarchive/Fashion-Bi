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
//= require_tree 

//= require owl.carousel 
 
$(".owl-carousel").owlCarousel({

    autoPlay: 3000, //Set AutoPlay to 3 seconds

    items : 1,
    itemsDesktop : [1199,3],
    itemsDesktopSmall : [979,3],
    lazyLoad : true,
    scrollPerPage : true


});
