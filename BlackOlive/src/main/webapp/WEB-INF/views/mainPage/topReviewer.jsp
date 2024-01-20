<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="Wrapper">
<!-- 올영체험단 배너 -->

<script>
let dimm = $("<div>").addClass("dimm").css("z-index", "990px");



// 팝업창 열기
function openPopup(popUpId) {
	$('#'+popUpId).show();
	popupCenter($('#'+popUpId))
	$('body').append(dimm);
}

function imgLoads(obj){
	var _thisImg = $(obj);	
	_thisImg.siblings('div.thum').find('img.gdasThum_s').attr('src',common.resizeImg(obj, 385));

}

$(function() {
	//툴팁
	$('a.btnTool').on('mouseover', function(){
		var _thisPos = $(this).position();
		$(this).next('.boxTooltip').css({
			top:(_thisPos.top)+26,
			left:(_thisPos.left)
		}).show();
	}).on('mouseout', function(){
		$(this).next('.boxTooltip').hide();
	});
})
</script>
	<div id="Container">
		<div class="title-reviewer">
			<h1>탑리뷰어<span>올리브영 리뷰어들의 생생한 리얼 후기!</span></h1>
		</div>

		<div class="reviewer-area">
			<div class="cont_box">
				<h3 class="tit_hn type01">탑리뷰어 <a href="javascript:;" onclick="javascript:openPopup('layer_pop_wrap');" class="iconq"><img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_info2.png" alt=""></a></h3>
				<div class="reviewer_list" id="topReviewerList">			
					<li>
						<span class="rate_num">01</span>
						<div class="user clrfix">
							<a href="javascript:;" onclick="mypage.reviewerLounge.goReviewAll('SCs2R1dmKytHRmwzRjQ5RzJEc1FoQT09', { t_page: '탑리뷰어', t_click: '탑리뷰어_리뷰어프로필', t_profile_name: '곱창맛있어용' });">
								<img src="https://image.oliveyoung.co.kr/uploads/images/mbrProfile/2023/07/03/1688369717371.png" style="display: none;" onload="common.onLoadProfileImg(this, 110);">
								<div class="thum">
									<span class="bg"></span>
									<img src="https://image.oliveyoung.co.kr/uploads/images/mbrProfile/2023/07/03/1688369717371.png?RS=110x146&amp;CS=110x110" class="profileThum_s" style="background:url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/my_picture_base.jpg) no-repeat 0 0;background-size:110px">		
								</div>
								<div class="info_user">
									<p class="updw ">&nbsp;</p>
									<p class="id">곱창맛있어용</p>
									<p class="view">
										<span class="w">120건</span>
										<span class="k">2897회</span>
									</p>
								</div>
							</a>
						</div>
						<div class="txt" onclick="mypage.reviewerLounge.goReviewDetail('24579947', {t_page: '탑리뷰어', t_click: '탑리뷰어_최근작성한리뷰보러가기'})">
							<a href="javascript:;">
								<p class="txt01">최근 작성한 리뷰</p>
								<dl class="txt02">
									<dd>
										푸룬좋아해서 푸룬주스랑 같이 맛있게 마시고있습니다!
										지인분들보니 효과는 케바케 인거같아요!
										도움되셨다면 [도움되요] 눌러주세요 감사합니다💖
									</dd>
								</dl>
							</a>							
						</div>
					</li>
					
						<li>

							<span class="rate_num">02</span>
							<div class="user clrfix">
								<a href="javascript:;" onclick="mypage.reviewerLounge.goReviewAll('WVJuQTlqdjE1NGRTMWJtQU1UVk9uZz09', { t_page: '탑리뷰어', t_click: '탑리뷰어_리뷰어프로필', t_profile_name: '올리브지킴이' });">
									
										<img src="https://image.oliveyoung.co.kr/uploads/images/mbrProfile/2023/07/26/1690374170446.png" onerror="common.errorProfileImg(this);" style="display: none;" onload="common.onLoadProfileImg(this, 110);">
									
									<div class="thum">
										<span class="bg"></span>
										
											
												<img src="https://image.oliveyoung.co.kr/uploads/images/mbrProfile/2023/07/26/1690374170446.png?RS=110x146&amp;CS=110x110" class="profileThum_s" style="background:url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/my_picture_base.jpg) no-repeat 0 0;background-size:110px">
											
											
										
									</div>
									<div class="info_user">

										
										<p class="updw up">2</p>
										<p class="id">올리브지킴이</p>
										<p class="view">
											<span class="w">176건</span>
											<span class="k">2775회</span>
										</p>
									</div>
								</a>
							</div>
							<div class="txt" onclick="mypage.reviewerLounge.goReviewDetail('24538579', {t_page: '탑리뷰어', t_click: '탑리뷰어_최근작성한리뷰보러가기'})">
								<a href="javascript:;">
									<p class="txt01">최근 작성한 리뷰</p>
									<dl class="txt02">
										
											
										
											<dd>이거 낸사람 상줘야됩니다 얼박 최고구여 포카리랑 타먹으면 더맛있지롱</dd>
										
									</dl>
								</a>							
							</div>
						</li>
					
						<li>
							<span class="rate_num">09</span>
							<div class="user clrfix">
								<a href="javascript:;" onclick="mypage.reviewerLounge.goReviewAll('bEdsSkJhQnR4azFleHZDMEtaWVlJQT09', { t_page: '탑리뷰어', t_click: '탑리뷰어_리뷰어프로필', t_profile_name: '리뷰대마왕' });">
									
										<img src="https://image.oliveyoung.co.kr/uploads/images/mbrProfile/2023/01/09/1673269608958.png" onerror="common.errorProfileImg(this);" style="display: none;" onload="common.onLoadProfileImg(this, 110);">
									
									<div class="thum">
										<span class="bg"></span>
										
											
												<img src="https://image.oliveyoung.co.kr/uploads/images/mbrProfile/2023/01/09/1673269608958.png?RS=127x110&amp;CS=110x110" class="profileThum_s" style="background:url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/my_picture_base.jpg) no-repeat 0 0;background-size:110px">

									</div>
									<div class="info_user">
										
										<p class="updw dw">3</p>
										<p class="id">리뷰대마왕</p>
										<p class="view">
											<span class="w">53건</span>
											<span class="k">1725회</span>
										</p>
									</div>
								</a>
							</div>
							<div class="txt" onclick="mypage.reviewerLounge.goReviewDetail('24477139', {t_page: '탑리뷰어', t_click: '탑리뷰어_최근작성한리뷰보러가기'})">
								<a href="javascript:;">
									<p class="txt01">최근 작성한 리뷰</p>
									<dl class="txt02">
										
											
										
											<dd>스템3 크림이 있어서 세럼과 같이 쓰려고 신청했어요
