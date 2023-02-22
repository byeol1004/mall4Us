<%@ page language="java" contentType="text/html; charset=UTF-8"  trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mall4Us WebSite</title>
<style>
.about{
	width : 100%;
	height : 1150px;
/* 	border : 1px solid black; */
/* 	display : inline-block; */
/* 	margin : 0 auto; */
	background-position: center;
</style>
</head>
<header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header>
<body>

<div class="about" style="background-image: url('/resources/images/about.jpg');"></div>
</body>
<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>
</html>
