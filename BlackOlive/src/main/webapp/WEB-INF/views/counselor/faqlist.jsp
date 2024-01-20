<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>


				
	<div id="Container">
		
		<div id="Contents" class="m2105">
			<div class="sub_title_area customer">
				<h1>고객센터 <span>무엇을 도와드릴까요?</span></h1>
			</div>
				
				<!-- 고객센터 페이지 선택 태그 -->
			<ul class="comm1sTabs threeSet customer">
				<li id="tabFaq" class="on"><a href="<%=contextPath%>/counselor/faq" title="선택됨">FAQ</a></li>
				<li id="tab1on1"><a href="<%=contextPath%>/counselor/personalAskList">1:1문의</a></li>
				<li id="tabNotice"><a href="<%=contextPath%>/counselor/notice">공지사항</a></li>
			</ul>
			
			
			<form id="sForm" name="sForm" method="get" action="/counselor/faqlist">
				
				<fieldset class="search-faq">
					<legend>FAQ 검색</legend>
<!-- 					<label for="inqTitNm">FAQ 검색</label> -->
					<div class="input" id="sch_field2">
						<input type="text" id="inqTitNm" name="inqTitNm" title="질문 키워드를 입력해주세요." placeholder="질문 키워드를 입력해주세요." value="${ pageMaker.criteria.keyword }">
						<a href="javascript:;" class="btn_sch_del"><span class="blind">검색어 삭제</span></a>
						<input type="submit" id="searchFaq" value="검색">
					</div>
				</fieldset>
				<!-- <input type="hidden" id="faqLrclCd" name="faqLrclCd" value="">
				<input type="hidden" id="faqMdclCd" name="faqMdclCd" value="">
				<input type="hidden" id="tagYn" name="tagYn" value=""> -->
				<input type="hidden" name="pageNum" value="${ pageMaker.criteria.pageNum }">
    		  	<input type="hidden" name="amount" value="${ pageMaker.criteria.amount }">
    		  	<input type="hidden" name="keyword" value="${ pageMaker.criteria.keyword }">    		  	    		  	
			</form>
			
			
			
			
				<div class="tag_list_wrap">
                    <span class="tag_list_tit">인기키워드</span>
					<div class="tag_list" style="margin-left: -87.3469px;">
						
							<a href="#">배송</a>
						
							<a href="#">반품</a>
						
							<a href="#">오늘드림</a>
						
							<a href="#">픽업</a>
						
							<a href="#">매장반품</a>
						
							<a href="#">기프트카드</a>
						
							<a href="#">올리브 멤버스</a>
						
							<a href="#">결제</a>
						
							<a href="#">교환</a>
						
							<a href="#">탑리뷰어체험단</a>
						
							<a href="#">매장</a>
						
							<a href="#">선물하기</a>
						
							<a href="#">리뷰</a>
						
							<a href="#">빠른결제</a>
						
							<a href="#"> 리뷰</a>
						
					</div>
				</div>
			
			<div id="TabsOpenArea">
	
		
	
				
				<div class="TabsConts  on">
	
					<div class="result-board pdT30">
						<span class="num">
							<span>${ pageMaker.criteria.keyword }</span> 검색결과 총 <em>${ searchtotal }</em>개
						</span>
					</div>
	
					
					<div class="list-customer">
						<ul>
							<c:forEach items="${faqVO}" var="faq" >
								<li>
							    							    
							        <!-- 반복 동작 수행 -->
							        <a href="#n" role="button" class="tit" title="답변 내용보기" data-attr="고객센터^FAQ_${faq.askCategoryMajor}/${faq.askCategoryMinor}^" data-value="${faq.faqTitle}">
							            <strong>${faq.askCategoryMinor}</strong>
							            
							            ${faq.faqTitle}
							        </a>
							        <ul class="conts">
							            <li class="question">
							                <div class="pdzero">
							                    ${faq.faqContent}&nbsp;
							                </div>
							                <p class="faq_txt_good">답변이 도움이 되었나요? <button class="btn_faq_good" id="btn_faq_good_${faq.rowNumber}" onclick="faq.list.setFaqTagList('${faq.rowNumber}'); return false;"><span>도움이 되었어요</span></button></p>
							                <input type="hidden" id="faqTagType${faq.rowNumber}" name="faqTagType${faq.rowNumber}" value="">
							            </li>
							        </ul>
						    	</li>
							</c:forEach>
							
						</ul>
					</div>
					
				</div>
				


			

	<div class="pageing">
	
	
		
			<c:if test="${ pageMaker.prev }">
				<a href="${ pageMaker.startPage -1 }">&laquo;</a>
			</c:if>
		
			<c:forEach begin="${ pageMaker.startPage }"
				end="${ pageMaker.endPage }" step="1" var="num">
			
			<!-- <strong title="현재 페이지">1</strong> -->
				
			<c:choose>
				<c:when test="${ num eq pageMaker.criteria.pageNum }">
					<strong title="현재 페이지">${ num }</strong>
				</c:when>
				<c:otherwise>
					<a href="${ num }" class="${ num }">${ num }</a>				
				</c:otherwise>
			</c:choose>

			</c:forEach>
