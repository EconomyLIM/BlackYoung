<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/inc/include.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>블랙올리브영 온라인몰</title>
</head>
<body>

<script>
	//세 자리마다 , 찍기
	function formatStringWithCommas(str) {
	    return str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	// form check
	function formCheck() {
		if($("#ordManNm").val() == "") {
			alert($(this).attr("title"));
			$("#ordManNm").focus();
			return;
		} else if($("#ordManCellSctNo").val() == "") {
			alert($("#ordManCellSctNo").attr("title"));
			$("#ordManCellSctNo").focus();
			return;
		} else if($("#ordManCellTxnoNo").val() == "") {
			alert($("#ordManCellTxnoNo").attr("title"));
			$("#ordManCellTxnoNo").focus();
			return;
		} else if($("#ordManCellEndNo").val() == "") {
			alert($("#ordManCellEndNo").attr("title"));
			$("#ordManCellEndNo").focus();
			return;
		} else if($("#ordManEmailAddrId").val() == "") {
			alert($("#ordManEmailAddrId").attr("title"));
			$("#ordManEmailAddrId").focus();
			return;
		} else if($("#ordManEmailAddrDmn").val() == "") {
			alert($("#ordManEmailAddrDmn").attr("title"));
			$("#ordManEmailAddrDmn").focus();
			return;
		} else if($("#rcvNm1").val() == "") {
			alert("받는 사람 정보를 입력하세요.");
			$("#rcvNm1").focus();
			return;
		} else if($("#rcvPhone1").val() == "") {
			alert("받는 사람 정보를 입력하세요.");
			$("#rcvPhone1").focus();
			return;
		}
		
		
		if($("#payMethod_11").prop("checked") && $("#acqrCd").val() == "") {
			alert("결제하실 카드를 선택하세요.");
			return false;
		}
		
		if($("#agree_1").prop("checked") == false) {
			alert($("#agree_1").attr("title"));
			$("#btnDetailAgree").click();
			return false;
		} else if($("#agree_2_1").prop("checked") == false) {
			alert($("#agree_2_1").attr("title"));
			$("#btnDetailAgree").click();
			return false;
		} else if($("#agree_2_2").prop("checked") == false) {
			alert($("#agree_2_2").attr("title"));
			$("#btnDetailAgree").click();
			return false;
		} else if($("#agree_2_3").prop("checked") == false) {
			alert($("#agree_2_3").attr("title"));
			$("#btnDetailAgree").click();
			return false;
		}
			
		return true;
	}
	
	$(function() {
		//결제 버튼 눌렀을 때
		$("#btnPay").on("click", function() {
			if(formCheck()) {
				let payCheck = confirm("결제 하시겠습니까?");
				if(!payCheck) {
					alert("결제를 취소하셨습니다.");
					history.back();
				}
				
				let products = $("input[name=pro_id]");
				let params = "";
				for (var i = 0; i < products.length; i++) {
					params += i==products.length-1 ? $(products[i]).val() : $(products[i]).val() + ",";
				}
				
				$.ajax({
					type : 'get'
					, async : false
					, cache: false
					, url : '/Black_OY/olive/getProStockAjax.do'
					, dataType : 'json'
					, data : { products : params }
					, success : function(data) {
						if(data.cnt == 0) {
							alert("현재 상품의 재고가 소진되었습니다.");
							location.href = "<%=contextPath%>/olive/main.do";
						}
						// console.log(data);
		            }
					, error : function (data, textStatus) {
						console.log('error');
		            }
				});
				
				$("#orderForm").submit();
			}
		});
	});
	
</script>

<script>
	$(function() {
		// 쿠폰 얻어오기
		$.ajax({
			type : 'post'
			, async : false
			, cache: false
			, url : '/Black_OY/olive/getCoupon.do'
			, dataType : 'json'
			, data : { user_id : '${logOn.user_id}' }
			, success : function(data) {
				if(data == "") {
					$(".couponView").text(`보유쿠폰 (0)`)
					$("#userCpPop > div > h2").text(`보유쿠폰 (0})`)
				}
				
				$(".couponView").text(`보유쿠폰 (\${data.userCoupon.length})`)
				$("#userCpPop > div > h2").text(`보유쿠폰 (\${data.userCoupon.length})`)
				//console.log(data);
            }
			, error : function (data, textStatus) {
				console.log('error');
            }
		}); 
		
		// 가지고 있는 포인트 표시
		$("#cjonePnt").text(formatStringWithCommas('${logOn.u_point}'));
		
		// 회원 기본 설정
		let tel1 = '${dto.deli_tel}';
		let tel1s = tel1.split("-");
		$("#ordManCellSctNo").val(tel1s[0]);
		$("#ordManCellTxnoNo").val(tel1s[1]);
		$("#ordManCellEndNo").val(tel1s[2]);
		
		let email = '${logOn.u_email}';
		let emailArr = email.split("@");
		$("#ordManEmailAddrId").val(emailArr[0]);
		$("#ordManEmailAddrDmn").val(emailArr[1]);
		
		// 이메일 도메인 이벤트
		$("#ordManEmailAddrDmn_select").on("change", function() {
			if($(this).val() == "") {
				$("#ordManEmailAddrDmn").val("").prop("disabled", false);
				return;
			}
			$("#ordManEmailAddrDmn").val($(this).val()).prop("disabled", true);
		});
		
		// 메시지 카드 카테고리 부분
		$(".swiper-wrapper > button").on("click", function() {
			$(".swiper-wrapper > button").removeClass("on");
			$(this).addClass("on");
			let cate = $(this).data("card-category");
			
		});
		
		// 메시지 카드 이미지 부분
		// 슬라이드 부분
		$(".slide.slick-slide img").on("click", function() {
			event.preventDefault();
			$("#mc_id").val($(this).attr("alt"));
			$(".slide.slick-slide > span").removeClass("is-active");
			$(this).parent().parent().addClass("is-active");
			$(".img > img").attr({
				src : $(this).attr("src")
				, alt : $(this).attr("alt")
			});
		});
		
		// 메시지카드 textarea
		$("#presentMsg").on("input", function() {
			let MAX_LEN = 100;
			let content = $(this).val();
			
			if($(this).val().length > 100) {
				alert("입력 글자수를 초과하였습니다.\n100자 내외로 입력 가능합니다.");
				$(this).val($(this).val().substring(0, MAX_LEN));
			}
			$("#presentMsgCnt").text($(this).val().length);
		});
		
		
		// 동의 부분 처리
		$("#btnDetailAgree").on("click", function() {
			$("#agreeList").toggleClass("open");
		});
		
		$("#agree_all").on("click", function() {	
			$("input[name='agreeChk']").prop("checked", $(this).prop("checked"));
		});
		
		$("input[name='agreeChk']").on("click", function() {
			let check = $("input[name='agreeChk']").length == $("input[name='agreeChk']:checked").length;
			$("#agree_all").prop("checked", check);
		});
		
		// 결제수단 선택 처리
		$("#payMethod_11").on("click", function() {
			$("#payMethodList > li").not("#payMethodList > li.bg_area").hide();
			$("#payMethodList > li:nth-child(2)").show();
		});
		$("#payMethod_25").on("click", function() {
			$("#payMethodList > li").not("#payMethodList > li.bg_area").hide();
			$("#payMethodList > li:nth-child(8)").show();
		});
		$("#payMethod_26").on("click", function() {
			$("#payMethodList > li").not("#payMethodList > li.bg_area").hide();
			$("#payMethodList > li:nth-child(9)").show();
		});
		$("#payMethod_29").on("click", function() {
			$("#payMethodList > li").not("#payMethodList > li.bg_area").hide();
			$("#payMethodList > li:nth-child(10)").show();
		});
		$("#payMethod_22").on("click", function() {
			$("#payMethodList > li").not("#payMethodList > li.bg_area").hide();
			$("#payMethodList > li:nth-child(5)").show();
		});
		$("#payMethod_21").on("click", function() {
			$("#payMethodList > li").not("#payMethodList > li.bg_area").hide();
			$("#payMethodList > li:nth-child(4)").show();
		});
		$("#payMethod_24").on("click", function() {
			$("#payMethodList > li").not("#payMethodList > li.bg_area").hide();
			$("#payMethodList > li:nth-child(7)").show();
		});
		$("#payMethod_23").on("click", function() {
			$("#payMethodList > li").not("#payMethodList > li.bg_area").hide();
			$("#payMethodList > li:nth-child(6)").show();
		});
		
		// 상품이 로딩되고 최종 결제 정보에 업데이트하기
		let pur_price = $(".pur_price");
		let totalPrice = 0;
		for (var i = 0; i < pur_price.length; i++) {
			totalPrice += parseInt($(pur_price[i]).find("span").data("price"));
		}
		
		$("#orderForm > div.order_payment_box > div.right_area > ul > li:nth-child(1) > span.tx_cont > span")
			.text(totalPrice.toLocaleString());
		$("#totPayAmt_sum_span").text(totalPrice.toLocaleString());
		$("#totalPrice").val(totalPrice);
		$("#totalPay").val(totalPrice);
		
		
		// 팝업창
		let dimm = $("<div>").addClass("dimm");
		
		$("#orderForm > div.order_payment_box > div.left_area > table:nth-child(6) > tbody > tr:nth-child(1) > th > button")
		.on("click", function() {
			$("#OliveGiftInfo").show();
			$("body").append(dimm);
		});
	
		$("#OliveGiftInfo > div > button").on("click", function() {
			$("#OliveGiftInfo").hide();
			$(".dimm").remove();
		});
		
		$("#orderForm > div.order_payment_box > div.left_area > table:nth-child(6) > tbody > tr:nth-child(2) > th > button")
			.on("click", function() {
				$("#CJGiftInfo").show();
				$("body").append(dimm);
			});
		
		$("#CJGiftInfo > div > button").on("click", function() {
			$("#CJGiftInfo").hide();
			$(".dimm").remove();
		});
		
		// 포인트, 기프트카드 정리
		$("#oyGiftCard_btn").on("click", function() {
			alert("등록된 기프트 카드가 없습니다.");
		});
		
		$("#cjGiftCard_btn").on("click", function() {
			alert("등록된 기프트 카드가 없습니다.");
		});
		
		$("#cjonePnt_btn").on("click", function() {
			if(${logOn.u_point} < 1000) {
				alert("CJONE포인트는 최소 1,000원 이상\n보유 시 사용 가능합니다.");
				return;
			}
			
			$("#cjonePntAplyAmt").val('${logOn.u_point}');
		});
		
		// 총 배송비 팝업창
		$("#orderForm > div.order_payment_box > div.right_area > ul > li.line_top2 > span.tx_tit > button").on("click", function() {
			$("#deliveryInfo").css({
				"transform" : "translate(0, -50%)"
				}).show();
			var scrolled = window.scrollY;
			var centeredDiv = document.getElementById('deliveryInfo');
			var windowHeight = window.innerHeight;

			// 스크롤에 따라 중앙에 위치하도록 설정
			centeredDiv.style.top = (windowHeight / 2 + scrolled) + 'px';
			
			$("body").append(dimm);
		});
		
		// 보유쿠폰 누를 시 가지고 있는 쿠폰을 보여줌
		$("#orderForm > div.order_payment_box > div.left_area > a").on("click", function() {
			$("#userCpPop").css({"transform" : "translate(0, -50%)", "margin-left" : "-290px"}).show();
			
			var scrolled = window.scrollY;
			var centeredDiv = document.getElementById('userCpPop');
			var windowHeight = window.innerHeight;

			// 스크롤에 따라 중앙에 위치하도록 설정
			centeredDiv.style.top = (windowHeight / 2 + scrolled) + 'px';
			
			$("body").append(dimm);
		});
		
		$("#userCpPop > div > button").on("click", function() {
			$("#userCpPop").hide();
			$(".dimm").remove();
		});
		
		
	})
</script>

<div id="Wrapper">
		
<div id="Container">
    <!-- #Contents -->
    <div id="Contents">

        <!-- title_box -->
        <div class="title_box">
            <h1>주문/결제</h1>
            <ul class="step_list">
                <li><span class="step_num tx_num">1</span> 장바구니</li>
                <li class="on"><span class="hide">현재단계</span><span class="step_num tx_num">2</span> 주문/결제</li><!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
                <li class="last"><span class="step_num tx_num">3 </span> 주문완료</li>
            </ul>
        </div>
        <form name="orderForm" id="orderForm" method="post" action="<%=contextPath%>/olive/giftForm.do">
            <input type="hidden" id="giftYn" name="giftYn" value="Y">
            <input type="hidden" id="quickYn" name="quickYn" value="N">
            <input type="hidden" id="presentYn" name="presentYn" value="Y">
            <input type="hidden" id="cd_price" name="cd_price" value="0">
            <input type="hidden" id="point_price" name="point_price" value="0">
            <input type="hidden" id="mc_id" name="mc_id" value="">
            
            <input type="hidden" id="click" name="click" value="${click}">
            <input type="hidden" id="quickInfoYn" name="quickInfoYn" value="N">
            <input type="hidden" id="ocbValidChk" name="ocbValidChk" value="N">
            
            <input type="hidden" id="o2oVisitTypeVal" name="o2oVisitTypeVal" value="4">
            
            <input type="hidden" id="presentO2oYn" name="presentO2oYn" value="N"> 
            <input type="hidden" id="possibleO2oYn" name="possibleO2oYn" value="Y"> 
            <input type="hidden" id="giftboxGbnCd" name="giftboxGbnCd" value="10">
            <input type="hidden" id="dlvShpChgCd" name="dlvShpChgCd" value="10">
            <!-- init 이전 여부 -->
            <input type="hidden" id="beforeInitYn" name="beforeInitYn" value="N">
            <!-- 주문자 정보 -->
                    <h2 class="sub-title2 mgT20">보내는 사람</h2>

            <table class="tbl_inp_form">
                <caption></caption>
                <colgroup>
                    <col style="width:170px">
                    <col style="width:*">
                </colgroup>
                <tbody>
                <tr>
                            <th scope="row"><label for="ordManNm">발송인명</label></th>
                            <td><input type="text" id="ordManNm" name="ordManNm" value="${logOn.u_name }" class="inpH28" title="발송인명을 입력해주세요." style="width:200px" data-attr="주문자정보^1_주문자명"></td><!-- id와 label for를 맞춰주세요 (임시로 넣어둠) -->
                </tr>
                <tr>

                            <th scope="row"><label for="ordManCellTxnoNo">연락처</label></th>

                    <td>
                        <select id="ordManCellSctNo" name="ordManCellSctNo" class="selH28" title="이동통신번호를 선택해주세요." style="width:90px" data-attr="주문자정보^1_휴대폰">
                            <option value="" selected="selected">선택</option>
                            
                                <option value="010" >010</option>
                            
                                <option value="011">011</option>
                            
                                <option value="016">016</option>
                            
                                <option value="017">017</option>
                            
                                <option value="018">018</option>
                            
                                <option value="019">019</option>
                            
                                <option value="02">02</option>
                            
                                <option value="031">031</option>
                            
                                <option value="032">032</option>
                            
                                <option value="033">033</option>
                            
                                <option value="041">041</option>
                            
                                <option value="042">042</option>
                            
                                <option value="043">043</option>
                            
                                <option value="044">044</option>
                            
                                <option value="051">051</option>
                            
                                <option value="052">052</option>
                            
                                <option value="053">053</option>
                            
                                <option value="054">054</option>
                            
                                <option value="055">055</option>
                            
                                <option value="061">061</option>
                            
                                <option value="062">062</option>
                            
                                <option value="063">063</option>
                            
                                <option value="064">064</option>
                            
                                <option value="070">070</option>
                            
                                <option value="080">080</option>
                            
                                <option value="0130">0130</option>
                            
                                <option value="0303">0303</option>
                            
                                <option value="0502">0502</option>
                            
                                <option value="0503">0503</option>
                            
                                <option value="0504">0504</option>
                            
                                <option value="0505">0505</option>
                            
                                <option value="0506">0506</option>
                            
                                <option value="0507">0507</option>
                            
                        </select>
                        - <input type="text" id="ordManCellTxnoNo" name="ordManCellTxnoNo" value="" class="inpH28" title="휴대폰번호 두번째자리를 입력해주세요." style="width:90px" data-attr="주문자정보^1_휴대폰">
                        - <input type="text" id="ordManCellEndNo" name="ordManCellEndNo" value="" class="inpH28" title="휴대폰번호 마지막자리를 입력해주세요." style="width:90px" data-attr="주문자정보^1_휴대폰">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="ordManEmailAddrId">이메일</label></th>
                    <td>
                        
                        
                        <input type="hidden" id="ordManEmailAddr" name="ordManEmailAddr" value="zbqm1919@naver.com" title="이메일아이디를 입력해주세요.">
                        <input type="text" id="ordManEmailAddrId" value="" class="inpH28" title="이메일아이디를 입력해주세요." style="width:120px" data-attr="주문자정보^1_이메일">
                        @ <input type="text" id="ordManEmailAddrDmn" value="" class="inpH28" title="이메일도메인을 입력해주세요." style="width:120px" data-attr="주문자정보^1_이메일">
                        <select id="ordManEmailAddrDmn_select" class="selH28" title="이메일도메인을 선택해주세요." style="width:120px" data-attr="주문자정보^1_이메일">
                            <option value="" selected="selected">직접입력</option>
                            
                                <option value="hanmir.com">hanmir.com</option>
                            
                                <option value="naver.com" >naver.com</option>
                            
                                <option value="hanmail.net">hanmail.net</option>
                            
                                <option value="nate.com">nate.com</option>
                            
                                <option value="yahoo.co.kr">yahoo.co.kr</option>
                            
                                <option value="gmail.com">gmail.com</option>
                            
                                <option value="hotmail.com">hotmail.com</option>
                            
                                <option value="empal.com">empal.com</option>
                            
                                <option value="paran.com">paran.com</option>
                            
                                <option value="lycos.co.kr">lycos.co.kr</option>
                            
                                <option value="freechal.com">freechal.com</option>
                            
                                <option value="hanafos.com">hanafos.com</option>
                            
                                <option value="korea.com">korea.com</option>
                            
                                <option value="dreamwiz.com">dreamwiz.com</option>
                            
                        </select>
                    </td>
                </tr>
                </tbody>
            </table>
            <!--// 주문자 정보 -->


            <!-- 받는사람(선물하기) -->
            
                <h2 class="sub-title2">받는 사람</h2>
                <div class="gc-input-list-wrap" id="rcvMan">
                    <div class="gc-input-item">
                        <input class="name" type="text" id="rcvNm1" name="rcvNm" placeholder="이름" value="" data-attr="수령인정보^2_받는사람이름" maxlength="11">
                        <input type="hidden" id="rcvManNm" name="rcvManNm" value="">
                        <input class="phone-number" type="text" id="rcvPhone1" name="rcvPhone" placeholder="휴대폰번호" value="" data-attr="수령인정보^2_받는사람전화번호" maxlength="11">
                        <input type="hidden" id="rcvManCellSctNo" name="rcvManCellSctNo" value="">
                        <input type="hidden" id="rcvManCellTxnoNo" name="rcvManCellTxnoNo" value="">
                        <input type="hidden" id="rcvManCellEndNo" name="rcvManCellEndNo" value="">
                    </div>
                </div>
                <!-- 메시지 카드 Start -->
                <h2 class="sub-title2">메시지 카드</h2>
                <div class="messagecard-selector">

                    <div class="messagecard-category-slide">
                        <div class="swiper-wrapper">
                            
                                <button type="button" class="slide on" data-card-category="전체">전체</button>
                            
                                <button type="button" class="slide " data-card-category="축하">축하</button>
                            
                                <button type="button" class="slide " data-card-category="감사">감사</button>
                            
                                <button type="button" class="slide " data-card-category="응원">응원</button>
                            
                                <button type="button" class="slide " data-card-category="사랑">사랑</button>
                            
                                <button type="button" class="slide " data-card-category="건강">건강</button>
                            
                        </div>
                    </div>
                    <div class="gc-msg-list-wrap">
                        <a href="#" class="btn-slide prev slick-arrow is-visible" style="display: block;"><span>이전</span></a>
                        <a href="#" class="btn-slide next slick-arrow is-visible" style="display: block;"><span>다음</span></a>
                        <div class="gc-thumb-list slick-initialized slick-slider" style="opacity: 1;">
                            
                                
                                    <div aria-live="polite" class="slick-list draggable"><div class="slick-track" role="listbox" style="opacity: 1; width: 7800px; transform: translate3d(-5980px, 0px, 0px);"><div class="slide slick-slide slick-cloned" data-category-name="사랑" data-slick-index="-8" aria-hidden="true" style="width: 130px;" tabindex="-1">
                                        
                                        <span class="is-active">
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5825797819616551753.png" alt="11" data-disp-conts-no="2/1" data-attr="메시지카드^3_메시지카드선택_11" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_11');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="사랑" data-slick-index="-7" aria-hidden="true" style="width: 130px;" tabindex="-1">

											<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/3770270078395321790.png" alt="12" data-disp-conts-no="2/2" data-attr="메시지카드^3_메시지카드선택_12" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_12');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="사랑" data-slick-index="-6" aria-hidden="true" style="width: 130px;" tabindex="-1">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8980497778093106965.png" alt="13" data-disp-conts-no="2/3" data-attr="메시지카드^3_메시지카드선택_13" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_13');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="사랑" data-slick-index="-5" aria-hidden="true" style="width: 130px;" tabindex="-1">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/6559251653685028913.png" alt="14" data-disp-conts-no="2/4" data-attr="메시지카드^3_메시지카드선택_14" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_14');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="건강" data-slick-index="-4" aria-hidden="true" style="width: 130px;" tabindex="-1">
                                        
                                        <span class="is-active">
										
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2858088133688058103.png" alt="15" data-disp-conts-no="3/1" data-attr="메시지카드^3_메시지카드선택_15" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_15');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="건강" data-slick-index="-3" aria-hidden="true" style="width: 130px;" tabindex="-1">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8318016457649213641.png" alt="16" data-disp-conts-no="3/2" data-attr="메시지카드^3_메시지카드선택_16" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_16');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="건강" data-slick-index="-2" aria-hidden="true" style="width: 130px;" tabindex="-1">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8437918951936068200.png" alt="17" data-disp-conts-no="3/3" data-attr="메시지카드^3_메시지카드선택_17" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_17');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="건강" data-slick-index="-1" aria-hidden="true" style="width: 130px;" tabindex="-1">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4137275009008154234.png" alt="18" data-disp-conts-no="3/4" data-attr="메시지카드^3_메시지카드선택_18" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_18');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="0" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide00">
                                        
                                        <span class="is-active">
										
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8628496970352617368.png" alt="2" data-disp-conts-no="7/4" data-attr="메시지카드^3_메시지카드선택_2" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_2');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="1" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide01">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2578366984434068147.png" alt="4" data-disp-conts-no="7/2" data-attr="메시지카드^3_메시지카드선택_4" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_4');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="2" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide02">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2601140381744572628.png" alt="6" data-disp-conts-no="7/6" data-attr="메시지카드^3_메시지카드선택_6" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_6');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="3" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide03">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8418623798545217819.png" alt="7" data-disp-conts-no="7/7" data-attr="메시지카드^3_메시지카드선택_7" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_7');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="4" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide04">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/177143882306003645.png" alt="8" data-disp-conts-no="7/8" data-attr="메시지카드^3_메시지카드선택_8" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_8');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="5" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide05">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5470953899659231366.png" alt="9" data-disp-conts-no="7/9" data-attr="메시지카드^3_메시지카드선택_9" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_9');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="6" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide06">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2762493121610279283.png" alt="10" data-disp-conts-no="7/10" data-attr="메시지카드^3_메시지카드선택_10" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_10');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="7" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide07">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/7240862188553692284.png" alt="11" data-disp-conts-no="7/11" data-attr="메시지카드^3_메시지카드선택_11" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_11');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="8" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide08">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/6485547635519394841.png" alt="12" data-disp-conts-no="7/12" data-attr="메시지카드^3_메시지카드선택_12" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_12');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="9" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide09">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5186308448963283435.png" alt="13" data-disp-conts-no="7/13" data-attr="메시지카드^3_메시지카드선택_13" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_13');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="10" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide010">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/3237912432394164030.png" alt="14" data-disp-conts-no="7/14" data-attr="메시지카드^3_메시지카드선택_14" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_14');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="11" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide011">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/6096863507933820015.png" alt="15" data-disp-conts-no="7/15" data-attr="메시지카드^3_메시지카드선택_15" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_15');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="12" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide012">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/7621675421721967451.png" alt="16" data-disp-conts-no="7/16" data-attr="메시지카드^3_메시지카드선택_16" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_16');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="13" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide013">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/975449772915201095.png" alt="17" data-disp-conts-no="7/17" data-attr="메시지카드^3_메시지카드선택_17" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_17');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="14" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide014">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8014643217273842392.png" alt="18" data-disp-conts-no="7/18" data-attr="메시지카드^3_메시지카드선택_18" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_18');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="15" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide015">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/1344260312164936123.png" alt="20" data-disp-conts-no="7/26" data-attr="메시지카드^3_메시지카드선택_20" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_20');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="16" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide016">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/1369757321109892475.png" alt="20" data-disp-conts-no="7/20" data-attr="메시지카드^3_메시지카드선택_20" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_20');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="17" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide017">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2297103757812011063.png" alt="21" data-disp-conts-no="7/27" data-attr="메시지카드^3_메시지카드선택_21" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_21');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="18" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide018">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2583223796425432317.png" alt="21" data-disp-conts-no="7/21" data-attr="메시지카드^3_메시지카드선택_21" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_21');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="19" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide019">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/1982587899079238911.png" alt="22" data-disp-conts-no="7/28" data-attr="메시지카드^3_메시지카드선택_22" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_22');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="20" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide020">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4243935686390840148.png" alt="22" data-disp-conts-no="7/22" data-attr="메시지카드^3_메시지카드선택_22" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_22');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="전체" data-slick-index="21" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide021">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/7213600776184854595.png" alt="23" data-disp-conts-no="7/23" data-attr="메시지카드^3_메시지카드선택_23" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_23');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="축하" data-slick-index="22" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide022">
                                        
                                        <span class="is-active">
										
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4221794774826023274.png" alt="2" data-disp-conts-no="6/2" data-attr="메시지카드^3_메시지카드선택_2" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_2');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="축하" data-slick-index="23" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide023">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4804553594358800384.png" alt="4" data-disp-conts-no="6/4" data-attr="메시지카드^3_메시지카드선택_4" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_4');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="축하" data-slick-index="24" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide024">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8922026770523025781.png" alt="6" data-disp-conts-no="6/6" data-attr="메시지카드^3_메시지카드선택_6" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_6');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="감사" data-slick-index="25" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide025">
                                        
                                        <span class="is-active">
										
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8308631600957607160.png" alt="20" data-disp-conts-no="5/2" data-attr="메시지카드^3_메시지카드선택_20" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_20');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="감사" data-slick-index="26" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide026">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4134669692324445628.png" alt="21" data-disp-conts-no="5/3" data-attr="메시지카드^3_메시지카드선택_21" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_21');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="감사" data-slick-index="27" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide027">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4600444016846568081.png" alt="22" data-disp-conts-no="5/4" data-attr="메시지카드^3_메시지카드선택_22" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_22');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="감사" data-slick-index="28" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide028">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5923619688089496591.png" alt="23" data-disp-conts-no="5/6" data-attr="메시지카드^3_메시지카드선택_23" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_23');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="응원" data-slick-index="29" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide029">
                                        
                                        <span class="is-active">
										
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4694003955895030602.png" alt="19" data-disp-conts-no="4/5" data-attr="메시지카드^3_메시지카드선택_19" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_19');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="응원" data-slick-index="30" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide030">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/3168250975742998808.png" alt="20" data-disp-conts-no="4/6" data-attr="메시지카드^3_메시지카드선택_20" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_20');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="응원" data-slick-index="31" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide031">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8345588135095682367.png" alt="21" data-disp-conts-no="4/7" data-attr="메시지카드^3_메시지카드선택_21" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_21');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="응원" data-slick-index="32" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide032">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4401816034500452652.png" alt="22" data-disp-conts-no="4/8" data-attr="메시지카드^3_메시지카드선택_22" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_22');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="응원" data-slick-index="33" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide033">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/3593456260359121770.png" alt="7" data-disp-conts-no="4/1" data-attr="메시지카드^3_메시지카드선택_7" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_7');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="응원" data-slick-index="34" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide034">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5205616872234988872.png" alt="9" data-disp-conts-no="4/3" data-attr="메시지카드^3_메시지카드선택_9" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_9');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="응원" data-slick-index="35" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide035">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5382162151097645680.png" alt="10" data-disp-conts-no="4/4" data-attr="메시지카드^3_메시지카드선택_10" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_10');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="사랑" data-slick-index="36" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide036">
                                        
                                        <span class="is-active">
										
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5825797819616551753.png" alt="11" data-disp-conts-no="2/1" data-attr="메시지카드^3_메시지카드선택_11" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_11');"></a>
										</span>
                                    </div><div class="slide slick-slide" data-category-name="사랑" data-slick-index="37" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide037">
                                        
										
											<span>
										

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/3770270078395321790.png" alt="12" data-disp-conts-no="2/2" data-attr="메시지카드^3_메시지카드선택_12" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_12');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-current slick-active" data-category-name="사랑" data-slick-index="38" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide038">
                                        
										
											<span>
										

										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8980497778093106965.png" alt="13" data-disp-conts-no="2/3" data-attr="메시지카드^3_메시지카드선택_13" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_13');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-active" data-category-name="사랑" data-slick-index="39" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide039">
                                        
										
											<span>
										

										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/6559251653685028913.png" alt="14" data-disp-conts-no="2/4" data-attr="메시지카드^3_메시지카드선택_14" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_14');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-active" data-category-name="건강" data-slick-index="40" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide040">
                                        
                                        <span class="is-active">
										
										

										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2858088133688058103.png" alt="15" data-disp-conts-no="3/1" data-attr="메시지카드^3_메시지카드선택_15" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_15');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-active" data-category-name="건강" data-slick-index="41" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide041">
                                        
										
											<span>
										

										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8318016457649213641.png" alt="16" data-disp-conts-no="3/2" data-attr="메시지카드^3_메시지카드선택_16" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_16');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-active" data-category-name="건강" data-slick-index="42" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide042">
                                        
										
											<span>
										

										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8437918951936068200.png" alt="17" data-disp-conts-no="3/3" data-attr="메시지카드^3_메시지카드선택_17" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_17');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-active" data-category-name="건강" data-slick-index="43" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide043">
                                        
										
											<span>
										

										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4137275009008154234.png" alt="18" data-disp-conts-no="3/4" data-attr="메시지카드^3_메시지카드선택_18" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_18');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned slick-active" data-category-name="전체" data-slick-index="44" aria-hidden="false" style="width: 130px;" tabindex="-1">
                                        
                                        <span class="is-active">
										
										

										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8628496970352617368.png" alt="2" data-disp-conts-no="7/4" data-attr="메시지카드^3_메시지카드선택_2" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_2');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned slick-active" data-category-name="전체" data-slick-index="45" aria-hidden="false" style="width: 130px;" tabindex="-1">

											<span>

										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2578366984434068147.png" alt="4" data-disp-conts-no="7/2" data-attr="메시지카드^3_메시지카드선택_4" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_4');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="46" aria-hidden="true" style="width: 130px;" tabindex="-1">

											<span>

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2601140381744572628.png" alt="6" data-disp-conts-no="7/6" data-attr="메시지카드^3_메시지카드선택_6" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_6');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="47" aria-hidden="true" style="width: 130px;" tabindex="-1">
                                        
											<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8418623798545217819.png" alt="7" data-disp-conts-no="7/7" data-attr="메시지카드^3_메시지카드선택_7" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_7');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="48" aria-hidden="true" style="width: 130px;" tabindex="-1">
                                        
											<span>

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/177143882306003645.png" alt="8" data-disp-conts-no="7/8" data-attr="메시지카드^3_메시지카드선택_8" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_8');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="49" aria-hidden="true" style="width: 130px;" tabindex="-1">
											<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5470953899659231366.png" alt="9" data-disp-conts-no="7/9" data-attr="메시지카드^3_메시지카드선택_9" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_9');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="50" aria-hidden="true" style="width: 130px;" tabindex="-1">

											<span>

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2762493121610279283.png" alt="10" data-disp-conts-no="7/10" data-attr="메시지카드^3_메시지카드선택_10" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_10');"></a>
										</span>
                                    </div><div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="51" aria-hidden="true" style="width: 130px;" tabindex="-1">

											<span>

										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/7240862188553692284.png" alt="11" data-disp-conts-no="7/11" data-attr="메시지카드^3_메시지카드선택_11" onclick="orderGiftCardFormEventTaging('메시지카드^3_메시지카드선택_11');"></a>
										</span>
                                    </div></div></div> 
                        </div>
                        <div class="gc-select-msg">
                            <input type="hidden" id="dispContsNo" name="dispContsNo" value="7/4">
                            <span class="img"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8628496970352617368.png" alt="2" data-disp-conts-no="7/4"></span>
                            <div class="card-textarea">
                                <textarea cols="30" rows="5" id="presentMsg" name="presentMsg" placeholder="메시지를 입력해주세요. (선택)" data-attr="메시지카드^3_메시지카드입력"></textarea>

                                <div class="count">
                                    <span id="presentMsgCnt">0</span> <span>/</span> <span class="total">100자</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- 메시지 카드 End// -->

            <!-- 주문상품정보 -->
            <!-- <h2 class="sub-title2 underline">주문상품정보</h2> --><!-- 2017-01-24 수정 : 해당 타이틀 삭제 -->
                        <h2 class="sub-title2">
                                올리브영 배송상품
                            
                            
                                <em class="gift" id="giftNoti2" style="display: none;">* 증정품은 결제 시 확인하실 수 있습니다.</em>
                            
                        </h2><!-- 2017-01-24 수정 : 타이틀 마크업 수정 및 클래스명 변경 -->
                        <table class="tbl_prd_list">
                        <caption>올리브영 배송상품 주문상품 목록</caption>
                        <colgroup>
                            <col style="width:*">
                            <!-- 2019-11-15 추가 (오늘드림배송 선물포장) Start -->
                            
                            <!-- 2019-11-15 추가 (오늘드림배송 선물포장) End -->
                            <col style="width:110px">
                            <col style="width:100px">
                            <!--
                            2017-01-24 수정 : 삭제
                            <col style="width:120px" />
                            -->
                            <col style="width:110px">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">상품정보</th>
                            <!-- 2019-11-15 추가 (오늘드림배송 선물포장) Start -->
                            
                            <!-- 2019-11-15 추가 (오늘드림배송 선물포장) End -->
                            <th scope="col">판매가</th>
                            <th scope="col">수량</th>
                            <!--
                            2017-01-24 수정 : 배송정보 삭제
                            <th scope="col">배송정보</th>
                            -->
                            <th scope="col">구매가</th><!-- 2017-01-24 수정 : 문구수정 -->
                        </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${productList }" var="list">
								<tr>
									<td colspan="5" itemno="001" entrno="C19275" brndcd="3440" tradeshpcd="1" staffdscntyn="Y" pntrsrvyn="Y" ordqty="1" thnlpathnm="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0018/A00000018412902ko.jpg?l=ko"  purchasetype="N"><!-- 2017-01-13 수정 -->
										<input type="hidden" name="pr_cnt" value="${list.proId }-${list.cnt}">
										<input type="hidden" name="pro_id" value="${list.proId }">
										<div class="tbl_cont_area">
												<div class="tbl_cell w700"><!-- 2017-01-24 수정 : 클래스명 변경 -->
													<div class="prd_info">
														<div class="prd_img">
															<img src="${list.proImg }" alt="장바구니 상품 임시 이미지" onerror="common.errorImg(this);">
														</div>
														<div class="prd_name">
															
															<span>${list.brandName }</span><!-- 2017-01-26 수정 : 브랜드명 분리 -->
															<p>${list.proName }</p>
														</div>
														<p class="prd_opt">											
															<i class="tit">옵션</i>${list.displName }											
														</p>
														<p class="prd_flag">
															<c:if test="${list.prd eq 1}">
																<span class="icon_flag sale">세일</span>
															</c:if>
															<c:if test="${list.prc eq 1}">
																<span class="icon_flag coupon">쿠폰</span>
															</c:if>
															<!-- 기간계 상품, 브랜드 증정품만 아이콘 노출 -->
															<c:if test="${list.prp eq 1}">
																<span class="icon_flag gift" id="free_gift">증정</span>
															</c:if>
															<c:if test="${list.stock eq 1}">
																<span class="icon_flag delivery" id="quick_yn">오늘드림</span>
															</c:if>		
														</p>
														<!--//fix/3275248 bmiy20 cjone point 적립불가건에 대해 사용 불가 처리 추가-->
													</div>
												</div>
												<!-- 2019-11-15 추가 (오늘드림배송 선물포장) Start -->
												
												<!-- 2019-11-15 추가 (오늘드림배송 선물포장) End -->
												<div class="tbl_cell w110">
													<span class="cur_price"><span class="tx_num"><fmt:formatNumber value="${list.proPrice }" pattern="#,##0" /></span>원</span>
												</div>
												<div class="tbl_cell w100">${list.cnt }</div>
												<div class="tbl_cell w110">
													<span class="org_price"><span class="tx_num" id="normPrc_A000000184129/001"><fmt:formatNumber value="${list.proPrice*list.cnt }" pattern="#,##0" /></span>원</span><!-- 2017-01-24 수정 : 추가 -->
													<span class="pur_price"><span class="tx_num" id="salePrc_A000000184129/001" data-price="${list.pafterPrice*list.cnt }"><fmt:formatNumber value="${list.pafterPrice*list.cnt }" pattern="#,##0" /></span>원</span>
													<input type="hidden" id="orgNormPrc_A000000184129/001" value="31000">
													<input type="hidden" id="orgSalePrc_A000000184129/001" value="23200">
													<input type="hidden" id="imdtDscntAmt_A000000184129/001" value="0">
												</div>
											</div>
										</td>
									</tr>
							</c:forEach>
                        </tbody>
                        </table>
            <!--// 주문상품정보 -->
            
            <!-- 증정품 -->

            <input type="hidden" id="giftCount" value="0" orgvalue="0">
            <div id="giftCartNo"></div>
            <!--// 증정품 -->
            
            <!-- 쿠폰 및 포인트, 결제수단, 결제정보 -->
            <div class="order_payment_box">
                <div class="left_area">
                    <!-- 쿠폰할인정보 -->
                    <h2 class="sub-title2 width-inline">쿠폰할인정보</h2>
                    <a href="javascript:;" data-rel="layer" data-target="userCpPop" class="couponView" data-attr="쿠폰할인정보^보유쿠폰">
                        
                    </a>
                    <table class="tbl_inp_form type2">
                        <caption>쿠폰할인정보 입력 폼</caption>
                        <colgroup>
                            <col style="width:170px">
                            <col style="width:*">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td colspan="2">
                                <div class="bg_area"><!-- 2017-01-18 수정 : 클래스 추가 -->
                                    <input type="radio" id="autoDiscount" name="Discount_Benefits" value="auto" checked="checked" data-attr="쿠폰할인정보^혜택받기"><label for="autoDiscount">최대 할인 추천받기</label>
                                    <input type="radio" id="manualDiscount" name="Discount_Benefits" value="manual" class="mgL20" data-attr="쿠폰할인정보^혜택받기"><label for="manualDiscount">혜택 직접 선택하기</label>
                                    <p class="tx_right tx_discount"><span class="tx_num" id="totCpnAplyAmt">0</span>원</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">상품별 할인</th>
                            <td id="dwnldCouponList">
                                        <div>
                                            <select class="selH28 mgT5" style="width:300px" disabled="disabled" data-attr="쿠폰할인정보^상품별할인">
                                                <option>적용할 수 있는 쿠폰이 없습니다.</option>
                                            </select>
                                            <p class="tx_point_info">즉시할인쿠폰은 상품금액에 자동적용 되어있습니다.</p>
                                        </div>

                                <!--// 상품별 할인목록 영역 -->
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">주문별 할인</th>
                            <td id="paymentCouponList">
                                <!-- 주문별 할인목록 영역 -->

                                        <div>
                                            <select class="selH28" style="width:300px" disabled="disabled" data-attr="쿠폰할인정보^주문별할인">
                                                <option>적용할 수 있는 쿠폰이 없습니다.</option>
                                            </select>
                                        </div>
                                    
                                
                                <!--// 주문별 할인목록 영역 -->
                            </td>
                        </tr>
                        <!-- 2017-01-18 수정 : 배송비 할인 영역 변경 -->
                        
                            <tr>
                                <th scope="row">배송비 쿠폰</th>
                                <td id="dlexCouponList_hd">
                                    <div>
                                                <select id="selDelCoupon" class="selH28 mgT5" style="width:300px" disabled="disabled" data-attr="쿠폰할인정보^배송비쿠폰">
                                                    <option>적용할 수 있는 쿠폰이 없습니다.</option>
                                                </select>

                                    </div>
                                </td>
                            </tr>

                        <!--// 2017-01-18 수정 : 배송비 할인 영역 변경 -->
                        </tbody>
                    </table>
                    <input type="hidden" id="couponCnt" value="1">
                    <!--// 쿠폰할인정보 -->

                    <!-- 포인트사용 --><!-- 2017-01-18 수정 : 전액사용 버튼이 input 뒤로 위치 변경됨 -->
                    <h2 class="sub-title2">포인트/기프트카드사용</h2>
                    <table class="tbl_inp_form type2">
                        <caption>포인트사용 입력 폼</caption>
                        <colgroup>
                            <col style="width:170px">
                            <col style="width:*">
                        </colgroup>
                        <input type="hidden" id="lastAplyPntInputName" value="">
                        <tbody>
                        
                        <tr>
                            <th scope="row"><button type="button" class="btnGift btnGiftClick" data-rel="layer" data-target="OliveGiftInfo">올리브영 기프트카드</button></th>
                            <td>
                                <div>
									<span class="inp_point_wrap">
										<input type="text" id="oyGiftCardAplyAmt" name="" class="inpH28 giftCard" title="사용하실 올리브영 기프트카드를 입력해주세요." style="width:100px" this="올리브영 기프트카드는 " minownamt="10" unit="원" unitamt="1" minaplyamt="10" disabled="disabled"> 원 / <span id="oyGiftCardOwn_span" class="tx_num colorOrange"><span id="oyGiftCardAmt">0</span>원</span>
										<input type="hidden" name="oyGiftCardAplyAmt" value="0">
									</span>
                                    <button type="button" class="btnSmall wGray2" name="giftCard_btn" id="oyGiftCard_btn" data-attr="포인트/기프트카드사용^올리브영기프트카드"><span data-attr="포인트/기프트카드사용^올리브영기프트카드">조회</span></button>
                                    <p class="tx_point_info">올리브영 기프트카드는 최소 10원 이상 보유 시 1원 단위로 사용 가능합니다.</p> <!-- //2021-09-16 문구수정// -->
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><button type="button" class="btnGift btnGiftClick" data-rel="layer" data-target="CJGiftInfo"><span class="tx_num">CJ</span> 기프트카드</button></th>
                            <td>
                                <div>
									<span class="inp_point_wrap">
										<input type="text" id="cjGiftCardAplyAmt" class="inpH28 giftCard" title="사용하실 CJ 기프트카드를 입력해주세요." style="width:100px" this="CJ 기프트카드는 " minownamt="10" unit="원" unitamt="1" minaplyamt="10" disabled="disabled"> 원 / <span id="cjGiftCardAmt_span" class="tx_num colorOrange"><span id="cjGiftCardAmt">0</span>원</span>
										<input type="hidden" name="cjGiftCardAplyAmt" value="0">
									</span>
                                    <button type="button" class="btnSmall wGray2" name="giftCard_btn" id="cjGiftCard_btn" data-attr="포인트/기프트카드사용^CJ기프트카드"><span data-attr="포인트/기프트카드사용^CJ기프트카드">조회</span></button>
                                    <p class="tx_point_info">CJ기프트카드는 최소 10원 이상 보유 시 1원 단위로 사용 가능합니다.</p> <!-- //2021-09-16 문구수정// -->
                                </div>
                            </td>
                        </tr>
                        <!--// 2018-01-05 기프트카드 추가 -->
                        <tr>
                            <th scope="row"><span class="tx_num">CJ ONE</span> 포인트</th>
                            <td>
                                <div>
									<span class="inp_point_wrap">
										<!-- fix/3275248 bmiy20 cjone point 적립불가건에 대해 사용 불가 처리 추가 -->
										<input type="text" id="cjonePntAplyAmt" class="inpH28 cjonePoint" title="사용하실 CJ ONE 포인트를 입력해주세요." style="width:100px" this="CJ ONE 포인트는 " minownamt="1000" unit="P" unitamt="10" minaplyamt="0" disabled="" data-attr="포인트/기프트카드사용^CJONE포인트"> 원 / <span id="cjonePnt_span" class="tx_num colorOrange"><span id="cjonePnt">0</span>P</span>
										<input type="hidden" name="cjonePntAplyAmt" value="0">
										<input type="hidden" name="cjonePntNonPosCnt" value="0">   <!--//cjone point 사용가능 금액 bmiy20, 2021-09-16 문구수정// -->
									</span>
                                    <button type="button" class="btnSmall wGray3" id="cjonePnt_btn" data-attr="포인트/기프트카드사용^CJONE포인트"><span data-attr="포인트/기프트카드사용^CJONE포인트">전액사용</span></button>
                                    <p class="tx_point_info">CJONE 포인트는 최소 1,000원 이상 보유 시 10원 단위로 사용 가능합니다. </p><!-- //2021-09-16 문구수정// -->
                                    
                                    
                                </div>
                            </td>
                        </tr>
                        <input type="hidden" id="vMbrStaffYn" value="N">
                        
                        <tr>
                            <th scope="row">예치금</th>
                            <td>
                                <div>
									<span class="inp_point_wrap">
										<input type="text" id="csmnAplyAmt" class="inpH28" title="사용하실 예치금을 입력해주세요." style="width:100px" this="예치금은 " minownamt="1000" unit="원" unitamt="10" minaplyamt="0" disabled="" data-attr="포인트/기프트카드사용^예치금"> 원 / <span class="tx_num colorOrange"><span id="csmnOwnAmt">0</span>원</span>
										<input type="hidden" name="csmnAplyAmt" value="0">
										<input type="hidden" name="csmnUseYn" value="N">
									</span>
                                    <button type="button" class="btnSmall wGray3" id="csmnAplyAmt_btn" data-attr="포인트/기프트카드사용^예치금"><span data-attr="포인트/기프트카드사용^예치금">전액사용</span></button>
                                    <p class="tx_point_info">예치금은 최소 1,000원 이상 보유 시 10원 단위로 사용 가능합니다.</p><!-- //2021-09-16 문구수정// -->
                                </div>
                            </td>
                        </tr>
                        
                        <!-- OK 캐쉬백 -->
                        
                        
                        <!-- //OK 캐쉬백 -->
                        

                        <!-- 오늘드림정보  -->
                        </tbody>
                    </table>
                    <!--// 포인트사용 -->

                    <!-- 결제수단 선택 -->

                    <div class="title_wrap" id="payMethod_div">
                        <h2 class="sub-title2">결제수단 선택</h2>
                        <p class="sub_area" style="display: none;">
                            
                        </p>
                    </div>
                    <ul class="payment_info_form" id="payMethodList">
                        <li class="bg_area"><!-- 2017-01-18 수정 : 클래스 추가 -->
                            <input type="hidden" id="payCouponIndex" value="" paycd="">
                            <input type="hidden" id="easyPayCd" value="">
                            <span><input type="radio" id="payMethod_11" name="payMethod" value="11" cashreceipt="N" checked="checked" data-attr="결제수단선택^결제수단선택"><label id="payMethodLabel_11" for="payMethod_11">신용카드</label></span>

                            <!-- 2017-04-18 추가 -->
                            <span><input type="radio" id="payMethod_25" name="payMethod" value="25" cashreceipt="N" data-attr="결제수단선택^결제수단선택"><label id="payMethodLabel_25" for="payMethod_25">PAYCO<span class="flag bn">혜택</span></label></span>
                            <!-- //2017-04-18 추가 -->
                            <span><input type="radio" id="payMethod_26" name="payMethod" value="26" cashreceipt="N" data-attr="결제수단선택^결제수단선택"><label id="payMethodLabel_26" for="payMethod_26">카카오페이</label></span>
                            <!-- 20201021 배포에선 네이버페이 노출 제외 -->
                            <span><input type="radio" id="payMethod_29" name="payMethod" value="29" cashreceipt="N" data-attr="결제수단선택^결제수단선택"><label id="payMethodLabel_29" for="payMethod_29">네이버페이<span class="flag bn">혜택</span></label></span>

                            <span><input type="radio" id="payMethod_22" name="payMethod" value="22" cashreceipt="N" data-attr="결제수단선택^결제수단선택"><label id="payMethodLabel_22" for="payMethod_22">휴대폰결제</label></span>

                            <span><input type="radio" id="payMethod_21" name="payMethod" value="21" cashreceipt="Y" data-attr="결제수단선택^결제수단선택"><label id="payMethodLabel_21" for="payMethod_21">계좌이체</label></span>

                            <!-- 2017-01-18 수정 : 문화상품권/도서상품권 선택 삭제 -->
                            <!-- 2017-02-14 수정 : 문화상품권/도서상품권 선택 재추가 -->
                            <span><input type="radio" id="payMethod_24" name="payMethod" value="24" cashreceipt="Y" data-attr="결제수단선택^결제수단선택"><label id="payMethodLabel_24" for="payMethod_24">도서상품권</label></span>
                            <span><input type="radio" id="payMethod_23" name="payMethod" value="23" cashreceipt="N" data-attr="결제수단선택^결제수단선택"><label id="payMethodLabel_23" for="payMethod_23">문화상품권</label></span>
                        </li>
                        <!-- 신용카드 선택 시 -->
                        <li paymethod="11" style="display: list-item;">
                            <table class="tbl_inp_form no_line">
                                <caption>카드 결제정보 입력 폼</caption>
                                <colgroup>
                                    <col style="width:170px">
                                    <col style="width:*">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">카드종류</th>
                                    <td>
                                        <div id="cardDscnt_div">
                                            <input type="hidden" id="cardCouponIndex" value="" acqrcd="" orgacqrcd="">
                                            <select id="acqrCd" name="acqrCd" class="selH28" title="결제하실 카드를 선택해주세요." style="width:200px" data-attr="결제수단선택^카드정보선택">
                                                <option value="">카드를 선택해주세요.</option>
                                                
                                                    <option value="BCC">BC카드</option>
                                                
                                                    <option value="HNB">하나(외환)카드</option>
                                                
                                                    <option value="PHB">우리카드</option>
                                                
                                                    <option value="SYH">신협카드</option>
                                                
                                                    <option value="NFF">수협카드</option>
                                                
                                                    <option value="CBB">전북카드</option>
                                                
                                                    <option value="CIT">씨티카드</option>
                                                
                                                    <option value="WIN">삼성카드</option>
                                                
                                                    <option value="LGC">신한카드</option>
                                                
                                                    <option value="KKB">카카오뱅크</option>
                                                
                                                    <option value="KJB">광주비자</option>
                                                
                                                    <option value="CJB">제주카드</option>
                                                
                                                    <option value="DIN">현대카드</option>
                                                
                                                    <option value="AMX">롯데카드</option>
                                                
                                                    <option value="CNB">KB카드</option>
                                                
                                                    <option value="NLC">NH카드</option>
                                                
                                            </select>
                                            
                                        </div>
                                        <div id="cardcoPnt_div">
                                            
                                                
                                                    <p class="tx_info" acqrcd="DIN" pntusestdamt="5000" pntnm="현대카드 M 포인트" salepointflg="S" staffyn="N" style="display: none;">
                                                        <span class="mhy_card">현대카드 M포인트 10% 사용 가능(1만원 이상 결제시 최대 5천 포인트)</span>
                                                    </p>
                                                    <div id="DIN_pntInfoMsg" style="display: none;">
                                                            사용조건