건조한 날씨에 잘 맞는 보습감인 것 같아요
아이오페 세럼은 워낙 좋아서 믿고 씁니다</dd>
										
									</dl>
								</a>							
							</div>
						</li>
				</div>


<!-- pageing start -->
	<div class="pageing">
		<strong title="현재 페이지">1</strong>
		<a href="javascript:void(0);" data-page-no="2">2</a>
		<a href="javascript:void(0);" data-page-no="3">3</a>
		<a href="javascript:void(0);" data-page-no="4">4</a>
		<a href="javascript:void(0);" data-page-no="5">5</a>
		<a href="javascript:void(0);" data-page-no="6">6</a>
		<a href="javascript:void(0);" data-page-no="7">7</a>
		<a href="javascript:void(0);" data-page-no="8">8</a>
		<a href="javascript:void(0);" data-page-no="9">9</a>
		<a href="javascript:void(0);" data-page-no="10">10</a>
		<a class="next" href="javascript:void(0);" data-page-no="11">다음 10 페이지</a>
	</div>

<!-- //pageing end -->	
			<div class="banner_reviewer">
				<a href="javascript:;" onclick="openPopup('lay_experience_info');">
					<img src="https://image.oliveyoung.co.kr/uploads/images/display/900000100050003/131/7765849726836347803.jpg" alt="올영체험단 PC 배너">
				</a>					
			</div>
			<!-- ## 리뷰고도화 2차 ## 오늘의 도움리뷰 제거 -->
		</div>
	</div><!--//reviewer-area-->
