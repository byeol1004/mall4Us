<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<html>
 
<head>
	<title>Cart List</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/resources/css/cart.css"> 
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
 <!-- 	<script src="/resources/js/bootstrap.min.js"></script> -->
	<style>
button#reCal{
	float: right; 
}

button#totalCal{
	width: 200px; 
}

	</style>
</head>

<body>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-4">
				<h2 class="heading-section">나의 카트 보기</h2>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<h3 class="h5 mb-4 text-center"></h3>
					<div class="table-wrap">
						<table class="table" id="cart">
		  				<thead class="thead-primary">
								<tr><th style="hidden">${cartId}</th><th>계산선택</th><th>&nbsp;</th><th>상품명</th><th>가격</th><th>수량</th><th>소계</th><th style="text-align:right">삭제</th></tr>
							</thead>

		    				<tr class="alert" role="alert">
		    					<td style="hidden">
		    						${cartId}
		    					</td>
		    					<td>
		    						<label class="checkbox-wrap checkbox-primary">
						 				<input type="checkbox" class ="select" name="cartId" checked>
						 				<span class="checkmark"></span>
										</label>
		    					</td>
		    					<td>
										<img src="/resources/imgs/2.jpg" width="100" alt="" />
	    						</td>
	      					<td>
						      	<div class="email">
						      		<span>${prodName}</span>
							      </div>
							    </td>
 		      				<td class="unitPrice">18000</td>
 		      				
		      				<td class="quantity">
	        					<div class="input-group">
          						<input type="text" name="quantity" class="quantity1 quantity form-control input-number" value="3" min="1" max="100">
          					</div>
          				</td>
          				<td class="subTotal"></td>
          				
		      				<td>
         					<form action="/manager/delete" class="form_test">
	      						<input type="hidden" name="cartId" value=1>
          					<button  type="submit" class="close" data-dismiss="alert" aria-label="Close">
       							<span aria-hidden="true"><i class="fa fa-close"></i></span>
     								</button>
       						</form>
        					</td>

		    				</tr>

		    				<tr class="alert" role="alert">
		    					<td style="hidden">
		    						${cartId}
		    					</td>
		    				
		    					<td>
		    						<label class="checkbox-wrap checkbox-primary">
						 				<input type="checkbox" class ="select" name="cartId" checked>
						 				<span class="checkmark"></span>
										</label>
		    					</td>
		    					<td>
										<img src="/resources/imgs/1.jpg" width="100" alt="" />
	    						</td>
	      					<td>
						      	<div class="email">
						      		<span>${prodName}</span>
							      	</div>
							    </td>
		      				<td class="unitPrice">24000</td>
	          		 		<form action="/manager/delete" class="form_test">

		      				<td class="quantity">
	        					<div class="input-group">
          						<input type="text" name="quantity" class="quantity1 quantity form-control input-number" value="2" min="1" max="100">
          					</div>
          				</td>
          				<td class="subTotal"></td>
          				
			      			<td>
		          		 		<input type="hidden" name="cartId" value=2>
	          					<button type="submit" class="close" data-dismiss="alert" aria-label="Close">
	          					<span aria-hidden="true"><i class="fa fa-close"></i></span>
	        						</button>
	        				</td>
	                  </form>   

		    				</tr>
						</table>

						total: <button id="totalCal">&#8361;&nbsp;<span id="total"></span></button>
						<!-- <button id="reCal">다시계산하기</button> -->
						
						<!-- <input type="submit" value="submit" id="submitTO"/>
						
						
						<select name="sortMethod" id="sortMethod">           
							<option value="">정렬방법</option>    
							<option value="asc">가격낮은순</option>    
							<option value="desc">가격높은순</option>    
						</select> -->

						<a href="/manager/testValue" method="post">
						<input type="hidden" name="testValue" id="testValue" value=5/>
						<input type="submit" value="submit"/>
						</a>
						
						
			</div>
		</div>
	
<!-- 		<input type="search" id="search"/> -->
	</div>
</div>
</section>	   

<script>
var checkArray = new Array();

function init(){
	reCalculate();
}    
    
$.numberWithCommas = function (x) {
	  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

let reCalculate = function(){
	var total = 0;
	checkArray = [];
	
	$("#cart .alert").each(function() {
        var qty = $(this).find(".quantity1").val();
        var unit = $(this).find(".unitPrice").text();
        
        var subtotal = isNaN(qty * unit) ? 0 : qty * unit;
        $(this).find(".subTotal").text(subtotal);
        
        var checked = $(this).find(".select").is(':checked');
        
        checkArray.push(checked);
        
        if (checked){
            if(!isNaN(subtotal))
                total+=subtotal;
        }
    });
	
	 $("#total").html($.numberWithCommas(total));
	 
	 console.log(checkArray)
	 
}

$(function(){

	  init();

	 /*  $('#search').on('keyup', function(){
		  
		  if (event.keyCode == 13) {
			  let search = $(this).val();

          $.ajax({
        	  	type: 'POST',
              url : "manager/testName",
              data: { prodName: search },
              success: function(data){
                	console.log(data);
                },
              error: function(xhr) {
                  console.log(xhr.status);
                },
              complete: function(){
                	//location.href='manager/1234';
                }
          
          });

		  }
		  
		  
	  });
	  
	  $('#testValue').val(6); */
	  
		$("#submitTO").click(function(e){
	          console.log('clicked');
	          //e.preventDefault();
            $.ajax({
                url : "manager/test",
                //dataType : "json",
                data: { values: checkArray },
            });
    }); 
	  
/* 		$('#sortMethod').on('change', function(){
			
			var sortMethod = $('#sortMethod option:selected').val();
			
			//console.log('sort method는 :' + sortMethod);
			
		$.ajax({
			       url : "/manager/testSort",
			       dataType : "json",
			       data: { sort: sortMethod },
			       sucess: function(data){
			       	console.log(data.responseText);
			       },
			       error: function(xhr, status, error) {
			         console.log(xhr.responseText);
			       },
			       complete: function(){
			       	location.href='manager/1234';
			       }
               	
		     });
		}) */
/* 		
		$('button#reCal').click( reCalculate ); */
		
    $('.select').change( reCalculate );

    $("#cart").keyup(  reCalculate );

})
    
    
</script>
	
</body>
</html>