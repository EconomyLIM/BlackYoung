<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/inc/include.jspf" %>

<body>
<div>
<script>
$(document).ready(function() {
	var error = "${param.error}"
	if (error == "true") {
		alert("아이디 또는 패스워드가 일치하지 않습니다.");
	};
	
});
</script>
<div id="Container" class="bgf6">
	<div id="Contents">
		
		
			
			<div class="loginArea new login">
				
					
				
					
					
						<div class="loginTit">
							<h2>로그인</h2>
							<p>올리브영의 다양한 서비스와 혜택을 누리세요.</p>
						</div>
				<%-- <c:if test=" ${ param.error eq true }">
						<strong style="color:red"> 아이디 또는 패스워드가 일치하지 않습니다.</strong><br>
				</c:if>	 --%>		
				<form id="formLogin" name="formLogin" action="/login" method="post">
					<input type="hidden" id="bSId" name="bSId" value="">
					<input type="hidden" id="captchaYn" name="captchaYn" value="N">
					
					<div class="loginForm">
						<ul>
							<li>
								<label for="loginId" class="ir">아이디를 입력해 주세요.</label>
								<input type="text" id="userId" placeholder="CJ ONE 통합회원 아이디 입력" name="username" width="100" value="" autocomplete="off" title="아이디를 입력해 주세요.">
							</li>
							<li>
								<label for="password" class="ir">비밀번호를 입력해 주세요.</label>
								<input type="password" value="" id="userPassword" placeholder="비밀번호 (8-12자 영문자+숫자+특수문자)" name="password" width="100" onkeyup="" autocomplete="off" title="비밀번호를 입력해 주세요.">
							</li>
						</ul>
						<div class="loginError" style="display:none;">
							<p>정보보호를 위해 아이디, 비밀번호와 함께 자동입력 방지문자를 입력하셔야 합니다.</p>
							<div class="errorBox">

								<div id="audiocatpch" style="display:none;"></div>
								<span class="imgArea" id="captcha">
							</span>
								<button type="button" id="reLoad" class="btnRefresh">새로고침</button>
								<button type="button" id="soundOnHna" class="btnSound">음성듣기</button>
							</div>
							<div class="placeholder_area middle"><label for="autoBlockText">자동 입력 방지 문자</label><input type="text" id="autoBlockText" name="answer" autocomplete="off" value="" title="자동 입력 방지 문자를 입력해 주세요." class="inp_placeholder inp_mid" data-placeholder="자동 입력 방지 문자"></div>
						</div>
						<div class="linkChk">
							<div class="save">
								<input type="checkbox" id="chk01" name="saveLoginIdYn" title="아이디 저장 선택" value="Y" checked="checked"><label for="chk01">아이디 저장</label>
								<input type="hidden" name="loginFormYn" value="Y">
							</div>
							<div class="link">
								<a href="#" onclick="">아이디 찾기</a>
								<a href="#" onclick="">비밀번호 찾기</a>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="btnArea">
							<button type="submit" class="btnGreen" data-attr="로그인^로그인^로그인">로그인</button>
						</div>
						
							<div class="fast_login clrfix">
								<p class="txt">카카오로 올리브영 간편하게 시작하기</p>
								<div class="area">
									<a href="#" class="btnlogin kakao" data-attr="로그인^카카오로그인^카카오 로그인"><span class="icon">카카오로 시작하기</span></a>
								</div>
							</div>
						
						<div class="info renew-info">
							<div class="info-box">
								<div class="logo-box">
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image/login/ico_cjone_230828.png" alt="CJ ONE 로고 이미지">
								</div>
								<p>CJ ONE 통합회원으로 가입하시면 올리브영의<br>다양한 서비스를 이용하실 수 있습니다.</p>
							</div>
							
							
								
								
									<a href="../join/joinCheck" class="btnCjone" id="memberJoin" data-attr="로그인^회원가입^cjone통합회원가입">CJ ONE 통합 가입</a>
								
							
						</div>
					</div>
					
					
				</form>
			</div>
		</div>
	</div>
</div>


<c:if test="${not empty errorMessage}">
        <script>
            alert("${errorMessage}"); // Display the error message in an alert
        </script>
    </c:if>
</body>
</html>