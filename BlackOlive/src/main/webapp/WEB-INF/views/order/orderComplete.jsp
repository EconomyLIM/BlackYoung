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
	//세 자리마다 , 찍기
	function formatStringWithCommas(str) {
	    return str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	$(function() {
		$(".btnGreenW").on("click", function() {
			location.href = '<c:url value="/"/>';
		});
		
		$(".btnGreen").on("click", function() {
			location.href = '/olive/orderDelivery.do';
		});
	})
	
	$.ajax({
				type : 'post'
				, cache: false
				, url : '<c:url value="/store/getOrderDelivery"/>'
				, dataType : 'json'
				, data : { 
					orderId : '${orderId}'
					, '${_csrf.parameterName }' : '${_csrf.token }'
				}
				, success : function(data) {
					console.log(data);
					
					let tbody = $("#Contents > div.order_end_box > div:nth-child(3) > table > tbody");
					
					let tr = $("<tr>");
					let th = $("<th>").attr("scope", "row").text("받는분");
					let td = $("<td>").text(data.deliveryRecipient);
					tr.append(th).append(td);
					tbody.append(tr);
					
					tr = $("<tr>");
					th = $("<th>").attr("scope", "row").text("연락처1");
					td = $("<td>").text(data.deliveryTel);
					tr.append(th).append(td);
					tbody.append(tr);
					
					if(data.deliveryTel2 != "") {
						tr = $("<tr>");
						th = $("<th>").attr("scope", "row").text("연락처2");
						td = $("<td>").text(data.deliveryTel2);
						tr.append(th).append(td);
						tbody.append(tr);
					}
					
					tr = $("<tr>");
					th = $("<th>").attr("scope", "row").text("주소");
					td = $("<td>").html(`<p>도로명 주소 : \${data.deliveryRoadAddr} \${data.deliveryDetailAddr}</p>`
											+ `<p class='colorGrey'>지번주소 : \${data.deliveryAddr} \${data.deliveryDetailAddr}</p>`);
					tr.append(th).append(td);
					tbody.append(tr);
					
					tr = $("<tr>");
					th = $("<th>").attr("scope", "row").text("공동현관 출입방법");
					td = $("<td>").css("colspan", "3").text(data.requestSelect);
					tr.append(th).append(td);
					tbody.append(tr);
					
					if(data.requestContent != "") {
						tr = $("<tr>");
						th = $("<th>").attr("scope", "row").text("출입방법 상세");
						td = $("<td>").css("colspan", "3").text(data.requestContent);
						tr.append(th).append(td);
						tbody.append(tr);
					}
					
					tr = $("<tr>");
					th = $("<th>").attr("scope", "row").text("배송완료 메시지 전송시점");
					td = $("<td>").css("colspan", "3").text("배송직후");
					tr.append(th).append(td);
					tbody.append(tr);
	            }
				, error : function (data, textStatus) {
					console.log('error');
	            }
			}); 
</script>
	<!-- #Container -->
	<div id="Container">
		<!-- #Contents -->
		<div id="Contents">
			<!-- title_box -->
			<div class="title_box">
				<h1>주문완료</h1>
				<ul class="step_list">
					<li><span class="step_num tx_num">1</span> 장바구니</li>
					<li><span class="step_num tx_num">2</span> 주문/결제</li>
					<li class="last on"><span class="hide">현재단계</span><span class="step_num tx_num">3</span> 주문완료</li>
				</ul>
			</div>
			<!--// title_box -->
			
			<div class="order_end_box"><!-- 2017-01-20 수정 : div 추가 -->
				<!-- 무통장 입금 외 결제 시 -->
				<div class="order_title">
					<p>주문이 <span>완료</span>되었습니다.</p>
					<span class="tx_order_info">주문번호 : <strong class="tx_num">${orderId }</strong></span>
				</div>
				<!--//무통장 입금 외 결제 시 -->
			
		
				<div class="inner_box"><!-- 2017-01-20 수정 : div 추가 -->
					
					<!-- 2017-01-20 추가 : 무통장입금 결제 선택 시 -->
		
					<!--// 2017-01-20 추가 : 무통장입금 결제 선택 시 -->
					<!-- 결제정보 -->
					<h2 class="sub-title2">결제정보</h2>
					<table class="tbl_data_view">
						<caption>결제정보 안내</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">총상품금액</th><!-- 2017-01-20 수정 : 총상품금액, 총배송비, 총 할인금액 추가 -->
							<td><span class="tx_num" id="total_price">${paymentDTO.totalPrice }</span>원</td>
						</tr>
						<tr>
							<th scope="row">총할인금액</th>
							<td>
								<span class="tx_price">-<span class="tx_num" id="cd_price">${paymentDTO.couponDiscountPrice }</span>원</span>
		
							</td>
						</tr>
						<tr>
							<th scope="row">총배송비</th>
							<td><span class="tx_num" id="delivery_price">${paymentDTO.deliveryPrice }</span>원</td>
						</tr>
						<!-- 2017-01-20 수정 : 최종 결제금액 영역 추가  -->
						<tr class="last_tot_price">
							<th scope="row">최종 결제금액</th>
							<td>
								<span class="tx_price"><span class="tx_num" id="pay_price">${paymentDTO.paymentPrice }</span>원</span>

							</td>
						</tr>
						<!--// 2017-01-20 수정 : 최종 결제금액 영역 추가 -->
						</tbody>
					</table>
					<!--// 결제정보 -->
				</div>

				<c:if test="${empty click}">
					<div class="inner_box">
						<!-- 배송정보 -->
						<h2 class="sub-title2">배송정보</h2>
						<table class="tbl_data_view type2">
							<caption>배송정보 안내</caption>
							<colgroup>
								<col style="width:170px">
								<col style="width:*">
							</colgroup>
							<tbody>
							</tbody>
						</table>
						<!--// 배송정보 -->
					</div>
				</c:if>

				<ul class="info_dot_list type2 mgT20 mgL100"><!--  2019-12-13 class 변경 -->
					<li>주문취소는 [결제완료] 상태까지 가능합니다. [배송준비중], [배송중]에는 상품 수령 후 반품요청 부탁드립니다.</li><!--  2019-12-13 취소문구 추가 -->
				</ul>
		
		
				<div class="order_btn_area">
					<button class="btnGreenW" onclick="location.href='https://www.oliveyoung.co.kr/store/index.do';">쇼핑계속</button>
					<button class="btnGreen" onclick="location.href='https://www.oliveyoung.co.kr/store/mypage/getOrderDetail.do?ordNo=Y2311199269610';">주문내역조회</button>
				</div>
		
		
			<div id="curation_wrap_a008" class="cura_pord crtBtm" style="">
				<div class="curation_area_a008_lead"></div>
				<div class="loading_box" id="loadingBox_a008" style="display: none;">
					<h4 class="tit_h4">이런 상품 놓치지 않으셨나요?</h4>
					<span class="icon"><img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/pc_loading.gif" alt="로딩중"></span>
					<p class="txt">고객님을 위한 상품 추천중이에요</p>
				</div>
				<div id="goods_curation_a008">

		<h4 class="tit_h4"><span id="recomm_title_a008">이런 상품 놓치지 않으셨나요?</span><button class="moreBtn" id="crt_more_a008"><span data-attr="세일^주목할만한상품_더보기^더보기">더보기</span></button></h4>
		<div class="inner_cont" role="toolbar">
			<ul class="curation_basket slide_list slick_slider slick-initialized slick-slider slick-dotted" id="curation_ulList_a008"><button type="button" data-role="none" class="slick-prev slick-arrow" aria-label="Previous" role="button" style="display: block;">Previous</button>
	
				
				<div aria-live="polite" class="slick-list draggable"><div class="slick-track" role="listbox" style="opacity: 1; width: 5832px; transform: translate3d(-972px, 0px, 0px);"><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide slick-cloned" data-slick-index="-3" aria-hidden="true" style="width: 324px;" tabindex="-1">
					<div class="thum" data-ref-goodsno="A000000192644" data-egrank="2" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[NEW] 더샘 새미스 에이드 샷 틴트 6colors^10" data-trk="/Ordercom_Curation" data-impression="A000000192644^세일_주목할만한상품^10" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=10" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019264404ko.jpg?l=ko" alt="[NEW] 더샘 새미스 에이드 샷 틴트 6colors" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[NEW] 더샘 새미스 에이드 샷 틴트 6colors^10" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000192644&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;10&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000192644" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000192644" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000192644&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_m002&amp;rccode=pc_cart_order_a&amp;egrankcode=2&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=10" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000192644" data-egrank="2" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[NEW] 더샘 새미스 에이드 샷 틴트 6colors^10" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=10" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000192644&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_m002&quot; ,&quot;2&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=10&quot;); return false;"><dl><dt class="tit">[NEW] 더샘 새미스 에이드 샷 틴트 6colors</dt><dd class="price"><del>12,000원</del><strong>9,000원</strong></dd><dd class="icon"><span class="icon_flag coupon">쿠폰</span><span class="icon_flag gift">증정</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide slick-cloned" data-slick-index="-2" aria-hidden="true" style="width: 324px;" tabindex="-1">
					<div class="thum" data-ref-goodsno="A000000185465" data-egrank="3" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[NEW 컬러][윰 PICK] 레미유 듀이 플로우 틴트^11" data-trk="/Ordercom_Curation" data-impression="A000000185465^세일_주목할만한상품^11" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=11" data-ref-dispcatno="" data-ref-itemno="011" data-impression-visibility="1"><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018546524ko.jpg?l=ko" alt="[NEW 컬러][윰 PICK] 레미유 듀이 플로우 틴트" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[NEW 컬러][윰 PICK] 레미유 듀이 플로우 틴트^11" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000185465&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;11&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000185465" name="" data-ref-dispcatno="" data-ref-itemno="011" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000185465" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000185465&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_m002&amp;rccode=pc_cart_order_a&amp;egrankcode=3&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=11" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000185465" data-egrank="3" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[NEW 컬러][윰 PICK] 레미유 듀이 플로우 틴트^11" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=11" data-ref-dispcatno="" data-ref-itemno="011" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000185465&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_m002&quot; ,&quot;3&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=11&quot;); return false;"><dl><dt class="tit">[NEW 컬러][윰 PICK] 레미유 듀이 플로우 틴트</dt><dd class="price"><del>19,000원</del><strong>13,600원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag coupon">쿠폰</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide slick-cloned" data-slick-index="-1" aria-hidden="true" style="width: 324px;" tabindex="-1">
					<div class="thum" data-ref-goodsno="A000000191795" data-egrank="4" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[지코PICK] 메디힐 블랙헤드 멜팅 클리어 코팩 4매^12" data-trk="/Ordercom_Curation" data-impression="A000000191795^세일_주목할만한상품^12" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=12" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019179504ko.jpg?l=ko" alt="[지코PICK] 메디힐 블랙헤드 멜팅 클리어 코팩 4매" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[지코PICK] 메디힐 블랙헤드 멜팅 클리어 코팩 4매^12" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000191795&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;12&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000191795" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000191795" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000191795&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_m002&amp;rccode=pc_cart_order_a&amp;egrankcode=4&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=12" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000191795" data-egrank="4" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[지코PICK] 메디힐 블랙헤드 멜팅 클리어 코팩 4매^12" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=12" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000191795&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_m002&quot; ,&quot;4&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=12&quot;); return false;"><dl><dt class="tit">[지코PICK] 메디힐 블랙헤드 멜팅 클리어 코팩 4매</dt><dd class="price"><del>14,000원</del><strong>11,900원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide00">
					<div class="thum" data-ref-goodsno="A000000158579" data-egrank="1" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[증정] 마녀공장 퓨어 클렌징 오일 200ml+퓨어폼 20ml^1" data-trk="/Ordercom_Curation" data-impression="A000000158579^세일_주목할만한상품^1" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=1" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0015/A00000015857918ko.jpg?l=ko" alt="[증정] 마녀공장 퓨어 클렌징 오일 200ml+퓨어폼 20ml" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[증정] 마녀공장 퓨어 클렌징 오일 200ml+퓨어폼 20ml^1" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000158579&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;1&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000158579" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="0"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000158579" tabindex="0"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000158579&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_a008&amp;rccode=pc_cart_order_a&amp;egrankcode=1&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=1" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000158579" data-egrank="1" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[증정] 마녀공장 퓨어 클렌징 오일 200ml+퓨어폼 20ml^1" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=1" data-ref-dispcatno="" data-ref-itemno="001" tabindex="0" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000158579&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_a008&quot; ,&quot;1&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=1&quot;); return false;"><dl><dt class="tit">[증정] 마녀공장 퓨어 클렌징 오일 200ml+퓨어폼 20ml</dt><dd class="price"><del>19,900원</del><strong>15,500원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide slick-active" data-slick-index="1" aria-hidden="false" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide01">
					<div class="thum" data-ref-goodsno="A000000189144" data-egrank="2" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[조효진 Pick] 마녀공장 딥 클리어 클렌징 밤 기획(132ml+14ml)^2" data-trk="/Ordercom_Curation" data-impression="A000000189144^세일_주목할만한상품^2" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=2" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018914411ko.jpg?l=ko" alt="[조효진 Pick] 마녀공장 딥 클리어 클렌징 밤 기획(132ml+14ml)" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[조효진 Pick] 마녀공장 딥 클리어 클렌징 밤 기획(132ml+14ml)^2" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000189144&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;2&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000189144" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="0"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000189144" tabindex="0"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000189144&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_a008&amp;rccode=pc_cart_order_a&amp;egrankcode=2&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=2" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000189144" data-egrank="2" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[조효진 Pick] 마녀공장 딥 클리어 클렌징 밤 기획(132ml+14ml)^2" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=2" data-ref-dispcatno="" data-ref-itemno="001" tabindex="0" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000189144&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_a008&quot; ,&quot;2&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=2&quot;); return false;"><dl><dt class="tit">[조효진 Pick] 마녀공장 딥 클리어 클렌징 밤 기획(132ml+14ml)</dt><dd class="price"><del>24,000원</del><strong>13,900원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide slick-active" data-slick-index="2" aria-hidden="false" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide02">
					<div class="thum" data-ref-goodsno="A000000162370" data-egrank="3" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[더블기획] 마녀공장 갈락 필링젤 120ml X2 기획^3" data-trk="/Ordercom_Curation" data-impression="A000000162370^세일_주목할만한상품^3" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=3" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016237012ko.jpg?l=ko" alt="[더블기획] 마녀공장 갈락 필링젤 120ml X2 기획" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[더블기획] 마녀공장 갈락 필링젤 120ml X2 기획^3" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000162370&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;3&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000162370" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="0"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000162370" tabindex="0"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162370&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_a008&amp;rccode=pc_cart_order_a&amp;egrankcode=3&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=3" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000162370" data-egrank="3" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[더블기획] 마녀공장 갈락 필링젤 120ml X2 기획^3" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=3" data-ref-dispcatno="" data-ref-itemno="001" tabindex="0" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000162370&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_a008&quot; ,&quot;3&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=3&quot;); return false;"><dl><dt class="tit">[더블기획] 마녀공장 갈락 필링젤 120ml X2 기획</dt><dd class="price"><del>35,000원</del><strong>17,500원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide" data-slick-index="3" aria-hidden="true" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide03">
					<div class="thum" data-ref-goodsno="A000000147363" data-egrank="4" data-egcode="a008_a008" data-attr="세일^주목할만한상품^마녀공장 퓨어 엔자임 클렌징 워터 1+1 기획 (400ml+400ml)^4" data-trk="/Ordercom_Curation" data-impression="A000000147363^세일_주목할만한상품^4" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=4" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0014/A00000014736310ko.jpg?l=ko" alt="마녀공장 퓨어 엔자임 클렌징 워터 1+1 기획 (400ml+400ml)" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^마녀공장 퓨어 엔자임 클렌징 워터 1+1 기획 (400ml+400ml)^4" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000147363&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;4&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000147363" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000147363" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000147363&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_a008&amp;rccode=pc_cart_order_a&amp;egrankcode=4&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=4" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000147363" data-egrank="4" data-egcode="a008_a008" data-attr="세일^주목할만한상품^마녀공장 퓨어 엔자임 클렌징 워터 1+1 기획 (400ml+400ml)^4" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=4" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000147363&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_a008&quot; ,&quot;4&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=4&quot;); return false;"><dl><dt class="tit">마녀공장 퓨어 엔자임 클렌징 워터 1+1 기획 (400ml+400ml)</dt><dd class="price"><del>22,000원</del><strong>16,500원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide" data-slick-index="4" aria-hidden="true" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide04">
					<div class="thum" data-ref-goodsno="A000000161510" data-egrank="6" data-egcode="a008_a008" data-attr="세일^주목할만한상품^마녀공장 허브 그린 클렌징 오일 200ml+ 약산성 소다폼 (20ml+20ml)^5" data-trk="/Ordercom_Curation" data-impression="A000000161510^세일_주목할만한상품^5" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=5" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016151009ko.jpg?l=ko" alt="마녀공장 허브 그린 클렌징 오일 200ml+ 약산성 소다폼 (20ml+20ml)" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^마녀공장 허브 그린 클렌징 오일 200ml+ 약산성 소다폼 (20ml+20ml)^5" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000161510&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;5&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000161510" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000161510" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000161510&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_a008&amp;rccode=pc_cart_order_a&amp;egrankcode=6&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=5" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000161510" data-egrank="6" data-egcode="a008_a008" data-attr="세일^주목할만한상품^마녀공장 허브 그린 클렌징 오일 200ml+ 약산성 소다폼 (20ml+20ml)^5" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=5" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000161510&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_a008&quot; ,&quot;6&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=5&quot;); return false;"><dl><dt class="tit">마녀공장 허브 그린 클렌징 오일 200ml+ 약산성 소다폼 (20ml+20ml)</dt><dd class="price"><del>19,900원</del><strong>15,500원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide" data-slick-index="5" aria-hidden="true" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide05">
					<div class="thum" data-ref-goodsno="A000000150105" data-egrank="7" data-egcode="a008_a008" data-attr="세일^주목할만한상품^마녀공장 갈락 필링젤 1+1 기획 (75ml+75ml)^6" data-trk="/Ordercom_Curation" data-impression="A000000150105^세일_주목할만한상품^6" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=6" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0015/A00000015010511ko.jpg?l=ko" alt="마녀공장 갈락 필링젤 1+1 기획 (75ml+75ml)" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^마녀공장 갈락 필링젤 1+1 기획 (75ml+75ml)^6" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000150105&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;6&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000150105" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000150105" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000150105&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_a008&amp;rccode=pc_cart_order_a&amp;egrankcode=7&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=6" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000150105" data-egrank="7" data-egcode="a008_a008" data-attr="세일^주목할만한상품^마녀공장 갈락 필링젤 1+1 기획 (75ml+75ml)^6" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=6" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000150105&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_a008&quot; ,&quot;7&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=6&quot;); return false;"><dl><dt class="tit">마녀공장 갈락 필링젤 1+1 기획 (75ml+75ml)</dt><dd class="price"><strong>12,000원</strong></dd><dd class="icon"><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide" data-slick-index="6" aria-hidden="true" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide06">
					<div class="thum" data-ref-goodsno="A000000148285" data-egrank="8" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[회사원A Pick] 마녀공장 비피다 바이옴 앰플 토너 400ml+100ml 기획^7" data-trk="/Ordercom_Curation" data-impression="A000000148285^세일_주목할만한상품^7" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=7" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0014/A00000014828512ko.jpg?l=ko" alt="[회사원A Pick] 마녀공장 비피다 바이옴 앰플 토너 400ml+100ml 기획" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[회사원A Pick] 마녀공장 비피다 바이옴 앰플 토너 400ml+100ml 기획^7" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000148285&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;7&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000148285" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000148285" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000148285&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_a008&amp;rccode=pc_cart_order_a&amp;egrankcode=8&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=7" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000148285" data-egrank="8" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[회사원A Pick] 마녀공장 비피다 바이옴 앰플 토너 400ml+100ml 기획^7" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=7" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000148285&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_a008&quot; ,&quot;8&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=7&quot;); return false;"><dl><dt class="tit">[회사원A Pick] 마녀공장 비피다 바이옴 앰플 토너 400ml+100ml 기획</dt><dd class="price"><del>25,000원</del><strong>17,500원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide" data-slick-index="7" aria-hidden="true" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide07">
					<div class="thum" data-ref-goodsno="A000000166599" data-egrank="9" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[회사원A Pick] 마녀공장 비피다 바이옴 콤플렉스 앰플 30ml X2 기획^8" data-trk="/Ordercom_Curation" data-impression="A000000166599^세일_주목할만한상품^8" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=8" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016659929ko.jpg?l=ko" alt="[회사원A Pick] 마녀공장 비피다 바이옴 콤플렉스 앰플 30ml X2 기획" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[회사원A Pick] 마녀공장 비피다 바이옴 콤플렉스 앰플 30ml X2 기획^8" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000166599&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;8&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000166599" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000166599" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000166599&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_a008&amp;rccode=pc_cart_order_a&amp;egrankcode=9&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=8" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000166599" data-egrank="9" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[회사원A Pick] 마녀공장 비피다 바이옴 콤플렉스 앰플 30ml X2 기획^8" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=8" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000166599&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_a008&quot; ,&quot;9&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=8&quot;); return false;"><dl><dt class="tit">[회사원A Pick] 마녀공장 비피다 바이옴 콤플렉스 앰플 30ml X2 기획</dt><dd class="price"><del>43,000원</del><strong>28,900원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide" data-slick-index="8" aria-hidden="true" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide08">
					<div class="thum" data-ref-goodsno="A000000171427" data-egrank="1" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[이나연PICK] 메디힐 마데카소사이드 흔적 패드 100매 (+100매 더블증정 기획)^9" data-trk="/Ordercom_Curation" data-impression="A000000171427^세일_주목할만한상품^9" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=9" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0017/A00000017142748ko.jpg?l=ko" alt="[이나연PICK] 메디힐 마데카소사이드 흔적 패드 100매 (+100매 더블증정 기획)" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[이나연PICK] 메디힐 마데카소사이드 흔적 패드 100매 (+100매 더블증정 기획)^9" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000171427&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;9&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000171427" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000171427" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000171427&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_m002&amp;rccode=pc_cart_order_a&amp;egrankcode=1&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=9" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000171427" data-egrank="1" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[이나연PICK] 메디힐 마데카소사이드 흔적 패드 100매 (+100매 더블증정 기획)^9" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=9" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000171427&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_m002&quot; ,&quot;1&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=9&quot;); return false;"><dl><dt class="tit">[이나연PICK] 메디힐 마데카소사이드 흔적 패드 100매 (+100매 더블증정 기획)</dt><dd class="price"><strong>39,900원</strong></dd><dd class="icon"><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide" data-slick-index="9" aria-hidden="true" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide09">
					<div class="thum" data-ref-goodsno="A000000192644" data-egrank="2" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[NEW] 더샘 새미스 에이드 샷 틴트 6colors^10" data-trk="/Ordercom_Curation" data-impression="A000000192644^세일_주목할만한상품^10" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=10" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019264404ko.jpg?l=ko" alt="[NEW] 더샘 새미스 에이드 샷 틴트 6colors" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[NEW] 더샘 새미스 에이드 샷 틴트 6colors^10" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000192644&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;10&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000192644" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000192644" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000192644&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_m002&amp;rccode=pc_cart_order_a&amp;egrankcode=2&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=10" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000192644" data-egrank="2" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[NEW] 더샘 새미스 에이드 샷 틴트 6colors^10" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=10" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000192644&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_m002&quot; ,&quot;2&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=10&quot;); return false;"><dl><dt class="tit">[NEW] 더샘 새미스 에이드 샷 틴트 6colors</dt><dd class="price"><del>12,000원</del><strong>9,000원</strong></dd><dd class="icon"><span class="icon_flag coupon">쿠폰</span><span class="icon_flag gift">증정</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide" data-slick-index="10" aria-hidden="true" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide010">
					<div class="thum" data-ref-goodsno="A000000185465" data-egrank="3" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[NEW 컬러][윰 PICK] 레미유 듀이 플로우 틴트^11" data-trk="/Ordercom_Curation" data-impression="A000000185465^세일_주목할만한상품^11" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=11" data-ref-dispcatno="" data-ref-itemno="011" data-impression-visibility="1"><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018546524ko.jpg?l=ko" alt="[NEW 컬러][윰 PICK] 레미유 듀이 플로우 틴트" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[NEW 컬러][윰 PICK] 레미유 듀이 플로우 틴트^11" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000185465&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;11&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000185465" name="" data-ref-dispcatno="" data-ref-itemno="011" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000185465" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000185465&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_m002&amp;rccode=pc_cart_order_a&amp;egrankcode=3&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=11" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000185465" data-egrank="3" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[NEW 컬러][윰 PICK] 레미유 듀이 플로우 틴트^11" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=11" data-ref-dispcatno="" data-ref-itemno="011" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000185465&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_m002&quot; ,&quot;3&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=11&quot;); return false;"><dl><dt class="tit">[NEW 컬러][윰 PICK] 레미유 듀이 플로우 틴트</dt><dd class="price"><del>19,000원</del><strong>13,600원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag coupon">쿠폰</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide" data-slick-index="11" aria-hidden="true" style="width: 324px;" tabindex="-1" role="option" aria-describedby="slick-slide011">
					<div class="thum" data-ref-goodsno="A000000191795" data-egrank="4" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[지코PICK] 메디힐 블랙헤드 멜팅 클리어 코팩 4매^12" data-trk="/Ordercom_Curation" data-impression="A000000191795^세일_주목할만한상품^12" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=12" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019179504ko.jpg?l=ko" alt="[지코PICK] 메디힐 블랙헤드 멜팅 클리어 코팩 4매" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[지코PICK] 메디힐 블랙헤드 멜팅 클리어 코팩 4매^12" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000191795&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;12&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000191795" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000191795" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000191795&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_m002&amp;rccode=pc_cart_order_a&amp;egrankcode=4&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=12" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000191795" data-egrank="4" data-egcode="a008_m002" data-attr="세일^주목할만한상품^[지코PICK] 메디힐 블랙헤드 멜팅 클리어 코팩 4매^12" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=12" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000191795&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_m002&quot; ,&quot;4&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=12&quot;); return false;"><dl><dt class="tit">[지코PICK] 메디힐 블랙헤드 멜팅 클리어 코팩 4매</dt><dd class="price"><del>14,000원</del><strong>11,900원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide slick-cloned" data-slick-index="12" aria-hidden="true" style="width: 324px;" tabindex="-1">
					<div class="thum" data-ref-goodsno="A000000158579" data-egrank="1" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[증정] 마녀공장 퓨어 클렌징 오일 200ml+퓨어폼 20ml^1" data-trk="/Ordercom_Curation" data-impression="A000000158579^세일_주목할만한상품^1" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=1" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0015/A00000015857918ko.jpg?l=ko" alt="[증정] 마녀공장 퓨어 클렌징 오일 200ml+퓨어폼 20ml" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[증정] 마녀공장 퓨어 클렌징 오일 200ml+퓨어폼 20ml^1" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000158579&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;1&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000158579" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000158579" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000158579&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_a008&amp;rccode=pc_cart_order_a&amp;egrankcode=1&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=1" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000158579" data-egrank="1" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[증정] 마녀공장 퓨어 클렌징 오일 200ml+퓨어폼 20ml^1" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=1" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000158579&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_a008&quot; ,&quot;1&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=1&quot;); return false;"><dl><dt class="tit">[증정] 마녀공장 퓨어 클렌징 오일 200ml+퓨어폼 20ml</dt><dd class="price"><del>19,900원</del><strong>15,500원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide slick-cloned" data-slick-index="13" aria-hidden="true" style="width: 324px;" tabindex="-1">
					<div class="thum" data-ref-goodsno="A000000189144" data-egrank="2" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[조효진 Pick] 마녀공장 딥 클리어 클렌징 밤 기획(132ml+14ml)^2" data-trk="/Ordercom_Curation" data-impression="A000000189144^세일_주목할만한상품^2" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=2" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018914411ko.jpg?l=ko" alt="[조효진 Pick] 마녀공장 딥 클리어 클렌징 밤 기획(132ml+14ml)" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[조효진 Pick] 마녀공장 딥 클리어 클렌징 밤 기획(132ml+14ml)^2" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000189144&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;2&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000189144" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000189144" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000189144&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_a008&amp;rccode=pc_cart_order_a&amp;egrankcode=2&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=2" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000189144" data-egrank="2" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[조효진 Pick] 마녀공장 딥 클리어 클렌징 밤 기획(132ml+14ml)^2" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=2" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000189144&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_a008&quot; ,&quot;2&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=2&quot;); return false;"><dl><dt class="tit">[조효진 Pick] 마녀공장 딥 클리어 클렌징 밤 기획(132ml+14ml)</dt><dd class="price"><del>24,000원</del><strong>13,900원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li><li data-wlog_type="a008" class="gtm_sale_lk_list slick-slide slick-cloned" data-slick-index="14" aria-hidden="true" style="width: 324px;" tabindex="-1">
					<div class="thum" data-ref-goodsno="A000000162370" data-egrank="3" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[더블기획] 마녀공장 갈락 필링젤 120ml X2 기획^3" data-trk="/Ordercom_Curation" data-impression="A000000162370^세일_주목할만한상품^3" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=3" data-ref-dispcatno="" data-ref-itemno="001" data-impression-visibility="1"><span class="thumb_flag best">베스트</span><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016237012ko.jpg?l=ko" alt="[더블기획] 마녀공장 갈락 필링젤 120ml X2 기획" onerror="common.errorImg(this);" data-attr="세일^주목할만한상품^[더블기획] 마녀공장 갈락 필링젤 120ml X2 기획^3" onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000162370&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;세일_주목할만한상품&quot;, &quot;3&quot;);"><div class="my"><button type="button" class="myCart cartBtnRecoBell" data-ref-goodsno="A000000162370" name="" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><span>장바구니</span></button><button type="button" class="mySee btn_zzim" data-ref-goodsno="A000000162370" tabindex="-1"><span>찜하기전</span></button></div></div><div class="info"><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162370&amp;trackingCd=Ordercom_Curation&amp;curation=ordercompl_curation_prod&amp;egcode=a008_a008&amp;rccode=pc_cart_order_a&amp;egrankcode=3&amp;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=3" class="a_detail" name="Ordercom_Curation" data-ref-goodsno="A000000162370" data-egrank="3" data-egcode="a008_a008" data-attr="세일^주목할만한상품^[더블기획] 마녀공장 갈락 필링젤 120ml X2 기획^3" data-trk="/Ordercom_Curation" data-tracking-param="t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=3" data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1" onclick="javascript:common.wlog(&quot;ordercompl_curation_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000162370&quot;, &quot;&quot;,&quot;ordercompl_curation_prod&quot; , &quot;pc_cart_order_a&quot;,&quot;a008_a008&quot; ,&quot;3&quot; ,&quot;Ordercom_Curation&quot;,&quot;t_page=주문결제완료&amp;t_click=상품추천_상품상세&amp;t_number=3&quot;); return false;"><dl><dt class="tit">[더블기획] 마녀공장 갈락 필링젤 120ml X2 기획</dt><dd class="price"><del>35,000원</del><strong>17,500원</strong></dd><dd class="icon"><span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span></dd></dl></a></div>

				</li></div></div>

			<button type="button" data-role="none" class="slick-next slick-arrow" aria-label="Next" role="button" style="display: block;">Next</button><ul class="slick-dots" style="display: block;" role="tablist"><li class="slick-active" aria-hidden="false" role="presentation" aria-selected="true" aria-controls="navigation00" id="slick-slide00"><button type="button" data-role="none" role="button" tabindex="0">1</button></li><li aria-hidden="true" role="presentation" aria-selected="false" aria-controls="navigation01" id="slick-slide01"><button type="button" data-role="none" role="button" tabindex="0">2</button></li><li aria-hidden="true" role="presentation" aria-selected="false" aria-controls="navigation02" id="slick-slide02"><button type="button" data-role="none" role="button" tabindex="0">3</button></li><li aria-hidden="true" role="presentation" aria-selected="false" aria-controls="navigation03" id="slick-slide03"><button type="button" data-role="none" role="button" tabindex="0">4</button></li></ul></ul>
		</div>