<ol>
	<li>1만원 이상 결제시 사용 가능</li>
	<li>결제금액의 10% 사용 가능</li>
	<li><strong>법인/체크/선불/기프트/CJ임직원/CJ제휴카드 제외</strong></li>
	<li>결제 건당 5,000 M포인트 한도</li>
	<li>10%에 대한 M포인트 부족 시 보유 포인트만큼 차감</li>
	<li>페이코/카카오페이/네이버페이 등 간편결제수단 적용시 사용 불가</li>
</ol>

                                                    </div>
                                                
                                                    <p class="tx_info" acqrcd="WIN" pntusestdamt="0" pntnm="" salepointflg="S" staffyn="N" style="display: none;">
                                                        <span class="mhy_card">삼성카드 보너스포인트 100% 사용 가능</span>
                                                    </p>
                                                    <div id="WIN_pntInfoMsg" style="display: none;">
                                                            <p>사용조건</p>

<ol>
	<li>1원 이상 결제시 사용 가능</li>
	<li>결제금액의 전액 사용 가능</li>
	<li><strong>법인, 체크, 올앳, 선불, 기프트, CJ임직원, CJ제휴카드 제외</strong></li>
	<li>포인트 부족시 보유 포인트만큼 차감</li>
	<li>포인트 부족분 신용카드 결제</li>
	<li>포인트 분할 결제 및 결제 포인트 입력 불가</li>
	<li>페이코/카카오페이/네이버페이 등 간편결제수단&nbsp;적용 불가</li>
