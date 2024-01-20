<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<sec:authentication var="userName" property="principal.member.userName"/>	
</sec:authorize>
<!--  로그인이 안된 상태에서 url 주소를 입력하거나  때 -->
	<div id="Container">
		<!-- #Contents -->
		<div id="Contents">
			<!-- title_box -->
			<div class="title_box">
				<h1>주문/결제</h1>
				<ul class="step_list">
					<li><span class="step_num tx_num">1</span> 상품상세</li>
					<li class="on"><span class="hide">현재단계</span><span class="step_num tx_num">2</span> 주문/결제</li><!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
					<li class="last"><span class="step_num tx_num">3 </span> 주문완료</li>
				</ul>
			</div>
			<!--// title_box -->

			<form name="orderGiftCardForm" id="orderGiftCardForm">
			<input type="hidden" id="giftYn" name="giftYn" value="N">	
			<input type="hidden" id="rcvNmList1" name="rcvNmList1" value="">	
			<input type="hidden" id="rcvNmList2" name="rcvNmList2" value="">	
			<input type="hidden" id="rcvNmList3" name="rcvNmList3" value="">	
			<input type="hidden" id="rcvNmList4" name="rcvNmList4" value="">	
			<input type="hidden" id="rcvNmList5" name="rcvNmList5" value="">	
			<!-- 주문자 정보 -->

			<h2 class="sub-title2 mgT20">
				<c:choose>
					<c:when test="${click eq '바로구매' }">
						주문자정보
					</c:when>
					<c:otherwise>
						보내는 사람
					</c:otherwise>
				</c:choose>
			</h2>
	
			<table class="tbl_inp_form">
				<caption></caption>
				<colgroup>
					<col style="width:170px">
					<col style="width:*">
				</colgroup>
				<tbody>
				<tr>
					<th scope="row"><label for="ordManNm">주문자명</label></th>
					<td><input type="text" id="ordManNm" name="ordManNm" value="${userName }" class="inpH28" title="주문자명을 입력해주세요." style="width:200px" data-attr="주문자정보^1_주문자명"></td><!-- id와 label for를 맞춰주세요 (임시로 넣어둠) -->
	
				</tr>
				<tr>
					<th scope="row"><label for="ordManCellTxnoNo">휴대폰</label></th>
					<td>
						<select id="ordManCellSctNo" name="ordManCellSctNo" class="selH28" title="이동통신번호를 선택해주세요." style="width:90px" data-attr="주문자정보^1_휴대폰">
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
						- <input type="text" id="ordManCellTxnoNo" name="ordManCellTxnoNo" value="" class="inpH28" title="휴대폰번호 두번째자리를 입력해주세요." style="width:90px" data-attr="주문자정보^1_휴대폰">
						- <input type="text" id="ordManCellEndNo" name="ordManCellEndNo" value="" class="inpH28" title="휴대폰번호 마지막자리를 입력해주세요." style="width:90px" data-attr="주문자정보^1_휴대폰">
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="ordManEmailAddrId">이메일</label></th>
					<td>
						<input type="hidden" id="ordManEmailAddr" name="ordManEmailAddr" value="" title="이메일아이디를 입력해주세요.">
						<input type="text" id="ordManEmailAddrId" value="" class="inpH28" title="이메일아이디를 입력해주세요." style="width:120px" data-attr="주문자정보^1_이메일">
						@ <input type="text" id="ordManEmailAddrDmn" value="" class="inpH28" title="이메일도메인을 입력해주세요." style="width:120px" data-attr="주문자정보^1_이메일">
						<select id="ordManEmailAddrDmn_select" class="selH28" title="이메일도메인을 선택해주세요." style="width:120px" data-attr="주문자정보^1_이메일">
							<option value="" selected="selected">직접입력</option>
							<option value="hanmir.com">hanmir.com</option>
							<option value="naver.com">naver.com</option>
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
			
			<script>
				// 사용자 번호 설정
				<%-- let u_tel = '<sec:authentication property="principal.member.userTel"/>';
				let start = u_tel.substring(0, 3);
				let mid = u_tel.substring(4, 8);
				let end = u_tel.substring(9);
				
				$("#ordManCellSctNo").val(start);
				$("#ordManCellTxnoNo").val(mid);
				$("#ordManCellEndNo").val(end);
				
				// 사용자 이메일 설정
				let u_email = '<sec:authentication property="principal.member.userEmail"/>';
				let emailID = u_email.substring(0, u_email.indexOf('@'));
				let emailDomain = u_email.substring(u_email.indexOf('@')+1);
				
				$("#ordManEmailAddrId").val(emailID);
				$("#ordManEmailAddrDmn").val(emailDomain); --%>
				
				
				$("#ordManEmailAddrDmn_select").on("change", function() {
					if($(this).val() == "") {
						$("#ordManEmailAddrDmn").prop("disabled", false).val("");
					} else {
						$("#ordManEmailAddrDmn").prop("disabled", true).val($(this).val());
					}
				});
				
			</script>
			<!--// 주문자 정보 -->
			<c:if test="${click eq '선물하기' }">
				<h2 class="sub-title2">받는 사람 <span class="gc-sub-title">최대 5명에게 선물 가능해요</span></h2>
				<div class="gc-input-list-wrap" id="rcvMan">
					<div class="gc-input-item">
						<input class="name" type="text" id="rcvNm1" name="rcvNm" placeholder="이름" value="">
						<input class="phone-number" type="text" id="rcvPhone1" name="rcvPhone" placeholder="휴대폰번호" value="" maxlength="13">
						<button type="button" class="item-add" data-btntype="add" value="+"><span>추가</span></button>
					</div>
				</div>	
				<h2 class="sub-title2">메시지카드</h2>
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
						<div aria-live="polite" class="slick-list draggable">
							<div class="slick-track" role="listbox" style="opacity: 1; width: 7800px; transform: translate3d(-1040px, 0px, 0px);">
								<div class="slide slick-slide slick-cloned" data-category-name="사랑" data-slick-index="-8" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span class="is-active">
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5825797819616551753.png" alt="11" data-disp-conts-no="2/1" data-attr="메시지카드^3_메시지카드선택_11"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="사랑" data-slick-index="-7" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/3770270078395321790.png" alt="12" data-disp-conts-no="2/2" data-attr="메시지카드^3_메시지카드선택_12"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="사랑" data-slick-index="-6" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8980497778093106965.png" alt="13" data-disp-conts-no="2/3" data-attr="메시지카드^3_메시지카드선택_13" ></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="사랑" data-slick-index="-5" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/6559251653685028913.png" alt="14" data-disp-conts-no="2/4" data-attr="메시지카드^3_메시지카드선택_14"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="건강" data-slick-index="-4" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span class="is-active">
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2858088133688058103.png" alt="15" data-disp-conts-no="3/1" data-attr="메시지카드^3_메시지카드선택_15"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="건강" data-slick-index="-3" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8318016457649213641.png" alt="16" data-disp-conts-no="3/2" data-attr="메시지카드^3_메시지카드선택_16"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="건강" data-slick-index="-2" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8437918951936068200.png" alt="17" data-disp-conts-no="3/3" data-attr="메시지카드^3_메시지카드선택_17"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="건강" data-slick-index="-1" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4137275009008154234.png" alt="18" data-disp-conts-no="3/4" data-attr="메시지카드^3_메시지카드선택_18"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-current slick-active" data-category-name="전체" data-slick-index="0" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide00">
									<span class="is-active">
										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8628496970352617368.png" alt="2" data-disp-conts-no="7/4" data-attr="메시지카드^3_메시지카드선택_2"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-active" data-category-name="전체" data-slick-index="1" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide01">
									<span>
										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2578366984434068147.png" alt="4" data-disp-conts-no="7/2" data-attr="메시지카드^3_메시지카드선택_4"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-active" data-category-name="전체" data-slick-index="2" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide02">
									<span>
										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2601140381744572628.png" alt="6" data-disp-conts-no="7/6" data-attr="메시지카드^3_메시지카드선택_6"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-active" data-category-name="전체" data-slick-index="3" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide03">
									<span>
										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8418623798545217819.png" alt="7" data-disp-conts-no="7/7" data-attr="메시지카드^3_메시지카드선택_7"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-active" data-category-name="전체" data-slick-index="4" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide04">
									<span>
										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/177143882306003645.png" alt="8" data-disp-conts-no="7/8" data-attr="메시지카드^3_메시지카드선택_8"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-active" data-category-name="전체" data-slick-index="5" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide05">
									<span>
										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5470953899659231366.png" alt="9" data-disp-conts-no="7/9" data-attr="메시지카드^3_메시지카드선택_9"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-active" data-category-name="전체" data-slick-index="6" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide06">
									<span>
										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2762493121610279283.png" alt="10" data-disp-conts-no="7/10" data-attr="메시지카드^3_메시지카드선택_10"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-active" data-category-name="전체" data-slick-index="7" aria-hidden="false" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide07">
									<span>
										<a href="#" tabindex="0"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/7240862188553692284.png" alt="11" data-disp-conts-no="7/11" data-attr="메시지카드^3_메시지카드선택_11"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="8" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide08">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/6485547635519394841.png" alt="12" data-disp-conts-no="7/12" data-attr="메시지카드^3_메시지카드선택_12"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="9" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide09">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5186308448963283435.png" alt="13" data-disp-conts-no="7/13" data-attr="메시지카드^3_메시지카드선택_13"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="10" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide010">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/3237912432394164030.png" alt="14" data-disp-conts-no="7/14" data-attr="메시지카드^3_메시지카드선택_14"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="11" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide011">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/6096863507933820015.png" alt="15" data-disp-conts-no="7/15" data-attr="메시지카드^3_메시지카드선택_15"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="12" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide012">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/7621675421721967451.png" alt="16" data-disp-conts-no="7/16" data-attr="메시지카드^3_메시지카드선택_16" ></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="13" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide013">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/975449772915201095.png" alt="17" data-disp-conts-no="7/17" data-attr="메시지카드^3_메시지카드선택_17"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="14" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide014">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8014643217273842392.png" alt="18" data-disp-conts-no="7/18" data-attr="메시지카드^3_메시지카드선택_18" ></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="15" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide015">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/1344260312164936123.png" alt="20" data-disp-conts-no="7/26" data-attr="메시지카드^3_메시지카드선택_20" ></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="16" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide016">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/1369757321109892475.png" alt="20" data-disp-conts-no="7/20" data-attr="메시지카드^3_메시지카드선택_20"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="17" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide017">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2297103757812011063.png" alt="21" data-disp-conts-no="7/27" data-attr="메시지카드^3_메시지카드선택_21"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="18" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide018">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2583223796425432317.png" alt="21" data-disp-conts-no="7/21" data-attr="메시지카드^3_메시지카드선택_21"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="19" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide019">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/1982587899079238911.png" alt="22" data-disp-conts-no="7/28" data-attr="메시지카드^3_메시지카드선택_22"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="20" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide020">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4243935686390840148.png" alt="22" data-disp-conts-no="7/22" data-attr="메시지카드^3_메시지카드선택_22"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="전체" data-slick-index="21" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide021">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/7213600776184854595.png" alt="23" data-disp-conts-no="7/23" data-attr="메시지카드^3_메시지카드선택_23"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="축하" data-slick-index="22" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide022">
									<span class="is-active">
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4221794774826023274.png" alt="2" data-disp-conts-no="6/2" data-attr="메시지카드^3_메시지카드선택_2"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="축하" data-slick-index="23" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide023">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4804553594358800384.png" alt="4" data-disp-conts-no="6/4" data-attr="메시지카드^3_메시지카드선택_4"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="축하" data-slick-index="24" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide024">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8922026770523025781.png" alt="6" data-disp-conts-no="6/6" data-attr="메시지카드^3_메시지카드선택_6"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="감사" data-slick-index="25" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide025">
									<span class="is-active">
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8308631600957607160.png" alt="20" data-disp-conts-no="5/2" data-attr="메시지카드^3_메시지카드선택_20"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="감사" data-slick-index="26" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide026">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4134669692324445628.png" alt="21" data-disp-conts-no="5/3" data-attr="메시지카드^3_메시지카드선택_21"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="감사" data-slick-index="27" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide027">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4600444016846568081.png" alt="22" data-disp-conts-no="5/4" data-attr="메시지카드^3_메시지카드선택_22"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="감사" data-slick-index="28" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide028">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5923619688089496591.png" alt="23" data-disp-conts-no="5/6" data-attr="메시지카드^3_메시지카드선택_23"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="응원" data-slick-index="29" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide029">
									<span class="is-active">
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4694003955895030602.png" alt="19" data-disp-conts-no="4/5" data-attr="메시지카드^3_메시지카드선택_19"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="응원" data-slick-index="30" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide030">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/3168250975742998808.png" alt="20" data-disp-conts-no="4/6" data-attr="메시지카드^3_메시지카드선택_20"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="응원" data-slick-index="31" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide031">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8345588135095682367.png" alt="21" data-disp-conts-no="4/7" data-attr="메시지카드^3_메시지카드선택_21"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="응원" data-slick-index="32" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide032">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4401816034500452652.png" alt="22" data-disp-conts-no="4/8" data-attr="메시지카드^3_메시지카드선택_22"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="응원" data-slick-index="33" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide033">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/3593456260359121770.png" alt="7" data-disp-conts-no="4/1" data-attr="메시지카드^3_메시지카드선택_7"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="응원" data-slick-index="34" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide034">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5205616872234988872.png" alt="9" data-disp-conts-no="4/3" data-attr="메시지카드^3_메시지카드선택_9"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="응원" data-slick-index="35" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide035">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5382162151097645680.png" alt="10" data-disp-conts-no="4/4" data-attr="메시지카드^3_메시지카드선택_10"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="사랑" data-slick-index="36" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide036">
									<span class="is-active">
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5825797819616551753.png" alt="11" data-disp-conts-no="2/1" data-attr="메시지카드^3_메시지카드선택_11"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="사랑" data-slick-index="37" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide037">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/3770270078395321790.png" alt="12" data-disp-conts-no="2/2" data-attr="메시지카드^3_메시지카드선택_12"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="사랑" data-slick-index="38" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide038">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8980497778093106965.png" alt="13" data-disp-conts-no="2/3" data-attr="메시지카드^3_메시지카드선택_13"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="사랑" data-slick-index="39" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide039">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/6559251653685028913.png" alt="14" data-disp-conts-no="2/4" data-attr="메시지카드^3_메시지카드선택_14"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="건강" data-slick-index="40" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide040">
									<span class="is-active">
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2858088133688058103.png" alt="15" data-disp-conts-no="3/1" data-attr="메시지카드^3_메시지카드선택_15"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="건강" data-slick-index="41" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide041">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8318016457649213641.png" alt="16" data-disp-conts-no="3/2" data-attr="메시지카드^3_메시지카드선택_16"></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="건강" data-slick-index="42" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide042">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8437918951936068200.png" alt="17" data-disp-conts-no="3/3" data-attr="메시지카드^3_메시지카드선택_17" ></a>
									</span>
								</div>
								<div class="slide slick-slide" data-category-name="건강" data-slick-index="43" aria-hidden="true" style="width: 130px;" tabindex="-1" role="option" aria-describedby="slick-slide043">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/4137275009008154234.png" alt="18" data-disp-conts-no="3/4" data-attr="메시지카드^3_메시지카드선택_18"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="44" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span class="is-active">
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8628496970352617368.png" alt="2" data-disp-conts-no="7/4" data-attr="메시지카드^3_메시지카드선택_2" ></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="45" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2578366984434068147.png" alt="4" data-disp-conts-no="7/2" data-attr="메시지카드^3_메시지카드선택_4" ></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="46" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2601140381744572628.png" alt="6" data-disp-conts-no="7/6" data-attr="메시지카드^3_메시지카드선택_6" ></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="47" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/8418623798545217819.png" alt="7" data-disp-conts-no="7/7" data-attr="메시지카드^3_메시지카드선택_7" ></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="48" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/177143882306003645.png" alt="8" data-disp-conts-no="7/8" data-attr="메시지카드^3_메시지카드선택_8" ></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="49" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/5470953899659231366.png" alt="9" data-disp-conts-no="7/9" data-attr="메시지카드^3_메시지카드선택_9"></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="50" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/2762493121610279283.png" alt="10" data-disp-conts-no="7/10" data-attr="메시지카드^3_메시지카드선택_10" ></a>
									</span>
								</div>
								<div class="slide slick-slide slick-cloned" data-category-name="전체" data-slick-index="51" aria-hidden="true" style="width: 130px;" tabindex="-1">
									<span>
										<a href="#" tabindex="-1"><img src="https://image.oliveyoung.co.kr/uploads/images/display/900000600060001/133/7240862188553692284.png" alt="11" data-disp-conts-no="7/11" data-attr="메시지카드^3_메시지카드선택_11"></a>
									</span>
								</div>
							</div>
						</div>
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
			
			</c:if>
			
			<script>
				// 받는 사람, 메시지 카드 부분
				
				// 받는 사람 추가 및 삭제
				$(".item-add").on("click", function() {
					let itemLen = $("#rcvMan .gc-input-item").length
					if(itemLen == 5) {
						alert("최대 5명에게만 선물 가능합니다.");
						return;
					}
					
					$("#giftCardQty").text(`\${itemLen+1}`);
					let parent = $(this).parent().clone();
					$(parent).find("input").first().attr("id", `rcvNm\${itemLen+1}`).val("");
					$(parent).find("input").last().attr("id", `rcvPhone\${itemLen+1}`).val("");
					$(parent).find("button").attr("class", "item-del").on("click" , function() {
						$("#rcvMan > div").last().remove();
						$("#giftCardQty").text($("#rcvMan .gc-input-item").length);
						$("#totPayAmt_sum_span").text($("#giftCardAmt").val()*$("#giftCardQty").text());
					});
					$(this).parent().parent().append(parent);
					$("#totPayAmt_sum_span").text($("#giftCardAmt").val()*$("#giftCardQty").text());
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
				})
			</script>
			
			
			<h2 class="sub-title2">주문상품정보</h2>
			<table class="tbl_prd_list">
				<caption>주문상품 목록</caption>
				<colgroup>
					<col style="width:460px">
					<col style="width:100px">
					<col style="width:460px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상품정보</th>
						<th scope="col">수량</th>
						<th scope="col">금액입력</th>
					</tr>
				</thead>
				<tbody>
					<tr class="gc-tr-order">
						<input type="hidden" name="goodsNo" value="H000000102505">
						<input type="hidden" name="salePrc" value="10000">
						<input type="hidden" name="ordPsbMinQty" value="1">
						<input type="hidden" name="ordPsbMaxQty" value="50">
						<input type="hidden" name="qtyAddUnit" value="1">
						<td goodsno="H000000102505">
							<div class="tbl_cont_area">
								<div class="prd_info">
									<div class="prd_img">
										<img src="${dto.giftcardImgSrc}">
									</div>
									<div class="prd_name">
										<span class="tx_sale_info">올리브영 기프트카드</span>
										<p>${dto.giftcardName }</p>
									</div>
								</div>
							</div>
						</td>
						<td id="giftCardQty">1</td>
						<td>
	                        <div class="gc-price-write"><!-- 기프트카드 2020/02 : 추가 -->
	
	                            <div class="input-price">
	                                <div class="input">
	                                    <input type="text" id="giftCardAmt" placeholder="0" maxlength="7" data-attr="주문상품정보^4_금액입력">
	                                    <span class="won">원</span>
	                                    <button type="button" class="gc-reset" style="display: none;">reset</button>
	                                </div>
	                            </div>
	
	                            <div class="btn-add-wrap" id="addBtnList">
	                                <button type="button" id="amt1st" data-amount="10000" index="0" data-attr="주문상품정보^4_금액입력">+ 1만원</button>
	                                <button type="button" id="amt2st" data-amount="20000" index="1" data-attr="주문상품정보^4_금액입력">+ 2만원</button>
	                                <button type="button" id="amt3st" data-amount="30000" index="2" data-attr="주문상품정보^4_금액입력">+ 3만원</button>
	                                <button type="button" id="amt4st" data-amount="50000" index="4" data-attr="주문상품정보^4_금액입력">+ 5만원</button>
	                            </div>
	
	                            <p class="txt">1만원부터 50만원까지 만원 단위로 구매 가능합니다.</p>
	                        </div>
	                    </td>
					</tr>
				</tbody>
			</table>
			<script>
				// 금액 동작 처리
				$("#addBtnList > button").on("click", function() {
					$(".input-price .input").addClass("is-active");
					$(".gc-reset").css("display", "inline-block");
					
					let price = $("#giftCardAmt").val();
					let amount = $(this).data("amount");
					let sum = Number(price) + Number(amount);
					if(sum > 500000) {
						alert("1만원부터 50만원까지 구매 가능하며, 만원 단위로 입력 가능합니다.");
						sum = 500000;
					}
					let totalPay = $("#giftCardQty").text()*sum;
					$("#totPayAmt_sum_span").text(totalPay);
					$("#giftCardAmt").val(sum);
					
				});
				
				$(".gc-reset").on("click", function() {
					$(".input-price .input").removeClass("is-active");
					$(this).css("display", "none");
					$("#totPayAmt_sum_span").text("0");
					$("#giftCardAmt").val("");
				})
			</script>
			<!--// 주문상품정보 -->
		
			<!-- 쿠폰 및 포인트, 결제수단, 결제정보 -->
			<div class="order_payment_box type_gift_card"><!-- 기프트카드 2020/02 : type_gift_card 추가 -->
				<div class="left_area">
					<!-- 결제수단 선택 -->

					<div class="title_wrap" id="payMethod_div">
						<h2 class="sub-title2">결제수단 선택</h2>

					</div>
					<ul class="payment_info_form" id="payMethodList">
						<li class="bg_area"><!-- 2017-01-18 수정 : 클래스 추가 -->
							<span><input type="radio" id="payMethod_11" name="payMethod" value="11" cashreceipt="N" checked="checked" data-attr="결제수단선택^5_결제수단선택"><label for="payMethod_11">신용카드</label></span>

							<span><input type="radio" id="payMethod_21" name="payMethod" value="21" cashreceipt="Y" data-attr="결제수단선택^5_결제수단선택"><label for="payMethod_21">계좌이체</label></span>

						</li>
						<!-- 신용카드 선택 시 -->
						<li paymethod="11">							
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
												<select id="acqrCd" name="acqrCd" class="selH28" title="결제하실 카드를 선택해주세요." style="width:200px" data-attr="결제수단선택^5_결제상세입력">
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
										</td>
									</tr>
									<tr>
										<th scope="row">할부종류</th>
										<td>
											<div>
												<select id="instMmCnt" name="instMmCnt" class="selH28" style="width:200px" data-attr="결제수단선택^5_결제상세입력">
													<option value="00">일시불</option>
												</select>
											</div>
										</td>
										<input type="hidden" name="aplyNintInstYn" value="N">
									</tr>
									<!-- 2017-01-18 추가 : 카드 결제 안내 추가 -->
									<tr>
										<td colspan="2">
											<ul class="info_dot_list type2">
												<li>기프트카드는 The CJ카드 /임직원 할인을 포함한 제휴 및 청구할인이 불가합니다.</li>
												<li>기프트카드는 상품권 특성 상 카드사 정책에 의해 최대 결제 가능 금액이 일반 상품과 다르게 제한될 수 있으며, 추가인증이 필요할 수 있습니다.</li>
												<li id="cardDscnt_N_li" style="display: none;"><strong>청구할인 대상이 아닌 상품이 포함되어 있거나 결제금액이 청구할인 대상 금액보다 적어 청구할인 적용이 불가합니다.</strong></li>
												<li id="cardDscnt_Y1_li" style="display: none;">법인/체크/기프트 카드는 청구할인 대상에서 제외될 수 있습니다.</li>
												<li id="cardDscnt_Y2_li" style="display: none;">일 최대 청구할인 한도에 따라 청구할인 예상금액은 달라질 수 있습니다.</li>
											</ul>
										</td>
									</tr>
									<!--// 2017-01-18 추가 : 카드 결제 안내 추가 -->												
								</tbody>
							</table>							
						</li>
						<!--// 신용카드 선택 시 -->
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
												<ul class="info_dot_list type2">
													<li>계좌이체로 결제 완료시 본인 계좌에서 즉시 이체 처리됩니다.</li>
													<li>실시간 계좌이체는 은행별 이용시간이 다를 수 있습니다.</li>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
						<!--// 계좌이체 선택 시 -->
					</ul>
					
				</div>
				
				<script>
					// 결제 수단 선택 부분
					$("#payMethod_11").on("click", function() {
						$("#payMethodList > li").eq(1).show();
						$("#payMethodList > li").eq(2).hide();
						
					});
					
					$("#payMethod_21").on("click", function() {
						$("#payMethodList > li").eq(1).hide();
						$("#payMethodList > li").eq(2).show();
						
					});
				</script>
				
				<div class="right_area">
					<!-- 최종 결제정보 -->
					<h2 class="sub-title2">최종 결제정보</h2>
					<!--// 최종 결제정보 -->
					<ul class="total_payment_box">
						<li class="total">
							<span class="tx_tit">최종 결제금액</span> 
							<span class="tx_cont"><span class="tx_num" id="totPayAmt_sum_span">0</span>원</span>
							<input type="hidden" name="remainAmt" value="">
							<input type="hidden" name="ordPayAmt" value="">
							<input type="hidden" name="goodsNm" value="HIGH FIVE">
						</li>
						<li>
							<button class="btnPayment" id="btnPay" name="btnPay" type="button" data-attr="최종결제정보^6_결제하기버튼">결제하기</button>
							<input type="hidden" id="tempOrdNo" value="">
						</li>
					</ul>
					
					<div class="agree_payment_box" id="agreeList">
						<div class="all_agree_cont">
							<p>주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?</p><!-- 2017-01-18 수정 : 문구수정 --> 
							<input type="checkbox" id="agree_all" name="TrrmsCheck1ed" value="" data-attr="결제수단선택^6_서비스이용약관"> <label for="agree_all">모두 동의</label>
							<button type="button" class="btnDetailAgree" id="btnDetailAgree">주문상품 및 결제대행 서비스 이용약관 자세히 보기 열기/닫기</button>
						</div>
						<ul class="other_agree_cont">
							<li>
								<p class="tx_tit">주문 상품정보에 대한 동의</p>
								<p class="tx_cont2"><input type="checkbox" id="agree_1" name="agreeChk" value="" title="주문 상품정보 및 결제대행 서비스 이용약관에 동의해주세요." data-attr="결제수단선택^6_서비스이용약관"> <label for="agree_1">주문하실 상품, 가격, 배송정보, 할인내역등을 최종 확인하였으며, 구매에 동의합니다. <br>(전상거래법 제8조 제2항)</label></p>
							</li>
							<li>
								<p class="tx_tit">결제대행 서비스 이용약관 동의</p>
								<p class="tx_cont">
									<input type="checkbox" id="agree_2_1" name="agreeChk" value="" title="전자금융거래 기본약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의"> <label for="agree_2_1">전자금융거래 기본약관</label>
									<button type="button" class="btnSmall wGray" onclick="javascript:forder.orderGiftCardForm.openPopup('https://static.oliveyoung.co.kr/pc-static-root/html/etc/foot_agreement.html','agree',400,900);"><span>약관보기</span></button>
								</p>
								<p class="tx_cont">
									<input type="checkbox" id="agree_2_2" name="agreeChk" value="" title="개인정보 수집 및 이용약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의"> <label for="agree_2_2">개인정보 수집 및 이용 동의</label>
									<button type="button" class="btnSmall wGray" onclick="javascript:forder.orderGiftCardForm.openPopup('https://static.oliveyoung.co.kr/pc-static-root/html/etc/foot_agreement_02.html','agree',400,900);"><span>약관보기</span></button>
								</p>
								<p class="tx_cont">
									<input type="checkbox" id="agree_2_3" name="agreeChk" value="" title="개인정보 제공 및 위탁약관에 동의해주세요." data-attr="최종결제정보^6_결제대행동의"> <label for="agree_2_3">개인정보 제공 및 위탁 동의</label>
									<button type="button" class="btnSmall wGray" onclick="javascript:forder.orderGiftCardForm.openPopup('https://static.oliveyoung.co.kr/pc-static-root/html/etc/foot_agreement_03.html','agree',400,900);"><span>약관보기</span></button>
								</p>
							</li>
						</ul>
					</div>
				</div>
				
				<script>
					// 서비스 이용약관 동의 부분
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
					
					function inputCheck() {
						if($("#ordManNm").val() == "") {
							alert("주문자명을 입력해주세요.");
							$("#ordManNm").focus();
							return false;
						} else if($("#ordManCellSctNo").val() == "") {
							alert($("#ordManCellSctNo").attr("title"));
							$("#ordManCellSctNo").focus();
							return false;
						} else if($("#ordManCellTxnoNo").val() == "") {
							alert($("#ordManCellTxnoNo").attr("title"));
							$("#ordManCellTxnoNo").focus();
							return false;
						} else if($("#ordManCellEndNo").val() == "") {
							alert($("#ordManCellEndNo").attr("title"));
							$("#ordManCellEndNo").focus();
							return false;
						} else if($("#ordManEmailAddrId").val() == "") {
							alert($("#ordManEmailAddrId").attr("title"));
							$("#ordManEmailAddrId").focus();
							return false;
						} else if($("#ordManEmailAddrDmn").val() == "") {
							alert($("#ordManEmailAddrDmn").attr("title"));
							$("#ordManEmailAddrDmn").focus();
							return false;
						} else if($("#giftCardAmt").val() == "") {
							alert("금액을 입력해주세요.");
							return false;
						} else if($("#payMethod_11").prop("checked") && $("#acqrCd").val() == "") {
							alert($("#acqrCd").attr("title"));
							return false;
						} else if(!$("#agree_1").prop("checked")) {
							alert($("#agree_1").attr("title"));
							return false;
						} else if(!$("#agree_2_1").prop("checked")) {
							alert($("#agree_2_1").attr("title"));
							return false;
						} else if(!$("#agree_2_2").prop("checked")) {
							alert($("#agree_2_2").attr("title"));
							return false;
						} else if(!$("#agree_2_3").prop("checked")) {
							alert($("#agree_2_3").attr("title"));
							return false;
						} else if($(".gc-input-item").length > 0) {
							let items = $(".gc-input-item");
							for(let i=0; i<items.length; i++) {
								let inputs = $(items[i]).find("input");
								if(inputs[0].value == "") {
									alert("받는사람 정보를 입력해주세요.");
									$(inputs[0]).focus();
									return false;
								} else if(inputs[1].value == "") {
									alert("받는사람 정보를 입력해주세요.");
									$(inputs[1]).focus();
									return false;
								}
							}
						}
						
						return true;
					}
					
					// 결제하기 버튼을 눌렀을 때
					$("#btnPay").on("click", function() {
						if(inputCheck()) {
							alert("결제 가능~~")
						}
					});
				</script>
				
			</div>
			</form>
		</div>
		<!-- //#Contents -->
	</div>
	<!-- //#Container -->

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

