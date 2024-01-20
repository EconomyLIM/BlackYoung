<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/inc/include.jspf" %>

<div id="Container">
		
		<div id="Contents">
			<div class="sub_title_area customer">
				<h1>고객센터 <span>무엇을 도와드릴까요?</span></h1>
			</div>

			<ul class="comm1sTabs threeSet customer">
				<li id="tabFaq"><a href="<%=contextPath%>/counselor/faq">FAQ</a></li>
				<li id="tab1on1"><a href="<%=contextPath%>/counselor/personalAskList">1:1문의</a></li>
				<li id="tabNotice" class="on"><a href="<%=contextPath%>/counselor/notice" title="선택됨">공지사항</a></li>
			</ul>

			<div id="TabsOpenArea">
				
				<div class="area-customer">
					<ul class="comm2sTabs fourSet pdB30">
					
						<li data-ref-ntcclsscd="00"><button type="button" >전체</button></li>
						<li data-ref-ntcclsscd="01"><button type="button" >일반</button></li>
						<li data-ref-ntcclsscd="02"><button type="button" >매장</button></li>
						<li data-ref-ntcclsscd="03"><button type="button" >이벤트</button></li>

					</ul>
				</div>
				
				
				
				<div class="TabsConts on">
					<ul class="noticeList" id="notice-list">
		
							</ul><table class="board-list-1s">
						<caption>번호, 제목, 등록일/당첨자 발표일로 이루어진 공지사항 목록 표</caption>
						<colgroup>
							<col style="width:9%;">
							<col style="width:79%;">
							<col style="width:12%;"><!-- 2017-03-10 수정 : colgroup 영역 전체 복사+붙여넣기해주세요(각 항목 간격 수정) -->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>

								<th scope="col">등록일/당첨자 발표일</th>



							</tr>
						</thead>
						<tbody>

	
			<tr class="notice_fix">
			<%-- 중요 표시한 게시글 고정 --%>
			
								<td>중요</td>
			
											
								<td class="subject">
								<c:choose>
									<c:when test="${ importantNotice.noticeCategory eq '일반' }">
										<strong class="FG01">${ importantNotice.noticeCategory }</strong>
									</c:when>
									<c:when test="${ importantNotice.noticeCategory eq '매장' }">
										<strong class="FG02">${ importantNotice.noticeCategory }</strong>
									</c:when>
									<c:otherwise>
										<strong class="FG03">${ importantNotice.noticeCategory }</strong>
									</c:otherwise>
								</c:choose>
								<a href="<%=contextPath%>/counselor/noticedetail?noticeId=${ importantNotice.noticeId }" data-notice="${ importantNotice.noticeId }">${ importantNotice.noticeTitle }</a></td>
								<td>
								<fmt:formatDate value="${ importantNotice.noticeDate }" pattern="yyyy-MM-dd" var="importantnoticedate"/>
								${ importantnoticedate }
								</td>
							</tr>
							
			<%-- 게시글 출력 --%>
					<c:forEach items="${ noticeVO }" var="notice">
							<tr>
							
			
								<td>${ notice.noticeNum }</td>
											
								<td class="subject">
								<c:choose>
									<c:when test="${ notice.noticeCategory eq '일반' }">
										<strong class="FG01">${ notice.noticeCategory }</strong>
									</c:when>
									<c:when test="${ notice.noticeCategory eq '매장' }">
										<strong class="FG02">${ notice.noticeCategory }</strong>
									</c:when>
									<c:otherwise>
										<strong class="FG03">${ notice.noticeCategory }</strong>
									</c:otherwise>
								</c:choose>
								<a href="<%=contextPath%>/counselor/noticedetail?noticeId=${ notice.noticeId }" data-notice="${ notice.noticeId }">${ notice.noticeTitle }</a></td>
								<td>
								<fmt:formatDate value="${ notice.noticeDate }" pattern="yyyy-MM-dd" var="noticedate"/>
								${ noticedate }
								</td>
							</tr>
							
					</c:forEach>
						
						</tbody>
					</table>
				</div>
				

				
				<div class="TabsConts">
					일반
				</div>
				

				
				<div class="TabsConts">
					매장
				</div>
				

				
				<div class="TabsConts">
					이벤트
				</div>
				
				
				
				<div class="TabsConts">
					뷰티테스터
				</div>
				
			</div>
			
			


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

		</div>
		
	</div>
	
	<form id="actionForm" action="/counselor/notice" method="get">
		<input type="hidden" name="tabs" value="">
		<input type="hidden" name="pageNum" value="${ pageMaker.criteria.pageNum }"> 
		<input type="hidden" name="amount" value="${ pageMaker.criteria.amount }"> 
		<input type="hidden" name="keyword" value="${ pageMaker.criteria.keyword }"> 
	</form>
	
	<form id="detailForm" action="/counselor/noticedetail" method="get">
		<input type="hidden" name="noticeId" value="">
		<input type="hidden" name="pageNum" value="${ pageMaker.criteria.pageNum }"> 
		<input type="hidden" name="amount" value="${ pageMaker.criteria.amount }"> 
	</form>
	
	
	
<script>

var detailForm = $("#detailForm");
var actionForm = $("#actionForm");

	//페이징 번호로 넘어가기
	$("div.pageing a").on("click", function() {
		
		event.preventDefault();
		
		let pageNum = $(this).attr("href");
		actionForm.find("input[name=pageNum]").val(pageNum);
		
		actionForm.submit();
			
	});
	
	//태그 선택 스크립트
	$("div.area-customer ul.comm2sTabs li button").on("click", function () {
				
		if ($(this).text() == "전체") {
			actionForm.submit();
		} else{
			var tabs = $(this).text()
			
			actionForm.find("input[name=tabs]").val(tabs)
			
			actionForm.find("input[name=pageNum]").val("1");
			
			actionForm.submit();
		}
	});
	

	$(document).ready(function(){
		
		$("ul.comm2sTabs li button").parent().removeClass("on");
		
		$("ul.comm2sTabs li button:contains('${ tabs }')").parent().addClass("on");
		
		$("ul.comm2sTabs li button:contains('${ tabs }')").attr("title", "선택됨");

	})
	
	$("tbody tr td.subject a").on("click", function(event) {
		event.preventDefault();
		
		var idid = $(this).attr("data-notice")
		detailForm.find("input[name=noticeId]").val(idid);
		
		detailForm.submit();
	})
	
</script>