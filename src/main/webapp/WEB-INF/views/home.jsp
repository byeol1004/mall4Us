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
<div>
<%@ include file="/WEB-INF/views/include/mainBanner.jsp"%>
</div>

<!-- 프로모션 -->
<div class="promotion">
	<a href="/products/productsList?prodHiClass=Woman"><div class="promotion1" style="background-image: url('/resources/images/ct1.jpg');"></div></a>
	<a href="/products/productsList?prodHiClass=Man"><div class="promotion2" style="background-image: url('/resources/images/ct2_2.jpg');"></div></a>
	<a href="/products/productsList?prodHiClass=Acc"><div class="promotion3" style="background-image: url('/resources/images/ct3.jpg');"></div></a>
</div>



</body>
<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>
</html>
