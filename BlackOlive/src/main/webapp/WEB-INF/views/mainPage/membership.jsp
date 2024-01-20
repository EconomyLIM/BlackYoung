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
	<div id="Wrapper">
		<div id="Container" class="renew-mem-lounge">
			<sec:authorize access="isAuthenticated()">
				<input id="gradeName" type="hidden" value='<sec:authentication property="principal.member.gradeName"/>'>
			</sec:authorize>
			<!-- #Contents -->
			<div class="title-coupon">
				<h1>
					올리브 멤버스 라운지<span class="txtg">쇼핑하는 재미! 올리브영만의 더 특별한 혜택</span>
				</h1>
			</div>

			<script>
				// 올리브 멤버스, 쿠폰/혜택 
				$(function() {
					let divBackgroundColor = $("<div>").addClass("dimm").css("z-index", "990px");
					// 다양한 혜택 팝업 창
					$(".button-benefit-info.posL").on("click", function() {
						$("#lay_grade_selection").addClass("show");
						popupCenter($("#lay_grade_selection"));
						$("body").append(divBackgroundColor);
					});
					
					$(".layer_close.type2").on("click", function() {
						$("#lay_grade_selection").removeClass("show");
						$(".dimm").remove();
					});
					
					$(".button-benefit-info.posR").on("click", function() {
						$("#layer_pop_wrap").show();
						popupCenter($("#layer_pop_wrap"));
						$("body").append(divBackgroundColor);
					});
					
					$(".ButtonClose").on("click", function() {
						$("#layer_pop_wrap").hide();
						$(".dimm").remove();
					});
					
					$("#Contents > div:nth-child(1) > div.rating-info-content > div.graph-info > p > button")
						.on("click", function() {
							$("#lay_total_buy").show();
							popupCenter($("#lay_total_buy"));
							$("body").append(divBackgroundColor);
						});
					
					$("#lay_total_buy > div > button").on("click", function() {
						$("#lay_total_buy").hide();
						$(".dimm").remove();
					});
					
					
					// 등급 배경색 설정
					let grade = $("#gradeName").val();
					$("#Contents .rating-info-area").addClass(`\${grade.split(" ")[0].toLowerCase()}`);
					
					$(".table-box").addClass(`\${grade.split(" ")[0].toLowerCase()}`);
				})
			</script>

			<ul class="comm5sTabs tab2">
				<li class="on">
					<button type="button" title="선택됨" onclick="javascript:location.href='<c:url value="/store/getMembership"/>'">올리브 멤버스</button>
				</li>
				<li>
					<button type="button" id="couponButton" onclick="javascript:location.href='<c:url value="/store/getCoupon"/>'">쿠폰/혜택</button>
				</li>
			</ul>

			<!-- <div class="coupon-area"> -->
			<div id="couponMainHtml">
				<!-- //올리브영멤버십 START -->
				<div id="Contents">

				<sec:authorize access="isAuthenticated()">
					<div class="rating-info-area" style="">
							<div class="user-rating">
								<span class="baddge-img"></span>
								<div class="user-rate-area">
									<p class="user-name-text">
										<em class="user-name"><sec:authentication property="principal.member.userName"/></em>님의 등급
									</p>
									<strong class="user-rate-text"><sec:authentication property="principal.member.gradeName"/></strong>
									<p class="user-rate-date">
										2023.07.04 - 2023.12.31
									</p>
								</div>
							</div>
							<div class="rating-info-content">
								<div class="graph-info">
									<p class="graph-price-text">		
												<em class="sffont-area price-text">100,000</em>원
												<span class="price-text-span">추가 구매 시</span>
			
												<em class="sffont-area">2024년 상반기</em>
												<button type="button" class="button-benefit-info" data-rel="layer" data-target="lay_total_buy">
													<em class="sffont-area">PINK OLIVE</em>
												</button>						
									</p>
								</div>
								
								<div class="graph-area">
									<ul class="progress-list">
										<!--[D] 등급 완료 complet 클래스, 등급 진행 progress 클래스 width값 제어-->
										<li class="list-item progress">
											<span class="progress-rate" style="width: .0%;"></span> <!-- Baby  ~ Pink10 -->
										</li>
										<li class="list-item ">
											<span class="progress-rate" style="width: .0%;"></span> <!-- Pink ~ Green40 -->
										</li>
										<li class="list-item ">
											<span class="progress-rate" style="width: .0%;"></span> <!-- Green ~ Black70 -->
										</li>
										<li class="list-item ">
											<span class="progress-rate" style="width: .0%;"></span> <!-- Black ~ Gold100 -->
										</li>
									</ul>
									<ul class="rate-list">
										<!--[D] 등급 활성화 on 클래스-->
										<li class="list-item"><span>BABY</span></li>
										<li class="list-item  on "><span>PINK</span></li>
										<li class="list-item "><span>GREEN</span></li>
										<li class="list-item "><span>BLACK</span></li>
										<li class="list-item "><span>GOLD</span></li>
									</ul>
								</div>
							</div>
						</div>
						
						<div class="mem-content">
							<div class="content-tit-area">
								<h3 class="content-tit center-align">
									지금 받을 수 있는 쿠폰
									<span class="button-info-area">
										<button type="button" class="button-benefit-info posR"></button>
									</span>
								</h3>
							</div>
							<div class="conts">
								<ul class="cp_list one-coupon">
									<!-- OY -->
									<li class="item_coupon disabled " id="oyCpn">
										<div class="bx_txt">
											<div class="bx_inner">
												<p class="coupon_tit">												
															[BABY] 오늘드림 무료배송 쿠폰	
												</p>
												<p class="free-shipping-txt">													
															무료배송															
												</p>
												<p class="sub_txt">			
													<!-- GET수량금액구분코드[CD0649] 1:수량 / 2:금액 -->			
																1만원 이상 구매 시			
												</p>
												<div class="coupon-right">								
															<span class="coupon-number">오늘<br>드림</span>			
													<span class="download_complete">다운<br>완료</span>
													<button type="button" class="btn_coupon">
														<input type="hidden" name="cpnNo" value="yvKxrF30GRPS/ZNlZ+Hs7A==">
														<input type="hidden" name="cpnNoArr" value="yvKxrF30GRPS/ZNlZ+Hs7A==">
													</button>
												</div>
											</div>
										</div>
									</li>
									<!-- // OY -->
								</ul>
							</div>
						</div>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<div class="login-area">
							<p class="login-info-text">로그인 후 고객님의 등급과 특별한 혜택을 확인해보세요</p>
							<div class="login-button-area">
								<button type="button" class="button-login"
									onclick="javascript:location.href='<c:url value="/auth/login"/>'">로그인하기</button>
							</div>
						</div>
						
						<div class="mem-content">
							<h3 class="content-tit">올리브 멤버스 신규 가입 &amp; 첫 구매 혜택</h3>
							<ul class="newsign-benefits-list">
								<li class="list-item">
									<div class="list-content">
										<div class="content-area">
											<p class="list-content-title">올리브 멤버스 신규 가입 쿠폰</p>
											<em class="list-content-text">발급일로부터 <span
												class="sffont-area">30</span>일
											</em>
										</div>
									</div>
								</li>
								<li class="list-item">
									<div class="list-content">
										<div class="content-area">
											<p class="list-content-title">
												온라인몰 첫구매딜 <span class="sffont-area">100</span>원~
											</p>
											<em class="list-content-text">첫구매 <span
												class="sffont-area">1</span>회 한정
											</em>
										</div>
									</div>
								</li>
							</ul>
						</div>
				</sec:authorize>
					
					<!-- 로그인 후 -->
					<div class="rating-info-area " style="display: none;">
						<div class="user-rating">
							<span class="baddge-img"></span>
							<div class="user-rate-area">
								<p class="user-name-text">
									<em class="user-name"></em>님의 등급
								</p>
								<strong class="user-rate-text"></strong>
								<p class="user-rate-date">2023.07.04 - 2023.12.31</p>
							</div>
						</div>
						<div class="rating-info-content">
							<div class="graph-info">
								<p class="graph-price-text">
									<em class="sffont-area price-text"></em>원 <span
										class="price-text-span">추가 구매 시</span> <em class="sffont-area">2024년
										상반기</em>
									<button type="button" class="button-benefit-info"
										data-rel="layer" data-target="lay_total_buy">
										<em class="sffont-area"></em>
									</button>
								</p>
							</div>
							<div class="graph-area">
								<ul class="progress-list">
									<!--[D] 등급 완료 complet 클래스, 등급 진행 progress 클래스 width값 제어-->
									<li class="list-item "><span class="progress-rate"
										style="width: %;"></span> <!-- Baby  ~ Pink10 --></li>
									<li class="list-item "><span class="progress-rate"
										style="width: %;"></span> <!-- Pink ~ Green40 --></li>
									<li class="list-item "><span class="progress-rate"
										style="width: %;"></span> <!-- Green ~ Black70 --></li>
									<li class="list-item "><span class="progress-rate"
										style="width: %;"></span> <!-- Black ~ Gold100 --></li>
								</ul>
								<ul class="rate-list">
									<!--[D] 등급 활성화 on 클래스-->
									<li class="list-item"><span>BABY</span></li>
									<li class="list-item "><span>PINK</span></li>
									<li class="list-item "><span>GREEN</span></li>
									<li class="list-item "><span>BLACK</span></li>
									<li class="list-item "><span>GOLD</span></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- // 로그인 후 -->

					<!-- 비회원은 쿠폰 노출 X -->
					<div id="couponDescInfoLPop" style="display: none;">
						<div class="pop-conts w650">
							<h1 class="ptit">쿠폰 안내</h1>

							<div class="scroll-area" style="height: 520px;">
								<div class="common1s-list">



									<ul class="listHyphen">
										<span style="font-size: 14px;"></span>
										<span style="font-size: 16px;"><span
											style="color: #000000;"><b>올리브 멤버스 등급별 쿠폰 혜택</b></span></span>
										<p>
											<span style="font-size: 16px;"><span
												style="color: #000000;"><br> <strong>1.
														쇼핑쿠폰</strong></span></span><br> <span style="font-size: 14px;"><br>
												-&nbsp; <strong>GOLD</strong> / <strong>BLACK</strong> / <strong>GREEN</strong>
												/ <strong>PINK</strong>&nbsp;OLIVE 대상 제공&nbsp;(단, 임직원 제외)<br>
												-&nbsp;&nbsp;2023년 7월 4일 ~ 12월 31일 기간 중 온·오프라인 통합 1인 1회 사용
												가능<br> -&nbsp; 등급별로 제공되는 쿠폰은 상이하며, 승급 시점에 맞춰 등급별 일괄 제공
												(로그인 &gt; 마이페이지 &gt; 쿠폰 탭에서 확인 가능)</span>
										</p>

										<p>
											<span style="font-size: 14px;"><span
												style="color: #000000;"></span></span><br> <span
												style="font-size: 16px;"><span
												style="color: #000000;"><strong>2. 온라인몰 무료배송
														쿠폰</strong></span></span><br> <span style="font-size: 14px;"><br>
												-&nbsp; <strong>GOLD&nbsp;</strong>/&nbsp;<strong>BLACK&nbsp;</strong>/&nbsp;<strong>GREEN</strong>&nbsp;OLIVE의
												경우 6개월 내 총 5장, <strong>PINK</strong> OLIVE의 경우 6개월 내 1장 발급 및
												사용 가능 (단, 임직원 제외)<br> -&nbsp; 온라인몰에서 1만원 이상 주문 시 사용 가능<br>
												※ 해당 쿠폰은 온라인몰 전용 쿠폰으로 오프라인 매장에서는 사용 불가</span><br> <br> <span
												style="font-size: 16px;"><span
												style="color: #000000;"><strong>3. 오늘드림 무료배송
														쿠폰</strong></span></span><br> <span style="font-size: 14px;"><span
												style="color: #000000;"></span><br> -&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK</b>&nbsp;OLIVE의
												경우 월 1장,&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK&nbsp;</b>/&nbsp;<b>BABY</b>&nbsp;OLIVE의
												경우&nbsp;6개월 내&nbsp;1장&nbsp;발급 및 사용 가능 (단, 임직원 제외)<br>
												-&nbsp;&nbsp;&lt;오늘드림&gt;으로&nbsp;1만원 이상 주문 시 사용 가능<br>
												-&nbsp; &lt;일반 배송&gt;, &lt;업체 배송&gt; 및 &lt;오늘드림 픽업&gt; 주문 시
												사용 불가<br> ※ 해당 쿠폰은 온라인몰 전용 쿠폰으로 오프라인 매장에서는 사용 불가<span
												style="color: #000000;"></span></span><br> <br> <span
												style="font-size: 16px;"><span
												style="color: #000000;"><strong>4. LUXE EDIT
														할인&nbsp;쿠폰</strong></span></span><br> <span style="font-size: 14px;"><br>
												-&nbsp; LUXE EDIT 브랜드 상품 구매 시 사용 가능한 장바구니 쿠폰이며, LUXE EDIT
												브랜드에 한하여 할인 적용됨 (쿠폰 1장당 온·오프라인 통합 1회 사용 가능)<br>
												-&nbsp;&nbsp;등급별로 제공되는 쿠폰 상이함<br> -&nbsp;&nbsp;대상
												브랜드(총&nbsp;37개) :&nbsp;<br> 헤라, 프리메라, 랩시리즈, 에스티로더,
												크리니크, 오리진스,&nbsp;MAC, 달팡, 바비브라운, 아베다, 어반디케이, 비오템, 비오템옴므,
												베네피트, 록시땅, 차홍, 모로칸오일, 정샘물, THREE, 메모, 조러브스, 세르주루텐, 다비네스,
												빌리프, 아워글래스,&nbsp;RMK, 꼬달리, 더바디샵,&nbsp;LOMA, 저스트에즈아이엠, 비긴스,
												숨37, 르네휘테르, 올라플렉스,&nbsp;오휘, 아떼, 필립비<br> -&nbsp;&nbsp;5%
												할인 쿠폰의 경우,&nbsp;쿠폰 적용 전 결제금액 기준 최대&nbsp;40만원까지 적용 가능<br>
												-&nbsp;&nbsp;추후 쿠폰 적용 브랜드 추가 또는 제외될 수 있음</span>
										</p>

										<p>
											<span style="font-size: 14px;"><span
												style="color: #000000;"></span></span><br> <span
												style="font-size: 16px;"><span
												style="color: #000000;"><strong>5. 오늘드림 픽업
														할인 쿠폰</strong></span></span><br> <span style="font-size: 14px;"><span
												style="color: #000000;"></span><br> -&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK</b>&nbsp;OLIVE
												대상 6개월 내 1장 제공 (단, 임직원 제외)<br> -&nbsp;&nbsp;&lt;오늘드림
												픽업&gt; 으로 3만원 이상 주문 시 2천원 할인<br>
												-&nbsp;&nbsp;&lt;오늘드림&gt; 배송, &lt;일반 배송&gt; 및 &lt;업체 배송&gt;
												주문 시 사용 불가<span style="color: #000000;"></span></span><br>
											&nbsp;
										</p>

										<p>
											<span style="font-size: 14px;"><span
												style="color: #000000;"></span></span><span
												style="font-size: 16px;"><span
												style="color: #000000;"><b>6. W CARE 할인 쿠폰</b></span></span><br>
											<span style="font-size: 14px;"><span
												style="color: #000000;"></span><br> -&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK</b>&nbsp;OLIVE
												대상 6개월 내 1장 제공 (단, 임직원 제외)<br>
												-&nbsp;&nbsp;2023년&nbsp;7월
												4일&nbsp;~&nbsp;12월&nbsp;31일&nbsp;기간 중&nbsp;온·오프라인
												통합&nbsp;1인&nbsp;1회 사용 가능<br> -&nbsp;&nbsp;W CARE 카테고리
												상품 2만원&nbsp;이상 구매 시&nbsp;2천원 할인<br> ※ W CARE 카테고리 상품:
												온라인몰 내 &lt;여성/위생용품&gt; 카테고리 상품<span style="color: #000000;"></span></span><br>
											<br> <span style="font-size: 16px;"><span
												style="color: #000000;"><strong>7. </strong><b>선물하기
														전용 할인 쿠폰</b></span></span><br> <span style="font-size: 14px;"><span
												style="color: #000000;"></span><br> -&nbsp; <b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>OLIVE
												대상 6개월 내 1장 제공 (단, 임직원 제외)<br> -&nbsp;&nbsp;3만원 이상
												&lt;선물하기&gt; 주문 시 2천원 할인<br> -&nbsp;&nbsp;일반 구매가 아닌
												&lt;선물하기&gt; 구매 시에만 사용 가능</span><br> &nbsp;
										</p>

										<p>
											<span style="font-size: 14px;"><span
												style="color: #000000;"></span></span><span
												style="font-size: 16px;"><span
												style="color: #000000;"><b>8. 생일 쿠폰</b></span></span><br> <span
												style="font-size: 14px;"><span
												style="color: #000000;"></span><br> -&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK</b>&nbsp;OLIVE
												대상 인당 연 1회 제공 (단, 임직원 제외)<br> -&nbsp; 생일 당월 온·오프라인
												통합&nbsp;1회 사용 가능 (법정생년월일 기준)<br> -&nbsp;&nbsp;3만원 이상 구매
												시&nbsp;2천원 할인<span style="color: #000000;"></span></span><br>
											&nbsp;
										</p>

										<p>
											<span style="font-size: 14px;"><span
												style="color: #000000;"><b>[쿠폰 관련 공통 유의사항]</b></span><br>
												※ 장바구니 쿠폰은 상품 쿠폰과 중복 사용 가능하며, 상품 쿠폰 적용 후 최종 결제 금액 기준으로 조건 충족
												시 사용 가능<br> ※ 쿠폰 사용한 주문 건을 매장 환불 또는 온라인몰 주문 취소 시 쿠폰 사용
												기한 내 자동 재발급 (단, 부분 취소 및 부분 반품의 경우 예외)<br> ※ 제휴 및 임직원 카드
												사용 시 쿠폰 중복 적용 불가</span><br> <br> &nbsp;
										</p>

									</ul>
									<div class="mgT25"></div>

									<ul class="listHyphen">
										<span style="font-size: 14px;"><span
											style="color: #000000;"></span></span>
										<span style="font-size: 18px;"><span
											style="color: #000000;"><strong>이달의 쿠폰</strong></span></span>
										<br>
										<span style="font-size: 14px;"><br> -&nbsp; 각 쿠폰은
											ID당 1회 발급 및 사용 가능<br> -&nbsp; 주문 취소 시 쿠폰 사용 기한 내 자동
											재발급(부분취소 및 부분 반품의 경우 예외)<br> -&nbsp; 각 쿠폰별 할인율/할인금액,
											사용기간은 마이페이지&gt;쿠폰 통해 확인 가능<br> -&nbsp; 상품 쿠폰은 [업체배송]
											상품(베이비,식품,반려동물) 등 일부상품에 적용 불가<br> -&nbsp; 상품 쿠폰은 동일 상품
											2개 이상 구매 시 1개 상품에만 할인 적용 가능<br> -&nbsp; 상품 쿠폰은 상품 즉시 할인
											쿠폰과 중복 적용 불가<br> -&nbsp; 장바구니 쿠폰은 상품 쿠폰과 중복 사용 가능<br>
											-&nbsp; 장바구니 쿠폰은 상품 쿠폰 적용 후 최종 결제 금액 기준으로 조건 충족 시 사용 가능<br>
											-&nbsp; APP 전용 쿠폰은 모바일 앱에서만 발급 및 사용 가능<br> <br> ※
											쿠폰은 당사의 사정에 따라 별도 고지 없이 변경 또는 종료될 수 있음<br> ※ 쿠폰 사용 조건 및
											혜택 상세는 마이페이지&gt;쿠폰에서 확인 가능<br> ※ 특정 매장 및 일부 상품의 경우
											장바구니/상품 쿠폰 적용 제외</span>
										<br>
										<br> &nbsp;
									</ul>
									<div class="mgT25"></div>

									<ul class="listHyphen">
										<span style="font-size: 14px;"><span
											style="color: #000000;"></span></span>
										<span style="font-size: 18px;"><span
											style="color: #000000;"><strong>CJ ONE VIP 쿠폰
													안내</strong></span></span>
										<br>
										<span style="font-size: 14px;"><br> -&nbsp; 사용기간:
											2023년 1월 2일 ~ 2023년 12월 31일<br> -&nbsp; CJ ONE 회원 등급에 따라
											CJ ONE에서 쿠폰 발급 후 올리브영 온라인몰에서 다운로드 가능<br> -&nbsp; 오프라인 매장
											사용 시, CJ ONE 카드 또는 CJ ONE APP 제시 후 사용 가능<br> -&nbsp;
											기프트카드 등 일부 품목 구매 시 사용 불가<br> -&nbsp; 매장 환불 / 온라인몰 주문 취소
											시 쿠폰 사용 기한 내 자동 재발급 (부분취소 및 부분 반품의 경우 예외)<br> -&nbsp; 제휴
											및 임직원 카드 사용 시 쿠폰 중복 적용 불가<br> <br> ※ CJ ONE
											쿠폰은&nbsp;임직원 사용 제한 쿠폰으로 올리브영 온라인몰에서 다운로드 불가<br> ※ 특정 매장
											및 일부 상품의 경우 장바구니/상품 쿠폰 적용 제외</span>
										<br> &nbsp;
									</ul>
									<div class="mgT25"></div>



								</div>
							</div>
							<button type="button" class="ButtonClose">팝업창 닫기</button>
						</div>

					</div>
					
					<div class="mem-content">
						<h3 class="content-tit">
							올리브 멤버스 등급에 따른 다양한 혜택을 확인해보세요 <span class="button-info-area">
								<button type="button" class="button-benefit-info posL"
									data-rel="layer" data-target="lay_grade_selection"></button>
							</span>
						</h3>
						<!--[D] 등급별 클래스 추가 baby, pink, green, black, gold -->
						<div class="table-box ">
							<table class="benefit-table">
								<caption>
									<span class="blind">등급별 혜택 알림 테이블</span>
								</caption>
								<colgroup>
									<col style="width: 304px">
									<col style="width: 143px">
									<col style="width: 143px">
									<col style="width: 143px">
									<col style="width: 143px">
									<col style="">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">등급별 혜택</th>
										<th scope="col" class="sffont-area gold">GOLD<br>OLIVE
										</th>
										<th scope="col" class="sffont-area black">BLACK<br>OLIVE
										</th>
										<th scope="col" class="sffont-area green">GREEN<br>OLIVE
										</th>
										<th scope="col" class="sffont-area pink">PINK<br>OLIVE
										</th>
										<th scope="col" class="sffont-area baby">BABY<br>OLIVE
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">선정 기준<span class="table-sub-title">*직전
												반기 온・오프라인 누적 구매 금액</span></th>
										<td><span class="sffont-area">100</span>만원 이상</td>
										<td><span class="sffont-area">70</span>만원 이상 ~<br>
										<span class="sffont-area">100</span>만원 미만</td>
										<td><span class="sffont-area">40</span>만원 이상 ~<br>
										<span class="sffont-area">70</span>만원 미만</td>
										<td><span class="sffont-area">10</span>만원 이상 ~<br>
										<span class="sffont-area">40</span>만원 미만</td>
										<td><span class="sffont-area">10</span>만원 미만</td>
									</tr>
									<tr>
										<th scope="row">CJ ONE POINT 적립률</th>
										<td><span class="sffont-area">1.0%</span></td>
										<td><span class="sffont-area">1.0%</span></td>
										<td><span class="sffont-area">1.0%</span></td>
										<td><span class="sffont-area">0.5%</span></td>
										<td><span class="sffont-area">0.5%</span></td>
									</tr>
									<tr>
										<th scope="row">쇼핑 쿠폰<span class="table-sub-title">*<span
												class="sffont-area">6</span>개월 내 <span class="sffont-area">1</span>회
												온・오프라인 통합
										</span></th>
										<td><span class="sffont-area">4</span>장</td>
										<td><span class="sffont-area">3</span>장</td>
										<td><span class="sffont-area">2</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">온라인몰 배송 쿠폰</th>
										<td><span class="sffont-area">5</span>장</td>
										<td><span class="sffont-area">5</span>장</td>
										<td><span class="sffont-area">5</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">오늘드림 배송 쿠폰</th>
										<td><span class="sffont-area">6</span>장</td>
										<td><span class="sffont-area">6</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
									</tr>
									<tr>
										<th scope="row">LUXE EDIT 할인 쿠폰</th>
										<td><span class="sffont-area">3</span>장</td>
										<td><span class="sffont-area">2</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">오늘드림 픽업 할인 쿠폰</th>
										<td><span class="sffont-area">1</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">W CARE 할인 쿠폰</th>
										<td><span class="sffont-area">1</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">선물하기 전용 할인 쿠폰</th>
										<td><span class="sffont-area">1</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td><span class="sffont-area">1</span>장</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">생일 쿠폰<span class="table-sub-title">*생일월
												한정, <strong style="color: red; text-decoration: underline">인당
													연 1회 제공</strong>
										</span></th>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">올리브 데이 등급별 쿠폰</th>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
									</tr>
									<tr>
										<th scope="row">올리브 데이 등급별 샘플링<span
											class="table-sub-title">*선착순, 오프라인 한정</span></th>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
									</tr>
									<tr>
										<th scope="row">올리브 키트<span class="table-sub-title">*선착순,
												매월 상이</span></th>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
										<td><span class="check-td"></span></td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>

					<div class="mem-content">
						<h3 class="content-tit center-align">올리브 멤버스 이벤트</h3>
						<div class="mem-banner-slide slick-initialized slick-slider">
							<div aria-live="polite" class="slick-list draggable">
								<div class="slick-track" role="listbox"
									style="opacity: 1; width: 1035px; transform: translate3d(0px, 0px, 0px);">
									<div class="slide-item slick-slide slick-current slick-active"
										data-slick-index="0" aria-hidden="false" style="width: 330px;"
										tabindex="-1" role="option" aria-describedby="slick-slide00">
										<a
											href="javascript:main.membership.eventListClick('00000000020436','planshop/getPlanShopDetail.do?dispCatNo=500000102970001', '1', getEventParameterString({t_page:'멤버십라운지', t_click:'맴버십_이벤트배너', t_event_name:'이달의 포토리뷰어 되고', t_number: '1'}));"
											data-attr="멤버십쿠폰^멤버십라운지_이벤트^참여가능 이벤트 이달의 포토리뷰어 되고^1"
											tabindex="0"> <img
											src="https://image.oliveyoung.co.kr/uploads/images//event/3758842801183803544.jpg"
											alt="참여가능 이벤트 이달의 포토리뷰어 되고">
										</a>
									</div>
									<div class="slide-item slick-slide slick-active"
										data-slick-index="1" aria-hidden="false" style="width: 330px;"
										tabindex="-1" role="option" aria-describedby="slick-slide01">
										<a
											href="javascript:main.membership.eventListClick('00000000012813','planshop/getPlanShopDetail.do?dispCatNo=500000103040001', '2', getEventParameterString({t_page:'멤버십라운지', t_click:'맴버십_이벤트배너', t_event_name:'올리브영 온라인몰 첫 구매 EVENT', t_number: '2'}));"
											data-attr="멤버십쿠폰^멤버십라운지_이벤트^참여가능 이벤트 올리브영 온라인몰 첫 구매 EVENT^2"
											tabindex="0"> <img
											src="https://image.oliveyoung.co.kr/uploads/images//event/4500819690255479549.jpg"
											alt="참여가능 이벤트 올리브영 온라인몰 첫 구매 EVENT">
										</a>
									</div>
									<div class="slide-item slick-slide slick-active"
										data-slick-index="2" aria-hidden="false" style="width: 330px;"
										tabindex="-1" role="option" aria-describedby="slick-slide02">
										<a
											href="javascript:main.membership.eventListClick('00000000018693','planshop/getPlanShopDetail.do?dispCatNo=500000103410003', '3', getEventParameterString({t_page:'멤버십라운지', t_click:'맴버십_이벤트배너', t_event_name:'올리브 멤버스 신규 가입 혜택', t_number: '3'}));"
											data-attr="멤버십쿠폰^멤버십라운지_이벤트^참여가능 이벤트 올리브 멤버스 신규 가입 혜택^3"
											tabindex="0"> <img
											src="https://image.oliveyoung.co.kr/uploads/images//event/2767111628600750316.jpg"
											alt="참여가능 이벤트 올리브 멤버스 신규 가입 혜택">
										</a>
									</div>
								</div>
							</div>

						</div>
					</div>

					<div class="mem-content">
						<dl class="mem-info">
							<dt>올리브 멤버스 등급 기준</dt>
							<dd>
								<ul class="mem-info-list">
									<li class="list-item">2023년 하반기 올리브 멤버스 등급 적용 기간 : 2023년
										7월 4일 ~ 2023년 12월 31일<br> *2023년 하반기 : 2023년 7월 4일 승급 진행
										/ 2024년 상반기 : 2024년 1월 3일 승급 진행 예정
									</li>
									<li class="list-item">2023년 하반기 올리브 멤버스 등급 산정 기간 : 2023년
										1월 1일 ~ 2023년 6월 30일 / 온, 오프라인 누적 구매 금액 기준으로 반영</li>
									<li class="list-item">2023년 하반기 등급은 2023년 6월 30일 기준 올리브영
										홈페이지 회원 가입(이용약관 동의)이 확인된 회원의 실적이 반영됩니다.</li>
									<li class="list-item">올리브영 홈페이지 회원 가입(이용약관 동의)과 동시에 BABY
										OLIVE 등급이 즉시 부여됩니다.</li>
								</ul>
							</dd>
							<dt>유의사항</dt>
							<dd>
								<ul class="mem-info-list">
									<li class="list-item">올리브 멤버스 등급 산정 시 실적으로 반영되는 누적 구매 금액은
										실 결제 금액(포인트 결제 금액, 기프트카드 사용 금액 포함) 기준이며 제휴 할인, 쿠폰 할인, 배송비를
										비롯하여, 기프트카드를 포함한 유가증권, 담배, 쇼핑 봉투 구매 금액은 제외됩니다.</li>
									<li class="list-item">쿠폰 혜택의 경우 쿠폰에 명시된 쿠폰 사용 기간 내에만 사용
										가능하며, 추가 발급 및 재발행은 불가합니다.</li>
									<li class="list-item">CJ 임직원의 경우, 올리브 멤버스 등급과 상관없이 하기 명시된
										온·오프라인 쿠폰의 발급 및 사용이 제한됩니다.<br> *장바구니 쿠폰, 올리브 데이 할인 쿠폰,
										LUXE EDIT 할인 쿠폰, 온라인몰 무료배송 쿠폰, 오늘드림 무료배송 쿠폰, 오늘드림 픽업 할인 쿠폰,
										W케어 할인 쿠폰, 선물하기 전용 할인 쿠폰, 생일 쿠폰 등
									</li>
									<li class="list-item">쿠폰 혜택을 제외한 회원 혜택은 올리브영 홈페이지를 통해 별도
										고지하며, 혜택의 성격에 따라 선착순 또는 추첨 방식으로 증정될 수 있습니다.</li>
									<li class="list-item">결제 시 CJ ONE 포인트 적립률은 올리브 멤버스 등급별로
										상이합니다.<br> *GOLD OLIVE: 1.0%, BLACK OLIVE: 1.0%, GREEN
										OLIVE: 1.0%, PINK OLIVE: 0.5%, BABY OLIVE: 0.5%, 올리브 멤버스가 아닌
										CJ ONE 회원: 0.1%<br> *제휴카드 사용 시 CJ ONE 포인트는 올리브 멤버스 등급과
										무관하게 결제 금액의 0.1% 적립, 포인트 제휴 할인 카드의 경우 카드사 기준에 따라 일부 상이
									</li>
									<li class="list-item">결제 시 사용한 CJ ONE 포인트, 쿠폰 할인 금액, 배송비
										결제 금액 및 기프트카드를 포함한 유가증권, 담배, 쇼핑봉투 구매 금액은 CJ ONE 포인트 적립에서
										제외됩니다.</li>
									<li class="list-item">상기 회원 혜택은 당사의 사정에 의해 변경될 수 있습니다.</li>
									<li class="list-item">일부 쿠폰 혜택의 경우 제휴/임직원 카드 사용 시 중복 적용
										불가합니다.</li>
								</ul>
							</dd>
						</dl>
					</div>
				</div>
				<!-- //Contents -->

				<div id="couponDescInfoLPop" style="display: none;">
					<div class="pop-conts w650">
						<h1 class="ptit">쿠폰 안내</h1>

						<div class="scroll-area" style="height: 520px;">
							<div class="common1s-list">



								<ul class="listHyphen">
									<span style="font-size: 14px;"></span>
									<span style="font-size: 16px;"><span
										style="color: #000000;"><b>올리브 멤버스 등급별 쿠폰 혜택</b></span></span>
									<p>
										<span style="font-size: 16px;"><span
											style="color: #000000;"><br> <strong>1.
													쇼핑쿠폰</strong></span></span><br> <span style="font-size: 14px;"><br>
											-&nbsp; <strong>GOLD</strong> / <strong>BLACK</strong> / <strong>GREEN</strong>
											/ <strong>PINK</strong>&nbsp;OLIVE 대상 제공&nbsp;(단, 임직원 제외)<br>
											-&nbsp;&nbsp;2023년 7월 4일 ~ 12월 31일 기간 중 온·오프라인 통합 1인 1회 사용 가능<br>
											-&nbsp; 등급별로 제공되는 쿠폰은 상이하며, 승급 시점에 맞춰 등급별 일괄 제공 (로그인 &gt;
											마이페이지 &gt; 쿠폰 탭에서 확인 가능)</span>
									</p>

									<p>
										<span style="font-size: 14px;"><span
											style="color: #000000;"></span></span><br> <span
											style="font-size: 16px;"><span style="color: #000000;"><strong>2.
													온라인몰 무료배송 쿠폰</strong></span></span><br> <span style="font-size: 14px;"><br>
											-&nbsp; <strong>GOLD&nbsp;</strong>/&nbsp;<strong>BLACK&nbsp;</strong>/&nbsp;<strong>GREEN</strong>&nbsp;OLIVE의
											경우 6개월 내 총 5장, <strong>PINK</strong> OLIVE의 경우 6개월 내 1장 발급 및
											사용 가능 (단, 임직원 제외)<br> -&nbsp; 온라인몰에서 1만원 이상 주문 시 사용 가능<br>
											※ 해당 쿠폰은 온라인몰 전용 쿠폰으로 오프라인 매장에서는 사용 불가</span><br> <br> <span
											style="font-size: 16px;"><span style="color: #000000;"><strong>3.
													오늘드림 무료배송 쿠폰</strong></span></span><br> <span style="font-size: 14px;"><span
											style="color: #000000;"></span><br> -&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK</b>&nbsp;OLIVE의
											경우 월 1장,&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK&nbsp;</b>/&nbsp;<b>BABY</b>&nbsp;OLIVE의
											경우&nbsp;6개월 내&nbsp;1장&nbsp;발급 및 사용 가능 (단, 임직원 제외)<br>
											-&nbsp;&nbsp;&lt;오늘드림&gt;으로&nbsp;1만원 이상 주문 시 사용 가능<br>
											-&nbsp; &lt;일반 배송&gt;, &lt;업체 배송&gt; 및 &lt;오늘드림 픽업&gt; 주문 시
											사용 불가<br> ※ 해당 쿠폰은 온라인몰 전용 쿠폰으로 오프라인 매장에서는 사용 불가<span
											style="color: #000000;"></span></span><br> <br> <span
											style="font-size: 16px;"><span style="color: #000000;"><strong>4.
													LUXE EDIT 할인&nbsp;쿠폰</strong></span></span><br> <span
											style="font-size: 14px;"><br> -&nbsp; LUXE EDIT
											브랜드 상품 구매 시 사용 가능한 장바구니 쿠폰이며, LUXE EDIT 브랜드에 한하여 할인 적용됨 (쿠폰
											1장당 온·오프라인 통합 1회 사용 가능)<br> -&nbsp;&nbsp;등급별로 제공되는 쿠폰
											상이함<br> -&nbsp;&nbsp;대상 브랜드(총&nbsp;37개) :&nbsp;<br>
											헤라, 프리메라, 랩시리즈, 에스티로더, 크리니크, 오리진스,&nbsp;MAC, 달팡, 바비브라운, 아베다,
											어반디케이, 비오템, 비오템옴므, 베네피트, 록시땅, 차홍, 모로칸오일, 정샘물, THREE, 메모,
											조러브스, 세르주루텐, 다비네스, 빌리프, 아워글래스,&nbsp;RMK, 꼬달리,
											더바디샵,&nbsp;LOMA, 저스트에즈아이엠, 비긴스, 숨37, 르네휘테르, 올라플렉스,&nbsp;오휘,
											아떼, 필립비<br> -&nbsp;&nbsp;5% 할인 쿠폰의 경우,&nbsp;쿠폰 적용 전 결제금액
											기준 최대&nbsp;40만원까지 적용 가능<br> -&nbsp;&nbsp;추후 쿠폰 적용 브랜드 추가
											또는 제외될 수 있음</span>
									</p>

									<p>
										<span style="font-size: 14px;"><span
											style="color: #000000;"></span></span><br> <span
											style="font-size: 16px;"><span style="color: #000000;"><strong>5.
													오늘드림 픽업 할인 쿠폰</strong></span></span><br> <span style="font-size: 14px;"><span
											style="color: #000000;"></span><br> -&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK</b>&nbsp;OLIVE
											대상 6개월 내 1장 제공 (단, 임직원 제외)<br> -&nbsp;&nbsp;&lt;오늘드림
											픽업&gt; 으로 3만원 이상 주문 시 2천원 할인<br>
											-&nbsp;&nbsp;&lt;오늘드림&gt; 배송, &lt;일반 배송&gt; 및 &lt;업체 배송&gt;
											주문 시 사용 불가<span style="color: #000000;"></span></span><br>
										&nbsp;
									</p>

									<p>
										<span style="font-size: 14px;"><span
											style="color: #000000;"></span></span><span style="font-size: 16px;"><span
											style="color: #000000;"><b>6. W CARE 할인 쿠폰</b></span></span><br>
										<span style="font-size: 14px;"><span
											style="color: #000000;"></span><br> -&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK</b>&nbsp;OLIVE
											대상 6개월 내 1장 제공 (단, 임직원 제외)<br>
											-&nbsp;&nbsp;2023년&nbsp;7월
											4일&nbsp;~&nbsp;12월&nbsp;31일&nbsp;기간 중&nbsp;온·오프라인
											통합&nbsp;1인&nbsp;1회 사용 가능<br> -&nbsp;&nbsp;W CARE 카테고리 상품
											2만원&nbsp;이상 구매 시&nbsp;2천원 할인<br> ※ W CARE 카테고리 상품: 온라인몰
											내 &lt;여성/위생용품&gt; 카테고리 상품<span style="color: #000000;"></span></span><br>
										<br> <span style="font-size: 16px;"><span
											style="color: #000000;"><strong>7. </strong><b>선물하기
													전용 할인 쿠폰</b></span></span><br> <span style="font-size: 14px;"><span
											style="color: #000000;"></span><br> -&nbsp; <b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>OLIVE
											대상 6개월 내 1장 제공 (단, 임직원 제외)<br> -&nbsp;&nbsp;3만원 이상
											&lt;선물하기&gt; 주문 시 2천원 할인<br> -&nbsp;&nbsp;일반 구매가 아닌
											&lt;선물하기&gt; 구매 시에만 사용 가능</span><br> &nbsp;
									</p>

									<p>
										<span style="font-size: 14px;"><span
											style="color: #000000;"></span></span><span style="font-size: 16px;"><span
											style="color: #000000;"><b>8. 생일 쿠폰</b></span></span><br> <span
											style="font-size: 14px;"><span style="color: #000000;"></span><br>
											-&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK</b>&nbsp;OLIVE
											대상 인당 연 1회 제공 (단, 임직원 제외)<br> -&nbsp; 생일 당월 온·오프라인
											통합&nbsp;1회 사용 가능 (법정생년월일 기준)<br> -&nbsp;&nbsp;3만원 이상 구매
											시&nbsp;2천원 할인<span style="color: #000000;"></span></span><br>
										&nbsp;
									</p>

									<p>
										<span style="font-size: 14px;"><span
											style="color: #000000;"><b>[쿠폰 관련 공통 유의사항]</b></span><br>
											※ 장바구니 쿠폰은 상품 쿠폰과 중복 사용 가능하며, 상품 쿠폰 적용 후 최종 결제 금액 기준으로 조건 충족
											시 사용 가능<br> ※ 쿠폰 사용한 주문 건을 매장 환불 또는 온라인몰 주문 취소 시 쿠폰 사용
											기한 내 자동 재발급 (단, 부분 취소 및 부분 반품의 경우 예외)<br> ※ 제휴 및 임직원 카드
											사용 시 쿠폰 중복 적용 불가</span><br> <br> &nbsp;
									</p>

								</ul>
								<div class="mgT25"></div>

								<ul class="listHyphen">
									<span style="font-size: 14px;"><span
										style="color: #000000;"></span></span>
									<span style="font-size: 18px;"><span
										style="color: #000000;"><strong>이달의 쿠폰</strong></span></span>
									<br>
									<span style="font-size: 14px;"><br> -&nbsp; 각 쿠폰은
										ID당 1회 발급 및 사용 가능<br> -&nbsp; 주문 취소 시 쿠폰 사용 기한 내 자동
										재발급(부분취소 및 부분 반품의 경우 예외)<br> -&nbsp; 각 쿠폰별 할인율/할인금액,
										사용기간은 마이페이지&gt;쿠폰 통해 확인 가능<br> -&nbsp; 상품 쿠폰은 [업체배송]
										상품(베이비,식품,반려동물) 등 일부상품에 적용 불가<br> -&nbsp; 상품 쿠폰은 동일 상품 2개
										이상 구매 시 1개 상품에만 할인 적용 가능<br> -&nbsp; 상품 쿠폰은 상품 즉시 할인 쿠폰과
										중복 적용 불가<br> -&nbsp; 장바구니 쿠폰은 상품 쿠폰과 중복 사용 가능<br>
										-&nbsp; 장바구니 쿠폰은 상품 쿠폰 적용 후 최종 결제 금액 기준으로 조건 충족 시 사용 가능<br>
										-&nbsp; APP 전용 쿠폰은 모바일 앱에서만 발급 및 사용 가능<br> <br> ※
										쿠폰은 당사의 사정에 따라 별도 고지 없이 변경 또는 종료될 수 있음<br> ※ 쿠폰 사용 조건 및
										혜택 상세는 마이페이지&gt;쿠폰에서 확인 가능<br> ※ 특정 매장 및 일부 상품의 경우
										장바구니/상품 쿠폰 적용 제외</span>
									<br>
									<br> &nbsp;
								</ul>
								<div class="mgT25"></div>

								<ul class="listHyphen">
									<span style="font-size: 14px;"><span
										style="color: #000000;"></span></span>
									<span style="font-size: 18px;"><span
										style="color: #000000;"><strong>CJ ONE VIP 쿠폰
												안내</strong></span></span>
									<br>
									<span style="font-size: 14px;"><br> -&nbsp; 사용기간:
										2023년 1월 2일 ~ 2023년 12월 31일<br> -&nbsp; CJ ONE 회원 등급에 따라
										CJ ONE에서 쿠폰 발급 후 올리브영 온라인몰에서 다운로드 가능<br> -&nbsp; 오프라인 매장
										사용 시, CJ ONE 카드 또는 CJ ONE APP 제시 후 사용 가능<br> -&nbsp;
										기프트카드 등 일부 품목 구매 시 사용 불가<br> -&nbsp; 매장 환불 / 온라인몰 주문 취소 시
										쿠폰 사용 기한 내 자동 재발급 (부분취소 및 부분 반품의 경우 예외)<br> -&nbsp; 제휴 및
										임직원 카드 사용 시 쿠폰 중복 적용 불가<br> <br> ※ CJ ONE
										쿠폰은&nbsp;임직원 사용 제한 쿠폰으로 올리브영 온라인몰에서 다운로드 불가<br> ※ 특정 매장 및
										일부 상품의 경우 장바구니/상품 쿠폰 적용 제외</span>
									<br> &nbsp;
								</ul>
								<div class="mgT25"></div>



							</div>
						</div>
						<button type="button" class="ButtonClose">팝업창 닫기</button>
					</div>

				</div>
				
				<div class="layer_pop_wrap w560 lounge-popup-layer" id="lay_total_buy" style="display: none">
					<div class="layer_cont2">
						<div class="lounge-popup-layer__inner ">
							<div class="lounge-popup-content">
								<div class="popup-content-title">
									<em><span class="sffont-area">2023년 하반기</span> 누적 결제 금액</em>
									<strong><span class="price-text sffont-area">0</span> 원</strong>
								</div>
								<p class="popup-content-text">위 누적 결제 금액을 기준으로<br>
									<span class="sffont-area">2024년 상반기 </span> 회원 등급이 결정됩니다.
								</p>
								<div class="rating-standard-content">
									<strong class="rating-standard-title">등급 선정 기준</strong>
									<ul class="rating-standard-list">
										<li class="list-item">
											<span class="sffont-area">2023년 하반기 </span>올리브 멤버스 등급 적용 기간 : <span class="sffont-area">2023.07.04 ~ 2023.12.31</span>
										</li>
										<li class="list-item">
											<span class="sffont-area">2023년 하반기 </span>올리브 멤버스 등급 산정 기준 : <span class="sffont-area">2023.01.01 ~ 2023.06.30</span>
										</li>
										<li class="list-item">
											올리브 멤버스 등급은 온・오프라인 총 누적 구매 금액 기반으로 결정됩니다.
										</li>
										<li class="list-item">
											올리브영 회원가입(이용약관 동의)과 동시에 BABY OLIVE 등급이 부여됩니다.
										</li>
									</ul>
								</div>
							</div>
						</div>
						<button class="layer_close type2">창 닫기</button>
					</div>
				</div>

				<!-- 누적 결재 금액 팝업-->
				<div class="layer_pop_wrap w560 lounge-popup-layer"
					id="lay_total_buy" style="">
					<div class="layer_cont2">
						<div class="lounge-popup-layer__inner ">
							<div class="lounge-popup-content">
								<div class="popup-content-title">
									<em><span class="sffont-area">2023년 하반기</span> 누적 결제 금액</em> <strong><span
										class="price-text sffont-area"></span> 원</strong>
								</div>
								<p class="popup-content-text">
									위 누적 결제 금액을 기준으로<br> <span class="sffont-area">2024년
										상반기 </span> 회원 등급이 결정됩니다.
								</p>
								<div class="rating-standard-content">
									<strong class="rating-standard-title">등급 선정 기준</strong>
									<ul class="rating-standard-list">
										<li class="list-item"><span class="sffont-area">2023년
												하반기 </span>올리브 멤버스 등급 적용 기간 : <span class="sffont-area">2023.07.04
												~ 2023.12.31</span></li>
										<li class="list-item"><span class="sffont-area">2023년
												하반기 </span>올리브 멤버스 등급 산정 기준 : <span class="sffont-area">2023.01.01
												~ 2023.06.30</span></li>
										<li class="list-item">올리브 멤버스 등급은 온・오프라인 총 누적 구매 금액 기반으로
											결정됩니다.</li>
										<li class="list-item">올리브영 회원가입(이용약관 동의)과 동시에 BABY OLIVE
											등급이 부여됩니다.</li>
									</ul>
								</div>
							</div>
						</div>
						<button class="layer_close type2">창 닫기</button>
					</div>
				</div>
				<!-- // 누적 결재 금액 팝업-->

				<!-- 등급 선정 기준 및 혜택 팝업-->
				<div
					class="layer_pop_wrap w560 lounge-popup-layer grade-selection-layer"
					id="lay_grade_selection" style="">
					<div class="layer_cont2">
						<div class="lounge-popup-layer__inner ">
							<div class="lounge-popup-header">
								<h2 class="popup-header-title">등급 선정 기준 및 혜택</h2>
							</div>
							<div class="lounge-popup-content">
								<h3 class="blind">등급 선정 기준 및 혜택 세부 영역</h3>
								<div class="popCont">
									<div class="popInner">
										<h4>
											혜택<span class="sffont-area">1</span>. 올리브 멤버스 등급별 포인트 적립
										</h4>
										<ul class="gbn_box">
											<li><strong>결제 시 <span class="sffont-area">CJ
														ONE</span> 포인트 적립률은 올리브 멤버스 등급별 상이
											</strong>
												<p class="sffont-area">GOLD OLIVE : 1%, BLACK OLIVE :
													1%, GREEN OLIVE : 1%, PINK OLIVE : 0.5%, BABY OLIVE : 0.5%</p>
											</li>
											<li><strong>제휴카드 사용 시 올리브 멤버스 등급과 무관하게 결제금액의 <span
													class="sffont-area">0.1%</span> 적립
											</strong>
												<p>포인트 제휴 할인 카드의 경우 카드사 기준에 따라 일부 상이</p></li>
											<li><strong>올리브 멤버스가 아닌 <span
													class="sffont-area">CJ ONE</span> 회원은 결제금액의 <span
													class="sffont-area">0.1%</span> 적립
											</strong></li>
										</ul>
									</div>
									<div class="popInner">
										<h4>
											혜택<span class="sffont-area">2</span>. 올리브 멤버스 등급별 쿠폰 혜택
										</h4>
										<ul class="gbn_box type2">
											<li><strong>쇼핑 쿠폰</strong>
												<p>
													<strong class="grade-text">GOLD</strong>/<strong
														class="grade-text">BLACK</strong>/<strong
														class="grade-text">GREEN</strong>/<strong
														class="grade-text">PINK</strong> OLIVE 대상 제공 (단, 임직원 제외)
												</p>
												<p>
													<span class="sffont-area">2023</span>년 <span
														class="sffont-area">7</span>월 <span class="sffont-area">4</span>일
													~ <span class="sffont-area">12</span>월 <span
														class="sffont-area">31</span>일 기간 중&nbsp;온·오프라인 통합&nbsp;<span
														class="sffont-area">1</span>인 <span class="sffont-area">1</span>회
													사용 가능
												</p>
												<p></p>
												<p>등급별로 제공되는 쿠폰은 상이하며, 승급 시점에 맞춰 등급별 일괄 제공 (로그인 &gt;
													마이페이지 &gt; 쿠폰 탭에서 확인 가능)</p></li>
											<li><strong>온라인몰 무료배송 쿠폰</strong>
												<p>
													<strong class="grade-text">GOLD</strong>/<strong
														class="grade-text">BLACK</strong>/<strong
														class="grade-text">GREEN</strong> OLIVE의 경우&nbsp;<span
														class="sffont-area">6</span>개월 내 총 <span
														class="sffont-area">5</span>장,&nbsp;<span
														class="sffont-area"><strong class="grade-text">PINK
													</strong>OLIVE</span> 의 경우&nbsp;<span class="sffont-area">6</span>개월 내 <span
														class="sffont-area">1</span>장 발급 및 사용 가능 (단, 임직원 제외)<br>온라인몰에서
													<span class="sffont-area">1</span>만원 이상 주문 시 사용 가능
												</p>
												<p>※ 해당 쿠폰은 온라인몰 전용 쿠폰으로 오프라인 매장에서는 사용 불가</p></li>
											<li><strong>오늘드림 무료배송 쿠폰</strong>
												<p>
													<strong class="grade-text">GOLD</strong>/<strong
														class="grade-text">BLACK</strong> <span
														class="sffont-area">OLIVE</span> 의 경우 월 <span
														class="sffont-area">1</span>장,<strong class="grade-text">GREEN</strong>/<strong
														class="grade-text">PINK</strong>/<strong
														class="grade-text">BABY</strong> <span class="sffont-area">OLIVE</span>
													의 경우&nbsp;<span class="sffont-area">6</span>개월 내&nbsp;<span
														class="sffont-area">1</span>장&nbsp;발급 및 사용 가능 (단, 임직원 제외)
												</p>
												<p>
													&lt;오늘드림&gt;으로&nbsp;<span class="sffont-area">1</span>만원 이상
													주문 시 사용 가능
												</p>
												<p>&lt;일반 배송&gt;, &lt;업체 배송&gt; 및 &lt;오늘드림 픽업&gt; 주문 시
													사용 불가</p>
												<p>※ 해당 쿠폰은 온라인몰 전용쿠폰으로 오프라인 매장에서는 사용 불가</p></li>
											<li><strong><span class="sffont-area">LUXE
														EDIT</span> 할인 쿠폰</strong>
												<p>
													<span class="sffont-area">LUXE EDIT</span> 브랜드 상품 구매 시 사용
													가능한 장바구니 쿠폰이며, <span class="sffont-area">LUXE EDIT</span>
													브랜드에 한하여 할인 적용됨 (쿠폰 <span class="sffont-area">1</span>장당
													온·오프라인 통합 <span class="sffont-area">1</span>회 사용 가능)<br>
													등급별로 제공되는 쿠폰 상이함
												</p>
												<p>
													대상 브랜드(총 <span class="sffont-area">37</span>개) :<br>
													헤라, 프리메라, 랩시리즈, 에스티로더, 크리니크, 오리진스, <span
														class="sffont-area">MAC</span>, 달팡, 바비브라운, 아베다, 어반디케이,
													비오템, 비오템옴므, 베네피트, 록시땅, 차홍, 모로칸오일, 정샘물, <span
														class="sffont-area">THREE</span>, 메모, 조러브스, 세르주루텐, 다비네스,
													빌리프, 아워글래스,&nbsp;<span class="sffont-area">RMK</span>, 꼬달리,
													더바디샵,&nbsp;&nbsp;<span class="sffont-area">LOMA</span>,
													저스트에즈아이엠, 비긴스, 숨<span class="sffont-area">37</span>, 르네휘테르,
													올라플렉스,&nbsp;오휘, 아떼, 필립비
												</p>
												<p>
													<span class="sffont-area">5</span>% 할인 쿠폰의 경우,&nbsp;쿠폰 적용 전
													결제금액 기준 최대&nbsp;<span class="sffont-area">40</span>만원까지 적용
													가능
												</p>
												<p>추후 쿠폰 적용 브랜드 추가 또는 제외될 수 있음</p></li>
											<li><strong>오늘드림 픽업 할인 쿠폰</strong>
												<p>
													<strong class="grade-text">GOLD</strong>/<strong
														class="grade-text">BLACK</strong>/<strong
														class="grade-text">GREEN</strong>/<strong
														class="grade-text">PINK</strong> OLIVE 대상 <span
														class="sffont-area">6</span>개월 내 <span class="sffont-area">1</span>장
													제공 (단, 임직원 제외)
												</p>
												<p>
													&lt;오늘드림 픽업&gt;으로&nbsp;<span class="sffont-area">3</span>만원
													이상 주문 시 <span class="sffont-area">2</span>천원 할인
												</p>
												<p>&lt;오늘드림&gt;배송, &lt;일반 배송&gt; 및 &lt;업체 배송&gt; 주문 시 사용
													불가</p></li>
											<li><strong><span class="sffont-area">W
														CARE</span> 할인 쿠폰</strong>
												<p>
													<strong class="grade-text">GOLD</strong>/<strong
														class="grade-text">BLACK</strong>/<strong
														class="grade-text">GREEN</strong>/<strong
														class="grade-text">PINK</strong> OLIVE 대상 <span
														class="sffont-area">6</span>개월 내 <span class="sffont-area">1</span>장
													제공 (단, 임직원 제외)
												</p>
												<p>
													<span class="sffont-area">2023</span>년&nbsp;<span
														class="sffont-area">7</span>월 <span class="sffont-area">4</span>일&nbsp;~&nbsp;<span
														class="sffont-area">12</span>월&nbsp;<span
														class="sffont-area">31</span>일&nbsp;기간 중&nbsp;온·오프라인
													통합&nbsp;<span class="sffont-area">1</span>인&nbsp;<span
														class="sffont-area">1</span>회 사용 가능
												</p>
												<p>
													<span class="sffont-area">W CARE</span> 카테고리 상품 <span
														class="sffont-area">2</span>만원&nbsp;이상 구매 시&nbsp;<span
														class="sffont-area">2</span>천원 할인
												</p>
												<p>
													※ <span class="sffont-area">W CARE</span> 카테고리 상품: 온라인몰 내
													&lt;여성/위생용품&gt; 카테고리 상품
												</p></li>
											<li><strong>선물하기 전용 할인 쿠폰</strong>
												<p>
													<strong class="grade-text">GOLD</strong>/<strong
														class="grade-text">BLACK</strong>/<strong
														class="grade-text">GREEN</strong> OLIVE 대상 <span
														class="sffont-area">6</span>개월 내 <span class="sffont-area">1</span>장
													제공 (단, 임직원 제외)
												</p>
												<p>
													<span class="sffont-area">3</span>만원 이상 &lt;선물하기&gt; 주문
													시&nbsp;<span class="sffont-area">2</span>천원 할인
												</p>
												<p>일반 구매가 아닌 &lt;선물하기&gt; 구매 시에만 사용 가능</p></li>
											<li><strong>생일 쿠폰</strong>
												<p>
													<strong class="grade-text">GOLD</strong>/<strong
														class="grade-text">BLACK</strong>/<strong
														class="grade-text">GREEN</strong>/<strong
														class="grade-text">PINK</strong> OLIVE 대상 인당 연 <span
														class="sffont-area">1</span>회 제공 (단, 임직원 제외)
												</p>
												<p>
													생일 당월 온·오프라인 통합&nbsp;<span class="sffont-area">1</span>회 사용
													가능 (법정생년월일 기준)
												</p>
												<p>
													<span class="sffont-area">3</span>만원 이상 구매 시&nbsp;<span
														class="sffont-area">2</span>천원 할인
												</p></li>
											<li><strong>쿠폰 관련 공통 유의사항</strong>
												<p>※ 장바구니 쿠폰은 상품 쿠폰과 중복 사용 가능하며, 상품 쿠폰 적용 후 최종 결제 금액
													기준으로 조건 충족 시 사용 가능</p>
												<p>※ 쿠폰 사용한 주문 건을 매장 환불 또는 온라인몰 주문 취소 시 쿠폰 사용 기한 내 자동
													재발급 (단, 부분 취소 및 부분 반품의 경우 예외)</p>
												<p>※ 제휴 및 임직원 카드 사용 시 쿠폰 중복 적용 불가</p></li>
										</ul>
									</div>
									<div class="popInner">
										<h4>
											혜택<span class="sffont-area">3</span>. 올리브 멤버스만을 위한 올리브 데이
										</h4>
										<ul class="gbn_box">
											<li><strong>올리브 데이 등급별 쿠폰</strong>
												<p>매월 올리브 데이 기간 한정 사용 가능한 올리브 멤버스 전용 할인 쿠폰, 등급별 할인율/할인액
													차등 적용</p></li>
											<li><strong>올리브 데이 등급별 샘플링</strong>
												<p>
													매월 올리브 데이 기간 내 올리브 멤버스 등급별로 제공되는 샘플<br> (오프라인 한정 선착순
													증정)
												</p></li>
										</ul>
									</div>
									<div class="popInner">
										<h4>
											혜택<span class="sffont-area">4</span>. 올리브 멤버스 신규 가입 혜택
										</h4>
										<ul class="gbn_box type2">
											<li><strong>올리브 멤버스 신규 가입 쿠폰</strong>
												<p>
													올리브 멤버스 신규 가입자에 한하여 자동 발급<br> (가입 당일 발급, 온라인몰 로그인을 반드시
													하여야 쿠폰 발행, 기 가입 이력 있거나 탈퇴 후 재가입 시 쿠폰 발급 및 사용 불가)
												</p>
												<p>
													쿠폰 발행일로부터 <span class="sffont-area">30</span>일 이내 온·오프라인 통합
													<span class="sffont-area">1</span>인 <span
														class="sffont-area">1</span>회 사용 가능
												</p></li>
											<li><strong>온라인몰 첫 구매 혜택</strong>
												<p>
													첫 구매 딜<br> 올리브영 온라인몰 정상 구매 이력이 없는 회원에 한하여 특정 상품을 <span
														class="sffont-area">100</span>원이상으로 구매할 수 있는 기회 제공 (적용 상품
													매월 상이)
												</p></li>
										</ul>
									</div>

								</div>
							</div>
						</div>
						<button class="layer_close type2">
							<span class="blind">창 닫기</span>
						</button>
					</div>
				</div>
				<!-- // 등급 선정 기준 및 혜택 팝업-->

			</div>
			<input type="hidden" id="prvEplgNo" value=""> <input
				type="hidden" id="viewMode" value="">
		</div>

		<div class="laytoast" id="brandOff" style="display: none;">
			<div class="inner">
				<p class="txt_recom txt_01">
					브랜드<br>
					<em>좋아요</em>
				</p>
			</div>
		</div>
		<div class="laytoast on" id="brandOn" style="display: none;">
			<div class="inner">
				<p class="txt_recom txt_01">
					브랜드<br>
					<em>좋아요</em>
				</p>
			</div>
		</div>
		<!-- 브랜드 찜 확인 레이어 -->
		<div class="layerAlim brand zzimOn" style="display: none;">
			<!-- zzimOn / zzimOff -->
			<span class="icon"></span>
			<p>
				브랜드<strong>좋아요</strong>
			</p>
		</div>

		<div class="layerAlim brand zzimOff" style="display: none;">
			<!-- zzimOn / zzimOff -->
			<span class="icon"></span>
			<p>
				브랜드<strong>좋아요</strong>
			</p>
		</div>
		<!-- 브랜드 찜 확인 레이어 -->

		<!-- 찜 확인 레이어 -->
		<div class="layerAlim zzimOn wishPrd" style="display: none;">
			<span class="icon"></span>
			<p class="one">
				<strong>좋아요</strong>
			</p>
		</div>
		<!--// 찜 확인 레이어 -->

		<!-- 찜 취소 레이어 -->
		<div class="layerAlim zzimOff wishPrd" style="display: none;">
			<span class="icon"></span>
			<p class="one">
				<strong>좋아요</strong>
			</p>
		</div>
		<!--// 찜 취소 레이어 -->

		<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
		<div id="directTop" style="display: none;">
			<button>
				<span></span>TOP
			</button>
		</div>
		<!--/ㅁ 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	</div>
	<div class="layer_pop_wrap" id="layer_pop_wrap" style="z-index: 999; display: none;">
	<div class="pop-conts w650">
		<h1 class="ptit">쿠폰 안내</h1>

		<div class="scroll-area" style="height:520px;">
			<div class="common1s-list">
	
		
			
				<ul class="listHyphen">
					<span style="font-size:14px;"></span><span style="font-size:16px;"><span style="color:#000000;"><b>올리브 멤버스 등급별 쿠폰 혜택</b></span></span>
