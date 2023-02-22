<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.promotion{
	display: flex;
	flex-wrap: nowrap;
	padding-left: 30px;
	padding-right: 30px;
}
</style>
</head>
<body>
<div class="promotion">
	<a href="#"><div class="promotion1" style="background-image: url('/resources/images/promo1.jpg');"></div></a>
	<a href="#"><div class="promotion2" style="background-image: url('/resources/images/promo2.jpg');"></div></a>
	<a href="#"><div class="promotion3" style="background-image: url('/resources/images/promo3.jpg');"></div></a>
</div>
</body>
</html>