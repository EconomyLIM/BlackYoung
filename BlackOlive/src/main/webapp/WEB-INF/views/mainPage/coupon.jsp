<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>블랙올리브영 온라인몰</title>
</head>
<body>

	<script>
		$(function() {
			let divBackgroundColor = $("<div>").addClass("dimm").css("z-index", "990px");
			
			
			/* 팝업 */
			$("#getCouponLPop").on("click", function() {
				event.preventDefault();
				$("#layer_pop_wrap").show();
				console.log(window.innerWidth + " / " + $("#couponNotice").width())
				popupCenter($("#layer_pop_wrap"));
				$("body").append(divBackgroundColor);
			});
			
			$("#layer_pop_wrap > div > button").on("click", function() {
				$("#layer_pop_wrap").hide();
				$(".dimm").remove();
			});
			
			$("#Container > div.coupon-area > div.coupon_tit_area > a").on("click", function() {
				event.preventDefault();
				$("#couponNotice").show();
				console.log(window.innerWidth + " / " + $("#couponNotice").width())
				popupCenter($("#couponNotice"));
				$("body").append(divBackgroundColor);
			});
			
			$("#couponNotice > div > button").on("click", function() {
				$("#couponNotice").hide();
				$(".dimm").remove();
			})
			
			// 앱 설치 주소 문자 받기 부분
			$("#sendSMS").on("click", function() {
				let tel = $("input[name='phoneNum']").val();
				let pattern = /^(\d{3})?\d{3,4}\d{4}$/
				if(tel.search(pattern) == -1) {
					alert("휴대 전화번호 형식이 아닙니다");
					return;
				} 
				
				alert("정상적으로 전송 되었습니다.");
			});
			
			// 쿠폰 등록하기
			$("#layer_pop_wrap > div > div > div.coupon_input_area > button").on("click", function() {
				alert("이미 사용했거나 유효하지 않은 쿠폰번호입니다.");
			});
			
			$(".btn_cpdw").on("click", function() {
				alert("이미 지급된 쿠폰입니다.")
			})
			
			// 등급 색깔 
			let grade_id = $("#gradeName").val();
			let grade = grade_id.split(" ")[0];
			
			let gradeColor = ""
			switch (grade) {
			case 'BABY': 
				gradeColor = 'rate_04';
				break;
			case 'PINK': 
				gradeColor = 'rate_05';
				break;
			case 'GREEN': 
				gradeColor = 'rate_03';
				break;
			case 'BLACK': 
				gradeColor = 'rate_02';
				break;
			case 'GOLD': 
				gradeColor = 'rate_01';
				break;
			}
			$("#Container > div.coupon-area > div.TabsConts.on > div > p > strong > span").addClass(gradeColor);
		});
	</script>

