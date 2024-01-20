<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Content-Language" content="ko-KR">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, viewport-fit=cover">
<meta name="format-detection" content="telephone=no">
<link href="https://img4.kmcert.com/kmcis/new_web/css/common.css?ver=202206201405"
	media="screen" rel="stylesheet">
<link
	href="https://img4.kmcert.com/kmcis/new_web/css/site.css?ver=202211241512"
	media="screen" rel="stylesheet">
<script src="https://img4.kmcert.com/kmcis/new_web/js/jquery.min.js"></script>
<script src="https://img4.kmcert.com/kmcis/new_web/js/common.js"></script>
<script src="https://img4.kmcert.com/kmcis/new_web/js/design.js"></script>
<script src="https://img4.kmcert.com/comm/js/kcComm.js"></script>
<script src="https://img4.kmcert.com/kmcis/comm/js/kmcisComm.js"></script>
<script src="https://img4.kmcert.com/kmcis/qr_web/js/kmcisWeb_v3.js?ver=20220622"></script>

<title>휴대폰 인증 정보 입력 | 본인확인서비스-한국모바일인증(주)</title>
<script type="text/javascript">
	window.onload = function() {

	}

	function errAlert() {
		alert('금일 휴대폰인증 오류가 0회 발생하였습니다.\n5회 인증 실패시 본인확인서비스가 제한됩니다');
	}

	function img_reload() {
		// 새로고침 방법 변경 - 2014.05.29  kmcweb1
		var d = new Date();
		document.getElementById("captcha_div").innerHTML = "<img src='/KmcCaptcha.png?var1="
				+ d.getTime() + "' alt='보안문자'/>";
	}

	function play_sound() {
		var d = new Date();

		var agent = window.navigator.userAgent;
		var ie = agent.indexOf("MSIE");
		var ie8 = agent.indexOf("IE8");

		var trident = agent.indexOf("Trident");

		if (ie > 0) {
			if (ie8 > 0) {
				document.getElementById('ifmAudioCaptcha').src = '/audio.wav';
			} else {
				document.getElementById("audioSupport").innerHTML = "음성 <BGSOUND  src='/audio.wav?var1="
						+ d.getTime() + "'  loop='1' />";
			}
		} else {
			if (trident > 0) {
				document.getElementById("audioSupport").innerHTML = "음성 <BGSOUND  src='/audio.wav?var1="
						+ d.getTime() + "'  loop='1' />";
			} else {
				document.getElementById("audioSupport").innerHTML = "<audio controls autoplay src='/audio.wav?var1="
						+ d.getTime() + "' ></audio>";
			}
		}
	}

	function call_check() {
		// 이통사 서비스 점검 체크
		//		if(!checkCommId('SKT')) {
		//			return;
		//		}

		var val = document.getElementById("Sex").value;

		call_cplogn();

	}

	function call_check_noMsg() {
		// 이통사 서비스 점검 체크
		//		if(!checkCommId('SKT')) {
		//			return;
		//		}

		call_cplogn_noMsg();

	}
