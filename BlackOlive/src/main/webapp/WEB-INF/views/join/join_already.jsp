<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>
<!--contents-->
<div id="contentsWrap">
	<form method="post" id="form1" name="form1" action="">
		<div id="contents">
			<!--title-->

			<div class="location_wrap">
				<div class="location">
					회원가입</span></a>
				</div>
			</div>

			<div class="cont_header">
				<h1 class="h1_tit">회원가입</h1>
				<p class="h_desc">라이프스타일 멤버십 CJ ONE! 외식, 쇼핑, 엔터테인먼트 서비스를 한 장의
					카드로 즐기세요~</p>
			</div>
			<!--title-->
			<div class="cont_area">
				<div class="member_join">
					<!--step-->
					<div class="step_join">
						<ul class="col4">
							<li class="step1 on">본인인증 <span class="haze">진행 중</span><span
								class="line"></span></li>
							<li class="step2">약관동의 <span class="haze">진행 전</span><span
								class="line"></span></li>
							<li class="step3">회원정보 입력 <span class="haze">진행 전</span><span
								class="line"></span></li>
							<li class="step4">가입완료 <span class="haze">진행 전</span></li>
						</ul>
					</div>
					<!--//step-->
					<div class="certification_sec">
						<div class="box_member">
							<h2 class="haze">본인인증</h2>
							<div class="certi_txt check">
								<span class="ico"></span>

								<p class="b_txt">
									<strong class="em">${userDto.userName}</strong>님! 이미 CJ ONE 회원으로 등록되어
									있습니다.
								</p>
								<p class="s_txt" >
									회원 아이디<em>(${userDto.userId})</em>로 로그인 하시거나 아이디 찾기를 진행해 주세요.
								</p>
							</div>
							<div class="btn_sec">
								<!-- 간편인증 시  -->
								<!-- <a href="#" class="btn">아이디 찾기</a>    -->
								<a href="/auth/login" class="btn btn_em">로그인</a>
							</div>
						</div>

						<!-- 고객센터 Start -->
						<div class="customer_sec" id="guideArea">
							<h2 class="haze">고객센터 이용 안내</h2>
							<div class="box_btm box_gray cs_banner col2">
								<div class="banner_cs faq">
									<a href="#">
										<dl class="box_info">
											<dt>자주찾는 질문</dt>
											<dd>
												<p>
													CJ ONE에 관한 궁금하신 사항을 확인하세요.<br>질문에 빠르고 정확한 답변을 제공합니다.
												</p>
											</dd>
										</dl> <span class="bg faq"></span>
									</a>
								</div>
								<div class="banner_cs call_center">
									<a href="javascript:goCounseling();">
										<dl class="box_info">
											<dt>1:1상담</dt>
											<dd>
												<ul class="bul_list">
													<li class="dot_arr">평일 : 다음 날 답변 완료</li>
													<li class="dot_arr">토·일·공휴일 : 휴일 이후 답변 완료</li>
												</ul>
											</dd>
										</dl> <span class="bg"></span>
									</a>
								</div>
							</div>
						</div>
						<!-- 고객센터 End -->

						<!--banner type a-->
						<div class="banner_sec"></div>
						<!--banner type a-->
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</div>
<!--//contents-->