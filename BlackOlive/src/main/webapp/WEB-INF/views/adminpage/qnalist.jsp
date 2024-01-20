<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Form Elements</h1>

      </div>
      <!-- End Page Title -->

      <section class="section">
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Table with hoverable rows</h5>

                <!-- Table with hoverable rows -->
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th scope="col">QnA ID</th>
                      <th scope="col">질문</th>
                      <th scope="col">상품명</th>
                      <th scope="col">User ID</th>
                      <th scope="col">답변상태</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:if test="${not empty qnaList}">
                  		<c:forEach items="${qnaList}" var="ql">
                  			<tr>
                      			<td><a href="/adminpage/response/qnaanswer?qnaId=${ql.qnaId}">${ql.qnaId}</a></td>
                      			<td><a href="/adminpage/response/qnaanswer?qnaId=${ql.qnaId}">${fn:substring(ql.qnaQuestion, 0, 20)}...</a></td>
                      			<td><a href="/store/goods?productDisplayId=${ql.productDisplayId}">${fn:substring(ql.productDisplayName, 0, 15)}...</a></td>
                      			<td>${ql.userId}</td>
                      			<td>${ql.qnaStatus}</td>
                    		</tr>
                  		</c:forEach>
                  	</c:if>
                  </tbody>
                </table>
                <!-- End Table with hoverable rows -->
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>