<p><span style="font-size:16px;"><span style="color:#000000;"><br>
<strong>1. 쇼핑쿠폰</strong></span></span><br>
<span style="font-size:14px;"><br>
-&nbsp; <strong>GOLD</strong> / <strong>BLACK</strong> / <strong>GREEN</strong> / <strong>PINK</strong>&nbsp;OLIVE 대상 제공&nbsp;(단, 임직원 제외)<br>
-&nbsp;&nbsp;2023년 7월 4일 ~ 12월 31일 기간 중 온·오프라인 통합 1인 1회 사용 가능<br>
-&nbsp; 등급별로 제공되는 쿠폰은 상이하며, 승급 시점에 맞춰 등급별 일괄 제공 (로그인 &gt; 마이페이지 &gt; 쿠폰 탭에서 확인 가능)</span></p>

<p><span style="font-size:14px;"><span style="color:#000000;"></span></span><br>
<span style="font-size:16px;"><span style="color:#000000;"><strong>2. 온라인몰 무료배송 쿠폰</strong></span></span><br>
<span style="font-size:14px;"><br>
-&nbsp; <strong>GOLD&nbsp;</strong>/&nbsp;<strong>BLACK&nbsp;</strong>/&nbsp;<strong>GREEN</strong>&nbsp;OLIVE의 경우 6개월 내 총 5장, <strong>PINK</strong> OLIVE의 경우 6개월 내 1장 발급 및 사용 가능 (단, 임직원 제외)<br>
-&nbsp; 온라인몰에서 1만원 이상 주문 시 사용 가능<br>
※ 해당 쿠폰은 온라인몰 전용 쿠폰으로 오프라인 매장에서는 사용 불가</span><br>
<br>
<span style="font-size:16px;"><span style="color:#000000;"><strong>3. 오늘드림 무료배송 쿠폰</strong></span></span><br>
<span style="font-size:14px;"><span style="color:#000000;"></span><br>
-&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK</b>&nbsp;OLIVE의 경우 월 1장,&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK&nbsp;</b>/&nbsp;<b>BABY</b>&nbsp;OLIVE의 경우&nbsp;6개월 내&nbsp;1장&nbsp;발급 및 사용 가능 (단, 임직원 제외)<br>
-&nbsp;&nbsp;&lt;오늘드림&gt;으로&nbsp;1만원 이상 주문 시 사용 가능<br>
-&nbsp; &lt;일반 배송&gt;, &lt;업체 배송&gt; 및 &lt;오늘드림 픽업&gt; 주문 시 사용 불가<br>
※ 해당 쿠폰은 온라인몰 전용 쿠폰으로 오프라인 매장에서는 사용 불가<span style="color:#000000;"></span></span><br>
<br>
<span style="font-size:16px;"><span style="color:#000000;"><strong>4. LUXE EDIT 할인&nbsp;쿠폰</strong></span></span><br>
<span style="font-size:14px;"><br>
-&nbsp; LUXE EDIT 브랜드 상품 구매 시 사용 가능한 장바구니 쿠폰이며, LUXE EDIT 브랜드에 한하여 할인 적용됨 (쿠폰 1장당 온·오프라인 통합 1회 사용 가능)<br>
-&nbsp;&nbsp;등급별로 제공되는 쿠폰 상이함<br>
-&nbsp;&nbsp;대상 브랜드(총&nbsp;37개) :&nbsp;<br>
헤라, 프리메라, 랩시리즈, 에스티로더, 크리니크, 오리진스,&nbsp;MAC, 달팡, 바비브라운, 아베다, 어반디케이, 비오템, 비오템옴므, 베네피트, 록시땅, 차홍, 모로칸오일, 정샘물, THREE, 메모, 조러브스, 세르주루텐, 다비네스, 빌리프, 아워글래스,&nbsp;RMK, 꼬달리, 더바디샵,&nbsp;LOMA, 저스트에즈아이엠, 비긴스, 숨37, 르네휘테르, 올라플렉스,&nbsp;오휘, 아떼, 필립비<br>
-&nbsp;&nbsp;5% 할인 쿠폰의 경우,&nbsp;쿠폰 적용 전 결제금액 기준 최대&nbsp;40만원까지 적용 가능<br>
-&nbsp;&nbsp;추후 쿠폰 적용 브랜드 추가 또는 제외될 수 있음</span></p>

