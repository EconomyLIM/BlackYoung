/**
 * swiper API 사용
 * store
 */
 
 function startSwiper() {
  var swiper = new Swiper('.swiper-container', {
    pagination : {
    	el : '.swiper-pagination'
    }
    , navigation : {
    	nextEl : '.swiper-button-next'
    	, prevEl : '.swiper-button-prev'
    }
    , scrollbar : {
    	el : '.swiper-scrollbar'
    }
  });
 
 }
 