</ol>

<p>포인트 결제 후 부분취소 및 사용 포인트 조회 문의</p>

<ol>
	<li>포인트 환불정책 및 사용 포인트 조회는 삼성카드 고객센터로 문의 부탁 드립니다.</li>
	<li>삼성카드 고객센터 : 1588-8700</li>
</ol>

                                                    </div>
                                                
                                            
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">할부종류</th>
                                    <td>
                                        <div>
                                            <select id="instMmCnt" name="instMmCnt" class="selH28" style="width:200px" data-attr="결제수단선택^할부종류" disabled="">
                                                <option value="일시불">일시불</option>
                                                <option value="2" targetid="nint2MmYn">2개월</option>
                                                <option value="3" targetid="nint3MmYn">3개월</option>
                                                <option value="4" targetid="nint4MmYn">4개월</option>
                                                <option value="5" targetid="nint5MmYn">5개월</option>
                                                <option value="6" targetid="nint6MmYn">6개월</option>
                                                <option value="7" targetid="nint7MmYn">7개월</option>
                                                <option value="8" targetid="nint8MmYn">8개월</option>
                                                <option value="9" targetid="nint9MmYn">9개월</option>
                                                <option value="10" targetid="nint10MmYn">10개월</option>
                                                <option value="11" targetid="nint11MmYn">11개월</option>
                                                <option value="12" targetid="nint12MmYn">12개월</option>
                                            </select>
                                            
                                        </div>
                                    </td>
                                    <input type="hidden" name="aplyNintInstYn" value="N">
                                </tr>
                                <tr id="pntUseYn_tr" style="display:none;">
                                    <th scope="row">카드포인트</th>
                                    <td>
                                        <div>
                                            <input type="checkbox" id="pntUseYn" name="pntUseYn" value="Y"> <label for="pntUseYn" id="cardcoPntNm"></label>
                                            <button type="button" class="mh_btn" data-rel="layer" data-target="mHPointInfo">사용안내</button>
                                        </div>
                                    </td>
                                </tr>
                                <!-- 2017-01-18 추가 : 카드 결제 안내 추가 -->
                                <tr>
                                    <td colspan="2">
                                        <div class="info_dot_list_area">
                                            
                                            <ul>
                                                <li id="cardDscnt_N_li" style="display: none;"><strong>청구할인 대상이 아닌 상품이 포함되어 있거나 결제금액이 청구할인 대상 금액보다 적어 청구할인 적용이 불가합니다.</strong></li>
                                                <li id="cardDscnt_Y1_li" style="display: none;">법인/체크/기프트 카드는 청구할인 대상에서 제외될 수 있습니다.</li>
                                                <li id="cardDscnt_Y2_li" style="display: none;">일 최대 청구할인 한도에 따라 청구할인 예상금액은 달라질 수 있습니다.</li>
                                                <li>신용/체크카드 결제금액이 30만원 이상인 경우 공인인증서가 필요합니다.</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <!--// 2017-01-18 추가 : 카드 결제 안내 추가 -->
                                <!--
                                2017-01-18 수정 : 할부혜택 삭제
                                <tr>
                                    <th scope="row">할부혜택</th>
                                    <td>
                                        <div>
                                            <dl class="info_dot_list type2">
                                                <dt>무이자할부 안내</dt>
                                                <dd><span>신한카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
                                                <dd><span>KB국민카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
                                                <dd><span>삼성카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
                                                <dd><span>현대카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
                                                <dd><span>KB국민카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
                                                <dd><span>신한카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
                                                <dd><span>신한카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
                                                <dd><span>KB국민카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
                                                <dd><span>신한카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
                                            </dl>
                                            <p class="tx_info mgT15">* 법인카드/체크카드는 할부 적용제외</p>
                                        </div>
                                    </td>
                                </tr>
                                -->
                                </tbody>
                            </table>
                        </li>
                        <!--// 신용카드 선택 시 -->
                        <!-- 무통장입금 선택 시 -->
                        <li paymethod="61" style="display: none;">
                            <table class="tbl_inp_form no_line">
                                <caption>무통장입금 입력 안내</caption>
                                <colgroup>
                                    <col style="width:170px">
                                    <col style="width:*">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">은행명</th>
                                    <td>
                                        <div>
                                            <select id="VirDepositBank" name="cjBnkCd" class="selH28" title="은행를 선택해주세요." style="width:300px" data-attr="결제수단선택^은행명" disabled="disabled">
                                                
                                                    <option value="003" targetid="03">기업</option>
                                                
                                                    <option value="004" targetid="06">국민</option>
                                                
                                                    <option value="007" targetid="07">수협</option>
                                                
                                                    <option value="011" targetid="11">농협</option>
                                                
                                                    <option value="020" targetid="20">우리</option>
                                                
                                                    <option value="031" targetid="31">대구</option>
                                                
                                                    <option value="032" targetid="32">부산</option>
                                                
                                                    <option value="039" targetid="39">경남</option>
                                                
                                                    <option value="071" targetid="71">우체국</option>
                                                
                                                    <option value="081" targetid="81">하나</option>
                                                
                                                    <option value="088" targetid="88">신한</option>
                                                
                                            </select>
                                            <select name="bnkCd" style="display: none;" disabled="disabled">
                                                
                                                    <option value="02">산업</option>
                                                
                                                    <option value="03">기업</option>
                                                
                                                    <option value="05">외환</option>
                                                
                                                    <option value="06">국민</option>
                                                
                                                    <option value="07">수협</option>
                                                
                                                    <option value="11">농협</option>
                                                
                                                    <option value="20">우리</option>
                                                
                                                    <option value="23">SC제일</option>
                                                
                                                    <option value="27">씨티</option>
                                                
                                                    <option value="31">대구</option>
                                                
                                                    <option value="32">부산</option>
                                                
                                                    <option value="34">광주</option>
                                                
                                                    <option value="35">제주</option>
                                                
                                                    <option value="37">전북</option>
                                                
                                                    <option value="39">경남</option>
                                                
                                                    <option value="45">새마을금고</option>
                                                
                                                    <option value="48">신협</option>
                                                
                                                    <option value="71">우체국</option>
                                                
                                                    <option value="81">하나</option>
                                                
                                                    <option value="88">신한</option>
                                                
                                                    <option value="89">케이뱅크</option>
                                                
                                                    <option value="90">카카오뱅크</option>
                                                
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">입금기한</th>
                                    <td>
                                        <div>
                                            2023.11.18
                                        </div>
                                    </td>
                                </tr>
                                <!--
                                2017-01-18 수정 : 무통장 입금 시 휴대폰정보 입력 영역 삭제
                                <tr>
                                    <th scope="row">휴대폰</th>
                                    <td>
                                        <div>
                                            <select name=""  class="selH28" title="휴대폰 이동통신번호를 선택해주세요." style="width:90px">
                                                <option value="">010</option>
                                                <option value="">011</option>
                                                <option value="">016</option>
                                                <option value="">019</option>
                                            </select>
                                             - <input type="text" name="" value="1234" class="inpH28" title="휴대폰 두번째자리를 입력해주세요." style="width:90px" />
                                             - <input type="text" name="" value="5678" class="inpH28" title="휴대폰 마지막자리를 입력해주세요." style="width:90px" />
                                        </div>
                                    </td>
                                </tr>
                                 -->
                                <tr>
                                    <th scope="row">입금자명</th>
                                    <td>
                                        <div>
                                            <input type="text" id="NameDepositor" name="morcManNm" value="이상문" class="inpH28" title="입금자명을 입력해주세요." style="width:200px" data-attr="결제수단선택^입금자명" disabled="disabled">
                                        </div>
                                    </td>
                                </tr>
                                <!-- 2017-01-18 추가 : 무통장입금 결제안내 문구 추가 -->
                                <tr>
                                    <td colspan="2">
                                        <div class="info_dot_list_area">
                                                                    <ul>
	<li><span style="color:#757d86">은행별로 입금가능시간이 다를 수 있습니다.</span></li>
