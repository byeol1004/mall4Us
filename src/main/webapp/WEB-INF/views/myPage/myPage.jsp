<%@ page language="java" contentType="text/html; charset=UTF-8"  trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mall4Us WebSite</title>

<style>
 .recentPd1{margin: 10px;}
.mypagenav{
    height:50px;
/*     width:100%; */
    float: left;
  }

  .mypagenav ul{
      margin-top:10px;
      list-style: none;
      line-height: 40px;
      
  }  
  
  .mypagenav ul li a{
    text-decoration: none;
}  

.mypageCon{
	margin-left: 400px; 
	margin-right: 400px;
	margin-top: 50px;
	margin-bottom: 50px;
}


.con2, .con3{
	width: 1100px; 
}
.con1, .con4{
	width: 500px; 
} 
.con1 p, .con4 p{color: black;}
.con1{margin-right: 50px;}
.con4{margin-left: 50px;}

.box{display: flex;}
 
table th, td{
	border: 1px solid black;
	text-align: center;
	box-sizing: border-box;
}

.table{
	width : 100%;
	align-content: center;
	box-sizing: border-box;
}
 
.prodName{
text-decoration: none; 
color: #646464;
}

/* .recentPd1, .recentPd2, .recentPd3, .recentPd4, .recentPd5{
border: 1px solid black;
width: 50px;
} */
.recentBox{display: flex;}
  
</style>
<!-- <link rel="stylesheet" href="/resources/css/style.css"> -->
</head>
<header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header>
<body>



<div class="totalcontainer"> 
<nav class="mypagenav">

	<ul>
	<h1>Hello, ${vo.memName }</h1>
		<li><a href="#myOder">주문내역</a></li>
		<li><a href="#recentlyViews">최근 본 상품</a></li>
		<li><a href="#">적립금</a></li>
		<li><a href="#">쿠폰</a></li>
		<li><a href="#">회원등급</a></li>
		<li><a href="/myPage/memberModify">회원 정보 수정</a></li>
	</ul>
</nav>

<div class="mypageCon">



<div class="box">
	<div class="con1">
			<h5>Account informations</h5>
<%-- 			<table class="table">
				<tr style="background-color: black; color: white;"> <th>회원등급</th> <th>총 구매 금액</th><th>적립금</th> <th>쿠폰</th></tr>
				
				<tr><td>${coupon.memGrade}</td> <td><fmt:formatNumber type="number" value="${coupon.memAmount}" pattern="#,###"/></td><td><fmt:formatNumber type="number" value="${coupon.memPoint}" pattern="#,###"/></td> <td><c:if test="${coupon.memCoupon!=0}">${coupon.memCoupon}% 쿠폰</c:if></td></tr>
			</table> --%>
			<hr />
			<p>이름 : ${vo.memName}</p> 
			<p>회원 등급 : ${coupon.memGrade}</p>
			<p>총 구매 금액 : <fmt:formatNumber type="number" value="${coupon.memAmount}" pattern="#,###"/></p>
	</div>
	
	<div class="con4">
			<h5>My Wallet</h5>
			<%-- <table class="table">
				<tr style="background-color: black; color: white;"> <th>회원등급</th> <th>총 구매 금액</th><th>적립금</th> <th>쿠폰</th></tr>
				
				<tr><td>${coupon.memGrade}</td> <td><fmt:formatNumber type="number" value="${coupon.memAmount}" pattern="#,###"/></td><td><fmt:formatNumber type="number" value="${coupon.memPoint}" pattern="#,###"/></td> <td><c:if test="${coupon.memCoupon!=0}">${coupon.memCoupon}% 쿠폰</c:if></td></tr>
			</table> --%>
			<hr />
			<p>적립금 : <fmt:formatNumber type="number" value="${coupon.memPoint}" pattern="#,###"/></p>
			<p>쿠폰 : <c:if test="${coupon.memCoupon!=0}">${coupon.memCoupon}% 쿠폰</c:if></p>
	</div>
</div>
<br />
	

	<div class="con2" id="myOder">
		<h5>My Order</h5> 
			<table class="table">
			<tr style="background-color: black; color: white;"><th>주문일</th><th>상품</th><th>상품정보</th><th>주문번호</th><th>진행상태</th></tr>
			<c:forEach var="item" items="${list}"> 
			<tr><td>${item.CARTDATE }</td><td><a href="/products/detail?prodId=${item.PRODID}"><img src="/resources/productImg/thImg/${item.PRODTHUMIMAGE}" width="100" height="100"/></a></td> <td><a class="prodName" href="/products/detail?prodId=${item.PRODID}" >${item.PRODNAME}</a><br /> ${item.PSIZE} <p style="visibility: hidden;">${item.PRODID}</p> </td> <td>${item.CARTID}</td><td>배송완료<br />   
			
			<a href="/myPage/reviewWriteProc?memId=${vo.memId}&prodId=${item.PRODID}"><input type="submit" name="prodId" value="리뷰작성" id="review"></a></td> </tr>
			</c:forEach>
			</table>
	</div>
	<br />
	<div class="con3" id="recentlyViews">
		<h5>최근 본 상품</h5>
		<table class="table">
			<tr style="background-color: black; color: white;"><th>products</th> </tr>
			
			<tr><td>
			<div class="recentBox">
			<c:forEach var="recentlyViews" items="${recentlyViews}">
			
			<div class="recentPd1"><a href="/products/detail?prodId=${recentlyViews.prodId }">
				<img src="/resources/productImg/thImg/${recentlyViews.prodThumImage}" width="200" height="200"/>
				<p>${recentlyViews.prodName }</p>
			</div>
			
			
			</c:forEach>
			</div>
			</td> </tr>
			
		</table>
	</div>	
</div>

</div>


</body>
<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>
</html>
