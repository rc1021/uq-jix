var fullheight;
var WW = $(window).width();
var WH = $(window).height();
var naviH = 59.19

$(window).on('resize', function(){
  if(WW >= 960){
    naviH = 59.19
  }else{
    naviH = 0
  }
});

$(function() {

  $(".navburger").click(function() {
    $(".theNavibar").attr("data-status", "on");
    return false;
  });
  $(".g1").click(function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec1").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });

  $(".g2").click(function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec2").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });
  $(".g7").click(function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec7").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });
  $(".g8").click(function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec8").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });
  $(".g9").click(function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec9").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });
  $(".g10").click(function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec10").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });
  $(".float_banner").click(function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec8").offset().top - naviH
    }, 100,"easeOutQuart");
    return false;
  });
  $(".gotosec9_1").click(function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec9").offset().top - naviH
    }, 100,"easeOutQuart");
    return false;
  });

});