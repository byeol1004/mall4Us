<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>

	<h1>Hello world!</h1>
	<button>product</button><button>About</button><button>Q&A</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	logo&nbsp;&nbsp;&nbsp;<button>search</button><button>cart</button>
	<c:if test="${vo != null}">
		<a href="/login/logout">로그아웃</a><br />
		<span>${vo.memName}님 환영합니다!^0^*</span><br />
		<a href="/myPage/myPage">마이페이지</a>
	</c:if>

	<c:if test="${vo == null}">
		<button type="button" onclick="location.href='/login/loginForm' ">로그인</button>
<!-- 		<a href="/login/loginForm">로그인</a> -->

	</c:if>


</body>
</html>
