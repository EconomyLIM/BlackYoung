<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>블랙올리브영 온라인몰</title>
</head>
<body>	
	<script>
		// form check
		function formCheck() {
			if($("#btn_dlvp_exist").prop("checked")) {
				if($("#rmitNm_exist").val() == "") {
					alert($("#rmitNm_exist").attr("title"));
					$("#rmitNm_exist").focus();
					return false;
				} else if($("#rmitCellSctNo_exist").val() == "") {
					alert($("#rmitCellSctNo_exist").attr("title"));
					$("#rmitCellSctNo_exist").focus();
					return false;
				} else if($("#rmitCellTxnoNo_exist").val() == "") {
					alert($("#rmitCellTxnoNo_exist").attr("title"));
					$("#rmitCellTxnoNo_exist").focus();
					return false;
				} else if($("#rmitCellEndNo_exist").val() == "") {
					alert($("#rmitCellEndNo_exist").attr("title"));
					$("#rmitCellEndNo_exist").focus();
					return false;
				} else if($("#stnmRmitPostNo_exist").val() == "") {
					alert($("#stnmRmitPostNo_exist").attr("title"));
					return false;
				} else if($("#tempRmitDtlAddr_exist").val() == "") {
					alert($("#tempRmitDtlAddr_exist").attr("title"));
					return false;
				} 
			} else if($("#btn_dlvp_new").prop("checked")) {
				if($("#dlvpNm_new").val() == "") {
					alert($("#dlvpNm_new").attr("title"));
					$("#dlvpNm_new").focus();
					return false;
				} else if($("#rmitNm_new").val() == "") {
					alert($("#rmitNm_new").attr("title"));
					$("#rmitNm_new").focus();
					return false;
				} else if($("#rmitCellSctNo_new").val() == "") {
					alert($("#rmitCellSctNo_new").attr("title"));
					$("#rmitCellSctNo_new").focus();
					return false;
				} else if($("#rmitCellTxnoNo_new").val() == "") {
					alert($("#rmitCellTxnoNo_new").attr("title"));
					$("#rmitCellTxnoNo_new").focus();
					return false;
				} else if($("#rmitCellEndNo_new").val() == "") {
					alert($("#rmitCellEndNo_new").attr("title"));
					$("#rmitCellEndNo_new").focus();
					return false;
				} else if($("#stnmRmitPostNo_new").val() == "") {
					alert($("#stnmRmitPostNo_new").attr("title"));
					$("#stnmRmitPostNo_new").focus();
					return false;
				} else if($("#tempRmitDtlAddr_new").val() == "") {
					alert($("#tempRmitDtlAddr_new").attr("title"));
					$("#tempRmitDtlAddr_new").focus();
					return false;
				}
			}
			
			if('${quick}' == 'Y') {
				if($("#o2o_dlv_area > td > table > tbody  input:checked").length < 1) {
					alert("배송 구분을 선택하세요");
					return false;
				}
			} 
			
			if($("#btn_door_manner_temp1").prop("checked") && $("#door_type_exist").val() == "") {
				alert("공동현관 비밀번호를 입력하세요.");
				$("#door_type_exist").focus();
				return false;
			} else if($("#btn_door_manner_temp2").prop("checked") && $("#door_type_exist").val() == "") {
				alert("경비실 호출 방법을 입력하세요.");
				$("#door_type_exist").focus();
				return false;
			} else if($("#btn_door_manner_temp4").prop("checked") && $("#door_type_exist").val() == "") {
				alert("기타 상세 내용을 입력하세요.");
				$("#door_type_exist").focus();
				return false;
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
		
		let dimm = $("<div>").addClass("dimm"); 
		function popupOpen(popup) {
			$('#'+popup).show();
			popupCenter($('#'+popup));
			$('body').append(dimm);
		}
		
		function closeWindow() {
            window.close();
        }
	</script>

	<script>
		$(function() {
			// 유저의 쿠폰 가져오기
			$.ajax({
				type : 'get'
				, cache: false
				, url : '<c:url value="/store/getHasCoupon"/>'
				, dataType : 'json'
				, success : function(data) {
					//console.log(data)
					
					if(data.length == 0) {
						$(".couponView").text(`보유쿠폰 (0)`);
						$("#userCpPop > div > h2").text(`보유쿠폰 (0)`);
					}
					
					$(".couponView").text(`보유쿠폰 (\${data.length})`);
					$("#userCpPop > div > h2").text(`보유쿠폰 (\${data.length})`);
	            }
				, error : function (data, textStatus) {
					console.log('error');
	            }
			}); 
			
			// 연락처1, 연락처 2 설정
			let tel1 = '${dto.deliveryTel}';
			let tel1s = tel1.split("-");
			$("#rmitCellSctNo_exist").val(tel1s[0]);
			$("#rmitCellTxnoNo_exist").val(tel1s[1]);
			$("#rmitCellEndNo_exist").val(tel1s[2]);
			
			
			let tel2 = '${dto.deliveryTel2}';
			if(tel2 != null && tel2 != "") {
				let tel2s = tel2.split("-");
				$("#rmitTelRgnNo_exist").val(tel2s[0]);
				$("#rmitTelTxnoNo_exist").val(tel2s[1]);
				$("#rmitTelEndNo_exist").val(tel2s[2]);
			}
			
			// 신규 배송지 클릭 했을 때
			$("#btn_dlvp_new").on("click", function() {
				$(".new_order_area").show();
				$("#dlvpInfo > tbody > tr").not(".new_order_area").hide();
				$("#dlvpInfo > tbody > tr:nth-child(1)").show();
				$(".new_order_area input,select").prop("disabled", false);
				$("#dlvpSelect").hide();
			});
			
			// 기본 배송지 클릭 했을 때
			$("#btn_dlvp_exist").on("click", function() {
				$(".new_order_area").hide();
				$("#dlvpInfo > tbody > tr").not(".new_order_area").show();
				$("#o2o_dlv_area").hide();
				$("#pickupStore").hide();
				$("#pickupStoreList").hide();
				$(".new_order_area input,select").prop("disabled", true);
				$("#dlvpSelect").prop("disabled", false).show();
				$("#rmitCellSctNo_exist").prop("disabled", false);
				$("#rmitTelRgnNo_exist").prop("disabled", false);
			});
			
			// 우편 번호 api
			$("#search-zipcode-pop_exist_r").on("click", function() {
				new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수

		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                $("#stnmRmitPostNo_exist").val(data.zonecode);
		                $("#stnmPostAddr_exist").text(roadAddr);
		                $("#baseAddr_exist").text(data.jibunAddress);

		            }
		        }).open();
			});
			
			// 배송지 선택에서 바뀔 시 ajax 처리
			$("#dlvpSelect").on("change", function() {
				$.ajax({
					type : 'get'
					, cache: false
					, url : '<c:url value="/store/getDelivery"/>'
					, dataType : 'json'
					, data : { deliveryId : $(this).val() }
					, success : function(data) {
						$("#dlvpNm_exist_span").text(data.deliveryName);
						$("#rmitNm_exist").val(data.deliveryRecipient);
						
						let tel1 = data.deliveryTel;
						let tel1s = tel1.split("-");
						$("#rmitCellSctNo_exist").val(tel1s[0]);
						$("#rmitCellTxnoNo_exist").val(tel1s[1]);
						$("#rmitCellEndNo_exist").val(tel1s[2]);
						
						
						let tel2 = data.deliveryTel2;
						if(tel2 != null && tel2 != "") {
							let tel2s = tel2.split("-");
							$("#rmitTelRgnNo_exist").val(tel2s[0]);
							$("#rmitTelTxnoNo_exist").val(tel2s[1]);
							$("#rmitTelEndNo_exist").val(tel2s[2]);
						}
						
						$("#stnmRmitPostNo_exist").val(data.deliveryZipcode);
						$("#stnmPostAddr_exist").text(data.deliveryRoadAddr);
						$("#baseAddr_exist").text(data.deliveryAddr);
						$("#tempRmitDtlAddr_exist").val(data.deliveryDetailAddr);
						
						let spans = $("#tabDoorInfo > tbody > tr:nth-child(1) > td > span");
						for (var i = 0; i < spans.length; i++) {
							if($(spans[i]).find("input").val() == data.requestSelect) {
								$(spans[i]).find("input").prop("checked", true);
								break;
							}
						}
						
						$("#door_type_exist").val(data.requestContent);
						
						// console.log(data.delivery_id);
						// console.log(data);
		            }
					, error : function (data, textStatus) {
						console.log('error');
		            }
				});
			});
			
			// 출입방법 dto 설정
			let spans = $("#tabDoorInfo > tbody > tr:nth-child(1) > td > span");
			for (var i = 0; i < spans.length; i++) {
				if($(spans[i]).find("input").val() == '${dto.requestSelect}') {
					$(spans[i]).find("input").prop("checked", true);
					break;
				}
			}
			$("#door_type_exist").val('${dto.requestContent}');
			
			// 배송 메시지 -> 직접 입력하기 눌렀을 때
			$("#mbrMemoCont").on("change", function() {
				if($(this).val() == "직접입력하기") {
					$("#pickupHide5 > table:nth-child(2) > tbody > tr > td > input").show();
				} else {
					$("#pickupHide5 > table:nth-child(2) > tbody > tr > td > input").hide();
				}
			});
			
			// 공동현관출입방법 체크 박스 클릭 시
			$("#btn_door_manner_temp1").on("click", function() {
				$("#visitTypeDescExist").css("display", "table-row")
				$("#visitTypeDescExist > th").text("공동현관 비밀번호");
			});
			
			$("#btn_door_manner_temp2").on("click", function() {
				$("#visitTypeDescExist").css("display", "table-row")
				$("#visitTypeDescExist > th").text("경비실 호출 방법");
			});
			
			$("#btn_door_manner_temp3").on("click", function() {
				$("#visitTypeDescExist").hide();
			});
			
			$("#btn_door_manner_temp4").on("click", function() {
				$("#visitTypeDescExist").css("display", "table-row")
				$("#visitTypeDescExist > th").text("기타 상세 내용");
			});
	
			// 포인트, 기프트카드 정리
			$("#oyGiftCard_btn").on("click", function() {
				alert("등록된 기프트 카드가 없습니다.");
			});
			
			$("#cjGiftCard_btn").on("click", function() {
				alert("등록된 기프트 카드가 없습니다.");
			});
			
			// 포인트 적용 버튼을 눌렀을 때
			$("#cjonePnt_btn").on("click", function() {
				if(${userDto.userPoint} < 1000) {
					alert("CJONE포인트는 최소 1,000원 이상\n보유 시 사용 가능합니다.");
					return;
				}	
			});		
					
			// 가지고 있는 포인트 표시
			$("#cjonePnt").text('${userDto.userPoint}');
			
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
			
			
			// 결제하기 버튼 클릭 했을 때
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
						, cache: false
						, url : '/Black_OY/olive/getProStockAjax.do'
						, dataType : 'json'
						, data : { products : params }
						, success : function(data) {
							if(data.cnt == 0) {
								alert("현재 상품의 재고가 소진되었습니다.");
								location.href = '<c:url value="/"/>';
							}
							// console.log(data);
			            }
						, error : function (data, textStatus) {
							console.log('error');
			            }
					});
					
					closeWindow();
					$("#orderForm").submit();
				}
			});
		
			// 상품이 로딩되고 최종 결제 정보에 업데이트하기
			let pur_price = $(".pur_price");
			let totalPrice = 0;
			for (var i = 0; i < pur_price.length; i++) {
				totalPrice += parseInt($(pur_price[i]).find("span").data("price"));
			}
			$("#orderForm > div.order_payment_box > div.right_area > ul > li:nth-child(1) > span.tx_cont > span")
				.text(totalPrice);
			$("#totPayAmt_sum_span").text(totalPrice.toLocaleString());
			$("#totalPrice").val(totalPrice);
			$("#totalPay").val(totalPrice);
			

			// 오늘드림을 누르고 왔을 때
			let quickYN = '${quickYN}';
			if(quickYN == 'Y') {
				$("#o2o_dlv_area").show();
				$("#dlvpInfo > tbody > tr:nth-child(1)").hide();
				$(".sub-title2.mgT15.o2o_24h_chk_area").hide();
				$("#search-zipcode-pop_exist_r").hide();
			}
			
			// 오늘드림, 픽업 버튼을 눌렀을 때 
			$("#todayToggle").on("click", function() {
				$("#pickupDlvpNm").show();
				$("#o2o_dlv_area").show();
				$("#pickupHide1").show();
				$("#pickupHide2").show();
				$("#pickupHide3").show();
				$("#pickupHide4").show();
				$("#pickupStoreList").hide();
				$("#pickupYN").val("N");
			});
			
			$("#pickupToggle").on("click", function() {
				$("#dlvpInfo > tbody > tr").hide();
				$("#pickupStoreList").show();
				$("#pickupYN").val("Y");
			});
			
			// 선물포장 서비스 팝업창
			$("#gift_wrapping_01").on("click", function() {
				$("#infoGiftBoxOrder").show();
				popupCenter($("#infoGiftBoxOrder"));
				$("body").append(dimm);
			});
			
			
			$("#infoGiftBoxOrder > div > button").on("click", function() {
				$("#infoGiftBoxOrder").hide();
				$(".dimm").remove();
			});
			
			$("#btnConfirm1").on("click", function() {
				$("#infoGiftBoxOrder").hide();
				$(".dimm").remove();
			});
			
			
			
			// 오늘드림 여부 Y라면 
			// 오늘드림 시간 설정
			let d = new Date();
			let month = d.getMonth()+1;
			let date = d.getDate();
			let h = d.getHours();
			let m = d.getMinutes();
			
			
			$("#dlv_time1").text(`\${h+2}:\${m} ~ \${h+3}:\${m}`);
			$("#dlv_time2").text("15:00 ~ 16:00");
			
			if(h >= 20 || h < 11) {
				$("#dlv_time1").text("13:00 ~ 14:00");
			}
			
			$("#dlv_today").text(`\${month}/\${date}일 (\${"일월화수목금토".charAt(d.getDay())})`);
			$("#dlv_nextday").text(`\${month}/\${date+1}일 (\${"일월화수목금토".charAt(d.getDay()+1)})`);
			
			// 오늘 드림 라디오버튼 처리
			// 빠른배송
			if(h >= 20) {
				$("#dlv_nextdayDlvSp1 > input").prop("disabled", false);
			} else {
				$("#dlv_todayDlvSp1 > input").prop("disabled", false);
			}
			
			// 34배송
			if(h >= 13) {
				$("#dlv_nextdayDlvSp2 > input").prop("disabled", false);
			} else {
				$("#dlv_todayDlvSp2 > input").prop("disabled", false);
			}
			
			// 미드나잇
			if(h >= 20) {
				$("#dlv_nextdayDlvSp3 > input").prop("disabled", false);
			} else {
				$("#dlv_todayDlvSp3 > input").prop("disabled", false);
			}
			
			// 저녁 8시 넘어가면 픽업 버튼 숨기기
			if(h >= 20) {
				$("#pickupToggle").hide();
			}
			
			
			// 오늘 드림 시 배송비 
			$("#o2o_dlv_area > td > table > tbody > tr input").on("click", function() {
				$("#dlv_dlexPayAmt1").show();
			});
			
			// 오늘드림 배송비 업데이트
			let product_price = $("#orderForm > div.order_payment_box > div.right_area > ul > li:nth-child(1) > span.tx_cont > span").text()
			let deli_price;
			
			$("tbody input").on("click", function() {
				if(product_price < 30000) {
					let price = $(this).data("price")
					$("#dlv_dlexPayAmt2").text("배송비 : " + price + "원");
					$("#dlexPayAmt_span").text(price);
					$("#totPayAmt_sum_span").text(totalPrice + price);
					$("#totDlexAmt_span").text(price);
					$("#dlexAmt_hd_base").text(price);
					$("#0_0").text(price);
					$("#totDlexAmt_hd_span").text(price);
					$("#hdDlexList > li.total > div > span.tx_cont > span:nth-child(3)").hide();
					$("#hdDlexList > li:nth-child(1) > div.add_cont > span.tx_cont > span:nth-child(3)").show();
				}
			})
			
			
			
			
		});
		
		
	</script>


