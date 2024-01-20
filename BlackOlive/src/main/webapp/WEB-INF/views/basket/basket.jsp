<%@page import="com.blackolive.app.domain.basket.BasketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="/WEB-INF/inc/include.jspf"%>

<%
ArrayList<BasketDTO> basketList = (ArrayList) request.getAttribute("list");
String quickyn = request.getParameter("quickyn");
if(quickyn == null || quickyn.equals("")){
	quickyn = "N";
}
%>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<title>블랙올리브영 온라인몰</title>

<script>
//등급 색깔 
$(function(){
let grade_id = "<sec:authentication property="principal.member.gradeName"/>";
let grade = grade_id.split("&")[0];
console.log(grade)
let gradeColor = ""
switch (grade) {
case 'BABY': 
	gradeColor = 'iconGrade5';
	break;
case 'PINK': 
	gradeColor = 'iconGrade4';
	break;
case 'GREEN': 
	gradeColor = 'iconGrade3';
	break;
case 'BLACK': 
	gradeColor = 'iconGrade2';
	break;
case 'GOLD': 
	gradeColor = 'iconGrade1';
	break;
}
$("#Contents > div.membership_box").addClass(gradeColor);
})
</script>
	
	<div>
		<div id="Contents">

			<!-- title_box -->
			<div class="title_box">
				<h1>장바구니</h1>
				<ul class="step_list">
					<li class="on"><span class="hide">현재단계</span><span
						class="step_num tx_num">1</span> 장바구니</li>
					<!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
					<li><span class="step_num tx_num">2</span> 주문/결제</li>
					<li class="last"><span class="step_num tx_num">3 </span> 주문완료</li>
				</ul>
			</div>
			<!--// title_box -->

			<!-- membership_box -->


			<div class="membership_box">
				<p class="tx_grade_info">
					<strong><sec:authentication property="principal.member.userName"/></strong>님의 멤버십 등급은 <span
						class="grade"><sec:authentication property="principal.member.gradeName"/> </span>입니다
				</p>
				<ul class="membership_info_list">

					<li><a
						href="https://www.oliveyoung.co.kr/store/main/getMembership.do"
						class="grade_benefit"><span>등급혜택</span></a></li>
					<li><a
						href="https://www.oliveyoung.co.kr/store/mypage/getCJOnePointInfo.do"><strong><span
								class="tx_num">CJ ONE</span> 포인트</strong> <span class="own_point">

								<span class="tx_num">${headerVO.userpoint }</span>P


						</span></a></li>

					<li><a
						href="https://www.oliveyoung.co.kr/store/mypage/getCouponList.do"><strong>할인쿠폰</strong>
							<span class="own_point"><span class="tx_num">${headerVO.usercoupon }</span>개</span></a></li>
					<li><a
						href="https://www.oliveyoung.co.kr/store/mypage/getDepositList.do"><strong>예치금</strong>
							<span class="own_point"><span class="tx_num">${headerVO.userdeposit }</span>원</span></a></li>



				</ul>
			</div>
			<!--// membership_box -->

			<!-- 일반배송, 당일배송 탭 -->
			<ul class="comm5sTabs" id="ulDelivGb">
				<li quickyn="N" class="on"><button type="button"
						class="basketType nb" data-attr="장바구니^Tab^일반 배송" title="선택됨">일반
						배송 (${sessionScope.basketlistcnt[1]})</button></li>
				<li quickyn="Y"><button type="button" class="basketType tb"
						data-attr="장바구니^Tab^오늘 드림">오늘드림&amp;픽업
						(${sessionScope.basketlistcnt[0]})</button></li>
			</ul>
			<!--// 일반배송, 당일배송 탭 -->

			<!-- 배송지 선택 -->

			<div class="box_delivery pickStore" id="divDelivery"
				style="display: none;">




				<div class="storePick_area" style="display: none;">
					<div class="tBox">
						<strong>매장에서 픽업 하시겠어요? <a href="javascript:;"
							data-rel="layer" data-target="storePickPop" class="ico_info_view">매장픽업
								안내 레이어열기</a></strong> <span>실제 픽업 매장의 재고는 상이할 수 있습니다.</span>
					</div>
					<div class="toggleInput">
						<label class="switch"> <input type="checkbox"
							id="pickupDirectYn" name="pickupDirectYn" value="Y"> <span
							class="slider"></span>
						</label>
					</div>
				</div>
				<div class="today_dalivery">
					<dl class="box_dl">
						<dd>
							<div class="prd_option_box sel_delivery">



								<a href="javascript:;" class="sel_option">배송지를 선택해주세요</a> <input
									type="hidden" id="dlvpSeqSelect" value=""> <input
									type="hidden" id="strNoSelect" value="">


								<div class="sel_option_fix">
									<ul class="sel_option_list">

									</ul>
									<p class="btn_fix">
										<a href="javascript:;" class="btn_addadr">+ 배송지 추가</a>
									</p>
								</div>
							</div>
						</dd>
					</dl>
				</div>
				<!-- 20191213 s -->

				<dl class="error_boxMod">



					<!-- <dt>현재 일시적으로 서비스가 불가능해요</dt>-->
					<dt></dt>


				</dl>

				<!-- 20191213 e -->
			</div>
			<!--// 배송지 선택 -->



			<h2 class="sub-title2"></h2>
			<table class="tbl_prd_list tableFix">
				<caption>상품정보, 판매가, 수량, 구매가, 배송정보, 선택으로 이루어진 제휴업체 배송상품
					장바구니 목록 표</caption>
				<colgroup>
					<col style="width: 40px">
					<col style="width: *">
					<col style="width: 110px">
					<col style="width: 100px">
					<col style="width: 110px">
					<col style="width: 120px">
					<!-- 2017-01-13 수정 -->
					<col style="width: 150px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><input type="checkbox" id="all" name=""
							value="" title="올리브영 배송상품 전체 선택"></th>
						<th scope="col">상품정보</th>
						<th scope="col">판매가</th>
						<th scope="col">수량</th>
						<th scope="col">구매가</th>
						<th scope="col">선택</th>
						<th scope="col">배송정보</th>
					</tr>
				</thead>
				<tbody>

					<!-- 장바구니 상품 없을 시 -->
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="7" class="no_data">장바구니에 저장된 상품이 없습니다.</td>
							</tr>
				</tbody>
			</table>
			</c:when>
			<c:otherwise>
				<c:set var="salePrice" value="${0}" scope="page" />
				<c:set var="totalPrice" value="${0}" scope="page" />
				<c:forEach items="${ list }" var="bpl">

					<c:set var="totalPrice"
						value="${totalPrice + (bpl.minPrice * bpl.productCnt)}"
						scope="page" />
					<c:set var="salePrice"
						value="${salePrice + (bpl.afterPrice * bpl.productCnt)}"
						scope="page" />
					<tr soldoutyn="N" cno="677745447" goodsno="${bpl.productId }"
						itemno="002" lgcgoodsno="8809643061308" oripno="${bpl.afterPrice }"
						pno="${bpl.afterPrice}" promkndcd="" rsvsaleyn="N" drtpuryn="N"
						dispcatno="" buycondstrtqtyamt="" getcondstrtqtyamt=""
						pkggoodsno="" quickyn="N" strno="" onladltcertyn="N"
						criteo-goods="A000000184129002"
						trackingcd="Cat100000100010008_MID" gatecd="Drawer"
						infnselimpsyn="N">

						<input type="hidden" id="soldout_yn" name="soldout_yn" value="N">

						<td colspan="7">


							<div class="tbl_cont_area">

								<!-- 쿠폰할인 : 즉시할인,상품할인 쿠폰 할인가 적용 -->

								<input type="hidden" id="saleCpnDcPrc" name="saleCpnDcPrc"
									value="22040"> <input type="hidden" id="goodsCpnYn"
									name="goodsCpnYn" value="Y">

								<div class="tbl_cell w40">
									<input type="checkbox" saleprc="23200" orgsaleprc="31000"
										cpndcamt="1160" ordqty="1" rsvstockqty="N" stockqty="208"
										checked="checked" id="inp_prd_chk1" name="s_checkbox"
										soldoutyn="N" value="0" class="chkSmall"
										title="${bpl.productDisplayName }"> <input type="hidden"
										name="s_cart_no" value="677745447"> <input
										type="hidden" name="s_prom_no" value=""> <input
										type="hidden" name="s_buy_cond_strt_qty_amt" value="">
									<input type="hidden" name="s_disp_cat_no" value=""> <input
										type="hidden" name="s_goods_no" value="A000000184129">
									<input type="hidden" name="s_item_no" value="002"> <input
										type="hidden" name="s_cpn_dc_amt" value="1160"> <input
										type="hidden" name="s_org_sale_prc" value="31000"> <input
										type="hidden" name="s_sale_prc" value="23200"> <input
										type="hidden" name="s_drt_pur_yn" value="N"> <input
										type="hidden" name="s_dlex_polc_no" value="1"> <input
										type="hidden" name="s_trade_shp_cd" value="1"> <input
										type="hidden" name="s_entr_no" value="C19275"> <input
										type="hidden" name="s_sum_pkg_yn" value="Y"> <input
										type="hidden" name="s_whsg_expc_dt" value=""> <input
										type="hidden" name="s_dlex_free_yn" value="N">


								</div>
								<div class="tbl_cell w390">
									<div class="prd_info ">

										<a class="prd_img" href="/Black_OY/olive/productDetail.do?goodsNo=${bpl.productDisplayId }&displNum=${bpl.categoryLargeId}${bpl.categoryMidId}"> <img
											data-original="https://image.oliveyoung.co.kr/uploads/images/goods/220/10/0000/0018/A00000018412902ko.jpg?l=ko"
											class="completed-seq-lazyload" alt="상품이미지"
											onerror="common.errorImg(this);" src="${bpl.productDisplaySrc }">
										</a>
										<!-- 
											셀링포인트영역 셋팅시작
											프로모션시작일자,프로모션종료일자가있거나 셀링텍스트가 잇으면 해당영역보여줌.
										-->






										<a class="prd_name" href="/Black_OY/olive/productDetail.do?goodsNo=${bpl.productDisplayId }&displNum=${bpl.categoryLargeId}${bpl.categoryMidId}"> <span class="tx_sale_info">
										</span> <!-- 브랜드명 및 할인정보 --> <span id="brandNm">${bpl.brandName }
										</span>
											<p id="goodsNm">${bpl.productDisplayName }</p>
										</a>
										<p class="prd_opt">

											<i class="tit">옵션</i><span>${bpl.productName }</span>

											<button type="button" class="change"
												data-ref-goodsno="A000000184129" data-ref-itemno="002">옵션변경</button>


										</p>
										<p class="prd_flag">
											<c:if test="${bpl.discountflag eq 1}">
												<span class="icon_flag sale">세일</span>
											</c:if>
											<c:if test="${bpl.couponflag eq 1}">
												<span class="icon_flag coupon">쿠폰</span>
											</c:if>
											<c:if test="${bpl.presentflag eq 1 }">
												<span class="icon_flag gift">증정</span>
											</c:if>
											<c:if test="${bpl.todayPickupflag > 0}">
												<span class="icon_flag delivery">오늘드림</span>
											</c:if>

										</p>
									</div>
								</div>
								<div class="tbl_cell w110">


									<span class="cur_price"><span class="tx_num">${bpl.minPrice }</span>원</span>

								</div>
								<div class="tbl_cell w100">
									<div class="prd_cnt">



										<select class="amount" name="s_amount" prdtp="1" prdcnt="0"
											ordpsbminqty="1" ordpsbmaxqty="999" qtyaddunit="1" ordqty="1"
											title="상품 수량 선택">

											<c:forEach var="value" begin="1" end="10">
												<option value="${value}"
													<c:if test="${value == bpl.productCnt}">selected</c:if>>${value}</option>
											</c:forEach>
											<option value="10+">10+</option>

										</select>


									</div>



									<button type="button" class="btnSmall wGray"
										style="display: none;" name="btnQtyMod">
										<span>변경</span>
									</button>


								</div>
								<div class="tbl_cell w110">


									<span class="org_price"> <span class="tx_num">${bpl.minPrice * bpl.productCnt}</span>원

									</span> <span class="pur_price"><span class="tx_num">${bpl.afterPrice * bpl.productCnt}</span>원</span>

								</div>

								<div class="tbl_cell w120  ">
									<!-- 합배송, 배송 예정 class / sum   delay추가 하기 -->


									<p class="prd_delivery">
										<strong id="deliStrongText">무료배송<span class="ex">도서·산간
												제외</span></strong>

									</p>

								</div>
								<!--// 2017-01-13 수정 -->

								<!-- 쇼핑찜 설정 -->


								<div class="tbl_cell w150">
									<div class="btn_group">


										<button id="677745447|A000000184129|002" type="button"
											class="btnSmall wGreen" name="btn_buy"
											data-attr="장바구니^장바구니바로구매^바로구매">
											<span data-attr="장바구니^장바구니바로구매^바로구매">바로구매</span>
										</button>
										<!-- 3440969_PM작업시 오늘드림 레이어 팝업 노출 요청 건 - obj인계 불가능에 따른 고유 ID 선언(즉시 구매 시, find로 찾기 위함) -->

										<button type="button" class="btnSmall wGray zzim "
											name="btnZzim" zim-on-off="" data-ref-goodsno="A000000184129">
											<span>쇼핑찜<span class="oyblind">해제됨</span></span>
										</button>
										<button type="button" class="btnSmall wGray delete"
											name="btnDelete" data-attr="장바구니^장바구니상품삭제^삭제">
											<span data-attr="장바구니^장바구니상품삭제^삭제">삭제</span>
										</button>
										<!-- 버튼 공간(스페이스바)없이 붙여주세요. -->


									</div>
								</div>

							</div> <!-- input type="text" name="test1" value = "Y" />
										<input type="text" name="test2" value = "N" />
										<input type="text" name="test3" value = "20" />
										<input type="text" name="test4" value = "10" />
										<input type="text" name="test5" value = "20" />
										<input type="text" name="test6" value = "208" />
										<input type="text" name="test7" value = "N" />
										<input type="text" name="test8" value = "208" />
										<input type="text" name="test9" value = "N" />
										<input type="text" name="test9" value = "1" /> -->


							<div class="curation_box"
								id="curation_area_8809643061308_A000000184129_002">
								<div class="loading_box">
									<span class="icon"><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/pc_loading.gif"
										alt="로딩중"></span>
									<p class="txt">고객님을 위한 상품 추천중이에요</p>
								</div>
							</div>

						</td>
					</tr>
				</c:forEach>
				</tbody>
				</table>

				<div class="basket_price_info">
					<div class="btn_area">
						<button type="button" class="btnSmall wGray type2"
							id="partDelBtn1" name="partDelBtn">
							<span>선택상품 삭제</span>
						</button>
						<button type="button" class="btnSmall wGray type2"
							id="soldOutDelBtn1" name="soldOutDelBtn">
							<span>품절상품 삭제</span>
						</button>
					</div>
					<div class="sum_price">
						총 판매가 <span class="tx_num originalprice">${totalPrice }</span>원 <span
							class="tx_sign minus">-</span> 총 할인금액 <span
							class="tx_num saleprice">${totalPrice - salePrice }</span>원 <span
							class="tx_sign plus">+</span> 배송비 <span class="tx_num">0</span>원
						<span class="span_quickDeliCharge" style="display: none;">(3!4!,
							미드나잇 이용시)</span><span class="tx_sign equal">=</span> <span
							class="tx_total_price">총 결제금액 <span class="tx_price"><span
								class="tx_num totalprice">${salePrice }</span>원</span></span>
					</div>
				</div>
				<div class="total_price_info">
					<div class="detail_price">
						<p>
							총 판매가<span><span class="tx_num originalprice">${totalPrice }</span>원</span>
						</p>
						<span class="tx_sign2 minus">-</span>
						<p class="tx_sale">
							총 할인금액<span><span class="tx_num saleprice">${totalPrice - salePrice }</span>원</span>
						</p>
						<span class="tx_sign2 plus">+</span>
						<p>
							배송비 <span><span class="tx_num">0</span>원</span>
						</p>
					</div>
					<div class="sum_price">


						<span class="tx_text">배송비는 쿠폰할인금액에 따라 변경될 수 있습니다.</span> 총 결제예상금액
						<span class="span_quickDeliCharge" style="display: none;">최소</span><span
							class="tx_price"><span class="tx_num totalprice">${salePrice }</span>원</span>
					</div>
				</div>

				<div class="order_btn_area order_cart">
					<button type="button" class="btnOrangeW" name="partOrderBtn"
						data-attr="장바구니^주문유형^선택주문">선택주문(1)</button>
					<button type="button" class="btnOrange" name="allOrderBtn"
						data-attr="장바구니^주문유형^전체주문">전체주문</button>
				</div>

				<div class="basket_btmBox" id="curation_area_a015">

					<h4 class="tit_h4">
						함께 구매하면 좋은 추천 상품이에요
						<button class="moreBtn" id="crt_more_a015">
							<span>더보기</span>
						</button>
					</h4>
					<div class="inner_cont" id="curation_area_inner_a015"
						role="toolbar">
						<ul class="curation_basket slide_list slick_slider" id="curation_ul_a015">

								
									<c:forEach items="${pdList }" var="pl">
								
									<li data-wlog_type="normal">
										<div class="thum" data-ref-goodsno="A000000175878"
											data-egrank="1" data-egcode="a015_a015"
											data-attr="장바구니^추천상품^[대용량] 파티온 노스카나인 트러블 세럼 단독 기획(50ml+15ml)"
											data-impression="null"
											data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천상품_상품상세&amp;t_number=1"
											data-ref-dispcatno="" data-ref-itemno="001">
											<span class="thumb_flag best">베스트</span><img
												src="${pl.displImgSrc }"
												alt="[대용량] 파티온 노스카나인 트러블 세럼 단독 기획(50ml+15ml)"
												onerror="common.errorImg(this);">
											<div class="my">
												<button type="button" class="myCart cartBtnRecoBell"
													data-ref-goodsno="A000000175878" data-ref-dispcatno=""
													data-ref-itemno="001" tabindex="0">
													<span>장바구니</span>
												</button>
												<button type="button" class="mySee btn_zzim"
													data-ref-goodsno="A000000175878" tabindex="0">
													<span>찜하기전</span>
												</button>
											</div>
										</div>
										<div class="info">
											<a
												href="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000175878&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;1&quot;);common.wlog(&quot;cart_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000175878&quot;, &quot;&quot;,&quot;cart_normal&quot;,&quot;pc_cart_02_a&quot;, &quot;a015_a015&quot;, &quot;1&quot;, &quot;Basket_Curation2&quot;, &quot;t_page=장바구니&amp;t_click=함께구매추천상품_상품상세&amp;t_number=1&quot;);"
												class="a_detail" data-ref-goodsno="A000000175878"
												data-egrank="1" data-egcode="a015_a015"
												data-attr="장바구니^추천상품^[대용량] 파티온 노스카나인 트러블 세럼 단독 기획(50ml+15ml)"
												data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천상품_상품상세&amp;t_number=1"
												data-ref-dispcatno="" data-ref-itemno="001" tabindex="0"><dl>
													<dt class="tit">${pl.displProName} </dt>
													<dd class="price">
														<del>3${pl.proPrice}원</del>
														<strong>${pl.afterPrice }원</strong>
													</dd>
													<dd class="icon">
													<c:if test="${pl.pdc eq 1 }">
																				<span class="icon_flag sale">세일</span>
																			</c:if>
																			<c:if test="${pl.prc eq 1 }">
																			<span class="icon_flag coupon">쿠폰</span>
																			</c:if>
																			<c:if test="${pl.pmp eq 1 }">
																				<span class="icon_flag gift">증정</span>
																			</c:if>
																			<c:if test="${pl.stock eq 1}">
																					<span class="icon_flag delivery">오늘드림</span>
																			</c:if>
														
													</dd>
												</dl></a>
										</div>

									</li>
									</c:forEach>
						</ul>
					</div>

				</div>

				<div class="cart_comment">
					<p>장바구니 상품은 90일동안, 판매종료 된 상품은 10일동안 보관됩니다.</p>
				</div>

			</c:otherwise>
			</c:choose>






		</div>

	</div>

	
	
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script >

