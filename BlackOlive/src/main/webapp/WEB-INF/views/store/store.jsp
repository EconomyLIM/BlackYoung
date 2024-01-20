<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/swiper@11.0.5/swiper-bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/swiper@11.0.5/swiper-bundle.min.css" rel="stylesheet">

<link rel="stylesheet" href="/resources/cdn-main/jquery.mCustomScrollbar.css" />

<title>블랙올리브영 온라인몰</title>
<style>
	.way_view:after {
	    content: "";
	    position: absolute;
	    left: 50%;
	    right: 0;
	    bottom: -12px;
	    width: 24px;
	    height: 12px;
	    margin-left: -12px;
	    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/store/ico_storeP_06.png) no-repeat;
	}
</style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="userName" property="principal.member.userName" />
</sec:authorize>

<div id="Wrapper">
	<div id="skip_navi"><a href="#Container">본문바로가기</a></div>
	
	<!-- 상단 띠 배너 - 어워즈관 S -->
	<div class="banUpperBox" style="display: none">
		<div class="inner">
			<a href="javascript:common.link.commonMoveUrl('amusement/intro.do')" id="top_banner_image"></a>
			<a href="" class="btn_upper_close">오늘 안 보기</a>
		</div>
		<div class="dimBan"><div class="in"></div></div>
	</div>
	<div class="dimBanWhite" style="display:none"><div class="in"></div></div>
	<div class="dimBanBlack"></div>
	<!-- 상단 띠 배너 - 어워즈관 E -->

<form name="ssologinfrm" action="https://www.oliveyoung.co.kr/store/login/ssoLogin.do" method="post">
<input type="hidden" id="cjssoq" name="cjssoq">
</form>
	<div id="Container" class="store_footer">
		<div id="Contents" class="fix_full">
			<div class="sub_title_area store">
				<h1>매장안내 <span>가까운 매장을 등록해 보세요.</span></h1>
			</div>
			<div class="store_area">
				<div class="api_mapArea" id="map" style="overflow: hidden;">
					<div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;https://t1.daumcdn.net/mapjsapi/images/2x/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;https://t1.daumcdn.net/mapjsapi/images/2x/cursor/openhand.cur.ico&quot;), default;">
						<div style="position: absolute; left: 1201px; top: 1305px;">
							<div style="position: absolute; z-index: 1; left: 0px; top: 0px;"></div>
							<div style="position: absolute; z-index: 1;"></div>
							<div style="position: absolute; z-index: 1; width: 630px; height: 715px;"></div>
							<div style="position: absolute; z-index: 1;">
								<svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: -2461px; top: -2735px; width: 3150px; height: 3575px;" viewBox="0 0 3150 3575"><defs></defs></svg>
							</div>
							<div style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);">
								<div style="position: absolute; margin: -41px 0px 0px -13px; z-index: 0; left: -1071px; top: -1100px; display: block;"></div>
								<div style="position: absolute; margin: -33px 0px 0px -11px; z-index: 0; left: -1064px; top: -1266px; display: block;"></div>
								<div style="position: absolute; margin: -33px 0px 0px -11px; z-index: 0; left: -1126px; top: -1224px; display: block;"></div>
								<div style="position: absolute; margin: -33px 0px 0px -11px; z-index: 0; left: -1152px; top: -1206px; display: block;"></div>
								<div style="position: absolute; margin: -33px 0px 0px -11px; z-index: 0; left: -1063px; top: -1286px; display: block;"></div>
								<div style="position: absolute; margin: -33px 0px 0px -11px; z-index: 0; left: -1231px; top: -1152px; display: none;"></div>
								<div style="position: absolute; margin: -33px 0px 0px -11px; z-index: 0; left: -1122px; top: -1275px; display: block;"></div>
								<div style="position: absolute; margin: -33px 0px 0px -11px; z-index: 0; left: -1228px; top: -1187px; display: none;"></div>
								<div style="position: absolute; z-index: 9999; white-space: nowrap; margin: 0px; left: -735px; top: -723px;"></div>
								<div style="position: absolute; z-index: 9999; white-space: nowrap; margin: 0px; left: -733px; top: -705px;"></div>
								<div style="position: absolute; z-index: 9999; white-space: nowrap; margin: 0px; left: -735px; top: -723px;"></div>
							</div>
						</div>
					</div>
					<div style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);">
						<div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;">
							<div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 58px;"></div>
							<div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">2km</div>
						</div>
						<div style="margin: 0px 4px; float: left;">
							<a target="_blank" href="http://map.kakao.com/" title="Kakao 지도로 보시려면 클릭하세요." style="float: left; width: 32px; height: 10px;">
								<img src="https://t1.daumcdn.net/mapjsapi/images/2x/m_bi_b.png" alt="Kakao 지도로 이동" style="float: left; width: 32px; height: 10px; border: none;">
							</a>
							<div style="font: 11px / 11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div>
						</div>
					</div>
					<div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div>
				</div>
					<!-- 매장 검색 영역 -->
					<div class="store_side">
						<div class="store_tab">
							<ul class="clearfix" id="TabsOpenArea">
								<li id="searchWordTab" class="on"><a href="javascript:;">직접검색</a></li>
								<li id="searchAreaTab" class=""><a href="javascript:;">지역검색</a></li>
								<li id="searchFavorTab" class=""><a href="javascript:;">관심매장</a></li>
								<li id="searchItemTab"><a href="javascript:;">판매매장 찾기</a></li>
							</ul>
						</div>
						
						<!--직접검색 영역 S  -->
						<div class="tab_area" id="searchWordDiv" style="">
							<h4 class="hide">매장 직접검색</h4>
							<div class="store_rebox">
								<div class="store_sch">
									<div class="store_schInner">
										<input type="text" name="" id="searchWord" value="" title="매장명 또는 주소를 입력해주세요." placeholder="매장명/주소 입력 (ex.명동 또는 퇴계로)">
										<a href="javascript:;" class="btn_sch_del"><span class="blind">검색어 삭제</span></a>
										<a href="javascript:;" class="btn_sch"><span class="blind">검색</span></a>
									</div>
									<dl class="reShop_result"><dt><span>${storeList.size() }</span>개의 매장이 검색되었습니다.</dt><dd><span class="oyblind">관심매장</span>클릭하여 관심매장을 등록하세요.</dd></dl>
									<div class="urNotice"><p>매장 상황에 따라 매장별 실 영업시간이 다를 수 있습니다.</p></div>
								</div>
								<div class="no_store" id="noSearchWordInfo" style="display: none">
									<dl class="no_list">
										<dt>매장 검색 옵션에 해당하는<br>매장이 없습니다.</dt>
									</dl>
								</div>
								
								<div class="sroll_store scrbar mCustomScrollbar _mCS_2 mCS_no_scrollbar" style="overflow: auto;">
								    <div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0">
								        <div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position: relative; top: 0px; left: 0px;" dir="ltr">
								            <ul class="mlist-reStore" id="wordStoreList">
								            	<c:forEach items="${storeList}" var="list">
													<li class="${list.storeId }">
														<div class="li_Pc_reInner">
															<h4 class="tit">
																<a href="javascript:;">${list.storeName }</a>
															</h4>
															<p class="addr">${list.storeAddress }</p> 
															<div class="area">
																<div class="call">${list.storeTel }</div>
																<div class="time ${list.openYN == 'Y' ? 'on' : ''}">${list.openYN == 'Y' ? '영업중' : '영업 준비중'}</div>	
															</div>
															<div class="fv_reShop_in"><span>${list.storeFavorite }</span>명이 관심매장으로 등록했습니다.</div>
															<button class="star ${list.favYN == 'Y' ? 'on' : 'active'}" onclick="favBtnClick(this)" title="관심매장 해제됨">관심매장</button>
														</div>
													</li>
												</c:forEach>
								            </ul>
								        </div>
								        
								    </div>
								</div>
							</div>
						</div>
						<!--직접검색 영역 E  -->
						
						<!-- 지역검색 영역 S  -->
						<div class="tab_area" id="searchAreaDiv" style="display: none;">
							<h4 class="hide">매장 지역검색</h4>
							<div class="store_rebox">
								<div class="store_sch">
									<div class="store_schInner">
										<div class="store_Select">
											<ul class="clearfix">
												<li>
													<select title="지역을 선택하세요." id="mainAreaList" class="act">
														<option value="none" selected="selected">지역</option>
														<c:forEach items="${cityList}" var="list">
															<option value="${list.cityId }">${list.cityName}</option>
														</c:forEach>
													</select>
												</li>
												<li>
													<select title="시/군/구를 선택하세요." id="subAreaList" class="act">
														<option value="none" selected="selected">시/군/구</option>
													</select>
												</li>
											</ul>
											<button type="button" id="searchAreaButton">검색</button>
										</div>
									</div>
								<dl class="reShop_result"><dt><span>32</span>개의 매장이 검색되었습니다.</dt><dd><span class="oyblind">관심매장</span>클릭하여 관심매장을 등록하세요.</dd></dl><div class="urNotice"><p>매장 상황에 따라 매장별 실 영업시간이 다를 수 있습니다.</p></div></div>
								<div class="no_store" id="noSearchAreaInfo" style="display: none">
									<dl class="no_list">
										<dt>매장 검색 옵션에 해당하는<br>매장이 없습니다.</dt>
									</dl>
								</div>
								<div class="sroll_store scrbar mCustomScrollbar _mCS_3" style="overflow: auto;">
									<div id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"  tabindex="0">
										<div id="mCSB_3_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr">
											<ul class="mlist-reStore" id="areaStoreList"></ul>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<!-- 지역검색 영역 E  -->
						
						<!-- 관심매장 영역 S  -->
						<div class="tab_area" id="searchFavorDiv" style="display: none;">
							<sec:authorize access="isAnonymous()">
								<div class="no_store" id="noLoginInfo" style="">
									<dl class="no_login">
										<dt>로그인하시면 자주가는 매장을<br>관심 매장으로 설정 할수 있습니다.</dt>
										<dd><a href="<c:url value='/auth/login'/>">로그인</a></dd>
									</dl>
								</div>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								
									<h4 class="hide">관심매장</h4>
									<div class="store_favInner" id="favorStoreInfo" style="display: none;">
								</div>
								<!-- :: 관심매장이 없는 경우 :: -->
								<div class="no_store" id="noFavorStoreInfo" style="display: none">
									<dl class="no_list"></dl>
								</div>
								<div class="no_store" id="noSearchFavorInfo" style="display: none">
									<dl class="no_list">
										<dt>매장 검색 옵션에 해당하는<br>매장이 없습니다.</dt>
									</dl>
								</div>
								<div class="sroll_store scrbar mCustomScrollbar _mCS_4 mCS_no_scrollbar" style="overflow: auto;">
									<div id="mCSB_4" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0">
										<div id="mCSB_4_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
											<ul class="mlist-reStore" id="favorStoreList" style="display: none;"></ul>
										</div>
										
									</div>
								</div>
								
							</sec:authorize>
						</div>
						<!-- 관심매장 영역 E  -->					
						<!-- 판매매장 찾기 영역 S  -->
						<div class="tab_area" id="searchItemDiv" style="display:none">
							<h4 class="hide">상품 판매매장 찾기</h4>
							<div class="store_rebox">
								<div class="store_sch">
									<div class="store_schInner">
										<input type="text" name="searchItem" id="searchItem" value="" title="상품명을 입력해주세요" placeholder="상품명을 입력해주세요">
										<!-- 상품번호(goodsNo) -->
										<input type="hidden" name="searchItemNo" id="searchProductId" value="">
										<!-- 옵션번호(itemNo) -->
										<input type="hidden" name="searchItemNo2" id="searchItemNo2" value="">
										<input type="hidden" name="searchItemLgcNo" id="searchItemLgcNo" value="">
										<a href="javascript:;" class="btn_sch_del"><span class="blind">검색어 삭제</span></a>
										<a href="javascript:;" class="btn_sch"><span class="blind">검색</span></a>
									</div>
								</div>
								<div class="no_store" id="noSearchItemInfo" style="display: none">	
									<dl class="no_list">
										<dt>매장 검색 옵션에 해당하는<br>매장이 없습니다.</dt>
									</dl>
								</div>
								<div class="sroll_store scrbar mCustomScrollbar _mCS_5 mCS_no_scrollbar" style="overflow: auto;">
									<div id="mCSB_5" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0">
										<div id="mCSB_5_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
											<ul class="mlist-reStore" id="itemStoreList"></ul>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<!-- 판매매장 찾기 영역 E  -->
						
						<!-- 매장 검색 옵션 S -->
						<div class="store_opSt">
							<a href="javascript:;" class="btn_opSt">매장 검색 옵션</a>
							<div class="choice_opSt" style="display:none">
								<div class="choice_opView">
									<input type="checkbox" name="reShop_chk" id="reShop_chk"><label for="reShop_chk">영업중 매장만 보기</label>
								</div>
								<div class="reShop_opList" id="tc_list">
									<p>카테고리 취급매장</p>
									<ul>
										<li><button>스킨케어</button><input type="hidden" name="tcVal" value="1"></li>
										<li><button>메이크업</button><input type="hidden" name="tcVal" value="2"></li>
										<li><button>프래그런스</button><input type="hidden" name="tcVal" value="3"></li>
										<li><button>바디케어</button><input type="hidden" name="tcVal" value="4"></li>
										<li><button>헤어케어</button><input type="hidden" name="tcVal" value="5"></li>
										<li><button>프리미엄브랜드</button><input type="hidden" name="tcVal" value="6"></li>
										<li><button>건강/위생용품</button><input type="hidden" name="tcVal" value="7"></li>
										<li><button>건강식품</button><input type="hidden" name="tcVal" value="8"></li>
										<li><button>생활용품</button><input type="hidden" name="tcVal" value="9"></li>
										<li><button>펫용품</button><input type="hidden" name="tcVal" value="10"></li>
										<li><button>주류</button><input type="hidden" name="tcVal" value="11"></li>
									</ul>
								</div>
								<div class="reShop_opList" id="ps_list">
									<p>서비스 제공 매장</p>
									<ul>
										<li><button>선물포장</button><input type="hidden" name="psVal" value="1"></li>
										<li><button>TAXREFUND</button><input type="hidden" name="psVal" value="2"></li>
										<li><button>TAXREFUND(즉시환급)</button><input type="hidden" name="psVal" value="3"></li>
										<li><button>기프트카드판매</button><input type="hidden" name="psVal" value="4"></li>
										<li><button>현금없는매장</button><input type="hidden" name="psVal" value="5"></li>
										<li><button>상품권판매(문화)</button><input type="hidden" name="psVal" value="6"></li>
										<li><button>간편결제</button><input type="hidden" name="psVal" value="7"></li>
										<li><button>뷰티스트</button><input type="hidden" name="psVal" value="8"></li>
										<li><button>주차가능</button><input type="hidden" name="psVal" value="9"></li>
										<li><button>스마트반품</button><input type="hidden" name="psVal" value="10"></li>
										<li><button>픽업</button><input type="hidden" name="psVal" value="11"></li>
										<li><button>뷰티사이클</button><input type="hidden" name="psVal" value="12"></li
										><li><button>주류</button><input type="hidden" name="psVal" value="13"></li>
									</ul>
								</div>
								<div class="btnBox">
									<a href="javascript:;" class="init_btn empty_btn">초기화</a>
									<a href="javascript:;" class="btnSmall choice_btn">적용하기</a>
								</div>
							</div>
						</div>
						<!-- 매장 검색 옵션 E -->
						
					</div>
				</div>
		</div>
	</div>
	
	<div class="layer_pop_wrap w850" id="store_viewPop_renew" style="z-index: 100; width: 560px; max-height: 1000px; margin-left: -280px; display: block; left: 50%; top: 1%; margin-top: 210px;"></div>
	
	<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	<div id="directTop" style="display: none;">
		<button><span></span>TOP</button>
	</div>
	<!--/ㅁ 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->

