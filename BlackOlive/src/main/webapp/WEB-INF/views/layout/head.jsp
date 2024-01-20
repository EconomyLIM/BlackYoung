<%@page import="com.blackolive.app.service.head.HeadServiceImpl"%>
<%@page import="com.blackolive.app.domain.head.TotalListDTO"%>
<%@page import="com.blackolive.app.domain.head.CategoryMidDTO"%>
<%@page import="com.blackolive.app.domain.head.CategoryLargeDTO"%>

<%@page import="java.util.Map"%>

<%@page import="java.util.List"%>

<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="/WEB-INF/inc/include.jspf"%>
<%--<%@ include file="/WEB-INF/inc/session_auth.jspf"%> --%>
<%

  // HeadServiceImpl headServiceImpl = new
  
  
/* 
	HeadService headService = HeadService.getInstance();
	Map<CateLDTO, List<CateMDTO>> bHash = headService.sGetCate(1);
	request.setAttribute("bHash", bHash);
	Map<CateLDTO, List<CateMDTO>> hHash = headService.sGetCate(2);
	request.setAttribute("hHash", hHash);
	Map<CateLDTO, List<CateMDTO>> lHash = headService.sGetCate(3);
	request.setAttribute("lHash", lHash);
	 */
%>
<script src="/resources/js/head.js"></script>
	<script>
	
	
	$(function() {
		let mainurl = window.location.href
		console.log(mainurl)
		if (mainurl ==='http://localhost/') {
			$('.main_cate_wrap').css("display",'block');
		}
		
		
	})
</script>
	<!-- 3200210 큐레이션 개선 관련 건-레코벨 데이터 송부 
<input type="hidden" id="skinType" name="skinType" value="" />
<input type="hidden" id="skinTorn" name="skinTorn" value="" />
<input type="hidden" id="skinIssue" name="skinIssue" value="" />
-->
<sec:authorize access="isAuthenticated()">
	<script>
	let storesNames = [];
	// 관심매장 이름 리스트 얻어오기
	$.ajax({
		type : 'post'
		, cache: false
		, url : '/store/getInterestShopList'
		, data : {
			'${_csrf.parameterName }' : '${_csrf.token }'
		}
		, dataType : 'json'
		, success : function(data) {
			// console.log(data);
			if(data.length > 0) {
				let storeNames = []
				for (var i = 0; i < data.length; i++) {
					storeNames.push(data[i].storeName);
				}
				$(".store .alim_box").html(`<p class="store_desc"><span><sec:authentication property="principal.member.userName"/></span>님께서 등록하신 관심매장<br><span>\${storeNames.join(",")}</span>의 <br> 최근 행사공지가 없습니다.</p>` 
								+ '<button class="mymenu_btn" onclick="javascript:;">다른매장 소식보기</button>')
			} else {
				$(".store .alim_box").html('<p class="store_desc"><span><sec:authentication property="principal.member.userName"/></span>님의 관심매장을 등록해 주세요.<br>새로운 이벤트와 세일행사를 빠르게 알려드립니다.</p>'
						+ `<button class="mymenu_btn" onclick="javascript:location.href='<c:url value='store/getStoreMain'/>'";>관심매장 등록하기</button>`)
			}
        } 
		, error : function (data, textStatus) {
     		console.log(data);
     		console.log('error');
        }
	});
	</script>							