<div id="Wrapper">
	<div id="skip_navi"><a href="#Container">본문바로가기</a></div>
<form name="ssologinfrm" action="https://www.oliveyoung.co.kr/store/login/ssoLogin.do" method="post">
<input type="hidden" id="cjssoq" name="cjssoq">
</form>

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
		<!--// title_box -->
		
		<form name="pickupOrderForm" id="pickupOrderForm">
		</form>
		<form name="orderForm" id="orderForm" method="post" action="<c:url value='/store/getOrderForm'/>" target="setOrderRequest">
			<input type="hidden" id="deliveryId" name="deliveryId" value="${dto.deliveryId }">
			<input type="hidden" id="quickYn" name="quickYn" value="Y">
			<input type="hidden" id="click" name="click" value="${click}">
			<input type="hidden" id="point_price" name="point_price" value="0">
			<input type="hidden" id="pickupDirectYn" name="pickupDirectYn" value="N">
			<input type="hidden" id="quickInfoYn" name="quickInfoYn" value="Y">
			<input type="hidden" id="ocbValidChk" name="ocbValidChk" value="N">
			
			<input type="hidden" id="o2oVisitTypeVal" name="o2oVisitTypeVal" value="4">
			<!-- 최근 직접 입력한 배송메시지 카운트 : 직접 입력한 배송메시지가 있으면 3개 까지 화면에 노출한다.-->
			<input type="hidden" id="mhCnt" name="mhCnt" value="0">

			<!-- 2020-08-06 o2oJJ 24H 주문 가능한지 여부, 주문서 진입시 오늘드림인지 여부 -->
			<input type="hidden" id="orgIs24HCheckable" name="orgIs24HCheckable" value="Y">
			<input type="hidden" id="is24HCheckable" name="is24HCheckable" value="Y">
			<input type="hidden" id="orgQuickYn" name="orgQuickYn" value="N">
			<input type="hidden" id="quick24hdisplay" name="quick24hdisplay" value="Y">
			<input type="hidden" id="default24HHardSet" name="default24HHardSet" value="N">
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

			<!-- 배송지 정보 -->
			<div class="title_wrap">
				<h2 class="sub-title2">배송지정보</h2>
				<p class="sub_area" id="pickupHide6">
					<input type="checkbox" id="setBaseDlvpYn" name="baseDlvpYn" value="Y" checked="checked"> 
					<label for="setBaseDlvpYn">기본 배송지 설정</label>
				</p>
			</div>
			<table class="tbl_inp_form important" id="dlvpInfo"><!-- 2017-01-18 클래스 추가 -->
				<caption></caption>
				<colgroup>
					<col style="width:170px">
					<col style="width:*">
				</colgroup>
				<tbody>

				<tr>
					<th scope="row">배송지선택</th>
					<td>
						<span class="chk_area mgzero">
							<input type="radio" id="btn_dlvp_exist" name="inpAddrSel" value="" targetid="exist" checked>
							<label for="btn_dlvp_exist">기존 배송지</label>
						</span>
						<!-- 2020-08-04 o2oJJ 24H 화면 제어로 인한 주석 처리 -->
						
						<span class="chk_area">
							<input type="radio" id="btn_dlvp_new" name="inpAddrSel" value="" targetid="new">
							<label for="btn_dlvp_new">신규 배송지</label>
						</span>
						

						<div class="show" id="dlvpSelect_div">
							<!--[오늘드림 구매에서 일반배송으로 주문서 들어왔을때 선택한 배송지 셋팅을 위해서 사용 :jwkim]-->
							<input type="hidden" name="selectDlvSeq" value="">
							<select id="dlvpSelect" name="mbrDlvpSeq" class="selH28" title="배송지를 선택해주세요." style="width:200px">
							<c:forEach items="${userDeliveryList }" var="list">
								<option value="${list.deliveryId }" selected>${list.deliveryName }</option>
							</c:forEach>
							</select>
						</div>
					</td>
				</tr>

				<!-- // 2020-08-04 o2oJJ 24H 추가 -->

					<!--// 2019-11-15 추가 (오늘드림배송 시)-->
					<tr type="exist" style="display: table-row;">
						<th scope="row">배송지명</th>
						<td id="dlvpNm_exist_span">${dto.deliveryName }</td>
						<input type="hidden" id="dlvpNm_exist" name="dlvpNm" value="${dto.deliveryName }" title="배송지명을 입력해주세요." style="width:200px" this="배송지명은">
					</tr>

				<tr id="o2o_dlv_area" style="display:none;">
					<input type="hidden" id="dueDt" value="2023/11/13 12:17:38">
					<input type="hidden" id="o2oDeliveryScheduleDt" name="o2oDeliveryScheduleDt" value="">
					<th scope="row"><label for="inpAddrNm">배송방법</label></th>
					<td class="todayTime">
						<div style="display:none;">
							<input type="radio" id="btn_dlvp_temp1" name="o2oDlvSp" value="1">
							<input type="radio" id="btn_dlvp_temp3" name="o2oDlvSp" value="4">
							<input type="radio" id="btn_dlvp_temp2" name="o2oDlvSp" value="5">
							<input type="radio" id="btn_dlvp_temp4" name="o2oDlvSp" value="2">
							<input type="radio" id="btn_dlvp_temp6" name="o2oDlvSp" value="6">
						</div>
						<div class="toggleMenu">
							<ul>
								<li class="active"><a href="javascript:void(0);" title="오늘드림"><span>오늘드림</span></a></li>
								<li id="pickupToggle" data-attr="배송방법^픽업"><a href="javascript:void(0);" title="픽업"><span>픽업</span></a></li>
							</ul>
								<input type="hidden" name="pickupYN" id="pickupYN" value="N">
						</div>

						<table class="timeTable">
							<colgroup>
								<col width="">
								<col width="140px">
								<col width="140px">
							</colgroup>
							<thead>
							<tr>
								<th>배송 시간대</th>
								<th id="dlv_today"></th>
								<th id="dlv_nextday"></th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td id="dlv_time1">11:00 ~ 13:00</td>
								<td id="dlv_todayDlvSp1">
									<input type="radio" class="rad18" name="today_param" data-price="2500" disabled="" value="금일-빠름배송">
								</td>
								<td id="dlv_nextdayDlvSp1">
									<input type="radio" class="rad18" name="today_param" data-price="2500" disabled="" value="익일-빠름배송">
								</td>
							</tr>
							<tr>
								<td id="dlv_time2"></td>
								<td id="dlv_todayDlvSp2">
									<input type="radio" class="rad18" name="today_param" data-price="5000" disabled="" value="금일-34배송">
								</td>
								<td id="dlv_nextdayDlvSp2">
									<input type="radio" class="rad18" name="today_param" data-price="5000" disabled="" value="익일-34배송">
								</td>
							</tr>
							<tr>
								<td id="dlv_time3">22:00 ~ 24:00</td>
								<td id="dlv_todayDlvSp3">
									<input type="radio" class="rad18" name="today_param" data-price="2500" disabled="" value="금일-미드나잇배송">
								</td>
								<td id="dlv_nextdayDlvSp3">
									<input type="radio" class="rad18" name="today_param" data-price="2500" disabled="" value="익일-미드나잇배송">
								</td>
							</tr>
							</tbody>
						</table>
						<p class="charge" id="dlv_dlexPayAmt1" style="display:none;"><span id="dlv_dlexPayAmt2">배송비 : 0원</span><a href="javascript:void(0);" onclick="popupOpen('todayDlvCostNoti')"></a></p>
						<ul class="notice">
