<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!--contents-->
	<div id="contentsWrap">
		<div id="contents">
			<!--title-->
			<div class="location_wrap">
				<div class="location">
					<a href="/auth/login" class="home"><span class="haze">홈</span></a>
					<a href="/join/joinCheck" class="now"><span>회원가입</span></a>
				</div>
			</div>

				<div class="cont_header">
					<h1 class="h1_tit">회원가입</h1>
					<p class="h_desc">라이프스타일 멤버십 CJ ONE! 외식, 쇼핑, 엔터테인먼트 서비스를 한 장의 카드로 즐기세요~</p>
				</div>
				
				<!--title-->
				<div class="cont_area">
					<div class="member_join uni">
						<!--step-->
						<div id="layer1"
							style="position: absolute; margin-left: -212px; top: 5%; left: 50%; width: 0px; height: 0px; display: none; z-index: -1">
							<font face="verdana, arial, helvetica, sans-serif" size="2">
								<div style="float: left; background-color: white; padding: 3px; border: 1px solid black;">
									<span style="float: right; padding-right: 0px; margin-right: 0px; background-color: gray; color: white; font-weight: bold; width ='20px'; text-align: center; cursor: pointer"
										onclick="javascript:hideIt()">&nbsp;X&nbsp;</span>
									<iframe id="jumin_frame" style="width: 0px; height: 0px;"
										frameborder="no"></iframe>
								</div>
							</font>
						</div>
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
						<form method="get" name="vnoform" id="vnoform">
							
							<div class="box_member">
								<h2 class="haze">본인인증</h2>

								<div class="certification_sec">
									<p class="certi_txt">안전한 회원가입을 위한 본인인증 단계입니다. 원하시는 인증방법을 선택해주세요.</p>
									<ul class="way">
										<li class="type1"><span class="bg" style ="display:block; position:absolute; width:88px; height:88px; margin-left:-44px; background:url('/resources/images/cjone/ico_regi_complete.png') no-repeat left top; top:0; left:50%;"></span>
										<a href="#" class="btn btn_em" id="verifyPh" onclick="verifyPh();" title="새 창"><span>휴대전화 인증</span></a></li>

										<li class="type2" style="border-right: 0px;">
										<span class="bg" style ="display:block; position:absolute; width:88px; height:88px; margin-left:-44px; background:url('/resources/images/cjone/ico_regi_complete.png') no-repeat left top; top:0; left:50%;"></span>
										<a href="#" class="btn btn_em" title="새 창">공동인증서	인증</a></li>
									</ul>
								</div>
							</div>
							<div class="certi_fail">
								<h3 class="haze">인증 실패 안내</h3>
								<div class="fail">
									<dl>
										<dt>본인인증에 실패하셨나요?</dt>
										<dd>
											회원님의 정보가 해당 인증기관에 등록되어 있지 않거나<br> 기타 다른 이유로 실패한 경우일 수
											있습니다.
										</dd>
									</dl>
									<div class="btn_sec">

										<a href="javascript:;"
											onclick="javascript:fnCheckKcbMobilePopup(event);"
											class="btn btn_sm" title="새 창"><span class="arr">휴대전화 인증</span></a>

									</div>
								</div>
								<div class="error">
									<dl>
										<dt>인증 오류가 해결되지 않을 경우엔?</dt>
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
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</div>

					<!-- //이용안내 -->
					<div class="box_gray box_btm">
						<dl class="box_info">
							<dt>이용안내</dt>
							<dd>
								<ul class="bul_list">
									<li class="dot_arr">본인인증 시 제공되는 정보는 <em class="em">해당
											인증기관에서 직접 수집하며,</em> 인증 이외의 용도로 이용 또는 저장하지 않습니다.
									</li>
									<li class="dot_arr">기존의 제휴 브랜드 웹사이트에 1개 이상 가입되어 있으신 회원님은
										새로운 CJ ONE 통합 아이디를 생성하신 후 CJ ONE 멤버십으로 가입하실 수 있습니다.<br>(기존에
										각 브랜드 사이트에서 사용하던 ID와 비밀번호 동일하게 변경됨)
									</li>
								</ul>
							</dd>
						</dl>
					</div>

				</div>
			</div>

			<script type="text/javascript">

        var y1 = 20;   // change the # on the left to adjuct the Y co-ordinate
        (document.getElementById) ? dom = true : dom = false;

        function hideIt() {
			$('#layer1').css('display','none');
			$('#layer1').css('z-index','-1');
			$('#layer1').css('width','0px');
			$('#layer1').css('height','0px');
			$('#jumin_frame').css('width','0px');
			$('#jumin_frame').css('height','0px');
			$('#jumin_frame').attr('src','');
			$('#jumin_frame').css('display','none');
        }

        function showIt(src,width,height) {
			$('#layer1').css('display','');
            $('#layer1').css('z-index','100000');
            $('#layer1').css('width',width);
            $('#layer1').css('height',height);
			$('#jumin_frame').css('width',width);
			$('#jumin_frame').css('height',height);
			$('#jumin_frame').attr('src',src);
			$('#jumin_frame').css('display','');
        }

        function placeIt() {
          if (dom && !document.all) {document.getElementById("layer1").style.top = window.pageYOffset + (window.innerHeight - (window.innerHeight-y1)) + "px";}
          if (document.all) {document.all["layer1"].style.top = document.documentElement.scrollTop + (document.documentElement.clientHeight - (document.documentElement.clientHeight-y1)) + "px";}
          window.setTimeout("placeIt()", 10); }

    </script>
		</div>
		<!--//contents-->

	<script>
        $(function () {
            $('[data-control="hover"]').hover();
        });
    </script>
    <script>
    function verifyPh(){
    	  window.open("http://localhost/join/verify_phfirst", "_blank","width=496,height=823");
    	}
    $("#verifyPh").on("click", function (event){
    	event.preventDefault();
    	verify();
    });
    </script>
	</form>