<div id="Container">
	<sec:authorize access="isAuthenticated()">
		<input id="gradeName" type="hidden" value='<sec:authentication property="principal.member.gradeName"/>'>
	</sec:authorize>
		<!-- #Contents -->
		<div class="title-coupon">
			<h1>올리브 멤버스 라운지<span>쇼핑하는 재미! 올리브영만의 더 특별한 혜택</span></h1>
		</div>

		<div class="coupon-area">
			<ul class="comm5sTabs tab2"> 
				<li><button type="button" onclick="javascript:location.href='<c:url value="/store/getMembership"/>'">올리브 멤버스</button></li>
				<li class="on"><button type="button" id="couponButton" title="선택됨" onclick="javascript:location.href='<c:url value="/store/getCoupon"/>'">쿠폰/혜택</button></li>
			</ul>
			<sec:authorize access="isAuthenticated()">
				<div class="TabsConts on">	
					<div class="mem_info_top">
						<div class="thum">
							<span class="bg"></span>		
							<img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/my_picture_base.jpg" alt="프로필 이미지">		
						</div>
						<p class="txt"><em><sec:authentication property="principal.member.userName"/></em>님의 등급은<strong> <span class=""><sec:authentication property="principal.member.gradeName"/></span></strong> 입니다</p>
					</div>
				</div>
				<a class="couponEnroll-link" href="#" id="getCouponLPop" data-rel="layer" data-target="discountCoupon" data-attr="멤버십쿠폰^쿠폰혜택탭^쿠폰등록"><span>쿠폰 등록<em>발급 받으신 번호를 등록해주세요</em></span></a><!-- 2017-01-17 수정 : 레이어띄우는 부분 추가 -->
					
				<div class="coupon_tit_area">
					<h2 class="coupon-title member">올리브 멤버스 쿠폰</h2>
					<a href="javascript:;" class="coupon_info_link" data-rel="layer" data-target="couponNotice">쿠폰안내</a>
				</div>		
				<ul class="cpbox_list">
					<li>
						<div class="area today off"> 
							<div class="info">
								<span class="tit">[BABY] 오늘드림 무료배송 쿠폰</span>							
								<span class="sale"><em>무료배송</em></span>
								<span class="txt">10,000원 이상 적용가능</span>		
								<span class="flag today"><strong>오늘드림</strong></span>		
							</div>
						</div>
						<button type="button" class="btn_cpdw" data-attr="멤버십쿠폰^쿠폰혜택탭^멤버십쿠폰다운받기_[BABY] 오늘드림 무료배송 쿠폰"><span data-attr="멤버십쿠폰^쿠폰혜택탭^멤버십쿠폰다운받기_[BABY] 오늘드림 무료배송 쿠폰">쿠폰 발급완료</span></button>
						<input type="hidden" name="cpnNo" value="yvKxrF30GRPS/ZNlZ+Hs7A==">
					</li>
				</ul>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<div class="TabsConts on">
					<div class="text-login">
						로그인 하시고 <span>나만의 쿠폰</span>을 확인하세요
						<a href='<c:url value="/auth/login"/>'>로그인</a>
					</div>
					<a class="couponEnroll-link" href="#" id="getCouponLPop" data-rel="layer" data-target="discountCoupon" data-attr="멤버십쿠폰^쿠폰혜택탭^쿠폰등록"><span>쿠폰 등록<em>발급 받으신 번호를 등록해주세요</em></span></a><!-- 2017-01-17 수정 : 레이어띄우는 부분 추가 -->
				</div>
			</sec:authorize>
			
			

<!-- 카드 청구 할인 -->

<!-- //카드 청구 할인 -->				
						
				<!-- 카드 포인트 사용 -->

				<div class="card_cont_wrap">
					<h3>결제수단 별 포인트 사용</h3>
					<ul class="card_list_type">

						<li>
							<div class="cont_img">
								<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/DIN.jpg" alt="현대카드">
	
							</div>
							<div class="cont_txt">
								<p class="tit">현대카드</p>
								<p class="desc">현대카드 M포인트 10% 사용 가능(1만원 이상 결제시 최대 5천 포인트)</p>
								<p class="date">2023.01.03 - 2023.12.31</p>
							</div>
						</li>

						<li>
							<div class="cont_img">
								<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/WIN.jpg" alt="삼성카드">
	
							</div>
							<div class="cont_txt">
								<p class="tit">삼성카드</p>
								<p class="desc">삼성카드 보너스포인트 100% 사용 가능</p>
								<p class="date">2023.01.03 - 2023.12.31</p>
							</div>
						</li>

					</ul>
				</div>

<!-- //카드 포인트 사용 -->