정							<li>모든 배송은 비대면으로 진행됩니다.</li>
						</ul>
					</td>
				</tr>

				<!-- 픽업매장 -->
				<input type="hidden" id="pickupYn" value="N">
				<input type="hidden" id="pickupApiYn" value="N">
				<input type="hidden" id="pickupInitYn" value="N">

				
				<input type="hidden" id="pickupStrNo" name="pickupStrNo" value="">
				<tr id="pickupStore" style="display:none;">
					<th scope="row" style="border-top: 2px solid #d6d6d6;">픽업 매장</th>
					<td class="pickup-area" style="border-top: 2px solid #d6d6d6;">
						<div class="pickup-store">
							<div class="store-tit">
								<strong class="store-name" id="selectedStrNm1">동대문역사문화공원역점</strong>
								<span class="store-distance" id="selectedStrDist">0.1km</span>
								<a href="javascript:forder.orderForm.dlvpInfo.changePickupStore();" class="store-change">매장변경</a>
							</div>
							<div class="store-info" id="selectedStrInfo">
								<p class="store-info__addr" id="selectedStrAddr">세종특별자치시 세종특별자치시 대평로 71 펠리체타워1 1층 110,111호</p>
								<p class="store-info__time"><strong>영업시간</strong>
									평일 <span id="selectedStrMon">08:00~22:30</span> <span>|</span>
									토요일 <span id="selectedStrSat">10:00~20:00</span> <span>|</span>
									공휴일 <span id="selectedStrLhld">10:00~22:00</span></p>
								<p class="noti-covid19">코로나 19로 인해 매장별 영업시간이 다를 수 있습니다.</p>
							</div>
						</div>
						<div class="pickup-store-about">
							<ul class="pickup-store-about__list">
								<li>바코드는 영업일 기준 <span>최대 24시간 이내</span> 발송됩니다.</li>
								<li>바코드를 수신 받으신 이후 <span id="selectedStrNm2">‘동대문역사문화공원역점’</span>으로 방문해주세요.</li>
								<li>바코드 수신 후 3일 이내 매장에 방문하지 않으실 경우 주문은 자동 취소됩니다.</li>
							</ul>
						</div>
					</td>
				</tr>
				
				
				<!-- // 픽업매장 -->

				<tr id="pickupStoreList" style="display:none;">
					<th scope="row" style="border-top: 2px solid #d6d6d6;">배송방법</th>
					<td class="pickup-area" style="border-top: 2px solid #d6d6d6;">
						<div class="contTopArea">
							<div class="toggleMenu">
								<ul>
									<li id="todayToggle" data-attr="배송방법^오늘드림"><a href="javascript:void(0);" title="오늘드림"><span>오늘드림</span></a></li>
									<li class="active"><a href="javascript:void(0);" title="픽업"><span>픽업</span></a></li>
								</ul>
							</div>
							<div class="pickupTxt">픽업 서비스 안내<a href="javascript:void(0);" title="픽업 서비스 안내" onclick="fnLayerSet('aboutPickup', 'open');"></a></div>
						</div>
						<!-- 지도 컨텐츠 -->
						<div class="pickup-box">
							<!-- 왼쪽 -->
							<div class="pickup-area__left">
								<ul class="pickup-tab" id="pickupTabArea">
									<li class="pickup-tab__list active" data-attr="픽업_매장선택^최근 이용 매장"> <!-- 활성화 클래스 active -->
										<a href="javascript:;">최근 이용매장</a>
									</li>
									<li class="pickup-tab__list" data-attr="픽업_매장선택^관심 매장">
										<a href="javascript:;">관심매장</a>
									</li>
									<li class="pickup-tab__list" data-attr="픽업_매장선택^그 외 매장">
										<a href="javascript:;">그 외 매장</a>
									</li>
								</ul>
								<p class="pickup-noti" style="display:none;">최근 이용 매장이 없습니다. 아래 매장을 이용해보세요!</p>
								<div class="pickup-cnt">
									<div class="indif-store" style="display:none;">
										<p class="indif-store__top"><span id="pickupMbrNm"></span>님이<br>등록하신 관심매장이 없습니다.</p>
										<p class="indif-store__bottom">자주 가는 매장을 관심매장으로 등록하면 매장소식을<br>빠르게 받아 보실 수 있습니다.</p>
									</div>
									<!-- 매장 검색 박스 -->
									<div class="search-store__top" style="display:none;">
										<div class="search-box"> <!-- 검색 단어 입력시 포함한 단어가 있을 경우 on 클래스 추가 -->
											<input type="text" class="search-box__inp" name="searchWord" onkeyup="javascript:order.pickup.searchPickupStoreList(event);" value="" title="매장명/주소 입력 (ex. 명동 또는 퇴계로)" placeholder="매장명/주소 입력 (ex. 명동 또는 퇴계로)">
											<div class="search-box__auto">
											</div>
										</div>
										<p class="search-store__top--noti">가까운 매장에서 픽업을 이용해보세요!</p>
										<!-- 검색후 문구 -->
										<p class="search-store__top--result" style="display:none;"></p>
										<!-- // 검색후 문구 -->
									</div>
									<!-- // 매장 검색 박스 -->
									<div id="storeListArea">
									</div>
								</div>
							</div>
							<!-- // 왼쪽 -->
							<!-- 오른쪽 -->
							<div class="pickup-area__right api_mapArea" id="map">

							</div>
							<!-- // 오른쪽 -->
						</div>
					</td>
				</tr>
				<!-- //[3659045] 오늘드림 주문서 페이지 UI 변경 건 -->


				<tr id="pickupHide1" type="exist" style="display: table-row;">
					<th scope="row">받는분</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<input type="text" id="rmitNm_exist" name="rmitNm" value="${dto.deliveryRecipient }" class="inpH28" title="받는분 이름을 입력해주세요." style="width:200px" this="받는분 이름은">
						<span class="chk_area"><input type="checkbox" id="copyToDlvp_exist" targetid="exist"> <label for="copyToDlvp_exist">주문자정보와 동일</label></span>
					</td>
				</tr>
				<tr class="sumtr1" id="pickupHide2" type="exist" style="display: table-row;">
					<th scope="row">연락처1</th>
					<td class="imp_data">
						<select id="rmitCellSctNo_exist" name="rmitCellSctNo" class="selH28" title="연락처1 앞자리를 선택해주세요." style="width:90px">
							<option value="" selected="selected">선택</option>
							
								<option value="010">010</option>
							
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
						- <input type="text" id="rmitCellTxnoNo_exist" name="rmitCellTxnoNo" value="" class="inpH28" title="연락처1 가운데 자리를 입력해주세요." this="연락처1 가운데 자리는" style="width:90px">
						- <input type="text" id="rmitCellEndNo_exist" name="rmitCellEndNo" value="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요." this="연락처1 마지막 자리는" style="width:90px">
						<span class="info_security"><button type="button" class="chk_area" onclick="popupOpen('securityInfo')">안심번호 서비스 안내</button></span>
					</td>
				</tr>
				<tr class="sumtr2" id="pickupHide3" type="exist" style="display: table-row;">
					<th scope="row">연락처2</th>
					<td>
						<select id="rmitTelRgnNo_exist" name="rmitTelRgnNo" class="selH28" title="연락처2 앞자리를 선택해주세요." style="width:90px">
							<option value="">선택</option>
							
								<option value="010">010</option>
							
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
						- <input type="text" id="rmitTelTxnoNo_exist" name="rmitTelTxnoNo" value="" class="inpH28" title="연락처2 가운데 자리를 입력해주세요." this="연락처2 가운데 자리는" style="width:90px">
						- <input type="text" id="rmitTelEndNo_exist" name="rmitTelEndNo" value="" class="inpH28" title="연락처2 마지막 4자리를 입력해주세요." this="연락처2 마지막 자리는" style="width:90px">
					</td>
				</tr>
				<tr id="pickupHide4" type="exist" style="display: table-row;">
					<th scope="row">주소</th>
					<td class="imp_data"><!-- 2017-01-25 수정 : 클래스 추가 -->
						<input type="text" id="stnmRmitPostNo_exist" name="deliveryZipcode" value="${dto.deliveryZipcode }" class="inpH28" title="우편번호를 검색해주세요." style="width:90px" readonly="readonly">
						<input type="hidden" id="rmitPostNo_exist" name="stnmRmitPostNo" value="" title="우편번호를 검색해주세요.">
						<button type="button" class="btnSmall wGreen w100" id="search-zipcode-pop_exist" style="display:none;" data-attr="배송지정보^1_주소"><span>우편번호 찾기 (기존)</span></button>
						<button type="button" class="btnSmall wGreen w100" id="search-zipcode-pop_exist_r" data-attr="배송지정보^1_주소"><span>우편번호 찾기</span></button>
						
						<div class="addr_box">
							<input type="hidden" id="stnmRmitPostAddr_exist" name="stnmRmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly">
							<input type="hidden" id="rmitBaseAddr_exist" name="rmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly">
							<!-- 주소 입력 시 보여지는 부분 -->
							<p class="addr_new">
								<span class="tx_tit">도로명</span> :
								<span class="tx_addr" id="stnmPostAddr_exist">${dto.deliveryRoadAddr }</span><!--  도로명주소를 넣어주세요 -->
								<input type="hidden" name="region" id="region" value="${dto.deliveryRoadAddr }">
							</p>
							<p class="addr_old">
								<span class="tx_tit">지번</span> :
								<span class="tx_addr" id="baseAddr_exist">${dto.deliveryAddr }</span><!--  지번주소를 넣어주세요 -->
							</p>
							<!--// 주소 입력 시 보여지는 부분 -->
						</div>
						<input type="text" id="tempRmitDtlAddr_exist" value="${dto.deliveryDetailAddr }" class="inpH28" title="상세주소를 입력해주세요." style="width:500px;" this="상세 주소는" maxlength="30">
						<input type="hidden" id="stnmRmitDtlAddr_exist" name="stnmRmitDtlAddr" value="." orgvalue="." class="inpH28" title="상세주소를 입력해주세요." style="width:500px" this="상세 주소는">
						<input type="hidden" id="rmitDtlAddr_exist" name="rmitDtlAddr" value="." orgvalue="." class="inpH28" title="상세주소를 입력해주세요." style="width:500px">
						<input type="hidden" id="emdNm_exist" name="emdNm" value="신림동">
						<input type="hidden" id="admrNm_exist" name="admrNm" value="신사동">
					</td>
				</tr>
				
				<!-- 2017-01-18 추가 (신규 배송지 선택 시) -->
				<tr type="new" class="new_order_area" style="display: none;">
					<th scope="row">배송지명</th>
					<td class="imp_data">
						<input type="text" id="dlvpNm_new" name="dlvpNm" value="" class="inpH28" title="배송지명을 입력해주세요." style="width:200px;" this="배송지명은" disabled="disabled">
					</td>
				</tr>
				<!--// 2017-01-18 추가 -->
				<tr type="new" class="new_order_area" style="display: none;">
					<th scope="row">받는분</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<input type="text" id="rmitNm_new" name="rmitNm" value="" orgvalue="" class="inpH28" title="받는분 이름을 입력해주세요." style="width:200px" this="받는분 이름은" disabled="disabled" data-attr="배송지정보^1_받는분">
						<span class="chk_area"><input type="checkbox" id="copyToDlvp_new" targetid="new" disabled="disabled"> <label for="copyToDlvp_new">주문자정보와 동일</label></span><!-- 2017-01-18 수정 : 위치변경 -->
					</td>
				</tr>
				<tr type="new" class="new_order_area" style="display: none;">
					<th scope="row">연락처1</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<select id="rmitCellSctNo_new" name="rmitCellSctNo" class="selH28" title="연락처1 앞자리를 선택해주세요." orgvalue="" style="width:90px" disabled="disabled" data-attr="배송지정보^1_연락처1">
							<option value="">선택</option>
							
								<option value="010">010</option>
							
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
						- <input type="text" id="rmitCellTxnoNo_new" name="rmitCellTxnoNo" value="" orgvalue="" class="inpH28" title="연락처1 가운데 자리를 입력해주세요." this="연락처1 가운데 자리는" style="width:90px" disabled="disabled" data-attr="배송지정보^1_연락처1">
						- <input type="text" id="rmitCellEndNo_new" name="rmitCellEndNo" value="" orgvalue="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요." this="연락처1 마지막 자리는" style="width:90px" disabled="disabled" data-attr="배송지정보^1_연락처1">
						<!-- <span class="chk_area"><input type="checkbox" id="chkSafe_new" name="chkSafe" value="456" /> <label for="chkSafe">안심번호 사용</label></span> -->
						<span class="info_security"><button type="button" data-rel="layer" data-target="securityInfo" class="chk_area">안심번호 서비스 안내</button></span>
					</td>
				</tr>
				<tr type="new" class="new_order_area" style="display: none;">
					<th scope="row">연락처2</th>
					<td>
						<select id="rmitTelRgnNo_new" name="rmitTelRgnNo" class="selH28" title="연락처2 앞자리를 선택해주세요." style="width:90px" disabled="disabled">
							<option value="">선택</option>
							
								<option value="010">010</option>
							
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
						- <input type="text" id="rmitTelTxnoNo_new" name="rmitTelTxnoNo" value="" class="inpH28" title="연락처2 가운데 자리를 입력해주세요." this="연락처2 가운데 자리는" style="width:90px" disabled="disabled">
						- <input type="text" id="rmitTelEndNo_new" name="rmitTelEndNo" value="" class="inpH28" title="연락처2 마지막 4자리를 입력해주세요." this="연락처2 마지막 자리는" style="width:90px" disabled="disabled">
					</td>
				</tr>
				<tr type="new" class="new_order_area" style="display: none;">
					<th scope="row">주소</th>
					<td class="imp_data"><!-- 2017-01-25 수정 : 클래스 추가 -->
						<input type="text" id="stnmRmitPostNo_new" name="rmitPostNo" value="" class="inpH28" title="우편번호를 검색해주세요." style="width:90px" readonly="readonly" disabled="disabled">
						<input type="hidden" id="rmitPostNo_new" name="stnmRmitPostNo" value="" title="우편번호를 검색해주세요." disabled="disabled">
						<button type="button" class="btnSmall wGreen w100" id="search-zipcode-pop_new" data-attr="배송지정보^1_주소"><span>우편번호 찾기</span></button>
						<div class="addr_box">
							<input type="hidden" id="stnmRmitPostAddr_new" name="stnmRmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly" disabled="disabled">
							<input type="hidden" id="rmitBaseAddr_new" name="rmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly" disabled="disabled">
							<!-- 주소 입력 시 보여지는 부분 -->
							<p class="addr_new">
								<span class="tx_tit">도로명</span> :
								<span class="tx_addr" id="stnmPostAddr_new"></span><!--  도로명주소를 넣어주세요 -->
							</p>
							<p class="addr_old">
								<span class="tx_tit">지번</span> :
								<span class="tx_addr" id="baseAddr_new"></span><!--  지번주소를 넣어주세요 -->
							</p>
							<!--// 주소 입력 시 보여지는 부분 -->
						</div>
						<input type="text" id="tempRmitDtlAddr_new" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px;" this="상세 주소는" disabled="disabled">
						<p class="txtDot mgT5">신규배송지 정보는 마이페이지 내 배송지에 저장됩니다.</p>
						<input type="hidden" id="stnmRmitDtlAddr_new" name="stnmRmitDtlAddr" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px" this="상세 주소는" disabled="disabled">
						<input type="hidden" id="rmitDtlAddr_new" name="rmitDtlAddr" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px" disabled="disabled">
						<input type="hidden" id="emdNm_new" name="emdNm" disabled="disabled">
						<input type="hidden" id="admrNm_new" name="admrNm" disabled="disabled">
					</td>
				</tr>
				</tbody>
			</table>
			<!--// 배송지 정보 -->

			<!-- 배송 요청사항 -->
			<div id="pickupHide5">
				<div class="title_wrap">
					<h2 class="sub-title2">배송 요청사항</h2>
				</div>
				<table class="tbl_inp_form important">
					<caption></caption>
					<colgroup><col style="width:170px"><col style="width:*"></colgroup>
					<tbody>
					<tr>
						<th scope="row">배송 메시지</th>
						<td>
							<select id="mbrMemoCont" class="selH28" title="택배배송 메시지를 선택해주세요." style="width:350px" name="deliveryMsg">
								<option name="배송메시지를 선택해주세요." value="">배송메시지를 선택해주세요.</option>
								<option value="그냥 문 앞에 놓아 주시면 돼요.">그냥 문 앞에 놓아 주시면 돼요.</option>
								/n
								<option value="직접 받을게요.(부재 시 문앞)">직접 받을게요.(부재 시 문앞)</option>
								/n
								<option value="벨을 누르지 말아주세요.">벨을 누르지 말아주세요.</option>
								/n
								<option value="도착 후 전화주시면 직접 받으러 갈게요.">도착 후 전화주시면 직접 받으러 갈게요. </option>
								/n
								<option value="직접 입력하기">직접 입력하기</option>
							</select>
							<input type="text" name="mbrMemoCont" value="" class="inpH28 mgT6" title="배송메시지를 입력해주세요." style="width:700px; display: none;">
						</td>
					</tr>
					<!-- 2020-09-03 24H배송일 경우만  노출 -->
					
					</tbody>
				</table>
				<!-- 2020-08-14 o2oJJ 24H 체크박스 추가 -->
				<h2 class="sub-title2 mgT15 o2o_24h_chk_area" style="">
				<span class="onedayChk">
					<input type="checkbox" id="o2o24HChk" name="o2o24HChk" targetid="exist">
					<label for="o2o24HChk">
						<span class="topTxt">오늘드림으로 바로 받아보시겠어요?</span>
						<span class="sbTxt"><span id="delidayInfo" style="color: rgb(0, 0, 255);"><strong> 금일 자정</strong></span> 까지 배송해드려요!<span style="color : blue"><strong>&nbsp;&nbsp;( 배송비 무료)</strong></span></span>
					</label>
					<input type="hidden" id="strNo24H" name="strNo24H" value="DD2A">
				</span>
				</h2>
				
				<table id="tabDoorInfo" class="tbl_inp_form important">
					<colgroup>
						<col style="width:170px">
						<col style="width:*">
					</colgroup>
					<tbody>
					
					<!-- 2019-11-15 추가 (오늘드림배송 시) -->
					<!-- 2020-08-04 o2oJJ 24H 화면 제어로 인한 주석 처리 -->
					
					<tr type="exist" class="quick_area">
						<th scope="row">공동현관 출입방법</th>
						<td class="imp_data">
							<span class="chk_area mgzero"><input type="radio" id="btn_door_manner_temp1" name="visitHow" value="비밀번호" checked=""><label for="btn_door_manner_temp1">비밀번호</label></span>
							<span class="chk_area"><input type="radio" id="btn_door_manner_temp2" name="visitHow" value="경비실 호출"><label for="btn_door_manner_temp2">경비실 호출</label></span>
							<span class="chk_area"><input type="radio" id="btn_door_manner_temp3" name="visitHow" value="자유출입가능"><label for="btn_door_manner_temp3">자유출입가능</label></span>
							<span class="chk_area"><input type="radio" id="btn_door_manner_temp4" name="visitHow" value="기타사항"><label for="btn_door_manner_temp4">기타사항</label></span>
						</td>
					</tr>
					<tr type="exist" class="quick_area" id="visitTypeDescExist">
						<th scope="row">기타 상세 내용</th>
						<td class="imp_data">
							<input type="text" id="door_type_exist" name="visitPwd" class="inpH28" title="공동현관 출입방법 상세내용." style="width: 500px" data-attr="배송지정보^2_공동현관 비밀번호">
						</td>
					</tr>

					<tr type="exist" class="quick_area">
						<th scope="row">출입정보 저장</th>
						<td class="access-rules">
							<span class="chk_area mgzero"><input type="checkbox" id="o2oVisitSaveInfo" name="o2oVisitSaveInfo" value="Y" data-attr="배송지정보^2_출입정보 저장 동의"> <label for="o2oVisitSaveInfo">개인정보 수집 및 이용 동의 (선택)</label></span>
							<ul>
								<li>수집 목적 : 상품 구매 시 배송 처리</li>
								<li>수집 항목 : 공동현관 출입방법, 비밀번호</li>
								<li>보유 및 이용기간 : 정보 삭제 또는 회원 탈퇴 시까지</li>
								<li>동의하지 않으실 경우, 다음 주문부터는 공동현관 정보가 저장되지 않습니다. </li>
							</ul>
						</td>
					</tr>
					
					<!--// 2019-11-15 추가 (오늘드림배송 시) -->
					</tbody>
				</table>
			</div>

			<input type="hidden" id="btn_dlvp_complete_msg_temp1" name="o2oMsgSendType" value="Y" checked="">
			<!--// 배송 요청사항 -->
			
				<div class="orderConBanner" id="orderConBanner" style="display:none">
	
							<img src="https://image.oliveyoung.co.kr/uploads/images/editor/QuickUpload/SYS/image/20220216232240/qksa_20220216232240.jpg">

				</div>

			<!-- 주문상품정보 -->

						<h2 class="sub-title2">
							<input type="hidden" name="quickYN" id="quickYN" value="${quickYN}">
							<c:choose>
								<c:when test="${quickYN eq 'Y' }">
									오늘드림 배송상품
									<dl class="gift_area">
										<dt>
											<input type="checkbox" name="packagingOption2" id="giftBoxYn_temp" data-attr="배송요청사항^선물포장서비스" disabled="disabled" style="cursor: not-allowed;"><label for="giftBoxYn_temp" class="gift_boxTit">선물포장 서비스</label>
											<input type="hidden" name="packagingOption" id="giftBoxYn" value="N">
										</dt>
										<dd id="gift_wrapping_01">정보
											<div class="sv_infos">가능한 상품들을 선물 포장하여<br>준비해드립니다. 하단의 포장 가능<br>상품을 확인해주세요!</div>
										</dd>
									</dl>
								</c:when>
								<c:otherwise>
									올리브영 배송상품
								</c:otherwise>
							</c:choose>
							
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
							<col style="width:110px">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">상품정보</th>
							<!-- 2019-11-15 추가 (오늘드림배송 선물포장) Start -->
							
							<!-- 2019-11-15 추가 (오늘드림배송 선물포장) End -->
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col">구매가</th><!-- 2017-01-24 수정 : 문구수정 -->
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${productList }" var="list">
							<tr>
								<td colspan="5" itemno="001" entrno="C19275" brndcd="3440" tradeshpcd="1" staffdscntyn="Y" pntrsrvyn="Y" ordqty="1" thnlpathnm="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0018/A00000018412902ko.jpg?l=ko"  purchasetype="N"><!-- 2017-01-13 수정 -->
									<input type="hidden" name="products" value="${list.productId }-${list.orderProductCnt}">
									<input type="hidden" name="pro_id" value="${list.productId }">
									<div class="tbl_cont_area">
											<div class="tbl_cell w700"><!-- 2017-01-24 수정 : 클래스명 변경 -->
												<div class="prd_info">
													<div class="prd_img">
														<img src="${list.productDisplaySrc }" alt="장바구니 상품 임시 이미지">
													</div>
													<div class="prd_name">													
														<span>${list.brandName }</span>
														<p>${list.productDisplayName }</p>
													</div>
													<p class="prd_opt" style="display: none">											
														<i class="tit">옵션</i>${list.productDisplayName }											
													</p>
													<p class="prd_flag">
														<c:if test="${list.discountflag eq 1}">
															<span class="icon_flag sale">세일</span>
														</c:if>
														<c:if test="${list.couponflag eq 1}">
															<span class="icon_flag coupon">쿠폰</span>
														</c:if>
														<!-- 기간계 상품, 브랜드 증정품만 아이콘 노출 -->
														<c:if test="${list.presentflag eq 1}">
															<span class="icon_flag gift" id="free_gift">증정</span>
														</c:if>
														<c:if test="${list.todaypickupflag eq 1}">
															<span class="icon_flag delivery" id="quick_yn">오늘드림</span>
														</c:if>	
													</p>
													<!--//fix/3275248 bmiy20 cjone point 적립불가건에 대해 사용 불가 처리 추가-->
												</div>
											</div>
											<!-- 2019-11-15 추가 (오늘드림배송 선물포장) Start -->
											
											<!-- 2019-11-15 추가 (오늘드림배송 선물포장) End -->
											<div class="tbl_cell w110">
												<span class="cur_price"><span class="tx_num"><fmt:formatNumber value="${list.minprice }" pattern="#,##0" /></span>원</span>
											</div>
											<div class="tbl_cell w100">${list.orderProductCnt }</div>
											<div class="tbl_cell w110">
												<span class="org_price"><span class="tx_num" id="normPrc_A000000184129/001"><fmt:formatNumber value="${list.minprice*list.orderProductCnt }" pattern="#,##0" /></span>원</span><!-- 2017-01-24 수정 : 추가 -->
												<span class="pur_price"><span class="tx_num" id="salePrc_A000000184129/001" data-price="${list.afterprice*list.orderProductCnt }"><fmt:formatNumber value="${list.afterprice*list.orderProductCnt }" pattern="#,##0" /></span>원</span>
												<input type="hidden" id="orgNormPrc_A000000184129/001" value="31000">
												<input type="hidden" id="orgSalePrc_A000000184129/001" value="23200">
												<input type="hidden" id="imdtDscntAmt_A000000184129/001" value="0">
											</div>
										</div>
									</td>
								</tr>
						</c:forEach>
					<!--// 1+1 행사 상품인 경우 -->
					
						</tbody>
						</table>
					<script type="text/javascript">
						$("#giftBoxYn_temp").attr("disabled", true);
						$("#giftBoxYn_temp").attr("checked", false);
						$("#giftBoxYn_temp").attr("style", "cursor: not-allowed;");
						$("#giftBoxYn").val("N");
					</script>
				
			
			<!--// 주문상품정보 -->
			
			<!-- 증정품 -->
			
			
			<input type="hidden" id="giftCount" value="0">
			<div id="giftCartNo"></div>
			<!--// 증정품 -->
			
			<!-- 쿠폰 및 포인트, 결제수단, 결제정보 -->
			<div class="order_payment_box">
				<div class="left_area">
					<!-- 쿠폰할인정보 -->
					<h2 class="sub-title2 width-inline">쿠폰할인정보</h2>
					<a href="javascript:;" class="couponView" onclick="popupOpen('userCpPop')"></a>
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
					<input type="hidden" id="couponCnt" value="0">
					<!--// 쿠폰할인정보 -->

					<!-- 포인트사용 --><!-- 2017-01-18 수정 : 전액사용 버튼이 input 뒤로 위치 변경됨 -->
					<h2 class="sub-title2">포인트/기프트카드사용</h2>
					<table class="tbl_inp_form type2">
						<caption>포인트사용 입력 폼</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						
						<tr>
							<th scope="row"><button type="button" class="btnGift btnGiftClick" onclick="popupOpen('OliveGiftInfo')">올리브영 기프트카드</button></th>
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
							<th scope="row"><button type="button" class="btnGift btnGiftClick" onclick="popupOpen('CJGiftInfo')"><span class="tx_num">CJ</span> 기프트카드</button></th>
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
						</tbody>
					</table>
					<!--// 포인트사용 -->

					<!-- 결제수단 선택 -->
					
					<div class="title_wrap" id="payMethod_div" style="display: block;">
						<h2 class="sub-title2">결제수단 선택</h2>
						<p class="sub_area" style="display: none;">
							
						</p>
					</div>
					<ul class="payment_info_form" id="payMethodList" style="display: block;">
						<li class="bg_area"><!-- 2017-01-18 수정 : 클래스 추가 -->
							<input type="hidden" id="payCouponIndex" value="" paycd="">
							<input type="hidden" id="easyPayCd" value="">
							<span><input type="radio" id="payMethod_11" name="payType" value="신용카드" cashreceipt="N" checked="checked" data-attr="결제수단선택^결제수단선택"><label id="payMethodLabel_11" for="payMethod_11">신용카드</label></span>

							
							<span class="pay_24h_sh" style="display: none;"><input type="radio" id="payMethod_61" name="payMethod" value="61" cashreceipt="Y" data-attr="결제수단선택^결제수단선택"><label id="payMethodLabel_61" for="payMethod_61">무통장입금</label></span>
							

							<!-- 2017-04-18 추가 -->
							<span><input type="radio" id="payMethod_25" name="payType" value="PAYCO" cashreceipt="N"><label id="payMethodLabel_25" for="payMethod_25">PAYCO<span class="flag bn">혜택</span></label></span>
							<!-- //2017-04-18 추가 -->
							<span><input type="radio" id="payMethod_26" name="payType" value="카카오페이" cashreceipt="N"><label id="payMethodLabel_26" for="payMethod_26">카카오페이</label></span>
							<!-- 20201021 배포에선 네이버페이 노출 제외 -->
							<span><input type="radio" id="payMethod_29" name="payType" value="네이버페이" cashreceipt="N"><label id="payMethodLabel_29" for="payMethod_29">네이버페이<span class="flag bn">혜택</span></label></span>

							<span><input type="radio" id="payMethod_22" name="payType" value="휴대폰결제" cashreceipt="N"><label id="payMethodLabel_22" for="payMethod_22">휴대폰결제</label></span>

							<span><input type="radio" id="payMethod_21" name="payType" value="계좌이체" cashreceipt="Y"><label id="payMethodLabel_21" for="payMethod_21">계좌이체</label></span>

							<!-- 2017-01-18 수정 : 문화상품권/도서상품권 선택 삭제 -->
							<!-- 2017-02-14 수정 : 문화상품권/도서상품권 선택 재추가 -->
							<span><input type="radio" id="payMethod_24" name="payType" value="도서상품권" cashreceipt="Y"><label id="payMethodLabel_24" for="payMethod_24">도서상품권</label></span>
							<span><input type="radio" id="payMethod_23" name="payType" value="문화상품권" cashreceipt="N"><label id="payMethodLabel_23" for="payMethod_23">문화상품권</label></span>
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
											<select id="acqrCd" name="cardType" class="selH28" title="결제하실 카드를 선택해주세요." style="width:200px" data-attr="결제수단선택^카드정보선택">
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
											<select id="instMmCnt" name="installmentType" class="selH28" style="width:200px" data-attr="결제수단선택^할부종류" disabled="">
												<option value="0">일시불</option>
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
											2023.11.14
										</div>
									</td>
								</tr>
							
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

															
																<script type="text/javascript">
																	// 결제수단 혜택 플래그
																	$(document).ready(function(){
																		try{
																			forder.orderForm.payMethod.addPayBenefitFlag("25");
																		}catch(e){console.log(e);}
																	});
																</script>
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
	<li>네이버페이 머니로&nbsp;충전,결제하면 2.5% 적립됩니다</li>
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
							<input type="hidden" id="cd_price" name="couponDiscountPrice" value="0">
						</li>
						
						<li class="line_top2">
							<span class="tx_tit">총 배송비 <button type="button" class="btnSmall wGray" onclick="popupOpen('deliveryInfo');"><span>상세보기</span></button></span>
							<span class="tx_cont"><span class="tx_num" id="dlexPayAmt_span">0</span>원</span>
							<input type="hidden" name="deliveryPrice" value="0">
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
							<span class="tx_cont colorOrange"><span class="tx_num" id="cjonePntAplyAmt_span">0</span>원</span>
							<input type="hidden" id="point_price" name="pointPrice" value="0">
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
							<input type="hidden" name="remainAmt" value="0">
							<input type="hidden" name="ordPayAmt" value="0">
							<input type="hidden" name="goodsNm" value="에스트라 아토베리어365 로션 150ml 기획 (+하이드로에센스 25ml+무기자차선크림10ml 증정)">
						</li>
						
						<li> <!-- 3440969_PM작업시 오늘드림 레이어 팝업 노출 요청 건 -->
							<button class="btnPayment" id="btnPay" name="btnPay" type="button" data-attr="최종결제정보^결제하기">결제하기<em id="giftNoti3" style="display: none;">(증정품은 결제 시 확인 가능합니다)</em> <em id="giftNotiQuick" style="display: none;">(오늘드림으로 주문 시 온라인 단독 <br>증정품이 제공되지 않습니다.)</em> <em id="giftNoti4" style="display: none;">(오늘드림 주문은 온라인 전용 증정품이<br>제공되지 않습니다.)</em></button>
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
									<button type="button" class="btnSmall wGray" onclick="javascript:window.open('/resources/html/foot_agreement.html', '_blank', 'width=400, height=900, left=600');"><span>약관보기</span></button>
								</p>
								<p class="tx_cont">
									<input type="checkbox" id="agree_2_2" name="agreeChk" value="" title="개인정보 수집 및 이용약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의"> <label for="agree_2_2">개인정보 수집 및 이용 동의</label>
									<button type="button" class="btnSmall wGray" onclick="javascript:window.open('/resources/html/foot_agreement_02.html', '_blank', 'width=400, height=900, left=600');"><span>약관보기</span></button>
								</p>
								<p class="tx_cont">
									<input type="checkbox" id="agree_2_3" name="agreeChk" value="" title="개인정보 제공 및 위탁약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의"> <label for="agree_2_3">개인정보 제공 및 위탁 동의</label>
									<button type="button" class="btnSmall wGray" onclick="javascript:window.open('/resources/html/foot_agreement_03.html', '_blank', 'width=400, height=900, left=600');"><span>약관보기</span></button>
								</p>
							</li>
							
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
<div class="layer_pop_wrap w680" id="OliveGiftInfo" style="display: none; margin-left: -340px; top: 1656px;">
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
		<button class="layer_close" onclick="javascript:$('#OliveGiftInfo').hide();$('.dimm').remove()">창 닫기</button>
	</div>
