<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mypage-conts">
				
	<div class="title-area linezero">
		<h2 class="tit">리뷰</h2>
	</div>

	<ul class="comm1sTabs mgzero">
		<li><a href="<%=contextPath%>/mypage/reviewwrite" onclick="" data-attr="리뷰^리뷰_SortingTab^리뷰 작성">리뷰 작성</a></li>
		<li class="on" title="선택됨"><a href="javascript:void(0);" data-attr="리뷰^리뷰_SortingTab^나의 리뷰">나의 리뷰</a></li>
	</ul>

	
	<!--
	<div class="banner_mypage">
		<a href="#;" onClick="common.link.moveTopReviewer();"><img src="https://static.oliveyoung.co.kr/pc-static-root/image/mypage/banner_reviewer.jpg" alt="리뷰어 라운지" /></a>
	</div>
	-->
			<div class="banner_mypage">
				<div class="slide_list">
					
						
	                        <div class="slide">
								<a href="javascript:;" onclick="mypage.gdasCompleteList.handleClickReviewRollingBanner('https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102970002', {t_page: '마이페이지_리뷰', t_click: '나의리뷰탭_띠배너', t_number: '1', t_banner_name: '탑리뷰어 프리미엄 혜택👑'})" data-attr="리뷰^롤링배너^탑리뷰어 프리미엄 혜택👑^1">
		                        	<img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600040002/135/4852865991872837957.jpg" alt="탑리뷰어 프리미엄 혜택👑" onerror="common.errorImg(this);">
		                        </a>
		                    </div>
						
				</div>
				<div class="banner_arrow" style="display: none;">
					<button type="button" data-role="none" class="slick_arrow_prev" aria-label="Previous" role="button">이전</button>
					<button type="button" data-role="none" class="slick_arrow_next" aria-label="Next" role="button">다음</button>
					<span class="paging"></span>
					<button type="button" role="button" class="slick_autoplay slick_pause"><span>정지</span></button>
					<button type="button" role="button" class="slick_autoplay slick_play" style="display:none"><span>재생</span></button>
				</div>
			</div>
		

	<!--##  리뷰 고도화 1차 ##  문구 수정 및 html 추가 -->
	<ul class="dot_list">
		<li>리뷰 정책 위반으로 블라인드된 리뷰는 상품상세페이지 리뷰목록에 노출되지 않습니다.<br>
			블라인드 리뷰 운영정책을 확인해주세요 <button type="button" class="rw-btn-notice" onclick="popLayerOpenReview('reviewBlind');">자세히보기</button></li>
	</ul>

	<div class="con_txt">
		<h3 class="tit">누적 리뷰 건수<span>1</span>건</h3>
	</div>

	
	<table class="board-list-2s mgT20 new board-list-2s_myreview">
		<caption>상품, 리뷰로 이루어진 리뷰 목록 표</caption>
		<colgroup>
			<col style="width:359px;">
			<col style="width:310px;">
			<col style="width:auto">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">상품</th>
				<th scope="col" colspan="2">리뷰</th>
			</tr>
		</thead>
		<tbody>



			<tr>
				<td class="subject">
					<div class="area">

					<div class="area">
						<a class="thum" href="javascript:mypage.gdasList.moveGoodsDetailReview('A000000147882','리뷰_리뷰상품', {t_page: '마이페이지_리뷰', t_click: '나의리뷰탭_상품상세', goodsNo: 'A000000147882', goodsname: '필리밀리 듀얼 면봉 200P'});" data-attr="리뷰^리뷰상품^상품클릭">
							<img src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0014/A00000014788204ko.jpg?l=ko" alt="필리밀리 듀얼 면봉 200P" onerror="common.errorImg(this);">
						</a>
						<div class="textus">
							<dl class="data review-data">
								<dt>주문일자</dt>
								<dd>2023.09.04
									
									
								</dd>
							</dl>
							<a class="" href="javascript:mypage.gdasList.moveGoodsDetailReview('A000000147882','리뷰_리뷰상품', {t_page: '마이페이지_리뷰', t_click: '나의리뷰탭_상품상세', goodsNo: 'A000000147882', goodsname: '필리밀리 듀얼 면봉 200P'});" data-attr="리뷰^리뷰상품^상품클릭">
								<span class="tit">필리밀리</span>
								<span class="txt oneline">필리밀리 듀얼 면봉 200P</span>
								
							</a>
						</div>
					</div>



					</div>
				</td>
				<td class="subject">
					<div class="area">
						<div class="textus" style="width:90%;">
							<dl class="data review-data">
								<dt>작성일자</dt>
								<dd>2023.10.25</dd>
							</dl>
							<div class="rating">
								<span class="txt">


								</span>
								<span class="point pt5"></span>
							</div>
							<div class="review-flag-wrap">
								
								
								
							</div>


	
							<span class="link " data-gdas-seq="23152495" data-ord-no="Y2309042169426" data-goods-no="A000000147882" data-gdas-tp-cd="20" data-gdas-sct-cd="10">
								
												
													넘조아여 
엄마가 다 뺏어갔어요
어쩜좋아여~~~~~!!!
							
							
							</span>
		
		
		

				<!-- ## 리뷰 고도화 1차 ## : 리뷰 신고 제거 -->



						</div>
					</div>
				</td>
				<td>
					
					<%-- 리뷰 수정 버튼 --%>
					<button type="button" class="btn-review--small" data-gdas-seq="23152495" data-ord-no="Y2309042169426" data-goods-no="A000000147882" data-gdas-tp-cd="20" data-gdas-sct-cd="10" data-item-no="001" data-item-nm="" data-lgc-goods-no="8809628730120" data-pnt-pay-yn="Y" data-write-yn="N" data-thnl-path-nm="10/0000/0014/A00000014788204ko.jpg?l=ko" data-prgs-stat-cd="20" data-oper-dt="2023.09.04" onclick="mypage.gdasCompleteList.appraisalModify(this, {t_page: '마이페이지_리뷰', t_click: '나의리뷰탭_리뷰수정', goodsNo: 'A000000147882', goodsname: '필리밀리 듀얼 면봉 200P'});" data-attr="리뷰^리뷰수정^리뷰수정">리뷰수정</button><br>
							
					<%-- 리뷰 보기 버튼 --%>
					<button type="button" class="btn-review--small" onclick="mypage.reviewerInfo.goReviewDetail('23152495', {t_page: '마이페이지_리뷰', t_click: '나의리뷰탭_리뷰상세보기'})" data-attr="리뷰^리뷰보기^리뷰보기">리뷰보기</button><br>
					
				</td>
			</tr>
			
		</tbody>
	</table>
	

	<div class="pageing">
	
			
		<strong title="현재 페이지">1</strong>
		
	
	</div>

					
					<!-- ## 리뷰 고도화 1차 ## : 삭제 -->
					
<form id="frmGdasList" name="frmGdasList">
	<input type="hidden" id="goodsNo" name="goodsNo" value="">
	<input type="hidden" id="ordNo" name="ordNo" value="">
</form>
<script type="text/javascript" src="https://static.oliveyoung.co.kr/pc-static-root/js/mypage/gdas.js?dumm=202312210002"></script>
<script type="text/javascript" src="https://static.oliveyoung.co.kr/pc-static-root/js/mypage/reviewerInfo.js?dumm=202312210002"></script>
<script>
$(document).ready(function(){
    mypage.gdasCompleteList.init();

	var gdasPopScrollY = sessionStorage.getItem("gdasPopScrollY");
	if(gdasPopScrollY){ // 스크롤 위치값 존재 할 경우
		window.scrollTo(0, gdasPopScrollY);
		sessionStorage.removeItem("gdasPopScrollY");
	}

});

