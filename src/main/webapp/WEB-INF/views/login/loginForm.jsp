<%@ page language="java" contentType="text/html; charset=UTF-8"  trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인</h1>
	<form action="/login/login" method="post">
		ID<input type="text" name="memId"/><br />
		PWD<input type="text" name="memPwd"/><br />
		<button>로그인</button>

	</form>
	<button type="button" onclick="location.href='/myPage/memberJoin' ">회원가입</button>
</body>
</html>