</div>
<!--// 올리브영 기프트카드 팝업 -->

<!-- CJ 기프트카드 팝업 -->
<div class="layer_pop_wrap w680" id="CJGiftInfo" style="display: none;">
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
		<button class="layer_close" onclick="javascript:$('#CJGiftInfo').hide();$('.dimm').remove()">창 닫기</button>
	</div>
</div>
<!--// CJ 기프트카드 팝업 -->

<!-- 안심번호 서비스 안내 팝업 -->
<div class="layer_pop_wrap w680" id="securityInfo" style="display: none;">
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
		<button class="layer_close" onclick="javascript:$('#securityInfo').hide();$('.dimm').remove()">창 닫기</button>
	</div>
</div>
<!--// 안심번호 서비스 안내 팝업 -->


<!-- 컬쳐랜드 로그인 팝업 -->
<div class="layer_pop_wrap w490" id="cultureLandLoginPop" style="display: none;">
	<div class="layer_cont">
		<h2 class="layer_title">컬쳐랜드 로그인</h2>
		<div class="loginArea">
			<form class="loginForm">
				<ul>
					<li>
						<input type="text" id="cultureLandLoginId" value="" title="아이디를 입력해 주세요." placeholder="아이디">
					</li>
					<li>
						<input type="password" id="cultureLandLoginPw" value="" title="비밀번호를 입력해 주세요." placeholder="비밀번호" autocomplete="off">
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
			</form>
		</div>

		<button type="button" class="layer_close" id="cultureLandLoginPop_close">창 닫기</button>
	</div>
