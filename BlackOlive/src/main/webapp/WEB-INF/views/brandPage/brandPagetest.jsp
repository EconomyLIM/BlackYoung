<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${ brandlist }" var="dto" varStatus="status">
<!-- 이부분 사용하지x  js 에 넣기  -->

	<li data-goods-idx="1">
		<div class="prod">
			<a
				href="#"
				name="BrandA001436_PROD" class="thumb goodsList"
				data-ref-goodsno="A000000162323" data-ref-dispcatno="9000002"
				data-ref-itemno="001"
				data-attr="브랜드관^구달_전체상품_전체^[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획"
				onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162323&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_전체상품_전체&quot;, &quot;1&quot;);">
				<img src="${ dto.product_displ_src }"
				alt="[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획" class="pic-thumb"
				onerror="common.errorImg(this);"> <span
				class="flag-badge best">베스트</span>
			</a>
			<div class="prod-info"
				onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162323&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_전체상품_전체&quot;, &quot;1&quot;);">
				<div class="prod-brand">
					<strong class="exclusive"></strong>
				</div>
				<a
					href="#"
					class="goodsList" data-ref-goodsno="A000000162323"
					data-ref-dispcatno="9000002" data-ref-itemno="001"
					data-attr="브랜드관^구달_전체상품_전체^[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획">
					<span class="prod-name double-line">${dto.pro_displ_name }</span>
				</a>
				<div class="price-info">
					<div class="discount">
						<span class="origin"><fmt:formatNumber
								value="${dto.pro_price }" groupingUsed="true" />원</span>
					</div>
					<div class="price">
						<strong class="total">30,960<span class="won">원</span></strong> <span
							class="oneday">오늘드림</span>
					</div>
					<div class="rating">
						<span class="point">"${dto.product_ }</span><span class="num">(999+)</span>
					</div>
					<div class="rating_type">
						<div class="rating_point star5">
							<span class="oyblind">별점 5점 만점에 4.7점</span>
						</div>
						<span>(999+)</span>
					</div>
				</div>
				<div class="flags">
					<span class="flag sale">세일</span><span class="flag coupon">쿠폰</span>
				</div>
			</div>
			<div class="prod-func">
				<button type="button" class="favorite"
					data-ref-goodsno="A000000162323">
					<span>찜하기</span>
				</button>
				<button type="button" class="cart"
					onclick="common.gf_regCart(this); return false;"
					data-goods-no="A000000162323" data-item-no="001">
					<span>장바구니</span>
				</button>
			</div>
		</div>
	</li>


</c:forEach>