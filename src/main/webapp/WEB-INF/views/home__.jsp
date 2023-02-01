<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Mall4Us WebSite</title>
</head>
<header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header>
<body>


<!-- 메인 배너 -->
<!-- <div class="banner" style="background-image: url('/resources/images/banner2_2.jpg');"></div>  -->
<div class="banner" style="background-image: url('/resources/images/banner4_1.jpg');"></div> 
<!-- <div class="banner" style="background-image: url('/resources/images/banner3.jpg');"></div> --> -->




<!-- 프로모션 -->
<div class="promotion">
	<a href="#"><div class="promotion1" style="background-image: url('/resources/images/promo1.jpg');"></div></a>
	<a href="#"><div class="promotion2" style="background-image: url('/resources/images/promo2.jpg');"></div></a>
	<a href="#"><div class="promotion3" style="background-image: url('/resources/images/promo3.jpg');"></div></a>
</div>



<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>



</body>
</html>
