<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/include.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/resources/cdn-main/brand.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<title>블랙올리브영 온라인몰</title>
<style>
.prod-list .point {
    padding-left: 13px;
    color: #555;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/brand/bul_star_24.png) 0 50%/12px auto no-repeat;
}
</style>
<style>
.review_stat.type2 .point.pt5 {
    background-position: 0 -70px;
}
.review_stat.type2 .point {
    display: inline-block;
    margin-top: 2px;
    width: 78px;
    height: 14px;
    text-indent: -9999px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_review_point2.png) right 0/100% auto no-repeat;
    background-image: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_review_point2.png);
    background-position-x: right;
    background-position-y: 0px;
    background-size: 100%;
    background-repeat: no-repeat;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: initial;
    vertical-align: top;
}
.prod-list.list-type .rating_type .rating_point {
    float: left;
    width: 78px;
    height: 14px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_review_point2.png) no-repeat;
}
</style>
<style>
.brandBox .reviewList .reviewCont .topinfo>span.like .icon {
    display: inline-block;
    margin-top: 2px;
    padding: 0 0 0 19px;
    height: 14px;
    font-size: 14px;
    color: #0cc7b8;
    line-height: 16px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/product/icon_recom_new.png) 0 -15px/15px auto no-repeat;
}
</style>
<style>
.review-detail-view {
    padding: 30px;
}
</style>
<style>
.brand_like .brand .icon {
    display: inline-block;
    padding-left: 27px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/icon_like_brd_off.png) 1px 50%/22px 19px no-repeat;
}
</style>
<style>
.page_location .loc_history>li a {
    display: inline-block;
    line-height: 16px;
    font-size: 12px;
    color: #888;
}
</style>
<script>
//리뷰 상세 보기 Ajax
function reviewDetail(reviewId) {
	 $.ajax({
		url: "/store/getReviewDetail",
		method:"GET",
		cache:false,
		dataType : "json",
		data:{
			reviewId : reviewId
		}
		, success: function (data) {
			// console.log(data);
			var date = new Date(data.reviewRegdate);
			var formattedDate =
				  date.getFullYear() + '.' +
				  ('0' + (date.getMonth() + 1)).slice(-2) + '.' +
				  ('0' + date.getDate()).slice(-2);
			
			let grade = data.gradeName;
			let grade_rate;
			switch (grade) {
			case "BABY OLIVE":
				grade_rate = "rate_05";
				break;
			case "PINK OLIVE":
				grade_rate = "rate_04";
				break;
			case "GREEN OLIVE":
				grade_rate = "rate_03";
				break;
			case "BLACK OLIVE":
				grade_rate = "rate_02";
				break;
			case "GOLD OLIVE":
				grade_rate = "rate_01";
				break;
			}
			
			// 태그 만들기 시작
			let reviewDetailContent = `
			<div class="review-detail-view">
				<p class="review-detail-view__tit">리뷰 상세보기 <button type="button" class="rw-popup-layer-close" onclick="javascript:$('#layerWrap920').hide(); $('.dimm').remove()"></button></p>
				<div class="reviewer-profile-wrap clrfix">
				<div class="reviewer-profile-info profile-top-reviewer-v1 ">
					<div class="top-reviewer-inner">
						<div class="top-reviewer-profile">
							<div class="profile-top-content">
								<div class="reviewer-profile-img thum">
									<div class="reviewer-profile-img__inner" onclick="common.link.commonMoveUrl('mypage/getReviewerProfile.do?key=Q0hyeXVNazc3bWVpL3JPODE4UjRtdz09');">
										<span class="reviewer-profile-img--active" style="background-image: url('\${data.profileImg}')"><span class="review-text-hidden">프로필 사진</span></span>		
									</div>
								</div>
								<div class="new-profile-info">
									<div class="user-id-area \${grade_rate}">	
										<p class="id my-profile on">
											<strong>\${data.nickname}</strong>
											<span class="badge-img"><span class="blind">멤버십 등급별 이미지</span></span>
										</p>	
									</div>
									<div class="profile-badge on">
										<span class="badge-item top-number">
											<a href="<c:url value='/store/getReviewer'/>">TOP \${data.rnk}</a>
										</span>							
									</div>
								</div>
							</div>
							<div class="profile-info-content">	
								<div class="profile-keyword-area">
									<ul class="profile-keyword-list on">`;
									
									if(data.skintoneName != null) {
										reviewDetailContent += `<li class="list-item">\${data.skintoneName}</li>`;
									}
									if(data.skintypeName != null) {
										reviewDetailContent += `<li class="list-item">\${data.skintypeName}</li>`;
									}
									
									for (var i = 0; i < data.skinTrouble.length; i++) {
										reviewDetailContent += `<li class="list-item">\${data.skinTrouble[i].skintroubleName}</li>`;
									}
						reviewDetailContent += `</ul></div>`;
			
			// 프로필 내용 여부
			if(`\${data.profileContent}` != 'null') {
				reviewDetailContent += `
								<p class="top-review-info on">
									\${data.profileContent}
								<p>`;	
			}			
								
								
			reviewDetailContent +=	`
							</div>
						</div>
						<ul class="reviewer-profile-info__bottom reviewer-data-info">
							<li class="reviewer-data-info__list">
								<span>\${data.reviewCnt}</span>
								<span>리뷰</span>
							</li>
							<li class="reviewer-data-info__list">
								<span>\${data.reviewLike}</span>
								<span>도움</span>
							</li>
							<li class="reviewer-data-info__list">
								<span>\${data.rnk}</span>
								<span>랭킹</span>
							</li>
						</ul>	
					</div>
				</div>
				<div class="reviewer-profile-content">
					<div class="reviewer-profile-content__body">
						<div class="rw-box">
							<a href="#;" class="rw-box__link" onclick="location.href='https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000188875&amp;trackingCd=Best_Reviewbest';">
								<div class="rw-box-figure">
									<div class="rw-box-figure__img">
										<img src="\${data.productImgSrc}" alt="">
									</div>
									<div class="rw-box-figcaption">
										<p class="rw-box-figcaption__brand">\${data.brandName}</p>
										<p class="rw-box-figcaption__name">\${data.productName}</p>
										<p class="rw-box-figcaption__price">
											<span class="price">\${data.productPrice}원</span>
										</p>
										<p class="rw-box-figcaption__etc">
											<span class="today">오늘드림</span>
										</p>	
									</div>
								</div>
							</a>
							<div class="review-detail-view__content scrbar">
								<div class="rw-box__first-line">
									<span class="review_point"><!-- 리뷰 포인트 누적 리뷰에서와 같음. width 값으로 제어-->
										<span class="point" style="width:\${data.reviewGrade*20}%">5점만점에 5점</span>
									</span>
									<span class="review_point_text">
										<span>작성일자 \${formattedDate}</span>
									</span>
								</div>
								<div class="rw-box__second-line"></div>`;
								
								// 리뷰 이미지가 있으면 
								if(data.reviewimg.length > 0) {
									
									reviewDetailContent += '<div class="review-detail-thumb">';
									reviewDetailContent += '<ul>';
									
									for (var i = 0; i < data.reviewimg.length; i++) {
										reviewDetailContent += '<li>';
										reviewDetailContent += '<span>';
										reviewDetailContent += `<img src="\${data.reviewimg[i].reviewImgSrc}" alt="">`;											
										reviewDetailContent += '</span>';
										reviewDetailContent += '</li>';
									}
									
									reviewDetailContent += '</ul>';
									reviewDetailContent += '</div>';
									
								}
								
							reviewDetailContent += `
								<div class="bimg" style="top: 180.2px; display: none;">
									<div class="thumb"><img src="" alt=""></div>
								</div>
								<p class="rw-box__description">
									\${data.reviewContent}
								</p>
								<div class="review-detail-fixed">
									<dl class="review-detail-fixed__list clrfix">
										<dt>피부타입</dt>
										<dd>지성에 좋아요</dd>
										<dt>피부고민</dt>
										<dd>보습에 좋아요</dd>
										<dt>자극도</dt>
										<dd>자극없이 순해요</dd>	
									</dl>
								</div>
							</div>
							<div class="rw-box__bottom">
								<div class="rw-box__help">
									<button type="button" class="common-event-help unlike" id="gdas_24029311" onclick="udpReviewLike('\${data.reviewId}', this)">
										<span>도움이 돼요</span>
										<span class="num">\${data.reviewLike}</span>
									</button>
									<input type="hidden" name="recommCnt_24029311" value="132">
								</div>
								<button type="button" class="rw-box__help-btn" onclick="reviewReport('\${data.reviewId}');">신고하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>`;
		// 태그 만들기 끝
	
			$("#layerWrap920").html(reviewDetailContent);
			$("#layerWrap920").show();
			popupCenter($("#layerWrap920"));
			$("body").append(dimm);
		}
		, error : function (xhr, data, textStatus) {
			
			console.log(xhr);
			console.log(data);
			console.log(textStatus);
			console.log('error');
        } // success , error
	}); // ajax
}
</script>
<script>
$(function() {
    // 기본으로 보여지는 함수 
    loadProducts('cate_01', 'p',8);

    // 카테고리 클릭 이벤트 핸들러
    $("ul.cate_list_box > li").on("click", function(event) {
        event.preventDefault();
        let dispcatno = $(this).find("a").data("ref-dispcatno");
        loadProducts(dispcatno, 'p'); // 기본적으로 인기순으로 로드
    });

    // 인기순, 신상순, 판매순 등등 
    $(document).on("click", ".align_sort ul li a", function(event) {
        event.preventDefault();
        let sort = $(this).data("sort");
        let dispcatno = 'cate_01'; // 디폴트로 보여줘야함

        // 'on' 클래스를 동적으로 처리
        $('.align_sort ul li').removeClass('on');
        $(this).parent('li').addClass('on');

        loadProducts(dispcatno, sort);
    });
    
    // 상품 개수 선택 이벤트 핸들러
    $(".count_sort ul li a").on("click", function(event) {
        event.preventDefault();
        var numOfItems = $(this).text(); // "24", "36", "48" 중 하나를 가져옴 
        
        
        $(".count_sort ul li").removeClass('on');
        $(this).parent('li').addClass('on');

        loadProducts('cate_01', 'p', numOfItems);
    });


    // 탭 클릭 이벤트 핸들러...
      $("#tabitem2").on("click", function() {
          $(this).addClass("active");
          $(this).next().removeClass("active");
          $("#tab-panel2").addClass("active");
          $("#tab-panel3").removeClass("active");
       });
       
       $("#tabitem3").on("click", function() {
          $(this).addClass("active");
          $(this).prev().removeClass("active");
          $("#tab-panel2").removeClass("active");
          $("#tab-panel3").addClass("active");
          
       })
       
       //컬럼형식 & 리스트 형식 

    // 상품 목록을 로드하는 함수
    function loadProducts(dispcatno, sort,numOfItems) {
        let brandId = '<%=request.getParameter("brandId")%>';
       
        $.ajax({
            type: 'get',
            async: true, // 비동기 호출
            cache: false,
            contentType : "application/json; charset:UTF-8", 
            url: '/getSortBrands',
            data: {
                brandId: brandId,
                dispcatno: dispcatno,
                sort: sort,
                numOfItems: numOfItems
            },
            success: function (response) {
            	console.log(response);
            	
            	  // let responseData = JSON.parse(response);
                 
              // 전체 상품 개수와 현재 페이지 정보를 추출
                // let totalItems = responseData.totalItems;
                /*  let currentPage = responseData.currentPage;
                 let totalPages = responseData.totalPages;
                 
                 // 페이징 UI 갱신
                 updatePagingUI(currentPage, totalPages); 
            	 */
            	 // 기존 상품 리스트 비우기
                 let htmlElement = $("#allGoodsList");
                 $("#allGoodsList").empty(); 
            	/*  
            	// 서버에서 받아온 상품 데이터 목록을 반복 처리
                for (let i = 0; i < response.length; i++) {
                    let product = response[i];

                    // 불러오는 serviceImpl에 따라 데이터를 가공하여 HTML을 동적으로 생성
                    let newProduct = createBrandPageHtml([product]);

                    // 새로운 상품 요소를 HTML 요소에 추가
                    htmlElement.append(newProduct); 
                    
               }*/
                 htmlElement.html(response);
            },
            error: function (response, textStatus) {
                // 에러 처리
                console.log('error');
            }
        });
    }
});
</script>
 <script>