function popLayerOpenReview(target){

    var winH = $(window).height()/2;
    var popLayer = $("#" + target);
    $(popLayer).find('.popCont').css({'max-height': winH});

    var popPos = $(popLayer).height()/2;
    var popWid = $(popLayer).width()/2;
    $(popLayer).css({'position': 'fixed', 'left':'50%' , 'margin-left':-(popWid) , 'top':'50%' , 'margin-top':-(popPos)}).show().parents('body').css({'overflow' : 'hidden'});
    $('.dim').show();
    $('.dim').bind('click', function(){
    	popLayerCloseReview(target);
    });

    $(window).resize(function(){
        winH = $(window).height()/2;
        $(popLayer).find('.popCont').css({'max-height': winH});
        popPos =$(popLayer).height()/2;
        popWid = $(popLayer).width()/2;
        $(popLayer).css({'position': 'fixed', 'left':'50%' , 'margin-left':-(popWid) , 'top':'50%' , 'margin-top':-(popPos)})
    });


};

function popLayerCloseReview(target){
    var popLayer = $("#" + target);
    $(popLayer).hide().parents('body').css({'overflow-y' : 'auto'});
    $('.dim').hide();
};


</script>
<!-- ## 리뷰 고도화 1차 ## 블라인드 처리 알림 메세지  -->

<!-- ## 리뷰 고도화 1차  ## :  pc 공통 팝업 js 적용 필요 -->
<!-- ## 리뷰고도화 ## rw-form-wrap class 추가 및 팝업 사이즈 style 변경, 작성일 시 type-write class 추가 포함 -->
<div class="popup-contents rw-popup-blind" style="width:534px; margin-left:-267px ; display:none;" id="reviewBlind">
	<div class="pop-conts type40">
		<h1 class="ptit">블라인드 리뷰 운영정책</h1>
		<button type="button" class="ButtonClose" onclick="popLayerCloseReview('reviewBlind'); return false;">팝업창 닫기</button>
		<div class="rw-blind-txt">
			<div class="inner">
				<span>아래 기준에 해당되거나, 신고 받은 리뷰는 별도의 안내없이 블라인드 처리될 수 있습니다.</span>
			</div>
			<div class="inner">
				<p>위법성 항목</p>
				<ul>
					<li>특정인의 명예를 훼손하거나 저작권을 침해한 경우</li>
					<li>개인정보를 포함한 경우 (연락처, 이메일, SNS, 주소 등)</li>
					<li>상업적 목적이 담긴 경우</li>
					<li>식품 등의 표시광고 법률에 따라, 제한되는 내용이 포함된 경우</li>
				</ul>
			</div>
			<div class="inner">
				<p>상품 무관 정보</p>
				<ul>
					<li>사용하지 않거나, 구매 상품과 다른 상품에 대한 리뷰<br>* 타제품을 객관적 근거없이 비방하거나 우수하다는 표현 포함</li>
					<li>배송/매장 서비스에 대한 내용으로만 이루어진 리뷰</li>
					<li>단순 문의사항이나 상품과 상관없는 텍스트, 사진첨부</li>
				</ul>
			</div>
			<div class="inner">
				<p>기타</p>
				<ul>
					<li>다른 상품 리뷰에 동일한 내용을 반복 기재한 경우</li>
					<li>비정상적인 구매패턴에 따른 리뷰 작성을 한 경우</li>
					<li>다른 사람에게 위화감을 주는 경우</li>
				</ul>
			</div>
		</div>

		<button type="button" class="btn-close" onclick="popLayerCloseReview('reviewBlind'); return false;">닫기</button>

	</div>
</div>

<!-- 공통 딤처리 -->
<div class="dim"></div>
<!-- //공통 딤처리 -->

			</div>
			
<!-- 리뷰 수정 모달창  -->			
<!-- 리뷰 수정 모달창  -->			
<!-- 리뷰 수정 모달창  -->			

<div class="popup-contents" id="pop_cont" style="top: 612px; width: 650px; margin: -258px 0px 0px -325px; z-index: 999; left: 50%;">

   
<script>
imgDraw = function(){
	
     var FileNm =  $('#appxFileNm').val();
     var arrFileNm = FileNm.split(',');
     var uploadUrl = $('#gdasImgUploadUrl').val();
     var FilePahtNm =  $('#appxFilePathNm').val();
     var arrFilePahtNm = FilePahtNm.split(',');
     var writeYn	= $('#writeYn').val();
     var gdasDclModYn = $('#gdasDclModYn').val();

     var FilePaht =  $('#appxFilePath').val();
     var arrFilePaht = FilePaht.split(',');
     var imgCnt = 0;
     var makeli = '';
     
     if( arrFilePahtNm.length > 0 && '' != arrFilePahtNm ){
    	 // 이미지 수정이 가능한경우
         if(gdasDclModYn == 'N'){
	         for(var row=0; arrFilePahtNm.length  > row; row++){    
	             if(row > 4){
	                 mypage.gdasForm.addImgButtonClone(row, "");
	             } 
	             
	             var liWrap = $(".imgArea"+(row+1));
	             var liClassNm = liWrap.attr("class");
	             
		         $(".btn_img_add", liWrap).hide();
		         liWrap.append("<input type='hidden' class='imgPathNm'   value='"+arrFilePaht[row]+"'>");
		         liWrap.append("<input type='hidden' class='imgNm'       value='"+arrFileNm[row]+"'>");
		         liWrap.append("<button class='btn-del' onClick='javascript:delImg(\""+liClassNm+"\");'>삭제</button>" +
		         		"<img src='"+uploadUrl+arrFilePahtNm[row]+"' alt=''>");
		         
		         imgCnt +=1;
	         }
	         
	         // 이미지가 10개 미만인경우 이미지 추가버튼 생성 
	         if(4 < imgCnt && imgCnt < 10){
	             mypage.gdasForm.addImgButtonClone(imgCnt, "");
	         }   
         } else { // 이미지 수정이 불가인경우
        	 for(var row=0; arrFilePahtNm.length  > row; row++){
	        	 $("#notModImg").append("<li><img src='"+uploadUrl+arrFilePahtNm[row]+"' alt=''></li>");
        	 }
         }
     }
     
     $('#imgCnt').val(imgCnt);
};
</script>




