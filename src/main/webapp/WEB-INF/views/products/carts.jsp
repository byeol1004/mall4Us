<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<html>
 
<head>
	<title>Mall4Us WebSite</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/css/cart.css">
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
 	<!--<script src="js/popper.js"></script>-->
 		<!-- <script src="/resources/js/bootstrap.min.js"></script> -->
	<style>
/* button#reCal{
	float: right; 
} */

button#totalCal{
	width: 200px; 
}
.payment{
	float: right;
}

</style>
</head>
<header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header>
<body>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-4">
				<h1 class="heading-section">Cart List</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<h3 class="h5 mb-4 text-center"></h3>
					<div class="table-wrap">
						<table class="table" id="cart">
		  				<thead class="thead-primary">
								<tr><th>계산선택</th><th>&nbsp;</th><th>상품명</th><th>가격</th><th>수량</th><th>소계</th><th>장바구니제거</th></tr>
							</thead>
			<c:forEach var="item" items="${list}">
		    				<tr class="alert" role="alert">
		    					<td>
		    						<label class="checkbox-wrap checkbox-primary">
						 				<input type="checkbox" class ="select" checked>
						 				<span class="checkmark"></span>
										</label>
		    					</td>
		    					<td>
										<a href="/products/detail?prodId=${item.PRODID}"><img src="/resources/productImg/thImg/${item.PRODTHUMIMAGE }" width="100" height="100" /></a>
	    						</td>
	      					<td>
						      	<div class="email">
						      		<a href="/products/detail?prodId=${item.PRODID}"><span>${item.PRODNAME}</span></a>
							      	</div>
							    </td>
 		      				<td class="unitPrice">${item.PRODPRICE}</td>
 		      				
		      				<td >
	        					<div class="input-group">
	        					<!-- 장바구니 불러오기 -->
	        					<span class="quantity">${item.QUANTITY}</span>
          						<%-- <input type="text" name="quantity" class="quantity1 quantity form-control input-number" value="${item.QUANTITY }" min="1" max="100"> --%>
          					</div>
          				</td>
          				
          				<td class="subTotal"></td>
		      				<td>
		      				<input type="hidden" value="${item.CARTID}" class="cartId" id="cartId"/>
		      				<!-- 상품삭제 -->
		      					<a href="/products/cartsDelete?memId=${vo.memId}&cartId=${item.CARTID}&prodId=${item.PRODID}">
		      						<button><i class="fa fa-close"></i></button>
		      						<!-- <button>delete</button> -->
			      					<!-- <button type="submit" class="close" data-dismiss="alert" aria-label="Close">
	          						<span aria-hidden="true"><i class="fa fa-close"></i></span>
	        						</button> -->
        						</a>
        					</td>
		    				</tr>
			</c:forEach>
		
						</table>
						total: &#8361;&nbsp;<span id="total"></span>
						<a href="/products/cartSelect?memId=${vo.memId }" class="payment"><input type="submit" name="cartId" value="결제하기" id="selectSubmit"></a>
			</div>
		</div>
	</div>
</div>
</section>	   

<script>

function init(){
	reCalculate();
}    

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var checkArray = new Array();//전역변수로 정의
var cartArray = new Array();

let reCalculate = function(){
 	var total = 0;
 	checkArray = []; 
 	cartArray = [];
 	//checkbox change가 발생하면 수행되는 루틴으로 항상 새로 clear한다
 	
 	$("#cart .alert").each(function() {
 		 var cartId = parseInt($(this).find(".cartId").val());
 		 cartArray.push(cartId);
 		 console.log("cartId", cartId);
         var qty = parseInt($(this).find(".quantity").text());
         console.log(qty);
         var unit = parseInt($(this).find(".unitPrice").text());
         console.log(unit);
         
         var subtotal = isNaN(qty * unit) ? 0 : qty * unit;
         $(this).find(".subTotal").text(subtotal);
         
         var checked = $(this).find(".select").is(':checked');         
         checkArray.push(checked);
         //check된 값을 checkArray에 저장

         
         
         if (checked){
          if(!isNaN(subtotal))
              total+=subtotal;
         }
         
         
     });
 	console.log('total' + total)
 	 $("#total").html(numberWithCommas(total));
 	 
 	console.log(checkArray)
}

$(function(){

	  init();
		
    $('.select').change( reCalculate );

    $("#cart").keyup(  reCalculate );
    
});



	$("#selectSubmit").click(function(e) {

		console.log('clicked');
		$.ajax({
			url : "/products/cartSelect",
			type : "POST",
			data : {
				values : checkArray,
				carts : cartArray,
			},
			sucess : function(data) {
				console.log(data);
			},
			error : function(xhr) {
				console.log(xhr.status);
			},
			complete : function() {
				location.href = '/products/payment?cart=${item.CARTID}';
			}
		});
	});
</script>

<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>	
</body>
</html>