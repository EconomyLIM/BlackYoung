<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/inc/include.jspf"%>

<div id="Contents">
	<form id="form1" method="POST" action="/counselor/personalAskList">
	<div class="sub_title_area customer">
		<h1>
			고객센터 <span>무엇을 도와드릴까요?</span>
		</h1>
	</div>

	<ul class="comm1sTabs threeSet customer">
		<li id="tabFaq"><a href="/counselor/faq">FAQ</a></li>
		<li id="tab1on1" class="on"><a href="#" title="선택됨">1:1문의</a></li>
		<li id="tabNotice"><a	href="/counselor/notice">공지사항</a></li>
	</ul>

	<!-- 등록 게시판 -->

	<table class="board-write-1s mgT40">
		<caption>문의유형, FAQ, 내용, 답변등록 알림(선택)으로 이루어진 1:1 문의 등록 표</caption>
		<colgroup>
			<col style="width: 25%;">
			<col style="width: 75%;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="col"><label for="TypeInquiry">문의유형</label></th>
				<td>
				<select id="cnslLrgCate" name="cnslLrgCd"
					title="문의유형 항목을 선택하세요" style="width: 192px;">
						<option value="">선택해주세요</option>
				</select>
				<select id="cnslMidCate" name="cnslMidCd" title="문의유형 항목을 선택하세요"
					style="width: 192px;">
					<option value="">선택해주세요</option>
				</select>
				</td>
			</tr>
			
			<!-- 문의상품 선택 -->
			<tr id="cnslGoodsSelect" style="display: none;">
				<th scope="col"><label for="goodsInquiry">문의상품</label></th>
				<td>
					<div class="over" style="width: 98%;">
						<div class="input-delete" style="width: 84%;">
							<input type="text" id="goodsInquiry" title="문의상품을 선택해 주세요. (필수)"
								placeholder="문의상품을 선택해 주세요. (필수)" readonly="readonly">

							<button type="button" class="ButtonDelete"
								onclick="javascript:counsel.reg.goodsDel();">삭제</button>
						</div>
						<input type="button" class="ButtonSubmit" value="문의상품 선택">
					</div>
				</td>
			</tr>
			<!-- //문의상품 선택 -->

			<tr class="textarea">
				<th scope="col"><label for="InputTextarea">내용</label></th>
				<td><textarea id="InputTextarea" name="personalAskContent" cols="5"
						rows="1" placeholder="문의내용을 입력해주세요.(2000자 이내)"
						style="width: 98%; height: 280px;" disabled="disabled"></textarea>
					<div id="multiple-thumbnail" class="full">
						<span class="txt">10MB이하 이미지파일 (JPG,PNG,GIF) 3개를 첨부하실 수 있습니다.</span>
						<div class="thumbnail-upload">
							<label for="inputFile">
								<button type="button" id="btnFile" class="file">
									<em id="imgCnt" class="count"><span>0</span>3</em>
								</button>
							</label> <input type="file" id="inputFile" name="personalAskImg"
								class="btnFileAdd" value="첨부파일" title="첨부파일 선택"
								style="display: none;" accept="image/*">

							<ul id="ulImg" class="thumbnail-list">

							</ul>
						</div>
						<!-- 첨부파일 등록 후 -->
						<div class="fileName" style="display: none;"></div>
						<canvas id="canvas" style="display: none;"></canvas>
					</div></td>
			</tr>
			<tr class="notice">
				<th scope="col">답변등록 알림(선택)</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="NoticeSms" value="Y" name="smsRcvYn" class="chkSmall" checked="checked">
							<label for="NoticeSms">SMS</label>
							<select title="통신사를 선택하세요" id="rgnNoSelect" class="sms" name="cellSctNo"
								style="width: 122px;" selected="selected">
								<option selected="selected">010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
								<option>0130</option>
								<option>0303</option>
								<option>0502</option>
								<option>0504</option>
								<option>0505</option>
								<option>0506</option>
						</select>
						<input type="hidden" id="cellSctNo" value="010">
						<span class="des">-</span>
						<input type="tel" class="sms" name="cellTxnoNo" id="mid" value="" title="휴대폰 가운데 4자리를 입력하세요"
							maxlength="4" placeholder="0000" style="width: 122px;">
						<span class="des">-</span>
						<input type="tel" class="sms" name="cellEndNo" id="end" value="" title="휴대폰 마지막 4자리를 입력하세요"
							maxlength="4" placeholder="0000" style="width: 122px;">
					</li>
					
					<li>
						<input type="checkbox" id="NoticeEmail" name="emailRcvYn" value="Y" class="chkSmall">
						<label for="NoticeEmail">E-mail</label>
						<input type="text" title="아이디를 입력하세요" class="email" id="emailAddr1" name="emailAddr1" placeholder="아이디를 입력하세요"
							style="width: 152px; ime-mode: disabled;" disabled="disabled">
						<span class="des">@</span>
						<input type="text" class="email" id="emailAddr2" name="emailAddr2" title="직접 입력 하세요" placeholder="직접 입력 하세요"
							style="width: 140px; ime-mode: disabled;" disabled="disabled">
						<input type="hidden" name="emailAddr" value="">
						<select title="도메인 주소를 선택하세요." class="email" style="width: 122px;"
							id="emailAddrSelect" disabled="disabled" selected="selected">
							<option value="-1" selected="selected">직접입력</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="paran.com">paran.com</option>
							<option value="empal.com">empal.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="korea.com">korea.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="hanafos.com">hanafos.com</option>
							<option value="daum.net">daum.net</option>
							<option value="chol.com">chol.com</option>
							<option value="feechal.com">feechal.com</option>
						</select>
					</li>
				</ul>
			</td>
			</tr>
		</tbody>
	</table>