<p><span style="font-size:14px;"><span style="color:#000000;"></span></span><br>
<span style="font-size:16px;"><span style="color:#000000;"><strong>5. 오늘드림 픽업 할인 쿠폰</strong></span></span><br>
<span style="font-size:14px;"><span style="color:#000000;"></span><br>
-&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK</b>&nbsp;OLIVE 대상 6개월 내 1장 제공 (단, 임직원 제외)<br>
-&nbsp;&nbsp;&lt;오늘드림 픽업&gt; 으로 3만원 이상 주문 시 2천원 할인<br>
-&nbsp;&nbsp;&lt;오늘드림&gt; 배송, &lt;일반 배송&gt; 및 &lt;업체 배송&gt; 주문 시 사용 불가<span style="color:#000000;"></span></span><br>
&nbsp;</p>

<p><span style="font-size:14px;"><span style="color:#000000;"></span></span><span style="font-size:16px;"><span style="color:#000000;"><b>6. W CARE 할인 쿠폰</b></span></span><br>
<span style="font-size:14px;"><span style="color:#000000;"></span><br>
-&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK</b>&nbsp;OLIVE 대상 6개월 내 1장 제공 (단, 임직원 제외)<br>
-&nbsp;&nbsp;2023년&nbsp;7월 4일&nbsp;~&nbsp;12월&nbsp;31일&nbsp;기간 중&nbsp;온·오프라인 통합&nbsp;1인&nbsp;1회 사용 가능<br>
-&nbsp;&nbsp;W CARE 카테고리 상품 2만원&nbsp;이상 구매 시&nbsp;2천원 할인<br>
※ W CARE 카테고리 상품: 온라인몰 내 &lt;여성/위생용품&gt; 카테고리 상품<span style="color:#000000;"></span></span><br>
<br>
<span style="font-size:16px;"><span style="color:#000000;"><strong>7. </strong><b>선물하기 전용 할인 쿠폰</b></span></span><br>
<span style="font-size:14px;"><span style="color:#000000;"></span><br>
-&nbsp; <b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>OLIVE 대상 6개월 내 1장 제공 (단, 임직원 제외)<br>
-&nbsp;&nbsp;3만원 이상 &lt;선물하기&gt; 주문 시 2천원 할인<br>
-&nbsp;&nbsp;일반 구매가 아닌 &lt;선물하기&gt; 구매 시에만 사용 가능</span><br>
&nbsp;</p>