<input type="hidden" id="recoGoodsYn" value="Y"> 
<script type="text/javascript">
	$(function() {
		common.wish.init();

		gtm.goods.initProductImpression();
	});

	$('.gtm_sale_lk_list .thum img').each(function(i){
		var _item = $(this);
		var _name = $(this).attr('alt');
		var _data_goodsno = $(this).parent().attr('data-ref-goodsno');

		_item.attr('data-attr',"세일^주목할만한상품^"+_name+"^"+(i+1));
		_item.attr('onclick','javascript: gtm.goods.callGoodsGtmInfo("'+_data_goodsno+'", "", "ee-productClick", "세일_주목할만한상품", "'+(i+1)+'");');


	});
	//오특 플래그
	common.gnb.todaySpecial.setTodaySpecialFlag('.thum .newOyflag');
</script>

</div>
			</div>

			</div>
		</div>
		<!-- //#Contents -->
	</div>
	<!-- //#Container -->
<script type="text/javascript">

	$(function() {
		var recoBellViewYn = "Y";
		var recoBellUseYn = "Y";
		var arrItemid = [];

			arrItemid.push("8809730952175");

		if(recoBellViewYn == "Y" && recoBellUseYn == "Y") {
			$("#curation_wrap_a008").show();
			
			$(window).scroll(function() {
				 var wH = $(window).height(),
                 wS = $(this).scrollTop();
			
				 if(window['isCurationArea008Called'] != 'Y' && $('.curation_area_a008_lead').is(":visible")){                        
                     var offsetTop = $('.curation_area_a008_lead').offset().top;
                     if(wS >  ( offsetTop-wH )){
                    	var param = {
	                 		size : 30,
	                 		iids : arrItemid.join(","),
	                 		cps : true,
	                 		cpt : "m002"
	                 	};
                    	
                    	curation.callCuration("a008", param, function(data) {
                    		var url = _secureUrl + "curation/getCurationCallBackAjax.do";

                    		var obj = {
                    			viewType : "Horz", // 세로형
                    			styleNo : 27, // 템플릿 번호
                    			viewSize : 12, // 슬라이드 노출갯수
                    			titlRp : "이런 상품 놓치지 않으셨나요?;장바구니 구매 상품과 함께 구매하면 좋은 상품이에요", // 타이틀 replace 텍스트
                    			viewArea : 'ordercompl_curation_prod',
                    			rccode : "pc_cart_order_a",
								trackingCd: "Ordercom_Curation"
                    		};
                    		
                    		var setObj = jQuery.extend(data, obj);
                    		
                    		curation.getCurationCallBack(setObj, url);
                    	});
	                 	
                        window['isCurationArea008Called'] = 'Y';
                     }                        
                 }
			});
		}
	});