</div>
	<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	<div id="directTop" style="display: none;">
		<button><span></span>TOP</button>
	</div>
	<!--/ㅁ 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
</div>

	<div class="layer_pop_wrap reviewer-introdce-popup" id="layer_pop_wrap" style="z-index: 999; display: none;">
		<div class="layer_cont2">
			<!-- 탑리뷰어 소개 팝업 -->
			<div class="reviewer-introdce-popup-inner">
				<div class="reviewer-introdce-popup-header">
					<strong class="header-title">탑리뷰어 소개</strong>
				</div>
				<div class="inner-scroll-area">
					<div class="reviewer-introdce-popup-content">
						<div class="reviewer-introdce-content img-content">
							<strong class="content-top-title">리뷰 활동을 활발히 한 <span class="sffont-area">TOP 1~2000</span>위 리뷰어!</strong>
							<div class="content-img-box">
								<img src="https://www.oliveyoung.co.kr/pc-static-root/image/mypage/img_reviwer_top.png" alt="리뷰 활동을 활발히 한 리뷰어 이미지">
							</div>
						</div>
						<div class="reviewer-introdce-content">
							<strong class="content-title">선정기준</strong>
							<p class="content-text"><em>최근 <span class="sffont-area">2</span>개월간</em> 활동내역에 따라 점수 산정</p>
							<div class="table-box">
								<table class="reviewer-introdce-table">
									<caption>
										<span class="blind">선정기준 테이블</span>
									</caption>
									<colgroup>
										<col style="width: 366px;">
										<col style="">
									</colgroup>
									<thead>
										<tr>
											<th>활동 항목</th>
											<th>개당 점수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>리뷰 도움이 돼요 <span class="sffont-area">or</span> 컬렉션 좋아요 받기</td>
											<td><span class="sffont-area">50</span></td>
										</tr>
										<tr>
											<td>한달이상사용 리뷰 작성</td>
											<td><span class="sffont-area">30</span></td>
										</tr>
										<tr>
											<td>리뷰 하나당 포토 <span class="sffont-area">3</span>장 이상 등록</td>
											<td><span class="sffont-area">10</span></td>
										</tr>
									</tbody>
								</table>
								<p class="notice-text">리뷰 <span class="sffont-area">1</span>개 당 여러 항목을 충족할 경우, 점수 중복 집계</p>
							</div>
						</div>
						<div class="reviewer-introdce-content">
							<strong class="content-title">필수조건</strong>
							<ul class="condition-list">
								<li class="list-item">프로필 공개</li>
								<li class="list-item">자기소개문구, 닉네임, 사진, 피부타입 모두 등록<span>(단, 누적 블라인드 리뷰 <span class="sffont-area">10</span>개 이상 보유 시 선정 제외)</span></li>
							</ul>
						</div>
						<div class="reviewer-introdce-content">
							<strong class="content-title">활동기간</strong>
							<p class="content-text">선정 후 <span class="sffont-area">2</span>개월간</p>
						</div>
						<div class="reviewer-introdce-content">
							<strong class="content-title">혜택</strong>
							<ul class="benefit-list">
								<li class="list-item">
									<div class="list-content">
										<p>월 <span class="sffont-area">2</span>회, <span class="sffont-area">50</span>%<br> 장바구니 할인쿠폰 지급</p>
									</div>
								</li>
								<li class="list-item">
									<div class="list-content">
										<p>리뷰 작성 포인트 <span class="sffont-area">2</span>배 적립</p>
									</div>
								</li>
								<li class="list-item">
									<div class="list-content">
										<p>신상품 무료 체험 가능한<br> 탑리뷰어 체험단 초대</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="reviewer-introdce-button-area">
					<button type="button" class="btn-reviewer" onclick="common.link.moveTopReviewer();" style="display: none;">탑리뷰어 보러가기</button>
				</div>
				<button type="button" class="btn_close" onclick="javascript:$('#layer_pop_wrap').hide();$('.dimm').remove()">
					<span class="blind">메뉴 닫기</span>
				</button>
			</div>
		<!-- // 탑리뷰어 소개 팝업 -->
		</div>
		<input type="hidden" name="pageGbn" id="pageGbn" value="">
	<script type="text/javascript">
		$(document).ready(function() {
			// 탑리뷰어 보러가기 버튼 노출 여부
			var pageGbn = mypage.reviewerLounge.topReviewerPageGbn;
			// 이벤트 > 올영체험단 > 탑리뷰어가 되고싶다면 중간 배너
			if(pageGbn != "ollyoung"){
				$('.btn-reviewer').hide();
			}
		});
	</script>
	</div>
	
	
	<div class="layer_pop_wrap experience-popup trans1" id="lay_experience_info" style="display: block;">
		<!-- 올영 체험단 레이어 수정: 2022.08.16 modify -->
		<div class="experience-popup-inner">
			<div class="experience-popup-header">
				<strong class="header-title">탑리뷰어 체험단 소개</strong>
			</div>
			<div class="experience-popup-content">
				<div class="experience-content">
					<strong class="content-title">탑리뷰어 체험단 이렇게 진행돼요</strong>
					<ul class="experience-list">
						<li class="list-item">
							<div class="thumb"></div>
							<div class="list-content">
								<strong class="list-content-title">초대알림 수신</strong>
								<p class="list-content-text">격주 월요일 오전 10시<br>APP PUSH 수신 동의 필수</p>
							</div>
						</li>
						<li class="list-item">
							<div class="thumb"></div>
							<div class="list-content">
								<strong class="list-content-title">상품 신청</strong>
								<p class="list-content-text">ID당 상품 1개 신청 가능<br> 신청 후 취소 및 변경 불가</p>
							</div>
						</li>
						<li class="list-item">
							<div class="thumb"></div>
							<div class="list-content">
								<strong class="list-content-title">리뷰 작성</strong>
								<p class="list-content-text">탑리뷰어 체험단 리뷰 작성 기간 내<br> (약 3주) 리뷰 미작성 시<br> 추후 <em>탑리뷰어 선정 제외</em></p>
							</div>
						</li>
					</ul>
				</div>
				<div class="experience-content">
					<strong class="content-title">어떻게 초대받나요?</strong>
					<p class="content-text">탑리뷰어가 되면 초대받을 수 있어요!<br>탑리뷰어 되는 방법은 아래 버튼 클릭 후 알아보세요.</p>
				</div>
			</div>
			<div class="how-button-area">
				<a href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102970002" class="btn-how">탑리뷰어 되는 방법 알아보기</a>
			</div>
			<div class="experience-notice-area">
				<strong class="experience-notice-title">꼭 알아두세요</strong>
				<ul class="experience-notice-list">
					<li class="list-item">체험단 신청 시 입력된 기본배송지와 연락처를 통해 배송되오니, 신청 전 반드시 확인해주세요.<br>주소 오류로 인한 반송 시 재발송이 불가합니다.</li>
					<li class="list-item">상품 신청 전, 개인정보 위수탁 동의 후 ‘배송지 정보 수정’에서 배송지 수정이 가능합니다.</li>
					<li class="list-item">마이페이지&gt;리뷰&gt;체험단&gt;배송지확인 메뉴에서 입력하신 배송지 확인이 가능하며 리뷰작성 기간 내에만 조회됩니다.</li>
				</ul>
			</div>
			<button type="button" class="btn_close" onclick="javascript:$('#lay_experience_info').hide();$('.dimm').remove()"></button>
		</div>
	</div>
	
</body>
</html>