</div>
<!--// 컬쳐랜드 로그인 팝업 -->

<!-- 전자금융거래 기본약관 팝업 -->
<div class="layer_pop_wrap w490" id="bookAndLifeLoginPop" style="display: none;">
	<div class="layer_cont">
		<h2 class="layer_title">북앤라이프 로그인</h2>
		<div class="loginArea">
			<form class="loginForm">
				<ul>
					<li>
						<input type="text" id="bookAndLifeLoginId" value="" title="아이디를 입력해 주세요." placeholder="아이디">
					</li>
					<li>
						<input type="password" id="bookAndLifeLoginPw" value="" title="비밀번호를 입력해 주세요." placeholder="비밀번호" autocomplete="off">
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
			</form>
		</div>

		<button type="button" class="layer_close" id="bookAndLifeLoginPop_close">창 닫기</button>
	</div>
</div>
<!--// 전자금융거래 기본약관 팝업 -->

<!-- 현대카드 M포인트 사용안내 팝업 -->
<div class="layer_pop_wrap w650" id="mHPointInfo" style="display: none;">
	<div class="layer_cont">
		<h2 class="layer_title" id="pntInfoMsgLayerTitle"></h2>
		<div class="mhy_point" id="pntInfoMsgLayer"></div>
		<button type="button" class="layer_close">창 닫기</button>
	</div>
