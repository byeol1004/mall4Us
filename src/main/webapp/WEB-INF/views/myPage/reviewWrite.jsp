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
<h1>Write a Review</h1>
리뷰작성

<form action="/myPage/reviewList" method="post">
Title : <input type="text" name="title"><br />
Content : <textarea rows="20" cols="50" name="content"></textarea><br />
Add file : <input type="file" name="file"><br />
<input type="submit" value="submit"/>
<input type="reset" value="reset"/>


</form>
</body>
</html>
