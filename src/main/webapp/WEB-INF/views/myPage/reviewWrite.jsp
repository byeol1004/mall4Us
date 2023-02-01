<%@ page language="java" contentType="text/html; charset=UTF-8"  trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mall4Us WebSite</title>
<style>

.con2{ 
margin: 50px;

}
</style>
</head>
<header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header>
<body>

<!-- 리뷰작성 -->
<div class="con1">
<div class="con2">
<h3>Write a Review</h3>
<form action="/myPage/reviewWrite" >
rating : <input type="text" name="rating" value="평점을 입력해주세요 :)"><br />
Content : <textarea rows="20" cols="50" name="contents"></textarea><input type="text" style="visibility: hidden;" name="memId" value="${vo.memId }"/><input type="number" style="visibility: hidden;" name="prodId" value="${prodId}"/><br />
Add file : <input type="file" name="photo"><br />
<input type="submit" value="submit"/>
<input type="reset" value="reset"/>
</form>
</div>
</div>
<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>
<script>

console.log('@@@@@'+'${prodId}');
</script>
</body>
</html>