<div class="area1sButton pdT30">
<a href="javascript:;" id="cnslSubmit" class="btnGreen">등록</a>
<a href="javascript:;" id="cnslCancel" class="btnGray">취소</a>
</div>

<input type="hidden" name="askCategoryId" id="askCategoryId" value=""/>
<input type="hidden" name="orderId" id="orderId" value="" />
<!-- <input type="hidden" name="personalAskContent" id="askconts" value="" /> -->
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>
	<!-- //등록 게시판 -->
	
	<!-- ajax -->
<script>		
$(function() {
	$.ajax({
		type : 'get',
		cache : false,
		url : '/majCategory',
		dataType : 'json',
		data : {},
		success : function(data) {
		//console.log(data);
		var major1 = $("<option>").val(data[0]).text(data[0]);
		var major2 = $("<option>").val(data[1]).text(data[1]);
		var major3 = $("<option>").val(data[2]).text(data[2]);
		$("#cnslLrgCate").append(major1).append(major2).append(major3);
		//console.log (data[0]);
		},
		error : function(data, textStatus) {
		alert('error');
		}
	});//maj 카테고리
 
	$("#cnslLrgCate").on("change", 	function() {
		var selectedMajor = $(this).val();
		if (selectedMajor == "") return;
		//console.log(selectedMajor);	
		$.ajax({
			type : 'get',
			cache : false,
			url : '/minCategory',
			dataType : 'json',
			data : {askCategoryMajor : selectedMajor},
			success : function(data) {
			
				$("#cnslMidCate").empty();
				$("#cnslMidCate").append($("<option>").text("선택해주세요"));
				for (var i = 0; i < data.length; i++) {
					//console.log(data[i]);
					var minor = $("<option>").val(data[i]).text(data[i]);
					$("#cnslMidCate").append(minor);
				}
			},
			error : function(data, textStatus) {
			alert('error');
			}
		});// min카테고리
		
		// major keyword
		var faqKeyword = $(this).val();
		$.ajax({
			type : 'get',
			cache : false,
			url : '/askKeyword', 
			dataType : 'json',
			data : {faqKeyword:faqKeyword},
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				//console.log(data);
				$("#recommFaqList").remove();
				if ( data.length != 0 ) {
				let tr = $("<tr>", { id: "recommFaqList" }).css("display", "table-row");
				let th = $("<th>", scope="col").html("혹시 이게 궁금하세요?");
				let td = $("<td>");
				let div = $("<div>").addClass("list-customer");
				let titul = $("<ul>").addClass("faq_list");
					
				for (var i = 0; i < data.length ; i++) {
					//console.log(data[i]);
					let a =$("<a>", {href:"#", role :"button"}).addClass("tit").html(data[i].faqTitle);
	
					let li = $("<li>").on("click", function (event) {
						event.preventDefault();
					    let isOpen = $(this).hasClass("open");
					    $(".faq_list > li").removeClass("open");
					    if (!isOpen) {
					        $(this).addClass("open");
					        a.prop("title", "답변내용 닫기");
					    } else {
					        a.prop("title", "답변내용 열기");
					    }
					});
					li.append(a);
					let contsul = $("<ul>").addClass("conts");
					let contsli = $("<li>").addClass("question");
					let p = $("<p>").addClass("pdzero").html(data[i].faqContent);
					
					li.append(contsul);
					contsul.append(contsli);
					contsli.append(p);
					titul.append(li);
				}//for
				tr.append(th);
				tr.append(td);
				td.append(div);
				div.append(titul);
				$("#Contents > table > tbody > tr:eq(1)").after(tr);
				} else {
					$("<tr>", { id: "recommFaqList" }).css("display", "none");
				}//ifElse
			},
			error : function(data, textStatus) {
			console.log('error');
			}
		});//keyword
	}); //change 

 	//minor keyword
	 $("#cnslMidCate").on("change", function() {
		$("#InputTextarea").prop("disabled", false);
		var value = $("#cnslMidCate option:selected").val();
		if (value=="주문/결제" || value=="배송문의" || value == "취소/교환/환불"){
			$("#cnslGoodsSelect").css("display", "table-row");
		} else {
			$("#cnslGoodsSelect").css("display", "none");
		}
		
		var faqKeyword = $(this).val();
		var faqKeywordArr = faqKeyword.includes('/') ? faqKeyword.split("/") : faqKeyword;
		//var faqKeywordArr = faqKeyword.split("/");
		$.ajax({
			type : 'get',
			cache : false,
			url : "/askKeywordArr",
			dataType : 'json',
			traditional: true,
			contentType: "application/json; charset=utf-8",
			data : { faqKeywordArr: faqKeywordArr },
			success : function(data) {
				//console.log(data);
				$("#recommFaqList").remove();
				if ( data.length != 0 ) {
				let tr = $("<tr>", { id: "recommFaqList" }).css("display", "table-row");
				let th = $("<th>", scope="col").html("혹시 이게 궁금하세요?");
				let td = $("<td>")
				let div = $("<div>").addClass("list-customer");
				let titul = $("<ul>").addClass("faq_list");
					
				for (var i = 0; i < data.length ; i++) {
					//console.log(data[i]);
					let a =$("<a>", {href:"#", role :"button"}).addClass("tit").html(data[i].faqTitle);
					let li = $("<li>").on("click", function (event) {
						event.preventDefault();
					    let isOpen = $(this).hasClass("open");
					    $(".faq_list > li").removeClass("open");
					    if (!isOpen) {
					        $(this).addClass("open");
					        a.prop("title", "답변내용 닫기");
					    } else {
					        a.prop("title", "답변내용 열기");
					    }
					});
					li.append(a);
					let contsul = $("<ul>").addClass("conts");
					let contsli = $("<li>").addClass("question");
					let p = $("<p>").addClass("pdzero").html(data[i].faqContent);
					
					li.append(contsul);
					contsul.append(contsli);
					contsli.append(p);
					titul.append(li);
				}//for
				tr.append(th);
				tr.append(td);
				td.append(div);
				div.append(titul);
				$("#Contents > table > tbody > tr:eq(1)").after(tr);
				} else {
					$("<tr>", { id: "recommFaqList" }).css("display", "none");
				}
			},
			error : function(data, textStatus) {
			console.log('error1');
			
			}
		});//keyword		
	}); //change  
});
</script>