</ul>
                                            <ul>
                                                <li>주문일 기준 다음날(24시간 이내)까지 입금이 되지 않으면 주문 취소 처리됩니다.</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <!--// 2017-01-18 추가 : 무통장입금 결제안내 문구 추가 -->
                                </tbody>
                            </table>
                        </li>
                        <!--// 무통장입금 선택 시 -->
                        <!-- 계좌이체 선택 시 -->
                        <li paymethod="21" style="display: none;">
                            <table class="tbl_inp_form no_line">
                                <caption>계좌이체 안내</caption>
                                <colgroup>
                                    <col style="width:170px">
                                    <col style="width:*">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">결제안내</th>
                                    <td>
                                        <div>
                                            <!-- 2017-01-18 수정 : 버튼 삭제 및 하단 문구 수정 -->
                                            <div class="info_dot_list_area">
                                                
                                                <ul>
                                                    <li>계좌이체로 결제 완료시 본인 계좌에서 즉시 이체 처리됩니다.</li>
                                                    <li>실시간 계좌이체는 은행별 이용시간이 다를 수 있습니다.</li>
                                                </ul>
                                            </div>
                                            <!--
                                            <p class="mgT10"><button class="btnSmall wGray w100"><span>은행별 이용시간</span></button></p>
                                             -->
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </li>
                        <!--// 계좌이체 선택 시 -->
                        <!-- 휴대폰결제 선택 시 -->
                        <li paymethod="22" style="display: none;">
                            <table class="tbl_inp_form no_line">
                                <caption>휴대폰결제 안내</caption>
                                <colgroup>
                                    <col style="width:170px">
                                    <col style="width:*">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">결제안내</th>
                                    <td>
                                        <div class="info_dot_list_area">
                                            
                                            <ul>
                                                <li>휴대폰 결제는 100만원까지 결제가 가능합니다.</li>
                                                <li>한도문의는 모빌리언스(1600-0523), 다날(1566-3355), 페이레터(1599-7591)로 문의주시기 바랍니다.</li><!-- 2017-01-18 수정 : 문구수정 -->
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </li>
                        <!--// 휴대폰결제 선택 시 -->
                        <!-- 문화상품권(컬쳐캐쉬) 선택 시 -->
                        <li paymethod="23" style="display: none;">
                            <div class="other_cash_box">
                                <!-- 조회 전 -->
                                <div class="cash_inquiry_area" id="cultureLandBeforeLogin">
                                    <p>보유하신 컬쳐캐쉬(문화상품권) 내역 조회 후 사용이 가능합니다.</p>
                                    <button class="btnSmall wGray2" type="button" data-rel="layer" data-target="cultureLandLoginPop" id="cultureLandLoginPop_btn">조회</button>
                                </div>
                                <!--// 조회 전 -->
                                <!-- 조회 후 -->
                                <div class="cash_inquiry_area" id="cultureLandAfterLogin" style="display: none;">
                                    <input type="hidden" id="cultureLandOwnCash" value="" disabled="disabled">
                                    <p>고객님의 보유하신 컬쳐캐쉬는 <span class="cash_price"><span class="tx_num" id="cultureLandOwnCash_span"></span>원</span>입니다.</p>
                                    <p class="tx_info">최종 결제금액을 확인하신 후, [결제하기] 버튼을 클릭하시면 결제가 완료됩니다.</p>
                                    <button class="btnSmall wGray2" type="button" id="cultureLandInquire_btn">다시 조회</button>
                                </div>
                                <!--// 조회 후 -->
                                <div class="info_dot_list_area">
                                    
                                    <ul>
                                        <li>문화상품권을 컬쳐캐쉬로 충전 후 사용하실 수 있습니다.</li>
                                        <li>컬쳐캐쉬 충전 및 사용내역, 현금영수증은 컬쳐랜드 홈페이지에서 확인하실 수 있습니다.</li>
                                        <li>컬쳐캐쉬는 결제금액 전액으로만 사용이 가능합니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!--// 문화상품권(컬쳐캐쉬) 선택 시 -->
                        <!-- 도서상품권(북앤라이프 캐쉬) 선택 시 -->
                        <li paymethod="24" style="display: none;">
                            <div class="other_cash_box">
                                <!-- 조회 전 -->
                                <div class="cash_inquiry_area" id="bookAndLifeBeforeLogin">
                                    <p>보유하신 북앤라이프 캐쉬(도서상품권) 내역 조회 후 사용이 가능합니다.</p>
                                    <button class="btnSmall wGray2" type="button" data-rel="layer" data-target="bookAndLifeLoginPop" id="bookAndLifeLoginPop_btn">조회</button>
                                </div>
                                <!--// 조회 전 -->
                                <!-- 조회 후 -->
                                <div class="cash_inquiry_area" id="bookAndLifeAfterLogin" style="display: none;">
                                    <input type="hidden" id="bookAndLifeOwnCash" value="" disabled="disabled">
                                    <p>
                                        고객님의 보유하신 북앤라이프 캐쉬는 <span class="cash_price"><span class="tx_num" id="bookAndLifeOwnCash_span"></span>원</span>입니다.
                                    </p>
                                    <p class="tx_info">최종 결제금액을 확인하신 후, [결제하기] 버튼을 클릭하시면 결제가 완료됩니다.</p>
                                    <button class="btnSmall wGray2" type="button" id="bookAndLifeInquire_btn">다시 조회</button>
                                </div>
                                <!--// 조회 후 -->
                                <div class="info_dot_list_area">
                                    
                                    <ul>
                                        <li>도서상품권을 북앤라이프 캐쉬로 충전 후 사용하실 수 있습니다.</li>
                                        <li>북앤라이프 캐쉬 충전 및 사용내역은 북앤라이프 홈페이지에서 확인하실 수 있습니다.</li>
                                        <li>북앤라이프 캐쉬는 결제금액 전액으로만 사용이 가능합니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!--// 도서상품권(북앤라이프 캐쉬) 선택 시 -->

                        <!-- PAYCO 선택 시 2017-04-18 -->
                        <li paymethod="25" style="display: none;">
                            <div class="other_cash_box">
                                <div class="info_dot_list_area">
                                                            <ul>
	<li><strong>&lt;11월 PAYCO 결제혜택&gt;</strong></li>
	<li>23.11.01(수) ~ 11.30(목)</li>
	<li>①&nbsp;PAYCO포인트로 1만원 이상 결제 시&nbsp;<strong>1천원 즉시할인</strong>&nbsp;(올리브영 첫결제/60일 휴면 고객)</li>
	<li>② PAYCO포인트로 결제 시 결제금액의<strong>&nbsp;1% 무제한 적립&nbsp;</strong>(익월 25일 지급)</li>
	<li>③&nbsp;PAYCO 1.5만원 결제 시 <strong>1천원 쿠폰 지급</strong> (결제 전 PAYCO앱에서 발급 必)</li>
	<li>④&nbsp;PAYCO 생애 첫 가입/결제 <strong>4천 포인트&nbsp;지급</strong>&nbsp;(30일 내&nbsp;신청&nbsp;必)</li>
