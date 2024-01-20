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
		  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, viewport-fit=cover">
		  <meta name="format-detection" content="telephone=no">
		  <link href="https://img4.kmcert.com/kmcis/new_web/css/common.css?ver=202206201405" media="screen" rel="stylesheet">
		  <link href="https://img4.kmcert.com/kmcis/new_web/css/site.css?ver=202206201405" media="screen" rel="stylesheet">
		  <script src="https://img4.kmcert.com/kmcis/new_web/js/jquery.min.js"></script>
		  <script src="https://img4.kmcert.com/kmcis/new_web/js/common.js"></script>
		  <script src="https://img4.kmcert.com/kmcis/new_web/js/design.js?ver=202303161023"></script>
		  <title>이동통신사 선택 | 본인확인서비스-한국모바일인증(주)</title>
		  <script type="text/javascript">
				window.moveTo("400", "60");
				window.resizeTo("496","880");

			function winPopUpResize(){
				var r_width
			    var r_height

				if(window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight) {
					r_width  = $('#wrap').outerWidth() + (window.outerWidth - window.innerWidth);	    		
					r_height = $('#wrap').outerHeight() + (window.outerHeight - window.innerHeight);
				} else {
					var dw = $(document).outerWidth();
					var dh = $(document).outerHeight();
					
					var ww = $(window).width();
					var wh = $(window).height();
					window.resizeTo(dw,dh);
					
					var lastw = dw - $(window).width();
					var lasth = dh - $(window).height();
					r_width  = $('#wrap').outerWidth()  + lastw;
					r_height = $('#wrap').outerHeight() + lasth;
				}

				window.moveTo("400", "60");
				window.resizeTo(r_width, r_height);
			}

			function winPopUpResizeOpera(){
				window.moveTo("400", "60");
				window.resizeTo("626","921");
			}

			$(document).ready(function() {
			  var clickNext = false;

			  // SMS 인증 시작
			  $('body').on('click', '#btnSms', function() {

				// 통신사 선택 여부
				if (agencyCheck() === false) {
				  return;
				}
				// 동의 여부
				if (checkAgree() === false) {
				  return;
				}
				commIdCheck('1');
				// 중복 클릭 방지
				if (clickNext === true) {
				  return;
				}
				clickNext = true;
			});

			  // PASS 인증 시작
			  $('body').on('click', '#btnPassTran', function() {

				// 통신사 선택 여부
				if (agencyCheck() === false) {
				  return;
				}
				// 동의 여부
				if (checkAgree() === false) {
				  return;
				}

				// 중복 클릭 방지
				if (clickNext === true) {
				  return;
				}
				commIdCheck('2');
				clickNext = true;
			  });

			  // 초기화
			  $('input:radio[name=mobileco]').prop('checked', false);
			  $('.check2 input').prop("checked", false).next('label').removeClass('checked');
			  $('.btn_skip').removeClass('active');

			  // 통신사 선택 + 약관 동의 둘다 체크됐을 경우
			  $('body').on('click', function() {
				var mobilecoCheck = $('input:radio[name=mobileco]').is(':checked') === true;
				var agreeCheck = $('input:checkbox[name=agree]').is(':checked') === true;

				if (mobilecoCheck === true && agreeCheck === true) {
				  $('.btn_skip').addClass('active');
				} else {
				  $('.btn_skip').removeClass('active');
				}
			  });

			  // 동의문 체크 시 통신사 선택 여부 체크
			  $('body').on('click', 'input:checkbox[name=agree]', function() {
				if (agencyCheck() === false) {
				  $('.check2 input').prop("checked", false).next('label').removeClass('checked');
				  $('.btn_skip').removeClass('on');
				}
			  });

			  // 통신사 선택 시 동의 초기화
			  var checkMobileco = "";
			  $('body').on('click', 'input:radio[name=mobileco]', function() {
				var mobileco = $('input:radio[name=mobileco]:checked').val();
				if (checkMobileco !== mobileco) {
				  $('.check2 input').prop("checked", false).next('label').removeClass('checked');
				  checkMobileco = mobileco;
				}
			  });

			  // 동의문 레이어 팝업
			  var btn_agree_popup_focus = '';
			  $('body').on('click', '.btn_agree_popup', function() {
				var byId = $(this).attr("id");
				var mobileco = $('input:radio[name=mobileco]:checked').val();

				// 선택된 통신사가 없는 경우
				if (mobileco == null || mobileco == "" || mobileco == "undefined") {
				  alert('이용중이신 통신사를 선택해주세요.');
				  return false;
				}

				if (mobileco == "MVNO") {
					var mobilecoPop = $('input:radio[name=mobilecoPop]:checked').val();	
					if (mobilecoPop == null || mobilecoPop == "" || mobilecoPop == "underfind") {
					  alert("알뜰폰 사업자를 선택해주세요.");
					  return false;
					}
					mobileco = mobilecoPop;
				}

				// 동의 타이틀 지정
				if (byId === 'agree1Pop') {
				  agreeNo = "1";
				  $("#agreeTitle").text("개인정보이용동의");
				} else if (byId === 'agree2Pop') {
				  agreeNo = "2";
				  $("#agreeTitle").text("고유식별정보처리동의");
				} else if (byId === 'agree3Pop') {
				  agreeNo = "3";
				  $("#agreeTitle").text("서비스이용약관동의");
				} else if (byId === 'agree4Pop') {
				  agreeNo = "4";
				  $("#agreeTitle").text("통신사이용약관동의");
				}
				
				else if (byId === 'agree5Pop') {
				  agreeNo = "5";
				  $("#agreeTitle").text("제3자정보제공동의");
				}
				
				var popmobileco = mobileco;

				if (agreeNo == '5') {
					if (mobileco == 'SKM')	{ popmobileco = 'SKTMVNO3rd' }
					else if (mobileco == 'KTM')	{ popmobileco = 'KTFMVNO3rd' }
					else if (mobileco == 'LGM')	{ popmobileco = 'LGTMVNO3rd' }
				}

				// 동의 내용
				inAgreeContent(popmobileco, agreeNo);
				

				// 약관팝업
				btn_agree_popup_focus = $(this);

				$('.dim').show();
				$('.layer-pop.agreement').fadeIn();
				$('.pop-con').attr("tabIndex", "0").focus();

			  });

			  // 팝업 닫기 시
			  $('body').on('click', '.pop-btn .agreeClose', function() {
				pop_close();
				btn_agree_popup_focus.focus();
			  });

			  // 통신사 약관 레이어팝업 탭 포커스 제어
			  $('.layer-pop .agreeClose').keydown(function(event) {
				if (event.keyCode == '9' && !event.shiftKey) {
				  event.preventDefault();
				  $('.layer-pop .pop-con').attr('tabindex', '0').focus();
				}
			  });
			  $('.layer-pop .pop-con').keydown(function(event) {
				if (event.keyCode == '9' && event.shiftKey) {
				  event.preventDefault();
				  $('.layer-pop .agreeClose').attr('tabindex', '0').focus();
				}
			  });

			 $('.agency_select').on('click', 'input[type="radio"]+label', function(){
				$('#btnPassTran').css("display", "block");

				var mobileco = $('input:radio[name=mobileco]:checked').val();
				if (mobileco != "MVNO") {
					$('.licensee-list').each(function(){
						$(".licensee-list li").removeClass('active');
						
						$('.licensee-list li').find('.arco').prop('title','축소됨, 선택해제됨');
						$('.licensee-list li').find('.icon_arrow').addClass('down');
						$('.licensee-list li .licensee_info').stop().slideUp();
					});
				}
		     });
			});

			
			$(document).on('keydown', '#agency-and', function(e){
				var isShift = window.event.shiftKey ? true : false;
				var $eventTarget = $(document.activeElement);

				if(isShift && (e.keyCode == 9) && $eventTarget.attr('role') === 'button') {
					e.preventDefault();
					$('#agency-sk').click().focus();
				}
				if(!isShift && (e.keyCode == 13)) {
					e.preventDefault();
					$('#agency-and').click();
				}

			});

			$(document).on('keydown', '#agency-sk', function(e){
				var isShift = window.event.shiftKey ? true : false;
				var $eventTarget = $(document.activeElement);

				if(!isShift && (e.keyCode == 9) && $eventTarget.attr('role') !== 'button') {
					e.preventDefault();
					$('#agency-and').focus();
				}
				if(!isShift && (e.keyCode == 37) && $eventTarget.attr('role') !== 'button' || !isShift && (e.keyCode == 38) && $eventTarget.attr('role') !== 'button') {
					e.preventDefault();
					$('#agency-lgu').click().focus();
				}
			});

			$(document).on('keydown', '#agency-kt', function(e){
				var isShift = window.event.shiftKey ? true : false;
				var $eventTarget = $(document.activeElement);

				if(!isShift && (e.keyCode == 9) && $eventTarget.attr('role') !== 'button') {
					e.preventDefault();
					$('#agency-and').focus();
				}
			});

			$(document).on('keydown', '#agency-lgu', function(e){
				var isShift = window.event.shiftKey ? true : false;
				var $eventTarget = $(document.activeElement);

				if(!isShift && (e.keyCode == 9) && $eventTarget.attr('role') !== 'button') {
					e.preventDefault();
					$('#agency-and').focus();
				}
				if(!isShift && (e.keyCode == 39) && $eventTarget.attr('role') !== 'button' || !isShift && (e.keyCode == 40) && $eventTarget.attr('role') !== 'button') {
					e.preventDefault();
					$('#agency-sk').click().focus();
				}
			});

			$(document).on('keydown', '#agree_all', function(e){
				var isShift = window.event.shiftKey ? true : false;
				var $eventTarget = $(document.activeElement);

				if(isShift && (e.keyCode == 9)) {
					e.preventDefault();
					$('#agency-and').focus();
				}
			});

			// 알뜰폰 사업자 선택 및 레이어 닫기
			function pop_select(){
				var agencyCheck = $("input[type=radio][name=mobilecoPop]:checked").val();
				if (agencyCheck == null || agencyCheck == "" || agencyCheck == "underfind") {
				  alert("알뜰폰 사업자를 선택해주세요.");
				  
				  setTimeout(function() {
					$('#agency-and').focus();
				  }, 100);
				  return false;
				}

				pop_close();
				
				setTimeout(function() {
					$('#agency-and').focus();
				}, 100);
			}

			// 알뜰폰 사업자 취소 및 레이어 닫기
			function pop_cancle(){
				$('.check2 input').prop("checked", false).next('label').removeClass('checked');

				$('.licensee-list').each(function(){
					$(".licensee-list li").removeClass('active');
					
					$('.licensee-list li').find('.arco').prop('title','축소됨, 선택해제됨');
					$('.licensee-list li').find('.icon_arrow').addClass('down');
					$('.licensee-list li .licensee_info').stop().slideUp();
				});
				$("#agency-popup-sk").prop('checked', false);
				$("#agency-popup-kt").prop('checked', false);
				$("#agency-popup-lgu").prop('checked', false);

				pop_close();
				
				setTimeout(function() {
					$('#agency-and').focus();
				}, 100);
			}

			// 통신사 체크 확인
			function agencyCheck() {
			  // 체크 여부 확인
			  if ($('input:radio[name=mobileco]').is(':checked') === true) {
				// 체크된 경우 값이 유효한지 확인
				var agencyCheck = $("input[type=radio][name=mobileco]:checked").val();
				if (agencyCheck == null || agencyCheck == "" || agencyCheck == "underfind") {
				  alert("통신사를 선택해주세요.");
				  document.frm.mobileco[0].focus();
				  return false;
				}

				if (agencyCheck == "MVNO"){
					var mvnoCheck= $(":input:radio[name=mobilecoPop]:checked").val();	// 선택된 MVNO 통신사 값 가져오기
					if (mvnoCheck == null || mvnoCheck == "" || mvnoCheck == "underfind") {
					  alert("통신사를 선택해주세요.");
					  document.frmPop.mobilecoPop[0].focus();
					  return false;
					}
				}
				return true;

			  } else {
				alert("통신사를 선택해주세요.");
				return false;
			  }
			}

			//동의문 체크
			function checkAgree() {
			  if ($("#agree1").is(":checked") === false) {
				alert('개인정보이용 동의에 동의해 주십시오.');
				$("#agree1").focus();
				return false;
			  }

			  if ($("#agree2").is(":checked") === false) {
				alert('고유식별정보 처리 동의에 동의해 주십시오.');
				$("#agree2").focus();
				return false;
			  }

			  if ($("#agree3").is(":checked") === false) {
				alert('서비스 이용약관 동의에 동의해 주십시오.');
				$("#agree3").focus();
				return false;
			  }

			  if ($("#agree4").is(":checked") === false) {
				alert('통신사 이용약관 동의에 동의해 주십시오.');
				$("#agree4").focus();
				return false;
			  }

			  var agencyCheck = $("input[type=radio][name=mobileco]:checked").val();
				
			  if (agencyCheck == 'MVNO') {
				  if ($("#agree5").is(":checked") === false) {
					alert('제3자 정보제공 동의에 동의해 주십시오.');
					$("#agree5").focus();
					return false;
				  }
			  }
			  // End - [KMD311-22400] 알뜰폰 본인확인 프로세스 변경 요청의 건 - 2022.09.20 kmcweb23
			  return true;
			}

			function commIdCheck(type){
				if( sessionStorage.getItem("nProtectInstallAgree") == "Y" ){
					sessionStorage.clear();
				}	
			
				var strMobile= $(":input:radio[name=mobileco]:checked").val();	// 선택된 통신사 값 가져오기
				var strMvno= $(":input:radio[name=mobilecoPop]:checked").val();	// 선택된 MVNO 통신사 값 가져오기
	
			function checkTelecom(telecom) {
				//alert(telecom);
				if ((telecom == 'LGT') || (telecom == 'LGM')) {
					$('.passAuth').html('간편인증(PASS) 하기');
				} else {
					$('.passAuth').html('PASS로 인증하기');
				}
			}		
		  </script>
		</head>
		<body ondragstart="return false" onselectstart="return false" oncontextmenu="return false" style="zoom: 1;">
			<!-- 이동통신사 장애 알림 -->
<script type="text/javascript">


	function checkCommId( telecom ){
        var result1 = "1";
        var result2 = "2";
        var result3 = "3";
        var result4 = "4";


		return result3;
	}

</script>
		  <div id="wrap">
			<header id="header" class="step1header">
			  <h1>
				<a href="#;"><img src="https://img4.kmcert.com/kmcis/new_web/img/logo_pass.png" alt="PASS"></a>
			  </h1>
			</header>

			<section id="ct">
				<fieldset class="ui_cover agency_select">
				  <p>이용중이신 통신사를 선택해주세요.</p>
				  <legend>통신사 선택</legend>
				  <ul class="agency_select__items">
					
					
					<li aria-label="SK telecom">
					  <input type="radio" name="mobileco" id="agency-sk" value="SKT" title="SK telecom 선택" aria-label="SK telecom 선택">
					  <label for="agency-sk" aria-hidden="true" onclick="checkTelecom('SKT')" class="ui_align_mid checked">
						<span class="ele">
						  <img src="https://img4.kmcert.com/kmcis/new_web/img/logo_sk.png" alt="SK telecom 선택" class="active firstChild">
						  <img src="https://img4.kmcert.com/kmcis/new_web/img/logo_sk_gray.png" alt="SK telecom 미선택 " class="lastChild">
						</span>
					  </label>
					</li>
					<li aria-label="KT">
					  <input type="radio" name="mobileco" id="agency-kt" value="KTF" title="KT 선택" aria-label="KT 선택">
					  <label for="agency-kt" aria-hidden="true" onclick="checkTelecom('KTF')" class="ui_align_mid checked">
						<span class="ele">
						  <img src="https://img4.kmcert.com/kmcis/new_web/img/logo_kt.png" alt="kt 선택" class="active firstChild">
						  <img src="https://img4.kmcert.com/kmcis/new_web/img/logo_kt_gray.png" alt="kt 미선택 " class="lastChild">
						</span>
					  </label>
					</li>
					<li aria-label="LG U+">
					  <input type="radio" name="mobileco" id="agency-lgu" value="LGT" title="LG U+ 선택" aria-label="LG U+ 선택">
					  <label for="agency-lgu" aria-hidden="true" onclick="checkTelecom('LGT')" class="ui_align_mid checked">
						<span class="ele">
						  <img src="https://img4.kmcert.com/kmcis/new_web/img/logo_lgu.png" alt="LG U+ 선택" class="active firstChild">
						  <img src="https://img4.kmcert.com/kmcis/new_web/img/logo_lgu_gray.png" alt="LG U+ 미선택 " class="lastChild">
						</span>
					  </label>
					</li>
					<li aria-label="알뜰폰">
					  <input type="radio" name="mobileco" id="agency-and" value="MVNO" title="알뜰폰 선택" aria-label="알뜰폰 선택" class="pop-btn" role="button">
					  <label for="agency-and" aria-hidden="true" class="ui_align_mid checked">
						<span class="ele">
						  <img src="https://img4.kmcert.com/kmcis/new_web/img/logo_and.png" alt="알뜰폰 선택" class="active firstChild">
						  <img src="https://img4.kmcert.com/kmcis/new_web/img/logo_and_gray.png" alt="알뜰폰 미선택" class="lastChild">
						</span>
					  </label>
					</li>
				  </ul>

				  <!-- 전체동의 -->
				  <ul class="agreelist all">
					<li><span class="checkbox check2"><input type="checkbox" name="agree" id="agree_all"><label for="agree_all">전체 동의하기</label><label for="agree_all">전체 동의</label></span></li>
				  </ul>

				  <!-- 필수항목 -->
				  <ul class="agreelist required">
					<li>
					  <span class="checkbox check2"><input type="checkbox" name="agree1" id="agree1" value="Y">
						<label for="agree1">개인정보이용 동의하기</label>
						<button type="button" class="btn_agree_popup" id="agree1Pop" title="개인정보이용동의 레이어 팝업 열기">개인정보이용동의</button></span>
					</li>
					<li>
					  <span class="checkbox check2"><input type="checkbox" name="agree2" id="agree2" value="Y"><label for="agree2">고유식별정보처리 동의하기</label>
						<button type="button" class="btn_agree_popup" id="agree2Pop" title="고유식별정보처리동의 레이어 팝업 열기">고유식별정보처리동의</button></span>
					</li>
					<li>
					  <span class="checkbox check2"><input type="checkbox" name="agree3" id="agree3" value="Y"><label for="agree3">서비스이용약관 동의하기</label>
						<button type="button" class="btn_agree_popup" id="agree3Pop" title="서비스이용약관동의 레이어 팝업 열기">서비스이용약관동의</button></span>
					</li>
					<li>
					  <span class="checkbox check2"><input type="checkbox" name="agree4" id="agree4" value="Y"><label for="agree4">통신사이용약관 동의하기</label>
						<button type="button" class="btn_agree_popup" id="agree4Pop" title="통신사이용약관동의 레이어 팝업 열기">통신사이용약관동의</button></span>
					</li>
					
					<li class="3rdagree" style="display:none">
					  <span class="checkbox check2"><input type="checkbox" name="agree5" id="agree5" value="Y"><label for="agree5">제3자정보제공 동의하기</label>
						<button type="button" class="btn_agree_popup" id="agree5Pop" title="제3자정보제공동의 레이어 팝업 열기">제3자정보제공동의</button></span>
					</li>		
				  </ul>
				  <button type="button" id="btnPassTran" class="btn_r btn_type6 btn_r btn_skip passAuth">PASS로 인증하기</button>
				  <button type="button" id="btnSms" class="btn_r btn_type6 btn_r btn_skip2">문자(SMS)로 인증하기</button>
				</fieldset>
	<!-- 키보드보안 6.5 REAL URL -->
			</section>

			<form id="cplogn" name="cplogn" method="get" action="verify_phlast">
				<input type="hidden" name="reqInfo" value="FF3C0E7EC1A2A8EF675600B2C421F87785F62E8E44C8B86DCD70D56AB7C7F0A568BDC8D8651D1BBF243F7C764696F8CF672D10627188AFA294140A1631209084E19FEB81795467A64615AAFDAE5B740719746E4A8EADEC98F2990469F1BA5CA8B6E1B0D03AD07AF9F52B0CA872ABCBF4E628D11D66D145166B922D22131E93C2D2370B2EA5A77519EFCA48A12203F175B3A04FDDDA1A2F909998207ED37DF258F8484001684F6CA02CF79127EAED3D98C8E29272537215637FD9D2291FE07D78425B52D74E867BB4EC8FCE5F53EE43E9C5B43292083546C0175BFF66AC0B4A997C33216D769B629B4183668A0AFF2C94B7B50FC0876C1E522FF50616972FBB21">
				<input type="hidden" name="returnURL" value="30AE4190ABA49F31B0B08B570F0712C134735204AA80C3494155F0BEF3CA1D7E926E6DB3FA4346606FD3BACFD3BF0720F7EC14F53A6FFF982237CFACF3E4F1E1ED7BEC2A3C2A5A793B6BDEA4DB0CE62B">
				<input type="hidden" name="reqInfo1" value="E86A3C280320B80B2D3D6FDCD9E36FC3681CD330F86427C701AE21842D3A0DBE">
				<input type="hidden" name="reqInfo2" value="KMC000001-">
				<input type="hidden" name="reqCommIdStated" value="">
				<input type="hidden" name="reqCommIdStatedYn" value="N">
				<input type="hidden" name="retry" id="retry" value="">
				<input type="hidden" name="CommId" id="CommId" value="">
				<input type="hidden" name="reqCriOSYn" value="Y">
			</form>

			<div id="footer">
		<script type="text/javascript">
			function goAgreePop(value1,value2){
				var UserAgent = navigator.userAgent.toLowerCase();

				if(UserAgent.indexOf("chrome") != -1){
					window.open(value1,value2,'width=413, height=551, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0');
				} 
				if(UserAgent.indexOf("version") != -1){
					window.open(value1,value2,'width=427, height=490, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0');
				} else {
					window.open(value1,value2,'width=385, height=635, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0');
				}
			}
		</script>

            <div class="footer_kmc">
				<a href="javascript:goAgreePop('/kmcis/comm/kmcisHpUse_popUpBox.html','personal','all');" title="이용약관 전문보기-새창" style="color:#4F4F4F;">이용약관</a> | 
				<a href="#" onclick="javascript:goAgreePop('/kmcis/comm/kmcisHpPersonalPop_popUpBox.html?ver=20201210','personal','all');" title="개인정보처리방침 전문보기-새창" style="color:#4F4F4F;">
				개인정보처리방침</a> | <span style="color:#4F4F4F;">GlobalSign 256 SSL 암호화 적용</span>
				<span class="kmc_logo"></span>
				<div style="float:right; margin-top:50% color:#4F4F4F; width:72px; height:23px; overflow:hidden; line-height:0; text-indent:-9999px" title="한국모바일인증 로고">한국모바일인증 로고</div>
			</div>
			</div>
			<!-- 알뜰폰 레이어 팝업 -->
			<div class="layerPopupWrap">
			  <div class="dim"></div>
			  <div class="layer-pop agency_select__popup">
				<form name="frmPop" method="post" action="" autocomplete="off" onsubmit="return false;">
				  <div class="pop-tit">알뜰폰 사업자를 선택해주세요.</div>
				  <div class="pop-con_02">
					<ul class="licensee-list">
					  <li class="first-item">
						<div class="licensee_title agency-popup-sk">
						  
						  <a href="#" title="목록열기, 선택해제됨" class="arco focus_sk">
							<input type="radio" name="mobilecoPop" id="agency-popup-sk" value="SKM" title="SKT(알뜰폰) 선택">
							
							<label for="agency-popup-sk" class="checked" onclick="checkTelecom('SKM')">
							  <span class="ele sk"><img src="https://img4.kmcert.com/kmcis/new_web/img/logo_sk.png" alt="SK telecom"></span>
							  <span class="ele_title">사업자목록 <i class="icon_arrow down"></i> </span>
							</label>
						  </a>
						</div>
						<div class="licensee_info" tabindex="0">
						  <p>아이즈비전(아이즈모바일), 유니컴즈(모빙), 스마텔 (스마텔), 에스원(안심모바일), LG헬로비전(헬로모바일), KCT(티플러스), 큰사람(이야기모바일), SK텔링크(SK세븐모바일), 이마트(이마트알뜰폰), 프리텔레콤(프리티), 조이텔(조이텔), 토스모바일(토스모바일), KB국민은행(리브모바일), 스테이지파이브(핀다이렉트)</p>
						</div>
					  </li>
					  <li class="">
						<div class="licensee_title agency-popup-kt">
						  <a href="#" title="목록열기, 선택해제됨" class="arco">
							<input type="radio" name="mobilecoPop" id="agency-popup-kt" value="KTM" title="KT(알뜰폰) 선택">
							
							<label for="agency-popup-kt" class="checked" onclick="checkTelecom('KTM')">
							  <span class="ele kt"><img src="https://img4.kmcert.com/kmcis/new_web/img/logo_kt.png" alt="KT"></span>
							  <span class="ele_title">사업자목록 <i class="icon_arrow down"></i> </span>
							</label>
						  </a>
						</div>
						<div class="licensee_info" tabindex="0">
						  <p>(주)LG헬로비전(헬로모바일), (주)니즈텔레콤(니즈모바일), (주)더원플랫폼(아이플러스유), (주)미니게이트(M2모바일), (주)스테이지파이브(핀플레이), (주)와이엘랜드(여유알뜰폰), (주)위너스텔(웰), (주)파인디지털, (주)한국케이블텔레콤(티플러스), ACN코리아(플래시모바일), KT스카이라이프(스카이라이프모바일), KT엠모바일(Kt M 모바일), KT텔레캅, 드림라인(주)(드림모바일), 로카모빌리티(주), 토스모바일, 아이디스파워텔(주), 앤알커뮤니케이션(앤텔레콤), 에스원(안심모바일), 장성모바일, (주)세종텔레콤(스노우맨), (주)씨엔커뮤니케이션(씨앤컴), (주)아이즈비전(아이즈모바일), (주)에넥스텔레콤(A모바일), (주)에이프러스(아시아모바일), (주)유니컴즈(모빙), (주)제이씨티, (주)코드모바일(이지모바일), (주)큰사람커넥트(이야기모바일), (주)프리텔레콤(프리티), 한국피엠오(주)(밸류컴), (주)스마텔, (주)포인트파크, KB국민은행(리브엠), (주)고고팩토리, (주)더피엔엘, (주)에르엘, (주)핀샷</p>
						</div>
					  </li>
					  <li class="">
						<div class="licensee_title agency-popup-lgu">
						  <a href="#" title="목록열기, 선택해제됨" class="arco">
							<input type="radio" name="mobilecoPop" id="agency-popup-lgu" value="LGM" title="LGU+(알뜰폰) 선택">
							
							<label for="agency-popup-lgu" class="checked" onclick="checkTelecom('LGM')">
							  <span class="ele lgu"><img src="https://img4.kmcert.com/kmcis/new_web/img/logo_lgu.png" alt="LG U+"></span>
							  <span class="ele_title">사업자목록 <i class="icon_arrow down"></i> </span>
							</label>
						  </a>
						</div>
						<div class="licensee_info" tabindex="0">			  
						  <p>ACN코리아(플래시모바일), (주)에넥스텔레콤(A모바일), (주)에이프러스(아시아모바일), (주)CK커뮤스트리(슈가모바일), SL리테일(셀모바일), (주)코드모바일(이지모바일), 에르엘모바일, (주)아이즈비전(아이즈모바일), (주)핀샷, LG헬로비전(헬로모바일), 한패스모바일, (주)보스(화인통신), 사람과연결, 인스코리아, 조이텔, 국민은행(리브모바일), 제주방송, (주)코나아이, (주)KG모빌리언스(KG모바일), (주)큰사람커넥트(이야기모바일), 토스모바일, (주)미디어로그(U+유모바일), (주)마블프로듀스(마블링), 니즈텔레콤, (주)앤알커뮤니케이션(앤텔레콤), 엔티온텔레콤, 원텔레콤, (주)스테이지파이브(핀플레이), 한국피엠오(주)(벨류컴), (주)레그원(온국민폰), 에스원안심모바일, 서경모바일, 세종텔레콤(스노우맨), 스마텔, (주)인스코비(프리티), (주)한국케이블텔레콤(티플러스), (주)유니컴즈(모빙), (주)와이드모바일(도시락모바일), (주)위너스텔(well), (주)와이엘랜드(여유텔레콤)</p>
						</div>
					  </li>
					</ul>
				  </div>

				  <div class="pop-btn pop-btn_02">
					<ul>
					  
					  
					  <li class="firstChild"><button type="button" onclick="pop_cancle()" class="btn_r btn_type6">취소</button></li>
					  <li class="lastChild activeDarkGray"><button type="button" onclick="pop_select()" class="btn_r btn_type btn_type3 close">선택</button></li>
					</ul>
				  </div>
				</form>
			  </div>
			</div>

			<!-- 약관 레이어-->
			<div class="layerPopupWrap" id="layerAgreePop">
			  <div class="dim" style=""></div>
			  <div class="layer-pop agreement" style="">
				<div class="pop-tit" id="agreeTitle"></div>
				<div class="pop-con"></div>
				<div class="pop-btn wide">
				  <ul>
					<li class="lastChild defaultBtn DefaultBtn">
					  <button class="close agreeClose" onclick="pop_close()">닫기</button>
					</li>
				  </ul>
				</div>
			  </div>
			</div>

		  </div>
		
		<script>
		  $(function() {
			$(".agency-popup-sk").on('click', function(){
				if ($(this).parent('li').hasClass('active')) {
					$(this).find('input').prop('checked', false);
				}else{
					$(this).find('input').prop('checked', true);
				}
			});

			$(".agency-popup-kt").on('click', function(){
				if ($(this).parent('li').hasClass('active')) {
					$(this).find('input').prop('checked', false);
				}else{
					$(this).find('input').prop('checked', true);
				}
			});

			$(".agency-popup-lgu").on('click', function(){
				if ($(this).parent('li').hasClass('active')) {
					$(this).find('input').prop('checked', false);
				}else{
					$(this).find('input').prop('checked', true);
				}
			});

				/* 알뜰폰 선택 시 레이어팝업 */
				$('#agency-and').click(function() {
				  $('.dim').show();
				  $('.agency_select__popup').fadeIn();
				  
				  $('.focus_sk').attr('tabIndex', '0').focus();
				  
				  $('.3rdagree').css("display","block");
				});
				
				$('#agency-sk').click(function() { $('.3rdagree').css("display","none"); });
				$('#agency-kt').click(function() { $('.3rdagree').css("display","none"); });
				$('#agency-lgu').click(function() { $('.3rdagree').css("display","none"); });

			$('.agency_select__popup .close').click(function() {
			  setTimeout(function() {
				$('#agency-and').siblings('label').focus();
			  }, 100);
			});

			/* 통신사 슬라이드UP/DOWN */
			
			$('.licensee_title').on('click', function(e) {
			  e.preventDefault();

			  var licenseeActive = $('.licensee-list li').hasClass('active');
			  var licenseeInfo = $(this).siblings('.licensee_info');

			  $('.licensee_info').stop().slideUp('slow', function(){ $('.licensee_info').css('overflow-y', 'scroll') });
			  $('.icon_arrow').removeClass('up');
			  $('.icon_arrow').addClass('down');

			  if (licenseeActive == true) {
				if ($(this).parent('li').hasClass('active')) {
				  $('.licensee-list li').removeClass('active');
				  $('.licensee-list li').find('.arco').prop('title','축소됨, 선택해제됨');
				  $('.licensee_info').stop().slideUp('slow', function(){ $('.licensee_info').css('overflow-y', 'scroll') });
				  $(this).find('.icon_arrow').removeClass('up');
				  $(this).find('.icon_arrow').addClass('down');
				} else {
				  $('.licensee-list li').removeClass('active');
				  $('.licensee-list li').find('.arco').prop('title','축소됨, 선택해제됨');
				  $('.licensee_info').stop().slideUp('slow', function(){ $('.licensee_info').css('overflow-y', 'scroll') });
				  $(this).parent('li').addClass('active');
				  $(this).parent('li').find('.arco').prop('title','확장됨, 선택됨');
				  licenseeInfo.stop().slideDown();
				  $(this).find('.icon_arrow').removeClass('down');
				  $(this).find('.icon_arrow').addClass('up');
				}
			  } else if (licenseeActive == false) {
				$(this).parent('li').addClass('active');
				$(this).parent('li').find('.arco').prop('title','확장됨, 선택됨');
				licenseeInfo.stop().slideDown();

				$(this).find('.icon_arrow').removeClass('down');
				$(this).find('.icon_arrow').addClass('up');

				if (licenseeActive == true) {
				  $('.licensee_title').on('click', function(e) {
					e.preventDefault();
					$('.licensee-list li').removeClass('active');
					$('.licensee-list li').find('.arco').prop('title','축소됨, 선택해제됨');
					$('.licensee_info').stop().slideUp('slow', function(){ $('.licensee_info').css('overflow-y', 'scroll') });
					$(this).find('.icon_arrow').removeClass('up');
					$(this).find('.icon_arrow').addClass('down');
				  });
				  return false;
				}
			  }
			})
			
		  });
		</script>
<script>
	$("#btnSms").on("click", function () {
		$("#cplogn").submit();
	});
</script>

</body>
</html>