<p><span style="font-size:14px;"><span style="color:#000000;"></span></span><span style="font-size:16px;"><span style="color:#000000;"><b>8. 생일 쿠폰</b></span></span><br>
<span style="font-size:14px;"><span style="color:#000000;"></span><br>
-&nbsp;&nbsp;<b>GOLD&nbsp;</b>/&nbsp;<b>BLACK&nbsp;</b>/&nbsp;<b>GREEN&nbsp;</b>/&nbsp;<b>PINK</b>&nbsp;OLIVE 대상 인당 연 1회 제공 (단, 임직원 제외)<br>
-&nbsp; 생일 당월 온·오프라인 통합&nbsp;1회 사용 가능 (법정생년월일 기준)<br>
-&nbsp;&nbsp;3만원 이상 구매 시&nbsp;2천원 할인<span style="color:#000000;"></span></span><br>
&nbsp;</p>

<p><span style="font-size:14px;"><span style="color:#000000;"><b>[쿠폰 관련 공통 유의사항]</b></span><br>
※ 장바구니 쿠폰은 상품 쿠폰과 중복 사용 가능하며, 상품 쿠폰 적용 후 최종 결제 금액 기준으로 조건 충족 시 사용 가능<br>
※ 쿠폰 사용한 주문 건을 매장 환불 또는 온라인몰 주문 취소 시 쿠폰 사용 기한 내 자동 재발급 (단, 부분 취소 및 부분 반품의 경우 예외)<br>
※ 제휴 및 임직원 카드 사용 시 쿠폰 중복 적용 불가</span><br>
<br>
&nbsp;</p>

				</ul>
				<div class="mgT25"></div>
			
				<ul class="listHyphen">
					<span style="font-size:14px;"><span style="color:#000000;"></span></span><span style="font-size:18px;"><span style="color:#000000;"><strong>이달의 쿠폰</strong></span></span><br>
