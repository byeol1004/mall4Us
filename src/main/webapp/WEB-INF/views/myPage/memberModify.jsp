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
<h1>Member Modify Page</h1>
<form action="/myPage/memberModifyProc" method="post">
	Id : <input type="text" name="memId"><br />
	Name : <input type="text" name="memName"><br />
	Pwd : <input type="password" name="memPwd"><br />
	Pwd Chec : <input type="password"><br />
	
	Area : <input type="text" name="memLivingArea"><br />
	Address : <input type="text" name="memAddress"><br />
	Phone : <input type="text" name="memPhone"><br />
	
	<button type="submit">수정</button>
	<button type="reset">취소</button>
<!-- 	<button type="submit">탈퇴</button> -->
</form>
</body>
</html>
