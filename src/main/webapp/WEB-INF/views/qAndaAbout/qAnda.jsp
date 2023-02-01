<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/qa.css" rel="stylesheet">
<title>Mall4Us WebSite</title>

<style type="text/css">

h2 {
	background: url(/resources/images/open.png) no-repeat 0 11px;
	padding: 10px 0 0 25px;
	cursor: pointer;
}
h2.close {
	background-image: url(/resources/images/close.png);
}

.faq {
	border-radius: 10px;
	background-color:  rgba(0,0,0,.05);
	padding: 10px;
	margin-bottom: 10px;
}
.answer {
	margin-left: 25px;	
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
 $('.answer').hide();
 
 $('.main h2').mouseover(function() {
 	var $answer = $(this).next('.answer');
	if ($answer.is(':hidden')) {
		$answer.slideDown();
		$(this).addClass('close');
    }
	});

$('.main h2').mouseout(function() {
 	var $answer = $(this).next('.answer');
		$answer.fadeOut();
		$(this).removeClass('close');
    });
	
	
 
 $('.main h2').click(function() {
 	var $answer = $(this).next('.answer');
	if ($answer.is(':hidden')) {
		$answer.slideDown();
		$(this).addClass('close');
	} else {
		$answer.fadeOut();
		$(this).removeClass('close');
	}
 }
	); // end click
}); // end ready
</script>

</head>
  <header>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</header>  
<body>
<div class="wrapper">
	<div class="content">
	<div class="main">
	<h1> 자주하는 문의</h1>
	<div class="faq">
	<h2>품절된 상품은 구매할 수 없나요?</h2>
	    <div class="answer">
	        <p>품절(SOLD OUT) 상품은 오프라인 매장 및 온라인몰의 재고가 모두 소진되어 현재 온라인에서 구매할 수 없는 상품입니다. 단, 일부 상품의 경우 추가 생산으로 재입고 될 수 있습니다. 재입고 대상 상품들은 상품상세 페이지에서 재입고 알림을 신청할 수 있습니다. 사이즈 단위로 알림을 신청하면, 재입고 시 바로 알림을 받아보실 수 있습니다.
				구매 가능한 상품의 재고 현황이나 품절된 상품의 재입고 여부에 대해서는 고객센터 대표전화 또는 1:1 문의로 상세내용을 알려주시면 확인 후 안내해드리겠습니다.</p>
	      </div>
	</div>
	<div class="faq">
	      <h2>비회원도 상품 구매가 가능한가요?</h2>
	      <div class="answer">
	        <p> 1. 구매를 원하시는 상품의 상세페이지에서 '구매하기'를 클릭한다. <br/>
				2. 로그인 페이지 하단에서 '비회원 구매'를 클릭한다.  <br/>
				3. 비회원 개인정보수집 및 이용동의에 동의(필수) 후 '비회원 구매'를 클릭한다. <br/>
				4. 주문서 페이지에서 주문 고객 및 배송지 정보 입력 및 본인 인증 후 원하는 결제수단을 선택하여 결제한다. <br/>
				   비회원 주문조회는 로그인 페이지에서 주문자명 및 주문번호를 입력하여 확인하실 수 있습니다. <br/>

				비회원 상품 구매에 대해 추가로 궁금하신 사항은 고객센터 대표전화 또는 1:1 문의로 상세내용을 알려주시면 확인 후 처리해드리겠습니다. </p>
	      </div>
	</div>
	<div class="faq">
	      <h2>주문 시 배송비는 얼마인가요?</h2>
	      <div class="answer">
	        <p>프로모션, 쿠폰 등 모든 할인 혜택을 적용한 최종 가격을 기준으로 주문 시 30,000원 이상일 경우 무료로 상품을 배송하고 있습니다. 주문금액이 30,000원 미만일 
			경우 배송비 2,500원이 결제금액에 포함되며, 주문상품 부분취소 시 결제금액이 30,000원 이하가 되는 경우 배송비가 부과될 수 있습니다. 
			매장픽업의 경우에는 결제금액과 상관없이 배송비가 발생하지 않습니다. 단, 일부 입점업체 상품의 경우 업체별로 배송비 및 부과 기준이 상이하므로 주문 시 유의해 주시기 바랍니다.
			배송비에 대해 추가로 궁금하신 사항은 고객센터 대표전화 또는 1:1 문의로 상세내용을 알려주시면 확인 후 처리해드리겠습니다.</p>
      	  </div>
	</div>
	<div class="faq">
	      <h2>모바일 앱 다운로드 시 어떤 혜택이 있나요?</h2>
	      <div class="answer">
	        <p>iOS 앱스토어나 안드로이드 구글 play스토어에서 '몰포어스' 또는 'Mall4US'을 검색하시면
			<Mall4Us> 모바일 앱을 다운로드하실 수 있습니다.
			앱 다운로드 혜택은 이달의 혜택을 통해 확인 하실 수 있습니다.

			</p>
      	  </div>
	</div>

	</div>
	</div>
</div>
 <footer>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</footer> 
</body>
</html>