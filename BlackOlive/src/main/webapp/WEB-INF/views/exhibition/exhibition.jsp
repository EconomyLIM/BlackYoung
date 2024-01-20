<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="Container">

		<c:if test="${not empty exhibitionInfoDTO}">
			<div class="title-plan-view">
			<h1 id="planTitle">${exhibitionInfoDTO.exhibitionName }</h1>

			<span>${exhibitionInfoDTO.exhibitionStartDay} - ${exhibitionInfoDTO.exhibitionEndDay}</span>
			<div class="event_share_link">

				<a href="javascript:;" class="link_social kakaoT">카카오톡 공유하기</a> <a
					href="javascript:;" class="link_social kakao">카카오스토리 공유하기</a> <a
					href="javascript:;" class="link_social facebook">페이스북 공유하기</a> <a
					href="javascript:;" class="link_social url">URL 공유하기</a>
			</div>
		</div>


		<div class="DimTransparent"></div>

		<div
			class="plan-visual contEditor U85de00a9-4c59-42dd-8cfa-2cdf2d2c6ec1"
			name="Home_Planshop2_PROD">
			<div class="pc w638 plan-template">
				
				<c:if test="${not empty exhibitionImg}">
					<c:forEach items="${exhibitionImg}" var="exi">
        					<c:choose>
        						<c:when test="${fn:endsWith(exi.exhibitionImgSrc, 'mp4')}">
        							<video src="${exi.exhibitionImgSrc}" alt="광고비디오"></video>
        						</c:when>
        						<c:otherwise>
        							<img alt="${exi.exhibitionImgId}" src="${exi.exhibitionImgSrc}">		
        						</c:otherwise>
        					</c:choose>		
					</c:forEach>
				</c:if>
			
			</div>

		</div>
			

		</c:if>
		
		<c:if test="${not empty exhibitionCategory }">
			<ul class="plan-menu" id="move1">
					<li><a href="#" onclick=" handleMenuClick('all',event)">전체</a></li>
						<c:forEach items="${exhibitionCategory}" var="ec">
							<li><a href="#" id="${ec.exhibitionCategoryId}" onclick=" handleMenuClick('${ec.exhibitionCategoryId}',event)">${ec.exhibitionCategoryName}</a></li>
							<c:set var="counter" value="${counter + 1}" />
						</c:forEach>
						
						<!-- 남은 갯수만큼 빈칸 출력 -->
						<c:set var="remainder" value="${(counter % 4)+1}" />
							<c:forEach begin="1" end="${4-remainder}">
								<li>&nbsp;</li>
							</c:forEach>
			</ul>
		</c:if>
		
		
		<!-- 상품 작업 -->


		<c:if test="${not empty exhibitionCategory}">
			<c:forEach items="${exhibitionCategory}" var="ec">
			<c:set var="counter" value="${counter + 1}" />
				<p id="${ec.exhibitionCategoryId}" class="plan-link tema section section">
					<span id="section${counter}">${ec.exhibitionCategoryName}</span>
				</p>
				<div id="${ec.exhibitionCategoryId}" class="pList">
					<ul class="cate_prd_list autoFull">
						<c:forEach items="${ec.productContainer}" var="value">
							<li>
								<div class="prd_info">
									<a href="/store/goods?productDisplayId=${value.productDisplayId}&displNum=${value.categoryLargeId}${value.categoryMidId}"
									class="prd_thumb goodsList">
										<span class="thumb_flag best">베스트</span>
										<img src="${value.productDisplaySrc}" alt="이미지 준비중입니다." />
									</a>
									<div class="prd_name">
											<span class="tx_brand">${value.brandName}</span>
											<p class="tx_name">${value.productDisplayName}</p>
										</a>
									</div>
									<button class="btn_zzim jeem" data-ref-goodsno="#">
										<span>찜하기전</span>
									</button>
									<p class="prd_price">
										<c:if test="${value.minprice eq value.afterprice}">
											<span class="tx_cur"><span class="tx_num">${value.afterprice }</span>원 </span>
										</c:if>
										<c:if test="${value.minprice ne value.afterprice}">
											<span class="tx_org"><span class="tx_num">${value.minprice}</span>원 </span>
											<span class="tx_cur"><span class="tx_num">${value.afterprice}</span>원 </span>
										</c:if>
									</p>
									<p class="prd_flag">
										<c:if test="${value.discountflag eq 1 }">
											<span class="icon_flag sale">세일</span>
										</c:if>
										<c:if test="${value.couponflag eq 1 }">
											<span class="icon_flag coupon">쿠폰</span>
										</c:if>
										<c:if test="${value.presentflag eq 1 }">
										
										</c:if>
										<c:if test="${value.todaypickupflag eq 1 }">
											<span class="icon_flag delivery">오늘드림</span>
										</c:if>
									</p>
									<p class="prd_point_area tx_num">
										<span class="review_point">
											<span class="point" style="width: 98.0%">10점만점에 5.5점
											</span>
										</span>(1)
									</p>
									<p class="prd_btn_area">
										<button class="cartBtn">장바구니</button>
										<button class="btn_new_pop goodsList" name="Home_Planshop2_PROD">새창보기</button>
									</p>
								</div>
							</li>
						</c:forEach>
						
					</ul>
				</div>
			</c:forEach>
		</c:if>

		<!-- SNS 공유 이미지 및 제목 -->

		<input type="hidden" id="dispCatNo" value=""> <input
			type="hidden" id="snsImg"
			value="">
		<input type="hidden" id="catMrkNm" value=""> <input
			type="hidden" id="sectionCnt" value="3">

		<!-- //SNS 공유 이미지 및 제목 -->

		<input type="hidden" id="currentTime" value="20231118155738">

	</div>
	
	<script>
function handleMenuClick(id, event) {
	event.preventDefault(); // 링크 클릭 기본 동작 방지
	
	$('div.pList').hide();
	$('p.plan-link').hide();
	
	if (id == 'all'){
		$('div.pList').show();
		$('p.plan-link').show();
	}
	
	$('div#'+id).show();
	$('p#'+id).show();
	
} // handleMenuClick
</script>

