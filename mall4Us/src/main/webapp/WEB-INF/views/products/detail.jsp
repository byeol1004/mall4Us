<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mall4Us WebSite</title>
<style>


/* .container{
 	display: flex;
	align-items: center;
	justify-content: space-between;
	padding-left: 50px;
	padding-right: 50px; 
	display: flex;
	flex-wrap: wrap;
}*/

* .info{
	float:right;
	margin: 100px 0;
	width: 100%;


	
} 
.container{display: flex; width: 100%; }

.number{
	width:40px;
}

.prodImg{
margin: 50px;
background-attachment: fixed;

}
 
table th, td{
	border: 1px solid black;
	text-align: center;
	box-sizing: border-box;
}
.table{
	width : 100%;
	align-content: center;
/* 	margin-left : 30px; */
	box-sizing: border-box;
/* 	margin-bottom: 100px; */
}
.contents{
	width: 70%;
}
.number{
	width:40px;
}
.review{
	/* padding :0;
	margin :0 auto;
	width:100%;
	text-align: center; */

	width:1000px;
/*     height:500px; */
    position:relative;
/*     left:50%; */
/*     top:50%; */
    margin: 0 auto;
	
}


</style>
</head>
<header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header>
<body>

<div class="totalContainer">

<div class="container">
<div class="prodImg">
	<div><img src="/resources/productImg/thImg/${prodInfo.prodThumImage }" width="600" height="600"/></div>

	<div><img src="/resources/productImg/DeImg/${prodInfo.prodDetailImage }" width="600" height="600"/></div>
</div>


	<div class="info">
		<p>상품명 :&nbsp;${prodInfo.prodName }</p>
		<p>가 격 :&nbsp;${prodInfo.prodPrice }</p>
		
		<p>SIZE</p>
		<c:if test="${vo.memId !=null }">
		 <form action="/products/detailInsert?memId=${vo.memId }&prodId=${prodInfo.prodId }" method="post" > 
				
				<select name="psize" id="">
					<option value="S">S:${invenInfo.sizeS }</option>
					<option value="M">M:${invenInfo.sizeM }</option>
					<option value="L">L:${invenInfo.sizeL }</option>
				</select> 
				수량:<input class="number" value="1" type="number" name="quantity" min="1" />
				<br />
				<br />
				<button type="submit" id="add_cart">장바구니&nbsp;+</button>
			</form>
		<br />
			<form action="/products/carts?memId=${vo.memId }&prodId=${prodInfo.prodId }&psize=psize&quantity=quantity" method="post">
				<button>장바구니보기</button><br /><br />
			</form>
			<%-- <a href="/products/payment?memId=${vo.memId }"><button>결제하기</button></a><br /> --%>
		</c:if>
		
		<c:if test="${vo.memId==null }">
			<form action="#" id="notVO">
				<select name="psize" id="">
					<option value="S">S</option>
					<option value="M">M</option>
					<option value="L">L</option>
				</select> 
				수량:<input class="number" type="number" value="1" name="quantity" min="1" required="required"/>
				<br />
				<br />
				<a href="#">장바구니&nbsp;+</a>
			</form>
		</c:if>
		<br />
		<p>${prodInfo.prodKeyword }</p>
	</div>
	
	
</div>  


<div class="review">
<h1 >review</h1>
<div class="table">
<table>
	<tr style="background-color: black; color: white;"><th>memId</th><th>photo</th><th>contents</th><th>rating</th><th>Date</th></tr>
	<c:forEach var="reviewList" items="${reviewList}">
	<tr><td>${reviewList.memId }</td><td><img src="/resources/productImg/thImg/${reviewList.photo }" width="100" height="100"/></td><td class="contents">${reviewList.contents }</td><td>${ reviewList.rating}</td><td>${reviewList.reviewDate }</td></tr>
	
	</c:forEach>
</table>
</div>
</div>

</div>
<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>

<script>

$('#notVO').click(()=>{
	alert("로그인 후 이용가능합니다");
})

$('#add_cart').click(function(){
	console.log("button")
 alert("상품이 장바구니에 담겼습니다");
});


</script>
	
</body>
</html>