<div class="popup-contents rw-form-wrap type-write" id="gdasLayerPop">

	<div class="pop-conts type40">
	
		<h1 class="ptit">리뷰 작성</h1>
	
	
	
	
	
		
		
			<a class="nofc" href="javascript:;" onclick="mypage.gdasList.moveGoodsDetailReview('A000000147882', '리뷰작성_리뷰작성상품', {t_page: '마이페이지_리뷰', t_click: '리뷰작성탭_체험단리뷰작성', goodsNo: 'A000000147882', goodsname: '필리밀리 듀얼 면봉 200P'});" data-attr="리뷰작성^리뷰작성상품^상품썸네일 또는 상품명클릭">
				<div class="item_info clrfix">
					<span class="thum">
						<img src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0014/A00000014788204ko.jpg?l=ko" alt="필리밀리 듀얼 면봉 200P" onerror="common.errorImg(this);">
					</span>
					<dl class="txt_info">
						<dt>필리밀리</dt>
						<dd>필리밀리 듀얼 면봉 200P</dd>
						
					</dl>
				</div>
			</a>
		
	
	<ul class="write_step">
		<li class="rating">
			<span class="tit one"><span class="oyblind">필수입력</span>상품은 어떠셨나요?</span><!-- 리뷰고도화 : 변경 -->
			<div class="step_cont">
				<div class="review_star star5">
					<div class="star_inner clrfix">
						<ul>
							<li class="on">
								<button class="star">1점</button>
							</li>
							<li class="on">
								<button class="star">2점</button>
							</li>
							<li class="on">
								<button class="star">3점</button>
							</li>
							<li class="on">
								<button class="star">4점</button>
							</li>
							<li class="on">
								<button class="star">5점</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</li>
		<li>
			<div class="step_cont">
				
				
					<!-- 올영체험단인경우 아래 포인트내용 미노출처리함 --> 
						<div id="rwReviewComment" class="rw-review-comment rw-review-comment-renewal">
							<strong class="rw-review-title">포인트 지급 안내</strong>
							<ul class="point-info-list">
							
								
									<li class="list-item">
										<p class="monthly-review-text">리뷰 100P<span class="list-bar"></span>한달사용리뷰 500P (탑리뷰어 2배)</p>
									</li>
									<li class="list-item">
										<p>도움이 돼요 건당 5P</p>
									</li>
								
								
							
							</ul>
						</div>

				
			</div>
		</li>
		
		
		<li>
			
				<div class="rw-photo-guide">
					<span class="rw-photo-guide__tit">리뷰 작성 TIP</span>
					<ul>
						
							<li><img src="https://image.oliveyoung.co.kr/uploads/images/gdasPhotoGd/D000000003961/2022/825/6299271936977009954.jpeg" alt="">0</li>
							
								
							
						
							<li><img src="https://image.oliveyoung.co.kr/uploads/images/gdasPhotoGd/D000000003961/2022/825/5719987119609844113.jpg" alt="">1</li>
							
						
						<!-- <li><img src="https://image.oliveyoung.co.kr/uploads/images/gdasEditor/2020/04/07/186236590724.png" alt=""></li> -->
					</ul>
					<p>
							
							직접 사용하는 모습이나<br>제품의 디테일을 보여주세요! (브러시결, 두께, 크기 등)
					</p>
				</div>
			
		</li>
		
			
			<li id="LitxtGdasCont">
				<span class="tit"><span class="oyblind">필수입력</span>솔직한 상품 리뷰를 남겨주세요  <button type="button" class="rw-btn-notice">자세히보기</button></span><!-- 리뷰 고도화 : 변경 -->
				<div class="step_cont"><!-- 리뷰 고도화 : 리뷰 작성 마크업 변경 -->
					<div class="rw-textarea-inner">
						
						<textarea id="txtGdasCont" title="리뷰작성" placeholder="꿀팁 가득, 상세한 리뷰를 작성해보세요!
도움수가 올라가면 포인트도 받고,
탑리뷰어가 될 확률도 높아져요!
반품, 환불 관련 내용은 고객센터로 별도 문의해주세요.">넘조아여 
엄마가 다 뺏어갔어요
어쩜좋아여~~~~~!!!</textarea> 
						<div class="line"></div>

						<div class="bottom">
							
								<div class="rw-text-flip">
								
									<p class="point">
										<span>양쪽 모양에 따라 안전하고 다양하게 사용이 가능했나요?</span>
									</p> <!--  가이드문구 영역 -->
								
									<p class="point is-active">
										<span>다른 면봉과 비교했을 때 이 면봉의 장점을 알려주세요.</span>
									</p> <!--  가이드문구 영역 -->
								
									<p class="point">
										<span>피부에 자극은 없나요?</span>
									</p> <!--  가이드문구 영역 -->
								
								</div>
							
							 <!--  가이드문구 영역 -->
							<div class="count fix_txtNum" style="color:black"><!-- 25자 이하 입력 시 error class 추가 -->
								<b class="txt_en" style="color:black">26</b>
								<span>/</span> 1,000
							</div>
						</div>
					</div>
					<!-- 과거데이터 헤시태그가 없기 때문에 값이 없는경우 영역 표시하지 않음 -->
					
					<div class="rw-hashtag">
						<div class="hashtag-info">
							<strong>해시태그<em style="display: none;">최대 <span class="ssfont-area">10</span>글자 입력할 수 있어요</em></strong>
							<span class="hashtag-count">
										<b>0</b>
										<span class="hashtag-dvider"></span>
										<span class="count-number">10</span>
								</span>
						</div>
						<div class="hashtag-input">
							
								
							
							<div class="keyword-input" style="display: inline-block;">
								<div class="hidden-text">태그추가</div>
								<div class="hidden-text2">태그추가</div>
								<input type="text" class="keyword-input-text" placeholder="태그추가" value="" maxlength="10" style="width: 49px;" data-attr="리뷰작성^해시태그^인풋박스클릭">
							</div>
						</div>
					</div>
				</div>
			</li>
		
		
		
			
			<li class="photo photo-update"><!-- 리뷰 고도화 : class 추가 -->

				<div class="step_cont">
					<!-- 리뷰 고도화 : 추가 -->


					<div class="photo-list-info">
						<strong>포토</strong>
					</div>
					<div class="rw-photo-list">
						<ul id="imgArea">
							<li class="imgArea1">
								<button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^1">추가</button>
								<form class="frmImg" enctype="multipart/form-data" method="POST">
									<input type="file" id="tmpFile1" class="tempFile" name="upload" style="display: none;">
								</form>
							</li>
							<li class="imgArea2">
								<button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^2">추가</button>
								<form class="frmImg" enctype="multipart/form-data" method="POST">
									<input type="file" id="tmpFile2" class="tempFile" name="upload" style="display: none;">
								</form>
							</li>
							<li class="imgArea3">
								<button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^3">추가</button>
								<form class="frmImg" enctype="multipart/form-data" method="POST">
									<input type="file" id="tmpFile3" class="tempFile" name="upload" style="display: none;">
								</form>
							</li>
							<li class="imgArea4">
								<button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^4">추가</button>
								<form class="frmImg" enctype="multipart/form-data" method="POST">
									<input type="file" id="tmpFile4" class="tempFile" name="upload" style="display: none;">
								</form>
							</li>
							<li class="imgArea5">
								<button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^5">추가</button>
								<form class="frmImg" enctype="multipart/form-data" method="POST">
									<input type="file" id="tmpFile5" class="tempFile" name="upload" style="display: none;">
								</form>
							</li>
							<li id="imgAreaClone" class="" style="display: none;">
								<button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^">추가</button>
								<form class="frmImg" enctype="multipart/form-data" method="POST">
									<input type="file" id="" class="tempFile" name="upload" style="display: none;">
								</form>
							</li>
						</ul>
						<p>
							
								사진은 10MB이하의 PNG, GIF, JPG 파일만 등록 가능합니다.
							
							
						</p>
					</div>
				</div>
			</li>
		
	</ul>
	<div class="btn_area">
		
		
		
		
			<button type="button" class="btn color1 gdasWriteLayer">닫기</button>
			<button type="button" class="btn color2" id="btnGdasReg" onclick="mypage.gdasForm.handleClickGdasRegButton({t_click: '리뷰작성_리뷰수정하기', goodsNo: 'A000000147882', goodsname: '필리밀리 듀얼 면봉 200P', gdasSctType: '10'})" data-attr="리뷰작성^리뷰등록^리뷰등록하기 버튼">리뷰 수정 하기</button>
		
	</div>
	
	<div class="rw-review-notice">
		<div class="notice-1">
			<div class="detail">
				<ul>
					<li>
						게시된 리뷰의 권리와 책임은 게시당사자에게 있으며, 올리브영은 이용자가 작성한 리뷰 등을 이용하여 서비스 운영 등에 활용할 수 있습니다. 이 때 리뷰는 모두 공개를 원칙으로 하되, 공개의 방법은 올리브영의 서비스 정책에 따라 변경될 수 있습니다.
					</li>
					<li>
						작성된 리뷰에 매월 1일~말일 기준으로 받은 “도움이 돼요“ 수 X5P가 익월 10일 지급됩니다. (ID 기준 월 최대 2,000P) (단, 포인트 지급 후 “도움이 돼요” 취소 시 그 다음 지급일에서 차감)
					</li>
					<li>
						결제기준 상품 구매금액이 2,000원 미만인 경우에는 리뷰 등록 보상 포인트를 지급하지 않습니다.
					</li>
					<li>
						리뷰 삭제는 작성 후 3일안에 가능합니다. (마이페이지 &gt; 리뷰 &gt; 나의리뷰)
					</li>
					<li>
						[식품 등의 표시·광고에 대한 법률]을 준수하고자 아래와 같은 표현은 게시를 지양하고 있으며, 아래의 기준에 해당되는 리뷰는 별도의 안내 없이 블라인드 처리됩니다.
						<br>- 의약품의 효능을 지니거나 질병치료 효과를 증대시킨다는 표현
						<br>- 일반식품을 건강기능식품으로 오인하게끔 하는 표현
						<br>- 사실과 다르거나, 과학적 근거없는 추상적인 표현
						<br>- 사행심 조장, 공중도덕이나 사회윤리를 침해하는 표현
					</li>
				</ul>
			</div>
		</div>
	</div>

	<button type="button" class="ButtonClose gdasWriteLayer">팝업창 닫기</button>

