


$(function(){
    $(document).on("touchstart", function(e) {
        var $target = $(e.target);
        if(!$target.hasClass("disable")) $target.data("isMoved", 0);
    });
    $(document).on("touchmove", function(e) {
        var $target = $(e.target);
        if(!$target.hasClass("disable")) $target.data("isMoved", 1);
    });
    $(document).on("touchend", function(e) {
        var $target = $(e.target);
        if(!$target.hasClass("disable") && $target.data("isMoved") == 0) $target.trigger("tap");
    });

    $(window).scroll(function(){
        //$(window).scrollTop();
        if($(window).scrollTop()>$(window).height()){
            $('.pb-go-top').show()
        }else {
            $('.pb-go-top').hide()
        }
    });
    $('.pb-go-top').on('tap',function(){
        $(document).scrollTo('0')
    });

    $('.head-bar .btn-l').on('tap',function () {
        window.history.back();
    });
	 $('.head-bar .catalogList').on('tap',function () {
        $(this).siblings('.head-mr-menu').fadeToggle();
    });
    $('.head-bar .mask').on('tap',function () {
        $('.head-mr-menu').fadeOut();
    });


});