//페이징 UI를 갱신하는 함수
function updatePagingUI(currentPage, totalPages) {
    // 페이징 UI를 갱신하는 코드를 여기에 작성
    // 예: 페이지 번호를 생성하고, 현재 페이지를 강조하는 등의 작업
    
    // 기존 페이징 UI를 비우기
    $(".pageing").empty();
    
    // "이전" 버튼 추가
    if (currentPage > 1) {
        $(".pageing").append('<a href="#" onclick="moveToPage(' + (currentPage - 1) + ')">이전</a>');
    }

    // 페이지 번호 생성 및 현재 페이지 강조
    for (let pageNum = 1; pageNum <= totalPages; pageNum++) {
        if (pageNum === currentPage) {
            $(".pageing").append('<strong title="현재 페이지">' + pageNum + '</strong>');
        } else {
            $(".pageing").append('<a href="#" onclick="moveToPage(' + pageNum + ')">' + pageNum + '</a>');
        }
    }

    // "다음" 버튼 추가
    if (currentPage < totalPages) {
        $(".pageing").append('<a href="#" onclick="moveToPage(' + (currentPage + 1) + ')">다음</a>');
    }

    // 콘솔에 현재 페이지와 전체 페이지 수 출력
    console.log("현재 페이지: " + currentPage);
    console.log("전체 페이지 수: " + totalPages);
}