<!-- 카드 무이자 할부 -->

				<div class="card_cont_wrap" id="nintInstList">
					<h3>온라인몰 신용카드 무이자할부</h3>
					<div class="card_list_type2">
						<ul>
							<li>
								<a class="detail-link" href="javascript:;" style="cursor:text">
								<div class="cont_img size_75per">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/BCC_logo.jpg" alt="BC카드">
								</div>
								<div class="cont_txt">																		
											<p class="desc">2									
											~  6개월 무이자할부 </p>							
									<p class="desc">50,000원 이상 결제 시</p>
									<p class="date">2023.11.01 - 2023.11.30</p>
								</div>
								</a>
								<input type="hidden" name="urlInfo" value="">
							</li>
							<li>
								<a class="detail-link" href="javascript:;" style="cursor:text">
								<div class="cont_img size_75per">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/CNB_logo.jpg" alt="KB카드">
								</div>
								<div class="cont_txt">																	
											<p class="desc">2									
											~  3개월 무이자할부 </p>								
									<p class="desc">50,000원 이상 결제 시</p>
									<p class="date">2023.11.01 - 2023.11.30</p>
								</div>
								</a>
								<input type="hidden" name="urlInfo" value="">
							</li>
							<li>
								<a class="detail-link" href="javascript:;" style="cursor:text">
								<div class="cont_img size_75per">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/NLC_logo.jpg" alt="NH카드">
								</div>
								<div class="cont_txt">																	
											<p class="desc">2									
											~  4개월 무이자할부 </p>									
									<p class="desc">50,000원 이상 결제 시</p>
									<p class="date">2023.11.01 - 2023.11.30</p>
								</div>
								</a>
								<input type="hidden" name="urlInfo" value="">
							</li>
							<li>
								<a class="detail-link" href="javascript:;" style="cursor:text">
								<div class="cont_img size_75per">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/AMX_logo.jpg" alt="롯데카드">
								</div>
								<div class="cont_txt">																	
											<p class="desc">2																	
											~  3개월 무이자할부 </p>							
									<p class="desc">50,000원 이상 결제 시</p>
									<p class="date">2023.11.01 - 2023.11.30</p>
								</div>
								</a>
								<input type="hidden" name="urlInfo" value="">
							</li>
						</ul>
						<ul>
	
							<li>
								<a class="detail-link" href="javascript:;" style="cursor:text">
								<div class="cont_img size_75per">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/WIN_logo.jpg" alt="삼성카드">
								</div>
								<div class="cont_txt">																	
											<p class="desc">2									
											~  3개월 무이자할부 </p>								
									<p class="desc">50,000원 이상 결제 시</p>
									<p class="date">2023.11.01 - 2023.11.30</p>
								</div>
								</a>
								<input type="hidden" name="urlInfo" value="">
							</li>
							<li>
								<a class="detail-link" href="javascript:;" style="cursor:text">
								<div class="cont_img size_75per">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/LGC_logo.jpg" alt="신한카드">
								</div>
								<div class="cont_txt">																	
											<p class="desc">2								
											~  3개월 무이자할부 </p>								
									<p class="desc">50,000원 이상 결제 시</p>
									<p class="date">2023.11.01 - 2023.11.30</p>
								</div>
								</a>
								<input type="hidden" name="urlInfo" value="">
							</li>
							<li>
								<a class="detail-link" href="javascript:;" style="cursor:text">
								<div class="cont_img size_75per">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/PHB_logo.jpg" alt="우리카드">
								</div>
								<div class="cont_txt">																	
											<p class="desc">2
																
											~  6개월 무이자할부 </p>								
									<p class="desc">50,000원 이상 결제 시</p>
									<p class="date">2023.11.01 - 2023.11.30</p>
								</div>
								</a>
								<input type="hidden" name="urlInfo" value="">
							</li>
							<li>
								<a class="detail-link" href="javascript:;" style="cursor:text">
								<div class="cont_img size_75per">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/HNB_logo.jpg" alt="하나(외환)카드">
								</div>
								<div class="cont_txt">															
											<p class="desc">2
																	
											~  3개월 무이자할부 </p>			
									<p class="desc">50,000원 이상 결제 시</p>
									<p class="date">2023.11.01 - 2023.11.30</p>
								</div>
								</a>
								<input type="hidden" name="urlInfo" value="">
							</li>	
						</ul>
						<ul>
	
							<li>
								<a class="detail-link" href="javascript:;" style="cursor:text">
								<div class="cont_img size_75per">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/DIN_logo.jpg" alt="현대카드">
								</div>
								<div class="cont_txt">																	
											<p class="desc">2								
											~  3개월 무이자할부 </p>						
									<p class="desc">50,000원 이상 결제 시</p>
									<p class="date">2023.11.01 - 2023.11.30</p>
								</div>
								</a>
								<input type="hidden" name="urlInfo" value="">
							</li>
		    				<li class="blank">
		    				</li>

		    				<li class="blank">
		    				</li>

		    				<li class="blank">
		    				</li>

						</ul>
					</div>
				</div>

