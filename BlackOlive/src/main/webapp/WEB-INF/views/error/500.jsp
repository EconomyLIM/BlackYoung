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
	<div id="Container">
		<div class="error-page default">
			<h2>페이지를 제대로 표시할 수 없어요</h2>
			<p>이용에 불편을 드려 죄송합니다.<br>
				문제를 해결하기 위해 열심히 노력하고 있으니<br>
				조금 뒤 다시 시도해주세요.</p>
			<p class="error-code">(TWEFOQ)</p>
			<div class="btnArea">
				<button type="button" class="line" onclick="javascript:history.back();">이전 페이지</button>
				<button type="button" onclick="location.href='<c:url value='/'/>'">홈으로 가기</button>
			</div>
		</div>
	</div>
</body>
</html>