</script>
<script> 

 var TRS_AMT='32700'; 
 var TRS_ORDER_ID='Y2311199269610'; 
// gtm 중복호출방지 위한 페이지 첫 호출여부 체크
 var GTM_KEY = 'GTM_ORDER_COMPLETE';
 var gtmInfo = JSON.parse(sessionStorage.getItem(GTM_KEY));
 if(!gtmInfo) {
     gtmInfo = {};
 }
 var echo_criteo = [];
 var purchaseBrandGoodsInfo = [];
 var goodsPrice = 0;
 var contentsForFixel = [];
 
 if(!gtmInfo["Y2311199269610"]) {
	// purchaseId2, price, sale_price 데이터 추가 - [3451865] 페이스북 카달로그 DATA Layer 필드 값 수정 요청(CHY)
			goodsPrice += parseInt('11000') - parseInt('0');

			echo_criteo.push({
				'id' : 'A000000149988001',
				'price' : parseInt('11000') - parseInt('0'),
				'quantity' : parseInt('1')
			});

			 contentsForFixel.push({
				 id: 'A000000149988',
				 quantity : parseInt('1'),
			 });
			
			//상품코드, 상품명, 실매출, 수량, 브랜드명 추가
			purchaseBrandGoodsInfo.push({
				'goodsCd' : 'A000000149988001',
				'goodsNm' : "[1+1] 마녀공장 퓨어&딥 클렌징 폼 1+1 기획 (120ml+120ml)",
				'realPrice' : parseInt('11000') - parseInt('0'),
				'quantity' : parseInt('1'),
				'brandNm' : '마녀공장'		
			});
			goodsPrice += parseInt('13900') - parseInt('0');
			echo_criteo.push({
				'id' : 'A000000176980001',
				'price' : parseInt('13900') - parseInt('0'),
				'quantity' : parseInt('1')
			});

			contentsForFixel.push({
				id: 'A000000176980',
				quantity : parseInt('1'),
			});
			
			//상품코드, 상품명, 실매출, 수량, 브랜드명 추가
			purchaseBrandGoodsInfo.push({
				'goodsCd' : 'A000000176980001',
				'goodsNm' : "[11월 올영픽] 닥터브라이언 복숭아맛구미 비타민C&D 3000 (100구미) (33일분)",
				'realPrice' : parseInt('13900') - parseInt('0'),
				'quantity' : parseInt('1'),
				'brandNm' : '닥터브라이언'		
			});
			goodsPrice += parseInt('7800') - parseInt('0');

			echo_criteo.push({
				'id' : 'A000000186136001',
				'price' : parseInt('7800') - parseInt('0'),
				'quantity' : parseInt('2')
			});

			 contentsForFixel.push({
				 id: 'A000000186136',
				 quantity : parseInt('2'),
			 });
			
			//상품코드, 상품명, 실매출, 수량, 브랜드명 추가
			purchaseBrandGoodsInfo.push({
				'goodsCd' : 'A000000186136001',
				'goodsNm' : "비브리브 꼬박꼬밥 흑임자",
				'realPrice' : parseInt('7800') - parseInt('0'),
				'quantity' : parseInt('2'),
				'brandNm' : '비브리브'		
			});
		
	dataLayer = [{
		"purchase" 			: "Y2311199269610",		//주문ID
		"purchaseId" 		: ['A000000149988001','A000000176980001','A000000186136001'],					//상품ID + 옵션번호
		"purchaseId2" 		: ['A000000149988','A000000176980','A000000186136'],					//상품ID
		"purchasenName" 	: "[1+1] 마녀공장 퓨어&딥 클렌징 폼 1+1 기획 (120ml+120ml)|[11월 올영픽] 닥터브라이언 복숭아맛구미 비타민C&D 3000 (100구미) (33일분)|비브리브 꼬박꼬밥 흑임자",					//상품명
		"purchaseAmt" 		: "32700",				//총주문액
		"purchaseQuantity" 	: "4",					//주문수량
		"price"				: goodsPrice.toString() + " KRW",	//원가주문액
		"sale_price"		: "32700 KRW",			//할인주문액
	}];
	
	dataLayer.push(
		{ 'echo_criteo' : echo_criteo }, 
		{ 'purchaseBrandGoodsInfo' : purchaseBrandGoodsInfo }
	);

	 // pixel purchase
	 fbq('track', 'Purchase', {
		 contents: contentsForFixel,
		 content_type: 'product',
		 value: Number('32700'),
		 currency: 'KRW',
	 });
	
    gtmInfo["Y2311199269610"] = true;
	sessionStorage.setItem(GTM_KEY, JSON.stringify(gtmInfo));

	
 } else {
	// purchaseId2, price, sale_price 데이터 추가 - [3451865] 페이스북 카달로그 DATA Layer 필드 값 수정 요청(CHY)
	dataLayer = [{
		"purchase" 			: "",		//주문ID
		"purchaseId" 		: [],		//상품ID + 옵션번호
		"purchaseId2" 		: [],		//상품ID
		"purchasenName" 	: "",		//상품명
		"purchaseAmt" 		: "",		//총주문액
		"purchaseQuantity" 	: "",		//주문수량
		"price" 			: "",		//원가주문액
		"sale_price" 		: ""		//할인주문액
	}];
	echo_criteo.push({
		'id' : "",
		'price' : "",
		'quantity' : ""
	});
	purchaseBrandGoodsInfo.push({
		'goodsCd' : "",
		'goodsNm' : "",
		'realPrice' : 0,
		'quantity' : 0,
		'brandNm' : ""		
	});
	dataLayer.push(
		{'echo_criteo' : echo_criteo},
		{'purchaseBrandGoodsInfo' : purchaseBrandGoodsInfo}
	);
 } 

