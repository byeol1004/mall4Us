<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/main.js"></script>

<style>
#container{
	width: 100%;

}

#productRegist{
	width: 40%;
	margin: 0 auto;

}

#productRegist h1{
	color: skyblue;
	margin-top: 20px;
}

#inputTable{
	margin: 0 auto;
}

#inputTable{
	margin-left: 80px;
}

</style>


</head>
<body>
<div id=container>

	<div id="productRegist">
	
		<form action="/manager/productInput" method="post" id="form">
			<fieldset>
    			<legend><h1>상품 등록 페이지</h1></legend>
					<div id="inputTable">
					<table>
						<tr class="list-row">
							<td>상품번호 :</td>
							<td colspan="2"><input type="text" name="prodId" readonly /></td>
							<td><button type='button' onclick='prodNumGen()'>번호받기</button></td>
						</tr>
						<tr class="list-row">
							<td>카테고리 :</td>
							<td>
								<select name="prodHiClass" ></select>
							</td>
							<td>
								<select name="prodMiClass" ></select>
							</td>
							<td>
								<select name="prodLoClass" ></select>
							</td>
						</tr>
						<tr class="list-row">
							<td>상품명 :</td>
							<td colspan="3"><input type="text" name="prodName" /></td>
						</tr>
						<tr class="list-row">
							<td>상품설명 :</td>
							<td colspan="3"><textarea name="prodKeyword" id="" cols="30" rows="10"></textarea></td>
						</tr>
						<tr class="list-row" >
							<td>섬네일이미지 :</td>
							<td colspan="3"><input type="file" name="prodThumImage" /></td>
						</tr>
						<tr class="list-row">
							<td>디테일이미지 :</td>
							<td colspan="3"><input type="file" name="prodDetailImage" /></td>
						</tr>
						<tr class="list-row">
							<td>가격 (&#8361;) :</td>
							<td colspan="3"><input type="number" name="prodPrice" /></td>
						</tr>
						<tr class="list-row">
							<td>사이즈(S) :</td>
							<td colspan="3"><input type="number" name="sizeS" /></td>
						</tr>
						<tr class="list-row">
							<td>사이즈(M) :</td>
							<td colspan="3"><input type="number" name="sizeM" /></td>
						</tr>
						<tr class="list-row">
							<td>사이즈(L) :</td>
							<td colspan="3"><input type="number" name="sizeL" /></td>
						</tr>
						
					</table>
					<br />
					<br />
					
					<input type="submit" value="입력" />&nbsp;&nbsp;&nbsp;&nbsp;
				    <input type="reset" value="입력취소"/>
					</div>
			</fieldset>
		</form>
	
	
	
	
	</div>
	
</div>
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
	 
<script type="text/javascript">	 
function prodNumGen() {
  let randNum = numberPad(Math.floor(Math.random() * 100000000), 8);
  
  $('input[name=prodId]').attr('value', randNum);
}	 
function numberPad(n, width) {
    n = n + '';
    return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

</script>	
</body>
</html>