</div>
<!--// 현대카드 M포인트 사용안내 팝업 -->

<!-- 배송비 상세정보 안내 팝업 -->
<div class="layer_pop_wrap w410" id="deliveryInfo" style="z-index: 999; display: none;">
	<div class="layer_cont" id="getDlexDtlPopAjax">
		<h2 class="layer_title">배송비 상세정보</h2>
		
		<!-- 스크롤 영역 -->
		<div class="layer_scroll_box type2 mgT20">
			<h3 class="layer_sub_title">
			<c:choose>
				<c:when test="${quickYN eq 'Y'}">
					오늘드림
				</c:when>
				<c:otherwise>
					올리브영 
				</c:otherwise>
			</c:choose>
			
			배송상품</h3>
			<ul class="delivery_info_list" id="hdDlexList">

				<li type="base" entrno="0" dlexcpnyn="N">
					<div>
						<span class="tx_tit">일반상품 배송비</span> 
						<input type="hidden" name="dlexAmt" value="0" orgvalue="0" targetid="0_0" disabled="disabled">
						<span class="tx_cont">
							<span class="tx_num" id="dlexAmt_hd_base">0</span>원
							<br>
							<span type="condition" style="display: none">(30,000원 이상 무료배송)</span>
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
							<span type="coupon" entrno="0" style="display: block;">(무료배송 쿠폰/도서산간배송비 적용 제외)</span>
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
<div class="layer_pop_wrap w650" id="eCommerceTerm" style="display: none;">
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
<div class="layer_pop_wrap w650" id="personalTerm" style="display: none;">
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
<div class="layer_pop_wrap w650" id="provideTerm" style="display: none;">
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
<div class="layer_pop_wrap" id="PresentPopup" style="width: 700px; margin-left: -350px; z-index: 999; display: none;">
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
				</ul>