<!-- //카드 무이자 할부 -->

				<!-- 올리브영 멤버십 제휴 서비스 -->
				<div class="card_cont_wrap">
					<h3>결제 제휴 서비스</h3>
					<div class="card_list_type2">
						<ul>
							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_s_TheCJ.jpg" alt="THE CJ카드">
								</div>
								<div class="cont_txt">
									<p class="tit">THE CJ카드</p>
									<dl>
										<dt>10% 즉시 할인</dt>
										<dd>- 국민/현대/신한/롯데/씨티/하나</dd>
										<dd>- 일부 상품은 할인 제외</dd>
										<dd>- THE CJ카드 10% 할인과 카드사 포인트 차감 서비스는 동시 사용 불가</dd>
									</dl>
								</div>
							</li>
							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_s_samsungid_CJ.jpg" alt="CJ 삼성 iD카드(신용)">
								</div>
								<div class="cont_txt">
									<p class="tit">CJ 삼성 iD카드(신용)</p>
									<dl>
										<dt>10% 결제일 할인</dt>
										<dd>- 월 할인 한도 1만원</dd>
										<dd>- 전월 이용금액 30만원 이상 시 제공</dd>
										<dd>- 발급월+1개월까지는 전월 이용금액 30만원 미만 시에도 혜택 제공</dd>
									</dl>
								</div>
							</li>	
							<!-- 20190926 CJ ONE 우리카드 체크 추가 -->
							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_s_samsung_CJ.jpg" alt="CJ ONE 삼성카드">
								</div>
								<div class="cont_txt">
									<p class="tit">CJ ONE 삼성카드(신용)</p>
									<dl>
										<dt>CJ ONE 포인트 5배 적립</dt>
										<dd>- 전월 이용금액 20만원 이상 시 제공</dd>
									</dl>
								</div>
							</li>
							<!-- [CJOYPG-2244] 신규카드추가요청 -->
							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_shinhan_CJ.jpg" alt="CJ ONE 프리즘 신한카드(신용)">
								</div>
								<div class="cont_txt">
									<p class="tit">CJ ONE 프리즘 신한카드(신용)</p>
									<dl>
										<dt>1) 전월 이용 금액 40만원 이상 시 제공(포인트 적립한도 월 4만점)</dt>
										<dt>① CJ 브랜드 기본 포인트 3% 적립</dt>
										<dd>- 일 1회, 건별 최대 4천 포인트</dd>
										<dt>② 올리브영 10% 적립</dt>
										<dd>- 3만원 이상 이용 시, 월 1회, 건별 최대 1만 포인트</dd>
										<dt>2) 전월 이용 금액 40만원 미만 시 제공(포인트 적립한도 월 1만점)</dt>
										<dt>① CJ 브랜드 기본 포인트 1% 적립</dt>
									</dl>
								</div>
							</li>
						</ul>

						<ul>
							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_s_woori_check_CJ.jpg" alt="CJ ONE 우리카드 체크">
								</div>
								<div class="cont_txt">
									<p class="tit">CJ ONE 우리카드(체크)</p>
									<dl>
										<dt>3천원 캐시백</dt>
										<dd>- 월 할인 한도 6천원</dd>
										<dd>- 일 1회, 1.5만원 이상 이용 시 적용</dd>
										<dd>- 월간 통합 캐시백 한도 내 제공</dd>
									</dl>
								</div>
							</li>

							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_s_hana_SK_CJ.jpg" alt="CJ ONE 하나 SK 카드">
								</div>
								<div class="cont_txt">
									<p class="tit">CJ ONE 하나카드(체크)</p>
									<dl>
										<dt>① CJ ONE 더블 캐시백</dt>
										<dd>- 월 적립 한도 1만원</dd>
										<dd>- 1만원 이상 이용 시 CJ ONE 포인트 적립 금액의 2배 캐시백</dd>
										<dt>② 추가 캐시백</dt>
										<dd>- 2만원 이상 이용 건당 100원 캐시백</dd>
									</dl>
								</div>
							</li>

							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_s_KB_betwin.jpg" alt="KB Be*Twin(비트윈) 체크카드">
								</div>
								<div class="cont_txt">
									<p class="tit">KB Be*Twin 체크카드</p>
									<dl>
										<dt>10% 환급 할인</dt>
										<dd>- 건당 3만원 이상 이용 시 최대 5만원 할인</dd>
										<dd>- 전월 이용금액에 따라 월간 통합 할인 한도 적용</dd>
									</dl>
								</div>
							</li>

							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_s_KB_hpoint.jpg" alt="H.Point KB국민 체크카드">
								</div>
								<div class="cont_txt">
									<p class="tit">H.Point KB국민 체크카드</p>
									<dl>
										<dt>5% 환급 할인</dt>
										<dd>- 건당 1만원 이상 결제 시</dd>
										<dd>- 전월 이용금액 30만원 이상 시 1천원 할인</dd>
										<dd>- 전월 이용금액 50만원 이상 시 3천원 할인</dd>
									</dl>
								</div>
							</li>
						</ul>

						<ul>
							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_s_shinhan_check_CJ.jpg" alt="CJ ONE 신한카드 체크">
								</div>
								<div class="cont_txt">
									<p class="tit">CJ ONE 신한카드(체크)</p>
									<dl>
										<dt>① 10% 캐시백</dt>
										<dd>- 일 1회, 최대 1천원 (월 3회 적용)</dd>
										<dt>② CJ ONE 포인트 5% 추가 적립</dt>
										<dd>- 월 적립 한도 3천원</dd>
										<dd>- 전월 이용금액 20만원 이상 시 제공</dd>
									</dl>
									<a href="http://www.cjone.com/cjmweb/point-card/branded-card.do" target="_blank" class="detail_view">자세히보기</a>
								</div>
							</li>
							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_s_CJ_giftcard.jpg" alt="CJ상품권">
								</div>
								<div class="cont_txt">
									<p class="tit">CJ 상품권</p>
									<dl>
										<dt>결제가능</dt>
										<dd>- CJ ONE 앱에서 CJ 기프트카드로 변환 시 온라인몰 사용 가능</dd>
									</dl>
								</div>
							</li>
							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_s_culturecard.jpg" alt="문화상품권">
								</div>
								<div class="cont_txt">
									<p class="tit">문화상품권</p>
									<dl>
										<dt>결제 가능</dt>
										<!-- <dd>한국문화진흥원 상품권만 가능</dd> -->
										<dd>일부 매장에서 구매 가능</dd>
									</dl>
								</div>
							</li>
							<li>
								<div class="cont_img">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/card/card_s_booknculturecard.jpg" alt="도서문화상품권">
								</div>
								<div class="cont_txt">
									<p class="tit">도서문화상품권</p>
									<dl>
										<dt>결제 가능</dt>
									</dl>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- //올리브영 멤버십 제휴 서비스 -->
				<div class="event_alim_box coupon">
					<p class="tx_tit">제휴 서비스 <br>이용 안내</p>
					<ul class="listBlit">
						<li>제휴카드 이용 시 일부 포인트 제휴카드 제외, 올리브 멤버스 등급과 무관하게 CJ ONE 포인트가 결제금액의 0.1% 적립됩니다.</li>
						<li>상품권, 기프트카드, 담배 등 일부 품목은 제휴카드 혜택 대상에서 제외됩니다.</li>
						<li>백화점, 마트 등 할인점, 쇼핑몰 등에 입점되어있는 올리브영 매장에서는 제휴카드 혜택 적용이 불가합니다.</li>
						<li>올리브영 매장 내 약국 및 네일샵 등에서는 제휴카드 할인 혜택이 제외됩니다.</li>
						<li>전월 이용금액은 일시불, 할부 이용금액을 포함한 금액입니다.</li>
						<li>온라인몰 및 매장에서 조건 충족 시 제휴카드 이용이 가능합니다.</li>
					</ul>
				</div>
				<!-- 올리브영 앱 -->
				<div class="couponArea-area">
					<div class="image"><img src="https://static.oliveyoung.co.kr/pc-static-root/image/main/bg_coupon.png" alt="더욱 새로워진 올리영 앱 설치하세요"></div>
					<p>더욱 새로워진 올리브영 앱 설치 하세요</p>
					<p>올리브영 앱 알림 수신동의하고 쿠폰을 받으세요</p>
					<p>알림 수신동의 쿠폰</p>
					<p>20%</p>
					<p>1만원 이상 적용가능 (최대 2만원)</p>
				</div>
				<div class="couponApp-list">
					<h3>올리브영 앱을 받는 3가지 방법</h3>
					<ul>
						<li>
							<strong class="num">1</strong>
							<p class="tit">앱스토어 /  플레이 스토어 검색하기</p>
							<p class="txt">애플 앱스토어 혹은 구글 플레이 스토어에서<br>[올리브영]을 검색해보세요</p>
							<div class="link">
								<a href="https://itunes.apple.com/kr/app/ollibeuyeong/id873779010?l=kr&amp;mt=8"><img src="https://static.oliveyoung.co.kr/pc-static-root/image/main/@app_store.gif" alt="Download on the APP STORE"></a>
								<a href="https://play.google.com/store/apps/details?id=com.oliveyoung&amp;hl=ko"><img src="https://static.oliveyoung.co.kr/pc-static-root/image/main/@google_play.gif" alt="ANDROID APP ON Google play"></a>
							</div>
						</li>
						<li>
							<strong class="num">2</strong>
							<p class="tit">QR코드 스캔하기</p>
							<p class="txt">QR스캔 앱으로 하단의 이미지를 찍어주세요<br>바로 다운로드 페이지로 이동합니다</p>
							<span class="qr-code"><img src="https://static.oliveyoung.co.kr/pc-static-root/image/main/@qr_code.gif" alt="QR 코드"></span>
						</li>
						<li>
							<strong class="num">3</strong>
							<p class="tit">앱 설치 주소 문자로 받기</p>
							<p class="txt">휴대폰 번호를 입력하고 보내기 버튼을<br>클릭해 주세요</p>
							<div class="input">
								<input type="tel" name="phoneNum" title="휴대폰 번호를 입력해 주세요" maxlength="11" placeholder="">
								<button type="button" id="sendSMS">보내기</button>
							</div>
							<p class="free">입력하신 번호는 저장되지 않습니다 (이용료 무료)</p>
						</li>
					</ul>
				</div>
				<!-- //올리브영 앱 -->
			</div>
			
		</div>

		<div class="layer_pop_wrap" id="layer_pop_wrap" style="z-index: 999; display:none;">
			<div class="layer_cont2 w650">
				<h2 class="layer_title2">쿠폰 등록</h2>
				<div class="coupon_info_box2">
					<div class="coupon_area">
						<span class="tx_cate"></span>
						<strong class="tx_discount">쿠폰 등록</strong>
					</div>
					
					<p>발급 받으신 쿠폰 번호를 아래 창에 입력해주세요.</p>
					<div class="coupon_input_area">
						<input type="text" id="rndmVal" name="rndmVal" value=""  class="inp_placeholder" placeholder="쿠폰번호를 입력해주세요.">
						<button class="btnGreen" onclick="javascript:common.coupon.regCouponAjax();">등록하기</button>
					</div>	
				</div>
				<button class="layer_close type2">창 닫기</button>
			</div>	
		</div>
		
		<div class="layer_pop_wrap w650" id="couponNotice" style="display:none;" >
  
	<div class="layer_cont">
		<h2 class="layer_title">쿠폰안내</h2>
			<div class="scroll-area" style="height:520px;">
				<ul class="layer_dash_list contEditor" style="margin:0px 0;color:#666;line-height:24px;">
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
						<br><br>
					</ul>
			</div>
		<button type="button" class="layer_close">창 닫기</button>
	</div>
 
</div>
</body>
</html>