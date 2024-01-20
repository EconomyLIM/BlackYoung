<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/inc/include.jspf"%>

	<!-- footer -->
	<div id="footer">

<div class="footer_wrap">			
	
	<div class="util_menu">
	    <!--20191021 FOOTER 리스트 분리-->
		<ul>
            <li><a href="javascript:goFooterMenu(&quot;1&quot;)" onclick="ga('send', 'event', 'Footer 영역', '이용약관', '이용약관');" data-track="Footer^이용약관" class="">이용약관</a></li>
            <li><a href="javascript:goFooterMenu(&quot;&quot;)" onclick="ga('send', 'event', 'Footer 영역', '개인정보취급방침', '개인정보처리방침');" data-track="Footer^개인정보취급방침" class=""><em>개인정보처리방침</em></a></li>
            <li><a href="javascript:goFooterMenu(&quot;3&quot;)" onclick="ga('send', 'event', 'Footer 영역', 'ARS 본인인증', 'ARS 본인인증');" data-track="Footer^ARS 본인인증" class="">ARS 본인인증</a></li>
            <li><a href="javascript:goFooterMenu(&quot;4&quot;)" onclick="ga('send', 'event', 'Footer 영역', '법적고지', '법적고지');" data-track="Footer^법적고지" class="">법적고지</a></li>
        </ul>
        <ul>
            <li><a href="javascript:goFooterMenu(&quot;5&quot;)" onclick="ga('send', 'event', 'Footer 영역', '이메일무단수집거부', '이메일무단수집거부');" data-track="Footer^이메일무단수집거부">이메일무단수집거부</a></li>
            <li><a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1048136565" title="새창열림" target="_blank">사업자정보확인</a></li><!--20191021 CJ ONE APP 사업자 정보 사업자정보확인 영역 추가-->
            <!-- <li class="accessibility"><a href="http://www.webwatch.or.kr/Situation/WA_Situation.html?MenuCD=110" target="_blank"><img src="http://www.cjone.com/cjmweb/images/common/ico_webaccessibility.png" border="0" style="margin-right:5px" alt="과학기술정보통신부 WEB ACCESSIBILITY 마크(웹 접근성 품질인증 마크)" title="국가 공인 인증기관 : 웹와치"/>웹접근성 우수사이트 인증</a></li>-->
            <li class="isms-p"><a href="javascript:goFooterMenu(&quot;7&quot;)" onclick="ga('send', 'event', 'Footer 영역', 'ISMS-P', 'ISMS-P');" data-track="Footer^ISMS-P"><img src="https://www.cjone.com/cjmweb/images/common/ico_isms.png" border="0" alt="정보보호 및 개인정보보호 관리체계 인증마크"></a></li>
        </ul>
		<!--//20191021 FOOTER 리스트 분리-->
	</div>
	<div class="go_link">
            <a href="https://www.cjone.com/cjmweb/oneStory.do" onclick="ga('send', 'event', 'Footer 영역', 'CJ ONE 소개', 'CJ ONE 소개');" class="cjone_info" data-track="Footer^CJ ONE 소개"><span>CJ ONE 소개</span></a>
			<a href="https://www.cjone.com/cjmweb/about-cjone.do#app_guide" onclick="ga('send', 'event', 'Footer 영역', 'APP 소개', 'APP 소개');" class="app_info" data-track="Footer^APP 소개"><span>APP 소개</span></a>
			<a href="https://www.cjone.com/cjmweb/customer/brandInfo.do" onclick="ga('send', 'event', 'Footer 영역', '제휴 안내', '제휴 안내');" class="brand_info" data-track="Footer^제휴 안내"><span>제휴 안내</span></a>
			<a href="javascript:goFooterMenu(&quot;6&quot;)" onclick="ga('send', 'event', 'Footer 영역', '사이트맵', '사이트맵');" class="ars_certify" data-track="Footer^사이트맵"><span>사이트맵</span></a>
			<a href="http://www.cjolivenetworks.co.kr" target="_blank" onclick="ga('send', 'event', 'Footer 영역', '회사소개', '회사소개');" class="company_info" data-track="Footer^회사소개"><span>회사소개</span></a>
 			<div class="familySite"><a href="#familySite" data-control="toggleGnb" data-open-text="열기" data-close-text="닫기" title="열기" class="btn_open">CJ그룹 계열사 바로가기</a>