</ul>
 
                                    <ul>
                                        <li>PAYCO는 NHN엔터테인먼트에서 제공하는 안전한 간편결제 서비스로 올리브영몰에서는 신용카드 결제가 가능합니다.</li>
                                        <li>신용카드 등록 시 휴대폰과 카드명의자가 동일해야합니다. (모든 신용/체크카드 가능)</li>
                                        <li>PAYCO로 결제 시, 제휴카드 할인(CJ카드, 임직원할인 포함)이 적용되지 않습니다.</li>
                                        <li>무이자할부는 PAYCO 결제창에서 확인하실 수 있습니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!-- //PAYCO 선택 시 2017-04-18 -->
                        <!-- KAKAOPAY 선택 시 2017-12-13 -->
                        <li paymethod="26" style="display: none;">
                            <div class="other_kakao_box">
                                <div class="info_dot_list_area">
                                                            <ul>
	<li><span style="color:#757d86"><span style="font-family:맑은 고딕"><strong>&lt;카카오페이 유의사항&gt;</strong></span></span></li>
	<li><span style="color:#757d86"><span style="font-family:맑은 고딕">무이자할부는 카카오페이 모바일 결제창에서 선택하실 수 있습니다.</span></span></li>
	<li><span style="color:#757d86"><span style="font-family:맑은 고딕">휴대폰과 카드명의자가 동일해야 결제 가능합니다.</span></span></li>
	<li><span style="color:#757d86"><span style="font-family:맑은 고딕">카카오페이 결제 시, 제휴카드 할인/적립(CJ카드, CJ iD카드, 임직원할인 포함)이 적용되지 않습니다.</span></span></li>
	<li><span style="color:#757d86"><span style="font-family:맑은 고딕">카드 영수증 및 현금영수증 확인은&nbsp;카카오페이 홈페이지에서 확인 가능합니다.(카카오페이 홈 &gt; 설정 &gt; 결제내역)</span></span></li>
	<li><span style="color:#757d86"><span style="font-family:맑은 고딕">카카오페이 고객센터 : 1644-7405</span></span></li>
</ul> 
                                </div>
                            </div>
                        </li>
                        <!-- //KAKAOPAY 선택 시 2017-12-13 -->

                        <!-- NAVERPAY 선택 시 20201021 배포에선 네이버페이 노출 제외 -->
                        <li paymethod="29" style="display: none;">
                            <div class="other_kakao_box">
                                <div class="info_dot_list_area">
                                                            <ul>
	<li><strong>&lt;네이버페이 상시혜택&gt;</strong></li>
	<li><strong>네이버 검색 통해 올리브영에서 구매 시, 기본 혜택 1%가 적립됩니다</strong></li>
	<li>네이버페이 머니로&nbsp;충전,결제하면 1.5% 적립됩니다</li>
	<li>네이버페이 머니 하나통장이나 미래에셋증권CMA-RP 네이버통장으로 충전 후 결제 시 0.5% 추가(총 3%) 적립됩니다 (구매확정 / 거래완료 후 적립)</li>
	<li><strong>&lt;네이버페이 유의사항&gt;</strong></li>
	<li>주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다</li>
	<li>네이버페이로 결제 시, 제휴카드 할인/적립(CJ카드, CJ iD카드, 임직원할인 포함)이 적용되지 않습니다</li>
	<li>현금영수증 확인은 네이버페이 홈페이지에서 확인 가능합니다&nbsp;(네이버페이 홈 &gt; 결제내역)</li>
	<li>네이버페이 고객센터 : 1588-3819</li>
</ul>
                                                                <script type="text/javascript">
                                                                    // 결제수단 혜택 플래그
                                                                    $(document).ready(function(){
                                                                        try{
                                                                            forder.orderForm.payMethod.addPayBenefitFlag("29");
                                                                        }catch(e){console.log(e);}
                                                                    });
                                                                </script>                                     
                                                            <ul>
	<li><span style="color:#757d86;"><strong>&lt;은행 별 시스템 점검 안내&gt;</strong></span></li>
	<li><span style="color:#757d86;">점검 시간 내 네이버페이 계좌 결제, 취소 및 신규 등록이 원활하지 않을 수 있습니다. 다른 결제수단을 이용해주세요.<br>
	<span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;">우리은행: 11/12(일)&nbsp;오전 2시~오전 6시</span></span></span><br>
	<span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;">경남은행: 11/12(일) 오전 2시~오전 6시</span></span></span></span></span><br>
	<span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;">광주은행: 11/12(일)&nbsp;오전 2시~오전 6시</span></span></span><br>
	<span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;">KDB산업은행: 11/12(일)&nbsp;오전 0시~오전 4시<br>
	기업은행: 11/12(일) 오전 0시~오전 6시<br>
	케이뱅크: 11/12(일) 오전 0시~오전 8시<br>
	하나은행: 11/18(토) 오전 0시~오전 12시</span></span></span><br>
	<span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;">국민은행: 11/19(일)&nbsp;오전 0시~오전 6시</span></span></span></span></span><br>
	<span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;"><span style="color:#757d86;">농협은행: 11/20(월)&nbsp;오전 0시~오전 4시</span></span></span></span></span></span></span></span></span><br>
	<span style="color:#757d86;">유안타증권: 11/25(토) 오전 8시~오후 11시</span></li>
</ul>  
                                </div>
                            </div>
                        </li>
                        <!-- //NAVERPAY 선택 시 -->

                        <!-- 결제혜택 정보 -->
                        <li class="ad_info_area">
                            <div class="ad_info">

                                <!-- <div class="txt">
                                    <span class="icon">국민카드 4만원 이상 결제 시 3천원 청구 할인</span>
                                    <button type="button" class="btn_info" onclick="layTooltip('lay_tooltip_01');">카드 혜택 레이어 팝업</button>
                                    <div class="lay_tooltip" id="lay_tooltip_01">
                                        <p class="stxt"><em>국민 BC 카드 혜택</em><br>카드에 BC마크가 없는 경우 적용 불가. 1일 1회 한정</p>
                                        <button type="button" class="btnClose" onclick="layTooltipClose('lay_tooltip_01');">닫기</button>
                                    </div>
                                </div> -->

                            </div>
                        </li>

                        <li class="ad_info_area">
                            <div class="ad_info">

                            </div>
                        </li>
                        <!-- //결제혜택 정보 -->

                    </ul>

                    <!-- 현금영수증 신청 -->
                    <div class="" id="cashReceipt" style="display: none;">
                        <h2 class="sub-title2">현금영수증 신청</h2>
                        <table class="tbl_inp_form type2" id="receipt_table">
                            <caption>현금영수증 신청 입력 폼</caption>
                            <colgroup>
                                <col style="width:170px">
                                <col style="width:*">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">현금영수증</th>
                                <td>
                                    <div>
                                        <select id="crIssuCd" name="crIssuCd" class="selH28" title="현금영수증 신청여부를 선택해주세요." style="width:200px" data-attr="현금영수증신청^현금영수증" disabled="">
                                            <option value="">신청안함</option>
                                            <option value="10">개인소득공제용</option>
                                            <option value="20">사업자지출증빙용</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>

                            <!-- 개인소득공제용신청 시 -->
                            <tr crissucd="10" style="display: none;">
                                <th scope="row">발급방법</th>
                                <td>
                                    <div>
                                        <input type="radio" id="crIssuMeanSctCd_3" name="crIssuMeanSctCd" value="3" checked="checked" data-attr="현금영수증신청^발급방법" disabled=""> <label for="crIssuMeanSctCd_3">휴대폰</label>
                                        <input type="radio" id="crIssuMeanSctCd_5" name="crIssuMeanSctCd" value="5" data-attr="현금영수증신청^발급방법" disabled=""> <label for="crIssuMeanSctCd_5">현금영수증카드</label>
                                    </div>
                                </td>
                            </tr>
                            <!-- 개인소득공제용 [휴대폰] 선택 시 -->
                            <tr crissucd="10" crissumeansctcd="3" style="display: none;">
                                <th scope="row">휴대폰</th>
                                <td>
                                    <div>
                                        <select id="dispCashReceiptInfo11" class="selH28" title="현금영수증 휴대폰 앞자리를 선택해주세요." style="width:90px" data-attr="현금영수증신청^휴대폰" disabled="">
                                            
                                                <option value="010" selected="selected">010</option>
                                            
                                                <option value="011">011</option>
                                            
                                                <option value="016">016</option>
                                            
                                                <option value="017">017</option>
                                            
                                                <option value="018">018</option>
                                            
                                                <option value="019">019</option>
                                            
                                                <option value="02">02</option>
                                            
                                                <option value="031">031</option>
                                            
                                                <option value="032">032</option>
                                            
                                                <option value="033">033</option>
                                            
                                                <option value="041">041</option>
                                            
                                                <option value="042">042</option>
                                            
                                                <option value="043">043</option>
                                            
                                                <option value="044">044</option>
                                            
                                                <option value="051">051</option>
                                            
                                                <option value="052">052</option>
                                            
                                                <option value="053">053</option>
                                            
                                                <option value="054">054</option>
                                            
                                                <option value="055">055</option>
                                            
                                                <option value="061">061</option>
                                            
                                                <option value="062">062</option>
                                            
                                                <option value="063">063</option>
                                            
                                                <option value="064">064</option>
                                            
                                                <option value="070">070</option>
                                            
                                                <option value="080">080</option>
                                            
                                                <option value="0130">0130</option>
                                            
                                                <option value="0303">0303</option>
                                            
                                                <option value="0502">0502</option>
                                            
                                                <option value="0503">0503</option>
                                            
                                                <option value="0504">0504</option>
                                            
                                                <option value="0505">0505</option>
                                            
                                                <option value="0506">0506</option>
                                            
                                                <option value="0507">0507</option>
                                            
                                        </select>
                                        - <input type="text" id="dispCashReceiptInfo12" value="5549" class="inpH28" title="현금영수증 휴대폰 가운데 자리를 입력해주세요." this="현금영수증 휴대폰 가운데 자리는" style="width:90px" data-attr="현금영수증신청^휴대폰" disabled="">
                                        - <input type="text" id="dispCashReceiptInfo13" value="7526" class="inpH28" title="현금영수증 휴대폰 마지막 4자리수를 입력해주세요." this="현금영수증 휴대폰 마지막 자리는" style="width:90px" data-attr="현금영수증신청^휴대폰" disabled="">
                                        <input type="hidden" id="crPhoneNumber" name="crIssuMeanNo" value="01055497526" disabled="">
                                    </div>
                                </td>
                            </tr>
                            <!--//개인소득공제용 [휴대폰] 선택 시 -->
                            <!-- 개인소득공제용 [현금영수증카드] 선택 시 -->
                            <tr crissucd="10" crissumeansctcd="5" style="display: none;">
                                <th scope="row">현금영수증 카드번호</th>
                                <td>
                                    <div>
                                        <input type="text" id="CashReceipts" name="crIssuMeanNo" class="inpH28" title="현금영수증 카드번호를 입력해주세요." this="현금영수증 카드번호는" style="width:300px" disabled="">
                                    </div>
                                </td>
                            </tr>
                            <!--// 개인소득공제용 [현금영수증카드] 선택 시 -->
                            <!--// 개인소득공제용신청 시 -->

                            <!-- 사업자지출증빙용 시 -->
                            <tr crissucd="20" style="display: none;">
                                <th scope="row">사업자등록번호</th>
                                <td>
                                    <div>
                                        <input type="hidden" name="crIssuMeanSctCd" value="2" disabled="">
                                        <input type="text" id="BusinessNumber" name="crIssuMeanNo" class="inpH28" title="현금영수증 사업자 등록번호를 입력해주세요." this="현금영수증 사업자 등록번호는" style="width:300px" disabled="">
                                    </div>
                                </td>
                            </tr>
                            <!--// 사업자지출증빙용 시 -->
                            </tbody>
                        </table>
                        <!--// 현금영수증 신청 -->
                    </div>
                </div>

                <div class="right_area">
                    <!-- 최종 결제정보 -->
                    <h2 class="sub-title2">최종 결제정보</h2>
                    <!--// 최종 결제정보 -->
                    <ul class="total_payment_box">
                        <li>
                            <span class="tx_tit">총 상품금액</span>
                            <span class="tx_cont"><span class="tx_num">0</span>원</span>
                            <input type="hidden" id="totalPrice" name="totalPrice" value="0">
                        </li>
                        <li>
                            <span class="tx_tit">쿠폰할인금액</span><!-- 2017-01-18 수정 : 문구수정 -->
                            <span class="tx_cont colorOrange"><span class="tx_num" id="totDscntAmt_span">0</span>원</span>
                            <input type="hidden" name="descentAmt" value="2660">
                            <input type="hidden" id="imdtDscntAmt" value="2660">
                        </li>
                        
                        <li class="line_top2">
                            <span class="tx_tit">총 배송비 <button type="button" class="btnSmall wGray"><span>상세보기</span></button></span>
                            <span class="tx_cont"><span class="tx_num" id="dlexPayAmt_span">0</span>원</span>
                            <input type="hidden" name="deli_price" value="0">
                            <div class="package-price">
                                <span class="tx_tit">선물포장비</span>
                                <span class="tx_cont"><span class="tx_num" id="giftPayAmt_span">0</span>원</span>
                                <input type="hidden" name="present_price" value="0">
                            </div>

                            <input type="hidden" name="dlexPayAmt" value="0">
                        </li>
                        
                        <li id="oyGiftCardAplyAmt_li" style="display: none;">
                            <span class="tx_tit">올리브영 기프트카드</span>
                            <span class="tx_cont colorOrange"><span class="tx_num" id="oyGiftCardAplyAmt_span">0</span>원</span>
                        </li>
                        <li id="cjGiftCardAplyAmt_li" style="display: none;">
                            <span class="tx_tit">CJ 기프트카드</span>
                            <span class="tx_cont colorOrange"><span class="tx_num" id="cjGiftCardAplyAmt_span">0</span>원</span>
                        </li>
                        <li>
                            <span class="tx_tit"><span class="tx_num">CJ ONE</span> 포인트</span>
                            <input type="hidden" id="point_price" name="point_price" value="0">
                            <span class="tx_cont colorOrange"><span class="tx_num" id="cjonePntAplyAmt_span">0</span>원</span>
                        </li>
                        <!-- 임직원일 경우 -->
                        <li id="cafeteriaPntAplyAmt_li" style="display: none;">
                            <span class="tx_tit">카페테리아 포인트</span>
                            <span class="tx_cont colorOrange"><span class="tx_num c" id="cafeteriaPntAplyAmt_span">0</span>원</span>
                        </li>
                        <!--// 임직원일 경우 -->
                        <li id="csmnAplyAmt_li" style="display: none;">
                            <span class="tx_tit">예치금</span>
                            <span class="tx_cont colorOrange"><span class="tx_num" id="csmnAplyAmt_span">0</span>원</span>
                        </li>
                        <li id="culturelandGiftAplyAmt_li" style="display: none;">
                            <span class="tx_tit">컬쳐캐쉬</span>
                            <span class="tx_cont colorOrange"><span class="tx_num" id="culturelandGiftAplyAmt_span">0</span>원</span>
                        </li>
                        <li id="bookGiftAplyAmt_li" style="display: none;">
                            <span class="tx_tit">북앤라이프캐쉬</span>
                            <span class="tx_cont colorOrange"><span class="tx_num" id="bookGiftAplyAmt_span">0</span>원</span>
                        </li>
                        <li class="total">
                            <span class="tx_tit">최종 결제금액</span>
                            <span class="tx_cont"><span class="tx_num" id="totPayAmt_sum_span">0</span>원</span>
                            <input type="hidden" id="totalPay" name="totalPay" value="0">
                            <input type="hidden" name="remainAmt" value="23940">
                            <input type="hidden" name="ordPayAmt" value="23940">
                            <input type="hidden" name="goodsNm" value="바이오더마 하이드라비오 토너 500ml 기획(+화장솜 20매 증정)">
                        </li>
                        
                        <li> <!-- 3440969_PM작업시 오늘드림 레이어 팝업 노출 요청 건 -->
                            <button class="btnPayment" id="btnPay" name="btnPay" type="button" data-attr="최종결제정보^결제하기">결제하기<em id="giftNoti3" style="display: none;">(증정품은 결제 시 확인 가능합니다)</em> <em id="giftNotiQuick" style="display: none;">(오늘드림으로 주문 시 온라인 단독 <br>증정품이 제공되지 않습니다.)</em> <em id="giftNoti4" style="display: none;">(오늘드림 주문은 온라인 전용 증정품이<br>제공되지 않습니다.)</em></button>
                            
                                
                                    <!-- 선물하기 2-1차 : 증정품 관련 문구 -->
                                    
                                    <p class="gift gp-gift-txt1" id="giftChangeO2oComment" name="giftChangeO2oComment" style="display:none;">받으시는 분의 배송지에 따라 증정품이 변경될 수 있습니다.</p>
                                    <!-- 선물하기 2-1차 : 증정품 관련 문구 -->
                                    <p id="giftNoti3" class="gift" style="display: none;">증정품은 결제 시 확인 가능합니다.</p>
                                
                                
                            
                            <input type="hidden" id="tempOrdNo" value="">
                        </li>
                    </ul>

                    <div class="add_chk_area">
                        <p class="inchk clrfix">
                            <input type="checkbox" id="savePayMethodYn" name="savePayMethodYn" value="Y" checked="checked" paymeancd="11" acqrcd="LGC" instmmcnt="0" pntuseyn="N" bnkcd="" morcmannm="" data-attr="최종결제정보^빠른모드">
                            <!-- <input type="checkbox" id="fastpaySave" name="" value=""> -->
                            <label for="savePayMethodYn">지금 설정을 다음 주문에도 사용하겠습니다.<br>(빠른 모드)</label>
                        </p>
                    </div>

                    <div class="agree_payment_box" id="agreeList">
                        <div class="all_agree_cont">
                            <p>주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?</p><!-- 2017-01-18 수정 : 문구수정 -->
                            <input type="checkbox" id="agree_all" name="TrrmsCheck1ed" value="" data-attr="최종결제정보^결제대행동의"> <label for="agree_all">모두 동의</label>
                            <button type="button" class="btnDetailAgree" id="btnDetailAgree">주문상품 및 결제대행 서비스 이용약관 자세히 보기 열기/닫기</button>
                        </div>
                        <ul class="other_agree_cont">
                            <li>
                                <p class="tx_tit">주문 상품정보에 대한 동의</p>
                                <p class="tx_cont2"><input type="checkbox" id="agree_1" name="agreeChk" value="" title="주문 상품정보 및 결제대행 서비스 이용약관에 동의해주세요." data-attr="최종결제정보^결제대행동의"> <label for="agree_1">주문하실 상품, 가격, 배송정보, 할인내역등을 최종 확인하였으며, 구매에 동의합니다. <br>(전상거래법 제8조 제2항)</label></p>
                            </li>
                            
                            <li>
                                <p class="tx_tit">결제대행 서비스 이용약관 동의</p>
                                <p class="tx_cont">
                                    <input type="checkbox" id="agree_2_1" name="agreeChk" value="" title="전자금융거래 기본약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의"> <label for="agree_2_1">전자금융거래 기본약관</label>
                                    <button type="button" class="btnSmall wGray" onclick="javascript:forder.orderForm.openPopup('https://static.oliveyoung.co.kr/pc-static-root/html/etc/foot_agreement.html','agree',400,900);"><span>약관보기</span></button>
                                </p>
                                <p class="tx_cont">
                                    <input type="checkbox" id="agree_2_2" name="agreeChk" value="" title="개인정보 수집 및 이용약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의"> <label for="agree_2_2">개인정보 수집 및 이용 동의</label>
                                    <button type="button" class="btnSmall wGray" onclick="javascript:forder.orderForm.openPopup('https://static.oliveyoung.co.kr/pc-static-root/html/etc/foot_agreement_02.html','agree',400,900);"><span>약관보기</span></button>
                                </p>
                                <p class="tx_cont">
                                    <input type="checkbox" id="agree_2_3" name="agreeChk" value="" title="개인정보 제공 및 위탁약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의"> <label for="agree_2_3">개인정보 제공 및 위탁 동의</label>
                                    <button type="button" class="btnSmall wGray" onclick="javascript:forder.orderForm.openPopup('https://static.oliveyoung.co.kr/pc-static-root/html/etc/foot_agreement_03.html','agree',400,900);"><span>약관보기</span></button>
                                </p>
                            </li>
                            <!--
                                CJOYPG-1745 :: 제3자제공 동의 항목 추가
                                ## html 추가
                            -->
                            
                        </ul>
                    </div>
                </div>

            </div>
            <!--// 쿠폰 및 포인트, 결제수단, 결제정보 -->
        </form>
        
    </div>
    <!-- //#Contents -->