<!-- 기프트카드 서비스 이용약관 -->
<div class="layer_pop_wrap w650" id="giftCardTerm" style="">
	<div class="layer_cont">
		<h2 class="layer_title">기프트카드 이용약관</h2>

		<div class="term_scroll_box">
			<div class="inner">
				<h2 class="inner-title">제1조(목적)</h2>
				<p>이 약관은 나이스정보통신 주식회사(이하 "발행자" 라 함)가 발행하는 "전자상품권", "모바일상품권"및 "쿠폰"(이하 "상품권")의 구매 및 이용과 관련하여, "발행자", "구매자" 및 "사용자"의 권리, 의무 등에 관한 사항을 정함을 목적으로 한다.</p>

				<h2 class="inner-title">제2조(용어의 정의)</h2>
				<p>1."상품권": "발행자"가 전자금융거래법을 근거로 하여 발행하는 선불전자지급수단으로서, 이전 가능한 금전적 가치가 전자적 방법으로 저장되어 발행된 증표 또는 그 증표에 관한 정보로서, 재화 또는 용역을 구입하고 그 대가를 지급하는데 사용되는 것을 말한다.
				</p><p>2."구매자": "발행사"에서 발행하는 "상품권"을 구매하는 고객을 말한다.</p>
				<p>3."사용자": 직접 구매하거나 양도 받은 "상품권"을 물품대금 결제수단으로 사용하는 고객을 말한다.</p>
				<p>4."가맹점": "발행사"와 가맹계약을 맺고 "사용자"가 "상품권" 사용시 원장에 표시된 금액에 해당하는 재화 또는 용역을 제공할 의무를 가진 자를 말한다.</p>
				<p>5."제휴 위탁사": "발행사"와 계약을 맺고, "발행사"의 의무를 대신하여 환불, 판매, 회수를 대행하는 자를 말한다.</p>
				<p>6."판매처": "발행사"와 계약을 맺고, "발행사"의 의무를 대신하여 판매를 대행하는 자를 말한다.</p>

				<h2 class="inner-title">제3조(구매 및 인증)</h2>
				<p>1."상품권"은 "발행사" 또는 "제휴 위탁사"가 판매를 위탁한 "판매처"에서 구입할 수 있다.</p>
				<p>2."상품권"은 "제휴 위탁사"와 합의하여 현금, 직불카드, 신용카드 등으로 선택적으로 구매할 수 있다. 다만, 신용카드 및 직불카드 구매한도는 여신전문금융업법 시행규칙에서 정하는 범위 내로 제한될 수 있다.</p>
				<p>3."상품권"의 최초 "구매자"는 구매 시 "상품권" 활성화(Activation)를 위한 인증을 받아야 한다.</p>
				<p>4."발행사" 또는 "제휴 위탁사"는 상품권 시스템을 통하여 "상품권" 원장 데이터의 유효성을 검증하고, 인증에 대한 결과를 "구매자"에게 고지(인증번호 부여 또는 영수증 제공)하여야 한다.</p>

				<h2 class="inner-title">제4조(권종 및 충전)</h2>
				<p>1."상품권"은 "정액권"과 "충전권", "물품교환권"으로 구분하되, "정액 권"은 권면금액 5만원, 10만원, 30만원, 50만원으로 구분하여 발행한다, 다만, "구매자"의 편의를 고려하여 "발행사"는 권면금액을 추가 또는 변경할 수 있다.</p>
				<p>2."충전권"은 권면 금액에 관계 없이, "구매자"가 자유롭게 금액을 추가하여 구매 할 수 있으며, "기명식"은 200만원, "무기명식"은 50만원으로 한도를 제한 한다. 다만, 전자금융거래법 제23조에 근거 및 구매자 편의를 고려하여 충전한도를 하향하여 변경 할 수 있다.</p>
				<p>3."발행사" 또는 "제휴 위탁사"는 "단말기"을 통하여 "상품권"의 충전금액 및 데이터의 유효성을 검증하고, 충전에 대한 결과를 구매자에게 고지(인증번호 부여 또는 영수증 제공)하여야 한다.</p>

				<h2 class="inner-title">제5조(사용 및 양도)</h2>
				<p>1."상품권"은 "충전형", "권종형"은 잔액의 범위 내에서 이용횟수의 제한 없이 일시불 구매방법으로 "발행사"와 "가맹점"에서 사용할 수 있다.</p>
				<p>2."상품권"의 "구매자"는 이를 타인에게 양도할 수 있으며, 이를 양수 받아 사용하는 사용자도 가맹점에서 전항의 방법으로 이용할 수 있으며, 재 양도할 수 있다. 단, "모바일상품권"의 경우 수신자 변경 후 양도 할 수 있다.</p>

				<h2 class="inner-title">제6조(사용의 제한)</h2>
				<p>1."상품권"은 다음의 경우에 사용이 제한 될 수 있다.<br>
					가."상품권" 구매 시 인증(Activation)을 받지 않은 경우<br>
					나.해당 "상품권"의 잔액이 이용하고자 하는 금액보다 적은 경우<br>
					다."상품권"이 사용중지 상태인 경우<br>
					라.전산시스템의 오류, 통신 불능, 단말기의 고장 등 "상품권"의 사용을 위한 유효성을 검증 할 수 없는 경우</p>
				<p>2."상품권"이 위, 변조 또는 기타 부정하게 발행된 경우, 잔액에 관계없이 "발행사"는 "사용자"의 "상품권"의 사용을 제한 할 수 있다.</p>
				<p>3."상품권"을 불법할인, 현금융통 등의 방법으로 사용하여서는 안되며, 그러한 경우 "사용자"는 그 책임의 전부 또는 일부를 부담할 수 있다.</p>

				<h2 class="inner-title">제7조 (거래내용의 확인)</h2>
				<p>1."발행사"는 "사용자"의 요청이 있는 경우, 관련법에서 정한 보존기간내의 거래내용을 확인해주어야 하며, 서면(전자문서를 제외한다.)으로 제공할 것을 요청하는 경우에는 그 요청을 받은 날부터 2주 이내에 거래내용에 관한 서면을 교부하여야 한다. 다만, 전자적 장치의 운영장애, 그 밖의 사유로 거래내용을 확인하게 할 수 없는 때에는 인터넷 등을 이용하여 즉시 그 사유를 알리고, 그 사유가 종료된 때부터 "사용자"가 거래내용을 확인할 수 있도록 하여야 한다.</p>
				<p>2."발행사"는 "사용자"에게 거래내용을 서면으로 제공할 것을 요청 받은 경우 전자적 장치의 운영장애, 그 밖의 사유로 거래내용을 제공할 수 없는 때에는 그 "사용자"에게 즉시 이를 알려야 한다. 이 경우 법 제7조제2항의 거래내용에 관한 서면의 교부기간을 산정함에 있어서 전자적 장치의 운영장애, 그 밖의 사유로 거래내용을 제공할 수 없는 기간은 산입하지 아니한다.</p>
				<p>이용자는 거래내용을 서면으로 제공받고자 하는 경우에는 발행자의 본사(전화번호:02-2187-2700, 주소: 서울시 마포구 아현동 686번지 Credit Center Building 5F, 이메일주소: nicegiftcard@nicevan.co.kr)로 신청 하여야 한다.</p>

				<h2 class="inner-title">제8조 (오류의 정정 등)</h2>
				<p>1."사용자"는 전자금융거래에 오류가 있음을 안 때에는 그 발행자에게 이에 대한 정정을 요구할 수 있다.</p>
				<p>2."발행사"는 제1항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 오류의 원인과 처리 결과를 문서로 알려야 하며, 다만, "사용자"가 요청하면 전화 또는 전자우편 등의 방법으로 알릴 수 있다.</p>
				<p>3."발행사"는 스스로 전자금융거래에 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 오류가 있음을 안 날부터 2주 이내에 오류의 원인과 처리 결과를 전항과 같은 방법으로 "사용자"에게 알려야 한다.</p>

				<h2 class="inner-title">제9조(유효기간)</h2>
				<p>"상품권"의 유효기간은 구매시점("권종형"은 최초구매일자, "충전형"은 최종충전일)으로부터 5년이며, 유효기간이 경과한 카드로 결제 및 환불, 교환은 할 수 없다. 단, 이벤트 및 행사를 통하여 무상 제공된 "상품권"은 별도 표기된 유효기간으로 정한다.</p>
				<p>"사용자"는 유효기간 내에는 연장을 요청할 수 있으며 특별한 사유가 없는 경우 유효기간이 연장된다. 단, 이벤트, 행사 등을 통해 무상으로 양도받은 "상품권"은 연장 할 수 없다.</p>

				<h2 class="inner-title">제10조(구매 취소의 방법)</h2>
				<p>1.구매한 "상품권"은 현금으로 반환되지 않는다. 다만, "구매자"가 "상품권"을 사용하지 않거나, 포장 등의 상태가 양호한 경우에는 "발행사"가 정한 일정 기간 내에서 판매 취소 할 수 있다. 다만, "발행사"는 취소 기한을 구매시점에 "구매자"에게 "판매처"에서 사전에 고지하여야 한다.</p>
				<p>2."충전권" "상품권"의 재충전 취소 요청 시 취소요청 금액이 잔액보다 적을 경우, 취소 요청을 제한 한다.</p>

				<h2 class="inner-title">제11조("상품권"의 환급)</h2>
				<p>다음 각 호의 어느 하나에 해당하는 경우에는 "상품권"에 기록된 잔액의 전부를 현금으로 환급 받을 수 있다.</p>
				<p>1.천재지변 등의 사유로 가맹점이 재화 또는 용역을 제공하기 곤란하여 "상품권"을 사용하지 못하게 된 경우</p>
				<p>2."상품권"의 결함으로 "가맹점"이 재화 또는 용역을 제공하지 못하는 경우</p>
				<p>3."상품권"의 금액("권종형"의 경우 권면금액, "충전형"의 경우 최종충전시점에 기재된 금액)의 60%이상(1만원 이하 "상품권"의 경우 80%이상) 소진 시 그 잔액에 대해서는 현금으로 환불 받으실 수 있습니다. 단 환불 금액은 구매액을 기준으로 사용비율에 따라 계산하여 남은 비율의 금액을 환불한다. 단, 이벤트, 행사 등을 통해 무상제공(무료, 이벤트 등)받은 "상품권"의 경우에는 환불을 받을 수 없다.</p>
				<p>4.기타 "발행사"가 본 서비스를 중단하는 것을 사전에 통지한 경우</p>
				<p>5.환불금액은 계좌이체 요청일 경우 제반 비용을(계좌이체 실비) 제외 후 입금된다.</p>

				<h2 class="inner-title">제12조("상품권"의 분실과 도난 책임)</h2>
				<p>1."사용자"의 "상품권" 관리소홀로 인한 분실 혹은 도용 시 그에 대한 책임은 "사용자"에게 있다.</p>
				<p>2."발행사"는 "사용자"에게 "상품권"의 분실이나 도난 등의 통지를 받은 때에는 "상품권" 번호 및 이용자의 신분이 확인 될 경우, "발행사"는 해당 "상품권"의 사용을 정지 할 수 있다. 다만, 그 때부터 제3자가 그 "상품권"을 사용함으로 인하여 "사용자"에게 발생한 손해를 배상할 책임을 진다.</p>
				<p>3."발행사"는 정지된 "상품권"에 대하여 "사용자"의 요청 시, 해당금액만큼 잔액환불 또는 다른 "상품권"로 대체 하여 제공할 수 있다. 이 경우, "발행사"는 소정의 수수료를 "사용자"에게 부담하게 할 수 있다.</p>

				<h2 class="inner-title">제13조(위조나 변조 시 책임)</h2>
				<p>1."발행사"는 "상품권"의 위조나 변조로 발생한 사고, 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 "사용자"에게 손해가 발생한 경우에는 그 손해를 배상할 책임을 진다.</p>
				<p>2.제1항의 규정에 불구하고 금융기관 또는 전자금융업자는 다음 각 호의 어느 하나에 해당하는 경우에는 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있다.<br>
					가.사고 발생에 있어서 "사용자"의 전자금융거래법 시행령 제8조에서 규정 한 고의나 중대한 과실이 있는 경우로서 그 책임의 전부 또는 일부를 "사용자"의 부담으로 할 수 있다는 취지의 약정을 미리 이용자와 체결한 경우<br>
					나.법인(「중소기업기본법」제2조제2항에 의한 소기업을 제외한다)인 "사용자"에게 손해가 발생한 경우로 "발행사"가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우</p>

				<h2 class="inner-title">제14조 (약관의 명시와 변경통지 등)</h2>
				<p>1."발행사"는 "사용자"와 전자금융거래의 계약을 체결함에 있어서 약관을 명시하여야 하고, 이용자의 요청이 있는 경우에는 금융위원회가 정하는 방법에 따라 그 약관의 사본을 교부하고 그 약관의 내용을 설명하여야 한다.</p>
				<p>2."발행사"는 제1항의 규정을 위반하여 계약을 체결한 때에는 당해 약관의 내용을 계약의 내용으로 주장할 수 없다.</p>
				<p>3."발행사"는 약관을 변경하는 때에는 변경되는 약관의 시행일 1월 전에 금융위원회가 정하는 방법에 따라 이를 게시하고 "사용자"에게 알려야 한다. 다만, 법령의 개정으로 인하여 긴급하게 약관을 변경하는 때에는 금융위원회가 정하는 방법에 따라 이를 즉시 게시하고 이용자에게 알려야 한다.</p>
				<p>4."사용자"는 제3항의 규정에 따른 약관의 변경내용이 게시되거나 통지된 후부터 변경되는 약관의 시행일 전의 영업 일까지 전자금융거래의 계약을 해지할 수 있다. 전단의 기간 안에 "사용자"가 약관의 변경내용에 대하여 이의를 제기하지 아니하는 경우에는 약관의 변경을 승인한 것으로 본다.</p>

				<h2 class="inner-title">제15조(신용정보의 제공/이용 등)</h2>
				<p>1."발행사"는 이 계약과 관련하여 취득한 회원의 신용정보를 관련 법률에 정한 바에 따라 엄격히 관리해야 하며 회원이 제공/활용에 동의한 경우에는 회원이 동의한 범위 내에서 신용정보집중기관, 신용정보업자, 신용정보제공, 이용자, 제휴업체와 정보를 교환하여 이용할 수 있다. 다만, 회원이 해지한 이후에는 관련 법령이 정하는 바 이외에는 이용하지 않는다.</p>
				<p>2."가맹점"과 "사용자" 간에 "상품권"거래로 인하여 분쟁이 발생하였을 경우, "발행사"는 "사용자"의 정보를 "가맹점"에게 제공할 수 있으며, "사용자"는 "가맹점"의 정보를 요구할 수 있다.</p>

				<h2 class="inner-title">제16조(위반시의 책임)</h2>
				<p>"발행사"와 "사용자"는 이 약관을 위반함으로써 발생하는 모든 책임을 각자가 부담하며, 이로 인하여 상대방에게 손해를 입힌 경우에는 이를 배상하여야 한다.</p>

				<h2 class="inner-title">제17조(이 약관에서 정하지 아니한 사항)</h2>
				<p>이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 관계법령 또는 일반 상 관례에 따른다.</p>

				<h2 class="inner-title">제18조(지급보증)</h2>
				<p>"발행사"에서 발행하는 "상품권"은 전자금융어법에 속하며 지급보증 또는 피해보상보험계약(당 "발행사"는 예치금 3억을 통한 지급보증을 함)에 대하여 책임과 의무가 있고, "상품권"의 지급보증은 전자적으로 등록된 금액에 등록된 바에 따른다.</p>

				<h2 class="inner-title">제19조(관할법원)</h2>
				<p>이 약관에 따른 거래에 관하여 분쟁이 발생한 경우에는 민사소송법상의 관할법원의 규정에 따른다. 다만, 채무자의 책임 있는 사유로 부실채권이 발생되어 그 채권의 관리를 위하여 "발행사"의 본점 또는 다른 영업소로 그 채권관리를 위임한 경우에는 이관 받은 본점 또는 다른 영업소의 소재지 지방법원을 관할법원으로 한다.</p>

				<p>※ 최종개정일자 : 2015.11.04</p>

			</div>
		</div>
		<div class="layer_btn_area">
			<button class="btn_layer_confirm btnMedium fullGreen"><span>확인</span></button>
		</div>
		<button class="layer_close">창 닫기</button>
	</div>
</div>
<!--// 기프트카드 서비스 이용약관 -->

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