<ul id="familySite" class="site_list hide">
    <li>
    <p class="title">CJ그룹</p>
    <ul class="list_2depth">
        <li><a target="_blank" href="http://www.cj.net/" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ주식회사');" data-track="Footer^CJ그룹 계열사 바로가기|CJ주식회사">CJ주식회사</a></li>
    </ul>
    </li>
    <li>
    <p class="title">식품 &amp; 식품서비스</p>
    <ul class="list_2depth">
        <li><a target="_blank" href="https://www.cj.co.kr/kr/index" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ제일제당');" data-track="Footer^CJ그룹 계열사 바로가기|CJ제일제당">CJ제일제당</a></li>
        <li><a target="_blank" href="http://www.cjfreshway.com/" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ프레시웨이');" data-track="Footer^CJ그룹 계열사 바로가기|CJ프레시웨이">CJ프레시웨이</a></li>
        <li><a target="_blank" href="https://www.cjfoodville.co.kr/main.asp" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ푸드빌');" data-track="Footer^CJ그룹 계열사 바로가기|CJ푸드빌">CJ푸드빌</a></li>
        <li><a target="_blank" href="http://www.md1.co.kr/" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ엠디원');" data-track="Footer^CJ그룹 계열사 바로가기|CJ엠디원">CJ엠디원</a></li>
        <!--<li><a target="_blank" href="https://www.twosome.co.kr:7009/main.asp" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', '투썸플레이스');" data-track="Footer^CJ그룹 계열사 바로가기|투썸플레이스">투썸플레이스</a></li>-->            </ul>
        </li>
        <li>
        <p class="title">생명공학</p>
        <ul class="list_2depth">
            <li><a target="_blank" href="https://www.cj.co.kr/kr/index" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ제일제당 BIO사업부문');" data-track="Footer^CJ그룹 계열사 바로가기|CJ제일제당 BIO사업부문">CJ제일제당 BIO사업부문</a></li>
            <!--<li><a target="_blank" href="http://www.cjp.co.kr/" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ헬스케어');" data-track="Footer^CJ그룹 계열사 바로가기|CJ헬스케어">CJ헬스케어</a></li>-->            </ul>
            </li>
            <li>
            <p class="title">신유통</p>
            <ul class="list_2depth">
                <li><a target="_blank" href="https://www.cjoshopping.com:9002/index.asp" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ ENM 커머스부문');" data-track="Footer^CJ그룹 계열사 바로가기|CJ ENM 커머스부문">CJ ENM 커머스부문</a></li>
                <li><a target="_blank" href="http://www.cjlogistics.com" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ대한통운');" data-track="Footer^CJ그룹 계열사 바로가기|CJ대한통운">CJ대한통운</a></li>
                <li><a target="_blank" href="http://www.cjtelenix.com/" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ텔레닉스');" data-track="Footer^CJ그룹 계열사 바로가기|CJ텔레닉스">CJ텔레닉스</a></li>
                <li><a target="_blank" href="http://www.oliveyoung.co.kr/store/main/main.do" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ올리브영');" data-track="Footer^CJ그룹 계열사 바로가기|CJ올리브영">CJ올리브영</a></li>
                <!-- <li><a target="_blank" href="http://www.myctstudio.com" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', '㈜루비콘컴퍼니');" data-track="Footer^CJ그룹 계열사 바로가기|㈜루비콘컴퍼니">㈜루비콘컴퍼니</a></li> -->            </ul>
                </li>
                <li>
                <p class="title">엔터테인먼트 &amp; 미디어</p>
                <ul class="list_2depth">
                    <li><a target="_blank" href="http://www.cjenm.com/" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ ENM 엔터테인먼트부문');" data-track="Footer^CJ그룹 계열사 바로가기|CJ ENM 엔터테인먼트부문">CJ ENM 엔터테인먼트부문</a></li>
                    <li><a target="_blank" href="http://corp.cgv.co.kr/" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ CGV');" data-track="Footer^CJ그룹 계열사 바로가기|CJ CGV">CJ CGV</a></li>
                    <!--li><a target="_blank" href="http://www.cjhello.com/" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ헬로');" data-track="Footer^CJ그룹 계열사 바로가기|CJ헬로">CJ Hello</a></li-->
                    <li><a target="_blank" href="http://www.cjpowercast.com/" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ파워캐스트');" data-track="Footer^CJ그룹 계열사 바로가기|CJ파워캐스트">CJ파워캐스트</a></li>
                </ul>
                </li>
                <li>
                <p class="title">인프라</p>
                <ul class="list_2depth">
                    <li><a target="_blank" href="http://www.cjenc.co.kr/" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', CJ대한통운 건설부문');" data-track="Footer^CJ그룹 계열사 바로가기|CJ대한통운 건설부문">CJ대한통운 건설부문</a></li>
                    <li><a target="_blank" href="http://www.cjolivenetworks.co.kr/" onclick="ga('send', 'event', 'Footer 영역', 'CJ그룹 계열사 바로가기', 'CJ올리브네트웍스');" data-track="Footer^CJ그룹 계열사 바로가기|CJ올리브네트웍스">CJ올리브네트웍스</a></li>
                </ul>
                </li>
            </ul>
            </div> 
	</div>	
	  
	<div class="site_info">
		<span class="ceo_info">대표이사 유인상</span>
		<address>주소 04323 서울시 용산구 한강대로 366 트윈시티 10층</address><!--20191021 CJ ONE APP 사업자 정보 주소 변경-->
		<span class="customer_info">CJ ONE 고객센터 1577-8888</span>
		<span class="license_num">사업자 등록번호 104-81-36565</span>
	</div>
	<!--20191112 CJONE APP 사업자 정보 노출 추가-->
    <div class="site_info pd0">
        <span class="ceo_info">호스팅사업자 CJ올리브네트웍스</span>
        <span class="license_num">통신판매업신고번호 2017-서울용산-0451</span>
    </div>
    <!--//20191112 CJONE APP 사업자 정보 노출 추가-->
	<p class="copyright">
		<span class="img"><img src="https://www.cjone.com/cjmweb/images/common/logo_cjolivenetworks_footer.png" alt="CJ 올리브넥트웍스"></span>
		Copyright (c)2016 CJ OLIVENETWORKS. All Rights Reserved
	</p>
	
	<div class="fixedTop hide" data-control="goTop" style="bottom: 50px;"><a href="#headerWrap" title="페이지 처음으로 이동" class=""><span class="haze">TOP</span></a></div>
	
