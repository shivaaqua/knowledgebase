// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){
  if($("#vdeo").size() > 0) {
    jwplayer("video-panel").setup({
      flashplayer: "/player.swf",
      file: $("#vdeo").val(),
      controlbar: 'over',
      dock: 'true',
      height: 370,
      width: 580
    });
  }
})

$(function (e) {
  var url = document.location.toString();
  if (url.match('#')) {
      $('.nav-tabs a[href=#'+url.split('#')[1]+']').tab('show') ;
  } 

  // Change hash for page-reload
  $('.nav-tabs a').on('shown', function (e) {
    window.location.hash = e.target.hash;
  })
});

$(function(e) {
  new nicEditor().panelInstance('snippet_snippet_detail_attributes_detail');
});
