<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>블랙올리브영 온라인몰</title>
</head>
<body>
	<div id="Wrapper" class="error-wrap">
	<!-- #Header -->
	<div id="Header">
		<div class="top_util">
			<ul class="menu_list">
			</ul>
		</div>
		<div class="header_inner">
			<h1><a href="<c:url value='/'/>"><img src="https://www.oliveyoung.co.kr/pc-static-root/image/comm/h1_logo.png" alt="올리브영"></a></h1>
		</div>
	</div>
	<!-- //#Header -->

	<!-- #Container -->
	<div id="Container">

		<div class="error-page">
			<h2>페이지를 찾을 수 없어요(A4)</h2>
			<p>입력하신 주소가 사라졌거나 다른 페이지로 바뀌었어요.<br>주소를 다시 확인해주세요.</p>
			<div class="btnArea">
				<button type="button" class="line" onclick="history.back();">이전 페이지</button>
				<button type="button" onclick="location.href='<c:url value='/'/>'">홈으로 가기</button>
			</div>
		</div>

	</div>
	<!-- //#Container -->

</div>
</body>
</html>