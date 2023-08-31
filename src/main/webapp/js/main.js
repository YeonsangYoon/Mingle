(function ($) {
    const header = document.querySelector('.header');
    const scrollThreshold = 130; // 일정 스크롤 양 (예: 200px)

    window.addEventListener('scroll', () => {
        if (window.scrollY > scrollThreshold) {
            header.style.position = 'fixed'; // 헤더를 fixed로 변경
            header.style.top = '0';
        } else {
            header.style.position = 'relative'; // 헤더를 원래 상태로 복원
            header.style.top = 'auto';
        }
    });

    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    $('.search-close-switch').on('click', function () {
        $('.search-model').fadeOut(400, function () {
            $('#search-input').val('');
        });
    });

    /*-----------------------
        Hero Slider
    ------------------------*/
    $(".hero__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        navText: ["<span class='arrow_left'><span/>", "<span class='arrow_right'><span/>"],
		lazyLoad : true,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        autoHeight: false,
        autoplay: true,
        autoplayTimeout : 5000,
        autoplayHoverPause : true,
        autoplaySpeed:2000,
        navSpeed:2000
    });
})(jQuery);