</sec:authorize>
	<div class="infoUpgr" style="display: none;">
		<p>
			<a class="ie"
				href="https://www.microsoft.com/ko-kr/download/internet-explorer.aspx"
				target="_blank">ie 업그레이드</a> <a class="cr"
				href="https://www.google.co.kr/chrome/browser/desktop/"
				target="_blank">크롬 업그레이드</a> <a class="ff"
				href="https://www.mozilla.org/ko/firefox/new/" target="_blank">파폭
				업그레이드</a> <a class="op" href="http://www.opera.com/ko/download"
				target="_blank">오페라 업그레이드</a>
		</p>
	</div>
	<div id="todayDeliveryPopup">
		<!-- 배송지 등록 레이어 팝업 -->
		<div class="layer_pop_wrap w850" id="tddlvr_regDelivery"
			style="z-index: 999;">
			<div class="layer_cont2">
				<h2 class="layer_title">배송지 등록</h2>
				<div class="layer_scroll_box">
					<!-- 배송지/환불계좌 등록 -->
					<table class="board-write-2s">
						<caption>배송지/환불계좌 등록</caption>
						<colgroup>
							<col style="width: 25%;">
							<col style="width: 75%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="AddressChoice">배송지명</label></th>
								<td class="star"><input type="text" id="tddlvr_AddressName"
									title="배송지를 입력하세요" placeholder="최대 10자" data-required="true"
									style="width: 200px;" maxlength="10"> <input
									type="checkbox" id="tddlvr_baseAddressCheckBox"> <label
									for="BasiceAddress">기본 배송지 설정</label></td>
							</tr>
							<tr>
								<th scope="row"><label for="Recipient">받는 분</label></th>
								<td class="star"><input type="text" id="tddlvr_Recipient"
									title="받는분을 입력하세요" placeholder="최대 10자" data-required="true"
									style="width: 200px;" maxlength="10"></td>
							</tr>
							<tr>
								<th scope="row"><label for="tddlvr_PhoneNumber1">연락처
										1</label></th>
								<td class="star"><select id="tddlvr_PhoneNumber1"
									title="통신사를 선택하세요" data-required="true" style="width: 90px;">
										<option>010</option>
										<option>011</option>
								</select> <span class="desc">-</span> <input id="tddlvr_PhoneNumber2"
									type="text" maxlength="4" title="휴대전화 번호 가운데 4자리를 입력하세요"
									data-required="true" style="width: 90px;"
									onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									<span class="desc">-</span> <input id="tddlvr_PhoneNumber3"
									type="text" maxlength="4" title="휴대전화 번호 마지막 4자리를 입력하세요"
									data-required="true" style="width: 90px;"
									onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="tddlvr_SecondPhoneNumber1">연락처
										2</label></th>
								<td style="padding-left: 36px;"><select
									id="tddlvr_SecondPhoneNumber1" title="통신사를 선택하세요"
									style="width: 90px;">
										<option>010</option>
										<option>011</option>
								</select> <span class="desc">-</span> <input
									id="tddlvr_SecondPhoneNumber2" type="text" maxlength="4"
									title="휴대전화 번호 가운데 4자리를 입력하세요" style="width: 90px;"
									onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									<span class="desc">-</span> <input
									id="tddlvr_SecondPhoneNumber3" type="text" maxlength="4"
									title="휴대전화 번호 마지막 4자리를 입력하세요" style="width: 90px;"
									onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
								</td>
							</tr>
							<tr class="addr">
								<th scope="row"><label for="">주소</label></th>
								<td class="star"><input id="tddlvr_postCode" type="text"
									title="주소를 입력하세요." disabled="disabled" data-required="true"
									style="width: 90px;">
									<button id="tddlvr_postButton" type="button" class="btnPost">우편번호</button>
									<!-- 2016-12-28 삭제 <div class="interval"><input type="text" disabled="disabled" title="주소를 입력하세요" style="width:500px;"></div> -->
									<!-- 신규 삽입 -->
									<p id="tddlvr_roadDetails" class="road">
										도로명 : <br> <span class="data">지&nbsp; &nbsp;번 : </span>
									</p> <!-- //신규 삽입 --> <input id="tddlvr_detailAddress" type="text"
									title="상세주소를 입력하세요." placeholder="상세주소를 입력하세요."
									data-required="true" style="width: 500px;" maxlength="30">
								</td>
							</tr>
						</tbody>
					</table>
					<!-- //배송지/환불계좌 등록 -->
					<!-- 배송 요청사항 -->
					<div id="tddlvr_pickupHide5" style="overflow: hidden">
						<div class="title_wrap">
							<h2 class="sub-title2">배송 요청사항</h2>
						</div>
						<table class="tbl_inp_form important">
							<caption></caption>
							<colgroup>
								<col style="width: 170px">
								<col style="width: *">
							</colgroup>
							<tbody>
								<tr type="exist">
									<th scope="row">공동현관 출입방법</th>
									<td class="imp_data"><span class="chk_area mgzero"><input
											type="radio" id="tddlvr_btn_door_manner_temp1"
											name="tddlvr_o2oVisitTypeSp" disabled="" data-required="true"
											value="1"><label for="tddlvr_btn_door_manner_temp1">비밀번호</label></span>
										<span class="chk_area"><input type="radio"
											id="tddlvr_btn_door_manner_temp2"
											name="tddlvr_o2oVisitTypeSp" disabled="" value="2"><label
											for="tddlvr_btn_door_manner_temp2">경비실 호출</label></span> <span
										class="chk_area"><input type="radio"
											id="tddlvr_btn_door_manner_temp3"
											name="tddlvr_o2oVisitTypeSp" disabled="" value="3"><label
											for="tddlvr_btn_door_manner_temp3">자유출입가능</label></span> <span
										class="chk_area"><input type="radio"
											id="tddlvr_btn_door_manner_temp4"
											name="tddlvr_o2oVisitTypeSp" disabled="" value="4"><label
											for="tddlvr_btn_door_manner_temp4">기타사항</label></span></td>
								</tr>
								<tr id="quickAreaValuesRow" type="exist">
									<th id="tddlvr_radioDescripter" scope="row">공동현관 비밀번호</th>
									<td class="imp_data"><input type="text"
										id="tddlvr_quickAreaDesc" name="tddlvr_o2oVisitTypeDesc"
										value="" class="inpH28" title="공동현관 출입방법 상세내용을 입력하세요."
										disabled="" data-required="true" maxlength="20"
										style="width: 500px"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--// 배송 요청사항-->
					<div class="usage-guide">
						<p class="ptit">개인정보수집·이용 안내</p>
						<ul>
							<li>개인정보 수집 목적 : 상품구매 시 배송처리</li>
							<li>개인정보 수집 항목 : 배송지명 , 수령인정보 (받는분 , 연락처 , 주소, 공동현관 출입방법:
								비밀번호)</li>
							<li>보유 및 이용기간 : <b>정보 삭제 또는 회원 탈퇴 시까지</b></li>
							<li>확인 버튼을 누르지 않을 경우 배송지 정보가 저장되지 않습니다.</li>
						</ul>
					</div>
					<p class="txt_ct mgT20">
						<input type="checkbox" id="dlvSaveAgreeCheck">위 개인정보
						수집·이용을 확인하고 배송지를 등록합니다.
					</p>
					<div class="area1sButton mgT20">
						<a id="registDeliveryAddressButton" href="#none" class="btnGreen">등록</a>
						<a id="cancelDeliveryAddressButton" href="#none" class="btnGray">취소</a>
					</div>
				</div>
				<button class="layer_close type2" onclick="">창 닫기</button>
			</div>
		</div>
	</div>
	<div id="Wrapper">
		<div id="skip_navi">
			<a href="#Container">본문바로가기</a>
		</div>
		<!-- 상단 띠 배너 - 어워즈관 S -->
		<div class="banUpperBox" style="display: none">
			<div class="inner">
				<a href="#" id="top_banner_image"></a> <a href="#"
					class="btn_upper_close">오늘 안 보기</a>
			</div>
			<div class="dimBan">
				<div class="in"></div>
			</div>
		</div>
		<div class="dimBanWhite" style="display: none">
			<div class="in"></div>
		</div>
		<div class="dimBanBlack"></div>
		<!-- 상단 띠 배너 - 어워즈관 E -->
		<!-- 상단 띠 배너 - IE대응 S -->
		<div class="banUpperBox2">
			<div class="inner">
				<p>
					고객님의 브라우저에서는 올리브영 온라인몰이 정상 동작하지 않습니다.<br>다른 브라우저로 접속해주세요.
				</p>
				<ul>
					<li>크롬</li>
					<li>엣지</li>
					<li>사파리</li>
				</ul>
			</div>
		</div>
		<!-- 상단 띠 배너 - IE대응 E -->
		<div id="Header">
			<div class="top_util">
				<ul class="menu_list" id="menu_list_header">
					
					
						<sec:authorize access="isAnonymous()">
							<li class="join"><a href="<%=contextPath%>/join/joinCheck" data-attr="공통^헤더^회원가입">회원가입</a></li>
							<li class="login"><a href="<%=contextPath%>/auth/login"
								data-attr="공통^헤더^로그인">로그인</a></li>
						</sec:authorize>
						
						<sec:authorize access="isAuthenticated()">
							<li class="logout"><strong><sec:authentication property="principal.member.gradeName"/>&nbsp;
									<sec:authentication property="principal.member.userName"/></strong> <a
								href="javascript:logout()"  data-attr="공통^헤더^로그아웃">로그아웃</a></li>
							<li class="mypage"><a onclick=""
								href="<%=contextPath%>/mypage/main"
								data-attr="공통^헤더^마이페이지">마이페이지</a></li>

						</sec:authorize>
					<sec:authorize access="hasAuthority('ADMIN')">
						<li class="join"><a href="/adminpage/" data-attr="공통^헤더^회원가입">관리자 페이지</a></li>
					</sec:authorize>

					<c:choose>
						<c:when test="${empty sessionScope.principal }">
							<li class="cart"><a href="<%=contextPath%>/basket"
								data-attr="공통^헤더^장바구니">장바구니 <span id="cartToCnt"></span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="cart"><a href="<%=contextPath%>/basket"
								data-attr="공통^헤더^장바구니">장바구니 <span id="cartToCnt">
										(${sessionScope.basketlistcnt[0] + sessionScope.basketlistcnt[1]})
								</span>
							</a></li>
						</c:otherwise>
					</c:choose>



					<li class="order"><a onclick="" href="<%=contextPath%>/mypage/orderdelivery"
						data-attr="공통^헤더^주문배송">주문배송</a></li>
					<li class="customer"><a onclick="" href="<%=contextPath%>/counselor/faq"
						data-attr="공통^헤더^고객센터">고객센터</a></li>
					<li class="store"><a onclick=""
						href="<c:url value='/store/getStoreMain'/>"
						data-attr="공통^헤더^매장안내">매장안내</a></li>
					<li class="global"><a href="#" title="올리브영 글로벌 새창으로 열기"
						data-attr="공통^헤더^Global">Global</a></li>
				</ul>
			</div>
			<div class="header_inner">
				<h1>
					<a onclick="" href="/"> <img
						src="/resources/images/logo.png"
						alt="올리브영">
					</a>
				</h1>
				<div class="search_box" id="w_search_box">
					<input type="hidden" name="chkButton" id="chkButton" value="">
					<div class="placeholder_area">
						<label for="query">'블프'를 검색해보세요</label><input type="text"
							id="query" name="" value="" class="inp_placeholder"
							data-placeholder="'블프'를 검색해보세요" data-ref-linkurl=""
							autocomplete="off">
					</div>
					<button id="searchSubmit">검색</button>
					<!-- 검색 레이어 영역 (디자인 수정 예정) -->
					<div class="search_layer">
						<div class="layer_inner">
							<!-- 2017-02-07 수정 : 자동완성기능 영역 -->
							<div class="auto_search_cont">
								<div id='output'>
									<div class="brand_area" id="ark_brand"></div>
									<div class="auto_list" id="ark_w" display="none">
										<ul>
											<li id="bg0" onclick="onClickKeywordSearch('로션','0');"
												onmouseover="onMouseOverKeyword(0);"
												style="background-color: rgb(255, 255, 255); cursor: pointer;"><a
												href="#" data-attr="통합^통합검색_자동완성키워드^로션"><span>로션</span></a></li>
										</ul>
									</div>
								</div>
							</div>
							<!--// 2017-02-07 수정 : 자동완성기능 영역 -->
							<!-- 최근 검색어 -->
							<a href="#" class="search_tab tab01" id="searchRecent"
								style="display: none;">최근 검색어</a>
							<!-- 현재 보여지는 탭에 클래스 on 넣어주세요 -->
							<div class="search_tab_cont" id="recent_cont"
								style="display: none;">
								<ul id="mykeyword">
									<!-- 검색 기록이 없을 경우 -->
									<!-- 							<li class="no_data" id="recent_no_data" style="display:none;">최근 검색한 기록이 없습니다.</li> -->
									<!--// 검색 기록이 없을 경우 -->
									<!-- 검색 저장 기능이 꺼져있을 경우 -->
									<!-- 							<li class="no_data" id="recent_no_save" style="display:none;">최근 검색어 저장 기능이 꺼져있습니다.</li> -->
									<!--// 검색 저장 기능이 꺼져있을 경우 -->
								</ul>
								<div class="search_set_area">
									<a href="#" class="sch_all_del" onclick="">전체 삭제</a>
									<!-- 										<a href="#" class="sch_save"></a>																		 -->
									<a href="#" class="sch_save">검색어 저장 끄기</a>
								</div>
							</div>
							<!--// 최근 검색어 -->
							<!-- 급상승 검색어 -->
							<a href="#" class="search_tab tab02 on" id="searchPop"
								style="display: none;">급상승 검색어</a>
							<div class="search_tab_cont sharp_rise" id="w_pop_cont"
								style="display: none;">
								<ul id="mainPopword">
								<c:forEach items="${keywords}" var="list" varStatus="loop">
									<li class=" <c:if test="${loop.index < 3}">top</c:if>"><a href="/search?searchWord=${list}"
										data-attr="공통^통합검색_급상승검색어^틴트"> <span>${loop.index +1}</span> <strong>${list}</strong>
											<span class="rate "> <span>&nbsp;</span>
										</span>
									</a></li>
									</c:forEach>
									
								</ul>
								<div class="search_set_area">
									<a href="#" class="sch_pop_close">닫기</a>
								</div>
							</div>
							<!--// 인기 검색어 -->
						</div>
					</div>
					<!--// 검색 레이어 영역 -->
				</div>
				<!--// 검색영역 -->
				<ul class="mymenu_area">
					<!-- 오늘드림 플래그 개인화 노출 2차 POC 추가 -->
					<li id="todayDeliveryContainer" class="delivery"><a href="#"
						id="tddlvr_header_today_icon" class="mymenu_layer"
						title="오늘드림 자세히보기 열기/닫기">오늘드림</a> <!-- 배송지 미등록 / 배송주소 출력-->
						<div class="delivery_box_wrap" style="display: none;">
							<div class="delivery_box">
								<p class="dTxt">배송지를 등록하고 오늘드림으로 구매 가능한 상품을 확인하세요!</p>
							</div>
						</div> <!--// 배송지 미등록 / 배송주소 출력--> <!-- 배송지 설정-->
						<div class="delivery_addr" style="display: none">
							<div class="addr_box">
								<div class="inner box-head">
									<h3 class="tit01">
										배송지<span>배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
									</h3>
									<div class="set-box">
										<strong>오늘드림 배송 설정 하기</strong>
										<p>상세 페이지에서 오늘드림 배송으로 선택돼요</p>
										<div class="toggleInput">
											<label id="tddlvr_switch" class="switch"> <input
												id="tddlvr_todayDeliveryFlagCheckbox" type="checkbox">
												<span id="tddlvr_slider" class="slider"></span>
											</label>
										</div>
									</div>
								</div>
								<div class="inner box-cont">
									<div class="addr-list-wrap">
										<div class="mCustomScrollbar _mCS_1 mCS_no_scrollbar">
											<div id="mCSB_1"
												class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
												style="max-height: 300px;" tabindex="0">
												<div id="mCSB_1_container"
													class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
													style="position: relative; top: 0; left: 0;" dir="ltr">
													<ul class="addr-list"></ul>
												</div>
												<div id="mCSB_1_scrollbar_vertical"
													class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical"
													style="display: none;">
													<div class="mCSB_draggerContainer">
														<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
															style="position: absolute; min-height: 30px; top: 0px;">
															<div class="mCSB_dragger_bar" style="line-height: 30px;">
															</div>
														</div>
														<div class="mCSB_draggerRail"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="callRegDeliveryAddressButton" class="add-address-box">
									<a class="btnTy btn-plus" data-rel="layer" href="#">새 배송지
										추가</a>
								</div>
							</div>
						</div></li>
					<!-- // 오늘드림 플래그 개인화 노출 2차 POC 추가 -->
					<li class="store "><a onclick="" href="#" class="mymenu_layer"
						title="관심 매장소식 자세히보기 열기/닫기">관심 매장소식</a>
						<div class="alim_box">
							<sec:authorize access="isAnonymous()">
								<p class="store_desc">
								<span>로그인</span>하시면 자주가는 매장을 <br>관심 매장으로 설정 할 수 있습니다.
								</p>
								<button class="mymenu_btn"
									onclick="javascript:location.href='<c:url value="/auth/login"/>'">로그인</button>
							</sec:authorize>
									
							
						</div></li>
					<li class="recent"><a onclick="recProductView()" href="#"
						class="mymenu_layer" title="최근 본 상품 자세히보기 열기/닫기">최근 본 상품</a>
						<div class="recent_prd_box" style="min-height: 510px;">
							<p class="recent_tit">
								전체 <span>${fn:length(sessionScope.productHistory)}</span>개
								<button class="mymenu_btn cookiedelete">전체 삭제</button>
							</p>
							<ul class="cate_prd_list gtm_common_recent_list">
						<c:if test="${fn:length(sessionScope.productHistory) > 0}">
						<c:set var="i" value="${0 }" />
						<c:forEach items="${productHistory }" var="history">
						<c:if test="${not empty history.productDisplayId }">
						<c:set var="i" value="${i + 1 }" />
								<li data-ref-recentgoodsidx="${i }">
									<div class="prd_info ">
										<a
											href="/store/goods?productDisplayId=${history.productDisplayId }&displNum=${history.categoryLargeId}${history.categoryMidId}"
											name="Common_Recent" class="prd_thumb goodsList"
											data-ref-goodsno="A000000165598"
											data-attr="공통^최근본상품^[단독기획] 토리든 다이브인 저분자 히알루론산 수딩크림 더블기획 (100ml+100ml)^1"
											data-ref-dispcatno="" data-ref-itemno="001" data-trk="null"
											data-impression="null"
											onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000165598&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;공통_최근본상품&quot;, &quot;1&quot;);"><span
											class="thumb_flag best">베스트</span><img
											src="${history.productDisplaySrc }"
											alt="[단독기획] 토리든 다이브인 저분자 히알루론산 수딩크림 더블기획 (100ml+100ml)"
											onerror="common.errorImg(this);"></a>
										<div class="prd_name">
											<a href="javascript:;" name="Common_Recent" class="goodsList"
												data-ref-goodsno="A000000165598"
												data-attr="공통^최근본상품^[단독기획] 토리든 다이브인 저분자 히알루론산 수딩크림 더블기획 (100ml+100ml)^1"
												data-ref-dispcatno="" data-ref-itemno="001" data-trk="null"
												onclick="javascript: gtm.goods.callGoodsGtmInfo(&quot;A000000165598&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;공통_최근본상품&quot;, &quot;1&quot;);"><span
												class="tx_brand">${history.brandName }</span>
											<p class="tx_name">${history.productDisplayName }</p></a>
										</div>
										<button class="btn_zzim jeem" data-ref-goodsno="A000000165598">
											<span>찜하기전</span>
										</button>
										<p class="prd_price">
											<span class="tx_org"><span class="tx_num">${history.minprice }</span>원
											</span><span class="tx_cur"><span class="tx_num">${history.afterprice }</span>원
											</span>
										</p>
										<p class="prd_flag">
											<span class="icon_flag sale">세일</span><span
												class="icon_flag gift">증정</span><span
												class="icon_flag delivery">오늘드림</span>
										</p>
										<!-- <p class="prd_point_area tx_num">
											<span class="review_point"><span class="point"
												style="width: 96.0%">10점만점에 5.5점</span></span>(999+)
										</p> -->
										<p class="prd_btn_area">
											<button class="cartBtn" data-ref-goodsno="A000000165598"
												data-ref-dispcatno="" data-ref-itemno="001">장바구니</button>
											<button class="btn_new_pop goodsList">새창보기</button>
										</p>
									</div>



									<!-- <p class="btn_recom">
										<button type="button" class="btn btnCuration"
											onclick="common.recentGoods.curationMove('8809784600398','A000000165598','1000001000100150001','크림')">
											<span class="bul">추천 상품 보기</span>
										</button>
									</p> -->

									<button type="button" id="${history.productDisplayId}" class="btnDelete cookiedel">삭제</button>
								</li>
							</c:if>
							</c:forEach>
							</c:if>
							</ul>
							<div class="no_data" style="display: none;">최근 본 상품이 없습니다.
							</div>
						</div></li>
				</ul>
			</div>
			<div class="header_design_area"></div>
		</div>
		<div id="Gnb" class="main gen1">
			<div id="gnbWrap">
				<a href="#" id="btnGnbOpen" class="">카테고리</a>
				<!-- 전체 카테고리 레이어 -->
				<div class="layer_all_menu" id="gnbAllMenu">
					<ul class="all_menu_wrap">
						<li>
							<h2>뷰티</h2>
							<c:if test="${not empty firstTotalCategory}">
							<c:forEach var="i" varStatus="outerLoop" begin="1" end="3">
								<c:set var="innerLoopBegin" value="${(outerLoop.index - 1) * 4}" />
								<c:set var="innerLoopEnd" value="${(outerLoop.index * 4) -1}" />
							<div class="sub_menu_box">
								<c:forEach items="${firstTotalCategory}" var="bh" begin="${innerLoopBegin}" end="${innerLoopEnd}" varStatus="innerLoop">
									
										<p class="sub_depth">
											<a href="/store/display?dispCapno=${bh.key.categoryLargeId}">${bh.key.categoryLargeName}</a>
										</p>
										<ul>
											<c:forEach items="${bh.value}" var="value">
												<li>
													<a href="/store/display?dispCapno=${bh.key.categoryLargeId}${value.categoryMidId}&sort=1">
													${value.categoryMidName}
													</a>
												</li>
											</c:forEach>
										</ul>
									
								</c:forEach>
							</div>
							</c:forEach>
							</c:if>
						</li>
						<!-- 뷰티 끝 -->
						<li>
							<h2>헬스&amp;푸드</h2>
							
							<div class="sub_menu_box">
								<c:if test="${not empty secondTotalCategory}">
									<c:forEach items="${secondTotalCategory}" var="hh">
										<p class="sub_depth">
											<a href="/store/display?dispCapno=${hh.key.categoryLargeId}">${hh.key.categoryLargeName}
											</a>
										</p>
										<c:forEach items="${hh.value }" var="value">
										<ul>
											<li>
												<a href="/store/display?dispCapno=${hh.key.categoryLargeId}${value.categoryMidId}&sort=1">
													${value.categoryMidName}
												</a>
											</li>
										</ul>
										</c:forEach>
									</c:forEach>
								</c:if>
								
							</div>
						</li>
						
						
						<!--  헬스&amp;푸드 끝 -->
						<li>
							<h2>라이프</h2>
							<div class="sub_menu_box">
								<c:if test="${not empty thirdTotalCategory}">
									<c:forEach items="${thirdTotalCategory}" var="lh">
										<p class="sub_depth">
											<a href="/store/display?dispCapno=${lh.key.categoryLargeId}">${lh.key.categoryLargeName}
											</a>
										</p>
										<c:forEach items="${lh.value }" var="value">
										<ul>
											<li>
												<a href="/store/display?dispCapno=${lh.key.categoryLargeId}${value.categoryMidId}&sort=1">
													${value.categoryMidName}
												</a>
											</li>
										</ul>
										</c:forEach>
									</c:forEach>
								</c:if>
							</div>
						</li>
					</ul>
					<button id="btnGnbClose">전체 카테고리 창 닫기</button>
				</div>
				<!--// 전체 카테고리 레이어 -->
				<ul class="gnb_menu_list">
					<li style=""><a onclick="" href="#"
						data-ref-linkurl="main/getHotdealList.do" data-attr="공통^GNB^오특"><span>오특</span>
					</a></li>
					<li style=""><a onclick="" href='<c:url value="/store/getRanking"/>'><span>랭킹</span>
					</a></li>
					<li style=""><a href="/store/getExhibition?eventId=le_00000001"><span>LUXE EDIT</span> </a></li>
					<li style=""><a href="/store/main/getExhibition" data-ref-linkurl="/store/main/getExhibition" ><span>기획전</span>
					</a></li>
					<li style=""><a  href="#"
						data-ref-linkurl="main/getSaleList.do" data-attr="공통^GNB^세일"><span>세일</span>
					</a></li>
					<li style=""><a href="<c:url value='/store/getGiftCard'/>"><span>기프트카드</span> </a></li>
					<li style=""><a href='<c:url value="/store/getMembership"/>'><span>멤버십/쿠폰</span>
					</a></li>
					<li style=""><a href="<c:url value='/store/getEvent'/>"><span>이벤트</span>
					</a></li>
				</ul>

				<div id="directTop" style="display: block;">
					<button>
						<span></span>TOP
					</button>
				</div>

			</div>
			<!-- RecoBell Script Start -->
			<form name="ssologinfrm"
				action="https://www.oliveyoung.co.kr/store/login/ssoLogin.do"
				method="post">
				<input type="hidden" id="cjssoq" name="cjssoq">
			</form>
			

			<!-- //[3553186] 온라인몰 전시 카테고리 개편 일괄 작업 요청의 건 -->
			<!-- 메인 카테고리 목록 -->
			<div class="main_cate_wrap" style="display: none">
				<ul class="main_cate_list">
					<li class="type1"><a href="#" class="main_menu"
						data-attr="공통^메인롤링^기초화장품" data-trk="/">기초화장품</a>
						<div class="lnb_ban_box 10000010001"
							data-ref-dispcatno-lnb_ban_box="10000010001">
							<a href="#" onclick=""
								data-attr="공통^카테고리네비게이터추천상품^[민동성공동개발] 메디필 히알루론산 레이어 물톡스 앰플 더블 기획 30ml "
								data-impression="A000000189769^공통_카테고리네비게이터추천상품^1"
								data-impression-visibility="1">
								<div class="ban_info">
									<p class="ban_name">MD's Pick</p>
									<div class="tit_group">
										<p class="tit_m">메디필💧</p>
										<p class="tit_s">수분 꽉,물톡스 앰플</p>
										<p class="tit_s">30ml 더블기획!</p>
									</div>
									<div class="price_group">
										<p class="price_m">
											34,000<em>원</em>
										</p>
									</div>
								</div>
								<div class="ban_thum">
									<img
										src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0018/A00000018976913ko.jpg?l=ko"
										alt="">
								</div>
							</a>
						</div>
						<div class="lnb_ban_box 10000010010"
							data-ref-dispcatno-lnb_ban_box="10000010010">
							<a href="#;"
								data-attr="공통^카테고리네비게이터추천상품^[단독기획]메이크프렘 클린비건 클렌징밀크 리필기획(200ml+100ml)"
								data-impression="A000000158513^공통_카테고리네비게이터추천상품^1"
								data-impression-visibility="1">
								<div class="ban_info">
									<p class="ban_name">MD's Pick</p>
									<div class="tit_group">
										<p class="tit_m">메이크프렘💚</p>
										<p class="tit_s">최모나 PICK!</p>
										<p class="tit_s">올영 단독 리필기획✨</p>
									</div>
									<div class="price_group">
										<p class="price_s">
											28,000<em>원</em>
										</p>
										<p class="price_m">
											19,950<em>원</em>
										</p>
									</div>
								</div>
								<div class="ban_thum">
									<img
										src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0015/A00000015851315ko.jpg?l=ko"
										alt="">
								</div>
							</a>
						</div>
						<div class="lnb_ban_box 10000010011"
							data-ref-dispcatno-lnb_ban_box="10000010011">
							<a href="#"
								data-attr="공통^카테고리네비게이터추천상품^[1+1기획] 구달 맑은 어성초 진정 수분 선크림 50ml 1+1 기획 SPF50+ PA++++"
								data-impression="A000000168705^공통_카테고리네비게이터추천상품^1"
								data-impression-visibility="1">
								<div class="ban_info">
									<p class="ban_name">MD's Pick</p>
									<div class="tit_group">
										<p class="tit_m">구달💚</p>
										<p class="tit_s">가벼운 어성초 수분썬💦</p>
										<p class="tit_s">올영 단독 1+1</p>
									</div>
									<div class="price_group">
										<p class="price_m">
											18,000<em>원</em>
										</p>
									</div>
								</div>
								<div class="ban_thum">
									<img
										src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0016/A00000016870522ko.jpg?l=ko"
										alt="">
								</div>
							</a>
						</div>
						<ul class="sub_cate_list">
							<li><a href="#" data-ref-dispcatno="10000010001"
								class="sub_menu" data-attr="공통^메인롤링^기초화장품_스킨케어" data-trk="/"><span>스킨케어</span></a></li>
							<li><a href="#" data-ref-dispcatno="10000010009"
								class="sub_menu" data-attr="공통^메인롤링^기초화장품_마스크팩" data-trk="/"><span>마스크팩</span></a></li>
							<li><a href="#" data-ref-dispcatno="10000010010"
								class="sub_menu" data-attr="공통^메인롤링^기초화장품_클렌징" data-trk="/"><span>클렌징</span></a></li>
							<li><a href="#" data-ref-dispcatno="10000010011"
								class="sub_menu" data-attr="공통^메인롤링^기초화장품_선케어" data-trk="/"><span>선케어</span></a></li>
						</ul></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000010008"
						class="main_menu" data-attr="공통^메인롤링^더모 코스메틱" data-trk="/">더모
							코스메틱</a>
						<div class="lnb_ban_box" style="left: 172px;">
							<a href="#" onclick=""
								data-attr="공통^카테고리네비게이터추천상품^에스트라 아토베리어365 크림 80ml 기획 (+하이드로에센스 25ml+무기자차선크림10ml 증정)"
								data-impression="A000000184128^공통_카테고리네비게이터추천상품^1"
								data-impression-visibility="1">
								<div class="ban_info">
									<p class="ban_name">MD's Pick</p>
									<div class="tit_group">
										<p class="tit_m">에스트라💙</p>
										<p class="tit_s">국민장벽크림</p>
										<p class="tit_s">UP TO 28% OFF 💫</p>
									</div>
									<div class="price_group">
										<p class="price_s">
											31,000<em>원</em>
										</p>
										<p class="price_m">
											24,800<em>원</em>
										</p>
									</div>
								</div>
								<div class="ban_thum">
									<img
										src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0018/A00000018412802ko.jpg?l=ko"
										alt="">
								</div>
							</a>
						</div></li>
					<li class="type1"><a href="#" class="main_menu"
						data-attr="공통^메인롤링^메이크업 · 네일" data-trk="/">메이크업 · 네일</a>
						<ul class="sub_cate_list">
							<li><a href="#" data-ref-dispcatno="10000010002"
								class="sub_menu" data-attr="공통^메인롤링^메이크업 · 네일_메이크업" data-trk="/"><span>메이크업</span></a></li>
							<li><a href="#" data-ref-dispcatno="10000010012"
								class="sub_menu" data-attr="공통^메인롤링^메이크업 · 네일_네일" data-trk="/"><span>네일</span></a></li>
						</ul></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000010003"
						class="main_menu" data-attr="공통^메인롤링^바디케어" data-trk="/">바디케어</a></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000010004"
						class="main_menu" data-attr="공통^메인롤링^헤어케어" data-trk="/">헤어케어</a>
						<div class="lnb_ban_box">
							<a href="#" onclick=""
								data-attr="공통^카테고리네비게이터추천상품^[NEW] 어노브 볼륨 업 픽서 200ml"
								data-impression="A000000192239^공통_카테고리네비게이터추천상품^1"
								data-impression-visibility="1">
								<div class="ban_info">
									<p class="ban_name">MD's Pick</p>
									<div class="tit_group">
										<p class="tit_m">어노브💗</p>
										<p class="tit_s">부드러운 소프트픽싱</p>
										<p class="tit_s">볼륨 업 픽서 출시!✨</p>
									</div>
									<div class="price_group">
										<p class="price_s">
											16,000<em>원</em>
										</p>
										<p class="price_m">
											13,400<em>원</em>
										</p>
									</div>
								</div>
								<div class="ban_thum">
									<img
										src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0019/A00000019223903ko.jpg?l=ko"
										alt="">
								</div>
							</a>
						</div></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000010005"
						class="main_menu" data-attr="공통^메인롤링^향수/디퓨저" data-trk="/">향수/디퓨저</a>
						<div class="lnb_ban_box">
							<a href="#" onclick=""
								data-attr="공통^카테고리네비게이터추천상품^[블프특가][샤워젤 증정] CK 캘빈클라인 One EDT 50ml"
								data-impression="A000000186173^공통_카테고리네비게이터추천상품^1"
								data-impression-visibility="1">
								<div class="ban_info">
									<p class="ban_name">MD's Pick</p>
									<div class="tit_group">
										<p class="tit_m">상큼시원한 시트러스</p>
										<p class="tit_s">CK ONE 오드뜨왈렛</p>
										<p class="tit_s">7일 특가 47%💙</p>
									</div>
									<div class="price_group">
										<p class="price_s">
											61,000<em>원</em>
										</p>
										<p class="price_m">
											32,030<em>원</em>
										</p>
									</div>
								</div>
								<div class="ban_thum">
									<img
										src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0018/A00000018617303ko.jpg?l=ko"
										alt="">
								</div>
							</a>
						</div></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000010006"
						class="main_menu" data-attr="공통^메인롤링^미용소품" data-trk="/">미용소품</a>
						<div class="lnb_ban_box">
							<a href="#" onclick=""
								data-attr="공통^카테고리네비게이터추천상품^에스쁘아 비글로우/비벨벳 에어퍼프 5개입(2종)"
								data-impression="A000000178556^공통_카테고리네비게이터추천상품^1"
								data-impression-visibility="1">
								<div class="ban_info">
									<p class="ban_name">MD's Pick</p>
									<div class="tit_group">
										<p class="tit_m">에스쁘아💖</p>
										<p class="tit_s">말랑 밀착 쿠션퍼프</p>
										<p class="tit_s">가을 베이스 치트키!</p>
									</div>
									<div class="price_group">
										<p class="price_s">
											10,000<em>원</em>
										</p>
										<p class="price_m">
											7,590<em>원</em>
										</p>
									</div>
								</div>
								<div class="ban_thum">
									<img
										src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0017/A00000017855604ko.jpg?l=ko"
										alt="">
								</div>
							</a>
						</div></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000010007"
						class="main_menu" data-attr="공통^메인롤링^남성" data-trk="/">남성</a></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000020003"
						class="main_menu" data-attr="공통^메인롤링^구강/건강용품" data-trk="/">구강/건강용품</a>
						<div class="lnb_ban_box">
							<a href="#" onclick=""
								data-attr="공통^카테고리네비게이터추천상품^[11월올영픽/신상] 테라브레스 마우스 로젠지 캔디 만다린민트향 100개입"
								data-impression="A000000191586^공통_카테고리네비게이터추천상품^1"
								data-impression-visibility="1">
								<div class="ban_info">
									<p class="ban_name">MD's Pick</p>
									<div class="tit_group">
										<p class="tit_m">로젠지 캔디💚</p>
										<p class="tit_s">테라브레스 구강캔디 올영상륙!</p>
										<p class="tit_s">11월 올영P!CK</p>
									</div>
									<div class="price_group">
										<p class="price_s">
											22,900<em>원</em>
										</p>
										<p class="price_m">
											20,900<em>원</em>
										</p>
									</div>
								</div>
								<div class="ban_thum">
									<img
										src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0019/A00000019158605ko.jpg?l=ko"
										alt="">
								</div>
							</a>
						</div></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000020004"
						class="main_menu" data-attr="공통^메인롤링^여성/위생용품" data-trk="/">여성/위생용품</a>
						<div class="lnb_ban_box">
							<a href="#" onclick=""
								data-attr="공통^카테고리네비게이터추천상품^[11월 올영픽]이너시아 더 프리즘 유기농 생리대 7종 택 1 (중형 8P / 대형 8P / 라이너 18P / 번들팩)"
								data-impression="A000000187776^공통_카테고리네비게이터추천상품^1"
								data-impression-visibility="1">
								<div class="ban_info">
									<p class="ban_name">MD's Pick</p>
									<div class="tit_group">
										<p class="tit_m">이너시아💖</p>
										<p class="tit_s">유기농순면100%</p>
										<p class="tit_s">프리미엄 생리대</p>
									</div>
									<div class="price_group">
										<p class="price_s">
											8,500<em>원</em>
										</p>
										<p class="price_m">
											6,600<em>원</em>
										</p>
									</div>
								</div>
								<div class="ban_thum">
									<img
										src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0018/A00000018777625ko.jpg?l=ko"
										alt="">
								</div>
							</a>
						</div></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000020001"
						class="main_menu" data-attr="공통^메인롤링^건강식품" data-trk="/">건강식품</a></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000020002"
						class="main_menu" data-attr="공통^메인롤링^푸드" data-trk="/">푸드</a></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000030005"
						class="main_menu" data-attr="공통^메인롤링^라이프/홈" data-trk="/">라이프/홈</a>
						<div class="lnb_ban_box">
							<a href="#" onclick=""
								data-attr="공통^카테고리네비게이터추천상품^[11월 올영픽] 스너글 허거블/해브어 곰나잇 섬유탈취제 150ml 더블 기획  2종 중 택 1"
								data-impression="A000000191808^공통_카테고리네비게이터추천상품^1"
								data-impression-visibility="1">
								<div class="ban_info">
									<p class="ban_name">MD's Pick</p>
									<div class="tit_group">
										<p class="tit_m">스너글🧸</p>
										<p class="tit_s">해브어곰나잇💗</p>
										<p class="tit_s">단독기획에포카증정🎁</p>
									</div>
									<div class="price_group">
										<p class="price_s">
											10,000<em>원</em>
										</p>
										<p class="price_m">
											7,600<em>원</em>
										</p>
									</div>
								</div>
								<div class="ban_thum">
									<img
										src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0019/A00000019180805ko.jpg?l=ko"
										alt="">
								</div>
							</a>
						</div></li>
					<li class="type2"><a href="#" data-ref-dispcatno="10000030003"
						class="main_menu" data-attr="공통^메인롤링^반려동물" data-trk="/">반려동물</a></li>
					<li class="lst"><a href="#" class="main_menu"
						data-attr="공통^메인롤링^AWARDS" data-trk="/"><span
							class="icon_awards">AWARDS</span></a></li>
				</ul>
			</div>
			<!-- //[3553186] 온라인몰 전시 카테고리 개편 일괄 작업 요청의 건 -->
			<!-- 메인 카테고리 목록 -->
		</div>

	</div>

	<script>
	$(document).ready(function(){
		$("#query").keyup(function(event){
			var val =$('#query').val();
			if (val.length < 2) {
				return
				console.log(val)
			}
			
			if(val.length >=2 && event.keyCode == 13){
				searchInsert(val)
				window.location.href = "/search?searchWord="+val;
			}else if(val.length <2 && event.keyCode == 13){
				alert("검색은 2글자 이상 부터 가능합니다")
				return
			}
			
			console.log(val)
		if (val) {
			$("#w_search_box > div.placeholder_area > label").text("");
			$("#searchPop").removeClass("on");
			$("#w_pop_cont").css("display","none");
			$("#searchRecent").removeClass("on");
			$("#recent_cont").css("display","none");
			$(".search_tab").css("display","none");
			$("#ark_w").css("display","block");
			$.ajax({ //ajax를 활용하여 서블릿으로 키워드 전달 
				type: 'get',
				url : "/searchAjax",
				dataType: 'text',
				data : {word : val},
				success : function(response){ //통신 성공 시  기능 
					$("#output").empty();
					$("#output").append(response);
				}
			})
		}else{
			$("#output").empty();
			$("#ark_w").css("display","none");
		}
		
	})
		
	})
	</script>

