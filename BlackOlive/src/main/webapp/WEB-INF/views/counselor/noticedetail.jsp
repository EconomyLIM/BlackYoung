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
			
			<table class="board-view-1s mgT40">
				<caption>공지사항 상세보기</caption>
				<colgroup>
					<col style="width:80%;">
					<col style="width:20%;">
				</colgroup>
				<tbody>
					<tr>
						<td>
							
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
							
							<span class="tit">${ notice.noticeTitle }</span>
						</td>
						<td class="data">
						<fmt:formatDate value="${ notice.noticeDate }" pattern="yyyy-MM-dd" var="noticedate"/>
						${ noticedate }</td>
					</tr>
					<tr>
						<td class="textus" colspan="2">
							<div class="contEditor">&nbsp;<br>
								${ notice.noticeContent }
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<ul class="prev-next">
				<c:choose>
					<c:when test="${ notice.noticeCategorynext eq '0' }">
						<li>
							<button type="button">다음글</button>
		
							<a>없음</a>
	
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<button type="button">다음글</button>
		
							<c:choose>
								<c:when test="${ notice.noticeCategorynext eq '일반' }">
									<strong class="FG01">${ notice.noticeCategorynext }</strong>
								</c:when>
								<c:when test="${ notice.noticeCategorynext eq '매장' }">
									<strong class="FG02">${ notice.noticeCategorynext }</strong>
								</c:when>
								<c:otherwise>
									<strong class="FG03">${ notice.noticeCategorynext }</strong>
								</c:otherwise>
							</c:choose>	
							<a href="/counselor/noticedetail?noticeId=${ notice.noticeIdnext }" data-ntc-seq="45461">${ notice.noticeTitlenext }</a>
								
		
						</li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${ notice.noticeCategoryprev eq '0' }">
						<li>
							<button type="button">이전글</button>
		
							<a>없음</a>
			
						</li>
					</c:when>
					<c:otherwise>					
						<li>
							<button type="button">이전글</button>
		
			
							<c:choose>
								<c:when test="${ notice.noticeCategoryprev eq '일반' }">
									<strong class="FG01">${ notice.noticeCategoryprev }</strong>
								</c:when>
								<c:when test="${ notice.noticeCategoryprev eq '매장' }">
									<strong class="FG02">${ notice.noticeCategoryprev }</strong>
								</c:when>
								<c:otherwise>
									<strong class="FG03">${ notice.noticeCategoryprev }</strong>
								</c:otherwise>
							</c:choose>	
							<a href="/counselor/noticedetail?noticeId=${ notice.noticeIdprev }" data-ntc-seq="41900">${ notice.noticeTitleprev }</a>
						</li>
					</c:otherwise>
				</c:choose>
				
			</ul>
			

			<div class="area1sButton pdT30">
				<a href="<%=contextPath%>/counselor/notice" class="btnGreen">목록보기</a>
			</div>

		</div>
		
	</div>
	
	<form id="detailForm" action="/counselor/notice" method="get">
		<input type="hidden" name="pageNum" value="${ pageMaker.criteria.pageNum }"> 
		<input type="hidden" name="amount" value="${ pageMaker.criteria.amount }"> 
	</form>
	
	<script>
		$("div.area1sButton a.btnGreen").on("click", function(event) {
			event.preventDefault();
			
			$("#detailForm").submit();
		});
	</script>