$('#curation_ul_a015').slick({
	slide: 'li',
	dots: true,
	arrows: true,
	infinite: true,
	speed: 500,
	slidesToShow: 3,
	slidesToScroll: 3,
	draggable: true,
	dotsClass : "slick-dots"
});
</script>
	
	
	<div class="layer_pop_wrap" id="crtPopWrap"
		style="top: 1%; width: 849px; display: none; left: 50%; margin-left: -424.5px; margin-top: 782px;">
		<script
			src="https://static.oliveyoung.co.kr/pc-static-root/js/store/jquery.mCustomScrollbar.concat.min.js"></script>
		<style media=""
			data-href="https://static.oliveyoung.co.kr/pc-static-root/css/jquery.mCustomScrollbar.css">/*# sourceURL=https://static.oliveyoung.co.kr/pc-static-root/css/jquery.mCustomScrollbar.css */
/*@ sourceURL=https://static.oliveyoung.co.kr/pc-static-root/css/jquery.mCustomScrollbar.css */
/*
== malihu jquery custom scrollbar plugin ==
Plugin URI: http://manos.malihu.gr/jquery-custom-content-scroller
*/

/*
CONTENTS:
	1. BASIC STYLE - Plugin's basic/essential CSS properties (normally, should not be edited).
	2. VERTICAL SCROLLBAR - Positioning and dimensions of vertical scrollbar.
	3. HORIZONTAL SCROLLBAR - Positioning and dimensions of horizontal scrollbar.
	4. VERTICAL AND HORIZONTAL SCROLLBARS - Positioning and dimensions of 2-axis scrollbars.
	5. TRANSITIONS - CSS3 transitions for hover events, auto-expanded and auto-hidden scrollbars.
	6. SCROLLBAR COLORS, OPACITY AND BACKGROUNDS
		6.1 THEMES - Scrollbar colors, opacity, dimensions, backgrounds etc. via ready-to-use themes.
*/

/*
------------------------------------------------------------------------------------------------------------------------
1. BASIC STYLE
------------------------------------------------------------------------------------------------------------------------
*/
.mCustomScrollbar {
	-ms-touch-action: pinch-zoom;
	touch-action: pinch-zoom; /* direct pointer events to js */
}

.mCustomScrollbar.mCS_no_scrollbar, .mCustomScrollbar.mCS_touch_action {
	-ms-touch-action: auto;
	touch-action: auto;
}

.mCustomScrollBox { /* contains plugin's markup */
	position: relative;
	overflow: hidden;
	height: 100%;
	max-width: 100%;
	outline: none;
	direction: ltr;
}

.mCSB_container { /* contains the original content */
	overflow: hidden;
	width: auto;
	height: auto;
}

/*
------------------------------------------------------------------------------------------------------------------------
2. VERTICAL SCROLLBAR
y-axis
------------------------------------------------------------------------------------------------------------------------
*/
.mCSB_inside>.mCSB_container {
	margin-right: 15px;
}

.mCSB_container.mCS_no_scrollbar_y.mCS_y_hidden {
	margin-right: 0;
} /* non-visible scrollbar */
.mCS-dir-rtl>.mCSB_inside>.mCSB_container {
	/* RTL direction/left-side scrollbar */
	margin-right: 0;
	margin-left: 30px;
}

.mCS-dir-rtl>.mCSB_inside>.mCSB_container.mCS_no_scrollbar_y.mCS_y_hidden
	{
	margin-left: 0;
} /* RTL direction/left-side scrollbar */
.mCSB_scrollTools {
	/* contains scrollbar markup (draggable element, dragger rail, buttons etc.) */
	position: absolute;
	width: 16px;
	height: auto;
	left: auto;
	top: 0;
	right: 0;
	bottom: 0;
}