</script>
</head>
<body ondragstart="return false" onselectstart="return false"
	oncontextmenu="return false" style="zoom: 1;">
	<!-- 이동통신사 장애 알림 -->
	<script type="text/javascript">
		function checkCommId(telecom) {
			var result1 = "1";
			var result2 = "2";
			var result3 = "3";
			var result4 = "4";

			return result3;
		}
	</script>

	<div id="wrap">
		<header id="header">
			<script type="text/javascript">
				var isDupClick = false;

				function goTab(tabGun) {
					var f = document.goTabForm;

					if (isDupClick) {
						alert('이미 진행중입니다.');
						return;
					}

					if (tabGun == "app") {
						f.action = "https://www.kmcert.com/kmcis/simpleCert_web_v3/kmcisApp01.jsp";
					} else if (tabGun == "sms") {
						f.action = "https://www.kmcert.com/kmcis/web_v4/kmcisSms01.jsp";
					} else {
						f.action = "https://www.kmcert.com/kmcis/simpleCert_web_v3/kmcisApp01.jsp";
					}

					isDupClick = true;

					f.submit();
				}
			</script>
			<h1>
				<a href="#;"><img	src="https://img4.kmcert.com/kmcis/new_web/img/logo_pass.png"
					alt="PASS"></a>
			</h1>
			<ul class="gnb_wrap col-2">
				<li onclick="javascript:goTab('app');"><a href="#" id="qr_auth">PASS로
						인증하기</a></li>
				<li class="on" onclick="javascript:goTab('sms');"><a
					title="선택됨" href="#" id="sms_auth">문자(SMS)로 인증</a></li>
			</ul>
		</header>

		<section id="ct" class="certify_user2 certifyWrap certifyWrap_02">
			<form id="cplogn" name="cplogn" method="post" action="/join/agreement" target="parentWindow">
				<div class="">
					<fieldset>
						<legend>휴대폰 본인확인 입력</legend>
						<ul class="frm_type">
							<li class="name">
								<h3>
									<label for="username">이름</label>
								</h3>
								<div class="input input_del">
									<input type="text" autocomplete="name" name="userName"
										id="userName" placeholder="성명입력" title="이름" value="">
								</div>
							</li>
							<li class="mynum">
								<h3>
									<label for="mynum1">생년월일/성별</label>
								</h3>
								<ul class="ui_cols">
									<li><span class="input input_mynum"> <input
											type="text" name="userBirth" id="Birth" maxlength="6"
											title="주민등록번호 앞 6자리" value=""> <span
											class="mark firsChild" id="mynum1_mark"><i></i><i></i><i></i><i></i><i></i><i></i></span>
									</span></li>
									<li><i></i></li>
									<li><span class="input input_mynum last"> <input
											type="text" name="userGender" id="Sex" maxlength="1"
											title="주민등록번호 7번째 자리" value=""> <span
											class="mark firstChild" id="mynum2_mark"><i></i></span>
									</span> <span class="mynum_after"><code class="blind"></code><i></i><i></i><i></i><i></i><i></i><i></i></span>
									</li>
								</ul>
							</li>
							<li>
								<h3>
									<label for="mobileno">휴대폰번호</label>
								</h3>
								<div class="input input_del">
									<input type="text" name="userTel" id="userTel" placeholder="숫자만 입력"
										title="휴대폰번호" maxlength="11" value="">
								</div>
							</li>
							<li>
								<h3>
									<label for="mobileno">보안문자</label>
								</h3>
								<div class="input input_del secur_wrap">
									<div class="num_area" style="width: 60%">
										<div style="width: 100% !important; height: 33px !important;">
											<div class="secret_num" id="captcha_div"
												style="float: left; width: 166px !important;">
												<img src="	https://www.kmcert.com/KmcCaptcha.png" alt="보안문자">
											</div>
											<div class="secuBtn"
												style="display: inline-block; float: left; width: 80px !important; margin-left: 4px; margin-top: 5px;">
												<a href="#" title="새로고침"><img
													src="https://img4.kmcert.com/kmcis/comm/images/img/refresh_big.png"
													style="border: 1px solid gray; border-radius: 6px; width: 46%;"
													alt="새로고침" ></a> <a rel="nofollow" href="#"
													onclick="javascript:play_sound()" title="음성듣기"> <img
													src="https://img4.kmcert.com/kmcis/comm/images/img/sound_big.png"
													alt="음성듣기"
													style="border: 1px solid gray; border-radius: 6px; width: 46%;">
												</a>
												<iframe name="ifmAudioCaptcha" id="ifmAudioCaptcha"
													style="display: none;" width="0" height="0"
													title="보안문자_hiddenFrame_IE대응"></iframe>
												<span id="audioSupport" style="display: none"
													title="보안문자_음성대응"></span>
												<div class="BDC_Placeholder" id="CAPTCHA_AudioPlaceholder">&nbsp;</div>
											</div>
										</div>
									</div>
									<div class="ipt_area" style="width: 40%">
										<div class="input input_del">
											<input type="text" autocomplete="secur" name="securityNum"
												id="securityNum" placeholder="보안문자 입력" title="보안문자 입력"
												maxlength="5" value="">
										</div>
									</div>
								</div>
							</li>
						</ul>
					</fieldset>
					<div class="certi_btn_area">
						<ul class="btn_area2 bt2">
							<li><button type="button" id="btnCancel" class="btn_r btn_type6" >취소</button></li>
							<li><button type="button" id="btnSubmit"  class="btn_r btn_type btn_type3">확인</button></li>
						</ul>
					</div>
				</div>
				<input type="hidden" id="popupDataName" name="username" />
				<input type="hidden" id="popupDataBirth" name="userbirth" />
				<input type="hidden" id="popupDataGender" name="usergender" />
				<input type="hidden" id="popupDataTel" name="usertel" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<div class="passCertiInfo">
				<ul>
					<li>
						<p>
							PASS앱 설치 및 가입 후 이용이 가능합니다. <br> 앱마켓(구글 플레이스토어 / 애플 앱스토어) 에서
							<span class="highlighter"><strong>“PASS”</strong> 검색!</span>
						</p>
					</li>
				</ul>
			</div>
		</section>
		