<!-- popup -->
<div class="popup-contents" id="pop_cont" tabindex="0" style="top: 15%; margin-top: 0px; width: 800px; display:none;">
<div class="pop-conts">
			<h1 class="ptit">문의상품 선택</h1>
			
			<!-- 기간설정 조회 -->
			
		<fieldset class="search-period mgT30">
			<legend></legend>

			<div class="select_con">
			<p>구매기간</p>
				<ul class="select-month">
	
					<li class="on"><button type="button" data-month="-1">1개월</button></li>
					<li><button type="button" data-month="-3">3개월</button></li>
					<li><button type="button" data-month="-6">6개월</button></li>
					<li><button type="button" data-month="-12">12개월</button></li>

					
				</ul>
				<div class="select-range">
					<select id="cal-start-year" title="년도를 선택하세요" style="width:76px;"></select>
					<label for="cal-start-year">년</label>
					<select id="cal-start-month" title="달월을 선택하세요" style="width:60px;"></select>
					<label for="cal-start-month">월</label>
					<select id="cal-start-day" title="날일을 선택하세요" style="width:60px;"></select>
					<label for="cal-start-day">일</label>
					<span class="des">~</span>
					<select id="cal-end-year" title="년도를 선택하세요" style="width:76px;"></select>
					<label for="cal-end-year">년</label>
					<select id="cal-end-month" title="달월을 선택하세요" style="width:60px;"></select>
					<label for="cal-end-month">월</label>
					<select id="cal-end-day" title="날일을 선택하세요" style="width:60px;"></select>
					<label for="cal-end-day">일</label>
				</div>
			  </div>

			<button type="button" class="btnLookup" id="do-search-period">조회</button>
		</fieldset>
	<script src="<%=contextPath %>/resources/js/searchoptiondateonly.js"></script>
	<%
		String myPageURL = "/counselor/personalAsk";
	%>
	<script>
		var myPageURL = "<%= myPageURL %>"
	</script>
	
			<!-- //기간설정 조회 -->
			
			<!-- 데이터 목록 -->
			<div class="result-board pdTz mgT20">
				<span class="num">
					총 <em>${myOrderlist.size()}</em>건이 조회 되었습니다.
				</span>
				<input type="hidden" id="totCnt" value="0">
			</div>
			<div class="listup-data" id="orderGoodsList">
				<ul>
				<c:choose>
				<c:when test="${ not empty myOrderlist}">
				<c:forEach items="${myOrderlist}" var="list">
					<!-- 구매내역 있을 시 -->
				<li class="ordList" id="Y2311037571226">
					<div class="listup-main-data">
						<input type="radio" id="DataListUp1_0" name="orderId">
						<input type="hidden" class="nm" value="">
						<label class="clicks" for="DataListUp1_0">
							<span class="data">
							 <fmt:formatDate value="${list.orderDate}" pattern="yyyy.MM.dd" var="orderdate"/> 
								${orderdate}
							</span> 
							<span class="txt"><em>(주문번호: ${list.orderId}) ${list.productDisplayName} ${list.productCnt}개</em></span>							
						</label>
						<a href="#" class="btn-arrow">주문선택</a>
				</div>
				<div class="area-drop">
					<ul>
						<li>
							<input type="radio" name="DataListUp" id="DataListUp3s1_0" value="A000000163041" seq="1"/>
							<input type="hidden" class="nm" value="">
							<label for="DataListUp3s1_0">
								<span class="state">${list.orderStatus }</span>
								<em> ${list.productDisplayName}</em>
								<span>${list.productName}</span>
						</label>								
					</li>
				</ul>
			</div>
		</li>
				
			<!--// 구매내역 있을 시 -->
			</c:forEach>
			</c:when>
			<c:otherwise>
				<li class="nodata">조회 된 주문 건수가 없습니다.</li>
			</c:otherwise>
			</c:choose>
			<!--  -->
				</ul>
			</div>
			
			<!-- pageing star -->
		<div class="pageing">
		
		</div>
			<!-- //pageing end -->
			
			<div class="area1sButton">
				<a href="#" class="btnGreen">선택</a>
				<a href="#" class="btnGray" >취소</a>
			</div>
			<!-- //데이터 목록 -->
			<button type="button" class="ButtonClose">팝업창 닫기</button>
		</div>
