<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/inc/include.jspf" %>


				
	<div class="title-area2">
		<h2 class="tit">주문/배송 조회</h2>
	</div>
	<div class="layer_pop_wrap" id="service_survey" style=""></div>



	<ul class="mypage-step">
		<c:set value="${ deliveryStatusVO }" var="delivery" /> 
			<li><em> <%-- 주문접수 --%> ${ delivery.deliveryStatus1 }
			</em> <span>주문접수</span></li>
			<li><em> <%-- 결제완료 --%> ${ delivery.deliveryStatus2 }
			</em> <span>결제완료</span></li>
			<li><em> <%-- 배송준비중 --%> ${ delivery.deliveryStatus3 }
			</em> <span>배송준비중</span></li>
			<li><em> <%-- 배송중 --%> ${ delivery.deliveryStatus4 }
			</em> <span>배송중</span></li>
			<li><em> <%-- 배송완료 --%> ${ delivery.deliveryStatus5 }
			</em> <span>배송완료</span></li>
	</ul>
	
	
	<fieldset class="search-period mgT30">
		
		<div class="select_con" id="_selectOrderTypeZone">
			<p>구매 유형</p>
			<ul class="select-type">
				
				<li class="on">
					<button type="button" data-order_type="">전체</button>
				</li>
							
				<li>
					<button type="button" data-order_type="10">온라인몰 구매</button>
				</li>
				
				<li>
					<button type="button" data-order_type="20">매장 구매</button>
				</li>
				
			</ul>
		</div>
		
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
	
	<script src="<%=contextPath %>/resources/js/searchoption.js"></script>
	<%
		String myPageURL = "/mypage/orderdelivery";
	%>
	<script>
		var myPageURL = "<%= myPageURL %>"
	</script>
	
	
	
	<p class="board-guide-text">
		<span class="txt">2017년 4월 1일 이후 내역만 조회가 가능하며, 이전의 주문내역은 CJMall 주문내역에서 확인하실 수 있습니다.</span>
		<span class="txt">매장 구매는 CJ ONE 포인트 적립을 한 경우, 최근 1년 내역만 조회가 가능합니다. (2019년 9월 27일 이후 내역만 조회 가능)</span><!-- // 오프라인리뷰관련추가 2019-11-01 문구 추가 // -->
	</p>
	
	
	<table class="board-list-2s mgT20">
		<caption>주문일자, 상품, 수량, 주문금액, 상태로 이루어진 주문/배송/내역 목록 표</caption>
		<colgroup>
			<col style="width:17%;">
			<col style="width:%;">
			<col style="width:8%;">
			<col style="width:130px;">
			<col style="width:110px;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">주문일자</th>
				<th scope="col">상품</th>
				<th scope="col">수량</th>
				<th scope="col">주문금액</th>
				<th scope="col">상태</th>
			</tr>
		</thead>
				
				<c:choose>
				<c:when test="${ not empty orderList }">
				
					<tbody class="history">
						<c:forEach items="${ orderList }" var="ol">
						<tr>
	
	
							<td rowspan="1">
								<ul class="mypage-flag-apply">
	
	
									<li class="order-date">
									<fmt:formatDate value="${ ol.orderDate }" pattern="yyyy-MM-dd" var="orderdate"/>
									${ orderdate }
									</li>
	
									<li class="color1s">${ ol.orderId }</li>
	
									<li><a href="#" class="btnDetail"
										data-oper-dt="2023.11.03" data-origin-bizpl-cd=""
										data-pos-no="" data-receipt-no="" data-deal-sp=""
										data-frst-receipt-no=""
										onclick="javascript:redirectDetail('${ol.orderId}')">상세보기</a>
									</li>
										
	
								</ul>
							</td>
	
	
							<td class="subject ">
								<div class="area">
	
	
	
									<a class="thum"
										href="<%= contextPath%>/store/goods?productDisplayId=${ol.productDisplayId}">
										<img
										src="${ ol.productDisplaySrc }"
										alt="${ ol.productDisplayName }"
										onerror="common.errorImg(this);">
									</a>
									<div class="textus">
										<a class=""
											href="<%= contextPath%>/store/goods?productDisplayId=${ol.productDisplayId}">
											<span class="tit">${ ol.brandName }</span> <span class="txt">${ ol.productDisplayName }</span>
										</a> 
										
										<c:if test="${ ol.productDisplayName ne ol.productName }">
											<span class="color1sSize">
												<i class="tit">옵션</i>
												${ ol.productName }
											</span>
										</c:if>
	
	
	
										<button type="button" class="btn_bag mgT10" name="Order"
											onclick="modalcall()"
											data-goods-no="A000000163041" data-item-no="006"
											data-quick-yn="N">
											<span>장바구니 담기</span>
										</button>
	
									</div>
	
	
	
								</div>
							</td>
							<td class="">${ ol.productCnt }</td>
							<td class="colorOrange">
								<!--  오프라인구매용 금액 --> <strong>${ ol.totalPrice }</strong> 원
	
							</td>
	
							<td>
								<strong>${ ol.orderStatus }</strong> 
								<c:if test="${ fn:contains(ol.orderStatus, '환불') }">
									<span class="color1sSize">처리일시<br>${ ol.refundDate }
									</span>
										<button type="button" class="BtnDelete"
											data-ord-no="<%-- 주문번호 --%>" data-ord-goods-seq="1"
											data-cnsl-ord-proc-seq="0" data-ord-dtl-sct-cd="20"
											data-chg-accp-sct-cd="" data-rtn-proc-sct-cd=""
											onclick="<%-- 환불사유 모달창 띄우는 스크립트 --%>">자세히
											보기</button>
								</c:if>
							</td>
					
						</tr>
						</c:forEach>
					</tbody>
				</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" class="nodata">기간 내 주문내역이 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
				
		</table>
	


				
				
				

<script>
	function redirectDetail(orderId) {
		var url = '<%= contextPath %>/mypage/orderdeliverydetail' + '?orderId=' + encodeURIComponent(orderId);
		location.href = url;
	}
</script>

<script>
   function modalcall() {
    $( "#dialog-message" ).dialog({
      modal: true,
      buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  } 
  </script>

