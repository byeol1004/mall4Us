<%@ page language="java" contentType="text/html; charset=UTF-8"  trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style>
.totalcontainer{
	margin-left: 400px; 
	margin-right: 400px;
	margin-top: 50px;
	margin-bottom: 50px;
/* 	float: inherit; */
/* 	text-align: center; */
}
.con1, .con2, .con3, .con4{
	width: 1000px; 
}
.msg{
text-align: center;
}

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

.prodName{text-decoration: none; color: #646464;}

</style>
<head>
<meta charset="UTF-8">
<title>Mall4Us WebSite</title>
</head>
<header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header>
<body>
<div class="totalcontainer">


		<!-- <h1>주문이 완료되었습니다.</h1> -->
		
		

		
		


	 <div class="con1">
	 <div class="msg"><h1>주문이 완료되었습니다.</h1></div><br />
		<h3>My Order</h3>
		<table class="table">
			<c:forEach var="item" items="${list}">
			<tr style="background-color: black; color: white;"><th>상품</th> <th>상품정보</th> <th>수량</th> <th>주문번호</th> <th>진행상태</th></tr>
			
			<tr><td><a href="/products/detail?prodId=${item.PRODID}"><img src="/resources/productImg/thImg/${item.PRODTHUMIMAGE }" width="100" height="100"/></a></td> <td><a class="prodName" href="/products/detail?prodId=${item.PRODID}" >${item.PRODNAME}</a><br /> ${item.PSIZE} <br />${item.PRODPRICE}</td> <td>${item.QUANTITY}</td><td class="contents">${item.CARTID}</td> <td>결제완료</td> </tr>
			</c:forEach>	
		</table>
		
	</div> 
	
	<div class="con2">
		<h3>Payment</h3>
		<table class="table">
			<tr style="background-color: black; color: white;"><th>결제금액</th> </tr>
			
			<tr><td style="text-align:center"><fmt:formatNumber type="number" value="${amount}" pattern="#,###"/></td> </tr>
			
		</table>
		
	</div>
	
	<div class="con3">
		<h3>Shipping address</h3>
		<table class="table">
			<tr style="background-color: black; color: white;"><th>수령인</th> <th>배송지</th> <th>연락처</th> </tr>
			
			<tr><td>${vo.memName}</td> <td>${vo.memAddress}</td> <td>${vo.memPhone}</td> </tr>
			
		</table>
		
	</div>
	
</div>

<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>
</body>
</html>
