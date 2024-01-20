<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/inc/include.jspf" %>
						
<form id="detail-form" name="detailForm">
<%-- <c:forEach items="${ orderVO }" var="order"> --%>
	
	<div class="title-area linezero">
		<h2 class="tit">상세정보</h2>
	</div>

	<ul class="infor-data mypage-flag-apply">
		<li>
			<span>주문일자&nbsp;&nbsp;:</span> 
			<strong>
				<fmt:formatDate value="${ orderVO.orderDate }" pattern="yyyy.MM.dd" var="orderdate"/>
				${ orderdate }
			</strong>
		</li>
		<li>
			<span>주문번호&nbsp;&nbsp;:</span> <strong>${ orderVO.orderId }</strong>

		</li>

	</ul>

	<h3 class="sub-title3">올리브영 배송상품</h3>

	<table class="board-list-2s">
		<caption>올리브영 배송상품</caption>
		<colgroup>
			<col style="width: %;">
			<col style="width: 130px;">
			<col style="width: 8%;">
			<col style="width: 130px;">
			<col style="width: 110px;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">상품명</th>
				<th scope="col">판매가</th>
				<th scope="col">수량</th>
				<th scope="col">구매가</th>
				<th scope="col">진행현황</th>
			</tr>
		</thead>
		<tbody class="history3">

			<tr>

				<td class="subject">
					<div class="area">

						<a class="thum"
							href="<%=contextPath%>/store/goods?productDisplayId=${ orderVO.productDisplayId }">
							<img
							src="${ orderVO.productDisplaySrc }"
							alt="${ orderVO.productDisplayName }"
							onerror="common.errorImg(this);">
						</a>
						<div class="textus" style="width: 68%;">
							<a class=""
								href="<%-- 상품상세페이지 이동 --%>">
								<span class="tit">${ orderVO.brandName }</span> 
								<span class="txt">${ orderVO.productDisplayName }</span>
							</a>

						</div>

					</div>
				</td>
				<td class="colorBlack"><strong>${ orderVO.productPrice }</strong> 원</td>
				<td>${ orderVO.productCnt }</td>
				<td class="colorOrange"><strong>${ orderVO.totalPrice }</strong> 원</td>

				<td class="bgnone"><strong>${ orderVO.orderStatus }</strong> 
				
				<c:if test="${ fn:contains(orderVO.orderStatus, '환불') }">
				<span class="color1sSize">처리일시<br>${ orderVO.refundDate }
				</span>
					<button type="button" class="BtnDelete"
						data-ord-no="${ orderVO.orderId }" data-ord-goods-seq="1"
						data-cnsl-ord-proc-seq="0" data-ord-dtl-sct-cd="20"
						data-chg-accp-sct-cd=""
						onclick="<%-- 환불사유 자세히 보기 모달창 스크립트 --%>">자세히
						보기</button>
				</c:if>
						
				</td>

			</tr>
	

		</tbody>
	</table>
	<%-- </c:forEach> --%>
	
	
	<div class="area-over mgT20">

		<h3 class="sub-title3 flex-layout justify-between"
			style="width: 100%;">배송지 정보</h3>

	</div>

	<c:choose>
		<c:when test="${ not empty deliveryVO }">
			
			<%-- <c:forEach items="${ deliveryVO }" var="delivery"> --%>
	
				<table class="board-write-2s view">
					<caption>배송지 정보 보기</caption>
					<colgroup>
						<col style="width: 20%;">
						<col style="width: 30%;">
						<col style="width: 20%;">
						<col style="width: 30%;">
					</colgroup>
					<tbody>

						<tr>
							<th scope="row">받는분</th>
							<td colspan="3">${ deliveryVO.deliveryRecipient }</td>
						</tr>

						<tr>
							<th scope="row">연락처1</th>
							<td colspan="3">${ deliveryVO.deliveryTel }<br/></td> 
						</tr>
						
						<c:if test="${ not empty deliveryVO.deliveryTel2 }">						
						<tr>
							<th scope="row">연락처2</th>
							<td colspan="3">${ deliveryVO.deliveryTel2 }<br/></td> 
						</tr>
						</c:if>
						
						
						<tr class="addr">
							<th scope="row">주소</th>
							<td colspan="3">(${ deliveryVO.deliveryZipcode })<br>도로명 : ${ deliveryVO.deliveryRoadAddr } ${ deliveryVO.deliveryDetailAddr }<br> 
							<span class="data">지&nbsp; &nbsp;번 : ${ deliveryVO.deliveryAddr } ${ deliveryVO.deliveryDetailAddr }</span>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- 배송요청사항 테이블 분리 -->
				<div class="area-over mgT20">
					<h3 class="sub-title3">배송 요청사항</h3>
					
				</div>
				<table class="board-write-2s view">
					<caption>배송지 정보 보기</caption>
					<colgroup>
						<col style="width:20%;">
						<col style="width:30%;">
						<col style="width:20%;">
						<col style="width:30%;">
					</colgroup>
					<tbody>
					<c:choose>
						<c:when test="${ not empty deliveryVO.deliveryMsg }">
							<tr>
								<th scope="row">배송 메시지</th>
								<td colspan="3">${ deliveryVO.deliveryMsg }</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th scope="row">배송 메시지</th>
								<td colspan="3">부재시 문앞에 놓아주세요.</td>
							</tr>
						</c:otherwise>
					</c:choose>
					</tbody>

				</table>
				<%-- </c:forEach> --%>
						
		</c:when>
		<c:otherwise>
			<table class="board-write-2s view">
					<caption>배송지 정보 보기</caption>
					<colgroup>
						<col style="width: 20%;">
						<col style="width: 30%;">
						<col style="width: 20%;">
						<col style="width: 30%;">
					</colgroup>
					<tbody>

						<tr>
							<td colspan="5" class="nodata">오류발생</td>	
						</tr>

						
					</tbody>
				</table>
			
		
		</c:otherwise>
	</c:choose>
	
	
	<!-- //배송요청사항 테이블 분리 -->


	<h3 class="sub-title3">결제 정보</h3>
	<%-- <c:forEach items="${ paymentVO }" var="payment"> --%>

	<div class="price-conts">
		<ul class="list ">
			<li>
				<dl>
					<dt>주문금액</dt>
					<dd>
						${ paymentVO.orderPrice }<em>원</em>
					</dd>
				</dl>
				<ul>
					<li><span class="txt">총 상품금액</span> <span class="won">${ paymentVO.totalPrice }<em>원</em></span>
					</li>
					<li><span class="txt">총 배송비</span> <span class="won">${ paymentVO.deliveryPrice }<em>원</em></span>
					</li>

				</ul>
			</li>


			<li>
				<dl>
					<dt>쿠폰할인금액</dt>
					<dd>
						${ paymentVO.couponDiscountPrice }<em>원</em>
					</dd>
				</dl>
				<ul>

				</ul>

			</li>
			<li>
				<dl>
					<dt>포인트 및 기타결제</dt>
					<dd>
						${ paymentVO.pointPrice }<em>원</em>
					</dd>
				</dl>
				<ul>



				</ul>
			</li>


		</ul>


		<div class="price-sum">
			<div>
				<strong>총 결제금액</strong><span>${ paymentVO.orderPrice }<em>원</em></span>
			</div>


			<c:choose>
				<c:when test="${ not empty paymentVO.cardType }">
					<span class="txt">${ paymentVO.cardType } 
					
					<c:choose>
						<c:when test="${ paymentVO.installmentType eq 0 }">
						일시불
						</c:when>
						<c:otherwise>
							${ paymentVO.installmentType }
						</c:otherwise>
					</c:choose>
					
					
					</span>
				</c:when>
				<c:otherwise>
					${ paymentVO.paymentType }
				</c:otherwise>
			</c:choose>
			
			
			
		</div>


	</div>


	<c:if test="${ not empty paymentVO.refundPrice }">
	<h3 class="sub-title3">환불내역</h3>
	<div class="price-conts twoType">
		<ul class="list lineBzero">
			<li>
				<dl>
					<dt>취소 금액</dt>

					<dd>
						${ paymentVO.orderPrice }<em>원</em>
					</dd>

				</dl>
				<ul>
					<li><span class="txt">취소 상품금액</span> <span class="won">${ paymentVO.totalPrice }<em>원</em></span>
					</li>

					<li><span class="txt">취소 배송비</span> <span class="won">${ paymentVO.deliveryPrice }<em>원</em></span>

					</li>

				</ul>
			</li>

			<li>
				<dl>
					<dt>포인트 및 기타결제 반환</dt>

					<dd>
						${ paymentVO.couponDiscountPrice }<em>원</em>
					</dd>

				</dl>
				<ul>

				</ul>
			</li>
		</ul>

		<div class="price-sum">
			<div>
				<button type="button" class="ButtonBasic"
					onclick="<%-- 환불이력을 알려주는 모달창 스크립트 --%>">환불이력</button>
				<strong>환불금액</strong><span>${ paymentVO.refundPrice }<em>원</em></span>
			</div>

			<c:choose>
			
				<c:when test="${ not empty paymentVO.cardType }">
					<span class="txt">${ paymentVO.cardType }
						<c:choose>
							<c:when test="${ paymentVO.installmentType eq 0 }">
							일시불
							</c:when>
							<c:otherwise>
								${ paymentVO.installmentType }
							</c:otherwise>
						</c:choose>
						 취소
					</span>
				</c:when>
				<c:otherwise>
					<span class="txt">${ paymentVO.paymentType } 취소</span>
				</c:otherwise>
				
			</c:choose>
			
										
		</div>
	</div>
	
	</c:if>
		<%-- </c:forEach> --%>
		

	<div class="area1sButton mgT40">
		<a href="<%=contextPath %>/mypage/orderdelivery" class="btnGray">목록</a>
	</div>
	
<%-- 
모달창
				<div class="popup-contents2 w500">
					<div class="pop-conts">
						<h1 class="ptit">취소 상세정보</h1>
				
						<div class="scroll-area" style="max-height:490px;">
								
							<div class="address-data">	
								<div class="date_area">
									<p>처리일시 <em>:</em> <span>2023년11월16일 15시01분51초</span></p>
								</div>
								
								<div class="area">
									<table class="boardPopup">
										<caption></caption>
										<colgroup>
											<col style="width:60px;">
											<col style="width:*;">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">사유</th>
												<td>${ paymentVO.refundReason }</td>
											</tr>
										</tbody>
									</table>
								</div>
								
							</div>				
								
						<div class="area1sButton">
							<a href="javascript:fnLayerSet('layer_pop_wrap', 'close');" class="btnGreen">확인</a>
						</div>
				
						<button type="button" class="ButtonClose" onclick="fnLayerSet('layer_pop_wrap', 'close');">팝업창 닫기</button>
					</div>
				</div>
--%>	
</form>
											