<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <!-- Favicons -->
  <link href="/resources/adminpage/assets/img/favicon.png" rel="icon">
  <link href="/resources/adminpage/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/adminpage/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/adminpage/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/adminpage/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/adminpage/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/resources/adminpage/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/resources/adminpage/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/resources/adminpage/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/adminpage/assets/css/style.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title> <tiles:getAsString name="title"></tiles:getAsString> </title>
</head>
<body>
	
	<tiles:insertAttribute name="topbar"></tiles:insertAttribute>
	

	<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>
	
	<!-- Content Wrapper -->
	<tiles:insertAttribute name="content"></tiles:insertAttribute>
	<!-- End of Content Wrapper -->
		
		
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
    
    <!-- Vendor JS Files -->
  <script src="/resources/adminpage/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="/resources/adminpage/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/adminpage/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="/resources/adminpage/assets/vendor/echarts/echarts.min.js"></script>
  <!-- <script src="/resources/adminpage/assets/vendor/quill/quill.min.js"></script> -->
  <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
  <script src="/resources/adminpage/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="/resources/adminpage/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="/resources/adminpage/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/adminpage/assets/js/main.js"></script>


</body>
</html>