</div>
<script src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36d928ed3fda62efe8373b73be2275c2"></script>
<script>
	// 지도 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 현재 위치를 저장할 변수
    let currentLocation;

    // 현재 위치 얻기
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
            (position) => {
                // 현재 위치의 위도와 경도를 저장
                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;

                // 현재 위치를 변수에 저장
                currentLocation = new kakao.maps.LatLng(latitude, longitude);

                // 이후에 변수(currentLocation)를 사용할 수 있음
                console.log('Current Location:', currentLocation);
            },
            (error) => {
                console.error('Error getting current position:', error);
            }
        );
    } else {
        console.error('Geolocation is not supported.');
    }
</script>

<script>
let dimm = $("<div>").addClass("dimm").css("z-index", "990px");

$(function() {
	$("#store_viewPop_renew").on("click", "#info", function(event) {
		event.preventDefault();
		$(this).parent().addClass("on");
		$(this).parent().next().removeClass("on");
		$("#strInfo").show();
		$("#strPrdInfo").hide();
	});
	
	$("#store_viewPop_renew").on("click", "#prod", function(event) {
		event.preventDefault();
		$(this).parent().addClass("on");
		$(this).parent().prev().removeClass("on");
		$("#strPrdInfo").show();
		$("#strInfo").hide();
		
		$.ajax({
			type : 'get'
			, cache: false
			, url : '/store/getCategoryLarge'
			, dataType : 'json'
			, success : function(data) {
				console.log(data)
				$("#selCate").empty();
				$("#selCate").append($("<option>").val("").text("전체"));
				
				$(data).each(function(i) {
					$("#selCate").append($("<option>").val(data[i].categoryLargeId).text(data[i].categoryLargeName))
				})
				
	        }
			, 
			error: function(xhr, textStatus, errorThrown) {
		        console.log('Error Status Code: ' + xhr.status);
		        console.log('Error Message: ' + xhr.statusText);
		        console.log('Text Status: ' + textStatus);
		        console.log('Error Thrown: ' + errorThrown);

		    }
		});
	});
});


