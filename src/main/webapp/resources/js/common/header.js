$(document).ready(function () {


    $('.gnb__depth1 > li').on('mouseenter', function(e){
        e.preventDefault();

        $(this).find('.gnb__area').stop().slideDown(400);
    });

    $('.gnb__depth1 > li').on('mouseleave', function(e){
        e.preventDefault();

        $(this).find('.gnb__area').stop().slideUp(400);
    });

    $(window).on('scroll', function(){
        const win_scroll = $(this).scrollTop();

        if(win_scroll > 0){
            $("#header_new").addClass('scroll-on');
        }else{
            $('#header_new').removeClass('scroll-on');
        }
    });

    // 후원하기 버튼 슬라이드
    $('.header__btn--support').on('mouseenter',function(){
        $(this).find('ul').stop().slideDown();
    });

    $('.header__btn--support').on('mouseleave', function(){
        $(this).find('ul').stop().slideUp();
    });

});