<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"></tiles:getAsString> </title>
<link href='${pageContext.request.contextPath}<tiles:getAsString name="css" />' rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<c:choose>
	<c:when test="${ not empty askCategoryMajor }">
		<c:if test="${ askCategoryMinor eq 'TOP10' }">
			<link href='${pageContext.request.contextPath}<tiles:getAsString name="css2" />' rel="stylesheet">
		</c:if>
		
	</c:when>
	<c:otherwise>
	<link href='${pageContext.request.contextPath}<tiles:getAsString name="css2" />' rel="stylesheet">
	</c:otherwise>
</c:choose>
</head>
<body>

<!-- header -->
<tiles:insertAttribute name="header"/>

<!-- content -->
<tiles:insertAttribute name="content"/>

<!-- footer -->
<tiles:insertAttribute name="footer"/>

</body>
</html>