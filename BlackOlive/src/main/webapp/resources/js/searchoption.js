/**
 * 
 */

function navigateToURL(url) {
    location.href = url;
}
	$(document).ready(function () {
		
		var today = new Date();
		var tYear =	today.getFullYear();
		var tMonth = today.getMonth();
		var tday = today.getDate();
		
		//년,월,일 날짜 option 생성
		//1. 년		
		for (var i = 2012; i <= tYear; i++) {
			$("#cal-start-year, #cal-end-year").append(`<option value=${i}>${i}</option>`);
		}
		
		//2. 월
		for (var i = 1; i <=12; i++) {
			
			$("#cal-start-month, #cal-end-month").append(`<option value=${i}>${i}</option>`);
		}
	
		//3. 일
		let syear = $("#cal-start-year option:selected").val();
		let eyear = $("#cal-end-year option:selected").val();
		let smonth = $("#cal-start-month option:selected").val();
		let emonth = $("#cal-end-month option:selected").val();
		let slastDay = getLastDay(syear, smonth)
		let elastDay = getLastDay(eyear, emonth)
		
		for (var i = 1; i <= slastDay; i++) {
			$("#cal-start-day").append(`<option value=${i}>${i}</option>`);
		}
		
		for (var i = 1; i <= elastDay; i++) {
			$("#cal-end-day").append(`<option value=${i}>${i}</option>`);
		}
		
		//상태유지 
		const urlParams = new URLSearchParams(window.location.search);
		
		//구매기간이 선택되어 있다면
		if (urlParams.has('searchMonth')) {
			let getsM = String(urlParams.get('searchMonth'));
			$("ul.select-month li button").parent().siblings(".on").removeClass("on");
			$('ul.select-month li button[data-month='+ getsM + ']').parent().addClass("on");
		}
		
		let getsOT = String(urlParams.get('searchOrderType'));
		
		//구매유형이 선택되어 있다면
		if (getsOT == "10" || getsOT == "20" ) {
			$("ul.select-type li button").parent().siblings(".on").removeClass("on");
			$('ul.select-type li button[data-order_type='+ getsOT + ']').parent().addClass("on");
		}
	
		//넘어온 날짜 파라미터값이 있다면 상태유지
			if (urlParams.has('startDate') || urlParams.has('endDate') ) {
				let getsDate = urlParams.get('startDate');
				let getsyear = getsDate.substring(0,4);
				$("#cal-start-year").val(getsyear).prop("selected", true);
				
				let getsmonth = getsDate.substring(5,7);
				$("#cal-start-month").val(Number(getsmonth)).prop("selected", true);
				
				let getsdate = getsDate.substring(8,10);
				$("#cal-start-day").val(Number(getsdate)).prop("selected", true);
				
				let geteDate = urlParams.get('endDate');
				let geteyear = geteDate.substring(0,4);
				$("#cal-end-year").val(geteyear).prop("selected", true);
				
				let getemonth = geteDate.substring(5,7);
				$("#cal-end-month").val(Number(getemonth)).prop("selected", true);
				
				let getedate = geteDate.substring(8,10);
				$("#cal-end-day").val(Number(getedate)).prop("selected", true);
				
			} else {	//파라미터값이 없다면 오늘을 기본값으로
				
				$("#cal-start-year").val(tYear).prop("selected", true);
				$("#cal-end-year").val(tYear).prop("selected", true);
				
				$("#cal-start-month").val(tMonth).prop("selected", true);
				$("#cal-end-month").val(tMonth + 1).prop("selected", true);
				
				$("#cal-start-day").val(tday).prop("selected", true);
				$("#cal-end-day").val(tday).prop("selected", true);
				
			}
	
	}); 
	
	//마지막 날짜 구하기 메서드
		function getLastDay(year, month){
			let d = new Date(year, month)
			d.setDate( d.getDate() - 1 );
			return d.getDate();
			}
		
	//날짜값을 변경할 경우
		//시작일
			$("#cal-start-year, #cal-start-month").on("change", function() {
				let syear = $("#cal-start-year option:selected").val();
				let smonth = $("#cal-start-month option:selected").val();		
				let slastDay = getLastDay(syear, smonth)
						
				$("#cal-start-day option").remove();
				
					for (var i = 1; i <= slastDay; i++) {
						
						$("#cal-start-day").append(`<option value=${i}>${i}</option>`);
					}
	
			});
			
			//종료일
			$("#cal-end-year, #cal-end-month").on("change", function() {
				let eyear = $("#cal-end-year option:selected").val();
				let emonth = $("#cal-end-month option:selected").val();
				let elastDay = getLastDay(eyear, emonth)
				
				$("#cal-end-day option").remove();
		
				for (var i = 1; i <= elastDay; i++) {
					
					$("#cal-end-day").append(`<option value=${i}>${i}</option>`);
				}
	
		});
	
	// 탐색 배너의 모든 버튼 클릭 시
		$(".search-period.mgT30 button").on("click", function() {
			
			
			
			var urlFromJSP = myPageURL;
			
			//구매기간, 구매유형 버튼
			$(this).parent().siblings(".on").removeClass("on");
			$(this).parent().addClass("on");
			
			var today = new Date();
			var tyear = today.getFullYear();
			var tMonth = today.getMonth();
			var tday = today.getDate();
			
			//구매기간이라면
			if ($(this).parents("ul").hasClass("select-month")) {
				
				let datemonth = $(this).attr("data-month")
				if (datemonth == "-12") {
					$("#cal-start-year").val(tyear - 1).prop("selected", true);
					$("#cal-start-month").val(tMonth + 1).prop("selected", true);
					$("#cal-start-day").val(tday).prop("selected", true);
				} else {				
					$("#cal-start-year").val(tyear).prop("selected", true);
					$("#cal-start-month").val(tMonth + 1 + Number(datemonth)).prop("selected", true);
					$("#cal-start-day").val(tday).prop("selected", true);					
				}
								
			} 
			
			// 선택된 시작,종료일
			let syear = $("#cal-start-year option:selected").val();
			let smonth = $("#cal-start-month option:selected").val().padStart(2, '0');		
			let sdate = $("#cal-start-day option:selected").val().padStart(2, '0');
			
			let eyear = $("#cal-end-year option:selected").val();
			let emonth = $("#cal-end-month option:selected").val().padStart(2, '0');		
			let edate = $("#cal-end-day option:selected").val().padStart(2, '0');	

			
			let startDate = `${syear}-${smonth}-${sdate}`;
			
			let endDate = `${eyear}-${emonth}-${edate}`;
			
			//구매기간, 구매조건 선택사항
			let searchMonth = $(".select-month li.on button ").attr("data-month");
			let searchOrderType = $(".select-type li.on button").attr("data-order_type");
			
			if(dateCheck()){
				//url 작성
				var url = urlFromJSP + "?searchMonth=" + searchMonth + "&startDate=" + startDate + "&endDate=" + endDate + "&searchOrderType=" + searchOrderType;
				
				navigateToURL(url);
			
			} 
			

			
		});
		