.mCSB_outside+.mCSB_scrollTools {
	right: -26px;
} /* scrollbar position: outside */
.mCS-dir-rtl>.mCSB_inside>.mCSB_scrollTools, .mCS-dir-rtl>.mCSB_outside+.mCSB_scrollTools
	{ /* RTL direction/left-side scrollbar */
	right: auto;
	left: 0;
}

.mCS-dir-rtl>.mCSB_outside+.mCSB_scrollTools {
	left: -26px;
} /* RTL direction/left-side scrollbar (scrollbar position: outside) */
.mCSB_scrollTools .mCSB_draggerContainer {
	/* contains the draggable element and dragger rail markup */
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	height: auto;
}

.mCSB_scrollTools a+.mCSB_draggerContainer {
	margin: 20px 0;
}

.mCSB_scrollTools .mCSB_draggerRail {
	width: 2px;
	height: 100%;
	margin: 0 auto;
	-webkit-border-radius: 16px;
	-moz-border-radius: 16px;
	border-radius: 16px;
}

.mCSB_scrollTools .mCSB_dragger { /* the draggable element */
	cursor: pointer;
	width: 100%;
	height: 30px; /* minimum dragger height */
	z-index: 1;
}

.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	/* the dragger element */
	position: relative;
	width: 4px;
	height: 100%;
	margin: 0 auto;
	-webkit-border-radius: 16px;
	-moz-border-radius: 16px;
	border-radius: 16px;
	text-align: center;
}

.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar,
	.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar
	{
	width: 12px; /* auto-expanded scrollbar */
}

.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded+.mCSB_draggerRail,
	.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail
	{
	width: 8px; /* auto-expanded scrollbar */
}

.mCSB_scrollTools .mCSB_buttonUp, .mCSB_scrollTools .mCSB_buttonDown {
	display: block;
	position: absolute;
	height: 20px;
	width: 100%;
	overflow: hidden;
	margin: 0 auto;
	cursor: pointer;
}

.mCSB_scrollTools .mCSB_buttonDown {
	bottom: 0;
}

/*
------------------------------------------------------------------------------------------------------------------------
3. HORIZONTAL SCROLLBAR
x-axis
------------------------------------------------------------------------------------------------------------------------
*/
.mCSB_horizontal.mCSB_inside>.mCSB_container {
	margin-right: 0;
	margin-bottom: 30px;
}

.mCSB_horizontal.mCSB_outside>.mCSB_container {
	min-height: 100%;
}

.mCSB_horizontal>.mCSB_container.mCS_no_scrollbar_x.mCS_x_hidden {
	margin-bottom: 0;
} /* non-visible scrollbar */
.mCSB_scrollTools.mCSB_scrollTools_horizontal {
	width: auto;
	height: 16px;
	top: auto;
	right: 0;
	bottom: 0;
	left: 0;
}

.mCustomScrollBox+.mCSB_scrollTools.mCSB_scrollTools_horizontal,
	.mCustomScrollBox+.mCSB_scrollTools+.mCSB_scrollTools.mCSB_scrollTools_horizontal
	{
	bottom: -26px;
} /* scrollbar position: outside */
.mCSB_scrollTools.mCSB_scrollTools_horizontal a+.mCSB_draggerContainer {
	margin: 0 20px;
}

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_draggerRail {
	width: 100%;
	height: 2px;
	margin: 7px 0;
}

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_dragger {
	width: 30px; /* minimum dragger width */
	height: 100%;
	left: 0;
}

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar
	{
	width: 100%;
	height: 4px;
	margin: 6px auto;
}

.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar,
	.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar
	{
	height: 12px; /* auto-expanded scrollbar */
	margin: 2px auto;
}

.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded+.mCSB_draggerRail,
	.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail
	{
	height: 8px; /* auto-expanded scrollbar */
	margin: 4px 0;
}

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_buttonLeft,
	.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_buttonRight {
	display: block;
	position: absolute;
	width: 20px;
	height: 100%;
	overflow: hidden;
	margin: 0 auto;
	cursor: pointer;
}

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_buttonLeft {
	left: 0;
}

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_buttonRight {
	right: 0;
}

/*
------------------------------------------------------------------------------------------------------------------------
4. VERTICAL AND HORIZONTAL SCROLLBARS
yx-axis
------------------------------------------------------------------------------------------------------------------------
*/
.mCSB_container_wrapper {
	position: absolute;
	height: auto;
	width: auto;
	overflow: hidden;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	margin-right: 30px;
	margin-bottom: 30px;
}

.mCSB_container_wrapper>.mCSB_container {
	padding-right: 30px;
	padding-bottom: 30px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.mCSB_vertical_horizontal>.mCSB_scrollTools.mCSB_scrollTools_vertical {
	bottom: 20px;
}

.mCSB_vertical_horizontal>.mCSB_scrollTools.mCSB_scrollTools_horizontal
	{
	right: 20px;
}

/* non-visible horizontal scrollbar */
.mCSB_container_wrapper.mCS_no_scrollbar_x.mCS_x_hidden+.mCSB_scrollTools.mCSB_scrollTools_vertical
	{
	bottom: 0;
}

/* non-visible vertical scrollbar/RTL direction/left-side scrollbar */
.mCSB_container_wrapper.mCS_no_scrollbar_y.mCS_y_hidden+.mCSB_scrollTools 
	~ .mCSB_scrollTools.mCSB_scrollTools_horizontal, .mCS-dir-rtl>.mCustomScrollBox.mCSB_vertical_horizontal.mCSB_inside>.mCSB_scrollTools.mCSB_scrollTools_horizontal
	{
	right: 0;
}

/* RTL direction/left-side scrollbar */
.mCS-dir-rtl>.mCustomScrollBox.mCSB_vertical_horizontal.mCSB_inside>.mCSB_scrollTools.mCSB_scrollTools_horizontal
	{
	left: 20px;
}

/* non-visible scrollbar/RTL direction/left-side scrollbar */
.mCS-dir-rtl>.mCustomScrollBox.mCSB_vertical_horizontal.mCSB_inside>.mCSB_container_wrapper.mCS_no_scrollbar_y.mCS_y_hidden+.mCSB_scrollTools 
	~ .mCSB_scrollTools.mCSB_scrollTools_horizontal {
	left: 0;
}

.mCS-dir-rtl>.mCSB_inside>.mCSB_container_wrapper {
	/* RTL direction/left-side scrollbar */
	margin-right: 0;
	margin-left: 30px;
}

.mCSB_container_wrapper.mCS_no_scrollbar_y.mCS_y_hidden>.mCSB_container
	{
	padding-right: 0;
}

.mCSB_container_wrapper.mCS_no_scrollbar_x.mCS_x_hidden>.mCSB_container
	{
	padding-bottom: 0;
}

.mCustomScrollBox.mCSB_vertical_horizontal.mCSB_inside>.mCSB_container_wrapper.mCS_no_scrollbar_y.mCS_y_hidden
	{
	margin-right: 0; /* non-visible scrollbar */
	margin-left: 0;
}

/* non-visible horizontal scrollbar */
.mCustomScrollBox.mCSB_vertical_horizontal.mCSB_inside>.mCSB_container_wrapper.mCS_no_scrollbar_x.mCS_x_hidden
	{
	margin-bottom: 0;
}

/*
------------------------------------------------------------------------------------------------------------------------
5. TRANSITIONS
------------------------------------------------------------------------------------------------------------------------
*/
.mCSB_scrollTools, .mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCSB_scrollTools .mCSB_buttonUp, .mCSB_scrollTools .mCSB_buttonDown,
	.mCSB_scrollTools .mCSB_buttonLeft, .mCSB_scrollTools .mCSB_buttonRight
	{
	-webkit-transition: opacity .2s ease-in-out, background-color .2s
		ease-in-out;
	-moz-transition: opacity .2s ease-in-out, background-color .2s
		ease-in-out;
	-o-transition: opacity .2s ease-in-out, background-color .2s ease-in-out;
	transition: opacity .2s ease-in-out, background-color .2s ease-in-out;
}

.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger_bar,
	/* auto-expanded scrollbar */ .mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerRail,
	.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger_bar,
	.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerRail
	{
	-webkit-transition: width .2s ease-out .2s, height .2s ease-out .2s,
		margin-left .2s ease-out .2s, margin-right .2s ease-out .2s,
		margin-top .2s ease-out .2s, margin-bottom .2s ease-out .2s, opacity
		.2s ease-in-out, background-color .2s ease-in-out;
	-moz-transition: width .2s ease-out .2s, height .2s ease-out .2s,
		margin-left .2s ease-out .2s, margin-right .2s ease-out .2s,
		margin-top .2s ease-out .2s, margin-bottom .2s ease-out .2s, opacity
		.2s ease-in-out, background-color .2s ease-in-out;
	-o-transition: width .2s ease-out .2s, height .2s ease-out .2s,
		margin-left .2s ease-out .2s, margin-right .2s ease-out .2s,
		margin-top .2s ease-out .2s, margin-bottom .2s ease-out .2s, opacity
		.2s ease-in-out, background-color .2s ease-in-out;
	transition: width .2s ease-out .2s, height .2s ease-out .2s, margin-left
		.2s ease-out .2s, margin-right .2s ease-out .2s, margin-top .2s
		ease-out .2s, margin-bottom .2s ease-out .2s, opacity .2s ease-in-out,
		background-color .2s ease-in-out;
}

/*
------------------------------------------------------------------------------------------------------------------------
6. SCROLLBAR COLORS, OPACITY AND BACKGROUNDS
------------------------------------------------------------------------------------------------------------------------
*/

/*
	----------------------------------------
	6.1 THEMES
	----------------------------------------
	*/

/* default theme ("light") */
.mCSB_scrollTools {
	opacity: 0.75;
	filter: "alpha(opacity=75)";
	-ms-filter: "alpha(opacity=75)";
}

.mCS-autoHide>.mCustomScrollBox>.mCSB_scrollTools, .mCS-autoHide>.mCustomScrollBox 
	~ .mCSB_scrollTools {
	opacity: 1;
	filter: "alpha(opacity=0)";
	-ms-filter: "alpha(opacity=0)";
}

.mCustomScrollbar>.mCustomScrollBox>.mCSB_scrollTools.mCSB_scrollTools_onDrag,
	.mCustomScrollbar>.mCustomScrollBox ~ .mCSB_scrollTools.mCSB_scrollTools_onDrag,
	.mCustomScrollBox:hover>.mCSB_scrollTools, .mCustomScrollBox:hover ~
	.mCSB_scrollTools, .mCS-autoHide:hover>.mCustomScrollBox>.mCSB_scrollTools,
	.mCS-autoHide:hover>.mCustomScrollBox ~ .mCSB_scrollTools {
	opacity: 1;
	filter: "alpha(opacity=100)";
	-ms-filter: "alpha(opacity=100)";
}

.mCSB_scrollTools .mCSB_draggerRail {
	
}

.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-color: #b7b7b7;
}

.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar {
	background-color: #b7b7b7;
}

.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar {
	
}

.mCSB_scrollTools .mCSB_buttonUp, .mCSB_scrollTools .mCSB_buttonDown,
	.mCSB_scrollTools .mCSB_buttonLeft, .mCSB_scrollTools .mCSB_buttonRight
	{
	background-image:
		url("https://static.oliveyoung.co.kr/pc-static-root/css/mCSB_buttons.png");
	/* css sprites */
	background-repeat: no-repeat;
	opacity: 0.4;
	filter: "alpha(opacity=40)";
	-ms-filter: "alpha(opacity=40)";
}

.mCSB_scrollTools .mCSB_buttonUp {
	background-position: 0 0;
	/*
		sprites locations
		light: 0 0, -16px 0, -32px 0, -48px 0, 0 -72px, -16px -72px, -32px -72px
		dark: -80px 0, -96px 0, -112px 0, -128px 0, -80px -72px, -96px -72px, -112px -72px
		*/
}

