<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main id="main" class="main">
      <div class="pagetitle">
        <h1>주문확인/발송관리</h1>
      </div>
      <!-- End Page Title -->

      <section class="section">
        <div class="row">
          <div class="log-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Option</div>
                <div class="row mb-3">
                  <div class="col-sm-2"></div>
                  <div class="col-sm-4">
                    <button type="button" class="btn btn-outline-primary mb-2" id="beforeOrderCheck" onclick="optionCheck(1);">
                      신규 주문(주문 확인 전)
                      <span class="badge bg-white text-primary">4</span>
                    </button>
                  </div>
                  <div class="col-sm-4">
                    <button type="button" class="btn btn-outline-primary mb-2" id="afterOrderCheck" onclick="optionCheck(2);">
                      신규 주문(주문 확인 후)
                      <span class="badge bg-white text-primary">4</span>
                    </button>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-1 col-form-label"
                    >기간</label
                  >
                  <button class="col-sm-1 btn btn-outline-primary" id="today">
                    오늘
                  </button>
                  <button class="col-sm-1 btn btn-outline-primary" id="week">
                    1주일
                  </button>
                  <button class="col-sm-1 btn btn-outline-primary" id="1month">
                    1개월
                  </button>
                  <button class="col-sm-1 btn btn-outline-primary" id="3month">
                    3개월
                  </button>
                  <div class="col-sm-1"></div>
                  <input class="col-sm-3" type="date" name="startDate" id="" />
                  <input class="col-sm-3" type="date" name="EndDate" id="" />
                </div>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-1 col-form-label"
                    >검색:
                  </label>
                  <div class="col-sm-2">
                    <select class="form-select" id="searchOption">
                      <option value="1">주문번호</option>
                      <option value="2">택배사</option>
                      <option value="3">구매자ID</option>
                    </select>
                  </div>
                  <div class="col-sm-1"></div>
                  <input
                    type="text"
                    name="searchWord"
                    id="searchWord"
                    class="col-sm-8"
                  />
                </div>
                <div class="row">
                  <div class="col-sm-10"></div>
                  <button
                    class="col-sm-2 btn btn-outline-primary"
                    id="searchBtn"
                  >
                    검색
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="section">
        <div class="row">
          <div class="col-lg-12" id="cardForm">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Order List</h5>
                <div class="row">
                  <div class="col-sm-8"></div>
                  <button
                    class="col-sm-2 btn btn-outline-primary"
                    id="orderCheck"
                  >
                    주문 확인
                  </button>
                  <button
                    class="col-sm-2 btn btn-outline-primary"
                    id="sendProcess"
                  >
                    발송 처리
                  </button>
                </div>
                <!-- Table with stripped rows -->
                <table class="table table-striped" id="orderTable">
                   <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">주문번호</th>
                      <th scope="col">구매자ID</th>
                      <th scope="col">배송지ID</th>
                      <th scope="col">주문일시</th>
                      <th scope="col">오늘드림여부</th>
                      <th scope="col">선물포장여부</th>
                      <th scope="col">주문상태</th>
                      <th scope="col">택배사</th>
                      <th scope="col">송장번호</th>
                      <th scope="col">발송처리일</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:if test="${not empty orderCheck}">
                  	<c:forEach items="${orderCheck}" var="oc">
                  		 <tr>
                      		<th scope="row"><input type="checkbox" class="orderCheckBox" data-id="${oc.orderId}"/></th>
                      		<td>${oc.orderId}</td>
                      		<td>${oc.userId}</td>
                      		<td>${oc.deliveryId}</td>
                      		<td>${oc.orderDate}</td>
                      		<td>${oc.todayOption}</td>
                      		<td>${oc.packagingOption}</td>
                      		<td>${oc.orderStatus}</td>
                      		<td>
                      			<c:if test="${not empty oc.deliveryCompany}">
                      				${oc.deliveryCompany}
                      			</c:if>
                      			<c:if test="${empty oc.deliveryCompany }">
                      				<select class="form-select" id="deliveryCompany" name="deliveryCompany">
                          			<option value="CJ대한통운">CJ대한통운</option>
                          			<option value="롯데">롯데</option>
                          			<option value="한진">한진</option>
                          			<option value="로젠">로젠</option>
                          			<option value="우체국">우체국</option>
                        		</select>
                      			</c:if>
                      		</td>
                      		<td>
                      			<c:if test="${not empty oc.invoiceNumber}">
                      				${oc.invoiceNumber}
                      			</c:if>
                      			<c:if test="${empty oc.invoiceNumber}">
                      				<input type="text" id="invoiceNumber" name="invoiceNumber"/>
                      			</c:if>
                      		</td>
                      		<td>${oc.sendDate}</td>
                    </tr>
                  	</c:forEach>
                  </c:if>
                  </tbody>
                </table>
                <!-- End Table with stripped rows -->
              </div>
              <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                <c:if test="${pageDTO.prev }">
                	<li class="page-item">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true" data-page-no="${pageDTO.start-1}" >Previous</a>
                  </li>
                </c:if>
          		<c:forEach begin="${pageDTO.start}" end="${pageDTO.end}" var="i" step="1">
          			<li class="page-item"><a class="page-link" href="#" data-page-no="${i}">${i}</a></li>
          		</c:forEach>
               	<c:if test="${pageDTO.next}">
               		 <li class="page-item">
                    	<a class="page-link" href="#" data-page-no="${pageDTO.end+1}">Next</a>
                  	</li>
               	</c:if>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </section>
    </main>
    <script>