<span style="font-size:14px;"><br>
-&nbsp; 각 쿠폰은 ID당 1회 발급 및 사용 가능<br>
-&nbsp; 주문 취소 시 쿠폰 사용 기한 내 자동 재발급(부분취소 및 부분 반품의 경우 예외)<br>
-&nbsp; 각 쿠폰별 할인율/할인금액, 사용기간은 마이페이지&gt;쿠폰 통해 확인 가능<br>
-&nbsp; 상품 쿠폰은 [업체배송] 상품(베이비,식품,반려동물) 등 일부상품에 적용 불가<br>
-&nbsp; 상품 쿠폰은 동일 상품 2개 이상 구매 시 1개 상품에만 할인 적용 가능<br>
-&nbsp; 상품 쿠폰은 상품 즉시 할인 쿠폰과 중복 적용 불가<br>
-&nbsp; 장바구니 쿠폰은 상품 쿠폰과 중복 사용 가능<br>
-&nbsp; 장바구니 쿠폰은 상품 쿠폰 적용 후 최종 결제 금액 기준으로 조건 충족 시 사용 가능<br>
-&nbsp; APP 전용 쿠폰은 모바일 앱에서만 발급 및 사용 가능<br>
<br>
※ 쿠폰은 당사의 사정에 따라 별도 고지 없이 변경 또는 종료될 수 있음<br>
※ 쿠폰 사용 조건 및 혜택 상세는 마이페이지&gt;쿠폰에서 확인 가능<br>
※ 특정 매장 및 일부 상품의 경우 장바구니/상품 쿠폰 적용 제외</span><br>
<br>
&nbsp;
				</ul>
				<div class="mgT25"></div>
			
				<ul class="listHyphen">
					<span style="font-size:14px;"><span style="color:#000000;"></span></span><span style="font-size:18px;"><span style="color:#000000;"><strong>CJ ONE VIP 쿠폰 안내</strong></span></span><br>
