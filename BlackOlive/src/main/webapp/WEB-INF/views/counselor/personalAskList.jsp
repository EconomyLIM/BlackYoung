<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/inc/include.jspf"%>

		<!-- #Contents -->
		<div id="Contents">
			<div class="sub_title_area customer">
				<h1>고객센터 <span>무엇을 도와드릴까요?</span></h1>
				<button type="button" class="btn_inquiry" id="regForm1on1" >1<em>:</em>1 문의하기</button>
			</div>

			<ul class="comm1sTabs threeSet customer">
				<li id="tabFaq"><a href="/counselor/faq">FAQ</a></li>
				<li id="tab1on1" class="on"><a href="#" title="선택됨">1:1문의</a></li>
				<li id="tabNotice"><a href="/counselor/notice">공지사항</a></li>
			</ul>
			<!-- 기간조회 -->
	 	<fieldset class="search-period mgT30">
		
		<div class="select_con">
			<p>구매기간</p>
			<ul class="select-month">
				<li class="on"><button type="button" data-month="-1">1개월</button></li>
				<li><button type="button" data-month="-3">3개월</button></li>
				<li><button type="button" data-month="-6">6개월</button></li>
				<li><button type="button" data-month="-12">12개월</button></li>
				
			</ul>		
			
			<div class="select-range">
				<select id="cal-start-year" title="년도를 선택하세요" style="width:76px;"></select>
				<label for="cal-start-year">년</label>
				
				<select id="cal-start-month" title="달월을 선택하세요" style="width:60px;"></select>
				<label for="cal-start-month">월</label>
				
				<select id="cal-start-day" title="날일을 선택하세요" style="width:60px;"></select>
				<label for="cal-start-day">일</label>
				
				<span class="des">~</span>
				
				<select id="cal-end-year" title="년도를 선택하세요" style="width:76px;"></select>
				<label for="cal-end-year">년</label>
				
				<select id="cal-end-month" title="달월을 선택하세요" style="width:60px;"></select>
				<label for="cal-end-month">월</label>
				
				<select id="cal-end-day" title="날일을 선택하세요" style="width:60px;"></select>
				<label for="cal-end-day">일</label>
			</div>
		</div>
		 
		<button type="button" class="btnLookup" id="do-search-period">조회</button>
	</fieldset>
	
	<script src="<%=contextPath %>/resources/js/searchoptiondateonly.js"></script>
	<%
		String myPageURL = "/counselor/personalAskList";
	%>
	<script>
		var myPageURL = "<%= myPageURL %>"
	</script>
	<!-- //기간조회 -->

<!-- 내용 -->
<div class="list-customer onenone m2105">
	<ul>
		<c:choose>
		<c:when test="${ not empty myAskList}">
		<c:forEach items="${myAskList}" var="list">
		<li id="num" >
			<a href="#" class="stit complete" id="btnAnsCont">
				<strong>${list.personalAskStatus}</strong>${list.personalAskContent}
				<span class="data">
					<fmt:formatDate value="${list.personalAskDate}" pattern="yyyy.MM.dd" var="askDate"/> 
					${askDate}
				</span>
			</a>
			<!-- 상세내용 -->
				<ul class="conts">
					<li class="question">
						<strong>문의</strong>
						<ul>
						    <li class="inquiry_type"><span>${list.askCategoryMajor}</span> &gt; <span>${list.askCategoryMinor}</span></li>
								<!-- 주문상품이 있을 때 -->
								<c:choose>
								<c:when test="${ not empty list.orderId}">
								<fmt:formatDate value="${list.orderDate}" pattern="yyyy.MM.dd" var="orderdate"/> 
								<li><em>주문일자</em>${orderdate}</li>
								<li><em>문의상품</em> ${list.productDisplayName} ${list.productCnt}개</li>
								</c:when>
							<c:otherwise>
							</c:otherwise>
							</c:choose>
						</ul>
						<p>${list.personalAskContent}	</p>
					</li>
					<!-- 답변이 있을 때 -->
					<li class="answer" value="${list.personalAskAnswer}">
						<strong style="color:#9bce26">${list.personalAskStatus}
							<span class="answer_date"><!-- 답변날짜 --></span>
						</strong>
						<c:choose>
							<c:when test="${ not empty list.personalAskAnswer}">
						<p>${list.personalAskAnswer}</p>
						<div class="phr">문의에 대한 답변이 부족하거나 추가문의사항이 있으시면 새로운 문의사항으로 등록해주세요.
							<a href="/counselor/personalAsk" class="btnGreenW">새로운 문의하기</a>
						</div>
							</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
					</li>
				</ul>
 		</li>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<li class="nodata">등록하신 1:1 문의가 없습니다.</li>
			</c:otherwise>
			</c:choose>
<!--  -->
				</ul>
			</div>
<!-- //내용 -->

			<!-- pageing star -->
		<div class="pageing">
			<c:if test="${ pageMaker.prev }">
				<a href="${ pageMaker.startPage -1 }">&laquo;</a>
			</c:if>
		
			<c:forEach begin="${ pageMaker.startPage }"
				end="${ pageMaker.endPage }" step="1" var="num">
			
			<c:choose>
				<c:when test="${ num eq pageMaker.criteria.pageNum }">
					<strong title="현재 페이지">${ num }</strong>
				</c:when>
				<c:otherwise>
					<a href="${ num }" class="${ num }">${ num }</a>				
				</c:otherwise>
			</c:choose>

			</c:forEach>

			<c:if test="${ pageMaker.next }">
				<a href="${ pageMaker.endPage + 1 }">&raquo;</a>
			</c:if>
		</div>

			<!-- //pageing end -->

			<div class="area1sButton pdT30">
				<a href="<%=contextPath %>/counselor/personalAsk" class="btnGreen" data-attr="고객센터^FAQ^1:1문의">1:1문의하기</a>
			</div>
		</div>
		<!-- //#Contents -->

<script>
$(function () {	
	$(document).on("click", ".stit", function (event) {
		//a태그 이벤트 막기
		event.preventDefault();
		//parent.removeClass('open');
        var parent = $(this).closest('#num');
        var conts = parent.find(".conts");
		
        if (parent.hasClass('open')) {
            parent.removeClass('open');
            conts.hide();
        } else {
            parent.addClass('open');
            conts.show();
        }
	});
});	

</script>

<script>
	$("#regForm1on1").on("click", function () {
		location.href = "<%=contextPath %>/counselor/personalAsk";
	});
</script>
