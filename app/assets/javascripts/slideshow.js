$(function () {
    setTimeout(playSlideShow, 3000);

    function playSlideShow() {

        var currImgContainer = $('.showImg');
        if (!$(currImgContainer).hasClass('lastImg')) {
            $('.showImg').removeClass('showImg').next().addClass('showImg');
            setTimeout(playSlideShow, 3000);
        }
    }
});