$('nav > ul.pagination > li > a ').on('click', function (event) {
    event.preventDefault();

    // 현재 URL 가져오기
    var url = window.location.href;

    // 클릭한 페이지의 data-page-no 속성 값 가져오기
    var newPage = $(this).data('page-no');

    // 'currentPage' 파라미터 업데이트
    url = addOrUpdateParameter(url, 'currentPage', newPage);

    // 새로운 URL로 리다이렉트 또는 다른 작업 수행
    console.log("Redirecting to:", url);
    window.location.href = url;
});
function addOrUpdateParameter(url, key, value) {
    var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    var separator = url.indexOf("?") !== -1 ? "&" : "?";
    if (url.match(re)) {
        return url.replace(re, '$1' + key + "=" + value + '$2');
    } else {
        return url + separator + key + "=" + value;
    }
}

</script>

<script>
// 맨위 버튼 클릭( 주문 접수, 주문 확인 )
	function optionCheck(number) {
	    var url = window.location.href;

	    url = addOrUpdateParameter(url, 'optionCheck', number);
	    
	    console.log("Redirecting to:", url);
	    window.location.href = url;
		
	}
</script>
<script>
// 주문 확인 버튼 눌렀을 때 
$(function() {
	$('#orderCheck').on('click', function() {
		
		var currentUrl = window.location.href;
		var selectedRows = [];
		
		$('.orderCheckBox:checked').each(function() {
			
			var orderId = $(this).data("id");
			
			selectedRows.push(orderId);
		}) // each fuction
		
		
		$.ajax({
			url: "/adminrest/order/orderConfirm",
			method: "post",
			cache: false,
			data: ({selectedRows: selectedRows}),
			 beforeSend: function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					console.log(xhr);
				},
			success: function(data) {
				alert('확인 성공')
				window.location.href = currentUrl;
			},
			error: function(data) {
				alert('에러');
			} // 에러
		}); // ajax close
		
	}) // click function
	
}); // ready fuction
</script>
<script>
/* 발송처리 버튼 눌렀을 때  */
  
 $(function() {
	$('#sendProcess').on('click', function() {
		
		var currentUrl = window.location.href;
		var sendProcessDTOs = [];
		
		$('.orderCheckBox:checked').each(function() {
	
			var orderId = $(this).data("id");
			
			var row = $(this).closest('tr');
			
			var deliveryCompany = row.find('#deliveryCompany').val();
			var invoiceNumber = row.find('#invoiceNumber').val();

			var selectedRows = {
					orderId: orderId,
					deliveryCompany : deliveryCompany,
					invoiceNumber: invoiceNumber
			}; 

			sendProcessDTOs.push(selectedRows);
		}); // each fuction
		
		console.log(sendProcessDTOs);
		console.log(JSON.stringify(sendProcessDTOs));
		
		
		$.ajax({
			url: "/adminrest/order/sendConfirm",
			method: "post",
			cache: false,
			data: JSON.stringify({sendProcessDTOs: sendProcessDTOs}),
			contentType : "application/json;charset=utf-8",
			 beforeSend: function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					console.log(xhr);
				},
			success: function(data) {
				alert('확인 성공')
				//window.location.href = currentUrl;
			},
			error: function(data) {
				alert('에러');
			} // 에러
		}); // ajax close
		
	}) // click function
	
}); // ready fuction
</script>
    <!-- End #main -->