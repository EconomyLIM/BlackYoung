/*document.getElementById("btnGnbOpen").onclick = function () {
		document.querySelector(".layer_all_menu").classList.toggle("active");
}
// 카테고리 닫기 버튼 클릭 이벤트
document.getElementById("btnGnbClose").onclick = function () {
    document.querySelector(".layer_all_menu.active").className = "layer_all_menu";
}*/

// 팝업창 가운데 조정
	function popupCenter(popup) {
		var scrolled = window.scrollY;
		var windowHeight = window.innerHeight;
		var elementHeight = $(popup).height();
		
		let height = (windowHeight-elementHeight) > 0 ? windowHeight-elementHeight : (windowHeight-elementHeight)*-1;
		let width = (window.innerWidth - $(popup).width())/2;
		
		$(popup).css({
			"top" : (scrolled + height/2) + 'px'
			, "left" : width + 'px'
			, "margin-left" : 0
			});
	}

// 페이지 로드되면 시작
$(function() {
	
	/* 메인 카테고리 목록 */
	$(".main_cate_wrap .main_cate_list > li").on("mouseover", function() {
		$(".main_cate_wrap").addClass("active");
		$(this).addClass("on");
		$()
	}).on("mouseleave", function() {
		$(".main_cate_wrap").removeClass("active");
		$(this).removeClass("on");
	})
	
// 카테고리 클릭 이벤트
$(document).on('click', function(e) {
    var gnbAllMenu = $('#gnbAllMenu');
    var btnGnbOpen = $('#btnGnbOpen');
    // 클릭된 요소가 #gnbAllMenu, 그 하위 요소, 또는 #btnGnbOpen 버튼인 경우 아무것도 하지 않음
    if (gnbAllMenu.is(e.target) || gnbAllMenu.has(e.target).length > 0 || btnGnbOpen.is(e.target)) {
        return;
    } else {
        // #gnbAllMenu 외의 다른 부분을 클릭하면 active 클래스를 제거
        gnbAllMenu.removeClass('active');
    }
});

$('#btnGnbOpen').on('click', function() {
    // #btnGnbOpen 버튼을 클릭할 때 active 클래스를 추가 또는 제거
    $('#gnbAllMenu').toggleClass('active');
});

// 카테고리 닫기 버튼 클릭 이벤트
document.getElementById("btnGnbClose").onclick = function () {
    document.querySelector(".layer_all_menu.active").className = "layer_all_menu";
}

// 최근 본 상품 마우스 호버(쿠키 처리)
$("li.recent>.mymenu_layer").click(function(){
            $("li.recent").addClass("open");
            
        })
// 최근 본 상품 마우스 리브
        $("li.recent").mouseleave(function(){
            $("li.recent").removeClass("open");
            
        })
// 관심매장 마우스 오버 이벤트
$("li.store>.mymenu_layer").mouseover(function(){
            $("li.store").addClass("open");
            
        })
// 관심매장 마우스 리브 이벤트
        $("li.store").mouseleave(function(){
            $("li.store").removeClass("open");
            
        })
//오늘드림 마우스 오버 이벤트 (로그인했을경우 작동하는지는 모르겠음)
		$("#todayDeliveryContainer>.mymenu_layer ").mouseover(function(){
            $("li#todayDeliveryContainer").addClass("open");
			$(".delivery_box_wrap").css("display","block");
        })
//오늘드림 마우스 리브 이벤트
		$("#todayDeliveryContainer").mouseleave(function(){
            $("li#todayDeliveryContainer").removeClass("open");
			$(".delivery_box_wrap").css("display","none");
        })
        
// 검색창 클릭시
		$(".placeholder_area").click(function(){
			var val =$('#query').val();
			console.log(val)
		if (val) {
			$("#w_search_box > div.placeholder_area > label").text("");
			$("#searchPop").removeClass("on");
			$("#w_pop_cont").css("display","none");
			$("#searchRecent").removeClass("on");
			$("#recent_cont").css("display","none");
			$(".search_tab").css("display","none");
			$("#ark_w").css("display","block");
			$(".placeholder_area>label[for='query']").addClass("hide");
			$(".search_box").addClass("active");
			
		}else{
			$("#output").empty();
			$("#ark_w").css("display","none");
			$(".search_box").addClass("active");
			$(".placeholder_area>label[for='query']").addClass("hide");
			$(".search_tab").css("display","block");
			$("#w_pop_cont").css("display","block");
		}
			
		})
// 급상승 검색어 클릭시
		$("#searchRecent").click(function(){
			$("#searchRecent").addClass("on");
			$("#searchPop").removeClass("on");
			$("#w_pop_cont").css("display","none");
			$("#recent_cont").css("display","block");
		})
// 최근 검색어 클릭시 (쿠키 처리 해야 할 듯?)		
		$("#searchPop").click(function(){
			$("#searchPop").addClass("on");
			$("#searchRecent").removeClass("on");
			$("#w_pop_cont").css("display","block");
			$("#recent_cont").css("display","none");
		})
		
// 검색창 닫기 클릭시		
		$(".sch_pop_close").on('click', function(e) {
			$("#searchPop").addClass("on");
			$("#searchRecent").removeClass("on");
			$("#w_pop_cont").css("display","block");
			$("#recent_cont").css("display","none");
        	$(".search_box").removeClass("active");
			$(".placeholder_area>label[for='query']").removeClass("hide");
			$(".search_tab").css("display","none");
			$("#w_pop_cont").css("display","none");
});
// 검색창 부분 외 다른 곳 클릭시 검색 패널 닫기
		 $(document).on('click', function(e) {
    var searchBox = $('.search_box');
    // 클릭된 요소가 .search_box의 하위 요소이거나 .search_box 자체인 경우 아무것도 하지 않음
    if (searchBox.is(e.target) || searchBox.has(e.target).length > 0) {
        return;
    } else {
			$("#searchPop").addClass("on");
			$("#searchRecent").removeClass("on");
			$("#w_pop_cont").css("display","block");
			$("#recent_cont").css("display","none");
        	$(".search_box").removeClass("active");
			$(".placeholder_area>label[for='query']").removeClass("hide");
			$(".search_tab").css("display","none");
			$("#w_pop_cont").css("display","none");
        	
    }
});


// 스크롤 이벤트
$(document).ready(function() {
    var directTop = $('#directTop');
    var scrollThreshold = 300; // 일정 스크롤 위치 (예: 300px)

    // 스크롤 이벤트를 감지하여 처리
    $(window).scroll(function() {
        if ($(this).scrollTop() > scrollThreshold) {
            directTop.css('opacity', '1');
        } else {
            directTop.css('opacity', '0');
        }
    });

    // #directTop 클릭 시 페이지 맨 위로 스크롤
    directTop.click(function() {
        $('html, body').animate({ scrollTop: 0 }, 500);
    });
});
		
});
