<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>
	<div id="contentsWrap">
			<form id="form1" method="post" action="">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<input type="hidden" name="tmpField">
			<div id="contents">
				<div class="location_wrap">
					<div class="location">
						<a href="#" class="home"><span class="haze">홈</span></a>
						<a href="/" class="now"><span>회원정보 수정</span></a>
					</div>
				</div>
				<div class="cont_header">
					<h1 class="h1_tit">회원정보 수정</h1>
					<p class="h_desc">회원님의 소중한 정보를 안전하게 관리하세요.</p>
				</div>
				<div class="cont_area">
				
					<div class="mypage_sec modify">
						<div class="regi_complete">
							<span class="bg bg face_type2" style="display:block;  margin:0 auto 35px; background:url('/resources/images/cjone/ico_regi_complete.png') no-repeat -300px 0; width:89px; height:89px;background-position:-100px -200px;"></span>
							<p class="h2_tit">회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</p>
							<p class="h_desc">회원님의 개인정보 보호를 위한 본인 확인 절차이오니, CJ ONE 회원 로그인
								시 사용하시는 비밀번호를 입력해주세요.</p>
							<div class="pwd_box">
								<span class="input_txt w330">
									<input type="password" id="pwd" name="password" class="text" placeholder="비밀번호를 입력해주세요." 
									title="비밀번호" maxlength="20">
								</span>
							</div>
							<div class="btn_center">
								<button type="button" id="btnCancel" class="btn">취소</button>
								<button type="button" id ="btnPwdCheck" class="btn btn_em">확인</button>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
		<!--//contents-->
		
		
	<!--script 영역-->
	<script>
	 $(function () {
	     $('#pwd').keydown(function(event) {
	     	if ( event.which == 13 ){
	     		$("#btnPwdCheck").click();	
	     	}
	     });	
	});
		// 취소
	$("#btnCancel").on("click", function () {
		alert("회원정보 수정을 취소하시겠습니까?");
		location.href = '<%=contextPath%>/mypage/usermodify';
	});
	//비밀번호 체크
	$(function () {
		$("#btnPwdCheck").on("click", function () {
			var inputPwd = $("#pwd").val();
			if (inputPwd == "") {
		         alert("비밀번호를 입력해 주세요.");
		         $("#pwd").focus();
			}
			console.log(`>password = \${inputPwd}`);
			$.ajax({
				url:"/userPwdCheck"		//passwordCheckAjaxController.java 
				, method:"GET"
				, data: {inputPwd:inputPwd
					, "${_csrf.parameterName}" :"${_csrf.token}"}
				, dataType:"json"
				, success: function (data) {
					 if (data == 0 ){
				         alert("비밀번호가 일치하지 않습니다.");
				         $("#pwd").focus();
				     } else{
						$("#form1").submit();
				     }
				}
				, error: function (xhr, errorType) {
					alert(errorType);
				}
			});
		});
	});
    </script>