.mCSB_scrollTools .mCSB_buttonDown {
	background-position: 0 -20px;
	/*
		sprites locations
		light: 0 -20px, -16px -20px, -32px -20px, -48px -20px, 0 -92px, -16px -92px, -32px -92px
		dark: -80px -20px, -96px -20px, -112px -20px, -128px -20px, -80px -92px, -96px -92px, -112 -92px
		*/
}

.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: 0 -40px;
	/*
		sprites locations
		light: 0 -40px, -20px -40px, -40px -40px, -60px -40px, 0 -112px, -20px -112px, -40px -112px
		dark: -80px -40px, -100px -40px, -120px -40px, -140px -40px, -80px -112px, -100px -112px, -120px -112px
		*/
}

.mCSB_scrollTools .mCSB_buttonRight {
	background-position: 0 -56px;
	/*
		sprites locations
		light: 0 -56px, -20px -56px, -40px -56px, -60px -56px, 0 -128px, -20px -128px, -40px -128px
		dark: -80px -56px, -100px -56px, -120px -56px, -140px -56px, -80px -128px, -100px -128px, -120px -128px
		*/
}

.mCSB_scrollTools .mCSB_buttonUp:hover, .mCSB_scrollTools .mCSB_buttonDown:hover,
	.mCSB_scrollTools .mCSB_buttonLeft:hover, .mCSB_scrollTools .mCSB_buttonRight:hover
	{
	opacity: 0.75;
	filter: "alpha(opacity=75)";
	-ms-filter: "alpha(opacity=75)";
}

.mCSB_scrollTools .mCSB_buttonUp:active, .mCSB_scrollTools .mCSB_buttonDown:active,
	.mCSB_scrollTools .mCSB_buttonLeft:active, .mCSB_scrollTools .mCSB_buttonRight:active
	{
	opacity: 0.9;
	filter: "alpha(opacity=90)";
	-ms-filter: "alpha(opacity=90)";
}

/* theme: "dark" */
.mCS-dark.mCSB_scrollTools .mCSB_draggerRail {
	
}

.mCS-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.75);
}

.mCS-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar {
	background-color: rgba(0, 0, 0, 0.85);
}

.mCS-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: rgba(0, 0, 0, 0.9);
}

.mCS-dark.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -80px 0;
}

.mCS-dark.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -80px -20px;
}

.mCS-dark.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -80px -40px;
}

.mCS-dark.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -80px -56px;
}

/* ---------------------------------------- */

/* theme: "light-2", "dark-2" */
.mCS-light-2.mCSB_scrollTools .mCSB_draggerRail, .mCS-dark-2.mCSB_scrollTools .mCSB_draggerRail
	{
	width: 4px;
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.1);
	-webkit-border-radius: 1px;
	-moz-border-radius: 1px;
	border-radius: 1px;
}

.mCS-light-2.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-dark-2.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	width: 4px;
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.75);
	-webkit-border-radius: 1px;
	-moz-border-radius: 1px;
	border-radius: 1px;
}

.mCS-light-2.mCSB_scrollTools_horizontal .mCSB_draggerRail, .mCS-dark-2.mCSB_scrollTools_horizontal .mCSB_draggerRail,
	.mCS-light-2.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-dark-2.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar
	{
	width: 100%;
	height: 4px;
	margin: 6px auto;
}

.mCS-light-2.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar {
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.85);
}

.mCS-light-2.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-light-2.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.9);
}

.mCS-light-2.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -32px 0;
}

.mCS-light-2.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -32px -20px;
}

.mCS-light-2.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -40px -40px;
}

.mCS-light-2.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -40px -56px;
}

/* theme: "dark-2" */
.mCS-dark-2.mCSB_scrollTools .mCSB_draggerRail {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.1);
	-webkit-border-radius: 1px;
	-moz-border-radius: 1px;
	border-radius: 1px;
}

.mCS-dark-2.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.75);
	-webkit-border-radius: 1px;
	-moz-border-radius: 1px;
	border-radius: 1px;
}

.mCS-dark-2.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.85);
}

.mCS-dark-2.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-dark-2.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.9);
}

.mCS-dark-2.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -112px 0;
}

.mCS-dark-2.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -112px -20px;
}

.mCS-dark-2.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -120px -40px;
}

.mCS-dark-2.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -120px -56px;
}

/* ---------------------------------------- */

/* theme: "light-thick", "dark-thick" */
.mCS-light-thick.mCSB_scrollTools .mCSB_draggerRail, .mCS-dark-thick.mCSB_scrollTools .mCSB_draggerRail
	{
	width: 4px;
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.1);
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}

.mCS-light-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-dark-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	width: 6px;
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.75);
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}

.mCS-light-thick.mCSB_scrollTools_horizontal .mCSB_draggerRail,
	.mCS-dark-thick.mCSB_scrollTools_horizontal .mCSB_draggerRail {
	width: 100%;
	height: 4px;
	margin: 6px 0;
}

.mCS-light-thick.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-dark-thick.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar
	{
	width: 100%;
	height: 6px;
	margin: 5px auto;
}

.mCS-light-thick.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar
	{
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.85);
}

.mCS-light-thick.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-light-thick.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.9);
}

.mCS-light-thick.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -16px 0;
}

.mCS-light-thick.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -16px -20px;
}

.mCS-light-thick.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -20px -40px;
}

.mCS-light-thick.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -20px -56px;
}

/* theme: "dark-thick" */
.mCS-dark-thick.mCSB_scrollTools .mCSB_draggerRail {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.1);
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}

.mCS-dark-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.75);
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}

.mCS-dark-thick.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.85);
}

.mCS-dark-thick.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-dark-thick.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.9);
}

.mCS-dark-thick.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -96px 0;
}

.mCS-dark-thick.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -96px -20px;
}

.mCS-dark-thick.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -100px -40px;
}

.mCS-dark-thick.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -100px -56px;
}

/* ---------------------------------------- */

/* theme: "light-thin", "dark-thin" */
.mCS-light-thin.mCSB_scrollTools .mCSB_draggerRail {
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.1);
}

.mCS-light-thin.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-dark-thin.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	width: 2px;
}

.mCS-light-thin.mCSB_scrollTools_horizontal .mCSB_draggerRail,
	.mCS-dark-thin.mCSB_scrollTools_horizontal .mCSB_draggerRail {
	width: 100%;
}

.mCS-light-thin.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-dark-thin.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar
	{
	width: 100%;
	height: 2px;
	margin: 7px auto;
}

/* theme "dark-thin" */
.mCS-dark-thin.mCSB_scrollTools .mCSB_draggerRail {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.15);
}

.mCS-dark-thin.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.75);
}

.mCS-dark-thin.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.85);
}

.mCS-dark-thin.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-dark-thin.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.9);
}

.mCS-dark-thin.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -80px 0;
}

.mCS-dark-thin.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -80px -20px;
}

.mCS-dark-thin.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -80px -40px;
}

.mCS-dark-thin.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -80px -56px;
}

/* ---------------------------------------- */

/* theme "rounded", "rounded-dark", "rounded-dots", "rounded-dots-dark" */
.mCS-rounded.mCSB_scrollTools .mCSB_draggerRail {
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.15);
}

.mCS-rounded.mCSB_scrollTools .mCSB_dragger, .mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger,
	.mCS-rounded-dots.mCSB_scrollTools .mCSB_dragger,
	.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger {
	height: 14px;
}

.mCS-rounded.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-rounded-dots.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar
	{
	width: 14px;
	margin: 0 1px;
}

.mCS-rounded.mCSB_scrollTools_horizontal .mCSB_dragger,
	.mCS-rounded-dark.mCSB_scrollTools_horizontal .mCSB_dragger,
	.mCS-rounded-dots.mCSB_scrollTools_horizontal .mCSB_dragger,
	.mCS-rounded-dots-dark.mCSB_scrollTools_horizontal .mCSB_dragger {
	width: 14px;
}

.mCS-rounded.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-rounded-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-rounded-dots.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-rounded-dots-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar
	{
	height: 14px;
	margin: 1px 0;
}

.mCS-rounded.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar,
	.mCS-rounded.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar,
	.mCS-rounded-dark.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar,
	.mCS-rounded-dark.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar
	{
	width: 16px; /* auto-expanded scrollbar */
	height: 16px;
	margin: -1px 0;
}

.mCS-rounded.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded+.mCSB_draggerRail,
	.mCS-rounded.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail,
	.mCS-rounded-dark.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded+.mCSB_draggerRail,
	.mCS-rounded-dark.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail
	{
	width: 4px; /* auto-expanded scrollbar */
}

.mCS-rounded.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar,
	.mCS-rounded.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar,
	.mCS-rounded-dark.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar,
	.mCS-rounded-dark.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar
	{
	height: 16px; /* auto-expanded scrollbar */
	width: 16px;
	margin: 0 -1px;
}

.mCS-rounded.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded+.mCSB_draggerRail,
	.mCS-rounded.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail,
	.mCS-rounded-dark.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded+.mCSB_draggerRail,
	.mCS-rounded-dark.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail
	{
	height: 4px; /* auto-expanded scrollbar */
	margin: 6px 0;
}

.mCS-rounded.mCSB_scrollTools .mCSB_buttonUp {
	background-position: 0 -72px;
}

.mCS-rounded.mCSB_scrollTools .mCSB_buttonDown {
	background-position: 0 -92px;
}

.mCS-rounded.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: 0 -112px;
}

.mCS-rounded.mCSB_scrollTools .mCSB_buttonRight {
	background-position: 0 -128px;
}

/* theme "rounded-dark", "rounded-dots-dark" */
.mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar
	{
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.75);
}

.mCS-rounded-dark.mCSB_scrollTools .mCSB_draggerRail {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.15);
}

.mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar,
	.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar
	{
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.85);
}

.mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar,
	.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.9);
}

.mCS-rounded-dark.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -80px -72px;
}

.mCS-rounded-dark.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -80px -92px;
}

.mCS-rounded-dark.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -80px -112px;
}

.mCS-rounded-dark.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -80px -128px;
}

/* theme "rounded-dots", "rounded-dots-dark" */
.mCS-rounded-dots.mCSB_scrollTools_vertical .mCSB_draggerRail,
	.mCS-rounded-dots-dark.mCSB_scrollTools_vertical .mCSB_draggerRail {
	width: 4px;
}

.mCS-rounded-dots.mCSB_scrollTools .mCSB_draggerRail,
	.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_draggerRail,
	.mCS-rounded-dots.mCSB_scrollTools_horizontal .mCSB_draggerRail,
	.mCS-rounded-dots-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail {
	background-color: transparent;
	background-position: center;
}

.mCS-rounded-dots.mCSB_scrollTools .mCSB_draggerRail,
	.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_draggerRail {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAANElEQVQYV2NkIAAYiVbw//9/Y6DiM1ANJoyMjGdBbLgJQAX/kU0DKgDLkaQAvxW4HEvQFwCRcxIJK1XznAAAAABJRU5ErkJggg==");
	background-repeat: repeat-y;
	opacity: 0.3;
	filter: "alpha(opacity=30)";
	-ms-filter: "alpha(opacity=30)";
}

.mCS-rounded-dots.mCSB_scrollTools_horizontal .mCSB_draggerRail,
	.mCS-rounded-dots-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail {
	height: 4px;
	margin: 6px 0;
	background-repeat: repeat-x;
}

.mCS-rounded-dots.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -16px -72px;
}

.mCS-rounded-dots.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -16px -92px;
}

.mCS-rounded-dots.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -20px -112px;
}

.mCS-rounded-dots.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -20px -128px;
}

/* theme "rounded-dots-dark" */
.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_draggerRail {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAALElEQVQYV2NkIAAYSVFgDFR8BqrBBEifBbGRTfiPZhpYjiQFBK3A6l6CvgAAE9kGCd1mvgEAAAAASUVORK5CYII=");
}