</div>

<!-- 상품평 작성 모드 일 때만 노출 -->


<div class="loading_pc" id="loading_pc">
	<span class="icon"><img src="https://static.oliveyoung.co.kr/pc-static-root/image//comm/pc_loading.gif" alt="로딩중"></span>
</div>



<!-- 리뷰 고도화 1차 : pc 공통 팝업 js 적용 필요 -->
<div class="popup-contents rw-popup-blind" id="rwNoticePop" style="width: 534px; margin-left: -267px; position: fixed; left: 50%; top: 50%; margin-top: -223px; display: none;"><!-- 리뷰고도화 : rw-form-wrap class 추가 및 팝업 사이즈 style 변경, 작성일 시 type-write class 추가 포함-->
		
    <div class="pop-conts type40" style="padding-bottom: 40px;">
        <h1 class="ptit">블라인드 리뷰 운영정책</h1>
        <button type="button" class="ButtonClose" onclick="javascript:popLayerClose('rwNoticePop');">팝업창 닫기</button>
        <div class="rw-blind-txt">
            <div class="inner">
                <span>아래 기준에 해당되거나, 신고 받은 리뷰는 별도의 안내없이 블라인드 처리될 수 있습니다.</span>
            </div>
			<div class="inner">
				<p>위법성 항목</p>
				<ul>
					<li>특정인의 명예를 훼손하거나 저작권을 침해한 경우</li>
					<li>개인정보를 포함한 경우 (연락처, 이메일, SNS, 주소 등)</li>
					<li>상업적 목적이 담긴 경우</li>
					<li>식품 등의 표시광고 법률에 따라, 제한되는 내용이 포함된 경우</li>
				</ul>
			</div>
			<div class="inner">
				<p>상품 무관 정보</p>
				<ul>
					<li>사용하지 않거나, 구매 상품과 다른 상품에 대한 리뷰<br>* 타제품을 객관적 근거없이 비방하거나 우수하다는 표현 포함</li>
					<li>배송/매장 서비스에 대한 내용으로만 이루어진 리뷰</li>
					<li>단순 문의사항이나 상품과 상관없는 텍스트, 사진첨부</li>
				</ul>
			</div>
			<div class="inner">
				<p>기타</p>
				<ul>
					<li>다른 상품 리뷰에 동일한 내용을 반복 기재한 경우</li>
					<li>비정상적인 구매패턴에 따른 리뷰 작성을 한 경우</li>
					<li>다른 사람에게 위화감을 주는 경우</li>
				</ul>
			</div>
        </div>

        <button type="button" class="btn-close" onclick="javascript:popLayerClose('rwNoticePop');">닫기</button>

    </div>
</div>

<!-- 리뷰 고도화 popup : 일반 리뷰 등록 완료 -->
<div id="rwCompleted" class="rw-alert-popup" style="display:none">
	<div class="rw-alert-popup-content">
		<strong>리뷰가 등록 됐어요!</strong>
		<p>
			소중한 리뷰 작성 감사합니다.<br>
			포인트는 4일 후에 지급됩니다.
		</p>

		<div class="rw-alert-btn">
			<button type="button" data-modyn="N" class="btn-type1 reviewComplete">완료</button>
		</div>
	</div>
</div>
<!-- // popup : 일반 리뷰  등록 완료 -->

<!-- 리뷰 고도화 popup : 사진 리뷰 등록 완료 -->
<div id="rwCompleted3" class="rw-alert-popup" style="display:none">
	<div class="rw-alert-popup-content">
		<strong>사진 리뷰가 등록 됐어요!</strong>
		
			<p>
				소중한 리뷰 작성 감사합니다.<br>
				포인트는 4일 후에 지급됩니다.
			</p>
		
		

		<div class="rw-alert-btn">
			<button type="button" data-modyn="N" class="btn-type1 reviewComplete">완료</button>
		</div>
	</div>
</div>
<!-- // popup : 사진 리뷰  등록 완료 -->


<div id="rwModify" class="rw-alert-popup" style="display:none">
	<div class="rw-alert-popup-content">
		<strong>리뷰 수정이 완료 됐어요!</strong>
		<p>
			
		</p>

		<div class="rw-alert-btn">
			<button type="button" data-modyn="Y" class="btn-type1 reviewComplete">완료</button>
		</div>
	</div>
</div>
<!-- // popup : 포토 리뷰  등록 완료 -->

<!-- 리뷰 고도화 popup : 리뷰 등록 완료 -->
<div id="rwCompleted2" class="rw-alert-popup" style="display:none">
	<div class="rw-alert-popup-content">
		<strong>리뷰가 등록 됐어요!</strong>
		
			<p>
				사진을 등록해 주시면<br>
				더 많은 고객들에게 도움이 될 수 있어요~<br>
				('도움이 돼요' 1개당 5P 추가 지급)
			</p>
		
		

		<div class="rw-alert-btn flex">
			<button type="button" class="btn-type1 photoReg">사진 등록하기</button>
			<button type="button" data-modyn="N" class="btn-type3 reviewComplete">완료</button>
		</div>
	</div>
</div>
<!-- // popup : 리뷰  등록 완료 -->

<!-- 공통 딤처리 -->
<div id="dim" style="display: none;"></div>
<!-- //공통 딤처리 -->

<form name="gdasForm" id="gdasForm">
	
	<input type="hidden" name="appxFilePathNm" id="appxFilePathNm" value="">
	
	<input type="hidden" name="appxFileNm" id="appxFileNm" value=""> 
	<input type="hidden" name="appxFilePath" id="appxFilePath" value=""> 
	<input type="hidden" name="gdasImgUploadUrl" id="gdasImgUploadUrl" value="https://image.oliveyoung.co.kr/uploads/images/gdasEditor/">

	
	<input type="hidden" name="gdasCont" id="gdasCont" value="넘조아여 