</div>
<!--// 20191021 CJ ONE APP 사업자 정보 노출 전체 영역 -->
<!-- 레이어 팝업(confirm) 내용 -->
<div id="div_confirm" style="display: none;">
	<div class="ui_modal" style="position: fixed; background-color: rgb(255, 255, 255); outline: none; background-clip: padding-box; top: 50%; left: 50%; margin-left: -200px; margin-top: -160px; width: 400px; z-index: 9101;" tabindex="0">

		<div id="layerWrap" class="custom">
		 	<h1 id="h_confirm_title">알림</h1>

			<div class="inner" tabindex="0">
				<p id="p_confirm_text"></p>
			</div>
			

			<div class="btn_center">
				<a href="javascript:closeLayerConfirm();" id="a_confirm_y" class="btn"><span id="span_confirm_y">확인</span></a>
				<button id="a_confirm_n" type="button" onclick="closeLayerConfirm();" class="btn cancel"><span id="span_confirm_n">취소</span></button>
			</div>

			<button id="btn_confirm_close" type="button" onclick="closeLayerConfirm();" class="close">닫기</button>
		</div>

	</div>
	<div class="ui_modal_overlay" style="position: fixed; top: 0px; left: 0px; right: 0px; bottom: 0px; z-index: 9100;"></div>
</div>
<!-- //레이어 팝업(confirm) 내용 -->
<!-- 레이어 팝업(alert) 내용 -->
<div id="div_alert" style="display: none;">
	<div class="ui_modal" style="position: fixed; background-color: rgb(255, 255, 255); outline: none; background-clip: padding-box; top: 50%; left: 50%; margin-left: -200px; margin-top: -160px; width: 400px; z-index: 9101;" tabindex="0">

		<div id="layerWrap" class="custom">

			<div class="inner" tabindex="0">
				<p id="p_alert_text"></p>
			</div>

			<div class="btn_center">
				<a href="javascript:closeLayerAlert();" id="a_alert" class="btn close"><span id="span_alert">확인</span></a>
			</div>
		</div>

	</div>
	<div class="ui_modal_overlay" style="position: fixed; top: 0px; left: 0px; right: 0px; bottom: 0px; z-index: 9100;"></div>
</div>
<!-- //레이어 팝업(alert) 내용 -->
    </div>
    <!-- //footer -->
</div>