.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -96px -72px;
}

.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -96px -92px;
}

.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -100px -112px;
}

.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -100px -128px;
}

/* ---------------------------------------- */

/* theme "3d", "3d-dark", "3d-thick", "3d-thick-dark" */
.mCS-3d.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, .mCS-3d-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-repeat: repeat-y;
	background-image: -moz-linear-gradient(left, rgba(255, 255, 255, 0.5) 0%,
		rgba(255, 255, 255, 0) 100%);
	background-image: -webkit-gradient(linear, left top, right top, color-stop(0%, rgba(255,
		255, 255, 0.5)), color-stop(100%, rgba(255, 255, 255, 0)));
	background-image: -webkit-linear-gradient(left, rgba(255, 255, 255, 0.5)
		0%, rgba(255, 255, 255, 0) 100%);
	background-image: -o-linear-gradient(left, rgba(255, 255, 255, 0.5) 0%,
		rgba(255, 255, 255, 0) 100%);
	background-image: -ms-linear-gradient(left, rgba(255, 255, 255, 0.5) 0%,
		rgba(255, 255, 255, 0) 100%);
	background-image: linear-gradient(to right, rgba(255, 255, 255, 0.5) 0%,
		rgba(255, 255, 255, 0) 100%);
}

.mCS-3d.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-thick.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-thick-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar
	{
	background-repeat: repeat-x;
	background-image: -moz-linear-gradient(top, rgba(255, 255, 255, 0.5) 0%,
		rgba(255, 255, 255, 0) 100%);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(255,
		255, 255, 0.5)), color-stop(100%, rgba(255, 255, 255, 0)));
	background-image: -webkit-linear-gradient(top, rgba(255, 255, 255, 0.5)
		0%, rgba(255, 255, 255, 0) 100%);
	background-image: -o-linear-gradient(top, rgba(255, 255, 255, 0.5) 0%,
		rgba(255, 255, 255, 0) 100%);
	background-image: -ms-linear-gradient(top, rgba(255, 255, 255, 0.5) 0%,
		rgba(255, 255, 255, 0) 100%);
	background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.5) 0%,
		rgba(255, 255, 255, 0) 100%);
}

/* theme "3d", "3d-dark" */
.mCS-3d.mCSB_scrollTools_vertical .mCSB_dragger, .mCS-3d-dark.mCSB_scrollTools_vertical .mCSB_dragger
	{
	height: 70px;
}

.mCS-3d.mCSB_scrollTools_horizontal .mCSB_dragger, .mCS-3d-dark.mCSB_scrollTools_horizontal .mCSB_dragger
	{
	width: 70px;
}

.mCS-3d.mCSB_scrollTools, .mCS-3d-dark.mCSB_scrollTools {
	opacity: 1;
	filter: "alpha(opacity=30)";
	-ms-filter: "alpha(opacity=30)";
}

.mCS-3d.mCSB_scrollTools .mCSB_draggerRail, .mCS-3d.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-dark.mCSB_scrollTools .mCSB_draggerRail, .mCS-3d-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar
	{
	-webkit-border-radius: 16px;
	-moz-border-radius: 16px;
	border-radius: 16px;
}

.mCS-3d.mCSB_scrollTools .mCSB_draggerRail, .mCS-3d-dark.mCSB_scrollTools .mCSB_draggerRail
	{
	width: 8px;
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.2);
	box-shadow: inset 1px 0 1px rgba(0, 0, 0, 0.5), inset -1px 0 1px
		rgba(255, 255, 255, 0.2);
}

.mCS-3d.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, .mCS-3d.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar,
	.mCS-3d.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-3d.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar,
	.mCS-3d-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar,
	.mCS-3d-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-3d-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #555;
}

.mCS-3d.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, .mCS-3d-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar
	{
	width: 8px;
}

.mCS-3d.mCSB_scrollTools_horizontal .mCSB_draggerRail, .mCS-3d-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail
	{
	width: 100%;
	height: 8px;
	margin: 4px 0;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.5), inset 0 -1px 1px
		rgba(255, 255, 255, 0.2);
}

.mCS-3d.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar
	{
	width: 100%;
	height: 8px;
	margin: 4px auto;
}

.mCS-3d.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -32px -72px;
}

.mCS-3d.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -32px -92px;
}

.mCS-3d.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -40px -112px;
}

.mCS-3d.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -40px -128px;
}

/* theme "3d-dark" */
.mCS-3d-dark.mCSB_scrollTools .mCSB_draggerRail {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.1);
	box-shadow: inset 1px 0 1px rgba(0, 0, 0, 0.1);
}

.mCS-3d-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail {
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.1);
}

.mCS-3d-dark.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -112px -72px;
}

.mCS-3d-dark.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -112px -92px;
}

.mCS-3d-dark.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -120px -112px;
}

.mCS-3d-dark.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -120px -128px;
}

/* ---------------------------------------- */

/* theme: "3d-thick", "3d-thick-dark" */
.mCS-3d-thick.mCSB_scrollTools, .mCS-3d-thick-dark.mCSB_scrollTools {
	opacity: 1;
	filter: "alpha(opacity=30)";
	-ms-filter: "alpha(opacity=30)";
}

.mCS-3d-thick.mCSB_scrollTools, .mCS-3d-thick-dark.mCSB_scrollTools,
	.mCS-3d-thick.mCSB_scrollTools .mCSB_draggerContainer,
	.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_draggerContainer {
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	border-radius: 7px;
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.mCSB_inside+.mCS-3d-thick.mCSB_scrollTools_vertical, .mCSB_inside+.mCS-3d-thick-dark.mCSB_scrollTools_vertical
	{
	right: 1px;
}

.mCS-3d-thick.mCSB_scrollTools_vertical, .mCS-3d-thick-dark.mCSB_scrollTools_vertical
	{
	box-shadow: inset 1px 0 1px rgba(0, 0, 0, 0.1), inset 0 0 14px
		rgba(0, 0, 0, 0.5);
}

.mCS-3d-thick.mCSB_scrollTools_horizontal, .mCS-3d-thick-dark.mCSB_scrollTools_horizontal
	{
	bottom: 1px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.1), inset 0 0 14px
		rgba(0, 0, 0, 0.5);
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.4);
	width: 12px;
	margin: 2px;
	position: absolute;
	height: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

.mCS-3d-thick.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-thick-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar
	{
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4);
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar,
	.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #555;
}

.mCS-3d-thick.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-thick-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar
	{
	height: 12px;
	width: auto;
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_draggerContainer {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.05);
	box-shadow: inset 1px 1px 16px rgba(0, 0, 0, 0.1);
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_draggerRail {
	background-color: transparent;
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -32px -72px;
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -32px -92px;
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -40px -112px;
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -40px -128px;
}

/* theme: "3d-thick-dark" */
.mCS-3d-thick-dark.mCSB_scrollTools {
	box-shadow: inset 0 0 14px rgba(0, 0, 0, 0.2);
}

.mCS-3d-thick-dark.mCSB_scrollTools_horizontal {
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.1), inset 0 0 14px
		rgba(0, 0, 0, 0.2);
}

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.4), inset -1px 0 0
		rgba(0, 0, 0, 0.2);
}

.mCS-3d-thick-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar
	{
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), inset 0 -1px 0
		rgba(0, 0, 0, 0.2);
}

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar,
	.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #777;
}

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_draggerContainer {
	background-color: #fff;
	background-color: rgba(0, 0, 0, 0.05);
	box-shadow: inset 1px 1px 16px rgba(0, 0, 0, 0.1);
}

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_draggerRail {
	background-color: transparent;
}

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -112px -72px;
}

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -112px -92px;
}

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -120px -112px;
}

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -120px -128px;
}

/* ---------------------------------------- */

/* theme: "minimal", "minimal-dark" */
.mCSB_outside+.mCS-minimal.mCSB_scrollTools_vertical, .mCSB_outside+.mCS-minimal-dark.mCSB_scrollTools_vertical
	{
	right: 0;
	margin: 12px 0;
}

.mCustomScrollBox.mCS-minimal+.mCSB_scrollTools.mCSB_scrollTools_horizontal,
	.mCustomScrollBox.mCS-minimal+.mCSB_scrollTools+.mCSB_scrollTools.mCSB_scrollTools_horizontal,
	.mCustomScrollBox.mCS-minimal-dark+.mCSB_scrollTools.mCSB_scrollTools_horizontal,
	.mCustomScrollBox.mCS-minimal-dark+.mCSB_scrollTools+.mCSB_scrollTools.mCSB_scrollTools_horizontal
	{
	bottom: 0;
	margin: 0 12px;
}

/* RTL direction/left-side scrollbar */
.mCS-dir-rtl>.mCSB_outside+.mCS-minimal.mCSB_scrollTools_vertical,
	.mCS-dir-rtl>.mCSB_outside+.mCS-minimal-dark.mCSB_scrollTools_vertical
	{
	left: 0;
	right: auto;
}

.mCS-minimal.mCSB_scrollTools .mCSB_draggerRail, .mCS-minimal-dark.mCSB_scrollTools .mCSB_draggerRail
	{
	background-color: transparent;
}

.mCS-minimal.mCSB_scrollTools_vertical .mCSB_dragger, .mCS-minimal-dark.mCSB_scrollTools_vertical .mCSB_dragger
	{
	height: 50px;
}

.mCS-minimal.mCSB_scrollTools_horizontal .mCSB_dragger,
	.mCS-minimal-dark.mCSB_scrollTools_horizontal .mCSB_dragger {
	width: 50px;
}

.mCS-minimal.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.2);
	filter: "alpha(opacity=20)";
	-ms-filter: "alpha(opacity=20)";
}

.mCS-minimal.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-minimal.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.5);
	filter: "alpha(opacity=50)";
	-ms-filter: "alpha(opacity=50)";
}

/* theme: "minimal-dark" */
.mCS-minimal-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.2);
	filter: "alpha(opacity=20)";
	-ms-filter: "alpha(opacity=20)";
}

.mCS-minimal-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-minimal-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.5);
	filter: "alpha(opacity=50)";
	-ms-filter: "alpha(opacity=50)";
}

/* ---------------------------------------- */

/* theme "light-3", "dark-3" */
.mCS-light-3.mCSB_scrollTools .mCSB_draggerRail, .mCS-dark-3.mCSB_scrollTools .mCSB_draggerRail
	{
	width: 6px;
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.2);
}

.mCS-light-3.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-dark-3.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	width: 6px;
}

.mCS-light-3.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-dark-3.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-light-3.mCSB_scrollTools_horizontal .mCSB_draggerRail, .mCS-dark-3.mCSB_scrollTools_horizontal .mCSB_draggerRail
	{
	width: 100%;
	height: 6px;
	margin: 5px 0;
}

.mCS-light-3.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded+.mCSB_draggerRail,
	.mCS-light-3.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail,
	.mCS-dark-3.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded+.mCSB_draggerRail,
	.mCS-dark-3.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail
	{
	width: 12px;
}

.mCS-light-3.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded+.mCSB_draggerRail,
	.mCS-light-3.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail,
	.mCS-dark-3.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded+.mCSB_draggerRail,
	.mCS-dark-3.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail
	{
	height: 12px;
	margin: 2px 0;
}

.mCS-light-3.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -32px -72px;
}

.mCS-light-3.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -32px -92px;
}

.mCS-light-3.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -40px -112px;
}

.mCS-light-3.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -40px -128px;
}

/* theme "dark-3" */
.mCS-dark-3.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.75);
}

.mCS-dark-3.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.85);
}

.mCS-dark-3.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-dark-3.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.9);
}

.mCS-dark-3.mCSB_scrollTools .mCSB_draggerRail {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.1);
}

.mCS-dark-3.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -112px -72px;
}

.mCS-dark-3.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -112px -92px;
}

.mCS-dark-3.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -120px -112px;
}