</div>
<div id="dim" style="display:none;"></div>

	
<!-- 팝업창 script 영역 -->

	<!-- 기간설정 -->

<script>
$(function () {
	//팝업창 띄우기
	$(".ButtonSubmit").on("click", function () {
		$("#pop_cont").css("display", "block");
		$("#dim").css("display", "block");
	});
	
	//팝업창 닫기
	$(".ButtonClose").on("click", function () {
		$("#goodsInquiry").val("");
	 	var checkedRadio = $("input[type='radio']:checked");
	 	checkedRadio.prop('checked', false);
		$("#pop_cont").css("display", "none");
		$("#dim").css("display", "none");
	});

	// 선택버튼 클릭
	$("#pop_cont").on("click", ".btnGreen", function () {
	 	$("#goodsInquiry").val("");
	 	var checkedRadio = $("input[type='radio']:checked");
	 	if( !checkedRadio.length ){
	    	alert("문의 상품을 선택하세요.")	;
	    } else{ 
	    	var checkedValue = $("input:radio:checked").next().next().find('em').text();
	    	$("#goodsInquiry").val(checkedValue);
	    	checkedRadio.prop('checked', false);
			$("#pop_cont").css("display", "none");
			$("#dim").css("display", "none");
	    }
	});
	
	// 취소버튼 클릭
	$(".btnGray").on("click", function(e) {

		if ( $('#DataListUp1_0').hasClass('selected') ||  $('#DataListUp3s1_0').hasClass('selected') ) {
			alert("조회 및 선택된 문의상품정보는 저장되지 않습니다.");
	    } 
	    $("#pop_cont").css("display", "none");
		$("#dim").css("display", "none");
	    
	});

	//주문조회 리스트
	$('#pop_cont').on( 'click', '.btn-arrow',function() {
		event.preventDefault();
		var parentLi = $('.ordList');
		var clickedLi = $(this).closest('.ordList');

		parentLi.not(clickedLi).removeClass('open');
		clickedLi.toggleClass('open');
		$('.ordList').each( function() {
			var isOpen = $(this).hasClass('open');
			var text = isOpen ? '상품선택' : '주문선택';
			$(this).find('.btn-arrow').text(text);
			$(this).find('.listup-main-data').toggleClass('disabled', isOpen);
			$(this).find("#DataListUp1_0").prop('disabled', isOpen);
		});
	});
});
</script>

