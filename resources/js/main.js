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

  $(document).on('click', '.navburger', function() {
    var status = $(".theNavibar").attr("data-status");
    if(status == "on"){
      $(".theNavibar").attr("data-status", "off");
    }else{
      $(".theNavibar").attr("data-status", "on");
    }
    return false;
  });
  $(document).on('click', '.g1', function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec1").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });

  $(document).on('click', '.g3', function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec3").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });

  $(document).on('click', '.g2', function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec2").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });
  $(document).on('click', '.g7', function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec7").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });
  $(document).on('click', '.g8', function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec8").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });
  $(document).on('click', ".g9, .gosize", function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec9").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });
  $(document).on('click', '.g10', function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec10").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });
  $(document).on('click', '.g6', function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec6").offset().top - naviH
    }, 100,"easeOutQuart");
    $(".theNavibar").attr("data-status", "off");
    return false;
  });
  $(document).on('click', '.float_banner', function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec8").offset().top - naviH
    }, 100,"easeOutQuart");
    return false;
  });
  $(document).on('click', '.gotosec9_1', function() {
    $("body, html").stop(true,false).animate({
      scrollTop: $(".sec9").offset().top - naviH
    }, 100,"easeOutQuart");
    return false;
  });

  $("#receipt").on("change", function() {
    if(this.value == "1"){
      $(".receipt_corpName").css("display","block");
      $(".receipt_taxID").css("display","block");
    }else{
      $(".receipt_corpName").css("display","none");
      $(".receipt_taxID").css("display","none");
    }
    // alert( this.value );
  }).trigger('change');

  $("#reuse_self_delivery").on("change", function() {
    if(this.value == "0"){
      $(".note1").css("display","block");
      $(".note2").css("display","none");
    }else{
      $(".note1").css("display","none");
      $(".note2").css("display","block");
    }
    // alert( this.value );
  }).trigger('change');

  $("#reuse_self").on("change", function() {
    if(this.value == "0"){
      $(".prepared_yes_note").css("display","block");
      $(".prepared_yes").css("display","block");
      $(".prepared_no").css("display","none");

    }else{
      $(".prepared_yes_note").css("display","none");
      $(".prepared_yes").css("display","none");
      $(".prepared_no").css("display","block");
    }
    // alert( this.value );
  }).trigger('change');


//   $(".addmore").on('click', '', function(){
//     $(".sinbody>.sin:last-child").after('<div class="sin"><div><label class="_640"><small>品項</small></label><div class="i_name R_name">寵物帽T NT$790</div></div><div><label class="_640"><small>尺寸</small></label><select><option selected value="XS">XS</option><option value="S">S</option><option value="M">M</option><option value="L">L</option><option value="XL">XL</option><option value="2XL">2XL</option><option value="3XL">3XL</option><option value="4XL">4XL</option><option value="5XL">5XL</option></select></div><div><label class="_640"><small>數量</small></label><input type="number" min="0" value="0"></div><div><label class="_640"><small>金額</small></label><div class="i_price">NT$<span>790</span></div></div></div>');
//   });


//   $('.havetoChecked').on('click', '', function(){
//     if($(this).prop("checked") == true){
//       // console.log("Checkbox is checked.");
//       $('.action button').attr("disabled", false);
//     }
//     else if($(this).prop("checked") == false){
//       // console.log("Checkbox is unchecked.");
//       $('.action button').attr("disabled",true);
//     }
//   });

});
