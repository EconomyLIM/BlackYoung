<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/include.jspf"%>

<!--컨텐츠-->
<form method="POST" action="/usermodify/info_modification" id="parentForm">
<div id="contentsWrap">

	<div id="contents">
		<div class="location_wrap">
			<div class="location">
				<a href="/" class="home"><span class="haze">홈</span></a> <a
					href="/usermodify/pwdCheck" class="now"><span>회원정보 수정</span></a>
			</div>
		</div>
		<div class="cont_header">
			<h1 class="h1_tit">회원정보 변경</h1>
		</div>
		<div class="cont_area">

			<div class="mypage_sec">
				<!-- 본인인증 -->
				<div class="certi_box">
					<h2 class="haze">본인인증</h2>
					<div class="regi_complete certification_sec">
						<p class="certi_txt">회원정보에 등록된 이름을 변경하기 위해 본인확인 방법을 선택해주세요.</p>
						<ul class="way" data-control="hover">
							<li class="type1"><span class="bg"
								style="display: block; position: absolute; width: 88px; height: 88px; margin-left: -44px; background: url('/resources/images/cjone/ico_regi_complete.png') no-repeat left top; top: 0; left: 50%;"></span>
								<a href="javascript:;" class="btn btn_em" id="verifyPh" onclick="verifyPh();" title="새 창" target=""> <span>휴대전화 인증</span></a></li>

							<li class="type2" style="border-right: 0px;"><span	class="bg"
								style="display: block; position: absolute; width: 88px; height: 88px; margin-left: -44px; background: url('/resources/images/cjone/ico_regi_complete.png') no-repeat left top; top: 0; left: 50%;"></span><a
								href="javascript:;"
								onclick="javascript:fnCheckPlusPPopup(event);"
								class="btn btn_em" title="새 창">공인인증서 인증</a></li>


						</ul>
					</div>
				</div>
				<!-- 인증 실패 안내 -->
				<div class="certi_fail">
					<h2 class="haze">인증 실패 안내</h2>
					<div class="fail">
						<dl>
							<dt>본인인증에 실패하셨나요?</dt>
							<dd>
								회원님의 정보가 해당 인증기관에 등록되어 있지 않거나<br> 기타 다른 이유로 실패한 경우일 수 있습니다.
							</dd>
						</dl>
						<div class="btn_sec"></div>
					</div>
					<div class="error">
						<dl>
							<dt>인증 오류가 해결되지 않을 경우 엔?</dt>
							<dd>
								<ul class="bul_list">
									<li><span class="dot_arr">나이스평가정보 1600-1522</span></li>
									<li><span class="dot_arr">KMC 한국모바일인증 02-2033-8500</span></li>
									<li><span class="dot_arr">CJ ONE 고객센터 1577-8888</span></li>
								</ul>
							</dd>
						</dl>
					</div>
				</div>

				<!-- 이용 안내 -->
				<div class="box_gray box_btm">
					<dl class="box_info">
						<dt>이용안내</dt>
						<dd>
							<ul class="bul_list">
								<li class="dot_arr">신용평가기관에 개명된 이름이 먼저 등록되어 있어야 합니다.</li>
								<li class="dot_arr">개명된 이름으로 가입된 본인명의의 휴대전화 또는 공인인증서,
									체크/신용카드 인증으로 본인확인 가능합니다.</li>
								<li class="dot_arr">본인인증을 위해 입력하신 정보는 CJ ONE에 별도 저장되지 않고,
									해당 인증기관에서 직접 수집하며 인증 이외의 용도로 이용 또는 저장하지 않습니다.</li>
							</ul>
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//contents-->
<%-- 	<input type="hidden" name="newName" value="${newName }"/>
	<input type="hidden" name="newTel" value="${newTel }"/> --%>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>

<script type="text/javascript">
	$(function() {
		$('[data-control="hover"]').hover();
	});

	$('.type3').hide();
	$('.type2').attr('style', 'border-right:0px;');
</script>
  <script>
	function verifyPh(){
		document.domain="localhost";
		window.open("/usermodify/modify_phfirst", "_blank","width=496,height=823");
	}

    </script>
<!--//script 영역-->
