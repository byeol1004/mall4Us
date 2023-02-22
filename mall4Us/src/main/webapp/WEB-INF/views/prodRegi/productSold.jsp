<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="/resources/js/jquery-3.3.1.min.js"></script>

	<style type="text/css">
	
	*{
		list-style: none;
		text-decoration: none;
	}
	
	#container{
		width: 100%;
	}
	
	#productList{
		margin: 0 auto;
		width: 80%;
		display: flex;
		flex-direction: column;
	}
	#productList h1{
		text-align:center;
		margin: 1em auto;
	}
	
	#total{
		margin-left: auto;
	}
	
	#productList table, #productList th, #productList td {
		border: 1px solid skyblue;
		border-collapse: collapse;
	}
	
	td, th{
		padding: 0 20px 0 20px;
		margin: 0 20px 0 20px;
	}
	
	td:first-child, th:first-child{
		padding: 0 10px 0 10px;
		margin: 0 10px 0 10px;
	}
	#total{
		float: right;
	}
	
	.sort:hover {
		background: gray;
	}
	
	.sort a:hover {
		color: tomato;
	}

	th a {
  width: 100%;
  display: block;
}

	</style>

</head>
<body>
<div id="outer">

	<div id="container">
			<div id="productList">
				<h1>제품 판매 현황</h1>
				<table>
					<tr><th>제품사진</th>

					<c:choose>
						<c:when test="${sort==1}"> 
							<th class="sort"><a href="/manager/sold?sort=11">번호(높은순)</a>	</th>
						</c:when>
						<c:when test="${sort==11}"> 
							<th class="sort"><a href="/manager/sold?sort=1">번호(낮은순)</a></th>
						</c:when>
						<c:otherwise>  
							<th class="sort"><a href="/manager/sold?sort=1">번호</a></th>
						</c:otherwise>
				  </c:choose>

					<th>제품명</th>
					<th class="sort"><a href="/manager/sold?sort=2">분류</a></th>
					
					<c:choose>
						<c:when test="${sort==3}"> 
							<th class="sort"><a href="/manager/sold?sort=33">가격(높은순)</a></th>
						</c:when>
						<c:when test="${sort==33}"> 
							<th class="sort"><a href="/manager/sold?sort=3">가격(낮은순)</a></th>
						</c:when>
						<c:otherwise>  
							<th class="sort"><a href="/manager/sold?sort=3">가격</a></th>
						</c:otherwise>
				  </c:choose>

					<th>수량</th>

 					<c:choose>
						<c:when test="${sort==4}"> 
							<th class="sort"><a href="/manager/sold?sort=44">판매일자(최근순)</a></th>
						</c:when>
						<c:when test="${sort==44}"> 
							<th class="sort"><a href="/manager/sold?sort=4">판매일자(오래된순)</a></th>
						</c:when>
						<c:otherwise>  
							<th class="sort"><a href="/manager/sold?sort=4">판매일자</a></th>
						</c:otherwise>
				  </c:choose> 
					<th>소계</th>
					</tr>
	
					<c:forEach var="item" items="${list}">
						<tr class="item">
					 		<td style="text-align:center"><img src="/resources/productImg/thImg/${item.PRODTHUMIMAGE}" width="50" alt="" /></td> 
							<td>${item.PRODID}</td>
							<td>${item.PRODNAME}</td>
							<td>${item.PRODHICLASS}/${item.PRODMICLASS}					
								<c:if test="${not empty item.PRODLOCLASS}">
									/${item.PRODLOCLASS}
								</c:if>
							</td>
							<td style="display: none"  class="price" style="text-align:right">${item.PRODPRICE}</td>
							<td style="text-align:right" >&nbsp;&#8361; <fmt:formatNumber type="number" value="${item.PRODPRICE}" pattern="#,###"/></td>
							
	 						<td class="qty" style="text-align:center">${item.QUANTITY}</td>
	 						
	 						<c:choose>
		 						<c:when test="${not empty item.CARTDATE}"> 
			 						<td>${item.CARTDATE}</td> 
								</c:when>
	
								<c:otherwise>
			 						<td style="text-align:center">-</td> 
								</c:otherwise>
							</c:choose>
	 						
							<td style="display: none" class="subtotal" style="text-align:right"></td>
							<td style="text-align:right" class="subtotalView">&nbsp;&#8361; <span></span></td>
							
						</tr>
					</c:forEach>
				</table>
			 	<p id="total">전체 매출: &nbsp;&#8361; <span></span></p>
			 </div>
	</div>

</div>
<script>
$.numberWithCommas = function (x) {
	  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

$(function() {
	var total = 0;
	
	$(".item").each(function() {
        var qty = parseInt($(this).find(".qty").text());
        var price = parseInt($(this).find(".price").text());
        var subtotal = qty * price;

        //console.log(qty);
        //console.log(price);
        //console.log(subtotal);

        $(this).find(".subtotal").text(subtotal);
        $(this).find(".subtotalView span").text($.numberWithCommas(subtotal));

        total += subtotal;
        
        $("#total span").html($.numberWithCommas(total));

	})
	})();

</script>

</body>
</html>