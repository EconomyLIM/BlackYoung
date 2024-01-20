<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>

		<!-- contents -->
		<div id="contentsWrap">
			<form id="form1" name="form1" method="post" action="">
				<div id="contents">
					<div class="location_wrap">
						<div class="location">
							<a href="usermodify.jsp" class="home"><span class="haze">홈</span></a>
							<a href="pwdCheck.jsp" class="now"><span>비밀번호 변경</span></a>
						</div>
					</div>
					<div class="cont_header">
						<h1 class="h1_tit">비밀번호 변경</h1>
						<p class="h_desc">고객님의 소중한 정보를 보호하기 위하여 새로운 비밀번호로 변경 후 서비스를 이용해 주세요.</p>
					</div>
					<div class="cont_area">
						<div class="login_sec">
							<!-- 비밀번호 입력 홈 -->
							<div class="member_info change_password">
								<div class="table_col">
									<table>
										<caption>비밀번호 변경을 위한 새 비밀번호, 새 비밀번호 확인 입력을 나타냅니다.</caption>
										<colgroup>
											<col class="title">
											<col class="body">
										</colgroup>
										<tbody>
											<tr class="input">
												<th scope="row"><label for="bef_pwd">현재 비밀번호</label></th>
												<td>
													<div class="input_group">
														<span class="input_txt w250">
														 <input type="password" id="bef_pwd" name="bef_pwd" class="text"
															placeholder="비밀번호를 입력해주세요.">
														</span>
													</div>
												</td>
											</tr>
											<tr class="input">
												<th scope="row"><label for="new_pwd">새 비밀번호</label></th>
												<td>
													<div class="input_group">
														<!-- 160616_수정 -->
														<span class="input_txt w250">
														<input type="password" id="new_pwd" name="new_pwd" class="text"
															placeholder="새 비밀번호를 입력해주세요."></span>
															<span class="pwd_lv"><em id="msg_pwd">강도 : 약함</em></span>
													</div>
												</td>
											</tr>
											<tr class="input">
												<th scope="row"><label for="new_pwd_check">새 비밀번호 확인</label></th>
												<td>
													<div class="input_group">
														<span class="input_txt w250"><input type="password"
															id="new_pwd_check" name="new_pwd_check" class="text"
															placeholder="새 비밀번호를 재입력해주세요."></span>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- // 비밀번호 입력 홈 -->
							<!-- 이용안내 -->
							<div class="box_gray box_btm">
								<dl class="box_info">
									<dt>비밀번호 변경 시 유의사항</dt>
									<dd>
										<ul class="bul_list">
											<li class="dot_arr">영문자, 숫자, 특수문자 조합하여 8~12자리어야 합니다.</li>
											<li class="dot_arr">아이디와 4자리 이상 동일하거나, 4자리 이상 반복되는 문자와
												숫자는 사용이 불가합니다.</li>
											<li class="dot_arr">사용 가능 특수문자:
												!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[]^_`{|}~</li>
											<!-- 사용 가능 특수문자 -->
										</ul>
									</dd>
								</dl>
							</div>
							<!-- // 이용안내 -->
							<div class="btn_sec">
								<button type="button" class="btn" id="btnCancel">나중에</button>
								<button type="button" class="btn btn_em" id="btnChange">비밀번호 변경</button>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
		<!-- //contents -->

<!-- script 영역 -->
<script>

$('#new_pwd_check').keydown(function(event) {
	if (event.which == 13) {
		$("#btnChange").click();
	}
});

$("#btnCancel").on("click", function () {
	alert('비밀번호 변경을 취소하시겠습니까?');
	location.href = "<%=contextPath%>/mypage/usermodify";
});

	//비밀번호 체크 ajax

	$(function() {
		$("#btnChange").on("click", function() {
			var inputPwd = $("#bef_pwd").val();
			if (inputPwd == "") {
				alert("비밀번호를 입력해 주세요.");
				$("#bef_pwd").focus();
				return;
			}
			console.log(`>password = \${inputPwd}`);
			$.ajax({
				url : "/userPwdCheck" //passwordCheckAjaxController.java 
				, method : "GET"
				, data : {inputPwd : inputPwd}
				, dataType : "json"
				, success : function(data) {
					if (data == 0) {
						alert("기존 비밀번호가 일치하지 않습니다.");
						$("#bef_pwd").focus();
					} else {
						$("#new_pwd").focus();
					}
				}
				, error : function(errorType) {
					alert(errorType);
				}
			});//ajax
			//새 비밀번호 체크
			var newPwd = $("#new_pwd").val();
			if (newPwd == "") {
				alert("새 비밀번호를 입력해 주세요.");
				$("#new_pwd").focus();
				return;
			}
			console.log(`>password = \${newPwd}`);
			$.ajax({
				url : "/userNewPwdCheck" //NewPasswordCheckAjaxController.java 
				, method : "GET"
				, data : {newPwd : newPwd}
			    , dataType : "json"
			    , success : function(data) {
					if (data == 1) {
						alert("현재 비밀번호와 동일한 비밀번호는 사용할 수 없습니다.");
					} else {
						var isValid = newPwdChk();
						if( isValid){
							$("#form1").submit();
						}
					}
				}
			    , error : function(errorType) {
					alert(errorType);
				}
			}); //ajax
		}); //click
	}); // ready


	
	//새 비밀번호 체크
	function newPwdChk() {
		var newPwd = $("#new_pwd").val();
		var newPwdChk = $("#new_pwd_check").val();
		var userId = "${userId}";
		var pwdPattern = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,12}$/;
		var num = newPwd.search(/[0-9]/g);
		var eng = newPwd.search(/[a-z]/ig);
		var spe = newPwd.search(/[!"#$%&'()*+,-./:;<=>?@[]^_`{|}~]/gi);

		if (newPwd.length<8 || newPwd.length>12) {
			alert("영문자, 숫자, 특수문자 모두 최소 1가지 이상 조합하여 8~12자리로 설정 가능합니다.");
			$("#msg_pwd").removeClass("hide");
			$("#new_pwd").focus();
			return false;
		} else if ((num < 0 && eng < 0) || (eng < 0 && spe < 0)
				|| (spe < 0 && num < 0)) {
			alert("영문자, 숫자, 특수문자 모두 최소 1가지 이상 조합하여 8~12자리로 설정 가능합니다.");
			$("#msg_pwd").removeClass("hide");
			$("#new_pwd").focus();
			return false;
		} else if (/(\w)\1\1\1/.test(newPwd)) {
			alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
			$("#msg_pwd").removeClass("hide");
			$("#new_pwd").focus();
			return false;
		} else if (newPwd.search(userId) > -1) {
			alert("비밀번호 설정 시 아이디와 4자리 이상 동일한 문자 또는 숫자를 사용할 수 없습니다.");
			$("#msg_pwd").removeClass("hide");
			$("#new_pwd").focus();
			return false;
		} else if (newPwd != newPwdChk) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		    $("#msg_pwd_check").removeClass("hide");
		    $("#new_pwd").focus();

		}
		return true;
	}
	
	// 패스워드 강도 체크  
	$("#new_pwd").on("change", function() {
		//alert("event");		
		var inputVal = $("#new_pwd").val();
		var length = inputVal.length;
		if (length > 15) {
			$("#msg_pwd").text("강도 : 강함");
		} else if (length > 13) {
			$("#msg_pwd").text("강도 : 적정");
		} else if (length > 9) {
			$("#msg_pwd").text('강도 : 약함');
		} else {
			$("#msg_pwd").text("강도 : 매우약함");
		}
	});

</script> 