엄마가 다 뺏어갔어요
어쩜좋아여~~~~~!!!">
	
	<input type="hidden" name="shrtGdasCont" id="shrtGdasCont">
	
	<input type="hidden" name="gdasContTxt" id="gdasContTxt">
	
	<input type="hidden" name="gdasLen" id="gdasLen">
	
	<input type="hidden" name="gdasScrVal" id="gdasScrVal" value="10">
	
	
	<input type="hidden" name="gdasTpCd" id="gdasTpCd" value="20">
	
	<input type="hidden" name="gdasSctCd" id="gdasSctCd" value="10">
	<input type="hidden" name="purMbrYn" id="purMbrYn" value="">
	
	<input type="hidden" name="photoGdasYn" id="photoGdasYn" value="N">
	
	<input type="hidden" name="goodsNo" id="goodsNo" value="A000000147882">
	<input type="hidden" name="gdasSeq" id="gdasSeq" value="23152495"> 
	<input type="hidden" name="retUrl" id="retUrl" value="https://www.oliveyoung.co.kr/store/mypage/getGdasCompleteList.do?t_page=%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80_%EB%A6%AC%EB%B7%B0&amp;t_click=%EB%82%98%EC%9D%98%EB%A6%AC%EB%B7%B0%ED%83%AD"> 
	<input type="hidden" name="ordNo" id="retUrl" value="Y2309042169426"> 
	<input type="hidden" name="evtNo" id="retUrl" value=""> 
	<input type="hidden" name="gdasPrhbCatCnt" id="gdasPrhbCatCnt" value="0"> 
	<input type="hidden" name="dispStatCd" id="dispStatCd" value="10"> 
	<input type="hidden" name="writeYn" id="writeYn" value="N"> 
	<input type="hidden" name="itemNo" id="itemNo" value="001">
	<input type="hidden" name="gdasQstCd" id="gdasQstCd"> 
	<input type="hidden" name="gdasTotVal" id="gdasTotVal"> 
	<input type="hidden" name="gdasQstCont" id="gdasQstCont">
	<input type="hidden" name="lgcGoodsNo" id="lgcGoodsNo" value="8809628730120">
	<input type="hidden" name="ordGoodsSeq" id="ordGoodsSeq" value="">
	<input type="hidden" name="pntPayYn" id="pntPayYn" value="Y">
	<!-- 2019.10.21 오프라인 리뷰관련 추가 -->
	<input type="hidden" name="brndNm" id="brndNm" value="필리밀리">
	<input type="hidden" name="strNo" id="strNo" value="">
	<input type="hidden" name="operDt" id="operDt" value="">
	<input type="hidden" name="originBizplCd" id="originBizplCd" value="">
	<input type="hidden" name="receiptNo" id="receiptNo" value="">
	<input type="hidden" name="posNo" id="posNo" value="">
	
	
	<input type="hidden" name="imgCnt" id="imgCnt" value="0">
	<input type="hidden" name="hashTagCont" id="hashTagCont" value="">
	<input type="hidden" name="goodsNm" id="goodsNm" value="필리밀리 듀얼 면봉 200P">
	<!-- 2020.06.01 리뷰고도화로 추가됨 해당값은 첫구매 재구매 딱지를 붙이기 위해서 사용 상품평 등록시에 사용 -->
	<input type="hidden" name="firstGdasYn" id="firstGdasYn" value="Y">
	<!-- 2020.06.01 리뷰고도화로 추가됨 해당값은 한달사용후기 딱지를 붙이기 위해서 사용 상품평 등록시에 사용 -->
	<input type="hidden" name="used1mmGdasYn" id="used1mmGdasYn" value="">
	<!-- 
		2020.06.05 신고가 들어와서 전시여부가 전시안함이면 수정가능하기 하기 때문에 Y값으로 리턴됨
		그리고 해당값이 Y인경우 한번 수정할 수 있으며 한번 수정하게 되면 다시 전시여부를 전시로 update 한다
		PR_GDAS_INFO.GDAS_DCL_MOD_DTIME 해당 컬럼에 값이 있는경우 한번 수정을 했기 때문에 더이상 수정 불가능함
	 -->
	 <input type="hidden" name="gdasDclModYn" id="gdasDclModYn" value="N">

	<!-- [3614787] 블라인드 리뷰관리 화면개선-->
	<input type="hidden" name="preModYn" id="preModYn" value="N">
	<input type="hidden" name="preDispStatCd" id="preDispStatCd" value="10">
	<!-- == END == [3614787] 블라인드 리뷰관리 화면개선-->
	<input type="hidden" name="orgGdasSeq" id="orgGdasSeq" value="">
	<input type="hidden" name="renewUsed1mmGdasYn" id="renewUsed1mmGdasYn" value="N">
</form>
<script type="text/javascript" src="https://static.oliveyoung.co.kr/pc-static-root/js/mypage/gdas.js?dumm=202312210002"></script>
<script src="https://static.oliveyoung.co.kr/pc-static-root/js/common/text.js?dumm=202312210002" charset="utf-8"></script>
<script>

var _servletUrl = 'https://www.oliveyoung.co.kr/store/';
var _gdasImgUploadUrl = 'https://image.oliveyoung.co.kr/uploads/images/gdasEditor/';

var _hshTagListSize = "0";



$(document).ready(function(){
	// CJOYRV-181 리뷰 작성 폼 해시태그 입력 개선
	$('.keyword-input-text').css('width', $('.hidden-text2').width() + 'px');

	maximumTag();

	$('.keyword-input-text').keydown(function(e) {
		if(e.keyCode == 32) {
			e.preventDefault();
		}
	});

	$('.keyword-input-text').keyup(function(e) {

		$('.keyword-input').addClass('focus-input');
		$('.hidden-text').text($('.keyword-input-text').val());
		$(this).css('width', $('.hidden-text').width() + 'px');

		inputFocusout();
		textLengthCheck();

		if($(this).val() == '') {
			$(this).css('width', $('.hidden-text2').width() + 'px');
		}

		if(e.keyCode == 13 || e.keyCode == 32 ) {
			let inputText = $('.hidden-text').text().trim().slice(0,10);

			if($('.keyword-input-text').val() !== '') {
				var btnTmpl  = `<button type="button" class="keyword-input-item"><span class="hashtag-text">`+inputText+`</span><span class="tag-close"></span></button>`;

				$('.keyword-input').before(btnTmpl);
				$('.keyword-input-text').val('');
				$('.keyword-input-text').css('width', $('.hidden-text2').width() + 'px');
				inputFocusout();
			}

			$('.hashtag-info strong em').css('display', 'none');

			tagCountNumber();
			maximumTag();

		}

	});

	$('.keyword-input-text').on('click', function() {
		$('.keyword-input').addClass('focus-input');
		maximumTag();
	});

	function inputFocusout() {
		$('.keyword-input-text').on('focusout', function() {
			$('.keyword-input').removeClass('focus-input');

			let inputText = $('.hidden-text').text().trim().slice(0,10);

			if($('.keyword-input-text').val() !== '') {
				var btnTmpl  = `<button type="button" class="keyword-input-item"><span class="hashtag-text">`+inputText+`</span><span class="tag-close"></span></button>`;

				$('.keyword-input').before(btnTmpl);
				$('.keyword-input-text').val('');
				$('.keyword-input-text').css('width', $('.hidden-text2').width() + 'px');
			}

			$('.hashtag-info strong em').css('display', 'none');

			tagCountNumber();
			maximumTag();

		});

	};

	$(document).on('click', '.keyword-input-item .tag-close', function(e) {
		e.preventDefault();
		$(this).parent().remove();
		let count = document.querySelectorAll('.hashtag-input .keyword-input-item');
		$('.hashtag-count b').text(count.length);
		maximumTag();
	});

	function textLengthCheck() {
		if($('.hidden-text').text().length >= 11) {
			$('.hashtag-info strong em').css('display', 'inline-block');
		} else {
			$('.hashtag-info strong em').css('display', 'none');
		}
	};

	function tagCountNumber() {
		let count = document.querySelectorAll('.hashtag-input .keyword-input-item');
		$('.hashtag-count b').text(count.length);
	};

	function maximumTag() {
		let count = document.querySelectorAll('.hashtag-input .keyword-input-item');
		if(count.length >= 10){
			$('.keyword-input').css('display', 'none');
		} else{
			$('.keyword-input').css('display', 'inline-block');
		}
	};

	
	$('.rw-btn-notice').on('click', function (e) {
		e.preventDefault();
		
		popLayerOpen("rwNoticePop");
		// #rwNoticePop
		/* var winH = $(window).height()/2;
        var popLayer = $("#rwNoticePop");
        $(popLayer).find('.popCont').css({'max-height': winH});

        var popPos = $(popLayer).height()/2;
        var popWid = $(popLayer).width()/2;
        $(popLayer).css({'left':'50%' , 'margin-left':-(popWid) , 'top':'50%' , 'margin-top':-(popPos)}).show().parents('body').css({'overflow' : 'hidden'});
        $('#dim').show();
        $('#dim').bind('click', function(){
        	popLayerClose("rwNoticePop");
        });

        $(window).resize(function(){
            winH = $(window).height()/2;
            $(popLayer).find('.popCont').css({'max-height': winH});
            popPos =$(popLayer).height()/2;
            popWid = $(popLayer).width()/2;
            $(popLayer).css({'left':'50%' , 'margin-left':-(popWid) , 'top':'50%' , 'margin-top':-(popPos)})
        }); */
	});
    
    imgDraw();
    mypage.gdasForm.init();
	
    // 수정가능 여부확인
    mypage.gdasForm.regButtonChk();
    
    // jwkim : 올영체험단 리뷰인 경우 제어를 위해 사용 일단 테스트용 코드
    // 1. 올영체험단 리뷰인경우 사진등록을 제외한 모든 항목 필수값 처리
    // 2. 올영체험단 리뷰인 경우 글자수 25 > 50자로 늘림
    var gdasSctCd = $("input[name=gdasSctCd]").val();
    
    // 올영체험단이 아닌경우 올영체험단의 필수값 제어 삭제
    if(gdasSctCd == '10' || gdasSctCd == '60' || gdasSctCd == '70'){
        $(".oyReview").remove();
    }
    
    // jwkim : 해시태그가 있는경우에 해시태그 영역을 클릭한것 처럼 해줘야함
    if(_hshTagListSize > 0) {
		$('.rw-review-tag .msg-guide').hide();
		$('.rw-review-tag .rw-review-input').show();
    }
    
    
 	// 상품평 등록 제한이 아닐경우만 가능
    if( $("#gdasLayerPop").find("#gdasPrhbCatCnt").val() == "0" ){
	    var conLeng = 0; 
	    var conLengLimit = 0;
	   	
	    if(typeof $("#txtGdasCont").val() != "undefined"){
	    	conLeng = $("#txtGdasCont").val().length;
	    }
	    
	    if($('#gdasLayerPop #gdasSctCd').val() != '10' && $('#gdasLayerPop #gdasSctCd').val() != '60'){
	        conLengLimit = 50;
	    } else {
	        conLengLimit = 25;
	    }
	    
	    if(conLengLimit > conLeng){
	        eval("$('#LitxtGdasCont .fix_txtNum').attr('style','color:red')");
	        eval("$('#LitxtGdasCont .txt_en').attr('style','color:red')");
	    } else{
	        eval("$('#LitxtGdasCont .fix_txtNum').attr('style','color:black')");
	        eval("$('#LitxtGdasCont .txt_en').attr('style','color:black')");
	    }
    }
 	
    if(typeof $("#txtGdasCont").val() != "undefined"){
	    var conText = eval( "$('#txtGdasCont').val()");
// 	    var conLeng = conText.length;
// 	    eval("$('#LitxtGdasCont .txt_en').text(conLeng)");
	    
	    var trimConText = conText.replace(/\s|\n/gi, '');						// 공백/줄바꿈 제거
	    var trimConLeng = trimConText.length;
	    $("#LitxtGdasCont .txt_en").text(trimConLeng);
    }
    
});

