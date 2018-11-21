$(function () {
    setTimeout(playSlideShow, 2500);

    function playSlideShow() {

        var currImgContainer = $('.showImg');
        if (!$(currImgContainer).hasClass('lastImg')) {
            $('.showImg').removeClass('showImg').next().addClass('showImg');
            setTimeout(playSlideShow, 2500);
        }
    }
});