</script>

<!-- RecoBell Script Start -->
<script type="text/javascript">
window._eglqueue = window._eglqueue || [];
/* STAR LOOP: 구매한 모든 상품에 대해 */

	
		
			var salePrice = Number("11000");
			var aplyAdtnCostAmt = Number("0");
			var totRealQty = Number("1");
			
			if(aplyAdtnCostAmt > 0) {
				salePrice = salePrice - (aplyAdtnCostAmt/totRealQty);
			}
			
			_eglqueue.push(['addVar', 'orderItems', {onlineItemId: 'A000000149988', itemId:'8809730952175', optionId: '001',  price:'12000', salePrice:salePrice, quantity:totRealQty}]);
		
			var salePrice = Number("13900");
			var aplyAdtnCostAmt = Number("0");
			var totRealQty = Number("1");
			
			if(aplyAdtnCostAmt > 0) {
				salePrice = salePrice - (aplyAdtnCostAmt/totRealQty);
			}
			
			_eglqueue.push(['addVar', 'orderItems', {onlineItemId: 'A000000176980', itemId:'669416496502', optionId: '001',  price:'15900', salePrice:salePrice, quantity:totRealQty}]);
		
			var salePrice = Number("3900");
			var aplyAdtnCostAmt = Number("0");
			var totRealQty = Number("2");
			
			if(aplyAdtnCostAmt > 0) {
				salePrice = salePrice - (aplyAdtnCostAmt/totRealQty);
			}
			
			_eglqueue.push(['addVar', 'orderItems', {onlineItemId: 'A000000186136', itemId:'8809120444099', optionId: '001',  price:'3900', salePrice:salePrice, quantity:totRealQty}]);
		
	