</script> 




	<div id="Wrapper">
		<div id="skip_navi">
			<a href="#Container">본문바로가기</a>
		</div>
		<form name="ssologinfrm"
			action="https://www.oliveyoung.co.kr/store/login/ssoLogin.do"
			method="post">
			<input type="hidden" id="cjssoq" name="cjssoq">
		</form>
		<div id="Container">
			<div class="page_location">
				<a href="javascript:common.link.moveMainHome();" class="loc_home">홈</a>
				<ul class="loc_history">
					<li><a type="button" onclick="location.href='/brandPage/brandList'">브랜드</a>
					</li>
					<li><a href="javascript:;">${ brand.brandName }</a></li>
				</ul>
			</div>
			<div class="brand">
				<h2 class="title-detail-brand">${ brand.brandName }</h2>
                     
				<div class="brand_like">
					<a href="javascript:void(0);" data-ref-onlbrndnm="구달"
						data-ref-onlbrndcd="A001436" id="icobrand">
						<p class="brand">
							<span class="icon"><span class="fw400">${ brand.brandLike }</span>명이
								${ brand.brandName }을 좋아합니다.</span>
						</p>
					</a>
				</div>
			</div>
			<div id="brandDataSort">
				<div class="brand">
					<div class="brand_visual">
						<div class="visual">
							<img
								data-original="https://image.oliveyoung.co.kr/uploads/images/display/90000020137/263/8950018296969934705.jpg"
								alt="${ brand.brandName } 이미지 배너입니다."
								data-ref-link-url="https://www.oliveyoung.co.kr/store/"
								class="completed-seq-lazyload" src="${ brand.brandImgSrc }">
						</div>
						<div class="info">
							<h4 class="vtit">${ brand.brandSummary }</h4>
							<p class="txt">${ brand.brandExplaination }</p>
						</div>
					</div>
				</div>
				<div class="brand" data-sort="5" id="dataSortBox" corner-no="267">
					<div class="brandBox lineb">
						<div class="head md">
							<h3 class="tit">슬로-에이징 ${ brand.brandName } 스킨케어</h3>
						</div>
						<div class="mdSwiperBox">
							<div class="mdSwiper" id="mdSwiper">
								<div aria-live="polite" class="slick-list draggable">
									<div class="slick-track" role="listbox"
										style="opacity: 1; width: 1020px; transform: translate3d(0px, 0px, 0px);">
										<div class="item" data-slick-index="0" aria-hidden="false"
											style="width: 1020px;" tabindex="-1" role="option"
											aria-describedby="slick-slide00">
											<ul class="prod-list">
												<li>
													<div class="prod">
														<a
															href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162323&amp;dispCatNo=90000020137&amp;trackingCd=BrandA001436_Mdpick1&amp;t_page=브랜드관&amp;t_click=테마별상품전시1_상품상세&amp;t_number=1"
															name="BrandA001436_Mdpick1" class="thumb goodsList"
															data-ref-goodsno="A000000162323"
															data-ref-dispcatno="90000020137" data-ref-itemno="001"
															data-attr="브랜드관^구달_테마별상품전시_1^[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획"
															data-trk="/" tabindex="0"
															onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162323&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_테마별상품전시_1&quot;, &quot;1&quot;);"><img
															src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016232329ko.jpg?l=ko"
															alt="[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획"
															class="pic-thumb" onerror="common.errorImg(this);"><span
															class="flag-badge best">베스트</span></a>
														<div class="prod-info"
															onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162323&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_테마별상품전시_1&quot;, &quot;1&quot;);">
															<a
																href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162323&amp;dispCatNo=90000020137&amp;trackingCd=BrandA001436_Mdpick1&amp;t_page=브랜드관&amp;t_click=테마별상품전시1_상품상세&amp;t_number=1"
																name="BrandA001436_Mdpick1" class="goodsList"
																data-ref-goodsno="A000000162323"
																data-ref-dispcatno="90000020137" data-ref-itemno="001"
																data-attr="브랜드관^구달_테마별상품전시_1^[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획"
																data-trk="/" tabindex="0"><div class="prod-brand">
																	<strong class="exclusive"></strong>
																</div> <span class="prod-name double-line">[한정기획] 구달 청귤
																	비타C 잡티케어 세럼 50ml+31ml 증정 기획</span>
																<div class="discount">
																	<strong class="rate-of">28%</strong> <span
																		class="origin">43,000원</span>
																</div>
																<div class="price">
																	<strong class="total">30,960<span class="won">원</span></strong>
																	<span class="oneday">오늘드림</span>
																</div>
																<div class="rating">
																	<span class="point">4.7</span><span class="num">(999+)</span>
																</div>
																<div class="flags">
																	<span class="flag sale">세일</span><span
																		class="flag coupon">쿠폰</span>
																</div></a>
														</div>
														<div class="prod-func">
															<button type="button" class="favorite btn_zzim jeem"
																data-ref-goodsno="A000000162323" tabindex="0">
																<span>찜하기</span>
															</button>
															<button type="button" class="cart"
																onclick="common.gf_regCart(this); return false;"
																data-goods-no="A000000162323" data-item-no="001"
																tabindex="0">장바구니</button>
														</div>

													</div>
												</li>
												<li>
													<div class="prod">
														<a
															href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162021&amp;dispCatNo=90000020137&amp;trackingCd=BrandA001436_Mdpick1&amp;t_page=브랜드관&amp;t_click=테마별상품전시1_상품상세&amp;t_number=2"
															name="BrandA001436_Mdpick1" class="thumb goodsList"
															data-ref-goodsno="A000000162021"
															data-ref-dispcatno="90000020137" data-ref-itemno="001"
															data-attr="브랜드관^구달_테마별상품전시_1^[한정기획] 구달 청귤 비타C 잡티케어 크림 75ml 기획(+크림 10mlx2ea 증정)"
															data-trk="/" tabindex="0"
															onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162021&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_테마별상품전시_1&quot;, &quot;2&quot;);"><img
															src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016202129ko.jpg?l=ko"
															alt="[한정기획] 구달 청귤 비타C 잡티케어 크림 75ml 기획(+크림 10mlx2ea 증정)"
															class="pic-thumb" onerror="common.errorImg(this);"></a>
														<div class="prod-info"
															onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162021&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_테마별상품전시_1&quot;, &quot;2&quot;);">
															<a
																href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162021&amp;dispCatNo=90000020137&amp;trackingCd=BrandA001436_Mdpick1&amp;t_page=브랜드관&amp;t_click=테마별상품전시1_상품상세&amp;t_number=2"
																name="BrandA001436_Mdpick1" class="goodsList"
																data-ref-goodsno="A000000162021"
																data-ref-dispcatno="90000020137" data-ref-itemno="001"
																data-attr="브랜드관^구달_테마별상품전시_1^[한정기획] 구달 청귤 비타C 잡티케어 크림 75ml 기획(+크림 10mlx2ea 증정)"
																data-trk="/" tabindex="0"><div class="prod-brand">
																	<strong class="exclusive"></strong>
																</div> <span class="prod-name double-line">[한정기획] 구달 청귤
																	비타C 잡티케어 크림 75ml 기획(+크림 10mlx2ea 증정)</span>
																<div class="price">
																	<strong class="total">28,000<span class="won">원</span></strong>
																	<span class="oneday">오늘드림</span>
																</div>
																<div class="rating">
																	<span class="point">4.7</span><span class="num">(999+)</span>
																</div>
																<div class="flags blank"></div></a>
														</div>
														<div class="prod-func">
															<button type="button" class="favorite btn_zzim jeem"
																data-ref-goodsno="A000000162021" tabindex="0">
																<span>찜하기</span>
															</button>
															<button type="button" class="cart"
																onclick="common.gf_regCart(this); return false;"
																data-goods-no="A000000162021" data-item-no="001"
																tabindex="0">장바구니</button>
														</div>

													</div>
												</li>

												<li></li>

												<li></li>

											</ul>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="brand" data-sort="6" id="dataSortBox" corner-no="359">
					<div class="brandBox lineb">
						<div class="head md">
							<h3 class="tit">가을 햇살에는 구달 어성초 선케어</h3>
						</div>
						<div class="mdSwiperBox">
							<div class="mdSwiper" id="mdSwiper">

								<div aria-live="polite">
									<div class="slick-track" role="listbox"
										style="opacity: 1; width: 1020px; transform: translate3d(0px, 0px, 0px);">
										<div class="item" data-slick-index="0" aria-hidden="false"
											style="width: 1020px;" tabindex="-1" role="option"
											aria-describedby="slick-slide10">
											<ul class="prod-list">


												<li>
													<div class="prod" id="slide">
														<a
															href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000182780&amp;dispCatNo=90000020137&amp;trackingCd=BrandA001436_Mdpick2&amp;t_page=브랜드관&amp;t_click=테마별상품전시2_상품상세&amp;t_number=1"
															name="BrandA001436_Mdpick2" class="thumb goodsList"
															data-ref-goodsno="A000000182780"
															data-ref-dispcatno="90000020137" data-ref-itemno="001"
															data-attr="브랜드관^구달_테마별상품전시_2^[1+1 기획] 구달 맑은 어성초 진정 무기자차 선크림 50ml 1+1 기획 SPF50+ PA++++"
															data-trk="/" tabindex="0"
															onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000182780&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_테마별상품전시_2&quot;, &quot;3&quot;);"><img
															src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018278013ko.jpg?l=ko"
															alt="[1+1 기획] 구달 맑은 어성초 진정 무기자차 선크림 50ml 1+1 기획 SPF50+ PA++++"
															class="pic-thumb" onerror="common.errorImg(this);"><span
															class="flag-badge best">베스트</span></a>
														<div class="prod-info"
															onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000182780&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_테마별상품전시_2&quot;, &quot;3&quot;);">
															<a
																href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000182780&amp;dispCatNo=90000020137&amp;trackingCd=BrandA001436_Mdpick2&amp;t_page=브랜드관&amp;t_click=테마별상품전시2_상품상세&amp;t_number=1"
																name="BrandA001436_Mdpick2" class="goodsList"
																data-ref-goodsno="A000000182780"
																data-ref-dispcatno="90000020137" data-ref-itemno="001"
																data-attr="브랜드관^구달_테마별상품전시_2^[1+1 기획] 구달 맑은 어성초 진정 무기자차 선크림 50ml 1+1 기획 SPF50+ PA++++"
																data-trk="/" tabindex="0"><div class="prod-brand">
																	<strong class="exclusive"></strong>
																</div> <span class="prod-name double-line">[1+1 기획] 구달
																	맑은 어성초 진정 무기자차 선크림 50ml 1+1 기획 SPF50+ PA++++</span>
																<div class="discount">
																	<strong class="rate-of">17%</strong> <span
																		class="origin">20,000원</span>
																</div>
																<div class="price">
																	<strong class="total">16,560<span class="won">원</span></strong>
																	<span class="oneday">오늘드림</span>
																</div>
																<div class="rating">
																	<span class="point">4.8</span><span class="num">(999+)</span>
																</div>
																<div class="flags">
																	<span class="flag sale">세일</span><span
																		class="flag coupon">쿠폰</span>
																</div></a>
														</div>
														<div class="prod-func">
															<button type="button" class="favorite btn_zzim jeem"
																data-ref-goodsno="A000000182780" tabindex="0">
																<span>찜하기</span>
															</button>
															<button type="button" class="cart"
																onclick="common.gf_regCart(this); return false;"
																data-goods-no="A000000182780" data-item-no="001"
																tabindex="0">장바구니</button>
														</div>

													</div>
												</li>
												<li>
													<div class="prod">
														<a
															href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000182782&amp;dispCatNo=90000020137&amp;trackingCd=BrandA001436_Mdpick2&amp;t_page=브랜드관&amp;t_click=테마별상품전시2_상품상세&amp;t_number=2"
															name="BrandA001436_Mdpick2" class="thumb goodsList"
															data-ref-goodsno="A000000182782"
															data-ref-dispcatno="90000020137" data-ref-itemno="001"
															data-attr="브랜드관^구달_테마별상품전시_2^[한정기획] 구달 맑은 어성초 진정 쿨링 선스틱 1+1 기획 SPF50+ PA++++"
															data-trk="/" tabindex="0"
															onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000182782&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_테마별상품전시_2&quot;, &quot;4&quot;);"><img
															src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018278210ko.jpg?l=ko"
															alt="[한정기획] 구달 맑은 어성초 진정 쿨링 선스틱 1+1 기획 SPF50+ PA++++"
															class="pic-thumb" onerror="common.errorImg(this);"><span
															class="flag-badge best">베스트</span></a>
														<div class="prod-info"
															onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000182782&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_테마별상품전시_2&quot;, &quot;4&quot;);">
															<a
																href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000182782&amp;dispCatNo=90000020137&amp;trackingCd=BrandA001436_Mdpick2&amp;t_page=브랜드관&amp;t_click=테마별상품전시2_상품상세&amp;t_number=2"
																name="BrandA001436_Mdpick2" class="goodsList"
																data-ref-goodsno="A000000182782"
																data-ref-dispcatno="90000020137" data-ref-itemno="001"
																data-attr="브랜드관^구달_테마별상품전시_2^[한정기획] 구달 맑은 어성초 진정 쿨링 선스틱 1+1 기획 SPF50+ PA++++"
																data-trk="/" tabindex="0"><div class="prod-brand">
																	<strong class="exclusive"></strong>
																</div> <span class="prod-name double-line">[한정기획] 구달 맑은
																	어성초 진정 쿨링 선스틱 1+1 기획 SPF50+ PA++++</span>
																<div class="discount">
																	<strong class="rate-of">10%</strong> <span
																		class="origin">22,000원</span>
																</div>
																<div class="price">
																	<strong class="total">19,800<span class="won">원</span></strong>
																	<span class="oneday">오늘드림</span>
																</div>
																<div class="rating">
																	<span class="point">4.7</span><span class="num">(656)</span>
																</div>
																<div class="flags">
																	<span class="flag sale">세일</span>
																</div></a>
														</div>
														<div class="prod-func">
															<button type="button" class="favorite btn_zzim jeem"
																data-ref-goodsno="A000000182782" tabindex="0">
																<span>찜하기</span>
															</button>
															<button type="button" class="cart"
																onclick="common.gf_regCart(this); return false;"
																data-goods-no="A000000182782" data-item-no="001"
																tabindex="0">장바구니</button>
														</div>

													</div>
												</li>
												<li></li>

												<li></li>

											</ul>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			  <!-- 유튜브 링크  -->
			   
				<div class="brandBox" data-sort="7" id="dataSortBox" corner-no="266">
					<div class="brand-promotion video_box">
						<div class="brand-promotion-container">
							<h3 class="tit">제주 성산에서 자라난 흑당근으로 모공그늘이별</h3>
							<div class="video_masking_box">
								<div id="promotion-video-player" data-plyr-provider="Youtube"
									data-plyr-embed-id="9HU0a9cM6tM">
									<iframe id="playPlayer" frameborder="0" allowfullscreen="1"
										allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
										title="[goodal] Black Carrot Vita-A Retinol Ampoule 흑당근 비타A 레티놀 앰플🥕"
										width="640" height="360"
										src="https://www.youtube.com/embed/9HU0a9cM6tM?version=1&amp;autoplay=1&amp;controls=1&amp;modestbranding=1&amp;fs=1&amp;rel=0&amp;playsinline=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fwww.oliveyoung.co.kr&amp;widgetid=1"
										data-gtm-yt-inspected-28="true"
										data-gtm-yt-inspected-33="true"></iframe>
								</div>
							</div>
							<ul class="video_thumbs_box">

								<li class="video_item on"><a href="#promotion-video-player"
									class="video_thumbs" data-thumb-youtubeid="9HU0a9cM6tM"
									data-attr="브랜드관^구달_동영상^#흑당근비타A 모공탄력 레티놀앰플^1" data-trk="/"
									data-tracking-param="t_page=브랜드관&amp;t_click=브랜드스토리_영상&amp;t_video_name=#흑당근비타A 모공탄력 레티놀앰플&amp;t_number=1">
										<span class="thumb_img"><img
											src="https://img.youtube.com/vi/9HU0a9cM6tM/mqdefault.jpg"
											alt=""></span> <span class="thumb_txt">#흑당근비타A 모공탄력
											레티놀앰플</span>
								</a></li>
								<li class="video_item "><a href="#promotion-video-player"
									class="video_thumbs" data-thumb-youtubeid="wTokmmAVn6Q"
									data-attr="브랜드관^구달_동영상^#흑당근비타A 쫀쫀탄력 레티놀크림^2" data-trk="/"
									data-tracking-param="t_page=브랜드관&amp;t_click=브랜드스토리_영상&amp;t_video_name=#흑당근비타A 쫀쫀탄력 레티놀크림&amp;t_number=2">
										<span class="thumb_img"><img
											src="https://img.youtube.com/vi/wTokmmAVn6Q/mqdefault.jpg"
											alt=""></span> <span class="thumb_txt">#흑당근비타A 쫀쫀탄력
											레티놀크림</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
   
			<div class="brand">
				<div class="brandBox lineb">
					<div class="tabHead">
						<ul class="tablist" role="tablist">


							<li class="tab active" role="tab" id="tabitem2"
								aria-controls="tab-panel2" tabindex="0" aria-selected="true">베스트</li>


							<li class="tab" role="tab" id="tabitem3"
								aria-controls="tab-panel3" tabindex="0">리뷰</li>

						</ul>
					</div>

					<div class="tabContainer">
						<div class="tabCont active" role="tabpanel" id="tab-panel2"
							aria-lebelledby="tabitem2">
							<div class="itemList">
								<div class="tabSwiperBox">
									<div class="tabSwiper slick-initialized slick-slider"
										id="bestTabSwiper">
										<button type="button" data-role="none"
											class="slick-prev slick-arrow" aria-label="Previous"
											role="button" style="display: block;">Previous</button>
										<div aria-live="polite" class="slick-list draggable">
											<div class="slick-track" role="listbox"
												style="opacity: 1; width: 5100px; transform: translate3d(-1020px, 0px, 0px);">
												<div class="item slick-slide slick-cloned"
													data-slick-index="-1" aria-hidden="true"
													style="width: 1020px;" tabindex="-1">
													<ul class="prod-list">

                                                        <c:forEach var="pro" items="${bestProducts}">
														<li id="">
															<div class="prod">

																<a
																	href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000165071&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_Best&amp;t_page=브랜드관&amp;t_click=베스트_상품상세&amp;t_number=9"
																	name="BrandA001436_Best" class="thumb goodsList"
																	data-ref-goodsno="A000000165071"
																	data-ref-dispcatno="9000002" data-ref-itemno="001"
																	data-attr="${ pro.productDisplayName}"
																	data-trk="/" tabindex="-1"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000165071&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_베스트&quot;, &quot;1&quot;);"><img
																	src="${pro.productDisplaySrc }"
																	alt="${ pro.productDisplayName}"
																	class="pic-thumb" onerror="common.errorImg(this);"></a>
																<div class="prod-info"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000165071&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_베스트&quot;, &quot;1&quot;);">
																	<a
																		href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000165071&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_Best&amp;t_page=브랜드관&amp;t_click=베스트_상품상세&amp;t_number=9"
																		name="BrandA001436_Best" class="goodsList"
																		data-ref-goodsno="A000000165071"
																		data-ref-dispcatno="9000002" data-ref-itemno="001"
																		data-attr="${ pro.productDisplayName}"
																		data-trk="/" tabindex="-1"><div class="prod-brand">
																			<strong class="exclusive"></strong>
																		</div> <span class="prod-name double-line">${ pro.productDisplayName}</span>
																		<div class="price">
																			<strong class="total">${pro.productPrice}<span
																				class="won">원</span></strong> <span class="oneday">오늘드림</span>
																		</div>
																		<div class="rating">
																			<span class="point">${pro.productDisplayLike }</span><span class="num">(999+)</span>
																		</div>
																		<div class="flags blank"></div></a>
																</div>

																<div class="prod-func">
																	<button type="button" class="favorite btn_zzim jeem"
																		data-ref-goodsno="A000000165071" tabindex="-1">
																		<span>찜하기</span>
																	</button>
																	<button type="button" class="cart"
																		onclick="common.gf_regCart(this); return false;"
																		data-goods-no="A000000165071" data-item-no="001"
																		tabindex="-1">장바구니</button>
																</div>

															</div>
														</li>
                                                         </c:forEach>
                                                         
                                                          <c:forEach var="pro" items="${bestProducts}">
														<li id="">
															<div class="prod">
																<a
																	href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000183368&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_Best&amp;t_page=브랜드관&amp;t_click=베스트_상품상세&amp;t_number=10"
																	name="BrandA001436_Best" class="thumb goodsList"
																	data-ref-goodsno="A000000183368"
																	data-ref-dispcatno="9000002" data-ref-itemno="001"
																	data-attr="브랜드관^구달_베스트^[1+1기획] 구달 맑은 어성초 진정 토너 패드 70매 리필 기획(+70매 리필)"
																	data-trk="/" tabindex="-1"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000183368&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_베스트&quot;, &quot;2&quot;);"><img
																	src="${pro.productDisplaySrc }"
																	alt="[1+1기획] 구달 맑은 어성초 진정 토너 패드 70매 리필 기획(+70매 리필)"
																	class="pic-thumb" onerror="common.errorImg(this);"></a>
																<div class="prod-info"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000183368&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_베스트&quot;, &quot;2&quot;);">
																	<a
																		href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000183368&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_Best&amp;t_page=브랜드관&amp;t_click=베스트_상품상세&amp;t_number=10"
																		name="BrandA001436_Best" class="goodsList"
																		data-ref-goodsno="A000000183368"
																		data-ref-dispcatno="9000002" data-ref-itemno="001"
																		data-attr="브랜드관^구달_베스트^[1+1기획] 구달 맑은 어성초 진정 토너 패드 70매 리필 기획(+70매 리필)"
																		data-trk="/" tabindex="-1"><div class="prod-brand">
																			<strong class="exclusive"></strong>
																		</div> <span class="prod-name double-line">${ pro.productDisplayName}</span>
																		<div class="discount">
																			<span class="origin">${pro.productPrice}</span>
																		</div>
																		<div class="price">
																			<strong class="total">25,200<span
																				class="won">원</span></strong> <span class="oneday">오늘드림</span>
																		</div>
																		<div class="rating">
																			<span class="point">4.7</span><span class="num">${pro.productDisplayLike }</span>
																		</div>
																		<div class="flags">
																			<span class="flag sale">세일</span>
																		</div></a>
																</div>
																<div class="prod-func">
																	<button type="button" class="favorite btn_zzim jeem"
																		data-ref-goodsno="A000000183368" tabindex="-1">
																		<span>찜하기</span>
																	</button>
																	<button type="button" class="cart"
																		onclick="common.gf_regCart(this); return false;"
																		data-goods-no="A000000183368" data-item-no="001"
																		tabindex="-1">장바구니</button>
																</div>

															</div>
														</li>
														</c:forEach>
														
														<li></li>
														<li></li>
													</ul>
												</div>
												<div class="item slick-slide slick-current slick-active"
													data-slick-index="0" aria-hidden="false"
													style="width: 1020px;" tabindex="-1" role="option"
													aria-describedby="slick-slide20">
													<ul class="prod-list">

                                                            <c:forEach var="pro" items="${bestProducts}">
                                                            
														<li id="bestTab1">
															<div class="prod">
																<a
																	href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162323&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_Best&amp;t_page=브랜드관&amp;t_click=베스트_상품상세&amp;t_number=1"
																	name="BrandA001436_Best" class="thumb goodsList"
																	data-ref-goodsno="A000000162323"
																	data-ref-dispcatno="9000002" data-ref-itemno="001"
																	data-attr="${ pro.productDisplayName}"
																	data-trk="/" tabindex="0"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162323&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_베스트&quot;, &quot;3&quot;);"><img
																	src="${pro.productDisplaySrc }"
																	alt="${ pro.productDisplayName}"
																	class="pic-thumb" onerror="common.errorImg(this);"><span
																	class="flag-badge best">베스트</span></a>
																<div class="prod-info"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162323&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_베스트&quot;, &quot;3&quot;);">
																	<a
																		href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162323&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_Best&amp;t_page=브랜드관&amp;t_click=베스트_상품상세&amp;t_number=1"
																		name="BrandA001436_Best" class="goodsList"
																		data-ref-goodsno="A000000162323"
																		data-ref-dispcatno="9000002" data-ref-itemno="001"
																		data-attr="브랜드관^구달_베스트^[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획"
																		data-trk="/" tabindex="0"><div class="prod-brand">
																			<strong class="exclusive"></strong>
																		</div> <span class="prod-name double-line">${ pro.productDisplayName}</span>
																		<div class="discount">
																			<span class="origin">${pro.productPrice}</span>
																		</div>
																		<div class="price">
																			<strong class="total">30,960<span
																				class="won">원</span></strong> <span class="oneday">오늘드림</span>
																		</div>
																		<div class="rating">
																			<span class="point">4.7</span><span class="num">(999+)</span>
																		</div>
																		<div class="flags">
																			<span class="flag sale">세일</span><span
																				class="flag coupon">쿠폰</span>
																		</div></a>
																</div>
																<div class="prod-func">
																	<button type="button" class="favorite btn_zzim jeem"
																		data-ref-goodsno="A000000162323" tabindex="0">
																		<span>찜하기</span>
																	</button>
																	<button type="button" class="cart"
																		onclick="common.gf_regCart(this); return false;"
																		data-goods-no="A000000162323" data-item-no="001"
																		tabindex="0">장바구니</button>
																</div>

															</div>
														</li>
														</c:forEach>
													
													</ul>
												</div>
												<div class="item slick-slide" data-slick-index="1"
													aria-hidden="true" style="width: 1020px;" tabindex="-1"
													role="option" aria-describedby="slick-slide21">
													<ul class="prod-list">

														<li></li>

														<li></li>

													</ul>
												</div>
												<div class="item slick-slide slick-cloned"
													data-slick-index="3" aria-hidden="true"
													style="width: 1020px;" tabindex="-1">
													<ul class="prod-list">


													</ul>
												</div>
											</div>
										</div>
										<!-- item -->
										<!-- item -->
										<button type="button" data-role="none"
											class="slick-next slick-arrow" aria-label="Next"
											role="button" style="display: block;">Next</button>
									</div>
								</div>
								<!-- 슬라이더끝 -->
							</div>
						</div>

						
						
						
						 <!-- 리뷰 reviewList  -->
						<c:forEach items="${ reviewList }" var="review" varStatus="status">
							<div class="tabCont reviewPanel" role="tabpanel" id="tab-panel3"
								aria-lebelledby="tabitem3">

								<div class="tabSwiperBox">
									<div class="tabSwiper slick-initialized slick-slider"
										id="reviewTabSwiper">
										<button type="button" data-role="none"
											class="slick-prev slick-arrow" aria-label="Previous"
											role="button" style="display: block;">Previous</button>

										<div aria-live="polite" class="slick-list draggable">
											<div class="slick-track" role="listbox"
												style="opacity: 1; width: 0px; transform: translate3d(0px, 0px, 0px);">
												<div class="reviewList slick-slide slick-cloned"
													data-slick-index="-1" aria-hidden="true"
													style="width: 0px;" tabindex="-1">
													<ul class="inner">


														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000162318', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'10'}); ">
																<img src="${ review.productDisplaySrc }"
																	data-ref-goodsno="A000000162318"
																	alt="구달 청귤 비타C 잡티케어 세럼 마스크 1매 "
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^구달 청귤 비타C 잡티케어 세럼 마스크 1매 "
																	data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162318&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;1&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001');display.brandShopDetail.amplitudeReview('A000000162318', '구달 청귤 비타C 잡티케어 세럼 마스크 1매 ', '10'); mypage.reviewerLounge.goReviewDetail('23251131', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'10'});">
																<div class="topinfo">
																	<div class="review_stat type2">
																		<span class="point pt5">${ review.reviewGrade }</span>
																	</div>
																	<span class="like"><span class="icon">${review.reviewLike }</span></span>
																</div>
																<dl class="retxt">														
																	<dd>${ review.reviewContent }</dd>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="openReviewModal('23251131'); display.brandShopDetail.amplitudeReview('A000000162318', '구달 청귤 비타C 잡티케어 세럼 마스크 1매 ', '10'); mypage.reviewerLounge.goReviewDetail('23251131', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'10'});"
																	tabindex="-1">자세히 보기</a>
															</div>
														</li>

														<li></li>

														<li></li>

													</ul>
												</div>
											
												
												<div
													class="reviewList slick-slide slick-current slick-active"
													data-slick-index="0" aria-hidden="false"
													style="width: 0px;" tabindex="-1" role="option"
													aria-describedby="slick-slide30">
													<ul class="inner">


														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000168705', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'1'}); ">
																<img
																	src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0016/A00000016870522ko.jpg?l=ko"
																	data-ref-goodsno="A000000168705"
																	alt="[1+1기획] 구달 맑은 어성초 진정 수분 선크림 50ml 1+1 기획 SPF50+ PA++++"
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^[1+1기획] 구달 맑은 어성초 진정 수분 선크림 50ml 1+1 기획 SPF50+ PA++++"
																	data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000168705&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;2&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001')">
																<div class="topinfo">
																	<div class="review_stat type2">
																		<span class="point pt5">5점</span>
																	</div>
																	<span class="like"><span class="icon">33</span></span>
																</div>
																<dl class="retxt">
																	<dd>${ review.reviewContent }</dd>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="javascript:display.brandShopDetail.amplitudeReview('A000000168705', '[1+1기획] 구달 맑은 어성초 진정 수분 선크림 50ml 1+1 기획 SPF50+ PA++++', '1'); mypage.reviewerLounge.goReviewDetail('23033813', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'1'});"
																	tabindex="0">자세히 보기</a>
															</div>
														</li>

														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000162323', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'2'}); ">
																<img
																	src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0016/A00000016232329ko.jpg?l=ko"
																	data-ref-goodsno="A000000162323"
																	alt="[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획"
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획"
																	data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162323&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;3&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001').brandShopDetail.amplitudeReview('A000000162323', '[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획', '2'); mypage.reviewerLounge.goReviewDetail('23102015', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'2'});">
																<div class="topinfo">
																	<div class="review_stat type2">
																		<span class="point pt5">5점</span>
																	</div>
																	<span class="like"><span class="icon">24</span></span>
																</div>
																<dl class="retxt">
																	<dd>${review.reviewContent }</dd>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="javascript:display.brandShopDetail.amplitudeReview('A000000162323', '[한정기획] 구달 청귤 비타C 잡티케어 세럼 50ml+31ml 증정 기획', '2'); mypage.reviewerLounge.goReviewDetail('23102015', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'2'});"
																	tabindex="0">자세히 보기</a>
															</div>
														</li>

														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000183371', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'3'}); ">
																<img
																	src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0018/A00000018337104ko.jpg?l=ko"
																	data-ref-goodsno="A000000183371"
																	alt="[1+1기획] 구달 맑은 어성초 진정 수분 토너 300ml 기획(+300ml 리필)"
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^[1+1기획] 구달 맑은 어성초 진정 수분 토너 300ml 기획(+300ml 리필)"
																	data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000183371&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;4&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001').brandShopDetail.amplitudeReview('A000000183371', '[1+1기획] 구달 맑은 어성초 진정 수분 토너 300ml 기획(+300ml 리필)', '3'); mypage.reviewerLounge.goReviewDetail('22999186', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'3'});">
																<div class="topinfo">
																	<div class="review_stat type2">
																		<span class="point pt5">5점</span>
																	</div>
																	<span class="like"><span class="icon">16</span></span>
																</div>
																<dl class="retxt">
																	<dd>${review.reviewContent }</dd>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="javascript:display.brandShopDetail.amplitudeReview('A000000183371', '[1+1기획] 구달 맑은 어성초 진정 수분 토너 300ml 기획(+300ml 리필)', '3'); mypage.reviewerLounge.goReviewDetail('22999186', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'3'});"
																	tabindex="0">자세히 보기</a>
															</div>
														</li>


													</ul>
												</div>
												<div class="reviewList slick-slide" data-slick-index="1"
													aria-hidden="true" style="width: 0px;" tabindex="-1"
													role="option" aria-describedby="slick-slide31">
													<ul class="inner">


														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000182780', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'4'}); ">
																<img
																	src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0018/A00000018278013ko.jpg?l=ko"
																	data-ref-goodsno="A000000182780"
																	alt="[1+1 기획] 구달 맑은 어성초 진정 무기자차 선크림 50ml 1+1 기획 SPF50+ PA++++"
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^[1+1 기획] 구달 맑은 어성초 진정 무기자차 선크림 50ml 1+1 기획 SPF50+ PA++++"
																	data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000182780&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;5&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001').brandShopDetail.amplitudeReview('A000000182780', '[1+1 기획] 구달 맑은 어성초 진정 무기자차 선크림 50ml 1+1 기획 SPF50+ PA++++', '4'); mypage.reviewerLounge.goReviewDetail('23039309', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'4'});">
																<div class="topinfo">
																	<div class="review_stat type2">
																		<span class="point pt4">4점</span>
																	</div>
																	<span class="like"><span class="icon">10</span></span>
																</div>
																<dl class="retxt">
																	<dd>${review.reviewContent }</dd>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="javascript:display.brandShopDetail.amplitudeReview('A000000182780', '[1+1 기획] 구달 맑은 어성초 진정 무기자차 선크림 50ml 1+1 기획 SPF50+ PA++++', '4'); mypage.reviewerLounge.goReviewDetail('23039309', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'4'});"
																	tabindex="-1">자세히 보기</a>
															</div>
														</li>

														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000171077', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'5'}); ">
																<img
																	src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0017/A00000017107701ko.jpg?l=ko"
																	data-ref-goodsno="A000000171077"
																	alt="구달 살구 콜라겐 탄력 마스크 1매"
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^구달 살구 콜라겐 탄력 마스크 1매" data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000171077&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;6&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001').brandShopDetail.amplitudeReview('A000000171077', '구달 살구 콜라겐 탄력 마스크 1매', '5'); mypage.reviewerLounge.goReviewDetail('22881713', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'5'});">
																<div class="topinfo">
																	<div class="review_stat type2">
																		<span class="point pt3">3점</span>
																	</div>
																	<span class="like"><span class="icon">10</span></span>
																</div>
																<dl class="retxt">
																	<dd>${review.reviewContent }</dd>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="javascript:display.brandShopDetail.amplitudeReview('A000000171077', '구달 살구 콜라겐 탄력 마스크 1매', '5'); mypage.reviewerLounge.goReviewDetail('22881713', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'5'});"
																	tabindex="-1">자세히 보기</a>
															</div>
														</li>

														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000187780', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'6'}); ">
																<img
																	src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0018/A00000018778005ko.jpg?l=ko"
																	data-ref-goodsno="A000000187780"
																	alt="[단독기획] 구달 청귤 비타C 수분 아이패치 60매 (+60매 더블증정 단독기획)"
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^[단독기획] 구달 청귤 비타C 수분 아이패치 60매 (+60매 더블증정 단독기획)"
																	data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000187780&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;7&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001').brandShopDetail.amplitudeReview('A000000187780', '[단독기획] 구달 청귤 비타C 수분 아이패치 60매 (+60매 더블증정 단독기획)', '6'); mypage.reviewerLounge.goReviewDetail('22915372', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'6'});">
																<div class="topinfo">
																	<div class="review_stat type2">
																		<span class="point pt5">5점</span>
																	</div>
																	<span class="like"><span class="icon">8</span></span>
																</div>
																<dl class="retxt">
																	<dd>${review.reviewContent }</dd>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="javascript:display.brandShopDetail.amplitudeReview('A000000187780', '[단독기획] 구달 청귤 비타C 수분 아이패치 60매 (+60매 더블증정 단독기획)', '6'); mypage.reviewerLounge.goReviewDetail('22915372', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'6'});"
																	tabindex="-1">자세히 보기</a>
															</div>
														</li>


													</ul>
												</div>
												<div class="reviewList slick-slide" data-slick-index="2"
													aria-hidden="true" style="width: 0px;" tabindex="-1"
													role="option" aria-describedby="slick-slide32">
													<ul class="inner">


														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000190110', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'7'}); ">
																<img
																	src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0019/A00000019011007ko.jpg?l=ko"
																	data-ref-goodsno="A000000190110"
																	alt="[단독기획]구달 흑당근 비타A 레티놀 탄력 크림 50ml 기획 (+크림 15ml*2ea)"
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^[단독기획]구달 흑당근 비타A 레티놀 탄력 크림 50ml 기획 (+크림 15ml*2ea)"
																	data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000190110&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;8&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001').brandShopDetail.amplitudeReview('A000000190110', '[단독기획]구달 흑당근 비타A 레티놀 탄력 크림 50ml 기획 (+크림 15ml*2ea)', '7'); mypage.reviewerLounge.goReviewDetail('23024154', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'7'});">
																<div class="topinfo">
																	<div class="review_stat type2">
																		<span class="point pt5">5점</span>
																	</div>
																	<span class="like"><span class="icon">6</span></span>
																</div>
																<dl class="retxt">
																	<dd>${review.reviewContent }</dd>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="javascript:display.brandShopDetail.amplitudeReview('A000000190110', '[단독기획]구달 흑당근 비타A 레티놀 탄력 크림 50ml 기획 (+크림 15ml*2ea)', '7'); mypage.reviewerLounge.goReviewDetail('23024154', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'7'});"
																	tabindex="-1">자세히 보기</a>
															</div>
														</li>

														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000189175', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'8'}); ">
																<img
																	src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0018/A00000018917508ko.jpg?l=ko"
																	data-ref-goodsno="A000000189175"
																	alt="[NEW] 구달 청귤 비타C 잡티케어 패드 70매+70매 리필기획"
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^[NEW] 구달 청귤 비타C 잡티케어 패드 70매+70매 리필기획"
																	data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000189175&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;9&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001').brandShopDetail.amplitudeReview('A000000189175', '[NEW] 구달 청귤 비타C 잡티케어 패드 70매+70매 리필기획', '8'); mypage.reviewerLounge.goReviewDetail('22890557', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'8'});">
																<div class="topinfo">
																	<div class="review_stat type2">
																		<span class="point pt4">4점</span>
																	</div>
																	<span class="like"><span class="icon">6</span></span>
																</div>
																<dl class="retxt">
																	<dd>${review.reviewContent }</dd>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="javascript:display.brandShopDetail.amplitudeReview('A000000189175', '[NEW] 구달 청귤 비타C 잡티케어 패드 70매+70매 리필기획', '8'); mypage.reviewerLounge.goReviewDetail('22890557', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'8'});"
																	tabindex="-1">자세히 보기</a>
															</div>
														</li>

														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000190108', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'9'}); ">
																<img
																	src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0019/A00000019010811ko.jpg?l=ko"
																	data-ref-goodsno="A000000190108"
																	alt="[재유PICK/단독기획]구달 흑당근 비타A 레티놀 탄력 앰플 30ml 기획 (+앰플 9ml*2ea)"
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^[재유PICK/단독기획]구달 흑당근 비타A 레티놀 탄력 앰플 30ml 기획 (+앰플 9ml*2ea)"
																	data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000190108&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;10&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001').brandShopDetail.amplitudeReview('A000000190108', '[재유PICK/단독기획]구달 흑당근 비타A 레티놀 탄력 앰플 30ml 기획 (+앰플 9ml*2ea)', '9'); mypage.reviewerLounge.goReviewDetail('22776824', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'9'});">
																<div class="topinfo">
															
																	<div class="review_stat type2">
																		<span class="point pt5">5점</span>
																	</div>
																	<span class="like"><span class="icon">6</span></span>
																
																</div>
																<dl class="retxt" >
																
																	<dd>${review.reviewContent }</dd></button>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="";
																	tabindex="-1">자세히 보기</a>
															</div>
														</li>


													</ul>
												</div>
												<div class="reviewList slick-slide" data-slick-index="3"
													aria-hidden="true" style="width: 0px;" tabindex="-1"
													role="option" aria-describedby="slick-slide33">
													<ul class="inner">


														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000162318', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'10'}); ">
																<img
																	src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0016/A00000016231805ko.jpg?l=ko"
																	data-ref-goodsno="A000000162318"
																	alt="구달 청귤 비타C 잡티케어 세럼 마스크 1매 "
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^구달 청귤 비타C 잡티케어 세럼 마스크 1매 "
																	data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162318&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;11&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001').brandShopDetail.amplitudeReview('A000000162318', '구달 청귤 비타C 잡티케어 세럼 마스크 1매 ', '10'); mypage.reviewerLounge.goReviewDetail('23251131', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'10'});">
																<div class="topinfo">
																	<div class="review_stat type2">
																		<span class="point pt5">5점</span>
																	</div>
																	<span class="like"><span class="icon">4</span></span>
																</div>
																<dl class="retxt">
																	<dd>${review.reviewContent }</dd>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="javascript:display.brandShopDetail.amplitudeReview('A000000162318', '구달 청귤 비타C 잡티케어 세럼 마스크 1매 ', '10'); mypage.reviewerLounge.goReviewDetail('23251131', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'10'});"
																	tabindex="-1">자세히 보기</a>
															</div>
														</li>

														<li></li>

														<li></li>

													</ul>
												</div>
												<div class="reviewList slick-slide slick-cloned"
													data-slick-index="4" aria-hidden="true" style="width: 0px;"
													tabindex="-1">
													<ul class="inner">


														<li>
															<p class="thum"
																onclick="javascript:common.link.moveGoodsDetail('A000000168705', '', 'BrandA001436_Review', {t_page:'브랜드관',t_click:'리뷰_상품상세', t_number:'1'}); ">
																<img
																	src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0016/A00000016870522ko.jpg?l=ko"
																	data-ref-goodsno="A000000168705"
																	alt="[1+1기획] 구달 맑은 어성초 진정 수분 선크림 50ml 1+1 기획 SPF50+ PA++++"
																	onerror="common.errorImg(this);"
																	data-attr="브랜드관^구달_리뷰^[1+1기획] 구달 맑은 어성초 진정 수분 선크림 50ml 1+1 기획 SPF50+ PA++++"
																	data-trk="/"
																	onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000168705&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_리뷰&quot;, &quot;12&quot;);">
															</p>
															<div class="reviewCont"
																onclick="reviewDetail('rv_00000001')">
																<div class="topinfo">
																	<div class="review_stat type2">
																		<span class="point pt5">5점</span>
																	</div>
																	<span class="like"><span class="icon">33</span></span>
																</div>
																<dl class="retxt">
																	<dd>💬자칭/타칭 선크림 처돌이인 나 - ! 이 제품 후기가 꽤 좋다는 것을 알고
																		있었는데, 이미 너무 많아서 사볼 엄두가 안났음,,,, 내 최애 선크림인 엠디스픽 선크림을 다 쓴
																		김에 한번 구매해봄 ! 일단 [당분간 정착할 예정]이라는 결론부터 말하고 시작 ~ ➕요즘 핫한
																		라운드랩 자작나무 선크림, 아떼 만큼 발림성 좋은 유기자차 ➕진정 성분 들어있어 자극적이지도 않고
																		나는 눈시림도 괜찮음 💛아떼는 자극이 있었는데 이 제품 자극 못느꼈고, 💙라운드랩은 흡수 후
																		약간의 유분이 남았는데 이 제품은 좀 더 깔끔하게 흡수됨 💚이번에 해외여행가면서 동생은 식물나라
																		산소수 선젤로션, 나는 구달 선크림 사용했는데, 내가 훨씬 덜 탐,,, 둘다 50+에
																		PA++++로 동일한데도 불구하고,,,, 위에서 비교한 선크림 3종과 구달 선크림까지 전부
																		[한국콜마]라는 같은 곳에서 제조된 거라 전반적인 사용감은 비슷하나, 개인적으로 단점이 안보였던
																		구달로 정착 예정 ! 엠디스픽 선크림과 거의 똑같은데 올영 입점으로 접근성 좋고 할인도 되는
																		구달로 정착해야지 ! ✨ 늘 가방에 넣어놓고 다니면서 자주 발랐더니 한달도 안되어서 한 통 끝 !
																		도움이 되셨다면, 도움이 돼요(👍🏻) 한번만 눌러주세요 🤍</dd>
																</dl>
																<a href="javascript:void(0);" class="btn_detail"
																	onclick="javascript:display.brandShopDetail.amplitudeReview('A000000168705', '[1+1기획] 구달 맑은 어성초 진정 수분 선크림 50ml 1+1 기획 SPF50+ PA++++', '1'); mypage.reviewerLounge.goReviewDetail('23033813', {t_page:'브랜드관',t_click:'리뷰_리뷰상세보기',t_number:'1'});"
																	tabindex="-1">자세히 보기</a>
															</div>
														</li>



													</ul>
												</div>
											</div>
										</div>
										
										<button type="button" data-role="none"
											class="slick-next slick-arrow" aria-label="Next"
											role="button" style="display: block;">Next</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!--tabContainer  -->
				</div>
				
	<!-- 리뷰어 프로필 전체 부분 시작 -->
	<div class="layer_pop_wrap w920" id="layerWrap920" "></div>	
				
				
				<!-- brandBox line -->
				<div class="brandBox" id="sub_gbn_cate">
					<div class="head">
						<h3 class="tit" param="구달">
							구달 전체상품 (<span id="totCnt">29</span>개)
						</h3>
					</div>
					<ul class="cate_list_box">
						<li class="first on"><a href="javascript:;"
							data-ref-dispcatno="cate_01">전체</a></li>
						<li><a href="javascript:;" data-ref-dispcatno="cate_02">스킨케어</a></li>
						<li><a href="javascript:;" data-ref-dispcatno="cate_03">마스크팩</a></li>
						<li><a href="javascript:;" data-ref-dispcatno="cate_04">선케어</a></li>
						<li class="disabled">&nbsp;</li>
						<!-- 2017-02-03 빈 태그일때 class=disabled 추가 -->

						<li class="disabled">&nbsp;</li>
						<!-- 2017-02-03 빈 태그일때 class=disabled 추가 -->
					</ul>

					<div class="cate_align_box mgT20">
						<div class="align_sort" id="alignPrdSort">
							<ul>
								<li class="on"><a href="javascript:;" data-sort="p">인기순</a></li>
								<li><a href="javascript:;" data-sort="n">신상품순</a></li>
								<li><a href="javascript:;" data-sort="s">판매순</a></li>
								<li><a href="javascript:;" data-sort="l">낮은 가격순</a></li>
								<li><a href="javascript:;" data-sort="d">할인율순</a></li>
							</ul>
						</div>

						<div class="count_sort tx_num">
							<span class="tx_view">VIEW</span>
							<ul>
								<li class=""><a href="javascript:;" title="8개씩 보기">8</a></li>
								<li><a href="javascript:;" title="16개씩 보기">16</a></li>
								<li><a href="javascript:;" title="24개씩 보기">24</a></li>
							</ul>
						</div>

						<div class="type_sort" id="div_type_sort">
					<button class="btn_thumb active" onclick="toggleView('allGoodsList')">컬럼형식으로 보기</button>
					<button class="btn_list" onclick="toggleView('list-view')">리스트형식으로 보기</button>
				</div>				
					</div>

       
			