<!-- //필수 증정품 -->
<!-- 선택 증정품 -->

<!-- //선택 증정품 -->
				<input type="hidden" id="giftCnt" value="2">
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
<div class="layer_pop_wrap w490" id="todayDeliveryNotice" style="z-index: 999; display: none;" data-ref-comparekey="todayDeliveryNotice"></div>
<!-- 당일배송 서비스 안내 (주문서)-->
<div class="layer_pop_wrap w490" id="infoTodayDeliveryOrder" style="z-index: 999; display: none; left: 50%; margin-left: -245px; top: 1906.5px;" data-ref-comparekey="infoTodayDeliveryOrder">
	<div class="layer_cont2">
		<h2 class="layer_title" name="todayD">오늘드림 서비스 안내</h2>
		<div class="layer_desc3">
			<!-- 빠름의 경우 -->
			<ul class="info_dash_list fwb" id="o2oDlvSp1" style="display: none;">
				<li><b>서비스 특성 상 상품 준비가 빠르게 진행되며, 상품 준비 단계에서는 주문을 취소하실 수 없습니다.</b></li>
				<li><b>교환/반품은 마이페이지 - 주문내역에서 교환/반품 신청을 통해 처리할 수 있으며,<br>별도 신청 없이 오프라인 매장에서의 처리는 불가합니다.</b></li>
				<li><b>온라인 단독 증정품은 제공되지 않으며, 온/오프라인 공통 증정품은 오늘드림 센터 재고 소진 시 증정되지 않습니다.</b></li>
				<li>오늘드림은 비대면 서비스로 별도의 연락없이 문 앞에 배송합니다.</li>
				<li>부정확한 배송지 정보의 경우 반송처리 될 수 있으며, 이 경우 반품비가 부과될 수 있습니다.</li>
				<li>일반 배송비 쿠폰은 오늘드림 주문에 적용되지 않습니다.</li>
				<li>기상상태 및 배송사 사정에 따라 배송이 지연 또는 주문이 취소 될 수 있습니다.</li>
				<li>주문 확인 시 재고가 부족한 경우, 부득이하게 주문이 취소될 수 있습니다.</li>
			</ul>
			<!-- 미드나잇의 경우  -->
			<ul class="listBlit mgT15" id="o2oDlvSp5" style="display: none;">
				<li><b>서비스 특성 상 상품 준비가 빠르게 진행되며, 상품 준비 단계에서는 주문을 취소하실 수 없습니다.</b></li>
				<li><b>교환/반품은 마이페이지 - 주문내역에서 교환/반품 신청을 통해 처리할 수 있으며,<br>별도 신청 없이 오프라인 매장에서의 처리는 불가합니다.</b></li>
				<li><b>온라인 단독 증정품은 제공되지 않으며, 온/오프라인 공통 증정품은 오늘드림 센터 재고 소진 시 증정되지 않습니다.</b></li>
				<li>오늘드림은 비대면 서비스로 별도의 연락없이 문 앞에 배송합니다.</li>
				<li>부정확한 배송지 정보의 경우 반송처리 될 수 있으며, 이 경우 반품비가 부과될 수 있습니다.</li>
				<li>일반 배송비 쿠폰은 오늘드림 주문에 적용되지 않습니다.</li>
				<li>기상상태 및 배송사 사정에 따라 배송이 지연 또는 주문이 취소 될 수 있습니다.</li>
				<li>주문 확인 시 재고가 부족한 경우, 부득이하게 주문이 취소될 수 있습니다.</li>
			</ul>
			<!-- 3!4!의 경우  -->
			<ul class="listBlit mgT15" id="o2oDlvSp4" style="display: none;">
				<li><b>서비스 특성 상 상품 준비가 빠르게 진행되며, 상품 준비 단계에서는 주문을 취소하실 수 없습니다.</b></li>
				<li><b>교환/반품은 마이페이지 - 주문내역에서 교환/반품 신청을 통해 처리할 수 있으며,<br>별도 신청 없이 오프라인 매장에서의 처리는 불가합니다.</b></li>
				<li><b>온라인 단독 증정품은 제공되지 않으며, 온/오프라인 공통 증정품은 오늘드림 센터 재고 소진 시 증정되지 않습니다.</b></li>
				<li>오늘드림은 비대면 서비스로 별도의 연락없이 문 앞에 배송합니다.</li>
				<li>부정확한 배송지 정보의 경우 반송처리 될 수 있으며, 이 경우 반품비가 부과될 수 있습니다.</li>
				<li>일반 배송비 쿠폰은 오늘드림 주문에 적용되지 않습니다.</li>
				<li>기상상태 및 배송사 사정에 따라 배송이 지연 또는 주문이 취소 될 수 있습니다.</li>
				<li>주문 확인 시 재고가 부족한 경우, 부득이하게 주문이 취소될 수 있습니다.</li>
			</ul>
			<!-- 2020-08-10 o2oJJ 24H -->
			<ul class="listBlit mgT15" id="o2oDlvSp6" style="">
				<li>당일 오후 4시까지 주문 시 당일 자정 전까지 배송되며, 오후 4시 이후 주문 시 다음날 자정 전까지 배송됩니다.</li>
				<li><b>오늘드림 센터에서 배송되는 서비스 특성 상 상품 준비가 빠르게 진행되며, 상품 준비 단계에서는 주문을 취소하실 수 없습니다.</b></li>
				<li><b>교환/반품은 마이페이지-주문내역에서 교환/반품 신청을 통해 처리할 수 있으며, 별도 신청 없이 오프라인 매장에서의 처리는 불가합니다.</b></li>
				<li><b>증정품은 오늘드림 센터 재고 소진 시 제공되지 않습니다.</b></li>
				<li>오늘드림은 비대면 서비스로 별도의 연락없이 문 앞에 배송합니다.</li>
				<li>부정확한 배송지 정보의 경우 반송 처리될 수 있으며, 반품비가 부과될 수 있습니다.</li>
				<li>기상상태에 따라 배송이 지연될 수 있습니다.</li>
				<li>주문 확인 시 재고가 부족하거나, 배송사의 사정에 따라 다시 택배 배송으로 변경될 수 있습니다.</li>
			</ul>
			<div class="layer_btn_area">
				<button class="btnMedium btnGreenW w120" id="stopToday" onclick="javascript:common.popLayer.todayDelivery.openQuickPopTodayForNoti();">오늘 하루 안보기</button>
				<button class="btnMedium fullGreen w120" id="btnConfirm">확인</button>
				<button class="btnMedium btnGreenW w120" id="stopGiftToday" style="display:none;">오늘 하루 안보기</button>
				<button class="btnMedium fullGreen w120" id="btnGiftConfirm" style="display:none;">확인</button>
			</div>
		</div>
		<button class="layer_close type2" id="btnLayerClose" onclick="javascript:$(this).closest('.layer_pop_wrap').hide();$('.dimm').remove();">창 닫기</button>
		<button class="layer_close type2" id="btnGiftLayerClose" style="display: none;">창 닫기</button>
	</div>