</div>
<!-- //#Container -->

<!-- 올리브영 기프트카드 팝업 -->
<div class="layer_pop_wrap w680" id="OliveGiftInfo" style="">
    <div class="layer_cont cjGiftcard">
        <h2 class="gift_title">나의 올리브영 기프트카드 <span class="total">총 <em class="tx_num" id="oyGiftQty">0</em>장</span></h2>
        <!--  -->
        <div class="gift_inner">
            <p class="total_price"><em class="tx_num" id="oyGiftAmt">0</em>원</p>
            <p class="link_div">
                <!-- <a href="https://www.cjone.com/cjmweb/cash/cashreg.do" class="link_01" target="_blank">기프트카드 등록</a> -->
                <a href="https://www.oliveyoung.co.kr/store/myGiftCard/getMyGiftCardReg.do" target="_blank" class="link_01">기프트카드 등록</a>
                <!-- <a href="https://www.cjone.com/cjmweb/cash/cashmain.do" class="link_02" target="_blank"> 내 기프트카드 상세보기</a> -->
                <a href="https://www.oliveyoung.co.kr/store/myGiftCard/getMyGiftCard.do" target="_blank" class="link_02"> 내 기프트카드 상세보기</a>
            </p>
            <div class="info_div">
                <ol>
                    <li>CJ 기프트카드/ 올리브영 기프트카드만 사용이 가능합니다.</li>
                    <li>기프트카드의 유효기간은 5년입니다.</li>
                    <li>기프트카드의 잔액 환불은 최종 충전 후 합계 잔액의 60%이상을 사용한 경우에 한하여 신청이 가능합니다.</li>
                    <li>기프트카드 관련 문의는 나이스정보통신 1644-9760,  올리브네트웍스 1577-8888로 연락주세요.<br>
                        (상담시간 평일 09:00 - 18:00 / 토, 일, 공휴일 휴무)<br><br>
                        <a href="http://www.ennice.co.kr/nonUser/refundVoucher.do#noback" class="link_03" target="_blank">환불신청하기</a>
                    </li>
                </ol>
            </div>
        </div>
        <!--//  -->
        <button class="layer_close">창 닫기</button>
    </div>
</div>
<!--// 올리브영 기프트카드 팝업 -->

<!-- CJ 기프트카드 팝업 -->
<div class="layer_pop_wrap w680" id="CJGiftInfo" style="">
    <div class="layer_cont cjGiftcard">
        <h2 class="gift_title">나의 <span class="tx_num">CJ</span> 기프트카드 <span class="total">총 <em class="tx_num" id="cjGiftQty">0</em>장</span></h2>
        <!--  -->
        <div class="gift_inner">
            <p class="total_price"><em class="tx_num" id="cjGiftAmt">0</em>원</p>
            <p class="link_div">
                <!-- <a href="https://www.cjone.com/cjmweb/cash/cashreg.do" class="link_01" target="_blank">기프트카드 등록</a> -->
                <a href="https://www.oliveyoung.co.kr/store/myGiftCard/getMyGiftCardReg.do" target="_blank" class="link_01">기프트카드 등록</a>
                <!-- a href="https://www.cjone.com/cjmweb/cash/cashmain.do" class="link_02" target="_blank"> 내 기프트카드 상세보기</a> -->
                <a href="https://www.oliveyoung.co.kr/store/myGiftCard/getMyGiftCard.do" target="_blank" class="link_02"> 내 기프트카드 상세보기</a>
            </p>
            <div class="info_div">
                <ol>
                    <li>CJ 기프트카드/ 올리브영 기프트카드만 사용이 가능합니다.</li>
                    <li>기프트카드의 유효기간은 5년입니다.</li>
                    <li>기프트카드의 잔액 환불은 최종 충전 후 합계 잔액의 60%이상을 사용한 경우에 한하여 신청이 가능합니다.</li>
                    <li>기프트카드 관련 문의는 나이스정보통신 1644-9760,  올리브네트웍스 1577-8888로 연락주세요.<br>
                        (상담시간 평일 09:00 - 18:00 / 토, 일, 공휴일 휴무)<br><br>
                        <a href="http://www.ennice.co.kr/nonUser/refundVoucher.do#noback" class="link_03" target="_blank">환불신청하기</a>
                    </li>
                </ol>
            </div>
        </div>
        <!--//  -->
        <button class="layer_close">창 닫기</button>
    </div>
</div>
<!--// CJ 기프트카드 팝업 -->

<!-- 안심번호 서비스 안내 팝업 -->
<div class="layer_pop_wrap w680" id="securityInfo" style="">
    <div class="layer_cont">
        <h2 class="layer_title">안심번호 서비스 안내</h2>
        <!-- 스크롤 영역 -->
        <div class="security_info">
            올리브영 고객님의 개인정보보호를 위해 상품 주문시 고객님의 휴대폰 및 전화번호를 1회성 임시번호<br>
            (050X-XXX-XXX)로 변환하여 사용하는 서비스입니다.<br>
            협력사 / 택배사에 050X 안심번호가 전달되므로 만일에 발생할 수 있는 개인정보 유출을 사전에<br>
            차단할 수 있습니다.<br>
            (올리브영 또는 택배사 내부 사정으로 인하여 서비스 지원이 제한될 수 있습니다.)
        </div>
        <!--// 스크롤 영역 -->
        <button class="layer_close">창 닫기</button>
    </div>
</div>
<!--// 안심번호 서비스 안내 팝업 -->


<!-- 컬쳐랜드 로그인 팝업 -->
<div class="layer_pop_wrap w490" id="cultureLandLoginPop" style="">
    <div class="layer_cont">
        <h2 class="layer_title">컬쳐랜드 로그인</h2>
        <div class="loginArea">
            <div class="loginForm">
                <ul>
                    <li>
                        <input type="text" id="cultureLandLoginId" value="" title="아이디를 입력해 주세요." placeholder="아이디">
                    </li>
                    <li>
                        <input type="password" id="cultureLandLoginPw" value="" title="비밀번호를 입력해 주세요." placeholder="비밀번호">
                    </li>
                </ul>
                <div class="btnArea">
                    <button type="button" class="btnGreen" id="cultureLandLogin_btn">로그인</button>
                </div>
                <div class="linkChk">
                    <div class="link">
                        <a href="https://www.cultureland.co.kr/customer/finduser/findID_main.asp" target="_blank">아이디 찾기</a>
                        <a href="https://www.cultureland.co.kr/customer/finduser/findPW_main.asp" target="_blank">비밀번호 찾기</a>
                    </div>
                </div>
                <p class="tx_login_info mgT10">컬쳐캐쉬를 사용하기 위해서는 컬쳐랜드 로그인이 필요합니다.</p>
            </div>
        </div>

        <button type="button" class="layer_close" id="cultureLandLoginPop_close">창 닫기</button>
    </div>
</div>
<!--// 컬쳐랜드 로그인 팝업 -->

<!-- 전자금융거래 기본약관 팝업 -->
<div class="layer_pop_wrap w490" id="bookAndLifeLoginPop" style="">
    <div class="layer_cont">
        <h2 class="layer_title">북앤라이프 로그인</h2>
        <div class="loginArea">
            <div class="loginForm">
                <ul>
                    <li>
                        <input type="text" id="bookAndLifeLoginId" value="" title="아이디를 입력해 주세요." placeholder="아이디">
                    </li>
                    <li>
                        <input type="password" id="bookAndLifeLoginPw" value="" title="비밀번호를 입력해 주세요." placeholder="비밀번호">
                    </li>
                </ul>
                <div class="btnArea">
                    <button type="button" class="btnGreen" id="bookAndLifeLogin_btn">로그인</button>
                </div>
                <div class="linkChk">
                    <div class="link">
                        <a href="https://www.booknlife.com/hp/findId.do" target="_blank">아이디/비밀번호 찾기</a>
                    </div>
                </div>
                <p class="tx_login_info mgT10">북앤라이프 캐쉬를 사용하기 위해서는 북앤라이프 로그인이 필요합니다.</p><!-- 2017-01-18 수정 : <br />삭제 -->
            </div>
        </div>

        <button type="button" class="layer_close" id="bookAndLifeLoginPop_close">창 닫기</button>
    </div>
</div>
<!--// 전자금융거래 기본약관 팝업 -->

<!-- 현대카드 M포인트 사용안내 팝업 -->
<div class="layer_pop_wrap w650" id="mHPointInfo" style="">
    <div class="layer_cont">
        <h2 class="layer_title" id="pntInfoMsgLayerTitle"></h2>
        <div class="mhy_point" id="pntInfoMsgLayer"></div>
        <button type="button" class="layer_close">창 닫기</button>
    </div>
</div>
<!--// 현대카드 M포인트 사용안내 팝업 -->

<!-- 배송비 상세정보 안내 팝업 -->
<div class="layer_pop_wrap w410" id="deliveryInfo" style="z-index: 999;">
    <div class="layer_cont" id="getDlexDtlPopAjax">
		<h2 class="layer_title">배송비 상세정보</h2>
		
		<!-- 스크롤 영역 -->
		<div class="layer_scroll_box type2 mgT20">
			<h3 class="layer_sub_title">올리브영 배송상품</h3>
			<ul class="delivery_info_list" id="hdDlexList">
				<li type="base" entrno="0" dlexcpnyn="N">
					<div>
						<span class="tx_tit">일반상품 배송비</span> 
						<input type="hidden" name="dlexAmt" value="0" orgvalue="0" targetid="0_0" disabled="disabled">
						<span class="tx_cont">
							<span class="tx_num" id="dlexAmt_hd_base">0</span>원
						</span>
					</div>
				
					<div class="add_cont">
						<span class="tx_tit">기본 배송비</span> 
						<span class="tx_cont">
							<span class="tx_num" id="0_0">0</span>원
						</span>
						
					</div>
				</li>
				<li class="total">
					<div>
						<span class="tx_tit">총 배송비</span>
						<span class="tx_cont">
							<span class="tx_num" id="totDlexAmt_hd_span">0</span>원
							<br>
							<span type="coupon" entrno="0" style="display: none;">(무료배송 쿠폰/도서산간배송비 적용 제외)</span>
						</span>
					</div>
				</li>
			</ul>
			<!--// 올리브영 배송상품 배송비 목록 -->
		</div>
		<!--// 스크롤 영역 -->
		
		<div class="total_delivery_price">
			<span class="tx_tit">합계</span> 
			<span class="tx_cont"><span class="tx_num" id="totDlexAmt_span">0</span>원</span>
		</div>
		<input type="hidden" id="totDlexAmt_hd" value="0">
		<input type="hidden" id="totDlexAmt_entr" value="0">
		<input type="hidden" id="totDlexAmt" value="0">
		<button class="layer_close" onclick="javascript:$('#deliveryInfo').hide(); $('.dimm').remove();">창 닫기</button>
