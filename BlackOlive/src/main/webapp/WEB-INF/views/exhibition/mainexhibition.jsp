<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="Container">


	<div class="title-plan">
		<h1>
			기획전<span>꼭 갖고 싶은 그 상품들! 다양한 혜택까지!</span>
		</h1>
	</div>

	<div class="common-menu">

		<ul>
			
			<li><button type="button" data-ref-dispcatno="0"
					title="선택됨">전체</button></li>
			<c:set var="counter" value="1"></c:set>
			<c:if test="${not empty largeCategoryList}">
				<c:forEach items="${largeCategoryList}" var="lcl">
					<li>
						<button type="button" data-ref-dispcatno="${lcl.categoryLargeId}">${lcl.categoryLargeName}</button>
					</li>
					
					<c:set var="counter" value="${counter + 1}"></c:set>
				</c:forEach>
			</c:if>
			
			<c:set var="remainer" value="${ ( ((counter / 6) + 1) * 6 ) - counter }"></c:set>
			
			<c:forEach begin="1" end="${remainer}">
				<li class="disabled"></li>			
			</c:forEach>

		</ul>
	</div>
	<script>
		$(":button").on('click', function() {
			let disCapno = $(this).data('ref-dispcatno');
			let all = "0";
			
			if (all == disCapno ) {
				
				window.location.href = "/store/main/getExhibition";
			}else{
				window.location.href = "/store/main/getExhibition?exdispCapno="+disCapno;
			}
			
		}) // button click
	</script>
	<script>
		$(function() {
			
			let exdispCapno = 0;
			let aa = '${param.exdispCapno}';
			if ( aa != null) {
				exdispCapno = '${param.exdispCapno}'
			} // if
			

			var elementWithDataRefDiscapno = $('.common-menu ul li button');
			
			elementWithDataRefDiscapno.each(function(){
			      // 각 요소의 data-ref-discapno 속성 값과 파라미터 값을 비교
			      if ( $(this).data('ref-dispcatno') == exdispCapno) {
			    	
				     $(this).parent().addClass("on");
				     return false; // 반복문 종료
			      } // if
			    });
			 
			
		}) // ready function
	
	</script>


	<!-- 서브카테고리 상단 안내화면 -->

	<!-- //서브카테고리 상단 안내화면 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$(".guideBtn").mouseover(function() {
				$(".guidePopup").show();
			});
			$(".guideBtn").mouseout(function() {
				if ($('.guidePopup:hover').length <= 0) {
					$(".guidePopup").hide();
				}
			});
			$(".guidePopup").mouseover(function() {
				$(".guidePopup").show();
			});
			$(".guidePopup").mouseout(function() {
				if ($('.guideBtn:hover').length <= 0) {
					$(".guidePopup").hide();
				}
			});
		});
	</script>

	<!-- 추천 기획전 -->

	<h3 class="plan_tit">Weekly Special</h3>
	<div class="recomm_plan">
		<ul class="recomm_plan_list goods-plan-recom">
		
		<c:if test="${not empty weeklySpecialBanner}">
			<c:forEach items="${weeklySpecialBanner}" var="wsb">
			<li>
				<a href="/store/getExhibition?eventId=${wsb.exhibitionId}">
					<img src="${wsb.exhibitionBannerImgSrc}"
					alt="weeklySpecialBanner">
					<div class="text_wrap">
						<dl style="color: #000000;">
							<dt>${wsb.exhibitionBannerSummary}</dt>
							<dt>${wsb.exhibitionBannerSummary2}</dt>
							<dd>${wsb.exhibitionBannerKeyword}</dd>
						</dl>
					</div>
				</a>
			</li>
			</c:forEach>
		</c:if>

		</ul>
	</div>

	<!-- //추천 기획전 -->
	<!-- 기획전 상품 목록 new -->
	<h3 class="plan_tit">지금 진행 중인 행사예요</h3>
	<ul class="goods-plan ty02">
		<c:if test="${empty bannerNProduct }"><h2 style="">현재 진행중인 기획전이 없어요.</h2></c:if>
		<c:if test="${not empty bannerNProduct}">
			<c:forEach items="${bannerNProduct}" var="bnp">
				<li>
					<div class="plan-top scroll-lazyload" style="background-image: url('${bnp.exhibitionBannerImgSrc}');">
						<a href="/store/getExhibition?eventId=${bnp.exhibitionId}" class="planImg">
							<div class="text_wrap">
						<dl style="color: #000000;">
							<dt>${bnp.exhibitionBannerSummary}</dt>
							<dt>${bnp.exhibitionBannerSummary2}</dt>
							<dd>${bnp.exhibitionBannerKeyword}</dd>
						</dl>
					</div>
				</a>
			</div>
			<ul class="cate_prd_list">
				<c:forEach items="${bnp.getproductcontainer}" var="value">
				<li>
					<div class="prd_info">
						<a href="/store/goods?productDisplayId=${value.productDisplayId}" name="Planshop" class="prd_thumb goodsList">
							<span class="thumb_flag best">베스트</span>
								<img src="${value.productDisplaySrc}" alt="${value.productDisplayName}">
						</a>
						<div class="prd_name">
							<a href="javascript:;" name="Planshop" class="goodsList">
							<span class="tx_brand">${value.brandName}</span>
							<p class="tx_name">${value.productDisplayName}
							</p>
							</a>
						</div>
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">${value.minprice}</span>원 </span><span
								class="tx_cur"><span class="tx_num">${value.afterprice }</span>원 </span>
						</p>
						<p class="prd_flag">
							<c:if test="${value.discountflag eq 1 }">
								<span class="icon_flag sale">세일</span>
							</c:if>
							<c:if test="${value.couponflag eq 1}">
								<span class="icon_flag coupon">쿠폰</span>
							</c:if>
							<c:if test="${value.presentflag eq 1 }">
								<span class="icon_flag gift">증정</span>
							</c:if>
							<c:if test="${value.todaypickupflag eq 1}">
								<span class="icon_flag delivery">오늘드림</span>
							</c:if>
						</p>
						<p class="prd_point_area tx_num">
							<span class="review_point"><span class="point"
								style="width: 96.0%"></span></span>
						</p>
						<p class="prd_btn_area">
							<button class="cartBtn" data-ref-goodsno="${value.productDisplayId}">장바구니</button>
							<button class="btn_new_pop goodsList">새창보기</button>
						</p>
					</div>

				</li>
				
				
				
				</c:forEach>

			</ul>
		</li>
			</c:forEach>
		</c:if>

	</ul>
	<!-- //기획전 상품 목록 new -->

</div>