// 매장 상세 Ajax
function storeDetail(storeId) {
	$('#store_viewPop_renew').show();
	$('body').append(dimm);
	popupCenter($('#store_viewPop_renew'));
	
	$.ajax({
		type : 'get'
		, cache: false
		, url : '/store/getStoreDetail'
		, dataType : 'json'
		, data : {
			storeId : storeId
		}
		, success : function(data) {
			console.log(data)
			
			let popupContent = `
				<div class="layer_cont5 recoStore ">
					<h2 class="layer_title5">매장 안내</h2>
					<ul class="store_handleTab" id="layerTabList">
						<li class="on"><a href="javascript:;" class="on strTab" id="info">매장 안내</a></li>
						<li><a href="javascript:;" class="strTab" id="prod">베스트 상품</a></li>
					</ul>
					<div class="content">
						<div id="mCSB_7" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0">
							<div id="mCSB_7_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
								<div class="depth1" id="strInfo">
									<div class="store_vArea">
										<div class="store_vArea_top">
											<h4 class="tit">
												<!-- 3501644 매장안내 팝업 관심매장 등록 결함 개선 요청 -->						
												<button class="star active star_DC8F" id="btn_star" data_strno="DC8F">관심매장</button>
												\${data.storeName}
											</h4>
											<span class="store_nearWay" style="display:none;">Km</span>
											<p class="addr">\${data.storeAddress}</p>
											<div class="area">		
												<div class="call">\${data.storeTel}</div>
												<div class="time \${data.openYN === 'Y' ? 'on' : ''}">\${data.openYN === 'Y' ? '영업 중' : '영업 준비중'}</div>		
												<div class="fv_reShop_in"><span class="str_DC8F_favorCnt">\${data.storeFavorite}</span>명이 관심매장으로 등록했습니다.</div>
											</div>
						 				<!-- 매장 추천일 때만 지도 영역 노출 -->
										<div class="api_mapArea">
											<div class="store_wayP" id="store_map" style="overflow: hidden; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/2x/bg_tile.png&quot;);">
												<div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;https://t1.daumcdn.net/mapjsapi/images/2x/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;https://t1.daumcdn.net/mapjsapi/images/2x/cursor/openhand.cur.ico&quot;), default;">
													<div style="position: absolute;">
														<div style="position: absolute; z-index: 0;"></div>
														<div style="position: absolute; z-index: 1; left: 0px; top: 0px;">
															<img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v23_izbfy/3/2013/860.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -112px; top: 20px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
															<img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v23_izbfy/3/2013/861.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 144px; top: 20px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
															<img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v23_izbfy/3/2013/862.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 400px; top: 20px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
															<img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v23_izbfy/3/2014/860.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -112px; top: -236px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
															<img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v23_izbfy/3/2014/861.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 144px; top: -236px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
															<img src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNG01/v23_izbfy/3/2014/862.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 400px; top: -236px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
														</div>
														<div style="position: absolute; z-index: 1;"></div>
														<div style="position: absolute; z-index: 1; width: 0px; height: 0px;"></div>
														<div style="position: absolute; z-index: 1;">
															<svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: 0px; top: 0px; width: 0px; height: 0px;" viewBox="0 0 0 0"><defs></defs></svg>
														</div>
														<div style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);">
															<div style="position: absolute; margin: -34px 0px 0px -11px; z-index: 0; left: 215px; top: 100px; display: none;">
																<img draggable="false" src="https://static.oliveyoung.co.kr/pc-static-root/image/store/point_way.png" alt="" role="presentation" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 24px, 35px, 0px); top: 0px; left: 0px; width: 24px; height: 35px;"></div>
														</div>
													</div>
												</div>
												<div style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);">
													<div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left; display: none;">
														<div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 46px;"></div>
														<div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">50m</div>
													</div>
													<div style="margin: 0px 4px; float: left;">
														<a target="_blank" href="http://map.kakao.com/" title="Kakao 지도로 보시려면 클릭하세요." style="float: left; width: 32px; height: 10px;">
															<img src="https://t1.daumcdn.net/mapjsapi/images/2x/m_bi_b.png" alt="Kakao 지도로 이동" style="float: left; width: 32px; height: 10px; border: none;">
														</a><div style="font: 11px / 11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div>
													</div>
												</div>
												<div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div>
											</div>
										</div>
									</div>
									<div class="store_infoBox">
										<h2>영업시간</h2>
										<div class="store_time">
											<ul>
												<li>
													<p>
														<span class="day">
															<em>평일</em> : <strong>\${data.weekday}</strong>
														</span>
													</p>
												</li>
												<li>
													<p>
														<span class="day">
															<em>토요일</em> : <strong>\${data.saturday}</strong>
														</span>
														<span class="day">
															<em>일요일</em> : <strong>\${data.sunday}</strong>
														</span>
														<span class="day">
															<em>공휴일</em> : <strong>\${data.holiday}</strong>
														</span>
													</p>
												</li>
											</ul>
										</div>
										<div class="urNotice">
											<p>매장 상황에 따라 매장별 실 영업시간이 다를 수 있습니다.</p>
										</div>
									</div>`;
									
									
									// 오시는 방법 붙이기
									if(data.storeDirection) {
										popupContent += `
											<div class="store_infoBox">
												<h2>오시는 방법</h2>
												<div class="store_time">
													\${data.storeDirection}
												</div>
											</div>
										`;
									}
									
									// 오시는 방법 붙이기
									if(data.storeParking) {
										popupContent += `
											<div class="store_infoBox">
												<h2>주차설명</h2>
												<div class="store_time">
													\${data.storeParking}
												</div>
											</div>
										`;
									}
									
									// 오시는 방법 붙이기
									if(data.storeSignificant) {
										popupContent += `
											<div class="store_infoBox">
												<h2>특이사항</h2>
												<div class="store_time">
													\${data.storeSignificant}
												</div>
											</div>
										`;
									}	
									
					popupContent +=		`<div class="store_infoBox">
										<h2>취급 카테고리</h2>
										<div class="store_pdList">
											<div class="inner">`;
										
										// 매장 카테고리 붙이기
										for (var i = 0; i < data.storeCategory.length; i++) {
											popupContent +=	`<span class="tag">\${data.storeCategory[i].categoryName}</span>`
										}
												
					popupContent +=			`</div>
										</div>
									</div>`;
						
					// 매장 사진이 있을 시
					if(data.storeThumbnail.length > 0) {
						popupContent +=	`
							<div class="store_infoBox">
							<h2>매장 사진</h2>
							<div class="store_sl">
								<div class="swiper-container" id="store_sl">
									<ul class="swiper-wrapper">
						`;
						
						for (var i = 0; i < data.storeThumbnail.length; i++) {
							popupContent += `<li class="swiper-slide"><img src="\${data.storeThumbnail[i].thumbnailSrc}" class="mCS_img_loaded"></li>`;
						}
						
						popupContent += `
										</ul>
										<div class="swiper-scrollbar"><div class="swiper-scrollbar-drag"></div></div>
									<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
									<div class="recoStBtn">
										<button class="recoStBtn_prev"></button>
										<button class="recoStBtn_next"></button>
									</div>
								</div>
								<p class="store_time mgT10">매장의 이미지는 단순 참고용으로만 확인부탁드립니다.<br>실제 매장 방문시 연출물은 시기에 따라 다를 수 있습니다.</p>
							</div>
						`;
					}
							
									
					popupContent +=	`<div class="store_infoBox">
										<h2>제공중인 서비스</h2>
										<ul class="store_sv">`;
										
									// 매장 서비스 붙이기
									for (var i = 0; i < data.oliveService.length; i++) {
										popupContent += `
											<li>
												<dl class="ico_rss_\${data.oliveService[i].serviceType}">
													<dt>\${data.oliveService[i].serviceName}</dt>`;
										if(data.oliveService[i].serviceContent) {
											popupContent += `
												<dd>\${data.oliveService[i].serviceContent}</dd>
											`;	
										}
													
										popupContent += `</dl>
											</li>
										`;
									}										
					
					// 현재 날짜와 현재 날짜에서 한달 전 날짜 구하기
					let currDate = new Date();
					let month = currDate.getMonth() + 1;
					let date = currDate.getDate();
					currDate.setMonth(currDate.getMonth() - 1);
					let prevMonth = currDate.getMonth() + 1;
					let prevDate = currDate.getDate();
									
					popupContent +=		`</ul>
									</div>		
								</div>
							</div>
							<div class="depth1" id="strPrdInfo" style="display:none;">
								<div class="liveRk_bestPd">
									<div class="topCate">					
										<span class="bestSelect">
											<select id="selAge" title="연령대">							
													<option value="0">전체</option>							
													<option value="1">10대</option>							
													<option value="2">20대</option>						
													<option value="3">30대</option>							
													<option value="4">40대</option>
													<option value="5">50대</option>
											</select>
										</span>
										<span class="bestSelect">
											<select id="selGen" title="성별">
												<option value="0">전체</option>
												<option value="2">여성</option>
												<option value="1">남성</option>
											</select>
										</span>
										<span class="bestSelect">
											<select id="selCate" title="카테고리">
											</select>
										</span>
										<span>베스트 상품이에요</span>
									</div>
									<p class="bestPd_date"><span>\${prevMonth}</span>월 <span>\${prevDate}</span>일 ~ <span>\${month}</span>월 <span>\${date}</span>일 | 온라인몰 판매 중인 매장 베스트 상품</p>
								</div>
								<div class="curation_area" id="storeBestProdArea">
								</div>
							</div>
							<a href="javascript:;" class="store_btn" id="bottm_closeBtn" onclick="javascript:$('#store_viewPop_renew').hide();$('.dimm').remove();">닫기</a>
						</div>
					</div>
				</div>
				<button class="layer_close type4" onclick="javascript:$('#store_viewPop_renew').hide();$('.dimm').remove();">창 닫기</button>
				<input type="hidden" name="storeNo" value="DC8F">
			</div>
			`;
			
			$("#store_viewPop_renew").empty().append(popupContent);
			
			var swiper = new Swiper('.swiper-container', {
				slidesPerView: 2
				, spaceBetween: 10
				, pagination : {
			    	el : '.swiper-pagination'
			    }
			    , navigation : {
			    	nextEl : '.recoStBtn_next'
			    	, prevEl : '.recoStBtn_prev'
			    }
			    , scrollbar : {
			    	el : '.swiper-scrollbar'
			    }
			  });
			
			$(".content").mCustomScrollbar();
			
			
        }
		, 
		error: function(xhr, textStatus, errorThrown) {
	        console.log('Error Status Code: ' + xhr.status);
	        console.log('Error Message: ' + xhr.statusText);
	        console.log('Text Status: ' + textStatus);
	        console.log('Error Thrown: ' + errorThrown);

	    }
		/* error : function (data, textStatus) {
            console.log('error');
        } */
	});
	
	
}

