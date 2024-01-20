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
<title>블랙올리브영 온라인몰</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<script>
		let loginCheck = true;
	</script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<script>
		let loginCheck = false;
	</script>
</sec:authorize>
<script>
	let dimm = $("<div>").addClass("dimm").css("z-index", "990px");
	
	// 리뷰 도움돼요 업데이트
	function udpReviewLike(reviewId, btn) {
		let likePlus = 0;
		if($(btn).hasClass("like")) {
			$(btn).removeClass("on like").addClass("unlike");
			likePlus = -1;
		} else {
			$(btn).removeClass("unlike").addClass("on like");	
			likePlus = 1;
		}
		
		$.ajax({
			url: "/store/udpReviewLike"
			, method:"POST"
			, cache:false
			, dataType : "text"
			, data:{
				reviewId : reviewId
				, likePlus : likePlus
				, '${_csrf.parameterName }' : '${_csrf.token }'
			}
			, success: function (data) {
				console.log(data);		
				
				if(data === 'success') {
					$(btn).find(".num").text(function(index, currentText) {
						return parseInt(currentText) + likePlus;
					});
				}
			}
			, error : function (xhr, data, textStatus) {
				if(xhr.status == 401) {
					location.href = '<c:url value="/auth/login"/>';
				}
	        } // success , error
		}) // ajax
	}
	
	// 리뷰 상세보기에서 신고하기를 눌렀을 때
	function reviewReport(reviewId) {
		if(!loginCheck) {
			location.href = '<c:url value="/auth/login"/>';
			return;
		}
		
		$("#reviewId").val(reviewId);
		$(dimm).css("z-index", "998");
		$("#layerWrap920").css("z-index", "990")
		$("#layerWrap680").show();
		popupCenter($("#layerWrap680"));
	}
	
	
	
	// 리뷰 상세 보기 Ajax
	function reviewDetail(reviewId) {
		
		$.ajax({
			url: "/store/getReviewDetail"
			, method:"GET"
			, cache:false
			, dataType : "json"
			, data:{
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
								<a href="<c:url value='/store/goods?productDisplayId=\${data.productDisplayId}'/>" class="rw-box__link">
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
				console.log('error');
	        } // success , error
		}) // ajax
	}

	$(function() {
		$('.btn_zzim.jeem').on("click", function() {
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
		
		// 중분류 이름 클릭했을 때 리다이렉트
		$(".common-menu button").on("click", function() {
			location.href = '<c:url value="/store/getRanking?"/>' 
					+ 'categoryLargeId=' + $(this).data('categorylargeid') 
					+ '&type=' + $("#Container > div.best-area > ul > li.on > button").text()
					+ '&click=' + $(this).text();
		});
		
		// 중분류 어떤 걸 클릭했는지
		let lis = $(".common-menu li");
		$(lis).removeClass("on");
		let categoryMidName = '${param.click}';
		if(!categoryMidName) {
			$(lis).first().addClass("on");
		} else {
			for (var i = 0; i < lis.length; i++) {
				if($(lis[i]).find("button").text() == categoryMidName) {
					$(lis[i]).addClass("on");
					break;
				}
			}	
		}
		
		
		// 랭킹 뭘 선택했는지
		let btn = $("#Container > div.best-area > ul > li > button");
		for (var i = 0; i < btn.length; i++) {
			if($(btn[i]).text() == '${type}') {
				$(btn[i]).parent().addClass("on");
				break;
			}
		}
		
		$("#info").hover(
			function() {
				$("#info_txt").show();
			}
			, function() {
				$("#info_txt").hide();
			}
		);
		
		$(".btnMint_s").on("click", function() {
			$("#layer_pop_wrap").show();
			$("body").append(dimm);
			popupCenter($("#layer_pop_wrap"));
		});
		
		// 신고하기 버튼 눌렀을 때
		$("#regBtn").on("click", function() {
			let checked = $(".report_list li :checked");
			if(checked.length == 0) {
				alert("신고 사유를 선택해 주세요.");
				return;
			}
			
			let reviewReportType = $(checked).next().text();	// 신고사유
			let reviewReportContent = $(".txtArea textarea").val(); // 신고 내용
			let reviewId = $("#reviewId").val();
			
			$.ajax({
				url: "/store/reviewReport"
				, method:"POST"
				, cache:false
				, dataType : "text"
				, data:{
					reviewId : reviewId
					, reviewReportContent : reviewReportContent
					, reviewReportType : reviewReportType
					, '${_csrf.parameterName }' : '${_csrf.token }'
				}
				, success: function (data) {
					//console.log(data);		
					
					if(data === 'success') {
						alert("신고 내용이 접수되었습니다.");
						$('#layerWrap680').hide();
						$('#layerWrap920').css('z-index', '999');
					}
				}
				, error : function (xhr, data, textStatus) {
					if(xhr.status == 401) {
						location.href = '<c:url value="/auth/login"/>';
					}
		        } // success , error
			}) // ajax 
		})
		
	});
</script>

	<script>
	// 리뷰 상세 이미지 확대 기능
	$(function() {
		let bimg = $(".bimg");
		
		$("#layerWrap920").on("mouseover", ".review-detail-thumb ul li span", function() {
		    // 마우스 오버 시 실행되는 코드
		    $(".bimg").find('img').attr("src", $(this).find('img').attr('src'))
		    	.css({
		    		"height" : "100%"
		    		, "width" : "80%"
		    	});
		    $(".bimg").show();
		}).on("mouseout", ".review-detail-thumb ul li span", function() {
		    // 마우스 아웃 시 실행되는 코드
		    $(".bimg").hide();
		});
	});
		
	</script>	

<div id="Wrapper">
	<!-- #Container -->
	<div id="Container">
		<!-- #Contents -->
		<div class="title-best">
			<h1>랭킹<span>오늘의 랭킹! 요즘 가장 핫한 상품</span></h1>
		</div>

		<div class="best-area">
			<ul class="comm5sTabs tabN3">
				<li>
					<button type="button" onclick="javascript:location.href='<c:url value="/store/getRanking?type=판매 랭킹"/>'">판매 랭킹</button>
				</li>
				<li>
					<button type="button" onclick="javascript:location.href='<c:url value="/store/getRanking?type=리뷰 베스트"/>'">리뷰 베스트</button>
				</li>
				<li>
					<button type="button" onclick="javascript:location.href='<c:url value="/store/getRanking?type=실시간 랭킹"/>'">실시간 랭킹</button>
				</li>
			</ul>

				<c:if test="${type eq '리뷰 베스트' }">
					<div class="cont_box">
						<h3 class="tit_hn">
							오늘의 도움 리뷰 
							<a href="#" class="iconq btnTool">
								<img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_info_15x15.png"
									srcset="https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_info_15x15.png 1x, https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_info_15x15@2x.png 2x"
									alt="" id="info">
							</a>
							<div class="boxTooltip" style="top: 36px; left: 159.094px; display: none;" id="info_txt">
								<p class="txt">
									선택하신 카테고리의 제품들 중에<br>'최근 90일동안 가장 많은 도움이<br>돼요'를 받은
									리뷰입니다.
								</p>
							</div>
							<button type="button" class="btnMint_s">도움되는 리뷰 선정 TIP</button>
						</h3>
					</div>
				</c:if>

				<div class="common-menu">
				<ul>
					<c:if test="${type eq '판매 랭킹'}">
						<li><button type="button" data-categoryLargeId="">전체</button></li>
					</c:if>
					<c:forEach items="${categoryLargeList }" var="list">
						<li>
							<button type="button" data-categoryLargeId="${list.categoryLargeId }">${list.categoryLargeName }</button>
						</li>
					</c:forEach>
				</ul>
			</div>
				<div class="TabsConts on">
					<ul class="cate_prd_list ">
					<c:if test="${type eq '판매 랭킹' }">
						<c:forEach items="${productList }" var="list" varStatus="status">
								<li class="flag">
									<div class="prd_info ">
										<a href="<c:url value='/store/goods?productDisplayId=${list.productDisplayId}'/>" name="Best_Sellingbest" class="prd_thumb goodsList">
											<!-- <span class="newOyflag today"><em>오특</em></span>
											<span class="newOyflag time" style="display:none;">
												<div class="main-today">
													<div class="timer ready">
														<span class="nums h">
															<span class="num" data-timer-val="0">0</span>
															<span class="num" data-timer-val="0">0</span>
														</span>
														<span class="nums m">
															<span class="num" data-timer-val="0">0</span>
															<span class="num" data-timer-val="0">0</span>
														</span>
													</div>
												</div>
											</span> -->
											<span class="thumb_flag best"><fmt:formatNumber value="${status.count}" pattern="00"/></span>
											<img src="${list.productDisplaySrc }" alt="${list.productDisplayName }">
										</a>
										<div class="prd_name">
											<a href="javascript:;" name="Best_Sellingbest" class="goodsList">
												<span class="tx_brand">${list.brandName }</span>
												<p class="tx_name">${list.productDisplayName }</p>
											</a>
										</div>
										<button class="btn_zzim jeem" data-goodsno="${list.productDisplayId }"><span>찜하기전</span></button>
										<p class="prd_price">
											<span class="tx_org">
												<span class="tx_num">
													<fmt:formatNumber value="${list.minprice }" pattern="#,###"/>
												</span>원 
											</span>
											<span class="tx_cur">
												<span class="tx_num">
													<fmt:formatNumber value="${list.afterprice }" pattern="#,###"/>
												</span>원 
											</span>
										</p>
										<p class="prd_flag">
											<c:if test="${list.discountflag eq '1'}">
												<span class="icon_flag sale">세일</span>
											</c:if>
											<c:if test="${list.couponflag eq '1'}">
												<span class="icon_flag coupon">쿠폰</span>
											</c:if>
											<!-- 기간계 상품, 브랜드 증정품만 아이콘 노출 -->
											<c:if test="${list.presentflag eq '1'}">
												<span class="icon_flag gift" id="free_gift">증정</span>
											</c:if>
											<c:if test="${list.todaypickupflag eq '1'}">
												<span class="icon_flag delivery" id="quick_yn">오늘드림</span>
											</c:if>
										</p>
										<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:94.0%">10점만점에 5.5점</span></span>(435)</p>
										<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000160943" data-ref-dispcatno="90000010009" data-ref-itemno="001">장바구니</button><button class="btn_new_pop goodsList">새창보기</button></p>
									</div>
								</li>
							<c:if test="${status.count % 4 == 0 or status.last}">
					            </ul>
					            <c:if test="${not status.last}">
					                <ul class="cate_prd_list">
					            </c:if>
					        </c:if>
						</c:forEach>
					</c:if>
					<c:if test="${type eq '리뷰 베스트' }">
						<div class="help_review_wrap grid" id="reviewBestList">
							<c:forEach items="${reviewList}" var="list" varStatus="status">
								<a href="javascript:;" class="review_items" onclick="reviewDetail('${list.reviewId}')">
									<div class="img_wrap">
										<c:forEach items="${list.reviewimg }" var="img">
											<img class="thum" src="${img.reviewImgSrc }" alt="">											
										</c:forEach>
										<span class="score_stick">리뷰 ${status.count }위</span>
									</div>
									<div class="info_wrap">									
										<p class="title"></p>									
										<p class="text_wrap none_title">${list.reviewContent }</p>
									</div>
									<div class="ect_wrap">
										<ul class="ect">
											<li class="help"><img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/icon_k_on.png" alt="">도움이 돼요 <span>${list.reviewLike }</span></li>
										</ul>
									</div>
								</a>
							</c:forEach>
						</div>
					</c:if>
			</div>	
		</div>
	</div>
	<!-- //#Container -->

<form id="initForm" name="initForm" method="get">
	<input type="hidden" id="dispCatNo" name="dispCatNo" value="900000100100001">
	<input type="hidden" id="fltDispCatNo" name="fltDispCatNo" value="">
	<input type="hidden" id="pageIdx" name="pageIdx" value="0">
	<input type="hidden" id="rowsPerPage" name="rowsPerPage" value="0">
	<input type="hidden" id="t_page" name="t_page" value="랭킹">
	<input type="hidden" id="t_click" name="t_click" value="">
</form>
	
	<div class="layer_pop_wrap z9 w488 trans2" id="layer_pop_wrap" style="z-index: 999; display: none; ">
		<div class="layer_cont2">
			<h2 class="layer_title">오늘의 도움 리뷰에 선정되려면?</h2>
			<div class="contInner">
				<h5 class="stit_h5">‘도움이 돼요’ 받는 팁을 알려드릴게요!</h5>
				<ul class="lay_list">
					<li>1. 사용후기는 구체적이고 솔직하게! 사용팁을 공유한다면 더욱 도움이 돼요.</li>
					<li>2. 직접 사용하신 모습이 담긴 사진이 있다면, 더욱 도움이 될 수 있어요.</li>
					<li>3. 고객님의 피부 컨디션을 공유한다면, 더욱 큰 도움이 될 수 있습니다.</li>
				</ul>
			</div>
			<button class="layer_close type2" onclick="javascript:$('#layer_pop_wrap').hide(); $('.dimm').remove()">창 닫기</button>
		</div>
	</div>
	
	<div class="laytoast" id="brandOff" style="display: none;">
		<div class="inner">
			<p class="txt_recom txt_01">브랜드<br><em>좋아요</em></p>
		</div>
	</div>
	<div class="laytoast on" id="brandOn" style="display: none;">
		<div class="inner">
			<p class="txt_recom txt_01">브랜드<br><em>좋아요</em></p>
		</div>
	</div>
	
	<div class="layer_pop_wrap w920" id="layerWrap920" style="z-index: 999; display: none;"></div>

	
</div>
	
	
	<div class="layer_pop_wrap w680" id="layerWrap680" style="z-index: 999; display: none;">
		<input type="hidden" id="reviewId" value="">
		<div class="popup-contents">
			<div class="pop-conts type40">
				<h1 class="ptit">리뷰 신고하기</h1>
				<div class="">
					<div class="report_area">								
						<div class="tit_top">
							<h3 class="tit_type01">신고 사유를 알려주세요 (필수)</h3>
							<p class="txt">신고한 내용은 관리자 검토 후 조치됩니다.</p>
						</div>
						<ul class="report_list">					
							<li><input type="radio" id="report_type1" name="report_type" class="radioSmall" value="50"><label for="report_type1">저작권 침해, 명예훼손</label></li>					
							<li><input type="radio" id="report_type2" name="report_type" class="radioSmall" value="30"><label for="report_type2">개인정보 유출</label></li>					
							<li><input type="radio" id="report_type3" name="report_type" class="radioSmall" value="20"><label for="report_type3">광고 및 홍보성 내용</label></li>					
							<li><input type="radio" id="report_type4" name="report_type" class="radioSmall" value="10"><label for="report_type4">상품과 무관한 내용</label></li>					
							<li><input type="radio" id="report_type5" name="report_type" class="radioSmall" value="90"><label for="report_type5">해당 제품이 아닌 다른 제품의 리뷰</label></li>					
							<li><input type="radio" id="report_type6" name="report_type" class="radioSmall" value="70"><label for="report_type6">사용하지 않은 제품에 대한 내용</label></li>					
							<li><input type="radio" id="report_type7" name="report_type" class="radioSmall" value="80"><label for="report_type7">캡쳐사진 등 상품과 무관한 사진 첨부</label></li>				
							<li><input type="radio" id="report_type8" name="report_type" class="radioSmall" value="00"><label for="report_type8">잘못된 정보가 포함된 리뷰</label></li>					
							<li><input type="radio" id="report_type9" name="report_type" class="radioSmall" value="40"><label for="report_type9">욕설, 비방, 선정성 등 미풍양속을 해치는 내용</label></li>					
							<li><input type="radio" id="report_type10" name="report_type" class="radioSmall" value="60"><label for="report_type10">기타</label></li>				
						</ul>
						<h3 class="tit_type01 mgT40">신고 상세사유를 입력해주세요 (선택)</h3>
						<div class="txtArea">
							<textarea placeholder="신고하시는 상세이유를 입력해주세요(최대글자는 1,000자입니다)" maxlength="1000"></textarea>
						</div>
						<div class="area1sButton pdT30">
							<a href="#none" class="btnGreen" id="regBtn">신고하기</a>
							<a href="#none" class="btnGray" onclick="javascript:$('#layerWrap680').hide();$('#layerWrap920').css('z-index', '999')">취소</a>
						</div>
					</div>
				</div>
				<button type="button" class="ButtonClose" onclick="javascript:$('#layerWrap680').hide();$('#layerWrap920').css('z-index', '999')">팝업창 닫기</button>
			</div>
		</div>
	</div>
	
	<!-- 브랜드 찜 확인 레이어 -->
	<div class="layerAlim brand zzimOn" style="display:none;"><!-- zzimOn / zzimOff -->
	 <span class="icon"></span>
	 <p>브랜드<strong>좋아요</strong></p>
	</div>

	<div class="layerAlim brand zzimOff" style="display:none;"><!-- zzimOn / zzimOff -->
	 <span class="icon"></span>
	 <p>브랜드<strong>좋아요</strong></p>
	</div>
	<!-- 브랜드 찜 확인 레이어 -->
	
	<!-- 찜 확인 레이어 -->
	<div class="layerAlim zzimOn wishPrd" style="display:none;">
		<span class="icon"></span>
		<p class="one"><strong>좋아요</strong></p>
	</div>
	<!--// 찜 확인 레이어 -->
	
	<!-- 찜 취소 레이어 -->
	<div class="layerAlim zzimOff wishPrd" style="display:none;">
		<span class="icon"></span>
		<p class="one"><strong>좋아요</strong></p>
	</div>
	<!--// 찜 취소 레이어 -->

	<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	<div id="directTop" style="display: none;">
		<button><span></span>TOP</button>
	</div>
	<!--/ㅁ 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
</div>
</body>
</html>