<!-- 		<a href="javascript:void(0);" data-page-no="2">2</a> -->

			<c:if test="${ pageMaker.next }">
				<a href="${ pageMaker.endPage -1 }">&raquo;</a>
			</c:if>
	
	
	</div>



	
	
				<p class="common1s-text">찾으시는 질문이 없다면?</p>
				<div class="area1sButton">
				
					<a href="/counselor/faq" class="btnGreenW">FAQ 전체보기</a>
			
					<a href="/counselor/personalAsk" class="btnGreen">1:1문의하기</a>
				</div>
	

			</div>


		</div>
	</div>

<form id="actionForm" action="/counselor/faqlist" method="get">
	<input type="hidden" name="pageNum" value="${ pageMaker.criteria.pageNum }"> 
	<input type="hidden" name="amount" value="${ pageMaker.criteria.amount }"> 
	<input type="hidden" name="keyword" value="${ pageMaker.criteria.keyword }"> 
</form>

<script>

 $(document).ready(function(){
	 
	 history.replaceState({}, null, null);
	 
	 //검색어 하이라이트 처리
	 function highlightWord(word) {
		 
		    var contentElements = $("a.tit");
			console.log( 'some log : ',word);
		    contentElements.each(function() {
		        var contentText = $(this).html();
		        var pattern = new RegExp(word , 'gi');
		        var highlightedText = contentText.replace(pattern, '<span class="tx_same">$&</span>');
		        
		        // 감싼 결과로 업데이트
		        $(this).html(highlightedText);
		        console.log("highlightedText : ", highlightedText)
		    });
		}

		var someword = '${pageMaker.criteria.keyword}';
		

		highlightWord(someword);
	
	    	
	    $("a.tit").click(function() {
	    	event.preventDefault();
	   
	        var $parent = $(this).parent();
	        var $siblingContents = $(this).siblings("ul.conts");

	        if ($siblingContents.css("display") === "none") {
	            // 현재 클릭한 항목을 열어야 하는 경우
	            $parent.addClass("open");
	            $siblingContents.show();
	        } else {
	            // 현재 클릭한 항목을 닫아야 하는 경우
	            $parent.removeClass("open");
	            $siblingContents.hide();
	        }
	        
	        // 다른 항목들은 닫기
	        $parent.siblings().removeClass("open").find("ul.conts").hide();
	    });
	    	    
 });
 
</script>
<script>


	var actionForm = $("#actionForm");
	var sForm = $("#sForm");
	
	
	//검색창으로 검색
	$("#inqTitNm").keypress(function (event) {
		
		if (event.keyCode === 13 || event.keyCode === 108) {
			event.preventDefault();
			
			if (!sForm.find("input[name=inqTitNm]").val()) {
				alert("검색어를 입력해주세요.");
				return false;
			}
			
			var newkey = sForm.find("input[name=inqTitNm]").val();
			
			sForm.find("input[name=keyword]").val(newkey);
			actionForm.find("input[name=keyword]").val(newkey);
			
			sForm.find("input[name=pageNum]").val("1");
			actionForm.find("input[name=pageNum]").val("1");
			
			sForm.submit();
			
		}
		
	})	
	
	//태그 눌러서 검색
	$("div.tag_list a").on("click", function() {
		var tag = $(this).text();
				
		$("input#inqTitNm").val(tag);
		$("#sForm").find("input[name=keyword]").val(tag);
		
		sForm.find("input[name=pageNum]").val("1");
		actionForm.find("input[name=pageNum]").val("1");
		
		$("#sForm").submit();
	})
	
	
	
	//페이징 번호로 넘어가기
	$("div.pageing a").on("click", function() {
		
		event.preventDefault();
		let pageNum = $(this).attr("href");
		actionForm.find("input[name=pageNum]").val(pageNum);
		actionForm.submit();
			
	})
	
	
</script>

<script>
// 키워드 움직이는 스크립트
	var $bl = $(".tag_list_wrap"),
    $th = $(".tag_list_wrap .tag_list"),
    blW = $bl.outerWidth(),
    blSW = $bl[0].scrollWidth,
    wDiff = (blSW / blW) - 1, // widths difference ratio
    mPadd = 20, // Mousemove Padding
    damp = 20, // Mousemove response softness
    mX = 20, // Real mouse position
    mX2 = 30, // Modified mouse position
    posX = 30,
    mmAA = blW - (mPadd * 2), // The mousemove available area
    mmAAr = (blW / mmAA),
    totalWith = 0;


	$th.find("a").each(function(){
		totalWith += $(this).innerWidth() + 4;
	})
	
	if($bl.width() < (totalWith + 90)){
	    $bl.mousemove(function (e) {
	        mX = e.pageX - this.offsetLeft;
	        mX2 = Math.min(Math.max(0, mX - mPadd), mmAA) * mmAAr;
	    });
	
	    setInterval(function () {
	        posX += (mX2 - posX) / damp;
	        $th.css({
	            marginLeft: -posX * wDiff
	        });
	    }, 10);
	}
</script>