<!-- script 영역 -->
<script>
	
	//email
	var email = "${userDto.userEmail}";
	var emailarr = email.split('@', 2);
	var emailadd1 = emailarr[0];
	var emailadd2 = emailarr[1];

	$("#emailAddr1").val(emailadd1);
	$("#emailAddr2").val(emailadd2);
	$("#emailAddrSelect").val(emailadd2); 

	$("#NoticeEmail").on("change", function () {
		if ( $(this).is(":checked") ){
			$("#emailAddr1").prop("disabled", false);	
			$("#emailAddrSelect").prop("disabled", false);	
		} else {
			$("#emailAddr1").prop("disabled", true);
			$("#emailAddrSelect").prop("disabled", true);
		}
		if ( $("#emailAddrSelect option").val("-1") ) {
			$("#emailAddr2").prop("disabled", false);
		}
	});

	// emailAddr2 값과 동일한 값을 가진 옵션을 찾아 체크
	$("#emailAddrSelect option").each(function() {
	    if ($(this).val() === emailadd2) {
	        $(this).prop("selected", true);
	    }
	});
	$("#emailAddrSelect").change(function() {
		$("#emailAddr2").val($("#emailAddrSelect").val());
	});

	// tel
	var str = "${userDto.userTel}";
	var arr = str.split('-', 3);
	var start = arr[0];
	var mid = arr[1];
	var end = arr[2];

	$("#rgnNoSelect").val(start);
	$("#mid").val(mid);
	$("#end").val(end);



	function askCategory() {
		var lrgIndex = $('#cnslLrgCate').prop('selectedIndex');
		var midIndex = $('#cnslMidCate').prop('selectedIndex');
	    console.log(lrgIndex);
	    console.log(midIndex);
	    var categoryMapping = {
	        '1': {
	            '1': "AC_00000002",
	            '2': "AC_00000003",
	            '3': "AC_00000004",
	            '4': "AC_00000005",
	            '5': "AC_00000006",
	            '6': "AC_00000007"
	        },
	        '3': {
	            '1': "AC_00000008",
	            '2': "AC_00000009",
	            '3': "AC_00000010",
	            '4': "AC_00000011"
	        },
	        '2': {
	            '1': "AC_00000012",
	            '2': "AC_00000013",
	            '3': "AC_00000014",
	            '4': "AC_00000015"
	        }
	    };

	    var categoryId = categoryMapping[lrgIndex] && categoryMapping[lrgIndex][midIndex] ? categoryMapping[lrgIndex][midIndex] : "";
	    console.log(categoryId);
	    return categoryId;
	}
	
	$(function() {
		$('#cnslMidCate').on('change', function() {
		    var categoryId = askCategory();
	        $('#askCategoryId').val(categoryId);
		});
		$('.ordList').on('click', function() {
		    var orderInfo = $(this).find('.clicks em').text(); 
		    var orderId = orderInfo.match(/주문번호: (\w+)/)[1];
		    console.log(orderId);
		    $("#orderId").val(orderId);
		    
		});
	    $("#cnslSubmit").on("click", function () {
	    	alert("문의가 접수되었습니다.");
	    	$("#form1").submit();
	    	
		});
	});

</script>
	


