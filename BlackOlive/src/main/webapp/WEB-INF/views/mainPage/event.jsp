<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>블랙올리브영 온라인몰</title>
</head>
<body>

	<script>
		$(function() {
			// e_dis 색깔 바꾸기 온, 오프라인 등등
			let spans = $(".evt_flag");
			for (var i = 0; i < spans.length; i++) {
				let e_dis = $(spans[i]).text();
				
				if(e_dis == "온라인몰") {
					e_dis = "online";
				} else if(e_dis == "오프라인") {
					e_dis = "offline";
				} else if(e_dis == "온&오프라인") {
					e_dis = "both";
				}
				$(spans[i]).addClass(e_dis); 
			}
			
			let lis = $("#tabList > li");
			let type = '${click}';
			for (var i = 0; i < lis.length; i++) {
				if($(lis[i]).text() == type) {
					$(lis[i]).addClass("on");
					break;
				}
			}
		})
	</script>

<div id="Wrapper">
	<div id="Container">
		<div class="event_cont_wrap">
			<div class="event_tit_box">
				<h1>이벤트 <span>풍성한 이벤트! 즐거운 올리브영</span></h1>
				<button type="button" id="winner">당첨자 발표 보기</button>
			</div>

			<ul class="event_tab_list" id="tabList">
				<li><a href='<c:url value="/store/getEvent?click=모든회원"/>' title="선택됨" data-attr="이벤트^이벤트_모든회원">모든회원</a></li>
				<li><a href='<c:url value="/store/getEvent?click=구매회원"/>' data-attr="이벤트^이벤트_구매회원">구매회원</a></li>
				<li><a href="" data-attr="이벤트^이벤트_체험단">체험단</a></li>
			</ul>
			<div class="event_tab_cont">
				<ul class="event_thumb_list">
					<c:forEach items="${list }" var="list">
						<li>
							<a href='<c:url value="/store/getEventDetail?eventId=${list.eventId}"/>'>
								<span class="evt_flag">${list.eventType }</span>
								<img class="completed-seq-lazyload" src="${list.eventDetailImgSrc }">
								<p class="evt_tit">${list.eventTitle }</p>
								<p class="evt_desc">${list.eventSubTitle }</p>
								<p class="evt_date">${list.eventStartdate}-${list.eventEnddate}</p>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>