<script>
    $(document).ready(function() {
        // 페이지 로드 시 컬럼 형식으로 초기화
        toggleView('allGoodsList');

        // 이벤트 핸들러
        $('.btn_thumb').on('click', function() {
            console.log("Thumb button clicked");
            toggleView('allGoodsList');
        });

        $('.btn_list').on('click', function() {
            console.log("List button clicked");
            toggleView('list-view');
        });
    });

    function toggleView(viewType) {
        if (viewType === 'allGoodsList') {
            $('.btn_thumb').addClass('active');
            $('.btn_list').removeClass('active');
            $('#allGoodsList').show();
            $('#list-view').hide();
        } else if (viewType === 'list-view') {
            $('.btn_list').addClass('active');
            $('.btn_thumb').removeClass('active');
            $('#allGoodsList').hide();
            $('#list-view').show();
        }
    }
</script>


								
					<div id="allGoodsList">
						<input type="hidden" id="strList" name="strList" value="">
						<input type="hidden" id="lgcGoodsList" name="lgcGoodsList1"
							value=""> <input type="hidden" id="idx" name="idx"
							value="1"> <input type="hidden" id="totCntFmt"
							name="totCntFmt" value="29"> <input type="hidden"
							id="goodsTrackingCd" name="goodsTrackingCd" value="">

						<ul class="prod-list goodsProd">
							
						</ul>
						
					
				</div>
				<div class="prod-list goodsProd list-type" id="list-view">
	
	
		<li data-goods-idx="1">
			<div class="prod">
				<a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000189175&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_PROD&amp;t_page=브랜드관&amp;t_click=전체상품_마스크팩_상품상세&amp;t_number=1" name="BrandA001436_PROD" class="thumb goodsList" data-ref-goodsno="A000000189175" data-ref-dispcatno="9000002" data-ref-itemno="001" data-attr="브랜드관^구달_전체상품_마스크팩^[한정기획] 구달 청귤 비타C 잡티케어 패드 70매+70매 리필기획" onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000189175&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_전체상품_마스크팩&quot;, &quot;1&quot;);"><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018917508ko.jpg?l=ko" alt="[한정기획] 구달 청귤 비타C 잡티케어 패드 70매+70매 리필기획" class="pic-thumb" onerror="common.errorImg(this);"><span class="flag-badge best">베스트</span></a><div class="prod-info" onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000189175&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_전체상품_마스크팩&quot;, &quot;1&quot;);"><div class="prod-brand"><strong class="exclusive"></strong></div><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000189175&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_PROD&amp;t_page=브랜드관&amp;t_click=전체상품_마스크팩_상품상세&amp;t_number=1" class="goodsList" data-ref-goodsno="A000000189175" data-ref-dispcatno="9000002" data-ref-itemno="001" data-attr="브랜드관^구달_전체상품_마스크팩^[한정기획] 구달 청귤 비타C 잡티케어 패드 70매+70매 리필기획"><span class="prod-name double-line">[한정기획] 구달 청귤 비타C 잡티케어 패드 70매+70매 리필기획</span></a><div class="price-info"><div class="discount"> <span class="origin">38,000원</span></div><div class="price"><strong class="total">25,270<span class="won">원</span></strong> <span class="oneday">오늘드림</span></div><div class="rating"><span class="point">4.7</span><span class="num">(999+)</span></div><div class="rating_type"><div class="rating_point star5"><span class="oyblind">별점 5점 만점에 4.7점</span></div><span>(999+)</span></div></div><div class="flags"><span class="flag sale">세일</span><span class="flag coupon">쿠폰</span></div></div><div class="prod-func"><button type="button" class="favorite" data-ref-goodsno="A000000189175"><span>찜하기</span></button><button type="button" class="cart" onclick="common.gf_regCart(this); return false;" data-goods-no="A000000189175" data-item-no="001"><span>장바구니</span></button></div>
			</div>
		</li>
	
		<li data-goods-idx="2">
			<div class="prod">
				<a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000187780&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_PROD&amp;t_page=브랜드관&amp;t_click=전체상품_마스크팩_상품상세&amp;t_number=2" name="BrandA001436_PROD" class="thumb goodsList" data-ref-goodsno="A000000187780" data-ref-dispcatno="9000002" data-ref-itemno="001" data-attr="브랜드관^구달_전체상품_마스크팩^[2023어워즈] 구달 청귤 비타C 수분 아이패치 60매 (+60매 더블증정 단독기획)" onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000187780&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_전체상품_마스크팩&quot;, &quot;2&quot;);"><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018778007ko.jpg?l=ko" alt="[2023어워즈] 구달 청귤 비타C 수분 아이패치 60매 (+60매 더블증정 단독기획)" class="pic-thumb" onerror="common.errorImg(this);"><span class="flag-badge best">베스트</span></a><div class="prod-info" onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000187780&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_전체상품_마스크팩&quot;, &quot;2&quot;);"><div class="prod-brand"><strong class="exclusive"></strong></div><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000187780&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_PROD&amp;t_page=브랜드관&amp;t_click=전체상품_마스크팩_상품상세&amp;t_number=2" class="goodsList" data-ref-goodsno="A000000187780" data-ref-dispcatno="9000002" data-ref-itemno="001" data-attr="브랜드관^구달_전체상품_마스크팩^[2023어워즈] 구달 청귤 비타C 수분 아이패치 60매 (+60매 더블증정 단독기획)"><span class="prod-name double-line">[2023어워즈] 구달 청귤 비타C 수분 아이패치 60매 (+60매 더블증정 단독기획)</span></a><div class="price-info"><div class="discount"> <span class="origin">38,000원</span></div><div class="price"><strong class="total">26,500<span class="won">원</span></strong> <span class="oneday">오늘드림</span></div><div class="rating"><span class="point">4.7</span><span class="num">(999+)</span></div><div class="rating_type"><div class="rating_point star5"><span class="oyblind">별점 5점 만점에 4.7점</span></div><span>(999+)</span></div></div><div class="flags"><span class="flag sale">세일</span><span class="flag coupon">쿠폰</span></div></div><div class="prod-func"><button type="button" class="favorite" data-ref-goodsno="A000000187780"><span>찜하기</span></button><button type="button" class="cart" onclick="common.gf_regCart(this); return false;" data-goods-no="A000000187780" data-item-no="001"><span>장바구니</span></button></div>
			</div>
		</li>
		<li data-goods-idx="3">
			<div class="prod">
				<a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162321&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_PROD&amp;t_page=브랜드관&amp;t_click=전체상품_마스크팩_상품상세&amp;t_number=3" name="BrandA001436_PROD" class="thumb goodsList" data-ref-goodsno="A000000162321" data-ref-dispcatno="9000002" data-ref-itemno="001" data-attr="브랜드관^구달_전체상품_마스크팩^구달 청귤 비타C 잡티케어 세럼마스크 4매입" onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162321&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_전체상품_마스크팩&quot;, &quot;3&quot;);"><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016232103ko.jpg?l=ko" alt="구달 청귤 비타C 잡티케어 세럼마스크 4매입" class="pic-thumb" onerror="common.errorImg(this);"></a><div class="prod-info" onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000162321&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_전체상품_마스크팩&quot;, &quot;3&quot;);"><div class="prod-brand"><strong class="exclusive"></strong></div><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000162321&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_PROD&amp;t_page=브랜드관&amp;t_click=전체상품_마스크팩_상품상세&amp;t_number=3" class="goodsList" data-ref-goodsno="A000000162321" data-ref-dispcatno="9000002" data-ref-itemno="001" data-attr="브랜드관^구달_전체상품_마스크팩^구달 청귤 비타C 잡티케어 세럼마스크 4매입"><span class="prod-name double-line">구달 청귤 비타C 잡티케어 세럼마스크 4매입</span></a><div class="price-info"><div class="discount"> <span class="origin">8,000원</span></div><div class="price"><strong class="total">7,200<span class="won">원</span></strong> <span class="oneday">오늘드림</span></div><div class="rating"><span class="point">4.8</span><span class="num">(999+)</span></div><div class="rating_type"><div class="rating_point star5"><span class="oyblind">별점 5점 만점에 4.8점</span></div><span>(999+)</span></div></div><div class="flags"><span class="flag sale">세일</span></div></div><div class="prod-func"><button type="button" class="favorite" data-ref-goodsno="A000000162321"><span>찜하기</span></button><button type="button" class="cart" onclick="common.gf_regCart(this); return false;" data-goods-no="A000000162321" data-item-no="001"><span>장바구니</span></button></div>
			</div>
		</li>
		<li data-goods-idx="4">
			<div class="prod">
				<a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000169825&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_PROD&amp;t_page=브랜드관&amp;t_click=전체상품_마스크팩_상품상세&amp;t_number=4" name="BrandA001436_PROD" class="thumb goodsList" data-ref-goodsno="A000000169825" data-ref-dispcatno="9000002" data-ref-itemno="001" data-attr="브랜드관^구달_전체상품_마스크팩^[2023어워즈] 구달 청귤 비타C 수분 아이패치 60매" onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000169825&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_전체상품_마스크팩&quot;, &quot;4&quot;);"><img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0016/A00000016982523ko.jpg?l=ko" alt="[2023어워즈] 구달 청귤 비타C 수분 아이패치 60매" class="pic-thumb" onerror="common.errorImg(this);"></a><div class="prod-info" onclick="javascript:gtm.goods.callGoodsGtmInfo(&quot;A000000169825&quot;, &quot;&quot;, &quot;ee-productClick&quot;, &quot;브랜드관_구달_전체상품_마스크팩&quot;, &quot;4&quot;);"><div class="prod-brand"><strong class="exclusive"></strong></div><a href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000169825&amp;dispCatNo=9000002&amp;trackingCd=BrandA001436_PROD&amp;t_page=브랜드관&amp;t_click=전체상품_마스크팩_상품상세&amp;t_number=4" class="goodsList" data-ref-goodsno="A000000169825" data-ref-dispcatno="9000002" data-ref-itemno="001" data-attr="브랜드관^구달_전체상품_마스크팩^[2023어워즈] 구달 청귤 비타C 수분 아이패치 60매"><span class="prod-name double-line">[2023어워즈] 구달 청귤 비타C 수분 아이패치 60매</span></a><div class="price-info"><div class="discount"> <span class="origin">20,000원</span></div><div class="price"><strong class="total">16,000<span class="won">원</span></strong> <span class="oneday">오늘드림</span></div><div class="rating"><span class="point">4.6</span><span class="num">(999+)</span></div><div class="rating_type"><div class="rating_point star5"><span class="oyblind">별점 5점 만점에 4.6점</span></div><span>(999+)</span></div></div><div class="flags"><span class="flag sale">세일</span></div></div><div class="prod-func"><button type="button" class="favorite" data-ref-goodsno="A000000169825"><span>찜하기</span></button><button type="button" class="cart" onclick="common.gf_regCart(this); return false;" data-goods-no="A000000169825" data-item-no="001"><span>장바구니</span></button></div>
			</div>
		</li>	
		</div>
		<!-- brandPage.brandPage.html -->

