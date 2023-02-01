<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Mall4Us WebSite</title>
<style>
.container{
	display: flex;
}

.payment1{
position : fixed;
left: 60px;
top:110px;
width: 30%;
margin: 50px; 
padding: 50px;
}

.payment2{
position:relative;
left :40%;
/* top: 10px; */
border: 1px solid black;
width: 50%; 
margin: 20px; 
padding: 30px;
display: flex;
flex-direction: column; 
text-align: center;

} 
.flex{
	display: flex;
	padding: 0;
}
.img{
	float: left;
	margin: 0;
}
.orderInfo{
	width: 300px; 
	text-align: left;
	margin-left: 30px;
	margin-top : 50px;
	float: left;
}

.orderprod{width: 500px;}
.payInfo{
	padding-left:20px;
	text-align: left;
}
footer{
	position: relative;
	top:10%; 
	left :0;
	right: 0;
}

.prodId{text-decoration: none; color: #646464;}

.cupon, .point{color: black;}
</style>
</head>
<header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header>
<body>

<div class="container">
<div class="payment1">
	<h3>배송정보</h3>
	<table>
		<tr>
		<td>수령인&nbsp;<input type="text" value="${vo.memName}" ></td>
		</tr>
	</table>

	<table >
		<tr>
		<td>배송지&nbsp;<input type="text" value="${vo.memAddress}" ></td>
<!-- 		<td>배송지&nbsp;<textarea rows="1" cols="50" name="content"></textarea></td> -->

		</tr>
	</table>

	<table>
		<tr>
		<td>연락처&nbsp;<input type="text" value="${vo.memPhone}" ></td>
		</tr>
	</table>
	<hr />
	
	<h3>쿠폰/포인트</h3> <!-- ★★★★★쿠폰 -->	
	<p class="cupon">쿠폰&nbsp;&nbsp;&nbsp; <select name="" id=""><option value="">
	<c:if test="${coupon.memCoupon!=0}">회원가입 ${coupon.memCoupon}% 쿠폰</c:if></option></select></p> 
	<p class="point">포인트&nbsp;<input type="text" value="${coupon.memPoint}" readonly/></p> 
	<hr />
	

	<h3>결제방법</h3>
	
	신용/체크카드&nbsp;<input type="checkbox" name="food02" value="jjajang">
	<!-- <button type="submit">신용/체크카드</button> -->
</div>



	<div class="payment2">
		<h3>주문상품 정보</h3>
		<hr />

		<div class="orderprod">
			<c:forEach var="item" items="${list}">
				<div class="flex">
					<div class="img" ><a href="/products/detail?prodId=${item.PRODID}"><img src="/resources/productImg/thImg/${item.PRODTHUMIMAGE}" width="200" height="200" class="Img" /></a></div>
					<div class="orderInfo">
						<a class="prodId" href="/products/detail?prodId=${item.PRODID}"><span>${item.PRODNAME}</span></a><br /> 
						<span>옵션 : ${item.PSIZE}</span><br /> 
						수량 : <span class="qty" > ${item.QUANTITY}</span><br />
						<%-- <input class="qty" type="number" value="${item.QUANTITY}" name="quantity" min="1" required="required"/> --%>
						가격 : <span>${item.PRODPRICE}</span><br />
						총가격 : <span class="productSubtotal"></span> <span style="visibility: hidden;"> <span class="price"> ${item.PRODPRICE}</span></span><br />
						
						<span style="visibility: hidden;">CartId : ${item.CARTID}</span> 
					</div>
				</div>
				<br />
			</c:forEach>
		</div>


<!-- 결제 -->
	<div class="payInfo">
		상품금액 : <span id="subtotal"></span>원<br /> 
		할인금액 : <span id="discount"></span>원<br /> 
		<span>배송비 : 0</span>원<br />
		결제금액 : <span id="total"></span>원<br />
	</div><br />
		<button id="check_module" type="button">결제하기</button>
		
	</div>

</div>

<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function init() {    
//init : 처음 실행 할때 초기값을 갖는 함수나 객체를 생성할 때 사용	
		var total = 0;
		var subtotal = 0;
		var discount = 0; 
		var productSubtotal = 0;
		var coupon = '${coupon.memCoupon}';
		var point = '${coupon.memPoint}';
		
		
	$(".orderInfo").each(function(){
		  var qty = parseInt($(this).find(".qty").text());
		  var price = parseInt($(this).find(".price").text());
		  
		  var productSubtotal = qty * price;

//		  console.log('!!!수량!!!'+qty)
//		  console.log('!!!쿠폰!!!'+coupon)
//		  console.log('!!!포인트!!!'+point)

		  $(this).find(".productSubtotal").html(productSubtotal);
		  

		  subtotal += productSubtotal ;
//		  console.log('subtotal =' + subtotal)
		
		  
		})
		
		total  = subtotal * (1-coupon/100)-point;
		discount = subtotal - total;
		$("#subtotal").html(subtotal);
		$("#total").html(total); //Id가 total인 곳에 total값을 html로 입력
		$("#discount").html(discount);
	
	};	
</script>


<script>
$(function (){	
	  init();
	
    $("#check_module").click(function () {
    	
   	let total = $("#total").html();
    	console.log('total'+total)
    	
        var IMP = window.IMP; 
        IMP.init('imp53513450');  // 가맹점 식별코드
        IMP.request_pay({
            pg: 'kcp', 
            /*  'kakaopay':카카오페이, 
                'html5_inicis':이니시스(웹표준결제)
                'kcp' : KCP(실제 미출금)
                */
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            amount: total, 
            buyer_email: 'Mall4Us@gmail.com',
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
             	var link = '/products/paymentSuccess?memId=${vo.memId}';
                var msg = '결제가 완료되었습니다.';
                $.ajax({ //ajax는 데이터를 넘겨줄 때 사용
                	url: '/products/paymentProcess',//데이터를 요청하는 주소
                	type : 'post',
                	data:{
                		'amount': total
                	}
                });
 
            } else {
            	var msg = '결제에 실패하였습니다.';
                var link = 'http://localhost/products/payment?memId=${vo.memId}';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
                location.href=link;
            }
            alert(msg);
            location.href=link;
        });
    });
    
});    //end of function
</script> 



<footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer>
</body>

</html>