.mCS-dark-3.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -120px -128px;
}

/* ---------------------------------------- */

/* theme "inset", "inset-dark", "inset-2", "inset-2-dark", "inset-3", "inset-3-dark" */
.mCS-inset.mCSB_scrollTools .mCSB_draggerRail, .mCS-inset-dark.mCSB_scrollTools .mCSB_draggerRail,
	.mCS-inset-2.mCSB_scrollTools .mCSB_draggerRail, .mCS-inset-2-dark.mCSB_scrollTools .mCSB_draggerRail,
	.mCS-inset-3.mCSB_scrollTools .mCSB_draggerRail, .mCS-inset-3-dark.mCSB_scrollTools .mCSB_draggerRail
	{
	width: 12px;
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.2);
}

.mCS-inset.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-2.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-2-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-3.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	width: 6px;
	margin: 3px 5px;
	position: absolute;
	height: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

.mCS-inset.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-2.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-2-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-3.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-3-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar
	{
	height: 6px;
	margin: 5px 3px;
	position: absolute;
	width: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

.mCS-inset.mCSB_scrollTools_horizontal .mCSB_draggerRail,
	.mCS-inset-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail,
	.mCS-inset-2.mCSB_scrollTools_horizontal .mCSB_draggerRail,
	.mCS-inset-2-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail,
	.mCS-inset-3.mCSB_scrollTools_horizontal .mCSB_draggerRail,
	.mCS-inset-3-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail {
	width: 100%;
	height: 12px;
	margin: 2px 0;
}

.mCS-inset.mCSB_scrollTools .mCSB_buttonUp, .mCS-inset-2.mCSB_scrollTools .mCSB_buttonUp,
	.mCS-inset-3.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -32px -72px;
}

.mCS-inset.mCSB_scrollTools .mCSB_buttonDown, .mCS-inset-2.mCSB_scrollTools .mCSB_buttonDown,
	.mCS-inset-3.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -32px -92px;
}

.mCS-inset.mCSB_scrollTools .mCSB_buttonLeft, .mCS-inset-2.mCSB_scrollTools .mCSB_buttonLeft,
	.mCS-inset-3.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -40px -112px;
}

.mCS-inset.mCSB_scrollTools .mCSB_buttonRight, .mCS-inset-2.mCSB_scrollTools .mCSB_buttonRight,
	.mCS-inset-3.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -40px -128px;
}

/* theme "inset-dark", "inset-2-dark", "inset-3-dark" */
.mCS-inset-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-2-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,
	.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.75);
}

.mCS-inset-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar,
	.mCS-inset-2-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar,
	.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar
	{
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.85);
}

.mCS-inset-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-inset-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar,
	.mCS-inset-2-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-inset-2-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar,
	.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.9);
}

.mCS-inset-dark.mCSB_scrollTools .mCSB_draggerRail, .mCS-inset-2-dark.mCSB_scrollTools .mCSB_draggerRail,
	.mCS-inset-3-dark.mCSB_scrollTools .mCSB_draggerRail {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.1);
}

.mCS-inset-dark.mCSB_scrollTools .mCSB_buttonUp, .mCS-inset-2-dark.mCSB_scrollTools .mCSB_buttonUp,
	.mCS-inset-3-dark.mCSB_scrollTools .mCSB_buttonUp {
	background-position: -112px -72px;
}

.mCS-inset-dark.mCSB_scrollTools .mCSB_buttonDown, .mCS-inset-2-dark.mCSB_scrollTools .mCSB_buttonDown,
	.mCS-inset-3-dark.mCSB_scrollTools .mCSB_buttonDown {
	background-position: -112px -92px;
}

.mCS-inset-dark.mCSB_scrollTools .mCSB_buttonLeft, .mCS-inset-2-dark.mCSB_scrollTools .mCSB_buttonLeft,
	.mCS-inset-3-dark.mCSB_scrollTools .mCSB_buttonLeft {
	background-position: -120px -112px;
}

.mCS-inset-dark.mCSB_scrollTools .mCSB_buttonRight, .mCS-inset-2-dark.mCSB_scrollTools .mCSB_buttonRight,
	.mCS-inset-3-dark.mCSB_scrollTools .mCSB_buttonRight {
	background-position: -120px -128px;
}

/* theme "inset-2", "inset-2-dark" */
.mCS-inset-2.mCSB_scrollTools .mCSB_draggerRail, .mCS-inset-2-dark.mCSB_scrollTools .mCSB_draggerRail
	{
	background-color: transparent;
	border-width: 1px;
	border-style: solid;
	border-color: #fff;
	border-color: rgba(255, 255, 255, 0.2);
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.mCS-inset-2-dark.mCSB_scrollTools .mCSB_draggerRail {
	border-color: #000;
	border-color: rgba(0, 0, 0, 0.2);
}

/* theme "inset-3", "inset-3-dark" */
.mCS-inset-3.mCSB_scrollTools .mCSB_draggerRail {
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.6);
}

.mCS-inset-3-dark.mCSB_scrollTools .mCSB_draggerRail {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.6);
}

.mCS-inset-3.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.75);
}

.mCS-inset-3.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar {
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.85);
}

.mCS-inset-3.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-inset-3.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.9);
}

.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.75);
}

.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar
	{
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.85);
}

.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
	.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar
	{
	background-color: #fff;
	background-color: rgba(255, 255, 255, 0.9);
}