<!-- footer -->
		<div class="footerBanner">
			<a href="https://www.tauth.net/pass/bridge/link/add/A102"
				onclick="window.open(this.href,'','width=800,height=930, scrollbars=1'); return false;"
				title="SKT 이벤트 배너 - 새창"> <img
				src="https://img4.kmcert.com/kmcis/qr_web/images/adverimg_skt.jpg"
				alt="손쉬운 발급, 3년 사용 안전하고 간편한 PASS인증서">
			</a>
		</div>
		<div id="footer">
			<script type="text/javascript">
				function goAgreePop(value1, value2) {
					var UserAgent = navigator.userAgent.toLowerCase();

					if (UserAgent.indexOf("chrome") != -1) {
						window
								.open(
										value1,
										value2,
										'width=413, height=551, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0');
					}
					if (UserAgent.indexOf("version") != -1) {
						window
								.open(
										value1,
										value2,
										'width=427, height=490, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0');
					} else {
						window
								.open(
										value1,
										value2,
										'width=385, height=635, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0');
					}
				}
			</script>
			<div class="footer_kmc">
				<a
					href="javascript:goAgreePop('/kmcis/comm/kmcisHpUse_popUpBox.html','personal','all');"
					title="이용약관 전문보기-새창" style="color: #4F4F4F;">이용약관</a> | <a href="#"
					onclick="window.open('http://www.sktelecom.com/view/footer/privacy.do','skt','left=0,top=0,scrollbars=yes,realzable=yes');return false;"
					title="SKT 개인정보처리방침 전문보기-새창" style="color: #4F4F4F;"> 개인정보처리방침</a>
				| <span style="color: #4F4F4F;">GlobalSign 256 SSL 암호화 적용</span> <span
					class="kmc_logo"></span>
				<div
					style="float: right; margin-top: 50% color:#4F4F4F; width: 72px; height: 23px; overflow: hidden; line-height: 0; text-indent: -9999px"
					title="한국모바일인증 로고">한국모바일인증 로고</div>
			</div>
		</div>
		<!-- 키보드보안 6.5 REAL URL -->
	</div>
<script>
function formSubmit() {
	var form = $("#cplogn");
	form.submit();
}

$(function () {
  	$('#securityNum').keydown(function(event) {
    	if ( event.which == 13 ){
     		$("#btnSubmit").click();	
     	}
   	});
  	
	
	$("#btnSubmit").on("click", function () {
		if($("#userName").val()==""){
			alert("이름을 입력해주세요.");
			 $("#userName").focus();
			return false;
		}
		if($("#Birth").val()==""){
			alert("주민번호 앞 6자리를 입력해주세요.");
			 $("#Birth").focus();
			return false;
		}
		if($("#Sex").val()==""){
			alert("주민번호 뒷자리를 입력해주세요.");
			 $("#Sex").focus();
			return false;
		}
		if($("#userTel").val()==""){
			alert("휴대폰번호를 입력해주세요.");
			 $("#userTel").focus();
			return false;
		}
		if($("#securityNum").val()==""){
			alert("보안문자를 정확히 입력해주세요.");
			 $("#securityNum").focus();
			return false;
		}
		alert("인증이 완료되었습니다.");
	//	parent.window.name="parentWindow";
		close();
		formSubmit();
	});
	$("#btnCancel").on("click", function () {
		alert("인증이 취소되었습니다.");
		close();
	});
});
</script>
</body>
</html>