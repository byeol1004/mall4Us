
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<title>Mall4Us WebSite</title>

<style>
*{
	margin: 0;
	padding: 0;
}
.subject{
	margin: 20px;
	display: flex;
	flex-wrap: nowrap;
	align-items: baseline;
}
.container{
	width : 100%;
	margin : 0px;
	padding :0px;
	display: flex;
	flex-wrap: wrap;
}
#productList{
	width : 310px;
	margin-left : 30px;
	margin-right : 30px;
	margin-top : 30px;
	padding : 20px;
	flex-direction: column; 
	display: flex;
	border: 1px solid black;
	border-collapse: collapse;
	border-spacing: 0; 
	align-items: center;
}

img {
	border: 1px solid grey;
	border-collapse: collapse;
	
} 
.one{
	flex-wrap: wrap;
	display: flex;
} 
.number{
	width:40px;
}
#sortMethod{
	position: absolute;
	top : 235px;
	right: 240px;
} 
</style>
</head>
 <header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header> 
<body>
	<div class="subject">
	<h3>
	<c:if test="${not empty prodHiClass }">
	${prodHiClass }
	</c:if>
	</h3>
	<h4>
	<c:if test="${not empty prodMiClass }">
	&nbsp;>&nbsp;${prodMiClass }
	</c:if>
	</h4>
	<h5>
	<c:if test="${not empty prodLoClass }">
	&nbsp;>&nbsp;${prodLoClass }
	</c:if>
	</h5>
	</div>
	
	 <select name="sortMethod" id="sortMethod">
		<option value="">최근상품순</option>
		<option value="priceAsc">가격낮은순</option>
		<option value="priceDesc">가격높은순</option>
		<option value="soldDesc">판매순</option>
		<option value="reviewDesc">후기많은순</option>
	</select>
	
<div class="container">
	 <div class="one"></div>
		<c:forEach var="item" items="${list}">
			<div id="productList">
				<p>상품번호&nbsp;${item.prodId }</p>	
				<a href="/products/detail?prodId=${item.prodId }"><img src="/resources/productImg/thImg/${item.prodThumImage }" width="300" height="300"/></a><br />
				<a href="/products/detail?prodId=${item.prodId }"><p>상품명 :&nbsp;${item.prodName }</p></a>
				<p>가 격 :&nbsp;${item.prodPrice }</p>
				
					 <c:if test="${ vo.memId !=null}"> 
						<form action="/products/prodInsert?memId=${vo.memId }&prodId=${item.prodId }&prodHiClass=${item.prodHiClass}&prodMiClass=${item.prodMiClass}&prodLoClass=${item.prodLoClass}" method="post">
							<select name="psize" id="">
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
							</select>
							수량:<input class="number" type="number" value="1" name="quantity" min="1" required="required"/>
							<button type="submit" class="btn-cartAdd">장바구니담기</button>		
						</form>
					 </c:if>  
			</div>
		</c:forEach>
			
</div>

 
<script type="text/javascript">

$('.btn-cartAdd').click(function(){
	$(this).each(function(){
		alert("상품이 장바구니에 담겼습니다");
	});
});

$('#sortMethod').on('change', function(){
	var sortMethod = $('#sortMethod option:selected').val();
	console.log("===="+ sortMethod);
 	console.log("prodHiClass"+ "${prodHiClass}");
	console.log("prodMiClass"+ "${prodMiClass}");
	console.log("prodLoClass"+ "${prodLoClass}");  
	 
	$.ajax({
		type : "GET",
		url: "/products/sort",
		dataType : "json",
		data: { "sortMethod" : sortMethod,
			 	"prodHiClass" : "${prodHiClass}",
				"prodMiClass" : "${prodMiClass}",
				"prodLoClass" : "${prodLoClass}"
		},
		sucess: function(data){
             console.log(data.responseText);
          },
        error: function(xhr, status, error) {
            console.log(xhr.responseText);
          },
        complete: function(){
             location.href='/products/productOnlyList';
          }
	});
	//location.href='/products/productOnlyList';
})

</script>
<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>
</body>
</html>