/* ---------------------------------------- */
</style>
		<div class="layer_cont4 w900">



			<h1 class="layer_title4" id="popTitle">함께 구매하면 좋은 추천 상품이에요</h1>

			<div class="curation_topInfo">
				<div class="topTtl">
					큐레이션<span>${sessionScope.logOn.u_name}님을 위한 추천</span>
					<div class="toolTipArea">
						<a href="javascript:;" class="curation_toolTip"></a>
						<div class="toolTipBox">
							<div class="toolTipInner" id="tooltipTxt">
								고객님과 비슷한 성향의 다른 고객님이<br>함께 많이 구매한 상품이에요
							</div>
						</div>
					</div>
				</div>

				<div class="curation_recomendBox">
					<div>



						<div class="subTtl">프로필 등록하고 맞춤형 추천 받으세요</div>
						<a href="javascript:curation.regProfile();" class="tagBtn">등록</a>



					</div>
				</div>

			</div>

			<div class="curaListBox mCustomScrollbar _mCS_8">
				<div id="mCSB_8"
					class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
					style="max-height: 505px;" tabindex="0">
					<div id="mCSB_8_container" class="mCSB_container"
						style="position: relative; top: 0; left: 0;" dir="ltr">

						<ul class="curaList curation_area" id="curation_ulList_a015">

							<li class="slide_list">

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000189248&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=1&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=1"
										class="item a_detail" data-ref-goodsno="A000000189248"
										data-egrank="1" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[임지연 PICK]바이오힐보 판테셀 리페어시카 크림 50mL+50mL 기획"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=1"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000189248&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;1&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000189248&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;1&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=1&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018924806ko.jpg?l=ko"
											alt="[임지연 PICK]바이오힐보 판테셀 리페어시카 크림 50mL+50mL 기획"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[임지연 PICK]바이오힐보 판테셀 리페어시카 크림 50mL+50mL
												기획</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">57,600</span>원
												~</span><span class="tx_cur"><span class="tx_num">34,500</span>원
												~</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000189248"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000189248" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000184913&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=2&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=2"
										class="item a_detail" data-ref-goodsno="A000000184913"
										data-egrank="2" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[한정기획]바이오더마 하이드라비오 에센스로션 200ml 기획 (+동전마스크 5개입 증정)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=2"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000184913&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;2&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000184913&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;2&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=2&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018491306ko.jpg?l=ko"
											alt="[한정기획]바이오더마 하이드라비오 에센스로션 200ml 기획 (+동전마스크 5개입 증정)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[한정기획]바이오더마 하이드라비오 에센스로션 200ml 기획
												(+동전마스크 5개입 증정)</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">35,000</span>원
											</span><span class="tx_cur"><span class="tx_num">23,900</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag gift">증정</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000184913"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000184913" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>


								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000158309&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=3&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=3"
										class="item a_detail" data-ref-goodsno="A000000158309"
										data-egrank="3" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^믹순 순디 병풀 에센스 100ml"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=3"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000158309&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;3&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000158309&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;3&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=3&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0015/A00000015830907ko.jpg?l=ko"
											alt="믹순 순디 병풀 에센스 100ml" onerror="common.errorImg(this);"
											class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">믹순 순디 병풀 에센스 100ml</p>
										</div>
										<p class="prd_price">
											<span class="tx_cur"><span class="tx_num">32,000</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000158309"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000158309" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>


								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000184128&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=4&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=4"
										class="item a_detail" data-ref-goodsno="A000000184128"
										data-egrank="4" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^에스트라 아토베리어365 크림 80ml 기획 (+하이드로에센스 25ml+무기자차선크림10ml 증정)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=4"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000184128&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;4&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000184128&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;4&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=4&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018412802ko.jpg?l=ko"
											alt="에스트라 아토베리어365 크림 80ml 기획 (+하이드로에센스 25ml+무기자차선크림10ml 증정)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">에스트라 아토베리어365 크림 80ml 기획 (+하이드로에센스
												25ml+무기자차선크림10ml 증정)</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">31,000</span>원
											</span><span class="tx_cur"><span class="tx_num">24,800</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag gift">증정</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000184128"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000184128" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

							</li>

							<li class="slide_list">

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162512&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=5&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=5"
										class="item a_detail" data-ref-goodsno="A000000162512"
										data-egrank="5" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^메디큐브 센텔라스카 연고 15g"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=5"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162512&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;5&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000162512&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;5&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=5&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016251203ko.jpg?l=ko"
											alt="메디큐브 센텔라스카 연고 15g" onerror="common.errorImg(this);"
											class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">메디큐브 센텔라스카 연고 15g</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">21,000</span>원
											</span><span class="tx_cur"><span class="tx_num">16,800</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000162512"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000162512" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000165598&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=6&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=6"
										class="item a_detail" data-ref-goodsno="A000000165598"
										data-egrank="6" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[단독기획] 토리든 다이브인 저분자 히알루론산 수딩크림 더블기획 (100ml+100ml)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=6"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000165598&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;6&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000165598&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;6&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=6&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016559824ko.jpg?l=ko"
											alt="[단독기획] 토리든 다이브인 저분자 히알루론산 수딩크림 더블기획 (100ml+100ml)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[단독기획] 토리든 다이브인 저분자 히알루론산 수딩크림 더블기획
												(100ml+100ml)</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">42,000</span>원
											</span><span class="tx_cur"><span class="tx_num">29,400</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000165598"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000165598" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000158696&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=7&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=7"
										class="item a_detail" data-ref-goodsno="A000000158696"
										data-egrank="7" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^아누아 어성초 80 수분 진정 앰플 30ml"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=7"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000158696&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;7&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000158696&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;7&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=7&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0015/A00000015869607ko.jpg?l=ko"
											alt="아누아 어성초 80 수분 진정 앰플 30ml"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">아누아 어성초 80 수분 진정 앰플 30ml</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">29,000</span>원
											</span><span class="tx_cur"><span class="tx_num">21,500</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000158696"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000158696" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000190206&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=9&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=8"
										class="item a_detail" data-ref-goodsno="A000000190206"
										data-egrank="9" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[NEW]바이오힐보 프로바이오덤 리프팅 크림 50ml 1+1 기획(2310파워팩)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=8"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000190206&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;8&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000190206&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;9&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=8&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019020601ko.jpg?l=ko"
											alt="[NEW]바이오힐보 프로바이오덤 리프팅 크림 50ml 1+1 기획(2310파워팩)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[NEW]바이오힐보 프로바이오덤 리프팅 크림 50ml 1+1
												기획(2310파워팩)</p>
										</div>
										<p class="prd_price">
											<span class="tx_cur"><span class="tx_num">39,000</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag gift">증정</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000190206"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000190206" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

							</li>


							<li class="slide_list">

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000190116&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=12&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=9"
										class="item a_detail" data-ref-goodsno="A000000190116"
										data-egrank="12" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[한정기획] 아이소이 10년간, 1등 잡티세럼 20ml+20ml+15ml 증량 기획"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=9"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000190116&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;9&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000190116&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;12&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=9&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019011612ko.jpg?l=ko"
											alt="[한정기획] 아이소이 10년간, 1등 잡티세럼 20ml+20ml+15ml 증량 기획"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[한정기획] 아이소이 10년간, 1등 잡티세럼
												20ml+20ml+15ml 증량 기획</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">54,000</span>원
											</span><span class="tx_cur"><span class="tx_num">37,800</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000190116"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000190116" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000170867&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=13&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=10"
										class="item a_detail" data-ref-goodsno="A000000170867"
										data-egrank="13" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[단독기획] 아누아 어성초 80 수분 진정 앰플 기획 (30ml+30ml)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=10"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000170867&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;10&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000170867&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;13&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=10&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0017/A00000017086707ko.jpg?l=ko"
											alt="[단독기획] 아누아 어성초 80 수분 진정 앰플 기획 (30ml+30ml)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[단독기획] 아누아 어성초 80 수분 진정 앰플 기획
												(30ml+30ml)</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">46,000</span>원
											</span><span class="tx_cur"><span class="tx_num">33,600</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000170867"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000170867" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>


								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000191650&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=14&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=11"
										class="item a_detail" data-ref-goodsno="A000000191650"
										data-egrank="14" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[심톨 PICK/15ml 추가증정]바이오더마 시카비오 포마드 100ml 더블기획"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=11"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000191650&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;11&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000191650&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;14&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=11&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019165007ko.jpg?l=ko"
											alt="[심톨 PICK/15ml 추가증정]바이오더마 시카비오 포마드 100ml 더블기획"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[심톨 PICK/15ml 추가증정]바이오더마 시카비오 포마드
												100ml 더블기획</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">48,100</span>원
											</span><span class="tx_cur"><span class="tx_num">40,880</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag gift">증정</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000191650"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000191650" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000152093&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=15&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=12"
										class="item a_detail" data-ref-goodsno="A000000152093"
										data-egrank="15" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^아이소이 BR 블레미쉬 케어 업 세럼 더블기획 (20ml+20ml)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=12"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000152093&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;12&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000152093&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;15&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=12&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0015/A00000015209322ko.jpg?l=ko"
											alt="아이소이 BR 블레미쉬 케어 업 세럼 더블기획 (20ml+20ml)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">아이소이 BR 블레미쉬 케어 업 세럼 더블기획 (20ml+20ml)</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">54,000</span>원
											</span><span class="tx_cur"><span class="tx_num">37,800</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000152093"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000152093" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

							</li>

							<li class="slide_list">

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000190824&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=16&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=13"
										class="item a_detail" data-ref-goodsno="A000000190824"
										data-egrank="16" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[박은빈 포카/무인도SOS키트 증정]한율 어린쑥 수분진정크림 55ml+25ml+마스크팩 기획"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=13"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000190824&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;13&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000190824&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;16&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=13&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019082406ko.jpg?l=ko"
											alt="[박은빈 포카/무인도SOS키트 증정]한율 어린쑥 수분진정크림 55ml+25ml+마스크팩 기획"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[박은빈 포카/무인도SOS키트 증정]한율 어린쑥 수분진정크림
												55ml+25ml+마스크팩 기획</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">38,000</span>원
											</span><span class="tx_cur"><span class="tx_num">27,600</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag coupon">쿠폰</span><span
												class="icon_flag gift">증정</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000190824"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000190824" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162323&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=17&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=14"
										class="item a_detail" data-ref-goodsno="A000000162323"
										data-egrank="17" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=14"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162323&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;14&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000162323&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;17&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=14&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016232329ko.jpg?l=ko"
											alt="[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정
												기획</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">43,000</span>원
											</span><span class="tx_cur"><span class="tx_num">34,400</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000162323"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000162323" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000175878&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=18&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=15"
										class="item a_detail" data-ref-goodsno="A000000175878"
										data-egrank="18" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[대용량] 파티온 노스카나인 트러블 세럼 단독 기획(50ml+15ml)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=15"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000175878&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;15&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000175878&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;18&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=15&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0017/A00000017587818ko.jpg?l=ko"
											alt="[대용량] 파티온 노스카나인 트러블 세럼 단독 기획(50ml+15ml)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[대용량] 파티온 노스카나인 트러블 세럼 단독
												기획(50ml+15ml)</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">38,000</span>원
											</span><span class="tx_cur"><span class="tx_num">26,600</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag coupon">쿠폰</span><span
												class="icon_flag gift">증정</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000175878"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000175878" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000166662&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=19&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=16"
										class="item a_detail" data-ref-goodsno="A000000166662"
										data-egrank="19" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[단독기획] 아비브 어성초 에센스 카밍펌프 50ml 리필 기획(+50ml)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=16"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000166662&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;16&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000166662&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;19&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=16&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016666201ko.jpg?l=ko"
											alt="[단독기획] 아비브 어성초 에센스 카밍펌프 50ml 리필 기획(+50ml)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[단독기획] 아비브 어성초 에센스 카밍펌프 50ml 리필
												기획(+50ml)</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">34,000</span>원
											</span><span class="tx_cur"><span class="tx_num">23,800</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000166662"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000166662" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

							</li>

							<li class="slide_list">

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000170869&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=20&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=17"
										class="item a_detail" data-ref-goodsno="A000000170869"
										data-egrank="20" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[단독기획] 아누아 어성초 80 수분 진정 앰플 기획 (30ml+15ml)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=17"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000170869&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;17&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000170869&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;20&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=17&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0017/A00000017086906ko.jpg?l=ko"
											alt="[단독기획] 아누아 어성초 80 수분 진정 앰플 기획 (30ml+15ml)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[단독기획] 아누아 어성초 80 수분 진정 앰플 기획
												(30ml+15ml)</p>
										</div>
										<p class="prd_price">
											<span class="tx_cur"><span class="tx_num">29,000</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000170869"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000170869" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000176103&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=21&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=18"
										class="item a_detail" data-ref-goodsno="A000000176103"
										data-egrank="21" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^아누아 어성초 70 데일리 로션 200ml"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=18"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000176103&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;18&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000176103&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;21&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=18&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0017/A00000017610304ko.jpg?l=ko"
											alt="아누아 어성초 70 데일리 로션 200ml"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">아누아 어성초 70 데일리 로션 200ml</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">28,000</span>원
											</span><span class="tx_cur"><span class="tx_num">21,900</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000176103"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000176103" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000137179&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=22&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=19"
										class="item a_detail" data-ref-goodsno="A000000137179"
										data-egrank="22" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^라운드랩 1025 독도 토너+로션기획 (토너 200ml+로션 200ml)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=19"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000137179&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;19&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000137179&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;22&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=19&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0013/A00000013717922ko.jpg?l=ko"
											alt="라운드랩 1025 독도 토너+로션기획 (토너 200ml+로션 200ml)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">라운드랩 1025 독도 토너+로션기획 (토너 200ml+로션
												200ml)</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">32,000</span>원
											</span><span class="tx_cur"><span class="tx_num">26,000</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000137179"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000137179" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000190958&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=23&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=20"
										class="item a_detail" data-ref-goodsno="A000000190958"
										data-egrank="23" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[NEW] 아비브 부활초 비피다 세럼 퍼밍 드롭 50ml 기획(+부활초 크림 30ml 증정)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=20"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000190958&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;20&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000190958&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;23&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=20&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019095803ko.jpg?l=ko"
											alt="[NEW] 아비브 부활초 비피다 세럼 퍼밍 드롭 50ml 기획(+부활초 크림 30ml 증정)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[NEW] 아비브 부활초 비피다 세럼 퍼밍 드롭 50ml
												기획(+부활초 크림 30ml 증정)</p>
										</div>
										<p class="prd_price">
											<span class="tx_cur"><span class="tx_num">32,000</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000190958"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000190958" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

							</li>

							<li class="slide_list">

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000184129&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=24&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=21"
										class="item a_detail" data-ref-goodsno="A000000184129"
										data-egrank="24" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^에스트라 아토베리어365 로션 150ml 기획 (+하이드로에센스 25ml+무기자차선크림10ml 증정)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=21"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000184129&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;21&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000184129&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;24&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=21&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018412902ko.jpg?l=ko"
											alt="에스트라 아토베리어365 로션 150ml 기획 (+하이드로에센스 25ml+무기자차선크림10ml 증정)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">에스트라 아토베리어365 로션 150ml 기획 (+하이드로에센스
												25ml+무기자차선크림10ml 증정)</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">31,000</span>원
											</span><span class="tx_cur"><span class="tx_num">23,200</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag gift">증정</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000184129"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000184129" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>


								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000103391&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=25&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=22"
										class="item a_detail" data-ref-goodsno="A000000103391"
										data-egrank="25" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^코스알엑스 어드벤스드 스네일 96 뮤신 파워 에센스 100ml"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=22"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000103391&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;22&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000103391&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;25&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=22&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0010/A00000010339102ko.jpg?l=ko"
											alt="코스알엑스 어드벤스드 스네일 96 뮤신 파워 에센스 100ml"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">코스알엑스 어드벤스드 스네일 96 뮤신 파워 에센스 100ml</p>
										</div>
										<p class="prd_price">
											<span class="tx_cur"><span class="tx_num">16,800</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000103391"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000103391" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000182586&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=26&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=23"
										class="item a_detail" data-ref-goodsno="A000000182586"
										data-egrank="26" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[3천만국민크림/탄력리프팅] 닥터지 블랙스네일 크림 50ml+50ml+15ml 기획"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=23"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000182586&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;23&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000182586&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;26&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=23&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018258618ko.jpg?l=ko"
											alt="[3천만국민크림/탄력리프팅] 닥터지 블랙스네일 크림 50ml+50ml+15ml 기획"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[3천만국민크림/탄력리프팅] 닥터지 블랙스네일 크림
												50ml+50ml+15ml 기획</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">33,000</span>원
											</span><span class="tx_cur"><span class="tx_num">29,800</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000182586"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000182586" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>


								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000166590&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=27&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=24"
										class="item a_detail" data-ref-goodsno="A000000166590"
										data-egrank="27" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[NEW] 라운드랩 소나무 진정 시카 앰플 기획 (+진정 크림 10ml 증정)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=24"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000166590&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;24&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000166590&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;27&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=24&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016659010ko.jpg?l=ko"
											alt="[NEW] 라운드랩 소나무 진정 시카 앰플 기획 (+진정 크림 10ml 증정)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[NEW] 라운드랩 소나무 진정 시카 앰플 기획 (+진정 크림
												10ml 증정)</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">24,000</span>원
											</span><span class="tx_cur"><span class="tx_num">19,600</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000166590"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000166590" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

							</li>

							<li class="slide_list">

								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000189261&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=28&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=25"
										class="item a_detail" data-ref-goodsno="A000000189261"
										data-egrank="28" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[단독기획] 토리든 다이브인 저분자 히알루론산 세럼 50ml 리필기획(+리필팩 50ml)"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=25"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000189261&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;25&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000189261&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;28&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=25&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018926111ko.jpg?l=ko"
											alt="[단독기획] 토리든 다이브인 저분자 히알루론산 세럼 50ml 리필기획(+리필팩 50ml)"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[단독기획] 토리든 다이브인 저분자 히알루론산 세럼 50ml
												리필기획(+리필팩 50ml)</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">36,000</span>원
											</span><span class="tx_cur"><span class="tx_num">27,000</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000189261"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000189261" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>


								<div class="box">
									<a
										href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000189837&amp;dispCatNo=90000010001&amp;egcode=a015_a015&amp;egrankcode=29&amp;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=26"
										class="item a_detail" data-ref-goodsno="A000000189837"
										data-egrank="29" data-egcode="a015_a015"
										data-attr="장바구니^추천상품팝업^[흔적미백] 넘버즈인 5번 글루타치온C 흔적 앰플 30ml+30ml 듀오기획"
										data-impression="null"
										data-tracking-param="t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=26"
										onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000189837&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;장바구니_추천상품&quot;, &quot;26&quot;);common.wlog(&quot;cart_curation_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000189837&quot;, &quot;undefined&quot;,&quot;cart_curation_more_prod&quot; , &quot;pc_cart_02_a&quot;,&quot;a015_a015&quot; ,&quot;29&quot; ,&quot;Basket_Curation2_More&quot;,&quot;t_page=장바구니&amp;t_click=함께구매추천_큐레이션_상품상세&amp;t_number=26&quot;); return false;"
										name="Basket_Curation2_More"><span class="thumb_flag best">베스트</span><span
										class="thumImg"><img
											src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018983703ko.jpg?l=ko"
											alt="[흔적미백] 넘버즈인 5번 글루타치온C 흔적 앰플 30ml+30ml 듀오기획"
											onerror="common.errorImg(this);" class="mCS_img_loaded"></span>
									<div class="prd_name">
											<p class="tx_name">[흔적미백] 넘버즈인 5번 글루타치온C 흔적 앰플 30ml+30ml
												듀오기획</p>
										</div>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">46,000</span>원
											</span><span class="tx_cur"><span class="tx_num">32,200</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag delivery">오늘드림</span>
										</p></a>
									<button class="btn_zzim jeem" data-ref-goodsno="A000000189837"
										data-rccode="pc_cart_02_a">
										<span>찜하기전</span>
									</button>
									<button type="button" class="btnbag2"
										onclick="common.gf_regCart(this); return false;"
										data-goods-no="A000000189837" data-item-no="001"
										data-rccode="pc_cart_02_a" data-quick-yn="Y">장바구니 담기</button>

								</div>

							</li>



						</ul>

					</div>
					<div id="mCSB_8_scrollbar_vertical"
						class="mCSB_scrollTools mCSB_8_scrollbar mCS-light mCSB_scrollTools_vertical"
						style="display: block;">
						<div class="mCSB_draggerContainer">
							<div id="mCSB_8_dragger_vertical" class="mCSB_dragger"
								style="position: absolute; min-height: 30px; top: 0px; display: block; height: 114px; max-height: 465px;">
								<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
							</div>
							<div class="mCSB_draggerRail"></div>
						</div>
					</div>
				</div>
			</div>

			<button class="layer_close type4" onclick="closeCrtPopWrap()">창
				닫기</button>
			<input type="hidden" id="recoGoodsYn" value="Y">
			
			<script type="text/javascript">
	$(function() {
		
		
		$(".curaListBox", $("#crtPopWrap")).mCustomScrollbar();
		
		$("#crtPopWrap").find('.curation_toolTip').unbind("click").click(function() {
			$(this).toggleClass('on');
		});

		
			var gtmGoodsNoArr = new Array();
			var gtmItemNoArr = new Array();
			
				gtmGoodsNoArr.push('A000000189248');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000184913');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000158309');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000184128');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000162512');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000165598');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000158696');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000190206');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000190116');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000170867');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000191650');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000152093');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000190824');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000162323');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000175878');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000166662');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000170869');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000176103');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000137179');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000190958');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000184129');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000103391');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000182586');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000166590');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000189261');
				gtmItemNoArr.push('001');
			
				gtmGoodsNoArr.push('A000000189837');
				gtmItemNoArr.push('001');
			
			//gtm.goods.callGoodsGtmInfo(gtmGoodsNoArr, gtmItemNoArr, 'ee-productImpression', '장바구니_추천상품팝업');
		
	});
