$(function(){
$(".like").click(function() {
    if ($(this).find(".heart").hasClass("heart--active")) {
       var heart = $('<div class="heart-animated"><span class="heart-left"></span><span class="heart-right"></span></div>').addClass("unliked");
      $(this).find(".like-count").text(parseInt($(this).find(".like-count").text()) - 1);
        $(this).addClass("active");
    } else {
       var heart = $('<div class="heart-animated"><span class="heart-left"></span><span class="heart-right"></span></div>').removeClass("unliked");
        $(this).removeClass("active");
     $(this).find(".like-count").text(parseInt($(this).find(".like-count").text()) + 1);
    }
    $(this).find(".heart").toggleClass("heart--active").append(heart);
    setTimeout(function() {
        heart.fadeOut(100, function() {
            heart.remove()
        })
    }, 300);

});
FastClick.attach(document.body);
});