$(function(){
	
	// start : 202006 텍스트 모션 관련 기능 추가
	/* var flipIdx = 0;
	var txtFlipTimer;
	var txtFlip = function(){
		flipIdx++;

		if (flipIdx == $('.rw-text-flip').find('.point').length) {
			flipIdx = 0;
		}

		$('.rw-text-flip').find('.point').removeClass('is-active');
		$('.rw-text-flip').find('.point').eq(flipIdx).addClass('is-active');
	};

	// 202006 텍스트 모션 관련 기능 추가
	if($('.rw-text-flip').find('.point').length > 0) {
		txtFlipTimer = setInterval(txtFlip, 5000);
	} */
	// end : 202006 텍스트 모션 관련 기능 추가
	
  	//별체크
	$('.review_star button').on('click', function(){
		var _this = $(this),
				_thisindex = $(this).parent('li').index(),
				_starOn = _thisindex+1,
				_review_star = $('.review_star'),
				_num = $('.review_star .num');

		$(".review_star li").removeClass("on");
		for (var i = 0; i <= _thisindex; i++) {
			$(".review_star li").eq(i).addClass("on");
		}
		_num.html(_starOn);
		_review_star.attr('class',  'review_star');
		_review_star.addClass('star'+ _starOn);
		
		var gdasSeq = $("#gdasSeq").val();
    	
    	//if(gdasSeq == ""){	// 등록시에만 작동 수정에서는 다름...
			// 등록버튼 제어를위한 공통함수
			mypage.gdasForm.regButtonChk();
    	//}
		
	});

	$('.sati_list label').on('click', function(){
		var _this = $(this);
		_this.parents('ul').find('label').removeClass('on');
		_this.addClass('on');
	});
	
	
});

// 마우스 우클릭 금지 
// $('textarea').on('contextmenu', function(e){
// 	e.preventDefault();
//
// 	console.log("e.button ==== " +e.button);
//
// });

$('textarea').on('mousedown', function(e){
	var leftClick = (e.button == 0);
    
	if(leftClick){
		var offset = $("#LitxtGdasCont").offset();

		// 2022-05-24 사용자 사용성 개선
		// $('html').animate({scrollTop : offset.top-11});
	}
	
});


// 붙여넣기 방지
// $('textarea').on('keydown', function(event){
// 	if (isProd == 'Y' && (event.ctrlKey==true && (event.which == '118' || event.which == '86'))) {
// 		event.preventDefault();
// 	}
// });

//상품평 TextArea 입력 체크
$('textarea').on('keyup', function(){
     
    var gdasTp = $(this).attr('id');
    
    var conText = "";
    var conLeng = 0;
    var conLengLimit = 0;
    var conLengMax = 0;
    
    // 한줄상품평
    if("txtShrtCont" == gdasTp){
        
        conLengLimit = 5;
        conLengMax = 30;
        
    // 일반상품평
    }else if("txtGdasCont" == gdasTp){
        
        // 올영체험단인경우 50자부터 글자색이 검정으로 변하게 글자수 제한 추가 : jwkim
        if($('#gdasLayerPop #gdasSctCd').val() != '10' && $('#gdasLayerPop #gdasSctCd').val() != '60'){
	        conLengLimit = 50;
        } else {
	        conLengLimit = 25;
        }
        
        conLengMax = 1000;
    }
    
    conText = eval( "$('#txtGdasCont').val()");
    conLeng = conText.length;
    
    var trimConText = conText.replace(/\s|\n/gi, '');						// 공백/줄바꿈 제거
    var trimConLeng = trimConText.length;
    
    if(conLengLimit > trimConLeng){
        eval("$('#Li" + gdasTp + " .fix_txtNum').attr('style','color:red')");
        eval("$('#Li" + gdasTp + " .txt_en').attr('style','color:red')");
    }else{
        eval("$('#Li" + gdasTp + " .fix_txtNum').attr('style','color:black')");
        eval("$('#Li" + gdasTp + " .txt_en').attr('style','color:black')");
    }
    
    // 최대글자수 이상이면 자르기
    if(trimConLeng > conLengMax){
        alert('리뷰는 최대 1,000자까지 작성하실 수 있어요!');
        
        var substrGdasCont = fnTrimSubstring(conText, conLengMax);
        eval( "$('#" + gdasTp + "').val( substrGdasCont )");
    }
    
    conText = eval( "$('#" + gdasTp + "').val()");
    trimConText = conText.replace(/\s|\n/gi, '');						// 공백/줄바꿈 제거
    trimConLeng = trimConText.length;
   
    $("#Li" + gdasTp + " .txt_en").text(trimConLeng)
    
//     conLeng = conText.length;
//     eval("$('#Li" + gdasTp + " .txt_en').text(conLeng)");
    
    var gdasSeq = $("#gdasSeq").val();
	/* if(gdasSeq == "" || mypage.gdasForm.photoRegYn == "Y"){
	} */
	mypage.gdasForm.regButtonChk();
    
});

