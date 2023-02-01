<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
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

#productList img{
	text-align: center;
	margin-left: 15px;
}

#selectForm{
	margin-top: 20px;
	margin-bottom: 50px;

}

#selectForm form table{
	margin: 0 auto;
	padding: 20px;
	border: 2px solid blue;
  background-color: #b8e2f2;
	
}

#productList table{
	margin: 0 auto;
}

#listSubmit{
	text-align: center;
}

#productList .img {
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center; 
  }

/*
#productList{
	display: flex;
	flex-wrap: wrap;

}
input[type="submit"]{
	text-align: center;
}
*/
</style>

</head>
<body>

<section>

	<div id="selectForm">
		<form action="/manager/search" method="post">
			<table>
				<tr>
					<td><select name="prodHiClass" id="prodHiClass"></select></td>&nbsp;&nbsp;&nbsp;&nbsp;
					<td><select name="prodMiClass" id="prodMiClass"></select></td>&nbsp;&nbsp;&nbsp;&nbsp;
					<td><select name="prodLoClass" id="prodLoClass"></select></td>
				</tr>
				
				<tr><td colspan="3"> &nbsp;</td></tr>

	  			<tr id="listSubmit">
	  				<td colspan="3"><input type="submit" value="선택완료" /></td>
				</tr>

			</table>
		</form>
	</div>
	
	<c:if test="${message == true}">
		<div id="productList">
			<table>
				<tr><th rowspan="2">제품이미지</th><th rowspan="2">제품번호</th><th rowspan="2">제품명</th><th rowspan="2">제품가격(&#8361;)</th>
				<th colspan="3">제품분류</th><th colspan="3">재고</th></tr>		
				<tr><th>대</th><th>중</th><th>소</th><th>S</th><th>M</th><th>L</th></tr>

				<c:forEach var="item" items="${list}">
					<tr>
				 		<td><img src="/resources/thumbImg/${item.PRODTHUMIMAGE}" width="50" alt="" /></td> 
						<td>${item.PRODID}</td>
						<td>${item.PRODNAME}</td>
						<td style="text-align:right"><fmt:formatNumber type="number" value="${item.PRODPRICE}" pattern="#,###"/></td>
						<td>${item.PRODHICLASS}</td>
						<td>${item.PRODMICLASS}</td>
						<td>${item.PRODLOCLASS}</td>
						<td>${item.SIZES}</td>
						<td>${item.SIZEM}</td>
						<td>${item.SIZEL}</td>
					</tr>
				</c:forEach>
			
			</table>
		 </div>
	</c:if>
</section>

<script type="text/javascript"> 

//Test data
const objTest = {
	  Woman: ['Outwear', 'Top', 'Bottom'],
	  Man: ['Outwear_', 'Top_', 'Bottom_'],
	  Acc: ['Shoes', 'Hat', 'Socks']
};

const objSubTest = {
	Outwear: ['Padding', 'Cardigan', 'Jacket'],		
	Top: ['Hoodie', 'Knit', 'T-shits'],		
	Bottom: ['Pants', 'Skirt'],		
	Outwear_: ['Padding', 'Cardigan', 'Jacket'],	
	Top_: ['Hoodie', 'Knit', 'T-shits'],			
	Bottom_: ['Training_Pants', 'Shorts_Pants'],		
	Shoes: [],		
	Hat: [],		
	Socks: []		
};

$(function() {
  init();

/* 
  let prodHiClass = '${prodHiClass}';
  let prodMiClass = '${prodMiClass}';
  let prodLoClass = '${prodLoClass}';
  
  $("#prodHiClass").val(prodHiClass); //.prop("selected", true);
  $("#prodMiClass").val(prodMiClass); //.prop("selected", true);
  $("#prodLoClass").val(prodLoClass); //.prop("selected", true);
  
  
  $('select[name=prodHiClass]').trigger('change');
  $('select[name=prodMiClass]').trigger('change');
  $('select[name=prodLoClass]').trigger('change');
*/
  
  $(document).on('change', 'select[name=prodHiClass]', function() {
    const classVal = $(this).val();
    
    $('select[name=prodMiClass] option').each(function(idx, item) {
    	
      if ($(this).data('class') == classVal || $(this).val() == '') {
        $(this).show();
      } else {
        $(this).hide();
      }
      
    });
    $('select[name=prodMiClass]').val('');
    
  })	

  $(document).on('change', 'select[name=prodMiClass]', function() {
	    const classVal = $(this).val();
	    
	    $('select[name=prodLoClass] option').each(function(idx, item) {
	    	
	      if ($(this).data('class') == classVal || $(this).val() == '') {
	        $(this).show();
	      } else {
	        $(this).hide();
	      }
	      
	    });
	    $('select[name=prodLoClass]').val('');
	    
	  })	

});

function init() {
  let prodHiClass = '<option value="">대분류선택</option>';
  let prodMiClass = '<option value="">중분류선택</option>';
  let prodLoClass = '<option value="">소분류선택</option>';

  for (const key in objTest) {
	  prodHiClass += '<option value='+key+'>'+key+'</option>';
    
    const list = objTest[key];
    
    for (let i = 0; i < list.length; i++) {
    	prodMiClass += '<option value='+list[i]+' data-class='+key+'>'+list[i]+'</option>';
        
        const subList = objSubTest[list[i]];

        for (let k=0; k < subList.length; k++){
        	prodLoClass += '<option value='+subList[k]+' data-class='+list[i]+'>'+subList[k]+'</option>';
        }
    }
  }
  $('select[name=prodHiClass]').html(prodHiClass);
  $('select[name=prodMiClass]').html(prodMiClass);
  $('select[name=prodLoClass]').html(prodLoClass);

  $('select[name=prodMiClass] option').each(function(idx, item) {
    if ($(this).val() == '') return true;
    $(this).hide();
  });

  $('select[name=prodLoClass] option').each(function(idx, item) {
    if ($(this).val() == '') return true;
    $(this).hide();
  });

}

</script>

</body>
</html>