</script>


		</div>
	</div>
	
	<script>
	
	$(document).on("change", "select.amount", function () {
		let productid = $(this).closest("tr").attr("goodsno");
		let productcnt = $(this).val();
		quickyn = "<%=quickyn%>";
		
			let data = {
				productId: productid,
		        productCnt: productcnt,
		        quickyn: quickyn
		    };
		
		$.ajax({
			url: "/basket/update",
			data:data,
			cache: false,
			
			success:function( response ) {
	              $("#Contents").empty();
	              $("#Contents").append( response );
	          }
	        , error		: function() {
	            alert( '1서버 데이터를 가져오지 못했습니다. 다시 확인하여 주십시오.' );
	        }
		})
	});
	
	function closeCrtPopWrap() {
  		$('#crtPopWrap').hide();
		}
	
	$(function() {
		
		
		$("#crt_more_a015").click(function(){
			$("#crtPopWrap").show();
		})
		
		
		
		// HTML에서 체크박스를 모두 선택합니다.
		const checkboxes = document.querySelectorAll('input[type="checkbox"]');
		let selected = $("input:checkbox:checked").length
		// 체크된 행의 org_price의 총합을 저장할 변수를 초기화합니다.
		let totalPriceSum = 0;
		let salePriceSum = 0;
		let finalPriceSum = 0;
		// 각 체크박스에 대해 이벤트 리스너를 추가합니다.
		
		 const selectAllCheckbox = document.getElementById('all');
        
        // 일반 체크박스들
        //const checkboxes = document.querySelectorAll('.checkbox');
        
        
        

        
		// 전체 선택/해제 체크박스를 클릭했을 때
        selectAllCheckbox.addEventListener('click', function() {
            const isChecked = this.checked;
            
            checkboxes.forEach(checkbox => {
                checkbox.checked = isChecked;
                if (!isChecked) {
                	totalPriceSum =0
                	salePriceSum =0
                	finalPriceSum =0
                	selected = 0
				}else{
					totalPriceSum =${totalPrice}
                	salePriceSum =${salePrice}
                	finalPriceSum =${totalPrice - salePrice}
                	selected = $(".tbl_cell.w40 > input:checkbox:checked").length
				}
                
            });
        });
		
		
		checkboxes.forEach(checkbox => {
		    // 각 체크박스를 초기에 체크합니다.
		    checkbox.checked = true;

		    // 해당 체크박스의 부모 행(<tr>)을 찾습니다.
		    const row = checkbox.closest('tr');
		    if (row) {
		        // org_price의 값을 가져와서 숫자로 변환하여 총합에 추가합니다.
		        const orgPriceElement = row.querySelector('.org_price .tx_num');
		        const purPriceElement = row.querySelector('.pur_price .tx_num');
		        if (orgPriceElement) {
		            const orgPrice = parseInt(orgPriceElement.textContent);
		            const purPrice = parseInt(purPriceElement.textContent);
		            if (!isNaN(orgPrice)) {
		                totalPriceSum += orgPrice;
		                salePriceSum += purPrice;
		            }
		        }
		    }

		    checkbox.addEventListener('change', function() {
		        // 체크박스가 체크되었을 때
		        if (this.checked) {
		            // 해당 체크박스의 부모 행(<tr>)을 찾습니다.
		            
		            const row = this.closest('tr');
		            if (row) {
		                // org_price의 값을 가져와서 숫자로 변환하여 총합에 추가합니다.
		                const orgPriceElement = row.querySelector('.org_price .tx_num');
		                const purPriceElement = row.querySelector('.pur_price .tx_num');
		                if (orgPriceElement) {
		                    const orgPrice = parseInt(orgPriceElement.textContent);
		                    const purPrice = parseInt(purPriceElement.textContent);
		                    if (!isNaN(orgPrice)) {
		                    	selected++;
		                        totalPriceSum += orgPrice;
		                        salePriceSum += purPrice;
		                    }
		                }
		            }
		        } else {
		        	
		            // 체크박스가 체크 해제되었을 때, 총합에서 값을 뺍니다.
		            const row = this.closest('tr');
		            if (row) {
		                const orgPriceElement = row.querySelector('.org_price .tx_num');
		                const purPriceElement = row.querySelector('.pur_price .tx_num');
		                if (orgPriceElement) {
		                    const orgPrice = parseInt(orgPriceElement.textContent);
		                    const purPrice = parseInt(purPriceElement.textContent);
		                    if (!isNaN(orgPrice)) {
		                    	selected--;
		                        totalPriceSum -= orgPrice;
		                        salePriceSum -= purPrice;
		                    }
		                }
		            }
		        }
		        finalPriceSum = totalPriceSum - salePriceSum;
		        
		        
		        // 결과를 화면에 업데이트합니다.
		        document.querySelector(".total_price_info .originalprice").textContent = totalPriceSum;
		        document.querySelector(".total_price_info .totalprice").textContent = salePriceSum;
		        document.querySelector(".total_price_info .saleprice").textContent = finalPriceSum;
		        
		        document.querySelector(".originalprice").textContent = totalPriceSum;
		        document.querySelector(".totalprice").textContent = salePriceSum;
		        document.querySelector(".saleprice").textContent = finalPriceSum;
		        
		        $(".btnOrangeW").html("선택주문("+selected+")");
		        

		    });
		});
		
		$(".btnOrangeW").html("선택주문("+selected+")");

	})
	</script>
 

	<!-- // 장바구니 삭제 버튼 클릭시 -->
	
	<script>
$(document).ready(function() {
	
	$("ul#ulDelivGb li").removeClass("on");
	if("<%=quickyn%>" === "N" || "<%=quickyn%>" == "null"){
		$('li[quickyn="N"]').addClass("on")
	}else{
		$('li[quickyn="Y"]').addClass("on")
	}
	
	
    $(".delete").click(function() {
        // 삭제 버튼을 클릭했을 때 실행할 동작
        var tr = $(this).closest('tr'); // 클릭한 버튼이 속한 <tr> 요소를 찾음
        var goodsno = tr.attr('goodsno'); // 해당 <tr> 요소의 goodsno 속성 값을 가져옴
		
        
        alert("goodsno test: " + goodsno);
        window.location.href = "/basket/delete?quickyn=" +"<%=quickyn%>"+ "&productId=" + goodsno;
        
    });
    
    $("button.basketType").click(function() {
    	var basketType = $(this).closest('li').attr("quickyn");
    	//alert("basketType: " + basketType);
    	 window.location.href = "/basket?quickyn=" + basketType;
	})
	
	
	
	$("button.btnOrange").click(function() {
		let products = $("#Contents > table > tbody > tr");
		let params = ""; 
		for (var i = 0; i < products.length; i++) {
				let product_id = $(products[i]).attr("goodsno");
				let cnt = $(products[i]).find('select').val();
				params += "products=" + product_id + "-" + cnt + "&" ;
		}
		
		params = params.substr(0, params.length-1);
		
		
		
		
			params += "&quickYN="+"<%=quickyn%>";
		
		console.log(params)
		location.href = "<%=contextPath%>/olive/orderForm.do?" + params + "&click=장바구니";
	})
	
	$("button.btnOrangeW").click(function() {
		let products = $("#Contents > table > tbody > tr");
		
		let params = ""; 
		for (var i = 0; i < products.length; i++) {
			if ($(products[i]).find('input[type=checkbox]').prop('checked')) {
				let product_id = $(products[i]).attr("goodsno");
				let cnt = $(products[i]).find('select').val();
				params += "products=" + product_id + "-" + cnt + "&" ;	
			}
				
		}	
		params = params.substr(0, params.length-1);
		
			params += "&quickYN="+"<%=quickyn%>";
		
		console.log(params)
		location.href = "<%=contextPath%>/olive/orderForm.do?" + params + "&click=장바구니";
	})
	
	$("button.btnSmall.wGreen").click(function() {
		let products = $(this).closest('tr');
		let params = "";
				let product_id = $(products).attr("goodsno");
				let cnt = $(products).find('select').val();
				params += "products=" + product_id + "-" + cnt + "&" ;	
			
		params = params.substr(0, params.length-1);
		
			params += "&quickYN="+"<%=quickyn%>";
		
		console.log(params)
		location.href = "<%=contextPath%>/olive/orderForm.do?" + params + "&click=장바구니";
	})
	
    
});
</script>
  
	<script>
	
</script>
