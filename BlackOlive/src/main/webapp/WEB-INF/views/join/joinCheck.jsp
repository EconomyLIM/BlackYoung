<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>
	<!--contents-->
	<div id="contentsWrap">
		<div id="contents">
			<form method="post" id="form1" name="form1" action="">
				<div class="cont_header">
					<h1 class="h1_tit">올리브영+CJ ONE 통합회원 가입</h1>
					<p class="h_desc">통합 아이디로 CJ ONE 브랜드 혜택도 받고! 포인트도 쌓고!</p>
				</div>
				
				<!-- inner -->
				<div class="check_member">
					<div class="box_member">
						<h2 class="haze">가입 여부 확인</h2>
						<!--가입여부확인-->
						<div class="check_member_box">
							<dl class="check_member_txt">
								<dt>회원가입 여부 안내</dt>
								<dd>
									<ul class="bul_list">
										<li class="dot_arr">기존 회원가입 정보와 일치하는 정보를 입력하셔야 회원가입 여부를 정확하게 확인하실 수 있습니다. <em class="em">입력하신 정보는 회원가입 여부에만 사용되며 저장되지 않습니다.</em></li>
										<li class="dot_arr">올리브영, CJ더마켓, CJ온스타일, COOKIT, CJ문화재단, ONEiVERSE 에서는 전자상거래에 의거하여 만 14세 미만의 어린이/학생의 회원가입을 제한합니다.</li>
									</ul>
								</dd>
							</dl>
							
							<div class="check_member_form">
								<span class="input_txt w450"><input type="text" class="text" id="user_nm" name="userName" placeholder="이름을 입력해주세요." title="이름을 입력해주세요." data-format="engkor" autocomplete="off"></span>
								<p class="msg_info hide" id="msg_user_nm">이름을 입력하세요.</p>
								<span class="input_txt w450"><input type="text" class="text" id="legl_birth_dy" name="userBirth" placeholder="법정생년월일 8자리를 입력해주세요." title="법정생년월일 8자리를 입력해주세요." data-format="num" maxlength="8" autocomplete="off"></span>
								<p class="msg_info hide" id="msg_legl_birth_dy">법정생년월일을 정확히 입력해 주세요.</p>
								<span class="input_txt w450"><input type="text" class="text" id="mob_no" name="userTel" placeholder="휴대전화번호 뒤 7~8자리를 입력해주세요. (01X 제외)" title="휴대전화번호 뒤 7~8자리를 입력해주세요. (01X 제외)" data-format="num" maxlength="8" autocomplete="off"></span>
								<p class="msg_info hide" id="msg_mob_no">국번제외한 휴대폰번호를 입력해주세요. (ex.010-123-5678 &gt; 1235678)</p>
								<div class="btn_sec">
									<a href="#" class="btn btn_em" id="btnCheRegister">가입여부 확인</a>
								</div> 
							</div>
						</div>
						<!--//가입여부확인-->
					</div>
					<div class="box_gray box_btm">
						<dl class="box_info">
							<dt>이용안내</dt>
							<dd>
								<ul class="bul_list">
									<li class="dot_arr">회원이 되시면 <em class="em">하나의 통합된 회원 ID와 비밀번호로 CJ ONE 및 각 브랜드 웹 사이트의 다양한 서비스(포인트 조회, 카드등록, 정보변경 서비스 등)를 이용하실 수 있습니다.</em></li>
									<li class="dot_arr">CJ ONE에 가입하더라도 <em class="em">약관 동의되지 않은 CJ ONE 제휴 브랜드에는 개인정보가 제공되지 않습니다.</em></li>
									<li class="dot_arr">CJ ONE은 CJ ONE 제휴 브랜드의 통합 멤버십 서비스입니다.</li>
									<li class="dot_arr">하나의 아이디(ID)로 CJ ONE 제휴 브랜드 사이트를 안전하고 편리하게 이용할 수 있습니다.</li>
									<li class="dot_arr">기존의 각 CJ ONE 제휴 브랜드 사이트에 1개 이상 가입되어 있는 회원님은 새로운 CJ ONE 통합 아이디(ID)를 생성하신 후 가입하실 수 있습니다.</li>
								</ul>
							</dd>
						</dl>
					</div>
	
					<!-- //이용안내 -->
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<!-- //inner -->
			</form>
		</div>
	</div>
	<!--//contents-->

<script>
$("#btnCheRegister").on("click", function (event) {
	event.preventDefault();
	if(inputCheck() ){
	$("#form1").submit();
	}
});	 

function inputCheck() {
	var isValid = true;	
	if($("#user_nm").val() == "") {
		$("#msg_user_nm").removeClass("hide");
		$("#msg_user_nm").addClass("show");
		$("#user_nm").focus();
		 isValid = false;
	}else if($("#legl_birth_dy").val() == "" ) {
		$("#msg_legl_birth_dy").removeClass("hide");
		$("#msg_legl_birth_dy").addClass("show");
		$("#legl_birth_dy").focus();
		 isValid = false;
		 
	}else if($("#legl_birth_dy").val().length<8 ) {
		$("#msg_legl_birth_dy").removeClass("hide");
		$("#msg_legl_birth_dy").addClass("show");
		$("#legl_birth_dy").focus();
		isValid = false;
	}else  if($("#mob_no").val() == "" ) {
		$("#msg_mob_no").removeClass("hide");
		$("#msg_mob_no").addClass("show");
		$("#mob_no").focus();
		isValid = false;
	}else if($("#mob_no").val().length<7) {
		$("#msg_mob_no").removeClass("hide");
		$("#msg_mob_no").addClass("show");
		$("#mob_no").focus();
		 isValid = false;
	}
	if(isValid){
	$("#msg_user_nm").addClass("hide");
	$("#msg_legl_birth_dy").addClass("hide");
	$("#msg_mob_no").addClass("hide");
	}
	return isValid;
}

$(function () {
    $('#mob_no').keydown(function(event) {
    	if ( event.which == 13 ){
    		$("#btnCheRegister").click();	
    	}
    });	
}); 
</script>