<script>
// 쿠키 전체 삭제
function deleteCookie(name) {
	var exdate = new Date();
	  exdate.setDate(exdate.getDate() -1);
	  var cookie_value = escape(0) + ((-1 == null) ? '' : '; expires=' + exdate.toUTCString());
	  document.cookie = name + '=' + cookie_value;
}

function getCookie(cookie_name) {
	  var x, y;
	  var val = document.cookie.split(';');

	  for (var i = 0; i < val.length; i++) {
	    x = val[i].substr(0, val[i].indexOf('='));
	    y = val[i].substr(val[i].indexOf('=') + 1);
	    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
	    if (x == cookie_name) {
	      return unescape(y); // unescape로 디코딩 후 값 리턴
	    }
	  }
	}
	
function setCookie(cookie_name, value, days) {
	  var exdate = new Date();
	  exdate.setDate(exdate.getDate() + days);
	  // 설정 일수만큼 현재시간에 만료값으로 지정

	  var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
	  document.cookie = cookie_name + '=' + cookie_value;
	}


$(function(){
	$(".cookiedelete").on("click",function(){
		deleteCookie('productItems');
		$(".cate_prd_list.gtm_common_recent_list").empty();
		$.ajax({
			url: "/history",
			
			cache: false,
			success:function( response ) {
				$(".cate_prd_list.gtm_common_recent_list").empty();
	              //$(".cate_prd_list.gtm_common_recent_list").append( response );
	          }
	        , error		: function() {
	            alert( '서버 데이터를 가져오지 못했습니다. 다시 확인하여 주십시오.' );
	        }
		})
	})
	
	$(".cookiedel").on("click", function(){
    let value = $(this).attr("id");
    let items = getCookie('productItems'); // productItems 쿠키값 가져오기

    if (items) {
        let itemArray = items.split(','); // 쿠키 값을 배열로 변환
        let filteredItems = itemArray.filter(item => item !== value); // 받아온 값(value) 제외한 값들만 필터링

        // 쿠키에서 제외된 값을 새로운 쿠키에 다시 설정
        let expire = 7; // 쿠키 만료 날짜
        setCookie('productItems', filteredItems, expire)
        
    }
    $.ajax({
		url: "<%=contextPath%>/olive/history.do",
		
		cache: false,
		success:function( response ) {
			$(".cate_prd_list.gtm_common_recent_list").empty();
              $(".cate_prd_list.gtm_common_recent_list").append( response );
          }
        , error		: function() {
            alert( '서버 데이터를 가져오지 못했습니다. 다시 확인하여 주십시오.' );
        }
	})
    
});



	
	$("#Header > div.header_inner > ul > li.recent > a").on("click",function(event){
		event.preventDefault();
	})
})

function logout(){
     let f = document.createElement('form');

    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', '${_csrf.parameterName }');
    obj.setAttribute('value', '${_csrf.token }');
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/auth/logout');
    document.body.appendChild(f);
    f.submit();

}

$(function(){
	$("#searchSubmit").on("click",function(){
		let searchWord = $("#query").val()
		if (searchWord.length < 2) {
			alert("검색은 2글자 이상 부터 가능합니다")
			return
		}
		searchInsert(searchWord)
		window.location.href = "/search?searchWord="+searchWord;
	})
})

function searchInsert(searchWord){
	 $.ajax({
			url: "/searchInsert",
			data:{searchWord:searchWord},
			cache: false,
			success:function( response ) {
				
	          }
	        , error		: function() {
	            alert( '서버 데이터를 가져오지 못했습니다. 다시 확인하여 주십시오.' );
	        }
		})
}

</script>