</div>
</div>
<!--// 배송비 상세정보 안내 팝업 -->

<!-- 전자금융거래 기본약관 팝업 -->
<div class="layer_pop_wrap w650" id="eCommerceTerm" style="">
    <div class="layer_cont">
        <h2 class="layer_title">전자금융거래 기본약관</h2>

        <div class="term_scroll_box">
            <!-- 약관내용이 들어갑니다. -->
        </div>
        <div class="layer_btn_area">
            <button type="button" class="btnMedium fullGreen"><span>확인</span></button>
        </div>
        <button type="button" class="layer_close">창 닫기</button>
    </div>
</div>
<!--// 전자금융거래 기본약관 팝업 -->
<!-- 개인정보 수집 및 이용동의 팝업 -->
<div class="layer_pop_wrap w650" id="personalTerm" style="">
    <div class="layer_cont">
        <h2 class="layer_title">개인정보 수집 및 이용동의</h2>

        <div class="term_scroll_box">
            <!-- 약관내용이 들어갑니다. -->
        </div>
        <div class="layer_btn_area">
            <button type="button" class="btnMedium fullGreen"><span>확인</span></button>
        </div>
        <button type="button" class="layer_close">창 닫기</button>
    </div>
</div>
<!--// 개인정보 수집 및 이용동의 팝업 -->
<!-- 개인정보 제공 및 위탁동의 팝업 -->
<div class="layer_pop_wrap w650" id="provideTerm" style="">
    <div class="layer_cont">
        <h2 class="layer_title">개인정보 제공 및 위탁동의</h2>

        <div class="term_scroll_box">
            <!-- 약관내용이 들어갑니다. -->
        </div>
        <div class="layer_btn_area">
            <button type="button" class="btnMedium fullGreen"><span>확인</span></button>
        </div>
        <button type="button" class="layer_close">창 닫기</button>
    </div>
</div>
<!--// 개인정보 제공 및 위탁동의 팝업 -->
<!-- 증정품 팝업 -->
<div class="layer_pop_wrap" id="PresentPopup" style="width: 700px; margin-left: -350px; z-index: 999;">
    <div class="layer_cont">
        <div class="pad30">
            <h2 class="layer_title">증정품 확인</h2>
            <!-- 스크롤 영역 -->
            <div class="layer_scroll_box type2">
                <div class="PresentPopup" id="getGiftListAjax">
<!-- 필수 증정품 -->

				<div class="order_title">
					<span class="tx_order_info">구매조건에 따라 아래 증정품을 받으실 수 있습니다.</span>
				</div>
					<div class="tit_info">
	                    <div class="tarea">
							<b class="txt">전 회원 스킨케어 상품 1개 이상 구매시
						</b></div><b class="txt">
					</b></div><b class="txt">
					<ul class="gift_list">
					
							<li>
								<div for="G000000024352" class="gift_box">
									<input type="radio" id="G000000024352" class="input-radio" name="G000000024352" dupprstpsbyn="Y" goodsno="F000000190858" aeevtno="G000000024352" drtpuryn="" prstqty="0" style="display: none;" disabled="disabled">
									<span class="img">
										<img src="https://static.oliveyoung.co.kr/pc-static-root/image/product/icon_free_gift_bg.jpg" alt="증정품 이미지">
					
										<span>소진완료</span>
					
									</span>
									스킨케어 카테고리 구매 시 수분착붙 선크림 1매&nbsp;증정　
									<div class="qty"><em class="tit">수량</em><em>1</em>개</div>
								
							</div></li>
							<li>
								<div for="G000000024353" class="gift_box">
									<input type="radio" id="G000000024353" class="input-radio" name="G000000024353" dupprstpsbyn="Y" goodsno="F000000190857" aeevtno="G000000024353" drtpuryn="" prstqty="0" style="display: none;" disabled="disabled">
									<span class="img">
										<img src="https://static.oliveyoung.co.kr/pc-static-root/image/product/icon_free_gift_bg.jpg" alt="증정품 이미지">
					
										<span>소진완료</span>
					
									</span>
									스킨케어 카테고리 구매 시 리페어 밀키 크림 1매&nbsp;증정　
									<div class="qty"><em class="tit">수량</em><em>1</em>개</div>
								
							</div></li>
				
							<li>
								<div for="G000000024616" class="gift_box">
									<input type="radio" id="G000000024616" class="input-radio" name="G000000024616" dupprstpsbyn="Y" goodsno="F000000180482" aeevtno="G000000024616" drtpuryn="" prstqty="0" style="display: none;" disabled="disabled">
									<span class="img">
										<img src="https://static.oliveyoung.co.kr/pc-static-root/image/product/icon_free_gift_bg.jpg" alt="증정품 이미지">
					
										<span>소진완료</span>
					
									</span>
									스킨케어 카테고리 구매 시 비욘드 엔젤아쿠아 보습장벽크림 3ml 1개 증정
									<div class="qty"><em class="tit">수량</em><em>1</em>개</div>
								
							</div></li>
					
							<li>
								<div for="G000000024617" class="gift_box">
									<input type="radio" id="G000000024617" class="input-radio" name="G000000024617" dupprstpsbyn="Y" goodsno="F000000192640" aeevtno="G000000024617" drtpuryn="" prstqty="0" style="display: none;" disabled="disabled">
									<span class="img">
										<img src="https://static.oliveyoung.co.kr/pc-static-root/image/product/icon_free_gift_bg.jpg" alt="증정품 이미지">
					
										<span>소진완료</span>
					
									</span>
									스킨케어 카테고리 구매시 비욘드 엔젤아쿠아 수분진정앰플 1.5ml 1개 증정&nbsp;
									<div class="qty"><em class="tit">수량</em><em>1</em>개</div>
								
							</div></li>
				</ul>
<!-- //필수 증정품 -->
<!-- 선택 증정품 -->

<!-- //선택 증정품 -->
				<input type="hidden" id="giftCnt" value="4">
				<input type="hidden" id="giftYn" value="N">
</b></div>
            </div>
            <!--// 스크롤 영역 -->
            <div class="order_btn_area">
                <button class="btnGray" id="btnClose">이전</button> <button class="btnGreen" id="btnSubmit">확인</button>
            </div>
        </div>
        <dl class="info_dot_list">
            <dt>이용안내</dt>
            <dd>증정품은 최종 결제금액 기준으로 제공됩니다.</dd>
            <dd>증정품은 주문 번호 당 1 개씩 증정이 기본이며 구매 상품 n개당 N개씩 증정되는 경우도 있습니다 .(구매 전 상세 내용을 필히 참고 해주세요.)</dd>
            <dd>본 행사는 온라인몰 단독 행사로 매장 행사와 상이할 수 있습니다.</dd>
            <dd>증정품은 판매 상품과 별개로 한정 운영되며 조기 소진될 수 있습니다.</dd>
            <dd>고객님의 정확한 증정품 내역은 주문 후 '주문상세내역'에서 확인해주세요.</dd>
            <dd>반품 시 증정품도 함께 반품해주셔야 합니다.</dd>
            <dd>오늘드림으로 주문 시 증정품이 제공되지 않습니다.</dd>
            <dd>증정품은 증정 대상 회원에 한하여 제공됩니다.</dd>
            <dd>일부 제휴 업체 직배송 상품은 증정대상에서 제외됩니다.</dd>
            <dd>온라인몰 증정 소진 시 별도 고지 없이 행사 종료 될 수 있습니다.</dd>
            <dd>정확한 증정품 내역은 주문 후 '주문상세내역'에서 확인할 수 있습니다.</dd>
        </dl>
        <button class="layer_close">창 닫기</button>
    </div>
</div>
<!-- //증정품 팝업 -->


<!-- 3440969_PM작업시 오늘드림 레이어 팝업 노출 요청 건 -->
<div class="layer_pop_wrap w490" id="todayDeliveryNotice" style="z-index: 999;" data-ref-comparekey="todayDeliveryNotice"></div>
<!-- 당일배송 서비스 안내 (주문서)-->
<div class="layer_pop_wrap w490" id="infoTodayDeliveryOrder" style="z-index: 999;" data-ref-comparekey="infoTodayDeliveryOrder">
    <div class="layer_cont2">
        <h2 class="layer_title" name="todayD">오늘드림 서비스 안내</h2>
        <div class="layer_desc3">
            <ul class="info_dash_list fwb" id="o2oDlvSp1">
                <li>오전 10시~ 오후 8시까지 주문 시 당일 3시간 이내 배송되며,<br>오후 8시 ~ 다음날 오전 10시 주문 시 다음날 오후 1시까지 배송됩니다.</li>
                <li>오늘드림은 비대면 서비스로 별도의 연락없이 문앞에 배송합니다.</li>
                <li>당일배송 특성 상 상품 준비가 빠르게 진행되며, 상품 준비 단계에서는 주문을 취소하실 수 없습니다.</li>
                <li>교환/반품은 마이페이지 - 주문내역에서 교환/반품 신청을 통해 처리할 수 있습니다.</li>
                <li>온라인 단독 증정품은 제공되지 않으며, 온/오프라인 공통 증정품은 오늘드림 센터 재고 소진 시 증정되지 않습니다.</li>
                <li>부정확한 배송지 정보의 경우 반송처리 될 수 있으며, 반품비가 부과될 수 있습니다.</li>
                <li>일반 배송비 쿠폰은 오늘드림 주문에 적용되지 않습니다.</li>
                <li>기상상태에 따라 배송이 지연 또는 자동취소 될 수 있습니다.</li>
                <li>주문 확인 시 재고가 부족한 경우, 부득이하게 주문이 취소될 수 있습니다.</li>
            </ul>
            <!-- 미드나잇의 경우  -->
            <ul class="listBlit mgT15" id="o2oDlvSp5" style="display: none;">
                <li>당일 오후 8시까지 주문 시 당일 밤 10~12시 사이에 배송됩니다.</li>
                <li>오늘드림은 비대면 서비스로 별도의 연락없이 문앞에 배송합니다.</li>
                <li>당일배송 특성 상 상품 준비가 빠르게 진행되며, 상품 준비 단계에서는 주문을 취소하실 수 없습니다.</li>
                <li>교환/반품은 마이페이지 - 주문내역에서 교환/반품 신청을 통해 처리할 수 있습니다.</li>
                <li>온라인 단독 증정품은 제공되지 않으며, 온/오프라인 공통 증정품은 오늘드림 센터 재고 소진 시 증정되지 않습니다.</li>
                <li>부정확한 배송지 정보의 경우 반송 처리 될 수 있으며, 반품비가 부과될 수 있습니다.</li>
                <li>일반 배송비 쿠폰은 오늘드림 주문에 적용되지 않습니다.</li>
                <li>기상상태에 따라 배송이 지연 또는 자동취소 될 수 있습니다.</li>
                <li>주문 확인 시 재고가 부족한 경우, 부득이하게 주문이 취소될 수 있습니다.</li>
            </ul>
            <!-- 3!4!의 경우  -->
            <ul class="listBlit mgT15" id="o2oDlvSp4" style="display: none;">
                <li>당일 오후 1시까지 주문 시 당일 낮 3~4시 사이에 배송됩니다.</li>
                <li>오늘드림은 비대면 서비스로 별도의 연락없이 문앞에 배송합니다.</li>
                <li>당일배송 특성 상 상품 준비가 빠르게 진행되며, 상품 준비 단계에서는 주문을 취소하실 수 없습니다.</li>
                <li>교환/반품은 마이페이지 - 주문내역에서 교환/반품 신청을 통해 처리할 수 있습니다.</li>
                <li>온라인 단독 증정품은 제공되지 않으며, 온/오프라인 공통 증정품은 오늘드림 센터 재고 소진 시 증정되지 않습니다.</li>
                <li>부정확한 배송지 정보의 경우 반송 처리 될 수 있으며, 반품비가 부과될 수 있습니다.</li>
                <li>일반 배송비 쿠폰은 오늘드림 주문에 적용되지 않습니다.</li>
                <li>기상상태에 따라 배송이 지연 또는 자동취소 될 수 있습니다.</li>
                <li>주문 확인 시 재고가 부족한 경우, 부득이하게 주문이 취소될 수 있습니다.</li>
            </ul>
            <!-- 2020-08-10 o2oJJ 24H -->
            <ul class="listBlit mgT15" id="o2oDlvSp6" style="display: none;">
                <li>당일 오후 4시까지 주문 시 당일 자정 전까지 배송되며, 오후 4시 이후 주문 시 다음날 자정 전까지 배송됩니다.</li>
                <li>비대면으로 배송되어 별도의 연락없이 문앞에 배송합니다.</li>
                <li>배송 특성 상 상품 준비가 빠르게 진행되며, 상품 준비 단계에서는 주문을 취소하실 수 없습니다.</li>
                <li>교환/반품은 마이페이지 - 주문내역에서 교환/반품 신청을 통해 처리할 수 있습니다.</li>
                <li>부정확한 배송지 정보의 경우 반송 처리될 수 있으며, 반품비가 부과될 수 있습니다.</li>
                <li>기상상태에 따라 배송이 지연될 수 있습니다.</li>
                <li>주문 확인 시 재고가 부족하거나, 배송사의 사정에 따라 다시 택배 배송으로 변경될 수 있습니다.</li>
            </ul>
            <div class="layer_btn_area">
                <button class="btnMedium btnGreenW w120" id="stopToday" onclick="javascript:common.popLayer.todayDelivery.openQuickPopTodayForNoti();">오늘 하루 안보기</button>
                <button class="btnMedium fullGreen w120" id="btnConfirm" onclick="javascript:common.popLayer.todayDelivery.layerCloseForNoti();">확인</button>
                <button class="btnMedium btnGreenW w120" id="stopGiftToday" style="display:none;">오늘 하루 안보기</button>
                <button class="btnMedium fullGreen w120" id="btnGiftConfirm" style="display:none;">확인</button>
            </div>
        </div>
        <button class="layer_close type2" id="btnLayerClose" onclick="javascript:$(this).closest('.layer_pop_wrap').hide();$('.dimm').remove();">창 닫기</button>
        <button class="layer_close type2" id="btnGiftLayerClose">창 닫기</button>
    </div>
</div>
<!--// 당일배송 서비스 안내 -->

<!-- 선물포장 서비스 유의사항 -->
<div class="layer_pop_wrap w490" id="infoGiftBoxOrder" style="z-index: 999;" data-ref-comparekey="infoGiftBoxOrder">
    <div class="layer_cont2">
        <h2 class="layer_title">선물포장 서비스 </h2>
        <div class="layer_desc3">
            <!--
			<h5 class="stit">포장 가능한 상품들을 확인해주세요</h5>
			<div class="layer_scroll_box mgT10 type3">
				<div class="item_table_list">
					<table>
						<caption></caption>
						<colgroup><col style="width:85px" /><col style="width:*" /></colgroup>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
			-->
            <h5 class="stit mgT15">선물포장 서비스 유의사항</h5>
            <p class="img_info mgT15"><img src="/pc-static-root/image/comm/img_gift_info.jpg" alt=""></p>
            <ul class="dot_list mgT25">
                <li>상품의 사이즈와 수량 및 박스 보유여부에 따라  기프트박스가 랜덤으로 선택됩니다.</li>
                <li>상품 개별 포장이 아닌 포장 요청 상품들이 하나의 기프트박스에 포장되며,<br>함께 포장이 불가한 상품의 경우 포장에서 제외되어 발송 될 수 있습니다</li>
                <li>상품의 교환/반품은 온라인몰 교환/반품 절차와 동일합니다.<br>(매장에서 선물 포장 시 동봉되는 교환증은 제공되지 않습니다.)</li>
                <li>선물포장비는 오프라인 매장과 상이할 수 있습니다.</li>
                <li>다음의 경우 포장이 불가하며, 별도 알림 없이 포장 제외되어 배송됩니다, 이 경우 포장비는 예치금으로 환불되며 고객센터에서 안내 드릴 예정입니다.
                    <ul class="dash_list">
                        <li class="no">- 상품의 사이즈가 기프트 박스보다 큰 경우 <br>(기프트 박스 최대 사이즈 : 가로29*세로21*높이9)</li>
                        <li class="no">- 기프트 박스가 소진된 경우 (매장 별 상이)</li>
                    </ul>
                </li>
            </ul>
            <div class="layer_btn_area mgT25">
                <button class="btnMedium btnGreenW w120" id="stopToday" onclick="javascript:forder.orderForm.giftBoxPopToday();">오늘 하루 안보기</button>
                <button class="btnMedium fullGreen w120" id="btnConfirm" onclick="javascript:forder.orderForm.layerClose();">확인</button>
            </div>

        </div>
        <button class="layer_close type2" onclick="javascript:forder.orderForm.layerClose();">창 닫기</button>
    </div>