var dateCheck = function(){
			let syear = $("#cal-start-year option:selected").val();
			let smonth = $("#cal-start-month option:selected").val().padStart(2, '0');		
			let sdate = $("#cal-start-day option:selected").val().padStart(2, '0');
			
			let eyear = $("#cal-end-year option:selected").val();
			let emonth = $("#cal-end-month option:selected").val().padStart(2, '0');		
			let edate = $("#cal-end-day option:selected").val().padStart(2, '0');
			
			let startDate = `${syear}-${smonth}-${sdate}`;
			
			let endDate = `${eyear}-${emonth}-${edate}`;
						
			let date12 = new Date(endDate);
			date12.setFullYear(date12.getFullYear() + 1);
			date12.setDate(date12.getDate() + 1);
			
			var today = new Date();
			let s = new Date(startDate);
			let e = new Date(endDate);

			
			if(s > e){
				alert("검색 종료일이 검색 시작일보다 늦어야됩니다.");
				return false;
			}
			
			if(s > today ){
				alert("검색 시작일이 오늘보다 빨라야됩니다.");
				return false;
			}
			
			if(e >= today){
				alert("검색 종료일이 오늘보다 빨라야 됩니다.");
				return false;
			}
			
			if( Math.abs(e - s) > Math.abs(date12 - e)  ){
				alert("검색기간은 최대 1년 입니다.");
				return false;
			}
			return true;				
		}
	