<!-- 상품 목록 표시 -->
<ul class="prod-list goodsProd">
    <!-- 상품 목록 아이템들... -->
</ul>
 <div class="pageing">
		<strong title="현재 페이지">1</strong>
		<a href="javascript:void(0);" data-page-no="2">2</a>

	</div>


					</div>
			</div>
			
		</div>
      

		<form id="initForm" name="initForm" method="get">
			<input type="hidden" id="dispCatNo" name="dispCatNo"
				value="90000020137"> <input type="hidden" id="fltDispCatNo"
				name="fltDispCatNo" value=""> <input type="hidden"
				id="prdSort" name="prdSort" value="01"> <input type="hidden"
				id="pageIdx" name="pageIdx" value="1"> <input type="hidden"
				id="rowsPerPage" name="rowsPerPage" value="24"> <input
				type="hidden" id="onlBrndCd" name="onlBrndCd" value="A001436">
			<input type="hidden" id="onlBrndNm" name="onlBrndNm" value="구달">
			<input type="hidden" id="trackingCd" name="trackingCd" value="">
		</form>

		<div class="laytoast" id="brandOff" style="display: none;">
			<div class="inner">
				<p class="txt_recom txt_01">
					브랜드<br> <em>좋아요</em>
				</p>
			</div>
		</div>
		<div class="laytoast on" id="brandOn" style="display: none;">
			<div class="inner">
				<p class="txt_recom txt_01">
					브랜드<br> <em>좋아요</em>
				</p>
			</div>
		</div>
		<!-- 브랜드 찜 확인 레이어 -->
		<div class="layerAlim brand zzimOn" style="display: none;">
			<!-- zzimOn / zzimOff -->
			<span class="icon"></span>
			<p>
				브랜드<strong>좋아요</strong>
			</p>
		</div>

		<div class="layerAlim brand zzimOff" style="display: none;">
			<!-- zzimOn / zzimOff -->
			<span class="icon"></span>
			<p>
				브랜드<strong>좋아요</strong>
			</p>
		</div>
		<!-- 브랜드 찜 확인 레이어 -->

		<!-- 찜 확인 레이어 -->
		<div class="layerAlim zzimOn wishPrd" style="display: none;">
			<span class="icon"></span>
			<p class="one">
				<strong>좋아요</strong>
			</p>
		</div>
		<!--// 찜 확인 레이어 -->

		<!-- 찜 취소 레이어 -->
		<div class="layerAlim zzimOff wishPrd" style="display: none;">
			<span class="icon"></span>
			<p class="one">
				<strong>좋아요</strong>
			</p>
		</div>
		<!--// 찜 취소 레이어 -->

		<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
		<div id="directTop">
			<button>
				<span></span>TOP
			</button>
		</div>
		<!--/ㅁ 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->

	</div>

<script>
/*
$('#tablist').slick({ 
	   dots: false,
	   arrows: true,
	   fade: true,
	   infinite: true,
	   speed: 100,
	   slidesToShow: 1,
	   slidesToScroll: 1,
	   draggable: true
	});
*/
</script>
<script>
/*
//모달 열기 함수
<script>
   function modalcall() {
    $( "#review-detail-view" ).dialog({
      modal: true,
      buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  }
   */
  </script>
</script>