<span style="font-size:14px;"><br>
-&nbsp; 사용기간: 2023년 1월 2일 ~ 2023년 12월 31일<br>
-&nbsp; CJ ONE 회원 등급에 따라 CJ ONE에서 쿠폰 발급 후 올리브영 온라인몰에서 다운로드 가능<br>
-&nbsp; 오프라인 매장 사용 시, CJ ONE 카드 또는 CJ ONE APP 제시 후 사용 가능<br>
-&nbsp; 기프트카드 등 일부 품목 구매 시 사용 불가<br>
-&nbsp; 매장 환불 / 온라인몰 주문 취소 시 쿠폰 사용 기한 내 자동 재발급 (부분취소 및 부분 반품의 경우 예외)<br>
-&nbsp; 제휴 및 임직원 카드 사용 시 쿠폰 중복 적용 불가<br>
<br>
※ CJ ONE 쿠폰은&nbsp;임직원 사용 제한 쿠폰으로 올리브영 온라인몰에서 다운로드 불가<br>
※ 특정 매장 및 일부 상품의 경우 장바구니/상품 쿠폰 적용 제외</span><br>
&nbsp;
				</ul>
				<div class="mgT25"></div>
			
		
	
			</div>
		</div>
		<button type="button" class="ButtonClose">팝업창 닫기</button>
	</div>

</div>
</body>
</html>