/* END LOOP */
</script>


	<div class="laytoast" id="brandOff" style="display: none;">
		<div class="inner">
			<p class="txt_recom txt_01">브랜드<br><em>좋아요</em></p>
		</div>
	</div>
	<div class="laytoast on" id="brandOn" style="display: none;">
		<div class="inner">
			<p class="txt_recom txt_01">브랜드<br><em>좋아요</em></p>
		</div>
	</div>
	<!-- 브랜드 찜 확인 레이어 -->
	<div class="layerAlim brand zzimOn" style="display:none;"><!-- zzimOn / zzimOff -->
	 <span class="icon"></span>
	 <p>브랜드<strong>좋아요</strong></p>
	</div>

	<div class="layerAlim brand zzimOff" style="display:none;"><!-- zzimOn / zzimOff -->
	 <span class="icon"></span>
	 <p>브랜드<strong>좋아요</strong></p>
	</div>
	<!-- 브랜드 찜 확인 레이어 -->
	
	<!-- 찜 확인 레이어 -->
	<div class="layerAlim zzimOn wishPrd" style="display:none;">
		<span class="icon"></span>
		<p class="one"><strong>좋아요</strong></p>
	</div>
	<!--// 찜 확인 레이어 -->
	
	<!-- 찜 취소 레이어 -->
	<div class="layerAlim zzimOff wishPrd" style="display:none;">
		<span class="icon"></span>
		<p class="one"><strong>좋아요</strong></p>
	</div>
	<!--// 찜 취소 레이어 -->

	<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	<div id="directTop" style="display: block;">
		<button><span></span>TOP</button>
	</div>
	<!--/ㅁ 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	
</div>

</body>
</html>