//즐겨찾기 버튼 눌렀을 때 
function favBtnClick(myBtn) {
	if(${empty userName}) {
		let check = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
		if(check) {
			location.href = '/auth/login';
		}
		return;
	} 
	let clickCheck = 0;
	
	if($(myBtn).hasClass("active")) {
		$(myBtn).removeClass("active").addClass("on");
		clickCheck = 1;
	} else {
		$(myBtn).removeClass("on").addClass("active");
		clickCheck = -1;
	}
	
	let cnt = $(myBtn).prev().children("span").html();
	$(myBtn).prev().children("span").html(Number(cnt) + clickCheck);
	
	let storeId = $(myBtn).parent().parent().attr("class");
	
	$.ajax({
		type : 'post'
		, cache: false
		, url : '/store/setStoreFavorite'
		, dataType : 'text'
		, data : {
			storeId : storeId
			, clickCheck : clickCheck
			, '${_csrf.parameterName }' : '${_csrf.token }'
		}
		, success : function(data) {
			console.log(data)
			console.log("즐겨찾기 업데이트 완료~~")
        }
		, 
		error: function(xhr, textStatus, errorThrown) {
	        console.log('Error Status Code: ' + xhr.status);
	        console.log('Error Message: ' + xhr.statusText);
	        console.log('Text Status: ' + textStatus);
	        console.log('Error Thrown: ' + errorThrown);

	    }
		/* error : function (data, textStatus) {
            console.log('error');
        } */
	});
} 

// 위도 경도를 저장
let latLngs;
let latLng;
let markers = [];
let contents = [];
let overlays = [];

function closeOverlay(index) {
	overlays[index].setMap(null);
}


