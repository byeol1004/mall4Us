
<%@page import="javax.servlet.http.Cookie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mall4Us WebSite</title>

<style>
 
.mypagenav{
    height:50px;
    width:100%;
  }

  .mypagenav ul{
      margin-top:10px;
      list-style: none;
      line-height: 40px;
  }  
  
  .mypagenav ul li a{
    text-decoration: none;
}  
 
.container{
	margin: 0;
	padding: 0;
} 
.memInfo{
	align-content: center;
	margin-left: 30%;
}
.views{
	margin-left: 30%;
	padding:0;
	width : 350px;
	align-content: center;

}
/* footer{
 	position :absolute;
 	left :0;
 	right:0;
 	bottom: 10px;
 }  */
</style>

</head>
<header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header>
<body>


<hr />
<nav class="mypagenav">
	<ul>
		<li><a href="/myPage/orderList">주문내역</a></li>
		<li><a href="#">최근 본 상품</a></li>
		<li><a href="#">회원 정보</a></li>
		<li><a href="/myPage/memberModify">회원 정보 수정</a></li>
	</ul>
</nav>
<div class="container">
	<div class="memInfo">
		<p>회원 정보</p>
		<span>Name&nbsp;:&nbsp;kkkk</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span>Grade&nbsp;:&nbsp;Gold</span><br />
		<hr />
		<span>Amount&nbsp;:&nbsp;1,000,000,000</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span>Mileage&nbsp;:50,000,000</span><br />
		<hr />
		<span>Coupon&nbsp;: 필요없음</span>
	</div>
<br />
<br />
	
	<div class="views">
	<p>최근 본 상품</p>
	<p>${message }</p>
		<c:forEach var="recentlyViews" items="${recentlyViews}">
			
			<a href="/products/detail?prodId=${recentlyViews.prodId }">
			<img src="/resources/productImg/thImg/${recentlyViews.prodThumImage}" width="350" height="350"/>
			<p>${recentlyViews.prodName }</p>
			
		</c:forEach>
	</div>
	
</div>
	



<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>

</body>
</html>
