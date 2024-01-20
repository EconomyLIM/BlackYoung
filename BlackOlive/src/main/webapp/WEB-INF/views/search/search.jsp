<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/include.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
// 브랜드 ID 파라미터 갖고오기
String s = "";
if (request.getParameter("brandId") != null) {
	String brandIds[] = request.getParameterValues("brandId");

	for (int i = 0; i < brandIds.length; i++) {
		s += "&brandId=" + brandIds[i];
	} // for

} //if
%>
<script>
$(function(){
	
	if (${param.quickyn eq 'Y'}) {
		$("#check_view").prop('checked',true);
	}
	
	if (${param.plusButtonFlag eq 'Y'}) {
		$('.search_box.brand').addClass("on")
	}
	
	$('.search_box.brand .btnMore').click(function() {
        const brandBox = $('.search_box.brand');
        if (brandBox.hasClass('on')) {
            brandBox.removeClass('on');
            
        } else {
            brandBox.addClass('on');
            
        }
    });
	
	 var urlParams = new URLSearchParams(window.location.search);
	// sort 버튼 li태그 클래스 추가 삭제
		if (urlParams.has('sort')) {

			$(".cate_align_box .align_sort ul > li").removeClass("on");
			$(".cate_align_box .align_sort ul > li").eq(${param.sort != null ? param.sort - 1 : 0}).addClass("on"); 
		} //  if

		$(".cate_align_box .align_sort ul > li a").click(function (event) {
	        event.preventDefault();
		
	        // data-prdsoting 속성을 통해 설정한 sort 값을 가져옴
	        var selectedSorting = $(this).data("prdsoting");

	        // moveSort 함수 호출하여 URL 업데이트
	        moveSort(selectedSorting);

	        // 현재 선택된 링크에 'on' 클래스를 추가하고 다른 링크에서는 제거
	        $(".cate_align_box .align_sort ul > li a").removeClass("on");
	        $(this).addClass("on");
	    });
		const moveSort = function moveSorting(sortNum) {
			
	    	const URLSearch = new URLSearchParams(location.search);
	    	URLSearch.set('sort', String(sortNum));
	    	const newParam = URLSearch.toString();
	    	window.location.href = location.pathname + '?' + newParam;
	};
	
	var urlParams = new URLSearchParams(window.location.search);
	 var checkboxes = document.querySelectorAll('input[name="brandId"]');
	 // 브랜드 체크 처리
	    if (urlParams.has('brandId')) {
	        var selectedBrands = urlParams.getAll('brandId');
	        
	        checkboxes.forEach(function(checkbox) {
	            var brandID = checkbox.value;
	            if (selectedBrands.includes(brandID)) {
	                checkbox.checked = true; // 파라미터에 해당하는 값이 있으면 체크박스를 체크함
	            }
	        });
	    }
	 
	    $('input[name="brandId"]').on('change', function() {
	    	var quickyn =''
	    <c:if test="${not empty param.quickyn}">quickyn = '&quickyn='+'${param.quickyn}'</c:if>
	     
	    	
	   	 var url = "/search?searchWord=${param.searchWord}"+''+"&sort=${param.sort}&currentpage=1&categorySmallId=${param.categorySmallId}<%=s%>"; 
	   	<%-- var url = window.location.href+''+"<%=s%>"; --%>
	       var brandID = $(this).val();
			var plusButtonFlag = "&plusButtonFlag=Y";
			const brandBox = $('.search_box.brand');
	       if ($(this).is(':checked')) {
	           // 체크박스가 체크되었을 때
	           if (url.indexOf('brandId=' + brandID) === -1) {
	               // 파라미터가 없으면 파라미터 추가
	               var separator = url.indexOf('?') !== -1 ? '&' : '?';
	               if (brandBox.hasClass('on')) {
	               	window.location.href = url + separator + 'brandId=' + brandID + plusButtonFlag +quickyn;
					}else{
						window.location.href = url + separator + 'brandId=' + brandID+quickyn;

					}
	               
	           }
	       } else {
	           // 체크박스가 해제되었을 때
	           if (url.indexOf('brandId=' + brandID) !== -1) {
	               // 파라미터가 있으면 파라미터 삭제
	               var newUrl = url.replace(new RegExp('[?&]brandId=' + brandID), '');
	               if (brandBox.hasClass('more_view')) {
	               	window.location.href = newUrl + plusButtonFlag+quickyn;
					}else{
						window.location.href = newUrl+quickyn;
					}
	               
	           }
	       }
	   })   
   
   
   $("#price").on("click",function(){
	   let minPrice = $("#sale_below_price").val()
	   let maxPrice = $("#sale_over_price").val()
	   const URLSearch = new URLSearchParams(location.search)
		URLSearch.set("minPrice", String(minPrice))
		URLSearch.set("maxPrice", String(maxPrice))
		const newParam = URLSearch.toString();
		window.location.href = location.pathname + '?' + newParam
		//window.location.href = url + categorySmallId;
   })
	
})
</script>
<div id="Container">
	<!-- #Contents -->

	<div id="Contents">
		<form name="search" id="search"
			action="/store/search/getSearchMain.do" method="get"
			onsubmit="return false;">
			<input type="hidden" name="startCount" value="0"> <input
				type="hidden" name="sort" value="RANK/DESC"> <input
				type="hidden" name="goods_sort" id="goods_sort"
				value="WEIGHT/DESC,RANK/DESC"> <input type="hidden"
				name="collection" value="ALL"> <input type="hidden"
				name="realQuery" id="realQuery" value="로션"> <input
				type="hidden" name="reQuery" id="reQuery" value=""> <input
				type="hidden" name="viewtype" value="image"> <input
				type="hidden" name="category" value=""> <input type="hidden"
				name="catename" value="LCTG_ID"> <input type="hidden"
				name="catedepth" value="1"> <input type="hidden" name="rt"
				value=""> <input type="hidden" name="setMinPrice" value="">
			<input type="hidden" name="setMaxPrice" value=""> <input
				type="hidden" name="listnum" id="listnum" value="24"> <input
				type="hidden" name="tmp_requery" value=""> <input
				type="hidden" name="tmp_requery2" id="tmp_requery2" value="">
			<input type="hidden" name="categoryDepthValue" value=""> <input
				type="hidden" name="cateId" value=""> <input type="hidden"
				name="cateId2" value=""> <input type="hidden"
				name="BenefitAll_CHECK" value=""> <input type="hidden"
				name="query" id="query" value="로션"> <input type="hidden"
				name="selectCateNm" id="selectCateNm" value="전체"> <input
				type="hidden" name="firstTotalCount" id="firstTotalCount"
				value="969"> <input type="hidden" name="typeChk"
				id="typeChk" value="thum"> <input type="hidden"
				name="branChk" id="branChk" value=""> <input type="hidden"
				name="brandTop" id="brandTop" value=""> <input type="hidden"
				name="attrChk" id="attrChk" value=""> <input type="hidden"
				name="attrTop" id="attrTop" value=""> <input type="hidden"
				name="onlyOneBrand" id="onlyOneBrand" value=""> <input
				type="hidden" name="quickYn" id="quickYn" value="N"> <input
				type="hidden" name="cateChk" id="cateChk" value=""> <input
				type="hidden" name="benefitChk" id="benefitChk" value=""> <input
				type="hidden" name="attrCheck0" id="attrCheck0" value=""> <input
				type="hidden" name="attrCheck1" id="attrCheck1" value=""> <input
				type="hidden" name="attrCheck2" id="attrCheck2" value=""> <input
				type="hidden" name="attrCheck3" id="attrCheck3" value=""> <input
				type="hidden" name="attrCheck4" id="attrCheck4" value=""> <input
				type="hidden" name="brandChkList" id="brandChkList" value="">
			<input type="hidden" name="benefitChkList" id="benefitChkList"
				value=""> <input type="hidden" name="_displayImgUploadUrl"
				id="_displayImgUploadUrl"
				value="https://image.oliveyoung.co.kr/uploads/images/display/">

			<input type="hidden" name="recobellMbrNo" id="recobellMbrNo"
				value="null"> <input type="hidden" name="recobellCuid"
				id="recobellCuid" value="8b47cf9f-efd1-48e4-8f83-10ee8a07945b">

			<input type="hidden" name="t_page" id="t_page" value=""> <input
				type="hidden" name="t_click" id="t_click" value=""> <input
				type="hidden" name="t_search_name" id="t_search_name" value="">

			<!-- 20210805 오타 키워드 정타 키워드 변경 알림 S -->
			<div id="suggestKeywordWrap"></div>
			<!-- 20210805 오타 키워드 정타 키워드 변경 알림 E -->

			<!-- 검색어오류 영역 추가 (2017-01-13 추가)  -->
			<div class="searchResultArea">
				<p class="resultTxt">
				<strong>
				<c:forEach items="${searchWord}" var="searchWord">
				${searchWord}
				</c:forEach>
				</strong>
					검색결과 (전체 <span>${totalRecords}개</span>의
					상품)
				</p>
				<div class="searchWrap">
					<div class="check_today">
						<input type="checkbox" id="check_view" name="check_view"
							class="chkSmall" value="" onclick="javascript:quickOnclick();"
							data-attr="통합검색결과페이지^오늘드림여부^오늘드림상품"> <label
							for="check_view">오늘드림 상품만 보기</label>
					</div>
					<input type="text" title="결과 내 검색창" placeholder="결과 내 검색"
						id="reChk"> <input
						id="reChk2" type="submit" value="검색" title="검색" onclick="reSearch()">
				</div>
			</div>
			<!--// 검색어오류 영역 추가 -->
			<!-- 연관검색어 -->
			<div class="relatedSearch" style="display: none;">
				<div class="tit">
					<span>연관검색어</span>
				</div>
				<div class="link" id="recommend"></div>
				<button class="btn_more">더보기</button>
			</div>
			<!-- //연관검색어 -->

			<!-- 상품 속성 정보 검색 서비스 개선 -->
			<div class="detailSearch new">
				<div class="search_box cate">
					<div class="inner">
						<h4 class="tit_th">
							카테고리
							<button class="btnMore">열기/닫기</button>
						</h4>
						<!-- 버튼은 6개 이상만 노출 -->
						<!-- 카테고리는 서브 텝 존재로 구조가 다름 zzzzzzzzzzzzzzz -->
						<ul class="list show">
							<c:forEach items="${categorySmallList}" var="cat"
								varStatus="loop">
								<c:if test="${loop.index <= 5}">
									<li><a href="javascript:void(0);"
										id="${cat.categorySmallId}"
										class="cate <c:if test='${cat.categorySmallId eq categorySmallId}'> on active check </c:if>"
										value="${cat.categorySmallId}"
										onclick="javascript:CateOnclick('10000010001','스킨케어')"
										data-attr="통합검색결과페이지^필터_카테고리^스킨케어">${cat.categorySmallName}<span></span></a>
										<!-- 대카 클릭시 클래스 on--> <!-- // 2017-01-16 중카 영역이동 div subCate 안으로  // -->
									</li>
								</c:if>
							</c:forEach>
						</ul>

						<ul class="list ">
							<!-- cateId.equals("") -->
							<c:forEach items="${categorySmallList}" var="cat"
								varStatus="loop">
								<c:if test="${loop.index > 5}">
									<li><a href="javascript:void(0);"
										id="${cat.categorySmallId}"
										class="cate <c:if test='${cat.categorySmallId eq categorySmallId}'> on active check </c:if>"
										value="${cat.categorySmallId}"
										onclick="javascript:CateOnclick('10000030005','리빙/펫')"
										data-attr="통합검색결과페이지^필터_카테고리^리빙/펫">${cat.categorySmallName}<span></span></a>
										<!-- 대카 클릭시 클래스 on--> <!-- // 2017-01-16 중카 영역이동 div subCate 안으로  // -->
									</li>
								</c:if>
							</c:forEach>
						</ul>

					</div>
				</div>
				<div class="search_box brand">
					<div class="inner">
						<h4 class="tit_th">
							브랜드
							<button class="btnMore">열기/닫기</button>
						</h4>
						<ul class="list scrbar">
							<c:forEach items="${brandList }" var="brandList">
								<li><input type="checkbox" id="inpChk1_A000451"
									name="brandId" value="${brandList.brandId}"
									onclick="javascript:brandOnclick('A000451','바이오더마');"
									data-attr="통합검색결과페이지^필터_브랜드^바이오더마"><label
									for="inpChk1_A000451">${brandList.brandName}</label></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- //브랜드 -->
				<!-- <div class="search_box attBox">
					<div class="tooltip" id="tooltip">
						<p class="txt">NEW</p>
						<button type="button" class="toolClose">
							<span class="blind"></span>
						</button>
					</div>
					<div class="inner ">
						<h4 class="tit_th">
							주요기능
							<button class="btnMore">열기/닫기</button>
						</h4>
						<ul class="list scrbar">
							<li><input type="checkbox"
								id="inpChk1_977177c2d629dd90be4dfb19f1bf9848" name="attr_check0"
								value="977177c2d629dd90be4dfb19f1bf9848"
								onclick="javascript:attrOnclick('0','보습');"
								data-attr="통합검색결과페이지^필터_기능^보습"><label
								for="inpChk1_977177c2d629dd90be4dfb19f1bf9848">보습</label></li>
							<li><input type="checkbox"
								id="inpChk1_72ff9ca39c2e937a886d15d340972912" name="attr_check0"
								value="72ff9ca39c2e937a886d15d340972912"
								onclick="javascript:attrOnclick('0','진정');"
								data-attr="통합검색결과페이지^필터_기능^진정"><label
								for="inpChk1_72ff9ca39c2e937a886d15d340972912">진정</label></li>
							<li><input type="checkbox"
								id="inpChk1_46f73fc41108774261eb7b60b5920023" name="attr_check0"
								value="46f73fc41108774261eb7b60b5920023"
								onclick="javascript:attrOnclick('0','수분공급');"
								data-attr="통합검색결과페이지^필터_기능^수분공급"><label
								for="inpChk1_46f73fc41108774261eb7b60b5920023">수분공급</label></li>
							<li><input type="checkbox"
								id="inpChk1_aad2e71369eb2537723bbd3ea59c1b02" name="attr_check0"
								value="aad2e71369eb2537723bbd3ea59c1b02"
								onclick="javascript:attrOnclick('0','장벽강화');"
								data-attr="통합검색결과페이지^필터_기능^장벽강화"><label
								for="inpChk1_aad2e71369eb2537723bbd3ea59c1b02">장벽강화</label></li>
							<li><input type="checkbox"
								id="inpChk1_bf77bcffcd6fc23fd502d9c765dbac23" name="attr_check0"
								value="bf77bcffcd6fc23fd502d9c765dbac23"
								onclick="javascript:attrOnclick('0','고보습');"
								data-attr="통합검색결과페이지^필터_기능^고보습"><label
								for="inpChk1_bf77bcffcd6fc23fd502d9c765dbac23">고보습</label></li>
							<li><input type="checkbox"
								id="inpChk1_aa77c2698665d42a235c51a2fdabc3f3" name="attr_check0"
								value="aa77c2698665d42a235c51a2fdabc3f3"
								onclick="javascript:attrOnclick('0','주름개선');"
								data-attr="통합검색결과페이지^필터_기능^주름개선"><label
								for="inpChk1_aa77c2698665d42a235c51a2fdabc3f3">주름개선</label></li>
							<li><input type="checkbox"
								id="inpChk1_b9fe07883356346996a0deab6bd67f7e" name="attr_check0"
								value="b9fe07883356346996a0deab6bd67f7e"
								onclick="javascript:attrOnclick('0','영양공급');"
								data-attr="통합검색결과페이지^필터_기능^영양공급"><label
								for="inpChk1_b9fe07883356346996a0deab6bd67f7e">영양공급</label></li>
							<li><input type="checkbox"
								id="inpChk1_c82f979a97690251e42c6f19df9330ba" name="attr_check0"
								value="c82f979a97690251e42c6f19df9330ba"
								onclick="javascript:attrOnclick('0','미백');"
								data-attr="통합검색결과페이지^필터_기능^미백"><label
								for="inpChk1_c82f979a97690251e42c6f19df9330ba">미백</label></li>
							<li><input type="checkbox"
								id="inpChk1_3207731b7941a4628f72229c6fc1b84a" name="attr_check0"
								value="3207731b7941a4628f72229c6fc1b84a"
								onclick="javascript:attrOnclick('0','향기케어');"
								data-attr="통합검색결과페이지^필터_기능^향기케어"><label
								for="inpChk1_3207731b7941a4628f72229c6fc1b84a">향기케어</label></li>
							<li><input type="checkbox"
								id="inpChk1_21f0c254e23eadde11b6cb49b4721180" name="attr_check0"
								value="21f0c254e23eadde11b6cb49b4721180"
								onclick="javascript:attrOnclick('0','유수분밸런스');"
								data-attr="통합검색결과페이지^필터_기능^유수분밸런스"><label
								for="inpChk1_21f0c254e23eadde11b6cb49b4721180">유수분밸런스</label></li>
						</ul>
					</div>
					<div class="inner depth">
						<h4 class="tit_th">주요성분</h4>
						<ul class="list scrbar">
							<li><input type="checkbox"
								id="inpChk1_dc468d63cb625bd91ac87e06e0c95782" name="attr_check1"
								value="dc468d63cb625bd91ac87e06e0c95782"
								onclick="javascript:attrOnclick('1','히알루론산');"
								data-attr="통합검색결과페이지^필터_기능^히알루론산"><label
								for="inpChk1_dc468d63cb625bd91ac87e06e0c95782">히알루론산</label></li>
							<li><input type="checkbox"
								id="inpChk1_16659254b6477e6421c4ba2d1e6a838e" name="attr_check1"
								value="16659254b6477e6421c4ba2d1e6a838e"
								onclick="javascript:attrOnclick('1','판테놀');"
								data-attr="통합검색결과페이지^필터_기능^판테놀"><label
								for="inpChk1_16659254b6477e6421c4ba2d1e6a838e">판테놀</label></li>
							<li><input type="checkbox"
								id="inpChk1_4a1dc3ba74f1553c623666e2be2c3eb1" name="attr_check1"
								value="4a1dc3ba74f1553c623666e2be2c3eb1"
								onclick="javascript:attrOnclick('1','세라마이드');"
								data-attr="통합검색결과페이지^필터_기능^세라마이드"><label
								for="inpChk1_4a1dc3ba74f1553c623666e2be2c3eb1">세라마이드</label></li>
							<li><input type="checkbox"
								id="inpChk1_b93ebb36332569581f397ce6d19bc33a" name="attr_check1"
								value="b93ebb36332569581f397ce6d19bc33a"
								onclick="javascript:attrOnclick('1','시어버터');"
								data-attr="통합검색결과페이지^필터_기능^시어버터"><label
								for="inpChk1_b93ebb36332569581f397ce6d19bc33a">시어버터</label></li>
							<li><input type="checkbox"
								id="inpChk1_00845e194212341b52479154ae313814" name="attr_check1"
								value="00845e194212341b52479154ae313814"
								onclick="javascript:attrOnclick('1','시카케어');"
								data-attr="통합검색결과페이지^필터_기능^시카케어"><label
								for="inpChk1_00845e194212341b52479154ae313814">시카케어</label></li>
							<li><input type="checkbox"
								id="inpChk1_f7aea081f01c1638c299fcd675fcbc96" name="attr_check1"
								value="f7aea081f01c1638c299fcd675fcbc96"
								onclick="javascript:attrOnclick('1','나이아신아마이드');"
								data-attr="통합검색결과페이지^필터_기능^나이아신아마이드"><label
								for="inpChk1_f7aea081f01c1638c299fcd675fcbc96">나이아신아마이드</label></li>
							<li><input type="checkbox"
								id="inpChk1_4a505c20e9ae54c30af7c74aebf5196c" name="attr_check1"
								value="4a505c20e9ae54c30af7c74aebf5196c"
								onclick="javascript:attrOnclick('1','글리세린');"
								data-attr="통합검색결과페이지^필터_기능^글리세린"><label
								for="inpChk1_4a505c20e9ae54c30af7c74aebf5196c">글리세린</label></li>
							<li><input type="checkbox"
								id="inpChk1_ddb065456c83c9c2351fcb41a1fd491e" name="attr_check1"
								value="ddb065456c83c9c2351fcb41a1fd491e"
								onclick="javascript:attrOnclick('1','스쿠알렌');"
								data-attr="통합검색결과페이지^필터_기능^스쿠알렌"><label
								for="inpChk1_ddb065456c83c9c2351fcb41a1fd491e">스쿠알렌</label></li>
							<li><input type="checkbox"
								id="inpChk1_dd671223126f85f5f6cf28eba157ab3d" name="attr_check1"
								value="dd671223126f85f5f6cf28eba157ab3d"
								onclick="javascript:attrOnclick('1','온천수');"
								data-attr="통합검색결과페이지^필터_기능^온천수"><label
								for="inpChk1_dd671223126f85f5f6cf28eba157ab3d">온천수</label></li>
							<li><input type="checkbox"
								id="inpChk1_71e646ad3204994f5cb50f66b69ab16b" name="attr_check1"
								value="71e646ad3204994f5cb50f66b69ab16b"
								onclick="javascript:attrOnclick('1','알로에추출물');"
								data-attr="통합검색결과페이지^필터_기능^알로에추출물"><label
								for="inpChk1_71e646ad3204994f5cb50f66b69ab16b">알로에추출물</label></li>
						</ul>
					</div>
					<div class="inner depth">
						<h4 class="tit_th">제품특징</h4>
						<ul class="list scrbar">
							<li><input type="checkbox"
								id="inpChk1_630194e6c2edca661b6d7ffaa673c068" name="attr_check2"
								value="630194e6c2edca661b6d7ffaa673c068"
								onclick="javascript:attrOnclick('2','저자극테스트');"
								data-attr="통합검색결과페이지^필터_기능^저자극테스트"><label
								for="inpChk1_630194e6c2edca661b6d7ffaa673c068">저자극테스트</label></li>
							<li><input type="checkbox"
								id="inpChk1_35b9049588da27bf043f49c3f0179d39" name="attr_check2"
								value="35b9049588da27bf043f49c3f0179d39"
								onclick="javascript:attrOnclick('2','저자극');"
								data-attr="통합검색결과페이지^필터_기능^저자극"><label
								for="inpChk1_35b9049588da27bf043f49c3f0179d39">저자극</label></li>
							<li><input type="checkbox"
								id="inpChk1_34154ef6cebc9811a075e58aa6609c4c" name="attr_check2"
								value="34154ef6cebc9811a075e58aa6609c4c"
								onclick="javascript:attrOnclick('2','강한보습력');"
								data-attr="통합검색결과페이지^필터_기능^강한보습력"><label
								for="inpChk1_34154ef6cebc9811a075e58aa6609c4c">강한보습력</label></li>
							<li><input type="checkbox"
								id="inpChk1_8e6dd2a505ef7763b750a760c3172459" name="attr_check2"
								value="8e6dd2a505ef7763b750a760c3172459"
								onclick="javascript:attrOnclick('2','Non-파라벤');"
								data-attr="통합검색결과페이지^필터_기능^Non-파라벤"><label
								for="inpChk1_8e6dd2a505ef7763b750a760c3172459">Non-파라벤</label></li>
							<li><input type="checkbox"
								id="inpChk1_e4dabbf937aa4795732c45fd09d6805e" name="attr_check2"
								value="e4dabbf937aa4795732c45fd09d6805e"
								onclick="javascript:attrOnclick('2','피부과테스트');"
								data-attr="통합검색결과페이지^필터_기능^피부과테스트"><label
								for="inpChk1_e4dabbf937aa4795732c45fd09d6805e">피부과테스트</label></li>
							<li><input type="checkbox"
								id="inpChk1_cc0ea507341e7fc3b5eeaa0882767035" name="attr_check2"
								value="cc0ea507341e7fc3b5eeaa0882767035"
								onclick="javascript:attrOnclick('2','기획상품');"
								data-attr="통합검색결과페이지^필터_기능^기획상품"><label
								for="inpChk1_cc0ea507341e7fc3b5eeaa0882767035">기획상품</label></li>
							<li><input type="checkbox"
								id="inpChk1_2b14a489d82d55dfbad408dbcaa60536" name="attr_check2"
								value="2b14a489d82d55dfbad408dbcaa60536"
								onclick="javascript:attrOnclick('2','펌핑타입');"
								data-attr="통합검색결과페이지^필터_기능^펌핑타입"><label
								for="inpChk1_2b14a489d82d55dfbad408dbcaa60536">펌핑타입</label></li>
							<li><input type="checkbox"
								id="inpChk1_5a3f366f3063aa119af52d271ecdf481" name="attr_check2"
								value="5a3f366f3063aa119af52d271ecdf481"
								onclick="javascript:attrOnclick('2','논코메도제닉');"
								data-attr="통합검색결과페이지^필터_기능^논코메도제닉"><label
								for="inpChk1_5a3f366f3063aa119af52d271ecdf481">논코메도제닉</label></li>
							<li><input type="checkbox"
								id="inpChk1_a614a3bd1451bf97d43a1409f566764c" name="attr_check2"
								value="a614a3bd1451bf97d43a1409f566764c"
								onclick="javascript:attrOnclick('2','Non-합성향료');"
								data-attr="통합검색결과페이지^필터_기능^Non-합성향료"><label
								for="inpChk1_a614a3bd1451bf97d43a1409f566764c">Non-합성향료</label></li>
							<li><input type="checkbox"
								id="inpChk1_cde5154f840bb440c43db2ab288dbea3" name="attr_check2"
								value="cde5154f840bb440c43db2ab288dbea3"
								onclick="javascript:attrOnclick('2','올인원');"
								data-attr="통합검색결과페이지^필터_기능^올인원"><label
								for="inpChk1_cde5154f840bb440c43db2ab288dbea3">올인원</label></li>
						</ul>
					</div>
					<div class="inner depth">
						<h4 class="tit_th">추천피부타입</h4>
						<ul class="list scrbar">
							<li><input type="checkbox"
								id="inpChk1_ed6bd3c7327f299526e55cd15dfb0b31" name="attr_check3"
								value="ed6bd3c7327f299526e55cd15dfb0b31"
								onclick="javascript:attrOnclick('3','모든피부타입');"
								data-attr="통합검색결과페이지^필터_기능^모든피부타입"><label
								for="inpChk1_ed6bd3c7327f299526e55cd15dfb0b31">모든피부타입</label></li>
							<li><input type="checkbox"
								id="inpChk1_4656d6583a85bf2c2b893ad834260537" name="attr_check3"
								value="4656d6583a85bf2c2b893ad834260537"
								onclick="javascript:attrOnclick('3','민감성');"
								data-attr="통합검색결과페이지^필터_기능^민감성"><label
								for="inpChk1_4656d6583a85bf2c2b893ad834260537">민감성</label></li>
							<li><input type="checkbox"
								id="inpChk1_379d3e9e0e9ee3482f209611ffe7028d" name="attr_check3"
								value="379d3e9e0e9ee3482f209611ffe7028d"
								onclick="javascript:attrOnclick('3','건성');"
								data-attr="통합검색결과페이지^필터_기능^건성"><label
								for="inpChk1_379d3e9e0e9ee3482f209611ffe7028d">건성</label></li>
							<li><input type="checkbox"
								id="inpChk1_a503660b7d1ea65e093646c5332ae0e7" name="attr_check3"
								value="a503660b7d1ea65e093646c5332ae0e7"
								onclick="javascript:attrOnclick('3','지성');"
								data-attr="통합검색결과페이지^필터_기능^지성"><label
								for="inpChk1_a503660b7d1ea65e093646c5332ae0e7">지성</label></li>
							<li><input type="checkbox"
								id="inpChk1_4a173d661a65b65a965f9613a813468f" name="attr_check3"
								value="4a173d661a65b65a965f9613a813468f"
								onclick="javascript:attrOnclick('3','복합성');"
								data-attr="통합검색결과페이지^필터_기능^복합성"><label
								for="inpChk1_4a173d661a65b65a965f9613a813468f">복합성</label></li>
							<li><input type="checkbox"
								id="inpChk1_1868965f7589d232c16e74e6bf07a529" name="attr_check3"
								value="1868965f7589d232c16e74e6bf07a529"
								onclick="javascript:attrOnclick('3','악건성');"
								data-attr="통합검색결과페이지^필터_기능^악건성"><label
								for="inpChk1_1868965f7589d232c16e74e6bf07a529">악건성</label></li>
							<li><input type="checkbox"
								id="inpChk1_7bc900f09a13ce16223a515dda501412" name="attr_check3"
								value="7bc900f09a13ce16223a515dda501412"
								onclick="javascript:attrOnclick('3','수부지');"
								data-attr="통합검색결과페이지^필터_기능^수부지"><label
								for="inpChk1_7bc900f09a13ce16223a515dda501412">수부지</label></li>
							<li><input type="checkbox"
								id="inpChk1_032bf5b37e5032d4634d92e03637c0ea" name="attr_check3"
								value="032bf5b37e5032d4634d92e03637c0ea"
								onclick="javascript:attrOnclick('3','중성');"
								data-attr="통합검색결과페이지^필터_기능^중성"><label
								for="inpChk1_032bf5b37e5032d4634d92e03637c0ea">중성</label></li>
							<li><input type="checkbox"
								id="inpChk1_49be792be23a20a82263d73bf200f1ca" name="attr_check3"
								value="49be792be23a20a82263d73bf200f1ca"
								onclick="javascript:attrOnclick('3','일반타입');"
								data-attr="통합검색결과페이지^필터_기능^일반타입"><label
								for="inpChk1_49be792be23a20a82263d73bf200f1ca">일반타입</label></li>
						</ul>
					</div>
					<div class="inner depth">
						<h4 class="tit_th">제형타입</h4>
						<ul class="list scrbar">
							<li><input type="checkbox"
								id="inpChk1_fc00b35d16113280f3fdb2f6e9a045b2" name="attr_check4"
								value="fc00b35d16113280f3fdb2f6e9a045b2"
								onclick="javascript:attrOnclick('4','묽은제형');"
								data-attr="통합검색결과페이지^필터_기능^묽은제형"><label
								for="inpChk1_fc00b35d16113280f3fdb2f6e9a045b2">묽은제형</label></li>
							<li><input type="checkbox"
								id="inpChk1_a2927561da9124a5596dd85ae899dafe" name="attr_check4"
								value="a2927561da9124a5596dd85ae899dafe"
								onclick="javascript:attrOnclick('4','되직한제형');"
								data-attr="통합검색결과페이지^필터_기능^되직한제형"><label
								for="inpChk1_a2927561da9124a5596dd85ae899dafe">되직한제형</label></li>
							<li><input type="checkbox"
								id="inpChk1_12907304b5948dae37f59b9bac65b62e" name="attr_check4"
								value="12907304b5948dae37f59b9bac65b62e"
								onclick="javascript:attrOnclick('4','크림제형');"
								data-attr="통합검색결과페이지^필터_기능^크림제형"><label
								for="inpChk1_12907304b5948dae37f59b9bac65b62e">크림제형</label></li>
							<li><input type="checkbox"
								id="inpChk1_7fa7af6c4fff4a30a90e32e527256213" name="attr_check4"
								value="7fa7af6c4fff4a30a90e32e527256213"
								onclick="javascript:attrOnclick('4','물제형');"
								data-attr="통합검색결과페이지^필터_기능^물제형"><label
								for="inpChk1_7fa7af6c4fff4a30a90e32e527256213">물제형</label></li>
							<li><input type="checkbox"
								id="inpChk1_f92c44b99cb7ecd31f46f35fc27495f4" name="attr_check4"
								value="f92c44b99cb7ecd31f46f35fc27495f4"
								onclick="javascript:attrOnclick('4','쫀쫀한제형');"
								data-attr="통합검색결과페이지^필터_기능^쫀쫀한제형"><label
								for="inpChk1_f92c44b99cb7ecd31f46f35fc27495f4">쫀쫀한제형</label></li>
							<li><input type="checkbox"
								id="inpChk1_0e19685f21d8ba026ea1bb8132a3a9ea" name="attr_check4"
								value="0e19685f21d8ba026ea1bb8132a3a9ea"
								onclick="javascript:attrOnclick('4','젤제형');"
								data-attr="통합검색결과페이지^필터_기능^젤제형"><label
								for="inpChk1_0e19685f21d8ba026ea1bb8132a3a9ea">젤제형</label></li>
							<li><input type="checkbox"
								id="inpChk1_19d1220b7dde6eb1ce230270a93c2d7b" name="attr_check4"
								value="19d1220b7dde6eb1ce230270a93c2d7b"
								onclick="javascript:attrOnclick('4','콧물제형');"
								data-attr="통합검색결과페이지^필터_기능^콧물제형"><label
								for="inpChk1_19d1220b7dde6eb1ce230270a93c2d7b">콧물제형</label></li>
							<li><input type="checkbox"
								id="inpChk1_7f47ed3b7a803a9cc75d223998617aeb" name="attr_check4"
								value="7f47ed3b7a803a9cc75d223998617aeb"
								onclick="javascript:attrOnclick('4','꾸덕한제형');"
								data-attr="통합검색결과페이지^필터_기능^꾸덕한제형"><label
								for="inpChk1_7f47ed3b7a803a9cc75d223998617aeb">꾸덕한제형</label></li>
							<li><input type="checkbox"
								id="inpChk1_b4a5a2418b60d818bdd96aaa6c183a26" name="attr_check4"
								value="b4a5a2418b60d818bdd96aaa6c183a26"
								onclick="javascript:attrOnclick('4','밤제형');"
								data-attr="통합검색결과페이지^필터_기능^밤제형"><label
								for="inpChk1_b4a5a2418b60d818bdd96aaa6c183a26">밤제형</label></li>
							<li><input type="checkbox"
								id="inpChk1_c4e3726be3f88f236622dceebd314987" name="attr_check4"
								value="c4e3726be3f88f236622dceebd314987"
								onclick="javascript:attrOnclick('4','젤크림제형');"
								data-attr="통합검색결과페이지^필터_기능^젤크림제형"><label
								for="inpChk1_c4e3726be3f88f236622dceebd314987">젤크림제형</label></li>
						</ul>
					</div>
				</div> -->
				<!-- //속성항목 -->
				<!-- <div class="search_box benefit">
					<div class="inner">
						<h4 class="tit_th">
							혜택
							<button class="btnMore">열기/닫기</button>
						</h4>
						<ul class="list scrbar">
							<li><input type="checkbox" id="inpChk18" name=""
								value="BenefitAll" data-attr="통합검색결과페이지^필터_혜택^전체"
								onclick="javascript:benefitAllclick();"> <label
								for="inpChk18">전체</label><span></span></li>
							<li><input type="checkbox" id="inpChk19"
								name="benefit_check" data-attr="통합검색결과페이지^필터_혜택^쿠폰상품"
								value="DNLD_CPN_YN"
								onclick="javascript:benefitOnclick('DNLD_CPN_YN','쿠폰상품');"
								disabled="true"><label for="inpChk19">쿠폰상품</label></li>
							<li><input type="checkbox" id="inpChk20"
								name="benefit_check" data-attr="통합검색결과페이지^필터_혜택^세일상품"
								value="DSCNT_YN"
								onclick="javascript:benefitOnclick('DSCNT_YN','세일상품');">
								<label for="inpChk20">세일상품</label></li>
							<li><input type="checkbox" id="inpChk21"
								name="benefit_check" data-attr="통합검색결과페이지^필터_혜택^1+1"
								value="ASSOC_PROMT_STD_CNT_1"
								onclick="javascript:benefitOnclick('ASSOC_PROMT_STD_CNT_1','1+1');"
								disabled="true"> <label for="inpChk21">1+1</label></li>
							<li><input type="checkbox" id="inpChk22"
								name="benefit_check" data-attr="통합검색결과페이지^필터_혜택^2+1"
								value="ASSOC_PROMT_STD_CNT_2"
								onclick="javascript:benefitOnclick('ASSOC_PROMT_STD_CNT_2','2+1');"
								disabled="true"> <label for="inpChk22">2+1</label></li>
							<li><input type="checkbox" id="inpChk23"
								name="benefit_check" data-attr="통합검색결과페이지^필터_혜택^증정상품"
								value="PRST_YN"
								onclick="javascript:benefitOnclick('PRST_YN','증정상품');">
								<label for="inpChk23">증정상품</label></li>
							<li><input type="checkbox" id="inpChk24"
								name="benefit_check" data-attr="통합검색결과페이지^필터_혜택^무료배송"
								value="FREE_DLV_YN"
								onclick="javascript:benefitOnclick('FREE_DLV_YN','무료배송');"
								disabled="true"> <label for="inpChk24">무료배송</label></li>
						</ul>
					</div>
				</div> -->
				<!-- //혜택 -->
				<div class="search_box">
					<div class="inner">
						<h4 class="tit_th">가격대</h4>
						<div class="priceSearch">
							<input type="text" id="sale_below_price" name="sale_below_price"
								placeholder="최저가" value="${param.minPrice}" title=""><span>~</span> <input
								type="text" id="sale_over_price" name="sale_over_price"
								placeholder="최고가" value="${param.maxPrice}" title=""> <input
								type="submit" value="가격대 적용" title="가격대 적용"
								onclick="return Price_Search()"
								id="price">
						</div>
					</div>
				</div>
				<!-- //가격대 -->
				<div class="btnBox">
					<dl class="choice_area clrfix">
						<dt>선택필터</dt>
						<dd>
							<ul class="choiceKey clrfix">
								<c:forEach items="${categorySmallList}" var="cat">
									<c:if test="${cat.categorySmallId eq categorySmallId }">
										<li><button class="btn_del"
												onclick="doDelCate('${cat.categorySmallId}');">${cat.categorySmallName}</button></li>
									</c:if>
								</c:forEach>
								<c:forEach items="${brandId}" var="brandId">
								<c:forEach items="${brandList }" var="brandList">
								<c:if test="${brandList.brandId eq brandId}">
								<li><button class="btn_del" onclick="doDelFilter('${brandId}');">${brandList.brandName}</button></li>
								</c:if>
								</c:forEach>
								</c:forEach>
								<c:if test="${not empty param.minPrice or not empty param.maxPrice}">
								<li><button class="btn_del" onclick="doDelprice(${param.minPrice}
								<c:if test="${empty param.minPrice}">0</c:if>,${param.maxPrice});">${param.minPrice} ~ ${param.maxPrice}</button></li>
								</c:if>
							</ul>
						</dd>
					</dl>
					<button type="button" class="btnReset"
						onclick="Reset_Button_Click();">선택 초기화</button>
				</div>
			</div>
			<!-- // 상품 속성 정보 검색 서비스 개선 -->
		</form>

		<div id="banner_area">
			<div class="promoBanner2">
				<a href="#"
					onclick="javascript:common.wlog('search_result_plan');javascript:common.link.movePlanShop('500000101430408','SearchBanner');"
					data-attr="통합검색결과페이지^연간기획전배너^THREE 브랜드 소개"> <span
					class="promo_flag promo">기획전</span>
					<p class="promo_desc">THREE 브랜드 소개</p>
					<p class="promo_tit"></p>
				</a>
			</div>
		</div>

		<p class="cate_info_tx">
			전체<span>${totalRecords}</span>개의 상품이 등록되어 있습니다.
		</p>
		<!-- bFirstSearch -->
		<!-- 상품 정렬 조건 영역 -->
		<div class="cate_align_box">
			<div class="align_sort">
				<ul>
					<li class="on"><a href="#" value="WEIGHT/DESC,RANK/DESC"
						onclick="doSorting('WEIGHT/DESC,RANK/DESC');" data-prdsoting="1">인기순</a></li>
					<li><a href="#" value="WEIGHT/DESC,DATE/DESC"
						onclick="doSorting('WEIGHT/DESC,DATE/DESC');" data-prdsoting="2">신상품순</a></li>
					<li><a href="#" value="WEIGHT/DESC,SALE_QTY/DESC"
						onclick="doSorting('WEIGHT/DESC,SALE_QTY/DESC');"
						data-prdsoting="3">판매순</a></li>


					<li><a href="#" value="WEIGHT/DESC,SALE_PRC/ASC"
						onclick="doSorting('WEIGHT/DESC,SALE_PRC/ASC');"
						data-prdsoting="4">낮은 가격순</a></li>

					<li><a href="#" value="WEIGHT/DESC,SALE_PER/DESC"
						onclick="doSorting('WEIGHT/DESC,SALE_PER/DESC');"
						data-prdsoting="5">할인율순</a></li>
				</ul>
			</div>
			<div class="count_sort tx_num">
				<span class="tx_view">VIEW</span>
				<ul>
					<li class="on">24</li>
					<li><a href="#" title="36개씩 보기"
						onclick="javascript:ShowViewList('36');">36</a></li>
					<li><a href="#" title="48개씩 보기"
						onclick="javascript:ShowViewList('48');">48</a></li>
				</ul>
			</div>
			<div class="type_sort">
				<button class="btn_thumb active">컬럼형식으로 보기</button>
				<button class="btn_list">리스트형식으로 보기</button>
			</div>
		</div>
		<!--// 상품 정렬 조건 영역 -->

		<!-- 카테고리 상품 리스트 -->
		<!-- 컬럼형 리스트 -->
		<div id="ajaxList">
			<c:forEach var="i" varStatus="outerLoop" begin="1" end="6">
				<ul id="w_cate_prd_list" class="cate_prd_list">
					<c:set var="innerLoopBegin" value="${(outerLoop.index - 1) * 4}" />
					<c:set var="innerLoopEnd" value="${(outerLoop.index * 4) -1}" />
					<c:forEach items="${productList}" var="pml"
						begin="${innerLoopBegin}" end="${innerLoopEnd}"
						varStatus="innerLoop">
						<!-- 1단형일 경우 클래스 list_type 추가 -->
						<li class="flag li_result">
							<div class="prd_info">
								<!-- 이미지 영역 -->
								<!-- [3389141] (영역별 매출분석) 오특, 검색, 베스트, 메인 추가(CHY) -->
								<a href="/store/goods?productDisplayId=${pml.productDisplayId}"
									class="prd_thumb"
									data-attr="통합검색결과페이지^검색결과상품_인기순^[2023어워즈바디1위] 일리윤 세라마이드 아토 로션 600ML+334ML 어워즈 한정기획^1"
									data-trk="/"
									data-impression="A000000192898^통합검색결과페이지_검색결과상품_인기순^1"
									data-impression-visibility="1" name="${pml.productDisplayId}">
									<span class="thumb_flag best">베스트</span> <!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->
									<img src="${pml.productDisplaySrc}"
									onerror="this.src='https://static.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif';this.onerror='';"
									alt="이미지 썸네일">
								</a>
								<!--// 이미지 영역 -->
								<!-- 상품명 -->
								<div class="prd_name">
									<!-- [3389141] (영역별 매출분석) 오특, 검색, 베스트, 메인 추가(CHY) -->
									<a
										href="javascript:gtm.goods.callGoodsGtmInfo('A000000192898',null, 'ee-productClick', '통합검색결과페이지_검색결과상품_인기순', '1');moveGoodsDetailForSearch('A000000192898','1000001000300140001', 'Result_1' ,  '로션' , '1' );"
										data-attr="통합검색결과페이지^검색결과상품_인기순^[2023어워즈바디1위] 일리윤 세라마이드 아토 로션 600ML+334ML 어워즈 한정기획^1"
										data-trk="/"> <span class="tx_brand">${pml.brandName}</span>
										<p class="tx_name">${pml.productDisplayName}</p>
									</a>
								</div>
								<!--// 상품명  -->
								<!-- 찜버튼 -->
								<button
									class="btn_zzim jeem <c:if test='${pml.productLikeState eq 1}'> on </c:if>"
									data-ref-goodsno="${pml.productDisplayId}"
									data-ref-goodsnm="[2023어워즈바디1위] 일리윤 세라마이드 아토 로션 600ML+334ML 어워즈 한정기획"
									data-ref-goodsbrand="일리윤"
									data-ref-goodscategory="바디용품>바디 보습류>바디로션" data-ref-goodstype=""
									data-ref-goodstrackingno="1" data-ref-entrysource="통합검색결과페이지"
									data-ref-cornernm="검색상품상세" onclick="zzimWebLog();">
									<span>찜하기전</span>
								</button>
								<!--// 찜버튼 -->
								<!-- 상품가격 영역 -->
								<p class="prd_price">
									<span class="tx_org"><span class="tx_num">${pml.minprice}</span>원</span>
									<span class="tx_cur"><span class="tx_num">${pml.afterprice}</span>원</span>
								</p>
								<!--// 상품가격 영역 -->
								<!-- 상품 쿠폰 및 플러스 추가 영역 -->
								<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
								<p class="prd_flag">
									<c:if test="${pml.discountflag eq 1}">
										<span class="icon_flag sale">세일</span>
									</c:if>
									<c:if test="${pml.couponflag eq 1}">
										<span class="icon_flag coupon">쿠폰</span>
									</c:if>

									<c:if test="${pml.presentflag eq 1}">
										<span class="icon_flag gift">증정</span>
									</c:if>

									<c:if test="${pml.todaypickupflag > 0}">
										<span class="icon_flag delivery">오늘드림</span>
									</c:if>
								</p>
								<!--// 상품 쿠폰 및 플러스 추가 영역 -->
								<!--  상품평 및 장바구니버튼 -->
								<p class="prd_point_area tx_num">
									<span class="review_point"><span class="point"
										style="width: 90%">1493</span></span>(1493)
								</p>
								<p class="prd_btn_area">
									<button class="cartBtn" data-ref-goodsno="A000000192898"
										data-ref-dispcatno="1000001000300140001" data-ref-itemno="001"
										data-ref-cnt="0" data-ref-prstyn="N" name="Result_1"
										data-ref-goodsnm="[2023어워즈바디1위] 일리윤 세라마이드 아토 로션 600ML+334ML 어워즈 한정기획"
										data-ref-goodsbrand="일리윤"
										data-ref-goodscategory="바디용품>바디 보습류>바디로션"
										data-ref-goodstype="" data-ref-goodstrackingno="1"
										data-ref-entrysource="통합검색결과페이지" data-ref-cornernm="검색상품상세">장바구니</button>
									<button class="btn_new_pop goodsList"
										onclick="javascript:common.link.moveGoodsDetailNew('A000000192898','1000001000300140001');">새창보기</button>
								</p>
								<!-- // 상품평 및 장바구니버튼 -->
							</div>
						</li>
					</c:forEach>

				</ul>

			</c:forEach>

			<c:if test="${empty productList }">
				<div class="search_no_data">
					<p>
						검색하신 <strong> ${param.searchWord }</strong>에 대한 <strong>상세검색</strong> 결과가 없습니다.
					</p>
					<div class="usage-guide">
						<p>다시 검색해 보세요</p>
						<ul>
							<li>검색어의 철자가 정확한지 확인해보세요.</li>
							<li>한글을 영어로 혹은 영어를 한글로 입력했는지 확인해보세요.</li>
							<li>검색어의 띄어쓰기를 다르게 해보세요.</li>
						</ul>
					</div>
				</div>
			</c:if>

			<ul style="">
				<li class="cura_resultsList">
					<div class="cura_pord crtBtm" id="curation_area_s204" style="">
						<div id="inner_cura_keyword">
							<div class="cura_ttl">추천 키워드</div>
							<div class="curation_btnArea">
								<button onclick="javascript:btnKeywordEvent('닥터지올인원')";="">
									<span data-attr="통합검색결과페이지^추천키워드^닥터지올인원">닥터지올인원</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('독도로션')";="">
									<span data-attr="통합검색결과페이지^추천키워드^독도로션">독도로션</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('닥터지')";="">
									<span data-attr="통합검색결과페이지^추천키워드^닥터지">닥터지</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('바이오힐보')";="">
									<span data-attr="통합검색결과페이지^추천키워드^바이오힐보">바이오힐보</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('남자로션')";="">
									<span data-attr="통합검색결과페이지^추천키워드^남자로션">남자로션</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('올인원')";="">
									<span data-attr="통합검색결과페이지^추천키워드^올인원">올인원</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('에스트라')";="">
									<span data-attr="통합검색결과페이지^추천키워드^에스트라">에스트라</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('라운드랩')";="">
									<span data-attr="통합검색결과페이지^추천키워드^라운드랩">라운드랩</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('일리윤')";="">
									<span data-attr="통합검색결과페이지^추천키워드^일리윤">일리윤</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('아누아')";="">
									<span data-attr="통합검색결과페이지^추천키워드^아누아">아누아</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('아벤느')";="">
									<span data-attr="통합검색결과페이지^추천키워드^아벤느">아벤느</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('피지오겔')";="">
									<span data-attr="통합검색결과페이지^추천키워드^피지오겔">피지오겔</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('더마비')";="">
									<span data-attr="통합검색결과페이지^추천키워드^더마비">더마비</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('싸이닉')";="">
									<span data-attr="통합검색결과페이지^추천키워드^싸이닉">싸이닉</span>
								</button>
								<button onclick="javascript:btnKeywordEvent('크리니크')";="">
									<span data-attr="통합검색결과페이지^추천키워드^크리니크">크리니크</span>
								</button>
							</div>
						</div>
					</div>
				</li>
			</ul>
			<ul class="ul_curation" style="">
				<li>
					<div class="cura_pord crtBtm" id="curation_area_s001" style="">
						<div class="curation_slide type01" id="goods_curation_s001">


							<h4 class="tit_h4">
								<span id="txtTitle">이런 상품을 찾으시나요?</span>
								<button class="moreBtn" id="crt_more_s001">
									<span>더보기</span>
								</button>
							</h4>
							<div class="inner_cont" role="toolbar">
								<ul
									class="curation_basket slide_list slick_slider slick-initialized slick-slider slick-dotted"
									id="curation_ulList_s001">
									<button type="button" data-role="none"
										class="slick-prev slick-arrow" aria-label="Previous"
										role="button" style="display: block;">Previous</button>


									<div aria-live="polite" class="slick-list draggable">
										<div class="slick-track" role="listbox"
											style="opacity: 1; width: 5440px; transform: translate3d(-960px, 0px, 0px);">
											<li data-wlog_type="s001" class="slick-slide slick-cloned"
												data-slick-index="-3" aria-hidden="true"
												style="width: 320px;" tabindex="-1">

												<div class="thum" data-ref-goodsno="A000000160044"
													data-egrank="16" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^더바디샵 화이트 머스크 센티트 바디 로션 400ml(비건)"
													data-trk="/"
													data-impression="A000000160044^통합검색결과페이지_검색결과_추천^9"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=9"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016004403ko.jpg?l=ko"
														alt="더바디샵 화이트 머스크 센티트 바디 로션 400ml(비건)"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000160044" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000160044" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000160044&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;16&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=9&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000160044&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;9&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000160044"
														data-egrank="16" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^더바디샵 화이트 머스크 센티트 바디 로션 400ml(비건)"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=9"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">더바디샵 화이트 머스크 센티트 바디 로션 400ml(비건)</dt>
															<dd class="price">
																<strong>32,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide slick-cloned"
												data-slick-index="-2" aria-hidden="true"
												style="width: 320px;" tabindex="-1">

												<div class="thum" data-ref-goodsno="A000000183210"
													data-egrank="17" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^이니스프리 그린티 히알루론산 로션 170ml"
													data-trk="/"
													data-impression="A000000183210^통합검색결과페이지_검색결과_추천^10"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=10"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018321013ko.jpg?l=ko"
														alt="이니스프리 그린티 히알루론산 로션 170ml"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000183210" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000183210" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000183210&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;17&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=10&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000183210&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;10&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000183210"
														data-egrank="17" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^이니스프리 그린티 히알루론산 로션 170ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=10"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">이니스프리 그린티 히알루론산 로션 170ml</dt>
															<dd class="price">
																<del>20,000원</del>
																<strong>15,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag sale">세일</span><span
																	class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide slick-cloned"
												data-slick-index="-1" aria-hidden="true"
												style="width: 320px;" tabindex="-1">

												<div class="thum" data-ref-goodsno="A000000183744"
													data-egrank="18" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^[시카보다 4배*강한] 한율 어린쑥 수분진정 플루이드 125ml"
													data-trk="/"
													data-impression="A000000183744^통합검색결과페이지_검색결과_추천^11"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=11"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018374408ko.jpg?l=ko"
														alt="[시카보다 4배*강한] 한율 어린쑥 수분진정 플루이드 125ml"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000183744" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000183744" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000183744&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;18&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=11&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000183744&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;11&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000183744"
														data-egrank="18" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^[시카보다 4배*강한] 한율 어린쑥 수분진정 플루이드 125ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=11"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">[시카보다 4배*강한] 한율 어린쑥 수분진정 플루이드 125ml</dt>
															<dd class="price">
																<strong>32,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001"
												class="slick-slide slick-current slick-active"
												data-slick-index="0" aria-hidden="false"
												style="width: 320px;" tabindex="-1" role="option"
												aria-describedby="slick-slide00">

												<div class="thum" data-ref-goodsno="A000000140514"
													data-egrank="1" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^록시땅 시어 버베나 엑스트라 젠틀 핸드 앤 바디 로션300ml"
													data-trk="/"
													data-impression="A000000140514^통합검색결과페이지_검색결과_추천^1"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=1"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0014/A00000014051406ko.jpg?l=ko"
														alt="록시땅 시어 버베나 엑스트라 젠틀 핸드 앤 바디 로션300ml"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000140514" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="0">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000140514" tabindex="0">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000140514&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;1&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=1&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000140514&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;1&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000140514"
														data-egrank="1" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^록시땅 시어 버베나 엑스트라 젠틀 핸드 앤 바디 로션300ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=1"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="0"><dl>
															<dt class="tit">록시땅 시어 버베나 엑스트라 젠틀 핸드 앤 바디 로션300ml</dt>
															<dd class="price">
																<strong>45,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide slick-active"
												data-slick-index="1" aria-hidden="false"
												style="width: 320px;" tabindex="-1" role="option"
												aria-describedby="slick-slide01">

												<div class="thum" data-ref-goodsno="A000000163494"
													data-egrank="4" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^라운드랩 포 맨 자작나무 수분 로션 200ml"
													data-trk="/"
													data-impression="A000000163494^통합검색결과페이지_검색결과_추천^2"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=2"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016349420ko.jpg?l=ko"
														alt="라운드랩 포 맨 자작나무 수분 로션 200ml"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000163494" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="0">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000163494" tabindex="0">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000163494&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;4&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=2&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000163494&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;2&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000163494"
														data-egrank="4" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^라운드랩 포 맨 자작나무 수분 로션 200ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=2"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="0"><dl>
															<dt class="tit">라운드랩 포 맨 자작나무 수분 로션 200ml</dt>
															<dd class="price">
																<del>24,000원</del>
																<strong>18,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag sale">세일</span><span
																	class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide slick-active"
												data-slick-index="2" aria-hidden="false"
												style="width: 320px;" tabindex="-1" role="option"
												aria-describedby="slick-slide02">

												<div class="thum" data-ref-goodsno="A000000147966"
													data-egrank="6" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^바이오힐보 프로바이오덤 리페어 에멀전 150mL"
													data-trk="/"
													data-impression="A000000147966^통합검색결과페이지_검색결과_추천^3"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=3"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0014/A00000014796607ko.jpg?l=ko"
														alt="바이오힐보 프로바이오덤 리페어 에멀전 150mL"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000147966" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="0">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000147966" tabindex="0">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000147966&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;6&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=3&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000147966&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;3&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000147966"
														data-egrank="6" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^바이오힐보 프로바이오덤 리페어 에멀전 150mL"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=3"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="0"><dl>
															<dt class="tit">바이오힐보 프로바이오덤 리페어 에멀전 150mL</dt>
															<dd class="price">
																<del>29,000원</del>
																<strong>22,900원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag sale">세일</span><span
																	class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide"
												data-slick-index="3" aria-hidden="true"
												style="width: 320px;" tabindex="-1" role="option"
												aria-describedby="slick-slide03">

												<div class="thum" data-ref-goodsno="A000000159264"
													data-egrank="7" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^마몽드 로즈 워터 토너 250ml"
													data-trk="/"
													data-impression="A000000159264^통합검색결과페이지_검색결과_추천^4"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=4"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0015/A00000015926401ko.jpg?l=ko"
														alt="마몽드 로즈 워터 토너 250ml" onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000159264" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000159264" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000159264&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;7&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=4&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000159264&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;4&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000159264"
														data-egrank="7" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^마몽드 로즈 워터 토너 250ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=4"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">마몽드 로즈 워터 토너 250ml</dt>
															<dd class="price">
																<del>18,000원</del>
																<strong>12,600원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag sale">세일</span><span
																	class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide"
												data-slick-index="4" aria-hidden="true"
												style="width: 320px;" tabindex="-1" role="option"
												aria-describedby="slick-slide04">

												<div class="thum" data-ref-goodsno="A000000117701"
													data-egrank="10" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^에스트라 아토베리어365 크림 80ml"
													data-trk="/"
													data-impression="A000000117701^통합검색결과페이지_검색결과_추천^5"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=5"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<span class="thumb_flag best">베스트</span><img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0011/A00000011770103ko.jpg?l=ko"
														alt="에스트라 아토베리어365 크림 80ml"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000117701" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000117701" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000117701&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;10&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=5&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000117701&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;5&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000117701"
														data-egrank="10" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^에스트라 아토베리어365 크림 80ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=5"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">에스트라 아토베리어365 크림 80ml</dt>
															<dd class="price">
																<del>31,000원</del>
																<strong>24,800원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag sale">세일</span><span
																	class="icon_flag gift">증정</span><span
																	class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide"
												data-slick-index="5" aria-hidden="true"
												style="width: 320px;" tabindex="-1" role="option"
												aria-describedby="slick-slide05">

												<div class="thum" data-ref-goodsno="A000000165364"
													data-egrank="13" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^AHC 허브솔루션 로즈 토너  500ml "
													data-trk="/"
													data-impression="A000000165364^통합검색결과페이지_검색결과_추천^6"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=6"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016536401ko.jpg?l=ko"
														alt="AHC 허브솔루션 로즈 토너  500ml "
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000165364" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000165364" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000165364&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;13&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=6&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000165364&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;6&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000165364"
														data-egrank="13" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^AHC 허브솔루션 로즈 토너  500ml "
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=6"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">AHC 허브솔루션 로즈 토너 500ml</dt>
															<dd class="price">
																<strong>15,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide"
												data-slick-index="6" aria-hidden="true"
												style="width: 320px;" tabindex="-1" role="option"
												aria-describedby="slick-slide06">

												<div class="thum" data-ref-goodsno="A000000143199"
													data-egrank="14" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^아이디얼 포맨 퍼펙트 로션 130ml"
													data-trk="/"
													data-impression="A000000143199^통합검색결과페이지_검색결과_추천^7"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=7"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0014/A00000014319904ko.jpg?l=ko"
														alt="아이디얼 포맨 퍼펙트 로션 130ml"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000143199" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000143199" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000143199&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;14&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=7&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000143199&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;7&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000143199"
														data-egrank="14" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^아이디얼 포맨 퍼펙트 로션 130ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=7"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">아이디얼 포맨 퍼펙트 로션 130ml</dt>
															<dd class="price">
																<del>25,000원</del>
																<strong>18,900원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag sale">세일</span><span
																	class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide"
												data-slick-index="7" aria-hidden="true"
												style="width: 320px;" tabindex="-1" role="option"
												aria-describedby="slick-slide07">

												<div class="thum" data-ref-goodsno="A000000174576"
													data-egrank="15" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^크리니크 드라마티컬리 디퍼런트 모이스춰라이징 로션 30ml"
													data-trk="/"
													data-impression="A000000174576^통합검색결과페이지_검색결과_추천^8"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=8"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0017/A00000017457602ko.jpeg?l=ko"
														alt="크리니크 드라마티컬리 디퍼런트 모이스춰라이징 로션 30ml"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000174576" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000174576" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000174576&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;15&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=8&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000174576&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;8&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000174576"
														data-egrank="15" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^크리니크 드라마티컬리 디퍼런트 모이스춰라이징 로션 30ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=8"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">크리니크 드라마티컬리 디퍼런트 모이스춰라이징 로션 30ml</dt>
															<dd class="price">
																<strong>11,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide"
												data-slick-index="8" aria-hidden="true"
												style="width: 320px;" tabindex="-1" role="option"
												aria-describedby="slick-slide08">

												<div class="thum" data-ref-goodsno="A000000160044"
													data-egrank="16" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^더바디샵 화이트 머스크 센티트 바디 로션 400ml(비건)"
													data-trk="/"
													data-impression="A000000160044^통합검색결과페이지_검색결과_추천^9"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=9"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016004403ko.jpg?l=ko"
														alt="더바디샵 화이트 머스크 센티트 바디 로션 400ml(비건)"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000160044" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000160044" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000160044&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;16&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=9&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000160044&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;9&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000160044"
														data-egrank="16" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^더바디샵 화이트 머스크 센티트 바디 로션 400ml(비건)"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=9"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">더바디샵 화이트 머스크 센티트 바디 로션 400ml(비건)</dt>
															<dd class="price">
																<strong>32,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide"
												data-slick-index="9" aria-hidden="true"
												style="width: 320px;" tabindex="-1" role="option"
												aria-describedby="slick-slide09">

												<div class="thum" data-ref-goodsno="A000000183210"
													data-egrank="17" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^이니스프리 그린티 히알루론산 로션 170ml"
													data-trk="/"
													data-impression="A000000183210^통합검색결과페이지_검색결과_추천^10"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=10"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018321013ko.jpg?l=ko"
														alt="이니스프리 그린티 히알루론산 로션 170ml"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000183210" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000183210" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000183210&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;17&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=10&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000183210&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;10&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000183210"
														data-egrank="17" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^이니스프리 그린티 히알루론산 로션 170ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=10"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">이니스프리 그린티 히알루론산 로션 170ml</dt>
															<dd class="price">
																<del>20,000원</del>
																<strong>15,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag sale">세일</span><span
																	class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide"
												data-slick-index="10" aria-hidden="true"
												style="width: 320px;" tabindex="-1" role="option"
												aria-describedby="slick-slide010">

												<div class="thum" data-ref-goodsno="A000000183744"
													data-egrank="18" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^[시카보다 4배*강한] 한율 어린쑥 수분진정 플루이드 125ml"
													data-trk="/"
													data-impression="A000000183744^통합검색결과페이지_검색결과_추천^11"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=11"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018374408ko.jpg?l=ko"
														alt="[시카보다 4배*강한] 한율 어린쑥 수분진정 플루이드 125ml"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000183744" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000183744" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000183744&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;18&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=11&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000183744&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;11&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000183744"
														data-egrank="18" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^[시카보다 4배*강한] 한율 어린쑥 수분진정 플루이드 125ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=11"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">[시카보다 4배*강한] 한율 어린쑥 수분진정 플루이드 125ml</dt>
															<dd class="price">
																<strong>32,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide slick-cloned"
												data-slick-index="11" aria-hidden="true"
												style="width: 320px;" tabindex="-1">

												<div class="thum" data-ref-goodsno="A000000140514"
													data-egrank="1" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^록시땅 시어 버베나 엑스트라 젠틀 핸드 앤 바디 로션300ml"
													data-trk="/"
													data-impression="A000000140514^통합검색결과페이지_검색결과_추천^1"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=1"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0014/A00000014051406ko.jpg?l=ko"
														alt="록시땅 시어 버베나 엑스트라 젠틀 핸드 앤 바디 로션300ml"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000140514" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000140514" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000140514&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;1&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=1&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000140514&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;1&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000140514"
														data-egrank="1" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^록시땅 시어 버베나 엑스트라 젠틀 핸드 앤 바디 로션300ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=1"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">록시땅 시어 버베나 엑스트라 젠틀 핸드 앤 바디 로션300ml</dt>
															<dd class="price">
																<strong>45,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide slick-cloned"
												data-slick-index="12" aria-hidden="true"
												style="width: 320px;" tabindex="-1">

												<div class="thum" data-ref-goodsno="A000000163494"
													data-egrank="4" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^라운드랩 포 맨 자작나무 수분 로션 200ml"
													data-trk="/"
													data-impression="A000000163494^통합검색결과페이지_검색결과_추천^2"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=2"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016349420ko.jpg?l=ko"
														alt="라운드랩 포 맨 자작나무 수분 로션 200ml"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000163494" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000163494" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000163494&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;4&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=2&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000163494&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;2&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000163494"
														data-egrank="4" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^라운드랩 포 맨 자작나무 수분 로션 200ml"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=2"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">라운드랩 포 맨 자작나무 수분 로션 200ml</dt>
															<dd class="price">
																<del>24,000원</del>
																<strong>18,000원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag sale">세일</span><span
																	class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
											<li data-wlog_type="s001" class="slick-slide slick-cloned"
												data-slick-index="13" aria-hidden="true"
												style="width: 320px;" tabindex="-1">

												<div class="thum" data-ref-goodsno="A000000147966"
													data-egrank="6" data-egcode="s001_s001"
													data-attr="통합검색결과페이지^검색결과_추천^바이오힐보 프로바이오덤 리페어 에멀전 150mL"
													data-trk="/"
													data-impression="A000000147966^통합검색결과페이지_검색결과_추천^3"
													data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=3"
													data-ref-dispcatno="" data-ref-itemno="001"
													data-impression-visibility="1">
													<img
														src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0014/A00000014796607ko.jpg?l=ko"
														alt="바이오힐보 프로바이오덤 리페어 에멀전 150mL"
														onerror="common.errorImg(this);">
													<div class="my">
														<button type="button" class="myCart cartBtnRecoBell"
															data-ref-goodsno="A000000147966" name=""
															data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1">
															<span>장바구니</span>
														</button>
														<button type="button" class="mySee btn_zzim"
															data-ref-goodsno="A000000147966" tabindex="-1">
															<span>찜하기전</span>
														</button>
													</div>
												</div>
												<div class="info">
													<a
														href="javascript:common.wlog(&quot;search_list_curation_prod&quot;);common.link.moveGoodsDetailCuration(&quot;A000000147966&quot;, &quot;&quot;,&quot;home_search_curation2&quot; , &quot;pc_search_01_a&quot;, &quot;s001_s001&quot; ,&quot;6&quot;,&quot;Result_Curation&quot;,&quot;t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=3&quot;);gtm.goods.callGoodsGtmInfo(&quot;A000000147966&quot;, null,&quot;ee-productClick&quot;,&quot;통합검색결과페이지_검색결과_추천&quot;,&quot;3&quot;);"
														class="a_detail" name="" data-ref-goodsno="A000000147966"
														data-egrank="6" data-egcode="s001_s001"
														data-attr="통합검색결과페이지^검색결과_추천^바이오힐보 프로바이오덤 리페어 에멀전 150mL"
														data-trk="/"
														data-tracking-param="t_page=통합검색결과페이지&amp;t_click=상품추천_상품상세&amp;t_number=3"
														data-ref-dispcatno="" data-ref-itemno="001" tabindex="-1"><dl>
															<dt class="tit">바이오힐보 프로바이오덤 리페어 에멀전 150mL</dt>
															<dd class="price">
																<del>29,000원</del>
																<strong>22,900원</strong>
															</dd>
															<dd class="icon">
																<span class="icon_flag sale">세일</span><span
																	class="icon_flag delivery">오늘드림</span>
															</dd>
														</dl></a>
												</div>

											</li>
										</div>
									</div>

									<button type="button" data-role="none"
										class="slick-next slick-arrow" aria-label="Next" role="button"
										style="display: block;">1/4</button>
									<ul class="slick-dots" style="display: block;" role="tablist">
										<li class="slick-active" aria-hidden="false"
											role="presentation" aria-selected="true"
											aria-controls="navigation00" id="slick-slide00"><button
												type="button" data-role="none" role="button" tabindex="0">1</button></li>
										<li aria-hidden="true" role="presentation"
											aria-selected="false" aria-controls="navigation01"
											id="slick-slide01"><button type="button"
												data-role="none" role="button" tabindex="0">2</button></li>
										<li aria-hidden="true" role="presentation"
											aria-selected="false" aria-controls="navigation02"
											id="slick-slide02"><button type="button"
												data-role="none" role="button" tabindex="0">3</button></li>
										<li aria-hidden="true" role="presentation"
											aria-selected="false" aria-controls="navigation03"
											id="slick-slide03"><button type="button"
												data-role="none" role="button" tabindex="0">4</button></li>
									</ul>
								</ul>
							</div>

							<script type="text/javascript">
								$(document)
										.ready(
												function() {
													common.wish.init();
													var rccode = "";
													if ("lastN" == "lastY") {
														var clickspace = "home_search_curation1";
														rccode = "pc_search_04_a";
														$("#txtTitle")
																.html(
																		"다른 고객님이 많이 검색한 상품");
													} else {
														var clickspace = "home_search_curation2";
														rccode = "pc_search_01_a";
														$("#txtTitle")
																.html(
																		"이런 상품을 찾으시나요?");
													}

													setTimeout(
															function() {
																$(
																		'#curation_ulList_s001')
																		.slick(
																				{
																					arrows : true,
																					infinite : true,
																					slidesToShow : 3,
																					slidesToScroll : 3,
																					dots : true
																				});

																$(
																		'#curation_ulList_s001')
																		.find(
																				'.slick-arrow')
																		.on(
																				'mouseenter focus',
																				function(
																						e) {
																					var _this = $(this);
																							_thisDots = _this
																									.parents(
																											'.curation_basket')
																									.find(
																											'.slick-dots'),
																							_thisDotsLen = _thisDots
																									.find('li').length,
																							_thisDot = _thisDots
																									.find(
																											'li.slick-active button')
																									.text();

																					txtSpan = _thisDot
																							+ '/'
																							+ _thisDotsLen;
																					_this
																							.html(txtSpan);
																					_this
																							.addClass('snum');
																				});
																$(
																		'#curation_ulList_s001')
																		.find(
																				'.slick-arrow')
																		.on(
																				'mouseleave blur',
																				function() {
																					var _this = $(this);
																					_this
																							.removeClass('snum');
																				});
																$(
																		'#curation_ulList_s001')
																		.on(
																				'afterChange',
																				function(
																						event,
																						slick,
																						currentSlide) {
																					var _this = $(this), _thisDots = _this
																							.find('.slick-dots'), _thisDotsLen = _thisDots
																							.find('li').length, _thisDot = _thisDots
																							.find(
																									'li.slick-active button')
																							.text();
																					_arrow = _this
																							.find('.slick-arrow');

																					txtSpan = _thisDot
																							+ '/'
																							+ _thisDotsLen;
																					_arrow
																							.html(txtSpan);
																				});
															}, 100);

													// 레코벨 상품 장바구니 담기 클릭
													$(".cartBtnRecoBell")
															.unbind("click")
															.click(
																	function(e) {
																		e
																				.preventDefault();
																		if (common
																				.loginChk()) {

																			// 클릭지표, 시나리오 분석 웹로그 추가
																			var wlogType = $(
																					this)
																					.closest(
																							"li")
																					.attr(
																							"data-wlog_type");
																			common
																					.wlog("detail_curation_addcart_"
																							+ wlogType);

																			//  옵션선택이 있거나, 없거나 일단 화면 진입
																			var url = _baseUrl
																					+ "common/getCartOptionSelectAjax.do";
																			var data = {
																				goodsNo : $(
																						this)
																						.attr(
																								"data-ref-goodsNo"),
																				itemNo : $(
																						this)
																						.attr(
																								"data-ref-itemNo"),
																				itemCnt : $(
																						this)
																						.attr(
																								"data-ref-cnt"),
																				prstyn : $(
																						this)
																						.attr(
																								"data-ref-prstyn"),
																				recoRcCode : rccode
																			};
																			common.Ajax
																					.sendRequest(
																							"POST",
																							url,
																							data,
																							common._callCartOptionSelect);
																		}
																	});

													//큐레이션 썸네일 이미지 오버
													$(document)
															.on(
																	'mouseover',
																	'.curation_basket .thum',
																	function() {
																		var _this = $(this);
																		_this
																				.find(
																						'.my')
																				.show();
																	});

													$(document)
															.on(
																	'mouseout',
																	'.curation_basket .thum',
																	function() {
																		var _this = $(this);
																		_this
																				.find(
																						'.my')
																				.hide();
																	});

													$(document)
															.on(
																	'click',
																	'.curation_basket .thum .btn_zzim',
																	function() {
																		// 웹로그 타입(일반추천/품절상품추천)
																		var wlogType = $(
																				this)
																				.closest(
																						"li")
																				.attr(
																						"data-wlog_type");
																		// 찜했을때만 로그 남김
																		if ($(
																				this)
																				.hasClass(
																						"on") == true) {
																			common
																					.wlog("cart_curation_addzzim_"
																							+ wlogType);
																		}
																	});

													var gtmGoodsNoArr = new Array();
													var gtmItemNoArr = new Array();

													$(
															'#curation_ulList_s001 li .a_detail')
															.each(
																	function(i) {
																		var _item = $(this);
																		var _data_goodsno = _item
																				.attr('data-ref-goodsno');
																		var _data_dispCatNo = _item
																				.attr('data-ref-dispCatNo');
																		var _data_itemno = _item
																				.attr('data-ref-itemno');
																		var egcode = _item
																				.attr("data-egcode");
																		var egrank = _item
																				.attr("data-egrank");
																		var trackingParam = _item
																				.attr("data-tracking-param");

																		if ("lastN" == "lastY") {
																			var href = 'javascript:common.wlog("'
																					+ "search_noresult_curation_prod"
																					+ '");'
																					+ 'common.link.moveGoodsDetailCuration("'
																					+ _data_goodsno
																					+ '", "'
																					+ _data_dispCatNo
																					+ '","'
																					+ clickspace
																					+ '" , "'
																					+ rccode
																					+ '", "'
																					+ egcode
																					+ '" ,"'
																					+ egrank
																					+ '","noResult_Curation","'
																					+ trackingParam
																					+ '");'
																					+ 'gtm.goods.callGoodsGtmInfo("'
																					+ _data_goodsno
																					+ '", '
																					+ null
																					+ ',"'
																					+ 'ee-productClick'
																					+ '","통합검색결과페이지_검색결과_추천","'
																					+ (i + 1)
																					+ '");'
																		} else {
																			var href = 'javascript:common.wlog("'
																					+ "search_list_curation_prod"
																					+ '");'
																					+ 'common.link.moveGoodsDetailCuration("'
																					+ _data_goodsno
																					+ '", "'
																					+ _data_dispCatNo
																					+ '","'
																					+ clickspace
																					+ '" , "'
																					+ rccode
																					+ '", "'
																					+ egcode
																					+ '" ,"'
																					+ egrank
																					+ '","Result_Curation","'
																					+ trackingParam
																					+ '");'
																					+ 'gtm.goods.callGoodsGtmInfo("'
																					+ _data_goodsno
																					+ '", '
																					+ null
																					+ ',"'
																					+ 'ee-productClick'
																					+ '","통합검색결과페이지_검색결과_추천","'
																					+ (i + 1)
																					+ '");';
																		}

																		_item
																				.attr(
																						'href',
																						href);
																	});

													// GTM Product Impression 공통 적용
													gtm.goods
															.initProductImpression();
													//오특 플래그
													common.gnb.todaySpecial
															.setTodaySpecialFlag('.thum .newOyflag');
												});
							</script>


						</div>
						<div class="loading_box" id="loadingBox_result_s001"
							style="display: none;">
							<span class="icon"><img
								src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/pc_loading.gif"
								alt="로딩중"></span>
							<p class="txt">고객님을 위한 상품 추천중이에요</p>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<!--// 컬럼형 리스트 -->

		<!--// 카테고리 상품 리스트 -->
		<div id="curationArea"></div>

		<div class="popularitySearch" id="popword">
			<!-- 
						<h2>인기검색어</h2>
						<div class="BoxPopularity">
							<ol>
								<li><span class="num">1</span>츄어블비타</li>
								<li><span class="num">2</span>비비크림</li>
								<li><span class="num">3</span>립스틱</li>
								<li><span class="num">4</span>에센스</li>
								<li><span class="num">5</span>마스카라</li>
								<li><span class="num">6</span>립글로</li>
								<li><span class="num">7</span>립글로즈</li>
								<li><span class="num">8</span>마스크</li>
								<li><span class="num">9</span>마스크팩</li>
								<li><span class="num">10</span>황토팩</li>
							</ol>
							<ol>
								<li><span class="num">11</span>츄어블</li>
								<li><span class="num">12</span>비비크림</li>
								<li><span class="num">13</span>립스틱</li>
								<li><span class="num">14</span>에센스</li>
								<li><span class="num">15</span>마스카라</li>
								<li><span class="num">16</span>츄어블</li>
								<li><span class="num">17</span>비비</li>
								<li><span class="num">18</span>비비</li>
								<li><span class="num">19</span>아이라이너</li>
								<li><span class="num">20</span>아이</li>
							</ol>
						</div>
					-->
		</div>
		<!--// -->
		<!-- pageing start -->
		<div class="pageing">
			<c:if test="${pageDTO.prev }">
				<a class="prev" href="#" data-page-no="${pageDTO.start-1}">이전 10
					페이지</a>
			</c:if>
			<c:forEach var="i" begin="${pageDTO.start }" end="${pageDTO.end }"
				step="1">
				<c:choose>
					<c:when test="${i eq pageDTO.currentPage}">
						<strong title="현재 페이지">${i}</strong>
						<%-- <a class="active" href="#">${i }</a> --%>
					</c:when>
					<c:otherwise>
						<a href="#" data-page-no="${i}">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageDTO.next }">
				<a class="next" href="#" data-page-no="${pageDTO.end+1}">다음 10
					페이지</a>
			</c:if>
			<!-- <strong title="현재 페이지">1</strong> -->
		</div>
		<!-- //pageing end -->
		<!-- </div> -->
	</div>
	<!-- //#Contents -->