$(function() {
	/* // 처음 열었을때 직접검색의 돋보기 클릭되게
	$(".btn_sch").click(); */
	
	// 직접검색 지역검색 관심매장 판매매장 찾기 
	// 탭 구현
	$("#TabsOpenArea > li").on("click", function() {
		$("#TabsOpenArea > li").removeClass("on");
		$(this).addClass("on");
		$(".tab_area").hide();
		switch($(this).text()) {
			case "직접검색" : 
				$(".tab_area").eq(0).show();
				break;
			case "지역검색" : 
				$(".tab_area").eq(1).show();
				break;
			case "관심매장" : 
				$(".tab_area").eq(2).show();
				break;
			case "판매매장 찾기" : 
				$(".tab_area").eq(3).show();
				break;
		}
	}); // end
	
	// 매장 검색 옵션 눌렀을 때
	$(".btn_opSt").on("click", function() {
		$(this).toggleClass("on");
		$(".choice_opSt").slideToggle("fast");
		
		/*if($(this).hasClass("on")) {
			$(".choice_opSt").css("display", "block");
		} else {
			$(".choice_opSt").css("display", "none");
		}*/
	}); // end
	
	// 카테고리 취급매장, 서비스 제공 매장 버튼 선택 구현
	$(".reShop_opList > ul > li > button").on("click", function() {
		$(this).toggleClass("on");
	});
	
	// 초기화 버튼 구현
	$(".init_btn.empty_btn").on("click", function() {
		$(".reShop_opList > ul > li > button").removeClass("on");
	});
	

	
	/* 직접검색 탭 */
	
	// 검색어를 입력하고 enter를 눌렀을 때
	$("#searchWord").on("keyup", function(event) {
		if(event.which == 13) {
			let keyword = $(this).val();
			
			let tc = $("#tc_list button.on").next();
			let ps = $("#ps_list button.on").next();
			let tcs = [];
			let pss = [];
			
			for(let i=0; i<tc.length; i++) {
				tcs.push($(tc[i]).val());
			}
			
			for(let i=0; i<ps.length; i++) {
				pss.push($(ps[i]).val());
			}
			
			$.ajax({
				type : 'get'
				, async : true
				, cache: false
				, url : '/store/getStoreKeyword'
				, dataType : 'json'
				, data : { 
					keyword : keyword
					, tcs : tcs.toString()
					, pss : pss.toString()
				}
				, success : function(data) {
					$("#wordStoreList").empty();
					if(data == "") {
						$("#noSearchWordInfo").show();
						$("#searchWordDiv .reShop_result > dt > span").text("0");
						return;
					}
					
					$("#noSearchWordInfo").hide();
					$("#searchWordDiv .reShop_result > dt > span").text(data.length);
					for(let i=0; i<data.length; i++) {
						let li = $("<li>").addClass(data[i].storeId);
						let div = $("<div>").addClass("li_Pc_reInner");
						let h4 = $("<h4>").addClass("tit")
						let a = $("<a>").text(data[i].storeName);
						let p = $("<p>").addClass("addr").text(data[i].storeAddress);
						let area = $("<div>").addClass("area");
						let call = $("<div>").addClass("call").text(data[i].storeTel);
						
						let time = data[i].openYN === 'Y' 
							? $("<div>").addClass(["time", "on"]).text("영업중")
							: $("<div>").addClass("time").text("영업 준비중");
							
						let favYN = data[i].favYN ? "on" : "active";
						
						let fv_reShop_in = $("<div>")
											.addClass("fv_reShop_in")
											.html(`<span>\${data[i].storeFavorite}</span>명이 관심매장으로 등록했습니다.`);
						let button = $("<button>").addClass(["star", favYN]).on("click", function() {
							favBtnClick(this);
						});
						
						$(area).append(call);
						$(area).append(time);
						
						$(h4).append(a);
						$(div).append(h4);
						$(div).append(p);
						$(div).append(area);
						$(div).append(fv_reShop_in);
						$(div).append(button);
						
						$(li).append(div);
						$("#wordStoreList").append(li);
					}
					
					$("#mCSB_2_container").css("top", "0");
	            }
				, error : function (data, textStatus) {
	                console.log('error');
	            }
			});
		}
	}); // end
	
	// 돋보기를 눌렀을 때
	$(".btn_sch").on("click", function() {
		let keyword = $("#searchWord").val();
		
		let tc = $("#tc_list button.on").next();
		let ps = $("#ps_list button.on").next();
		let tcs = [];
		let pss = [];
		
		for(let i=0; i<tc.length; i++) {
			tcs.push($(tc[i]).val());
		}
		
		for(let i=0; i<ps.length; i++) {
			pss.push($(ps[i]).val());
		}
		
		$.ajax({
			type : 'get'
			, cache: false
			, url : '/store/getStoreKeyword'
			, dataType : 'json'
			, data : { 
				keyword : keyword
				, tcs : tcs.toString()
				, pss : pss.toString()
			}
			, success : function(data) {
				$("#wordStoreList").empty();
				if(data == "") {
					$("#noSearchWordInfo").show();
					$("#searchWordDiv .reShop_result > dt > span").text("0");
					return;
				}
				
				$("#noSearchWordInfo").hide();
				$("#searchWordDiv .reShop_result > dt > span").text(data.length);
				for(let i=0; i<data.length; i++) {
					let li = $("<li>").addClass(data[i].storeId);
					let div = $("<div>").addClass("li_Pc_reInner");
					let h4 = $("<h4>").addClass("tit")
					let a = $("<a>").text(data[i].storeName);
					let p = $("<p>").addClass("addr").text(data[i].storeAddress);
					let area = $("<div>").addClass("area");
					let call = $("<div>").addClass("call").text(data[i].storeTel);
					
					let time = data[i].openYN === 'Y' 
							? $("<div>").addClass(["time", "on"]).text("영업중")
							: $("<div>").addClass("time").text("영업 준비중");
							
					let favYN = data[i].favYN ? "on" : "active";
					
					let fv_reShop_in = $("<div>")
										.addClass("fv_reShop_in")
										.html(`<span>\${data[i].storeFav}</span>명이 관심매장으로 등록했습니다.`);
					let button = $("<button>").addClass(["star", favYN]).on("click", function() {
						favBtnClick(this);
					});
					
					$(area).append(call);
					$(area).append(time);
					
					$(h4).append(a);
					$(div).append(h4);
					$(div).append(p);
					$(div).append(area);
					$(div).append(fv_reShop_in);
					$(div).append(button);
					
					$(li).append(div);
					$("#wordStoreList").append(li);
				}
				$("#mCSB_2_container").css("top", "0");
            }
			, error : function (data, textStatus) {
                console.log('error');
            }
		});
	});
	
	
	
	/* 지역검색 탭 */

	// 시,도가 바꼈을 때
	$("#mainAreaList").on("change", function() {
		let city_id = $(this).val();
		if(city_id == "none") {
			$("#subAreaList option:not(:first)").remove();
			return;
		}
		$.ajax({
			type : 'get'
			, async : true
			, cache: false
			, url : '/store/getDistrict/' + city_id
			, dataType : 'json'
			, success : function(data) {
				if(data == "") {
					$("#subAreaList option:not(:first)").remove();
					return;
				}
				
				console.log(data)
				let select = $("#subAreaList");
				$("#subAreaList option:not(:first)").remove();
				
				for(let i=0; i<data.length; i++) {
					let li = $("<option>").prop({
						value : data[i].cityId
					}).text(data[i].districtName);
					
					$(select).append(li);
				}
            }
			, error : function (data, textStatus) {
                console.log('error');
            }
		});
	});
	
	// 검색 눌렀을 때
	$("#searchAreaButton").on("click", function() {
		let city = $("#mainAreaList > option:selected").val() === "none" ? "" : $("#mainAreaList > option:selected").text();
		let district = $("#subAreaList > option:selected").val() === "none" ? "" : $("#subAreaList > option:selected").text();
		
		let tc = $("#tc_list button.on").next();
		let ps = $("#ps_list button.on").next();
		let tcs = [];
		let pss = [];
		
		for(let i=0; i<tc.length; i++) {
			tcs.push($(tc[i]).val());
		}
		
		for(let i=0; i<ps.length; i++) {
			pss.push($(ps[i]).val());
		}
		
		$.ajax({
            type : 'get'
			, cache: false
			, url : '/store/getStoreList'
			, dataType : 'json'
			, data : {
				city : city
				, district : district
				, tcs : tcs.toString()
				, pss : pss.toString()
			}
			, success : function(data) {
				$("#areaStoreList").empty();
				
				if(data.length == 0) {
					$("#noSearchAreaInfo").show();
					$(".reShop_result > dt > span").text("0");
					return;
				}
				$("#noSearchAreaInfo").hide();
				
				$("#searchAreaDiv .reShop_result > dt > span").text(data.length)
				
				latLngs = new Array();
				for ( var j = 0; j < markers.length; j++ ) {
					markers[j].setMap(null);
				}   
				
				for ( var j = 0; j < overlays.length; j++ ) {
					overlays[j].setMap(null);
				}
				markers = [];
				contents = [];
				overlays = [];
				
				var clickedImage = '/resources/images/store/point_way.png';
				var defaultImage = '/resources/images/store/point_way_gray.png';
				var imageSrc = '/resources/images/store/point_way_gray.png' // 마커이미지의 주소입니다    
			    				, imageSize = new kakao.maps.Size(23, 34) // 마커이미지의 크기입니다
			    				, imageOption = {offset: new kakao.maps.Point(10, 35)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			    				
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				
				for(let i=0; i<data.length; i++) {
					
					latLng = {
							title : data[i].storeName
							, latlng : new kakao.maps.LatLng(data[i].lat, data[i].lng)
					};
					
					// 현재 위치와 매장 거리 계산 시작
					var polyline = new kakao.maps.Polyline({
						path : [
							currentLocation,
							new kakao.maps.LatLng(data[i].lat, data[i].lng)
						],
					 strokeWeight: 2,
					 strokeColor: '#FF00FF',
					 strokeOpacity: 0.8,
					 strokeStyle: 'dashed'
					});
					
					var distance = Math.round(polyline.getLength()/100)/10;
					// 현재 위치와 매장 거리 계산 끝
					
					latLngs.push(latLng);
					
					let li = $("<li>").addClass(data[i].storeId);
					let div = $("<div>").addClass("li_Pc_reInner");
					let h4 = $("<h4>").addClass("tit")
					let a = $("<a>")
						.text(data[i].storeName)
						.attr("href", "javascript:;")
						.on("click", function() {
							map.setCenter(new kakao.maps.LatLng(data[i].lat, data[i].lng));
							map.setLevel(2);
						});
					let span = $("<span>").addClass("store_nearWay").text(distance + 'km');
					let p = $("<p>").addClass("addr").text(data[i].storeAddress);
					let area = $("<div>").addClass("area");
					let call = $("<div>").addClass("call").text(data[i].storeTel);
					
					let time = data[i].openYN === 'Y' 
						? $("<div>").addClass(["time", "on"]).text("영업중")
						: $("<div>").addClass("time").text("영업 준비중");				
					
					let fv_reShop_in = $("<div>")
										.addClass("fv_reShop_in")
										.html(`<span>\${data[i].storeFavorite}</span>명이 관심매장으로 등록했습니다.`);
					// 즐겨찾기 눌렀을 때
					// 로그인 했는지 체크 후
					// db에도 +1 하기
					// ~명이 관심매장으로 등록했습니다. 업데이트
					let favYN = data[i].favYN ? "on" : "active";
					
					let button = $("<button>").addClass(["star", favYN]).on("click", function() {
						favBtnClick(this);
					});
					

					var content = '<div class="way_view" style="background-color:white; padding:20px; width:360px; border:1px solid #888; position:inherit; left:-181px; bottom:66px">' 
						+ '  <h4 class="tit">' + data[i].storeName + '<span class="store_nearWay">' + distance +'km</span>' + '</h4>'
						+ '  <p class="addr" style="white-space: normal;">' + data[i].storeAddress + '</p>'
						+ '  <div class="area">'
						+ '    <div class="call">' + data[i].storeTel + '</div>'
						+ `    <div class="time \${data[i].openYN == 'Y' ? 'on' : ''}">\${data[i].openYN == 'Y' ? '영업 중' : '영업 준비중'}</div>`
						+ '    <div class="fv_reShop_in_DD75_cnt">'
						+ '      <span>' + data[i].storeFavorite + '</span>'
						+ '      명이 관심매장으로 등록했습니다.'
						+ '  </div>'
						+ '</div>'
						+ `<a class="store_btn" onclick="storeDetail('\${data[i].storeId}')">상세정보보기</a>`
						+ `<button class="star \${favYN}" onclick="favBtnClick(this)"/> `
						+ `<button class="wayClose" onclick="closeOverlay(\${i})"/> `;
					
					contents.push(content);
						
					$(area).append(call);
					$(area).append(time);
					
					$(h4).append(a);
					$(h4).append(span);
					$(div).append(h4);
					$(div).append(p);
					$(div).append(area);
					$(div).append(fv_reShop_in);
					$(div).append(button);
					
					$(li).append(div);
					$("#areaStoreList").append(li);
				}
				
				
				
				for (var i = 0; i < latLngs.length; i++) {
					var marker = new kakao.maps.Marker({
				        map: map // 마커를 표시할 지도
				        , position: latLngs[i].latlng // 마커를 표시할 위치
				        , title : latLngs[i].title // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        , image : markerImage
				    });
					markers.push(marker);
					let latlngTemp = latLngs[i].latlng;
					var overlay = new kakao.maps.CustomOverlay({
				        content: contents[i],
				        //map: map,
				        position: marker.getPosition()       
				    });
					overlays.push(overlay);
					
					kakao.maps.event.addListener(marker, 'click', (function (marker, overlay) {					
				        return function () {
				        	for (var j = 0; j < overlays.length; j++) {
								overlays[j].setMap(null);
							}
				        	for (var j = 0; j < markers.length; j++) {
				        		markers[j].setImage(new kakao.maps.MarkerImage(defaultImage, new kakao.maps.Size(23, 34)));
							}
				            overlay.setMap(map);
				            marker.setImage(new kakao.maps.MarkerImage(clickedImage, new kakao.maps.Size(28, 39)));
				            map.setCenter(latlngTemp);
				        };
				    })(marker, overlay));
				}
				
			    // 지도 중심을 이동 시킵니다
			    map.setCenter(latLngs[0].latlng);
			    map.setLevel(3);
			    $("#mCSB_3_container").css("top", "0");
			    //$(".sroll_store").mCustomScrollbar("update");
				
                
            }
			, error : function (data, textStatus) {
               console.log('error');
            }
        });
	});
	
	
	// 지역검색 눌렀을 때 자동 클릭되게 만듬
	$("#searchAreaTab").on("click", function() {	
		$("#searchAreaButton").click();
	})
	
	
	/* 관심매장 탭  */
	
	// 관심매장 탭을 눌렀을 때
	$("#searchFavorTab").on("click", function() {
		if(${not empty userName} ) {
			$("#favorStoreList").hide();
	        $("#favorStoreInfo").hide();
	        $("#noFavorStoreInfo").hide();
	        $("#noLoginInfo").hide();
	        
	        let tc = $("#tc_list button.on").next();
			let ps = $("#ps_list button.on").next();
			let tcs = [];
			let pss = [];
			
			for(let i=0; i<tc.length; i++) {
				tcs.push($(tc[i]).val());
			}
			
			for(let i=0; i<ps.length; i++) {
				pss.push($(ps[i]).val());
			}
	        
	        $.ajax({
				type : 'post'
				, cache: false
				, url : '/store/getInterestShopList'
				, dataType : 'json'
				, data : {
					tcs : tcs.toString()
					, pss : pss.toString()
					, '${_csrf.parameterName }' : '${_csrf.token }'
				}
				, success : function(data) {
					console.log(data)
					
					if(data.length < 1) {
			        	$("#noFavorStoreInfo .no_list").empty();
			        	let dt = $("<dt>").html("${userName} 님이<br>등록하신 관심매장이 없습니다.");
			        	let dd = $("<dd>").html("자주 가는 매장을 관심매장으로 등록하면 매장소식을 <br>빠르게 받아 보실 수 있습니다.");
			        	$("#noFavorStoreInfo > dl").append(dt).append(dd);
			        	$("#noFavorStoreInfo").show();
			        } else {
			        	$("#favorStoreInfo").empty();
			        	let p = $("<p>").html(`<b>${userName}</b>님이 <br>등록하신`
			        			+ `<span>관심매장은 총 <b>\${data.length}</b>개</span>입니다`);
			        	let div = $("<div>").addClass("urNotice")
			        		.html("<p>매장 상황에 따라 매장별 실 영업시간이 다를 수 있습니다.</p>")
			        	
			        	$("#favorStoreInfo").append(p).append(div);
			        	$("#favorStoreInfo").show();
			        
						$("#favorStoreList").empty();
						
						for(let i=0; i<data.length; i++) {
							let li = $("<li>").addClass(data[i].storeId);
							let div = $("<div>").addClass("li_Pc_reInner");
							let h4 = $("<h4>").addClass("tit")
							let a = $("<a>").text(data[i].storeName);
							let p = $("<p>").addClass("addr").text(data[i].storeAddress);
							let area = $("<div>").addClass("area");
							let call = $("<div>").addClass("call").text(data[i].storeTel);
							
							let time = data[i].openYN === 'Y' 
								? $("<div>").addClass(["time", "on"]).text("영업중")
								: $("<div>").addClass("time").text("영업 준비중");
							
							let fv_reShop_in = $("<div>")
												.addClass("fv_reShop_in")
												.html(`<span>\${data[i].storeFavorite}</span>명이 관심매장으로 등록했습니다.`);
							// 즐겨찾기 눌렀을 때
							// 로그인 했는지 체크 후
							// db에도 +1 하기
							// ~명이 관심매장으로 등록했습니다. 업데이트
							let button = $("<button>").addClass(["star", "on"]).on("click", function() {
								let logonCheck = ${not empty userName};
								if(!logonCheck) {
									let check = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
									if(check) {
										location.href = '/auth/login';
									}
									return;
									// return;
								} 
								let clickCheck = 0;
								
								if($(this).hasClass("active")) {
									$(this).removeClass("active").addClass("on");
									clickCheck = 1;
								} else {
									$(this).removeClass("on").addClass("active");
									clickCheck = -1;
								}
								
								let cnt = $(this).prev().children("span").html();
								$(this).prev().children("span").html(Number(cnt) + clickCheck);
								$("#favorStoreInfo > p > span > b").html(function(index, currentHtml) {
									return Number(currentHtml) + clickCheck;
								});
								
								let storeId = $(this).parent().parent().attr("class");
								
								$.ajax({
									type : 'POST'
									, cache: false
									, url : '/store/setStoreFavorite'
									, dataType : 'text'
									, data : {
										storeId : storeId
										, clickCheck : clickCheck
										, '${_csrf.parameterName }' : '${_csrf.token }'
									}
									, success : function(data) {
										console.log("즐겨찾기 업데이트 완료~~")
						            }
									, error : function (data, textStatus) {
						                console.log('error');
						            }
								});
							});
		
							$(area).append(call);
							$(area).append(time);
							
							$(h4).append(a);
							$(div).append(h4);
							$(div).append(p);
							$(div).append(area);
							$(div).append(fv_reShop_in);
							$(div).append(button);
							
							$(li).append(div);
							$("#favorStoreList").append(li);
							$("#favorStoreList").show();
						}
			        }
	            }
				, error : function (data, textStatus) {
	                console.log('error');
	            }
			});
		}   	
	})
	
	// 로그인이 안 되어 있을 시 로그인 버튼을 눌렀을 때
	$(".no_login a").on("click", function() {
		location.href = '<c:url value="/auth/login"/>';
	})
	
	
	// 적용하기 버튼을 눌렀을 때
	$(".btnSmall.choice_btn").on("click", function() {
		let keyword = $("#searchWord").val();
		let tc = $("#tc_list button.on").next();
		let ps = $("#ps_list button.on").next();
		let tcs = [];
		let pss = [];
		
		for(let i=0; i<tc.length; i++) {
			tcs.push($(tc[i]).val());
		}
		
		for(let i=0; i<ps.length; i++) {
			pss.push($(ps[i]).val());
		}
		
		let tabName = $("#TabsOpenArea > li.on").find("a").text();
		if(tabName == "직접검색") {
			$.ajax({
	            type : 'get'
				, async : true
				, cache: false
				, url : '/store/getStoreKeyword'
				, dataType : 'json'
				, data : {
					tcs : tcs.toString()
					, pss : pss.toString()
					, keyword : keyword
				}
				, success : function(data) {
					$("#wordStoreList").empty();
					
					if(data.length == 0) {
						$(".choice_opSt").slideDown();
						$("#noSearchWordInfo").show();
						$("#searchWordDiv .reShop_result > dt > span").text("0");
						return;
					}
					$("#noSearchWordInfo").hide();
					$("#searchWordDiv .reShop_result > dt > span").text(data.length)
					for(let i=0; i<data.length; i++) {
						let li = $("<li>").addClass(data[i].storeId);
						let div = $("<div>").addClass("li_Pc_reInner");
						let h4 = $("<h4>").addClass("tit")
						let a = $("<a>").text(data[i].storeName);
						let p = $("<p>").addClass("addr").text(data[i].storeAddress);
						let area = $("<div>").addClass("area");
						let call = $("<div>").addClass("call").text(data[i].storeTel);
						
						let time = data[i].openYN === 'Y' 
							? $("<div>").addClass(["time", "on"]).text("영업중")
							: $("<div>").addClass("time").text("영업 준비중");
						
						let fv_reShop_in = $("<div>")
											.addClass("fv_reShop_in")
											.html(`<span>\${data[i].storeFavorite}</span>명이 관심매장으로 등록했습니다.`);
						// 즐겨찾기 눌렀을 때
						// 로그인 했는지 체크 후
						// db에도 +1 하기
						// ~명이 관심매장으로 등록했습니다. 업데이트
						let button = $("<button>").addClass(["star", "active"]).on("click", function() {
							favBtnClick(this);
						});
						
						$(area).append(call);
						$(area).append(time);
						
						$(h4).append(a);
						$(div).append(h4);
						$(div).append(p);
						$(div).append(area);
						$(div).append(fv_reShop_in);
						$(div).append(button);
						
						$(li).append(div);
						$("#wordStoreList").append(li);
					} 
					
					$(".choice_opSt").slideDown();
	                console.log(data);
	            }
				, error : function (data, textStatus) {
	               console.log('error');
	            }
	        });
		} else if(tabName == "지역검색") {
			let city = $("#mainAreaList > option:selected").val() === "none" ? "" : $("#mainAreaList > option:selected").text();
			let district = $("#subAreaList > option:selected").val() === "none" ? "" : $("#subAreaList > option:selected").text();
			$.ajax({
	            type : 'get'
				, cache: false
				, url : '/store/getStoreList'
				, dataType : 'json'
				, data : {
					city : city 
					, district : district
					, tcs : tcs.toString()
					, pss : pss.toString()
				}
				, success : function(data) {
					$("#areaStoreList").empty();
					
					if(data.length == 0) {
						$("#noSearchAreaInfo").show();
						$(".reShop_result > dt > span").text("0");
						return;
					}
					$("#noSearchAreaInfo").hide();
					$("#searchAreaDiv .reShop_result > dt > span").text(data.length)
					for(let i=0; i<data.length; i++) {
						let li = $("<li>").addClass(data[i].storeId);
						let div = $("<div>").addClass("li_Pc_reInner");
						let h4 = $("<h4>").addClass("tit")
						let a = $("<a>").text(data[i].storeName);
						let p = $("<p>").addClass("addr").text(data[i].storeAddress);
						let area = $("<div>").addClass("area");
						let call = $("<div>").addClass("call").text(data[i].storeTel);
						
						let time = data[i].openYN === 'Y' 
							? $("<div>").addClass(["time", "on"]).text("영업중")
							: $("<div>").addClass("time").text("영업 준비중");
						
						let fv_reShop_in = $("<div>")
											.addClass("fv_reShop_in")
											.html(`<span>\${data[i].storeFavorite}</span>명이 관심매장으로 등록했습니다.`);
						// 즐겨찾기 눌렀을 때
						// 로그인 했는지 체크 후
						// db에도 +1 하기
						// ~명이 관심매장으로 등록했습니다. 업데이트
						let button = $("<button>").addClass(["star", "active"]).on("click", function() {
							favBtnClick(this);
						});
						
						$(area).append(call);
						$(area).append(time);
						
						$(h4).append(a);
						$(div).append(h4);
						$(div).append(p);
						$(div).append(area);
						$(div).append(fv_reShop_in);
						$(div).append(button);
						
						$(li).append(div);
						$("#areaStoreList").append(li);
					}
					$(".choice_opSt").hide();
	                // console.log(data);
	            }
				, error : function (data, textStatus) {
	               console.log('error');
	            }
	        });
		} else if(tabName == "관심매장") {
			if(${empty userName}) {
				$("#favorStoreList").hide();
		        $("#favorStoreInfo").hide();
		        $("#noFavorStoreInfo").hide();
		        $("#noLoginInfo").show();
			} else {
				$("#favorStoreList").hide();
		        $("#favorStoreInfo").hide();
		        $("#noFavorStoreInfo").hide();
		        $("#noLoginInfo").hide();
		        
		        $.ajax({
					type : 'post'
					, async : true
					, cache: false
					, url : '/store/getInterestShopList'
					, dataType : 'json'
					, data : {
						tcs : tcs.toString()
						, pss : pss.toString()
						, '${_csrf.parameterName }' : '${_csrf.token }'
					}
					, success : function(data) {
						console.log(data)
						if(data.length < 1) {
				        	$("#noFavorStoreInfo .no_list").empty();
				        	let dt = $("<dt>").html("${userName} 님이<br>등록하신 관심매장이 없습니다.");
				        	let dd = $("<dd>").html("자주 가는 매장을 관심매장으로 등록하면 매장소식을 <br>빠르게 받아 보실 수 있습니다.");
				        	$("#noFavorStoreInfo > dl").append(dt).append(dd);
				        	$("#noFavorStoreInfo").show();
				        	if(stores == "") {
				        		$("#noFavorStoreInfo").hide();
				        		$("#noSearchFavorInfo").show();
				        	}
				        } else {
				        	$("#noSearchFavorInfo").hide();
				        	$("#favorStoreInfo").empty();
				        	let p = $("<p>").html(`<b>${userName}</b>님이 <br>등록하신`
				        			+ `<span>관심매장은 총 <b>\${data.length}</b>개</span>입니다`);
				        	let div = $("<div>").addClass("urNotice")
				        		.html("<p>매장 상황에 따라 매장별 실 영업시간이 다를 수 있습니다.</p>")
				        	
				        	$("#favorStoreInfo").append(p).append(div);
				        	$("#favorStoreInfo").show();
				        
							$("#favorStoreList").empty();
							
							for(let i=0; i<data.length; i++) {
								let li = $("<li>").addClass(data[i].storeId);
								let div = $("<div>").addClass("li_Pc_reInner");
								let h4 = $("<h4>").addClass("tit")
								let a = $("<a>").text(data[i].storeName);
								let p = $("<p>").addClass("addr").text(data[i].storeAddress);
								let area = $("<div>").addClass("area");
								let call = $("<div>").addClass("call").text(data[i].storeTel);
								
								let date = new Date();
								let hour = date.getHours() + "";
								let curTime = hour.padStart(2, '0') + ":" + date.getMinutes();
								let weekday = data[i].weekday;
								let weekdays = weekday.split(" - ");
								let time;
								if(weekdays[0] <= curTime && curTime <= weekdays[1]) {
									time = $("<div>").addClass(["time", "on"]).text("영업중");
								} else {
									time = $("<div>").addClass("time").text("영업 준비중");
								}
								
								
								let fv_reShop_in = $("<div>")
													.addClass("fv_reShop_in")
													.html(`<span>\${data[i].storeFavorite}</span>명이 관심매장으로 등록했습니다.`);
								// 즐겨찾기 눌렀을 때
								// 로그인 했는지 체크 후
								// db에도 +1 하기
								// ~명이 관심매장으로 등록했습니다. 업데이트
								let button = $("<button>").addClass(["star", "on"]).on("click", function() {
									let logonCheck = true;<%-- <%= logonCheck%> --%>
									if(!logonCheck) {
										let check = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
										if(check) {
											location.href = '/auth/login';
										}
										return;
										// return;
									} 
									let clickCheck = 0;
									
									if($(this).hasClass("active")) {
										$(this).removeClass("active").addClass("on");
										clickCheck = 1;
									} else {
										$(this).removeClass("on").addClass("active");
										clickCheck = -1;
									}
									
									let cnt = $(this).prev().children("span").html();
									$(this).prev().children("span").html(Number(cnt) + clickCheck);
									$("#favorStoreInfo > p > span > b").html(function(index, currentHtml) {
										return Number(currentHtml) + clickCheck;
									});
									
									let store_id = $(this).parent().parent().attr("class");
									
									$.ajax({
										type : 'post'
										, cache: false
										, url : '/store/setStoreFavorite'
										, dataType : 'text'
										, data : {
											store_id : store_id
											, clickCheck : clickCheck
											, '${_csrf.parameterName }' : '${_csrf.token }'
										}
										, success : function(data) {
											console.log("즐겨찾기 업데이트 완료~~")
							            }
										, error : function (data, textStatus) {
							                console.log('error');
							            }
									});
								});
		
								$(area).append(call);
								$(area).append(time);
								
								$(h4).append(a);
								$(div).append(h4);
								$(div).append(p);
								$(div).append(area);
								$(div).append(fv_reShop_in);
								$(div).append(button);
								
								$(li).append(div);
								$("#favorStoreList").append(li);
							} // for
							$("#favorStoreList").show();
				        }
						
		            }
					, error : function (data, textStatus) {
		                console.log('error');
		            }
				});
		        
		        
			}
				$(".choice_opSt").hide();
		} else if(tabName == "판매매장 찾기") {
			if(!$("#searchProductId").val()) {
				return;
			}
			
			$.ajax({
				type : 'get'
				, cache: false
				, url : '/store/getStoreStockList/' + $("#searchProductId").val()
				, dataType : 'json'
				, data : {
					tcs : tcs.toString()
					, pss : pss.toString()
				}
				, success : function(data) {
					// console.log(data);
					
					$("#itemStoreList").empty();
					$("#mCSB_4_container").css("top", "0");
					for(var i=0; i<data.length; i++) {
						let li = $("<li>").addClass(data[i].storeId);
						let div = $("<div>").addClass("li_Pc_reInner");
						let h4 = $("<h4>").addClass("tit")
						let a = $("<a>").text(data[i].storeName);
						let p = $("<p>").addClass("addr").text(data[i].storeAddress);
						let area = $("<div>").addClass("area");
						let call = $("<div>").addClass("call").text(data[i].storeTel);
						
						let time = data[i].openYN === 'Y' 
								? $("<div>").addClass(["time", "on"]).text("영업중")
								: $("<div>").addClass("time").text("영업 준비중");
								
						let favYN = data[i].favYN ? "on" : "active";
						
						let store_amount = $("<div>")
											.addClass("store_amount")
											.html(function() {
											let stock_info = `
												<dl><dt class='amount_chk\${data[i].stockCheck}'>\${data[i].stockMessage}</dt></dl>
											`;
											if(data[i].stockCnt == 0) {
												stock_info += `<dd><a href='javascript:;'>입고 알림 신청</a></dd>`
											}
											
											return stock_info;
										});
						let button = $("<button>").addClass(["star", favYN]).on("click", function() {
							favBtnClick(this);
						});
						
						$(area).append(call);
						$(area).append(time);
						
						$(h4).append(a);
						$(div).append(h4);
						$(div).append(p);
						$(div).append(area);
						$(div).append(store_amount);
						$(div).append(button);
						
						$(li).append(div);
						$("#itemStoreList").append(li);
						
					}
					$(".choice_opSt").hide();
					
	            }
				, error : function (data, textStatus) {
	                console.log('error');
	            }
			});
		}
			
	})
	
	// 검색어 입력했을 때
	$("#searchItem").on("input", function() {
		let store_schInner = $("#searchItemDiv > div > div.store_sch > div.store_schInner");
		if($(this).val().length >= 2) {
			let keyword = $(this).val();
			$.ajax({
				type : 'get'
				, cache: false
				, url : '/store/getProductName/' + keyword
				, dataType : 'json'
				, success : function(data) {
					// console.log(data);
					
					if(data.length > 0 ) {
						$(store_schInner).find(".auto_reSch").remove();
						$(store_schInner).addClass("on");
						let div = $("<div>").addClass("auto_reSch");
						let ul = $("<ul>").addClass("ul_auto_reSch scrbar");
						let li;
						$(data).each(function(i) {
							li = $("<li>").html(`<a href="javascript:;" id="\${this.productDisplayId}" data-productId="\${this.productId}" data-productDisplayId="\${this.productDisplayId}">`
									+ this.productDisplayName.replace(keyword, '<span>'+keyword+'</span>')
									+ `</a>`);
							$(ul).append(li);
						});
						$(div).append(ul);
						$(store_schInner).append(div);
					} else {
						$(store_schInner).removeClass("on");
						$(store_schInner).find(".auto_reSch").remove();
					}
	            }
				, error : function (data, textStatus) {
	                console.log('error');
	            }
			});
		} else {
			$(store_schInner).find(".auto_reSch").remove();
			$(store_schInner).removeClass("on");
		}
	});
	
	// 검색어 리스트를 눌렀을 때
	$(".store_schInner").on("click", ".auto_reSch a", function() {
		let store_schInner = $("#searchItemDiv > div > div.store_sch > div.store_schInner");
		$(store_schInner).find(".auto_reSch").remove();
		$(store_schInner).removeClass("on");
		$("#searchItem").val("");
		$("#searchProductId").val($(this).data("productid"));
		
		// 검색어 리스트 누른 상품 가져오기
		$.ajax({
			type : 'get'
			, cache: false
			, url : '/store/getProduct/' + $(this).data("productdisplayid")
			, dataType : 'json'
			, success : function(data) {
				// console.log(data);
				
				$(".store_sch .store_schInner").nextAll().remove();
				
				let content = `
					<div class="store_pdTit">
						<a href="javascript:window.open('<c:url value='/store/goods?productDisplayId=\${data.productDisplayId}'/>', '_blank')" id="\${data.productDisplayId}" class="go_detail">
							<dt>
								<div class="imgArea">
									<img src="\${data.productDisplaySrc}" alt="">
								</div>
							</dt>
							<dd>
								<p class="brand">\${data.brandName}</p>
								<p class="tit">\${data.productDisplayName}</p>
							</dd>
						</a>
					</div>
					<p class="reShop_msg">실제 수량과 다를 수 있어 정확한 재고는 매장으로 확인해 주세요.</p>
				`;
				
				$("#searchItemDiv .store_schInner").after(content);
            }
			, error : function (data, textStatus) {
                console.log('error');
            }
		});
		
		let tc = $("#tc_list button.on").next();
		let ps = $("#ps_list button.on").next();
		let tcs = [];
		let pss = [];
		
		for(let i=0; i<tc.length; i++) {
			tcs.push($(tc[i]).val());
		}
		
		for(let i=0; i<ps.length; i++) {
			pss.push($(ps[i]).val());
		}
		
		// 매장 리스트 + 재고 여부
		$.ajax({
			type : 'get'
			, cache: false
			, url : '/store/getStoreStockList/' + $(this).data("productid")
			, dataType : 'json'
			, data : {
				tcs : tcs.toString()
				, pss : pss.toString()
			}
			, success : function(data) {
				// console.log(data);
				
				$("#itemStoreList").empty();
				$("#mCSB_4_container").css("top", "0");
				for(var i=0; i<data.length; i++) {
					let li = $("<li>").addClass(data[i].storeId);
					let div = $("<div>").addClass("li_Pc_reInner");
					let h4 = $("<h4>").addClass("tit")
					let a = $("<a>").text(data[i].storeName);
					let p = $("<p>").addClass("addr").text(data[i].storeAddress);
					let area = $("<div>").addClass("area");
					let call = $("<div>").addClass("call").text(data[i].storeTel);
					
					let time = data[i].openYN === 'Y' 
							? $("<div>").addClass(["time", "on"]).text("영업중")
							: $("<div>").addClass("time").text("영업 준비중");
							
					let favYN = data[i].favYN ? "on" : "active";
					
					let store_amount = $("<div>")
										.addClass("store_amount")
										.html(function() {
											let stock_info = `
												<dl><dt class='amount_chk\${data[i].stockCheck}'>\${data[i].stockMessage}</dt></dl>
											`;
											if(data[i].stockCnt == 0) {
												stock_info += `<dd><a href='javascript:;'>입고 알림 신청</a></dd>`
											}
											
											return stock_info;
										});
					let button = $("<button>").addClass(["star", favYN]).on("click", function() {
						favBtnClick(this);
					});
					
					$(area).append(call);
					$(area).append(time);
					
					$(h4).append(a);
					$(div).append(h4);
					$(div).append(p);
					$(div).append(area);
					$(div).append(store_amount);
					$(div).append(button);
					
					$(li).append(div);
					$("#itemStoreList").append(li);
					
				}
				
            }
			, error : function (data, textStatus) {
                console.log('error');
            }
		});
	});
	
	// 베스트 상품 select박스 눌렀을 시
	$("#store_viewPop_renew").on("change", ".bestSelect select", function() {
		let userAge = $("#selAge").val();
		let userGender = $("#selGen").val();
		let categoryLargeId = $("#selCate").val();
		
		$.ajax({
			type : 'get'
			, cache: false
			, url : '/store/getStoreBestProduct'
			, dataType : 'json'
			, data : {
				userAge : userAge
				, userGender : userGender
				, categoryLargeId : categoryLargeId
			}
			, success : function(data) {
				// console.log(data);
				$("#storeBestProdArea").empty();
				if(data.length == 0) {
					$("#storeBestProdArea").html('<div class="no_strPrd"><dl class="no_list"><dt>설정하신 조건에 해당하는<br>베스트 상품이 없어요</dt></dl></div>');
					return;
				}
				
				let content = `<ul class='slide_list'>`;
				
				for (var i = 0; i < data.length; i++) {
					content += `
						<li>
							<div class="box">
								<a href="<c:url value='/store/goods?productDisplayId=\${data[i].productDisplayId}'/>" class="item a_detail">
									<span class="thumb_flag best">\${i+1}</span>
									<span class="thumImg">
										<img src="\${data[i].productDisplaySrc}" alt="립리프 스티밍 립 마스크">
									</span>
									<div class="prd_name"><p class="tx_name">\${data[i].productDisplayName}</p></div>
									<p class="prd_price">
										<span class="tx_cur"><span class="tx_num">\${data[i].minprice}</span>원 </span>
									</p>
									<p class="prd_flag">
									`;
									if(data[i].discountflag == '1') 
										content += '<span class="icon_flag sale">세일</span>';
									if(data[i].couponflag == '1') 
										content += '<span class="icon_flag coupon">쿠폰</span>';
									if(data[i].presentflag == '1') 
										content += '<span class="icon_flag gift">증정</span>';
									if(data[i].todaypickupflag == '1') 
										content += '<span class="icon_flag delivery">오늘드림</span>';
					content += `	</p>
								</a>
								<button class="btn_zzim jeem" data-goodsno="\${data[i].productDisplayId}">
									<span>찜하기전</span>
								</button>
								<button type="button" class="btnbag2" onclick="">장바구니 담기</button>
							</div>
						</li>
					`;
				}
				
				content += `</ul>`;
				
				$("#storeBestProdArea").html(content);
            }
			, error : function (data, textStatus) {
                console.log('error');
            }
		});
	});
	
	$("#store_viewPop_renew").on("click", '.btn_zzim.jeem', function() {
		let productLikeBtn = $(this);
		let productDisplayId = $(this).data("goodsno");
		
		toggleLikeItemStatus(productLikeBtn, productDisplayId);
		
	}) // .btn_zzim.jeem func close
	
	function toggleLikeItemStatus(productLikeBtn, productDisplayId) {
		$.ajax({
			url: "/productLikeToggle",
			method:"GET",
			cache:false,
			
			data:{
				productDisplayId:productDisplayId
			},
			success: function (result) {
				if (result === "true" ) {
					console.log('success : toggleLikeStatus:'+result);
					$(".layerAlim.zzimOn.wishPrd").show();
					$(".layerAlim.zzimOn.wishPrd").fadeOut(2000);   
					
					$(productLikeBtn).addClass("on");
	            } else {
	            	console.log('false : toggleLikeStatus: ' + result);
	            	$(".layerAlim.zzimOff.wishPrd").show();
	            	$(".layerAlim.zzimOff.wishPrd").fadeOut(2000);
	                $(productLikeBtn).removeClass("on");
	            } //if
			}, error : function (xhr, data, textStatus) {
				if (xhr.status == 401) {
	                   alert("로그인 후 이용가능 합니다.");
	                   window.location.href = "/auth/login";   
	            }else{
	                   alert("서버 에러") 
	            }
	        } // success , error
		}) // ajax
	} // toggleLikeItemStatus
	
})

</script>

</body>
<script src="/resources/js/swiper.js"></script>

</html>