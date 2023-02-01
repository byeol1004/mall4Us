<%@ page language="java" contentType="text/html; charset=UTF-8"  trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mall4Us WebSite</title>

<style>
.con{
height: 420px;
}
.total{
	background-color: beige;
	width : 25%;
	height: 350px;
	margin: 0 auto;	
	margin-top: 30px;
} 
.title, .title2{
	width : 100%;
	height: 60px;
	background-color: black;
	text-align:center;
	background-position: center;
}

.title h1, .title2 h1{
	color: white;
	position: center;
	font-size:1.5em;
	line-height: 60px;
}

.box1{
	width : 450px;
	border: 1px solid gray;
	margin: 10px;
/* 	margin-top: 10px; */
	padding: 10px;
}


</style>
</head>
<header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header>
<body>

<div class="con">
<div class="total">
<div class="title">
<h1>회원정보 입력</h1>
</div>
<form action="/myPage/memberModifyProc?memId=${vo.memId }" method="post">
	<div class="box1">
	<table><tr><td>Id : <input type="text" name="memId" value="${vo.memId}"></td></tr></table>
	<table><tr><td>Name : <input type="text" name="memName" value="${vo.memName}"></td></tr></table>
	<table><tr><td>Pwd : <input type="password" name="memPwd" value="${vo.memPwd}"></td></tr></table>
<!-- 	Pwd Check : <input type="password" ><br /> -->
	
	<table><tr><td>Area : <input type="text" name="memLivingArea" value="${vo.memLivingArea}"></td></tr></table>
	<table><tr><td>Address : <input type="text" name="memAddress" value="${vo.memAddress}"></td></tr></table>
	<table><tr><td>Phone : <input type="text" name="memPhone" value="${vo.memPhone}"></td></tr></table><br />
	
	<c:if test="${vo.memId !=null }">
	<button id="modify" type="submit">수정</button>
	
	</c:if>


	
	<button type="reset">취소</button>
<!-- 	<button type="submit">탈퇴</button> -->
	</div>
</form>
<div class="title2">
<h1>수정하기</h1>
</div>
</div>
</div>

<script type="text/javascript">
$('#modify').click(function(){
   $(this).each(function(){
      alert("회원정보가 수정되었습니다.");
   });
});
</script>

<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>
</body>
</html>
