<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<div class="title-area">
		<h2 class="tit">상품 Q&amp;A</h2>
	</div>
	
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
		String myPageURL = "/mypage/productQnA";
	%>
	<script>
		var myPageURL = "<%= myPageURL %>"
	</script>
	


	<table class="board-list-2s mgT20">
		<caption>상품 Q&amp;A 내역 목록</caption>
		<colgroup>
			<col style="width:367px;">
			<col style="width:272px;">
			<col style="width:150px;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">상품</th>
				<th scope="col">문의내용</th>
				<th scope="col">답변상태</th>
			</tr>
		</thead>
		<tbody class="qna">
	

			<c:forEach items="${ qnaVO }" var="qna">
			
			<tr data-gdas-seq="23597682" data-goods-no="A000000006564" data-param="" data-prgs-stat-cd="20">
				<td colspan="3">
					<div class="question">
						<div class="area oneDv">
							<a class="thum goodsList" href="<%= contextPath%>/store/goods?productDisplayId=${ qna.productDisplayId }">
								<img src="${ qna.productDisplaySrc }" alt="${ qna.productDisplayName }" onerror="common.errorImg(this);">
							</a>
							<div class="textus">
								<a class="goodsList" href="<%= contextPath%>/store/goods?productDisplayId=${ qna.productDisplayId }">
									<span class="tit">${ qna.brandName }</span>
									<span class="txt">${ qna.productDisplayName }</span>
								</a>
							</div>
						</div>
						
						<div class="area twoDv">
							<div class="textus">
								<dl class="data">
									<dt>문의일자</dt>
									<dd>
									<fmt:formatDate value="${ qna.qnaDate }" pattern="yyyy.MM.dd" var="productQnADate"/>
									${ productQnADate }
									</dd>
								</dl>
								<a class="" href="#">
									<span class="txt">${ qna.qnaQuestion }</span>
								</a>
							</div>
						</div>
						
						<div class="threeDv">
							<strong class="comp">${ qna.qnaStatus }</strong>
	
						</div>
					</div>
					<ul class="conts">
						<li class="question">
							<strong>문의</strong>
							<p>
								${ qna.qnaQuestion }
							</p>
							<div class="btn">

								<button type="button" class="ButtonBasic delete" id="delete" name="delete">삭제</button>
							</div>
						</li>
						<c:choose>
							<c:when test="${ not empty qna.qnaAnswer }">
								<li class="answer">
									<strong>답변<span class="ids">운영자</span><span class="day">${ qna.qnaDate }</span></strong>
									<p>
										${ qna.qnaAnswer }
									</p>
								</li>
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
						
						

					</ul>
				</td>
			</tr>

			</c:forEach>


		</tbody>
	</table>
	<!-- //내역 -->


<script>
	$("div.threeDv").on("click", function () {
		var content =  $(this).parent().siblings("ul.conts");
		var parent = $(this).parents("td");
		
		
		if (content.css("display") === "none") {
			parent.addClass("open");
			content.show();
		} else {
			parent.removeClass("open");
			content.hide();
		}
		
		parent.siblings().removeClass("open").find("ul.conts").hide();
		
	});
	
</script>
			

	<div class="pageing">
	
	
		
			
		<strong title="현재 페이지">1</strong>
			
			
		
	
	
	</div>