$('.btn_img').on('click', function(){
    
    var imgCnt = Number($('#spImgCnt').text());
    
    if( imgCnt > 9 ){
        alert('사진은 10개까지만 등록 가능합니다.');
        return false;
    }
    
    $('#tmpFile').click();
});

$('.btn_img_add').on('click', function(){
	
     var btnWrap = $(this).closest("li");
     
     $(".tempFile", btnWrap).click();
     //$('#tmpFile').click();
});

/* $(document).on('contextmenu', function() {
  return false;
}); */

// 마우스로 복붙 시 입력 체크
$('textarea').on('mousedown input', function(){
	var gdasTp = $(this).attr('id');

	var conText = "";
	var conLeng = 0;
	var conLengLimit = 0;
	var conLengMax = 0;

	// 한줄상품평
	if("txtShrtCont" == gdasTp){

		conLengLimit = 5;
		conLengMax = 30;

		// 일반상품평
	}else if("txtGdasCont" == gdasTp){

		// 올영체험단인경우 50자부터 글자색이 검정으로 변하게 글자수 제한 추가 : jwkim
		if($('#gdasLayerPop #gdasSctCd').val() != '10' && $('#gdasLayerPop #gdasSctCd').val() != '60'){
			conLengLimit = 50;
		} else {
			conLengLimit = 25;
		}

		conLengMax = 1000;
	}

	conText = eval( "$('#txtGdasCont').val()");
	conLeng = conText.length;

	var trimConText = conText.replace(/\s|\n/gi, '');						// 공백/줄바꿈 제거
	var trimConLeng = trimConText.length;

	if(conLengLimit > trimConLeng){
		eval("$('#Li" + gdasTp + " .fix_txtNum').attr('style','color:red')");
		eval("$('#Li" + gdasTp + " .txt_en').attr('style','color:red')");
	}else{
		eval("$('#Li" + gdasTp + " .fix_txtNum').attr('style','color:black')");
		eval("$('#Li" + gdasTp + " .txt_en').attr('style','color:black')");
	}

	// 최대글자수 이상이면 자르기
	if(trimConLeng > conLengMax){
		alert('리뷰는 최대 1,000자까지 작성하실 수 있어요!');

		var substrGdasCont = fnTrimSubstring(conText, conLengMax);
		eval( "$('#" + gdasTp + "').val( substrGdasCont )");
	}

	conText = eval( "$('#" + gdasTp + "').val()");
	trimConText = conText.replace(/\s|\n/gi, '');						// 공백/줄바꿈 제거
	trimConLeng = trimConText.length;

	$("#Li" + gdasTp + " .txt_en").text(trimConLeng)

//     conLeng = conText.length;
//     eval("$('#Li" + gdasTp + " .txt_en').text(conLeng)");

	var gdasSeq = $("#gdasSeq").val();
	/* if(gdasSeq == "" || mypage.gdasForm.photoRegYn == "Y"){
	} */
	mypage.gdasForm.regButtonChk();

});

//공백을 제외하고 conLengMax만큼 글자를 잘라서 return해준다.
function fnTrimSubstring(conText, conLengMax){
	
	conText = common.isEmpty(conText) ? "" : conText;
	
	var len = conText.replace(/\s|\n/gi, '').length;
	if(len > conLengMax){
		var resultStr = "";
		
		var i = 0;
		var s = 0;
		while(i < conText.length && s < conLengMax){
			var chr = conText.charAt(i);
			
			if(!chr.match(/\s/gi) && !chr.match(/\n/gi)){
				s++;
			}
			
			resultStr += chr;
			
			i++;
		}
		
		return resultStr;
	} else {
		return conText;
	}
}
</script>

<script type="text/javascript">
	+function(a,p,P,b,y){a.braze={};a.brazeQueue=[];for(var s="BrazeSdkMetadata DeviceProperties Card Card.prototype.dismissCard Card.prototype.removeAllSubscriptions Card.prototype.removeSubscription Card.prototype.subscribeToClickedEvent Card.prototype.subscribeToDismissedEvent Card.fromContentCardsJson Banner CaptionedImage ClassicCard ControlCard ContentCards ContentCards.prototype.getUnviewedCardCount Feed Feed.prototype.getUnreadCardCount ControlMessage InAppMessage InAppMessage.SlideFrom InAppMessage.ClickAction InAppMessage.DismissType InAppMessage.OpenTarget InAppMessage.ImageStyle InAppMessage.Orientation InAppMessage.TextAlignment InAppMessage.CropType InAppMessage.prototype.closeMessage InAppMessage.prototype.removeAllSubscriptions InAppMessage.prototype.removeSubscription InAppMessage.prototype.subscribeToClickedEvent InAppMessage.prototype.subscribeToDismissedEvent InAppMessage.fromJson FullScreenMessage ModalMessage HtmlMessage SlideUpMessage User User.Genders User.NotificationSubscriptionTypes User.prototype.addAlias User.prototype.addToCustomAttributeArray User.prototype.addToSubscriptionGroup User.prototype.getUserId User.prototype.incrementCustomUserAttribute User.prototype.removeFromCustomAttributeArray User.prototype.removeFromSubscriptionGroup User.prototype.setCountry User.prototype.setCustomLocationAttribute User.prototype.setCustomUserAttribute User.prototype.setDateOfBirth User.prototype.setEmail User.prototype.setEmailNotificationSubscriptionType User.prototype.setFirstName User.prototype.setGender User.prototype.setHomeCity User.prototype.setLanguage User.prototype.setLastKnownLocation User.prototype.setLastName User.prototype.setPhoneNumber User.prototype.setPushNotificationSubscriptionType InAppMessageButton InAppMessageButton.prototype.removeAllSubscriptions InAppMessageButton.prototype.removeSubscription InAppMessageButton.prototype.subscribeToClickedEvent FeatureFlag FeatureFlag.prototype.getStringProperty FeatureFlag.prototype.getNumberProperty FeatureFlag.prototype.getBooleanProperty automaticallyShowInAppMessages destroyFeed hideContentCards showContentCards showFeed showInAppMessage toggleContentCards toggleFeed changeUser destroy getDeviceId initialize isPushBlocked isPushPermissionGranted isPushSupported logCardClick logCardDismissal logCardImpressions logContentCardImpressions logContentCardClick logContentCardsDisplayed logCustomEvent logFeedDisplayed logInAppMessageButtonClick logInAppMessageClick logInAppMessageHtmlClick logInAppMessageImpression logPurchase openSession requestPushPermission removeAllSubscriptions removeSubscription requestContentCardsRefresh requestFeedRefresh refreshFeatureFlags requestImmediateDataFlush enableSDK isDisabled setLogger setSdkAuthenticationSignature addSdkMetadata disableSDK subscribeToContentCardsUpdates subscribeToFeedUpdates subscribeToInAppMessage subscribeToSdkAuthenticationFailures toggleLogging unregisterPush wipeData handleBrazeAction subscribeToFeatureFlagsUpdates getAllFeatureFlags".split(" "),i=0;i<s.length;i++){for(var m=s[i],k=a.braze,l=m.split("."),j=0;j<l.length-1;j++)k=k[l[j]];k[l[j]]=(new Function("return function "+m.replace(/\./g,"_")+"(){window.brazeQueue.push(arguments); return true}"))()}window.braze.getCachedContentCards=function(){return new window.braze.ContentCards};window.braze.getCachedFeed=function(){return new window.braze.Feed};window.braze.getUser=function(){return new window.braze.User};window.braze.getFeatureFlag=function(){return new window.braze.FeatureFlag};(y=p.createElement(P)).type='text/javascript';
		y.src='https://js.appboycdn.com/web-sdk/4.8/braze.min.js';
		y.async=1;(b=p.getElementsByTagName(P)[0]).parentNode.insertBefore(y,b)
	}(window,document,'script');

	var gtmMbrNo = 'M0000010339417';
	var hashedGtmMbrNo = CryptoJS.SHA256(gtmMbrNo).toString();
	var ssoMbrNo = '9990011335167';
	var hashedSsoMbrNo = CryptoJS.SHA256(ssoMbrNo).toString();

	common.initBraze('a288b8d5-d6ca-4ffb-87ec-92b04ab45e8a', 'https://sdk.iad-05.braze.com/api/v3', typeof hashedGtmMbrNo !== 'undefined' ? hashedGtmMbrNo : '', typeof hashedSsoMbrNo !== 'undefined' ? hashedSsoMbrNo : '');