</div>
<!--// 당일배송 서비스 안내 -->

<!-- 선물포장 서비스 유의사항 -->
<div class="layer_pop_wrap w490" id="infoGiftBoxOrder" style="z-index: 999; display: none;" data-ref-comparekey="infoGiftBoxOrder">
	<div class="layer_cont2">
		<h2 class="layer_title">선물포장 서비스 </h2>
		<div class="layer_desc3">
			
			<h5 class="stit mgT15">선물포장 서비스 유의사항</h5>
			<p class="img_info mgT15"><img src="https://www.oliveyoung.co.kr/pc-static-root/image/comm/img_gift_info.jpg" alt=""></p>
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
				<button class="btnMedium fullGreen w120" id="btnConfirm1">확인</button>
			</div>

		</div>
		<button class="layer_close type2" onclick="javascript:forder.orderForm.layerClose();">창 닫기</button>
	</div>
</div>
<div class="layer_pop_wrap w490" id="infoGiftBoxOrderIcon" style="z-index: 999; display: none;">
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
<div class="layer_pop_wrap w480" id="buyLimit02" style="margin-left: -240px; z-index: 999; display: none;" tabindex="0">
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
<div class="layer_pop_wrap w480" id="buyLimit" style="margin-left: -240px; z-index: 999; display: none;" tabindex="0">
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
<div class="layer_pop_wrap w480" id="b2bLimit" style="margin-left: -240px; z-index: 999; display: none;" tabindex="0">
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
<div class="layer_pop_wrap w480" id="evtLimit" style="margin-left: -240px; z-index: 999; display: none;" tabindex="0">
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
<div class="layer_pop_wrap storePickPop" id="aboutPickup" style="z-index: 999; display: none;" data-ref-comparekey="aboutPickup">
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
<div class="layer_pop_wrap todayDlvCostNoti" id="todayDlvCostNoti" style="z-index: 999; display: none; ">
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
<div class="layer_pop_wrap w490" id="resultPickup" style="z-index: 999; display: none;" data-ref-comparekey="resultPickup">
	<div class="pickup-wrap">
		<h2 class="layer_title">픽업 서비스 안내</h2>
		<div class="pickup-wrap__cont">
			<div class="service-noti">
				<ul class="pament-noti">
					<li>픽업 바코드는 주문 완료 후 최대 24시간 이내 발송됩니다.</li>
					<li><b>상품 수령은 픽업 바코드 수신 이후 가능하며, 3일 내에 매장에 방문하여 상품을 찾아가시면 됩니다.</b></li>
					<li><b>교환/반품은 마이페이지 - 주문내역에서 교환/반품 신청을 통해 처리할 수 있으며,별도 신청 없이 오프라인 매장에서의 처리는 불가합니다.</b></li>
					<li><b>온라인 단독 증정품은 제공되지 않으며, 온/오프라인 공통 증정품은 매장 재고 소진 시 증정되지 않습니다.</b></li>
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
<div class="layer_pop_wrap w490" id="choicePickup" style="z-index: 999; display: none;" data-ref-comparekey="choicePickup">
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
<div class="layer_pop_wrap w490" id="stockPickup" style="z-index: 999; display: none;" data-ref-comparekey="stockPickup">
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
<!-- // 20210226 일부상품 재고 부족 상품 안내 팝업 (픽업서비스 퍼블리싱) -->
<!-- [3605144] 주문서 내 보유쿠폰 노출 기능 개발 요청 건 팝업 -->
<div class="layer_pop_wrap userCp" id="userCpPop" style="display: none;" tabindex="0">
<div class="layer_cont">
	<h2 class="layer_title"></h2>
	<!-- 스크롤 영역 -->
	<div class="popCont">
		<p>적용 가능한 쿠폰은 결제 금액에 따라 변경될 수 있습니다.</p>
		<div class="listCoupon_wrp mCustomScrollbar _mCS_2 mCS_no_scrollbar"><div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 0px;" tabindex="0"><div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
			<ul class="listCoupon" id="onCpnList" name="onCpnList">
				<li data-cpn-status="disabled">
					<div class="couponBox">
						<span class="coupon-inner price">4,000<em>원</em></span>
					</div>
					<div class="couponInfo">
						<h3>[신규가입] 3만원 이상 4,000원 할인</h3>
						<p>30,000원 이상</p>
						<p class="data">
							<!-- <span>사용기간</span> -->
							2023.10.20
							~2023.11.19
						</p>
					</div>
				</li>	
				<li data-cpn-status="disabled">
					<div class="couponBox">
						<span class="coupon-inner today free"> 무료배송</span>
					</div>
					<div class="couponInfo">
						<h3>[BABY] 오늘드림 무료배송 쿠폰</h3>
						<p>10,000원 이상</p>
						<p class="data">
							<!-- <span>사용기간</span> -->
							2023.07.04
							~2023.12.31
						</p>
					</div>
				</li>
			</ul>
		</div>
		<div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
	</div>
	<!--// 스크롤 영역 -->
	<button class="layer_close" onclick="$('#userCpPop').hide();$('.dimm').remove()">창 닫기</button>
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

</div>

</body>
</html>