</div>

<script>
	$(function() {
		$("a.cate").on("click", function() {
			let categorySmallId = $(this).attr("id")
			console.log(categorySmallId)
			//let url = window.location.href;
			let url = "/search?searchWord=${param.searchWord}&sort=${param.sort}&currentpage=1&categorySmallId=";
			 
			const URLSearch = new URLSearchParams(location.search)
			URLSearch.set("categorySmallId", String(categorySmallId))
			const newParam = URLSearch.toString();
			//window.location.href = location.pathname + '?' + newParam
			window.location.href = url + categorySmallId;
		})
		
		$(".btnReset").on("click",function(){
			const URLSearch = new URLSearchParams(location.search)
			const newParam = URLSearch.get("searchWord")
			 
			window.location.href = location.pathname+'?searchWord='+newParam
		})
		
	})
	
	function quickOnclick() {
		var url = window.location.href;
		const URLSearch = new URLSearchParams(location.search)
		URLSearch.delete("quickyn");
		if ($("#check_view").is(':checked')) {
			window.location.href = url+"&quickyn=Y"
		}else{
			URLSearch.delete("quickyn");
			const newParam = URLSearch.toString();
			window.location.href = location.pathname + '?' + newParam
		}
		
	}
	
	function doDelCate(cateId){
		const URLSearch = new URLSearchParams(location.search)
		URLSearch.delete("categorySmallId");
		const newParam = URLSearch.toString();
		window.location.href = location.pathname + '?' + newParam
	}
	
	function doDelFilter(brandId){
		var id = 'brandId='+brandId
		const URLSearch = new URLSearchParams(location.search)
		URLSearch.delete(id);
		const newParam = URLSearch.toString();
		let param_string = newParam
		// 파라미터를 '&' 기준으로 분할하여 배열로 변환
		let params = param_string.split('&');

		// 'br_00000134'를 포함하지 않는 파라미터들로 새 배열 생성
		let filtered_params = params.filter(param => !param.includes(brandId));

		// 배열을 '&'를 사용하여 문자열로 결합
		let result_string = filtered_params.join('&');

		window.location.href = location.pathname + '?' +  result_string	
	}
	
	function doDelprice(min,max){
		
		var url = window.location.href;
		const URLSearch = new URLSearchParams(location.search)
		
		
		if (min !== undefined && max === undefined) {
			URLSearch.delete("minPrice");
	        
	    } else if (max !== undefined && min === undefined) {
	    	URLSearch.delete("maxPrice");
	        
	    } else if (min !== undefined && max !== undefined) {
	    	URLSearch.delete("minPrice");
	    	URLSearch.delete("maxPrice");
	        
	    }
		const newParam = URLSearch.toString();
		window.location.href = location.pathname + '?' + newParam
	}
	
	function reSearch() {
		let searchWord = $("#reChk").val();
		//alert(searchWord)
		let url = window.location.href;
		window.location.href=url+"&searchWord="+searchWord
	}
	
</script>