</script>

</div></div>



<!-- 리뷰 보기 모달창 -->
<!-- 리뷰 보기 모달창 -->
<!-- 리뷰 보기 모달창 -->
<!-- 리뷰 보기 모달창 -->

<div class="layer_pop_wrap w920" id="layerWrap920" style="z-index: 999; display: block; left: 50%; margin-left: -460px; top: 535.5px; margin-top: 0px;">

<!-- rate_01, rate_02, rate_03, rate_04 -->

	
<div class="review-detail-view">
	<p class="review-detail-view__tit">리뷰 상세보기 <button type="button" class="rw-popup-layer-close" onclick="goods.gdas.closeReviewerGdasDetailPop('23152495');"></button></p>

	<!-- 리뷰어 프로필 전체 부분 시작 -->
	<div class="reviewer-profile-wrap clrfix">
	<!-- reviewer-profile-info :: 리뷰어 프로필 시작 -->
		<div class="reviewer-profile-info profile-top-reviewer-v1 ">
		
			<div class="top-reviewer-inner">
					<!-- 탑리뷰어언서 UI추가 -->
				<div class="top-reviewer-profile">
					<div class="profile-top-content">
						<div class="reviewer-profile-img thum">
							<!-- 프로필 이미지 -->
							<div class="reviewer-profile-img__inner" onclick="common.link.commonMoveUrl('mypage/getReviewerProfile.do?key=RFRPOENqK1dLNzdvMGdWbHhWc09OQT09');">
								
							</div>
						</div>

						<div class="new-profile-info">
							<div class="user-id-area rate_04">
								
									
										<p class="id my-profile on">
											<strong>아짜증나x2</strong>
											<span class="badge-img">
													<span class="blind">멤버십 등급별 이미지</span>
									</span>
										</p>
									
									
								
							</div>

							<div class="profile-badge on">
								
								
							</div>

						</div>
					</div>

					<div class="profile-info-content">
						
						
					</div>
				</div>
				<!-- // 탑리뷰어언서 UI추가 -->
				
			</div>

			
		</div>
	<!-- reviewer-profile-info :: 리뷰어 프로필 끝 -->
	

		<div class="reviewer-profile-content">
			<div class="reviewer-profile-content__body">
				
				<!-- rw-box :: 누적 리뷰 부분에서 반복되었던 부분  시작 -->
				<div class="rw-box">
				
					<a href="#;" class="rw-box__link" onclick="location.href='https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000147882&amp;trackingCd=Best_Reviewbest'; gtm.goods.callGoodsGtmInfo('A000000147882', null, 'ee-productClick', '랭킹_리뷰베스트_리뷰상세', 1);" data-attr="랭킹^리뷰베스트_리뷰상세^필리밀리 듀얼 면봉 200P">
						<div class="rw-box-figure">
							<div class="rw-box-figure__img">
							
							
								<img src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0014/A00000014788204ko.jpg?l=ko" alt="" onerror="common.errorImg(this);">
							
							</div>
							<div class="rw-box-figcaption">
								
								<p class="rw-box-figcaption__brand">필리밀리</p>
								
								<p class="rw-box-figcaption__name">필리밀리 듀얼 면봉 200P</p>
								
									<p class="rw-box-figcaption__price">
										
											
											
										<span class="price">3,400원</span>
											
										
									</p>

									<p class="rw-box-figcaption__etc">
									
									
									
									
									
										<span class="today">오늘드림</span>
									
									</p>
								
							</div>
						</div>
					</a>
				

					<!-- 추가 :: s -->
					<!-- 스크롤 부분 :: s -->
					<div class="review-detail-view__content scrbar">
						<div class="rw-box__first-line">
							<span class="review_point"><!-- 리뷰 포인트 누적 리뷰에서와 같음. width 값으로 제어-->
								<span class="point" style="width:100%">5점만점에 5점</span>
							</span>
							<span class="review_point_text">
								<span>작성일자 2023.10.25</span>
								
								
								
								
							</span>
						</div>
						
						
						<div class="rw-box__second-line">
							
							
							
						</div>
						

						

						
						
							<!-- 썸네일 리스트 - 확대 가능 :: 시작 -->
							
							
							
							
								<p class="rw-box__description">
									넘조아여 <br>엄마가 다 뺏어갔어요<br>어쩜좋아여~~~~~!!!
								</p>
							
						

						<div class="review-detail-fixed">
						
						
						
						
						
						</div>

					</div>
					<!-- 스크롤 부분 :: e -->
					<div class="rw-box__bottom">
						<div class="rw-box__help">
							<button type="button" class="common-event-help unlike" id="gdas_23152495" onclick="goods.gdas.setRecommGdasToggle('23152495',  'Y');">
								<span>도움이 돼요</span>
								<span class="num">
                                    
										
										
											0
										
									
                                    </span>
							</button>
							<input type="hidden" name="recommCnt_23152495" value="0">
						</div>
						<button type="button" class="rw-box__help-btn" onclick="mypage.reviewerInfo.goDclPop('23152495', 'A000000147882', '001', 'Y');">신고하기</button>
					</div>
					<!-- 추가 :: e -->
				</div>
				<!-- rw-box :: 누적 리뷰 부분에서 반복되었던 부분  끝 -->
			</div>
		</div>
	
	</div>
	<!-- 리뷰어 프로필 전체 부분 끝 -->
</div>

<script src="https://static.oliveyoung.co.kr/pc-static-root/js/goods/gdas.js?dumm=202312210002"></script>
<script src="https://static.oliveyoung.co.kr/pc-static-root/js/mypage/reviewerInfo.js?dumm=202312210002"></script>
<script>
$(window).ready(function(){

	//이미지 상세 보기
	var _thum_list = $('.review-detail-thumb'),
	_big_thum_list = $('.review-detail-thumb ul li'),
	_thum_img = _thum_list.find('span');
	_bimg = $('.review-detail-view__content .bimg');

	_thum_img.on('mouseover', function(){
		_src = $(this).find('img').attr('src');
		_index = $(this).parent().index();
		_big_src =  _big_thum_list.eq(_index).find('img').attr('src');
		if(_big_src.indexOf("?RS=") > -1){
		    var temp= _big_src.substring(0,_big_src.indexOf("?RS="));
		    _big_src = temp;
		}
		_thum_top = _thum_list.position().top;
		_thum_pos = $(this).position().top;
		_top = _thum_top+_thum_pos-101;
		_bimg.find('img').attr('src',_big_src);
		_bimg.css('top', _top).show();
	}).on('mouseout', function(){
		_bimg.hide();
	});

	//2022-04-20 리뷰상세팝업 영역에 유효하지 않은 버튼으로 삭제처리
});

</script>

</div>





