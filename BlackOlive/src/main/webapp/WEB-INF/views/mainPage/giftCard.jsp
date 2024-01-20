<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>블랙올리브영 온라인몰</title>
</head>
<body>
	<script>
		// 카테고리를 눌렀을 때 보여 줄 카테고리
		function show_gc_cate(cate, obj) {
			$(".swiper-wrapper").find("a").removeClass("on");
			$(obj).addClass("on");
			event.preventDefault();
			$(".theme-giftcard").hide();
			if (cate == '전체') {
				$(".theme-giftcard").show();
			} else if (cate == 'NEW&BEST') {
				$(".theme-giftcard").eq(0).show();
			} else if (cate == '감사&축하') {
				$(".theme-giftcard").eq(1).show();
			} else if (cate == '올리브영') {
				$(".theme-giftcard").eq(2).show();
			}
		}
		
		
	</script>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication var="userName" property="principal.member.userName"/>	
	</sec:authorize>
	<div id="Container" class="main_container design-type-v1">
		<div class="title-giftcard">
			<div class="inner">
				<h1>기프트카드</h1>
				<p>온/오프라인 매장에서 현금처럼 사용하며 CJ ONE 포인트 적립까지!</p>
				<a href="#" class="my-gift-list">나의 기프트카드 및 선물내역</a>
			</div>
		</div>
		<div class="gc-content gc-landing">

			<div class="gc-item-total" id="gc_item_cnt">
				전체 <b>22</b>개
			</div>

			<div class="category-menu swiper-container use first">
				<div class="swiper-wrapper">
					<a onclick="show_gc_cate('전체', this)"
						href="#" data-attr="기프트카드^전시테마^전체" data-card-category="all" class="on">전체</a> 
					<a onclick="show_gc_cate('NEW&amp;BEST', this)"
						href="#" data-attr="기프트카드^전시테마^NEW&amp;BEST" data-card-category="NEW&amp;BEST">NEW&amp;BEST</a> 
					<a onclick="show_gc_cate('감사&amp;축하', this)"
						href="#" data-attr="기프트카드^전시테마^감사&amp;축하" data-card-category="감사&amp;축하">감사&amp;축하</a> 
					<a onclick="show_gc_cate('올리브영', this)"
						href="#" data-attr="기프트카드^전시테마^올리브영" data-card-category="올리브영">올리브영</a>

				</div>
			</div>
			<div class="theme-giftcard" data-category-name="NEW&amp;BEST">
				<h3 class="giftSubTit">NEW&amp;BEST</h3>
				<div class="gc-card-info-wrap">
				
				<c:forEach items="${list }" var="list" >
					<c:if test='${list.giftcardCategory eq "NEW&BEST" }'>
						<div class="gc-card-info">
							<div>
								<span class="img"><img src="${list.giftcardImgSrc}"></span>
								<p class="card-dic gc-f-mtg">${list.giftcardName }</p>
							</div>
							<div class="card-btn">
								<button class="card-buy" type="button" onclick="getGiftCardForm('바로구매', '${list.giftcardId}')">
									<span>바로구매</span>
								</button>
								<button class="card-gift" type="button" onclick="getGiftCardForm('선물하기', '${list.giftcardId}')">
									<span>선물하기</span>
								</button>
							</div>
						</div>
					</c:if>
				</c:forEach>
				</div>
			</div>

			<div class="theme-giftcard" data-category-name="감사&amp;축하">
				<h3 class="giftSubTit">감사&amp;축하</h3>
				<div class="gc-card-info-wrap">
				<c:forEach items="${list }" var="list" >
					<c:if test='${list.giftcardCategory eq "감사&축하" }'>
						<div class="gc-card-info">
							<div>
								<span class="img"><img src="${list.giftcardImgSrc}"></span>
								<p class="card-dic gc-f-mtg">${list.giftcardName }</p>
							</div>
							<div class="card-btn">
								<button class="card-buy" type="button" onclick="getGiftCardForm('바로구매', '${list.giftcardId}')">
									<span>바로구매</span>
								</button>
								<button class="card-gift" type="button" onclick="getGiftCardForm('선물하기', '${list.giftcardId}')">
									<span>선물하기</span>
								</button>
							</div>
						</div>
					</c:if>
				</c:forEach>
				</div>
			</div>

			<div class="theme-giftcard" data-category-name="올리브영">
				<h3 class="giftSubTit">올리브영</h3>
				<div class="gc-card-info-wrap">
				<c:forEach items="${list }" var="list" >
					<c:if test='${list.giftcardCategory eq "올리브영" }'>
						<div class="gc-card-info">
							<div>
								<span class="img"><img src="${list.giftcardImgSrc}"></span>
								<p class="card-dic gc-f-mtg">${list.giftcardName }</p>
							</div>
							<div class="card-btn">
								<button class="card-buy" type="button" onclick="getGiftCardForm('바로구매', '${list.giftcardId}')">
									<span>바로구매</span>
								</button>
								<button class="card-gift" type="button" onclick="getGiftCardForm('선물하기', '${list.giftcardId}')">
									<span>선물하기</span>
								</button>
							</div>
						</div>
					</c:if>
				</c:forEach>
				</div>
			</div>
			
			<script>	
					// 바로구매나 선물하기 버튼을 눌렀을 때
					function getGiftCardForm(click, giftCardId) {
						let loginCheck = ${empty userName};
						
						if(loginCheck) {
							location.href = '<c:url value="/auth/login"/>';
							return;
						}
						
						let form = $("<form>").attr({
							method : "get"
							, action : "<c:url value='/store/getGiftCardForm'/>"
						});
						
						let input1 = $("<input>").attr({
							type : "hidden"
							, name : "click"
							, value : click
						});
						
						let input2 = $("<input>").attr({
							type : "hidden"
							, name : "giftCardId"
							, value : giftCardId
						});
						
						$(form).append(input1).append(input2);
						$("body").append(form);
						$(form).submit();
					}
				
			
			</script>

			<ul class="gc-landing-notice">
				<li>
					<p class="gc-landing-notice-tit">유의사항</p>
					<ul>
						<li>
							<p>
								<strong>기프트카드 안내</strong>
							</p> - 올리브영 기프트카드는 올리브영 매장 및 온라인몰에서 구매/충전/사용이 가능합니다. (단, 역사 입점 매장 등
							일부 매장 제외)<br> <a
							href="#"
							style="display: inline-block; margin-left: 10px;"><u><strong>판매/결제/사용
										불가 매장 확인하기 &gt;</strong></u></a><br> - 기프트카드의 잔액 이동 및 잔액이 있는 카드 삭제는 불가합니다.<br>
							- 기프트카드로 주문한 내역이 있는 경우 삭제 및 잔액 환불 이후 주문 취소가 어려울 수 있습니다.<br>
							- 기프트카드 결제 및 반품 시스템 오류 발생 시, 데이터 내부 조정으로 인한 거래 내역이 일부 상이한 현상이 발생할
							수 있습니다. (단, 거래 내용은 변동 없음)<br> - 나의 기프트카드 관리 및 선물 내역 확인은 <a
							href="#"><u><strong>마이페이지
										&gt; 기프트카드</strong></u></a>에서 확인 가능합니다.
						</li>
						<li>
							<p>
								<strong>구매/충전 안내</strong>
							</p> - 카드당 1회 충전 금액은 최소 1만원, 최대 50만원까지 가능하며 충전 후 합계 잔액은 50만원을 초과할 수
							없습니다.<br> - 기프트카드는 ID당 최대 30개까지 보유 가능하며, 전체 카드의 합산 금액은
							500만원을 초과할 수 없습니다. (온라인몰 바로 구매 시 수량 초과 분은 MMS로 발송)<br> -
							기프트카드의 유효기간은 5년이며, 소멸 전 총 3회 이메일로 소멸 안내를 드리고 있습니다.<br> -
							기프트카드의 유효기간은 판매/제공처 별 상이할 수 있습니다.<br> - 기프트카드 구매/충전 금액에 대한
							현금영수증은 발행되지 않으며, 해당 카드로 결제 시 발행됩니다.
						</li>
						<li>
							<p>
								<strong>취소/환불 안내</strong>
							</p> - 구매/충전 취소는 해당 금액 미사용 시 구매일 기준 14일 이내에 가능합니다.<br> - 최종 충전 후
							합계 잔액의 60% 이상을 사용한 경우에 환불 가능합니다. (단, 1만원 이하의 경우 80% 이상 사용한 경우 환불
							가능, 유효기간 만료 시 잔액 환불 불가)<br> - 프로모션/경품/판촉용 등 무상 지급된 기프트카드는
							유효기간 연장, 환불 및 교환이 불가합니다.<br> - 환불 및 분실 신고는 <a
							href="#"
							target="_blank"><u><strong>CJ ONE 홈페이지 &gt; 나의기프트카드</strong></u></a>에서 신청 가능합니다.
						</li>
						<li>
							<p>
								<strong>기프트카드 관련 문의 사항</strong> 
								<a href="#">(<u>고객센터FAQ 바로가기</u>)</a>
							</p> - 나이스정보통신: 1644-9760<br> - CJ ONE 고객센터: 1577-8888<br>
							- 매장 고객센터: 1577-4887<br> - 온라인몰 고객센터: 1522-0882<br> -
							상담시간: 평일 09:00~18:00 (토, 일, 공휴일 휴무)
						</li>
					</ul>

				</li>


			</ul>
		</div>
	</div>
	<form id="goodsForm" name="goodsForm">
		<input type="hidden" id="goodsNo" name="goodsNo" value=""> <input
			type="hidden" id="giftYn" name="giftYn" value="">
	</form>
	<!-- //#Container -->
	<!-- 기프트카드 서비스 이용약관 -->
	<div class="layer_pop_wrap w650" id="giftCardTerm" style="">
		<div class="layer_cont">
			<h2 class="layer_title">기프트카드 이용약관</h2>

			<div class="term_scroll_box">
				<div class="inner">
					<h2 class="inner-title">제1조(목적)</h2>
					<p>이 약관은 나이스정보통신 주식회사(이하 "발행자" 라 함)가 발행하는 "전자상품권", "모바일상품권"및
						"쿠폰"(이하 "상품권")의 구매 및 이용과 관련하여, "발행자", "구매자" 및 "사용자"의 권리, 의무 등에 관한
						사항을 정함을 목적으로 한다.</p>

					<h2 class="inner-title">제2조(용어의 정의)</h2>
					<p>1."상품권": "발행자"가 전자금융거래법을 근거로 하여 발행하는 선불전자지급수단으로서, 이전 가능한 금전적
						가치가 전자적 방법으로 저장되어 발행된 증표 또는 그 증표에 관한 정보로서, 재화 또는 용역을 구입하고 그 대가를
						지급하는데 사용되는 것을 말한다.</p>
					<p>2."구매자": "발행사"에서 발행하는 "상품권"을 구매하는 고객을 말한다.</p>
					<p>3."사용자": 직접 구매하거나 양도 받은 "상품권"을 물품대금 결제수단으로 사용하는 고객을 말한다.</p>
					<p>4."가맹점": "발행사"와 가맹계약을 맺고 "사용자"가 "상품권" 사용시 원장에 표시된 금액에 해당하는
						재화 또는 용역을 제공할 의무를 가진 자를 말한다.</p>
					<p>5."제휴 위탁사": "발행사"와 계약을 맺고, "발행사"의 의무를 대신하여 환불, 판매, 회수를 대행하는
						자를 말한다.</p>
					<p>6."판매처": "발행사"와 계약을 맺고, "발행사"의 의무를 대신하여 판매를 대행하는 자를 말한다.</p>

					<h2 class="inner-title">제3조(구매 및 인증)</h2>
					<p>1."상품권"은 "발행사" 또는 "제휴 위탁사"가 판매를 위탁한 "판매처"에서 구입할 수 있다.</p>
					<p>2."상품권"은 "제휴 위탁사"와 합의하여 현금, 직불카드, 신용카드 등으로 선택적으로 구매할 수 있다.
						다만, 신용카드 및 직불카드 구매한도는 여신전문금융업법 시행규칙에서 정하는 범위 내로 제한될 수 있다.</p>
					<p>3."상품권"의 최초 "구매자"는 구매 시 "상품권" 활성화(Activation)를 위한 인증을 받아야
						한다.</p>
					<p>4."발행사" 또는 "제휴 위탁사"는 상품권 시스템을 통하여 "상품권" 원장 데이터의 유효성을 검증하고,
						인증에 대한 결과를 "구매자"에게 고지(인증번호 부여 또는 영수증 제공)하여야 한다.</p>

					<h2 class="inner-title">제4조(권종 및 충전)</h2>
					<p>1."상품권"은 "정액권"과 "충전권", "물품교환권"으로 구분하되, "정액 권"은 권면금액 5만원,
						10만원, 30만원, 50만원으로 구분하여 발행한다, 다만, "구매자"의 편의를 고려하여 "발행사"는 권면금액을 추가
						또는 변경할 수 있다.</p>
					<p>2."충전권"은 권면 금액에 관계 없이, "구매자"가 자유롭게 금액을 추가하여 구매 할 수 있으며,
						"기명식"은 200만원, "무기명식"은 50만원으로 한도를 제한 한다. 다만, 전자금융거래법 제23조에 근거 및 구매자
						편의를 고려하여 충전한도를 하향하여 변경 할 수 있다.</p>
					<p>3."발행사" 또는 "제휴 위탁사"는 "단말기"을 통하여 "상품권"의 충전금액 및 데이터의 유효성을
						검증하고, 충전에 대한 결과를 구매자에게 고지(인증번호 부여 또는 영수증 제공)하여야 한다.</p>

					<h2 class="inner-title">제5조(사용 및 양도)</h2>
					<p>1."상품권"은 "충전형", "권종형"은 잔액의 범위 내에서 이용횟수의 제한 없이 일시불 구매방법으로
						"발행사"와 "가맹점"에서 사용할 수 있다.</p>
					<p>2."상품권"의 "구매자"는 이를 타인에게 양도할 수 있으며, 이를 양수 받아 사용하는 사용자도 가맹점에서
						전항의 방법으로 이용할 수 있으며, 재 양도할 수 있다. 단, "모바일상품권"의 경우 수신자 변경 후 양도 할 수
						있다.</p>

					<h2 class="inner-title">제6조(사용의 제한)</h2>
					<p>
						1."상품권"은 다음의 경우에 사용이 제한 될 수 있다.<br> 가."상품권" 구매 시
						인증(Activation)을 받지 않은 경우<br> 나.해당 "상품권"의 잔액이 이용하고자 하는 금액보다 적은
						경우<br> 다."상품권"이 사용중지 상태인 경우<br> 라.전산시스템의 오류, 통신 불능, 단말기의
						고장 등 "상품권"의 사용을 위한 유효성을 검증 할 수 없는 경우
					</p>
					<p>2."상품권"이 위, 변조 또는 기타 부정하게 발행된 경우, 잔액에 관계없이 "발행사"는 "사용자"의
						"상품권"의 사용을 제한 할 수 있다.</p>
					<p>3."상품권"을 불법할인, 현금융통 등의 방법으로 사용하여서는 안되며, 그러한 경우 "사용자"는 그 책임의
						전부 또는 일부를 부담할 수 있다.</p>

					<h2 class="inner-title">제7조 (거래내용의 확인)</h2>
					<p>1."발행사"는 "사용자"의 요청이 있는 경우, 관련법에서 정한 보존기간내의 거래내용을 확인해주어야 하며,
						서면(전자문서를 제외한다.)으로 제공할 것을 요청하는 경우에는 그 요청을 받은 날부터 2주 이내에 거래내용에 관한
						서면을 교부하여야 한다. 다만, 전자적 장치의 운영장애, 그 밖의 사유로 거래내용을 확인하게 할 수 없는 때에는 인터넷
						등을 이용하여 즉시 그 사유를 알리고, 그 사유가 종료된 때부터 "사용자"가 거래내용을 확인할 수 있도록 하여야 한다.</p>
					<p>2."발행사"는 "사용자"에게 거래내용을 서면으로 제공할 것을 요청 받은 경우 전자적 장치의 운영장애, 그
						밖의 사유로 거래내용을 제공할 수 없는 때에는 그 "사용자"에게 즉시 이를 알려야 한다. 이 경우 법 제7조제2항의
						거래내용에 관한 서면의 교부기간을 산정함에 있어서 전자적 장치의 운영장애, 그 밖의 사유로 거래내용을 제공할 수 없는
						기간은 산입하지 아니한다.</p>
					<p>이용자는 거래내용을 서면으로 제공받고자 하는 경우에는 발행자의 본사(전화번호:02-2187-2700, 주소:
						서울시 마포구 아현동 686번지 Credit Center Building 5F, 이메일주소:
						nicegiftcard@nicevan.co.kr)로 신청 하여야 한다.</p>

					<h2 class="inner-title">제8조 (오류의 정정 등)</h2>
					<p>1."사용자"는 전자금융거래에 오류가 있음을 안 때에는 그 발행자에게 이에 대한 정정을 요구할 수 있다.</p>
					<p>2."발행사"는 제1항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를
						받은 날부터 2주 이내에 오류의 원인과 처리 결과를 문서로 알려야 하며, 다만, "사용자"가 요청하면 전화 또는
						전자우편 등의 방법으로 알릴 수 있다.</p>
					<p>3."발행사"는 스스로 전자금융거래에 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 오류가 있음을
						안 날부터 2주 이내에 오류의 원인과 처리 결과를 전항과 같은 방법으로 "사용자"에게 알려야 한다.</p>

					<h2 class="inner-title">제9조(유효기간)</h2>
					<p>"상품권"의 유효기간은 구매시점("권종형"은 최초구매일자, "충전형"은 최종충전일)으로부터 5년이며,
						유효기간이 경과한 카드로 결제 및 환불, 교환은 할 수 없다. 단, 이벤트 및 행사를 통하여 무상 제공된 "상품권"은
						별도 표기된 유효기간으로 정한다.</p>
					<p>"사용자"는 유효기간 내에는 연장을 요청할 수 있으며 특별한 사유가 없는 경우 유효기간이 연장된다. 단,
						이벤트, 행사 등을 통해 무상으로 양도받은 "상품권"은 연장 할 수 없다.</p>

					<h2 class="inner-title">제10조(구매 취소의 방법)</h2>
					<p>1.구매한 "상품권"은 현금으로 반환되지 않는다. 다만, "구매자"가 "상품권"을 사용하지 않거나, 포장
						등의 상태가 양호한 경우에는 "발행사"가 정한 일정 기간 내에서 판매 취소 할 수 있다. 다만, "발행사"는 취소
						기한을 구매시점에 "구매자"에게 "판매처"에서 사전에 고지하여야 한다.</p>
					<p>2."충전권" "상품권"의 재충전 취소 요청 시 취소요청 금액이 잔액보다 적을 경우, 취소 요청을 제한
						한다.</p>

					<h2 class="inner-title">제11조("상품권"의 환급)</h2>
					<p>다음 각 호의 어느 하나에 해당하는 경우에는 "상품권"에 기록된 잔액의 전부를 현금으로 환급 받을 수 있다.</p>
					<p>1.천재지변 등의 사유로 가맹점이 재화 또는 용역을 제공하기 곤란하여 "상품권"을 사용하지 못하게 된 경우</p>
					<p>2."상품권"의 결함으로 "가맹점"이 재화 또는 용역을 제공하지 못하는 경우</p>
					<p>3."상품권"의 금액("권종형"의 경우 권면금액, "충전형"의 경우 최종충전시점에 기재된 금액)의
						60%이상(1만원 이하 "상품권"의 경우 80%이상) 소진 시 그 잔액에 대해서는 현금으로 환불 받으실 수 있습니다.
						단 환불 금액은 구매액을 기준으로 사용비율에 따라 계산하여 남은 비율의 금액을 환불한다. 단, 이벤트, 행사 등을 통해
						무상제공(무료, 이벤트 등)받은 "상품권"의 경우에는 환불을 받을 수 없다.</p>
					<p>4.기타 "발행사"가 본 서비스를 중단하는 것을 사전에 통지한 경우</p>
					<p>5.환불금액은 계좌이체 요청일 경우 제반 비용을(계좌이체 실비) 제외 후 입금된다.</p>

					<h2 class="inner-title">제12조("상품권"의 분실과 도난 책임)</h2>
					<p>1."사용자"의 "상품권" 관리소홀로 인한 분실 혹은 도용 시 그에 대한 책임은 "사용자"에게 있다.</p>
					<p>2."발행사"는 "사용자"에게 "상품권"의 분실이나 도난 등의 통지를 받은 때에는 "상품권" 번호 및
						이용자의 신분이 확인 될 경우, "발행사"는 해당 "상품권"의 사용을 정지 할 수 있다. 다만, 그 때부터 제3자가 그
						"상품권"을 사용함으로 인하여 "사용자"에게 발생한 손해를 배상할 책임을 진다.</p>
					<p>3."발행사"는 정지된 "상품권"에 대하여 "사용자"의 요청 시, 해당금액만큼 잔액환불 또는 다른
						"상품권"로 대체 하여 제공할 수 있다. 이 경우, "발행사"는 소정의 수수료를 "사용자"에게 부담하게 할 수 있다.</p>

					<h2 class="inner-title">제13조(위조나 변조 시 책임)</h2>
					<p>1."발행사"는 "상품권"의 위조나 변조로 발생한 사고, 계약체결 또는 거래지시의 전자적 전송이나
						처리과정에서 발생한 사고로 인하여 "사용자"에게 손해가 발생한 경우에는 그 손해를 배상할 책임을 진다.</p>
					<p>
						2.제1항의 규정에 불구하고 금융기관 또는 전자금융업자는 다음 각 호의 어느 하나에 해당하는 경우에는 그 책임의 전부
						또는 일부를 이용자가 부담하게 할 수 있다.<br> 가.사고 발생에 있어서 "사용자"의 전자금융거래법 시행령
						제8조에서 규정 한 고의나 중대한 과실이 있는 경우로서 그 책임의 전부 또는 일부를 "사용자"의 부담으로 할 수 있다는
						취지의 약정을 미리 이용자와 체결한 경우<br> 나.법인(「중소기업기본법」제2조제2항에 의한 소기업을
						제외한다)인 "사용자"에게 손해가 발생한 경우로 "발행사"가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히
						준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우
					</p>

					<h2 class="inner-title">제14조 (약관의 명시와 변경통지 등)</h2>
					<p>1."발행사"는 "사용자"와 전자금융거래의 계약을 체결함에 있어서 약관을 명시하여야 하고, 이용자의 요청이
						있는 경우에는 금융위원회가 정하는 방법에 따라 그 약관의 사본을 교부하고 그 약관의 내용을 설명하여야 한다.</p>
					<p>2."발행사"는 제1항의 규정을 위반하여 계약을 체결한 때에는 당해 약관의 내용을 계약의 내용으로 주장할 수
						없다.</p>
					<p>3."발행사"는 약관을 변경하는 때에는 변경되는 약관의 시행일 1월 전에 금융위원회가 정하는 방법에 따라
						이를 게시하고 "사용자"에게 알려야 한다. 다만, 법령의 개정으로 인하여 긴급하게 약관을 변경하는 때에는 금융위원회가
						정하는 방법에 따라 이를 즉시 게시하고 이용자에게 알려야 한다.</p>
					<p>4."사용자"는 제3항의 규정에 따른 약관의 변경내용이 게시되거나 통지된 후부터 변경되는 약관의 시행일 전의
						영업 일까지 전자금융거래의 계약을 해지할 수 있다. 전단의 기간 안에 "사용자"가 약관의 변경내용에 대하여 이의를
						제기하지 아니하는 경우에는 약관의 변경을 승인한 것으로 본다.</p>

					<h2 class="inner-title">제15조(신용정보의 제공/이용 등)</h2>
					<p>1."발행사"는 이 계약과 관련하여 취득한 회원의 신용정보를 관련 법률에 정한 바에 따라 엄격히 관리해야
						하며 회원이 제공/활용에 동의한 경우에는 회원이 동의한 범위 내에서 신용정보집중기관, 신용정보업자, 신용정보제공,
						이용자, 제휴업체와 정보를 교환하여 이용할 수 있다. 다만, 회원이 해지한 이후에는 관련 법령이 정하는 바 이외에는
						이용하지 않는다.</p>
					<p>2."가맹점"과 "사용자" 간에 "상품권"거래로 인하여 분쟁이 발생하였을 경우, "발행사"는 "사용자"의
						정보를 "가맹점"에게 제공할 수 있으며, "사용자"는 "가맹점"의 정보를 요구할 수 있다.</p>

					<h2 class="inner-title">제16조(위반시의 책임)</h2>
					<p>"발행사"와 "사용자"는 이 약관을 위반함으로써 발생하는 모든 책임을 각자가 부담하며, 이로 인하여
						상대방에게 손해를 입힌 경우에는 이를 배상하여야 한다.</p>

					<h2 class="inner-title">제17조(이 약관에서 정하지 아니한 사항)</h2>
					<p>이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 관계법령 또는 일반 상 관례에 따른다.</p>

					<h2 class="inner-title">제18조(지급보증)</h2>
					<p>"발행사"에서 발행하는 "상품권"은 전자금융어법에 속하며 지급보증 또는 피해보상보험계약(당 "발행사"는
						예치금 3억을 통한 지급보증을 함)에 대하여 책임과 의무가 있고, "상품권"의 지급보증은 전자적으로 등록된 금액에
						등록된 바에 따른다.</p>

					<h2 class="inner-title">제19조(관할법원)</h2>
					<p>이 약관에 따른 거래에 관하여 분쟁이 발생한 경우에는 민사소송법상의 관할법원의 규정에 따른다. 다만,
						채무자의 책임 있는 사유로 부실채권이 발생되어 그 채권의 관리를 위하여 "발행사"의 본점 또는 다른 영업소로 그
						채권관리를 위임한 경우에는 이관 받은 본점 또는 다른 영업소의 소재지 지방법원을 관할법원으로 한다.</p>

					<p>※ 최종개정일자 : 2015.11.04</p>

				</div>
			</div>
			<div class="layer_btn_area">
				<button class="btn_layer_confirm btnMedium fullGreen">
					<span>확인</span>
				</button>
			</div>
			<button class="layer_close">창 닫기</button>
		</div>
	</div>
	
	<script>
	$(function() {
		$(".gc-landing-notice > li").on("click", function() {
			$(this).find(".gc-landing-notice-tit").toggleClass("active");
			$(this).find(".gc-landing-notice-tit").next().slideToggle("fast")
			/* if($(this).find(".gc-landing-notice-tit").hasClass("active")) {
				$(this).find(".gc-landing-notice-tit").next().show();
			} else {
				$(this).find(".gc-landing-notice-tit").next().hide();
			} */
		});
		
		
	});
		
		
	</script>
</body>
</html>