</div>
<div class="layer_pop_wrap w490" id="infoGiftBoxOrderIcon" style="z-index: 999;">
    <div class="layer_cont2">
        <h2 class="layer_title">선물포장 서비스 </h2>
        <div class="layer_desc3">
            <h5 class="stit">포장 가능한 상품들을 확인해주세요</h5>
            <div class="layer_scroll_box mgT10 type3">
                <div class="item_table_list">
                    <table>
                        <caption></caption>
                        <colgroup><col style="width:85px"><col style="width:*"></colgroup>
                        <tbody>
                        
                        </tbody>
                    </table>
                </div><!-- //item_table_list -->
            </div>
            <h5 class="stit mgT15">선물포장 서비스 유의사항</h5>
            <p class="img_info mgT15"><img src="/pc-static-root/image/comm/img_gift_info.jpg" alt=""></p>
            <ul class="dot_list mgT25">
                <li>상품 개별 포장이 아닌 한 박스에 대상 상품이 모두 포장됩니다.</li>
                <li>한 박스로 포장이 어려운 경우, 여러 개의 박스로 포장이 될 수 있습니다.</li>
                <li>상품의 사이즈와 수량에 따라 기프트 박스가 랜덤으로 선택됩니다. </li>
                <li>다음의 경우 포장이 불가하며 별도 알림없이 배송됩니다.
                    <ul class="dash_list">
                        <li class="no">- 상품의 사이즈가 기프트 박스보다 큰 경우 <br>(기프트 박스 최대 사이즈 : 가로29*세로21*높이9)</li>
                        <li class="no">- 상품의 수량이 과도하게 많은 경우</li>
                        <li class="no">- 기프트 박스가 소진된 경우 (매장 별 상이)</li>
                    </ul>
                </li>
            </ul>
            <div class="layer_btn_area mgT25">
                <button class="btnMedium fullGreen w120" id="btnConfirm" onclick="javascript:forder.orderForm.layerClose();">확인</button>
            </div>

        </div>
        <button class="layer_close type2" onclick="javascript:forder.orderForm.layerClose();">창 닫기</button>
    </div>
</div>
<!-- //선물포장 서비스 유의사항 -->

<!-- S 일구매제한 레이어 팝업 -->
<div class="layer_pop_wrap w480" id="buyLimit02" style="margin-left: -240px; z-index: 999;" tabindex="0">
    <div class="layer_cont2">
        <h2 class="layer_title alignCenter">안내</h2>
        <div class="layer_desc2">
            <!-- S 일구매제한 안내문구 -->
            <div>
                <p class="txtcu alignCenter">올리브영 온라인몰을 이용해 주셔서 감사합니다</p>
                <p class="txtcu mgT10 alignCenter">대량 구매 상담이 필요하신 경우</p>
                <p class="txtcu alignCenter">1:1 문의 남겨주시면 안내 해 드리겠습니다.</p>
            </div>
            <!-- S 일구매제한 안내문구 -->
            <div class="area2sButton">
                <a href="#none" class="btnGreen" onclick="location.href='https://www.oliveyoung.co.kr/store/counsel/getQnaForm.do';">1:1 문의하기</a>
                <a href="#none" class="btnGreen" onclick="javascript:forder.orderForm.layerClose();">확인</a>
            </div>
        </div>
        <button class="layer_close type2" onclick="javascript:forder.orderForm.layerClose();">창 닫기</button>
    </div>
</div>
<!-- E 일구매제한 레이어 팝업 -->

<!-- 1일 구매제한 레이어 팝업 -->
<div class="layer_pop_wrap w480" id="buyLimit" style="margin-left: -240px; z-index: 999;" tabindex="0">
    <div class="layer_cont2">
        <h2 class="layer_title">주문 안내</h2>
        <div class="layer_desc2">
            <div>
                <p class="txtcu"><span id="lp_goodsNm">$상품명</span>은 <span id="lp_ordLmtDay">$N</span>일 최대 <span id="lp_ordLmtMaxQty">$최대수량</span>개 까지만 구매 할 수 있습니다.</p>
                <p class="txtcu mgT10">대량구매를 원하시는 경우 고객센터(1522-0882) 또는 <a href="https://www.oliveyoung.co.kr/store/counsel/getQnaForm.do">1:1문의</a>를 이용해주세요.</p>

            </div>
            <div class="area2sButton">
                <a href="#none" class="btnGreen" onclick="javascript:forder.orderForm.layerClose();">확인</a>
            </div>
        </div>
        <button class="layer_close type2" onclick="javascript:forder.orderForm.layerClose();">창 닫기</button>
    </div>
</div>
<!-- //1일 구매제한 레이어 팝업 -->
<!-- 재판매 구매제한 레이어 팝업 -->
<div class="layer_pop_wrap w480" id="b2bLimit" style="margin-left: -240px; z-index: 999;" tabindex="0">
    <div class="layer_cont2">
        <h2 class="layer_title">주문 안내</h2>
        <div class="layer_desc2">
            <div>
                <p class="txtcu">고객님은 B2B 거래건으로 의심되어 올리브영 사이트 주문이 불가합니다.</p>
                <p class="txtcu">관련하여 문의사항이 있으시다면 고객센터로 문의 부탁드립니다.</p>
            </div>
            <div class="area2sButton">
                <a href="#none" class="btnGreen" onclick="javascript:forder.orderForm.layerClose();">확인</a>
            </div>
        </div>
        <button class="layer_close type2" onclick="javascript:forder.orderForm.layerClose();">창 닫기</button>
    </div>
</div>
<!-- //재판매 구매제한 레이어 팝업 -->
<!-- 재판매 구매제한 레이어 팝업 -->
<div class="layer_pop_wrap w480" id="evtLimit" style="margin-left: -240px; z-index: 999;" tabindex="0">
    <div class="layer_cont2">
        <h2 class="layer_title">주문 안내</h2>
        <div class="layer_desc2">
            <div>
                <p class="txtcu"><span id="evt_goodsNm">$상품명</span>은 구디백 구매 자격을 확인해주세요.</p>
            </div>
            <div class="area2sButton">
                <a href="#none" class="btnGreen" onclick="javascript:forder.orderForm.layerClose();">확인</a>
            </div>
        </div>
        <button class="layer_close type2" onclick="javascript:forder.orderForm.layerClose();">창 닫기</button>
    </div>
</div>
<!-- //재판매 구매제한 레이어 팝업 -->
<!-- 매장픽업서비스 안내 팝업 -->
<div class="layer_pop_wrap storePickPop" id="aboutPickup" style="z-index: 999;" data-ref-comparekey="aboutPickup">
    <div class="layer_cont">
        <h2 class="layer_title2">픽업 서비스 안내</h2>
        <div class="popCont">
            <p>온라인에서 주문 후 매장에 방문하시어 상품을 픽업하시는<br>
                서비스입니다.</p>
            <div class="process_box">
                <div class="processList prc01">
                    <span>상품구매</span>
                </div>
                <i class="next">다음단계</i>
                <div class="processList prc02">
                    <span>교환권받기</span>
                </div>
                <i class="next">다음단계</i>
                <div class="processList prc03">
                    <span>매장방문</span>
                </div>
                <i class="next">다음단계</i>
                <div class="processList prc04">
                    <span>상품픽업</span>
                </div>
            </div>
            <ul class="list_buldot">
                <li>매장별 보유 재고는 상이할 수 있습니다.</li>
            </ul>
            <div class="layer_btn_area">
                <button class="btnMedium fullGreen w120 layer_close" onclick="javascript:$('#aboutPickup').hide(); $('.dimm').remove();">확인</button>
            </div>
        </div>
        <button class="layer_close type2" onclick="javascript:$('#aboutPickup').hide(); $('.dimm').remove();">창 닫기</button>
    </div>
</div>
<!--// 매장픽업서비스 안내 팝업 -->
<!-- 오늘드림 배송비 안내 팝업 -->
<div class="layer_pop_wrap todayDlvCostNoti" id="todayDlvCostNoti" style="z-index: 999;" data-ref-comparekey="todayDlvCostNoti">
    <div class="layer_cont">
        <h2 class="layer_title2">오늘드림 배송비 안내</h2>
        <div class="pop-conts">
            <div class="scroll-area type2" style="max-height:490px;">
                <!-- 1set start -->
                <ul class="todayDelivery">
                    <li>
                        주문 후 +3시간 (빠름 배송)
                        <p>3만원 이상 주문 시 무료배송 / 3만원 미만 5,000원  </p>
                    </li>
                    <li>
                        낮 3-4시 (3!4! 배송)
                        <p>3만원 이상 주문 시 무료배송 / 3만원 미만 2,500원  </p>
                    </li>
                    <li>
                        밤 10-12시 (미드나잇 배송)
                        <p>3만원 이상 주문 시 무료배송 / 3만원 미만 2,500원  </p>
                    </li>
                </ul>
                <!-- //1set end -->

            </div>
        </div>
        <button class="layer_close type2" onclick="javascript:$('#todayDlvCostNoti').hide(); $('.dimm').remove();">창 닫기</button>
    </div>
</div>
<!-- 20210226 픽업 서비스 결제 안내 팝업 (픽업서비스 퍼블리싱) -->
<div class="layer_pop_wrap w490" id="resultPickup" style="z-index: 999;" data-ref-comparekey="resultPickup">
    <div class="pickup-wrap">
        <h2 class="layer_title">픽업 서비스 안내</h2>
        <div class="pickup-wrap__cont">
            <div class="service-noti">
                <ul class="pament-noti">
                    <li>바코드는 영업일 기준 최대 24시간 이내 발송됩니다.</li>
                    <li>픽업 바코드 수신 후 3일 내에 매장에 방문하여 상품을 찾아가시면 됩니다.</li>
                    <li>교환/반품은 마이페이지를 통해 접수 후 택배로 처리됩니다.</li>
                    <li>온라인 단독 증정품은 제공되지 않으며, 온/오프라인 공통 증정품은 매장 재고 소진 시 증정되지 않습니다.</li>
                    <li>주문 확인 시 재고가 부족한 경우, 부득이하게 주문이 취소될 수 있습니다.</li>
                </ul>
                <div class="layer_btn_area pickup-btn">
                    <button class="btnMedium fullGreen w155" id="resultPickupSubmit" onclick="javascript:order.pickup.pickupOrderSubmit();">확인</button>
                    <button class="btnMedium fullGreen w155" id="resultPickupGiftSubmit" style="display:none;">확인</button>
                </div>
            </div>
        </div>
        <button class="layer_close type2" onclick="javascript:common.popLayer.todayDelivery.layerCloseWithoutSend();">창 닫기</button>
    </div>
</div>
<!-- // 20210226 픽업 서비스 결제 안내 팝업 (픽업서비스 퍼블리싱) -->
<!-- 20210226 픽업 지점 선택 안내 팝업 (픽업서비스 퍼블리싱) -->
<div class="layer_pop_wrap w490" id="choicePickup" style="z-index: 999;" data-ref-comparekey="choicePickup">
    <div class="pickup-wrap">
        <h2 class="layer_title">픽업 서비스 안내</h2>
        <div class="pickup-wrap__cont">
            <div class="choice-noti">
                <p class="choice-store"><span class="choice-store__name">'동대문역사문화공원역점'</span>으로 픽업하시겠습니까?</p>
                <div class="layer_btn_area pickup-btn">
                    <button class="btnMedium fullGreen w155" onclick="javascript:selectPickupStore();">확인</button>
                </div>
            </div>
        </div>
        <button class="layer_close type2" onclick="javascript:$('#choicePickup').hide(); $('.dimm').remove();">창 닫기</button>
    </div>
</div>
<!-- // 20210226 픽업 지점 선택 안내 팝업 (픽업서비스 퍼블리싱) -->
<!-- 20210226 일부상품 재고 부족 상품 안내 팝업 (픽업서비스 퍼블리싱) -->
<div class="layer_pop_wrap w490" id="stockPickup" style="z-index: 999;" data-ref-comparekey="stockPickup">
    <div class="pickup-wrap">
        <h2 class="layer_title">픽업 서비스 안내</h2>
        <div class="pickup-wrap__cont">
            <div class="service-noti">
                <p class="service-noti__top">선택해주신 매장에 <span>재고 일부가 부족</span>합니다.<br>주문 가능한 상품만 결제하시겠습니까?</p>
                <dl class="stock-list">
                    <dt class="stock-list__tit">재고부족 상품 <span id="soldoutQty">3개</span></dt>
                    <dd class="stock-list__cnt">
                    </dd>
                </dl>
                <div class="layer_btn_area pickup-btn">
                    <button class="btnMedium fullGreen w155" onclick="javascript:order.pickup.getOrderFormPickup();">확인</button>
                </div>
            </div>
        </div>
        <button class="layer_close type2" onclick="javascript:$('#stockPickup').hide();$('.dimm').remove();">창 닫기</button>
    </div>
</div>
<!-- popLayerWrap -->
<div class="popLayerWrap" id="evtGiftLimit" style="display:none">
    <!-- popLayerArea -->
    <div class="popLayerArea">
        <!-- popInner -->
        <div class="popInner">
            <div class="popHeader">
                <h1 class="popTitle">주문 안내</h1>
                <a href="#" class="btnClose" onclick="common.popLayerClose('evtGiftLimit');return false;">닫기</a>
            </div>

            <div class="popContainer">
                <div class="popCont">
                    <p class="txtcu"><span id="gift_goodsNm">$상품명</span>은 선물이 불가한 상품입니다.</p>
                    <div class="btnType">
                        <button type="button" class="btnGreen" onclick="common.popLayerClose('evtGiftLimit');return false;">확인</button>
                    </div>
                </div>

            </div>

        </div>
        <!-- //popInner -->
    </div>
    <!-- //popLayerArea -->
</div>
<!-- //popLayerWrap -->
<!-- // 20210226 일부상품 재고 부족 상품 안내 팝업 (픽업서비스 퍼블리싱) -->
<!-- [3605144] 주문서 내 보유쿠폰 노출 기능 개발 요청 건 팝업 -->
<div class="layer_pop_wrap userCp" id="userCpPop" "="" style="">
<div class="layer_cont">
    <h2 class="layer_title">보유쿠폰&nbsp;(2)</h2>
    <!-- 스크롤 영역 -->
    <div class="popCont">
        <p>적용 가능한 쿠폰은 결제 금액에 따라 변경될 수 있습니다.</p>
        <div class="listCoupon_wrp mCustomScrollbar _mCS_2 mCS_no_scrollbar"><div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 0px;" tabindex="0"><div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
            <ul class="listCoupon" id="onCpnList" name="onCpnList">
                            <li data-cpn-status="disabled">
                                <div class="couponBox">
															<span class="coupon-inner price">	
														4,000
														
                                                            <em>원</em>				
												</span>			
                                </div>
                                <div class="couponInfo">
                                    <h3>[신규가입] 3만원 이상 4,000원 할인</h3>
                                    <p>            
                                            30,000원 이상
                                    </p>
                                    <p class="data">
                                        <!-- <span>사용기간</span> -->
                                        
                                            2023.10.20
                                            ~2023.11.19
                                        
                                    </p>
                                </div>
                            </li>
                        
                            <li data-cpn-status="disabled">
                                <div class="couponBox">
                                                                    
                                    <span class="coupon-inner today free"> 무료배송																		
												</span>															
                                </div>
                                <div class="couponInfo">
                                    <h3>[BABY] 오늘드림 무료배송 쿠폰</h3>
                                    <p>                                                                  
                                            10,000원 이상        
                                    </p>
                                    <p class="data">
                                        <!-- <span>사용기간</span> -->
                                        
                                            2023.07.04
                                            ~2023.12.31
                                        
                                    </p>
                                </div>
                            </li>  
            </ul>
        </div><div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
    </div>
    <!--// 스크롤 영역 -->
    <button class="layer_close">창 닫기</button>
</div>
</div>
<!-- [3605144] 주문서 내 보유쿠폰 노출 기능 개발 요청 건 팝업 -->

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