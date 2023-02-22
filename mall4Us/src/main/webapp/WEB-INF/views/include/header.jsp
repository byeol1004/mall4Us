<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
	<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
	<!-- Style -->
	<link rel="stylesheet" href="/resources/css/style.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="./js/jQery library/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>

	<title>Mall4Us WebSite</title>

</head>
<body class="flexheader">
	<div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
    
    <header class="site-navbar" role="banner">

      <div class="container">
        <div class="row align-items-center">
          
          <div class="col-11 col-xl-2">
          	<a href="/login/home"><img src="/resources/images/logo_wh3.png" /></a>
				<h1 class="mb-0 site-logo"><a href="#" class="text-white mb-0"></a></h1> 
          </div>
          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">
              
 <!-- 로그인 -->		
					<c:choose>
               			<c:when test="${vo == null}">
                  			<li id="active"><a href="#"><span>Login</span></a></li>                  			
                   			<c:if test="${ 1 eq flag }"> <!-- vo가 null일때 flag가 1과 같다면 alert를 띄운다 -->
                  				<script>alert("아이디 또는 비밀번호가 일치하지 않습니다."); </script>
                  				<span>${flag = 0}</span> 
                  			</c:if> 
               			</c:when>
              			<c:otherwise>
              				<span style="color: #64b5f6;" class="memGrade">${coupon.memGrade}Member </span><br />
              				<span style="color: white;" class="welcomemsg">${vo.memName}님 환영합니다!^0^*</span>
              				

                  			<li id="active2"><a href="/login/logout"><span>LogOut</span></a></li><br />
                  			<li><a href="/myPage/myPage?memId=${vo.memId }" class="mpg"><span>Mypage</span></a></li>                 
              			</c:otherwise>       
            		</c:choose>

					<c:if test="${0 eq join}" >
						<script>
							alert("아이디가 존재합니다");
						</script>
					</c:if>
							<div id="myModal" class="modal">
								<div class="login-page">
									<div class="form">
										<form class="register-form" action="/myPage/memberJoinProc"
											method="post">

											<input type="text" name="memId" id="memId" placeholder="아이디 (8자이상 입력하세요)" pattern=".{8,}" required="required"/>
											<a class="confirm">중복확인</a> 
											<input type="text" name="memName" placeholder="성명" autocomplete="name" maxlength="100" pattern="[\p{L} \-\.]+" required /> 
											<input type="password" name="memPwd" placeholder="비밀번호" /> 
											<input type="password" name="passwordConfirm" placeholder="비밀번호 확인" /> 
											<input type="text" name="memLivingArea" placeholder="지역" autocomplete="country" enterkeyhint="done" required /> 
											<input type="text" name="memAddress" placeholder="주소" autocomplete="address" maxlength="300" required /> 
											<input type="text" name="memPhone" placeholder="전화번호" autocomplete="tel" type="tel" maxlength="30" pattern="[\d \-\+]+" required />
											<button>회원가입</button>
											<p class="message">
												회원이신가요? <a href="#">로그인</a>
											</p>
										</form>
										<form class="login-form" action="/login/login" method="post">
											<input type="text" name="memId" placeholder="아이디"
												required="required" /> <input type="password" name="memPwd"
												placeholder="비밀번호" required="required" />
											<button>로그인</button>
											<p class="message">
												회원이 아니시라면? <a href="#">회원가입</a>
											</p>

										</form>
										<span class="close">&times;</span>
									</div>
								</div>
							</div>

							

				<!-- 카테고리 -->             
                <li class="has-children" >
                  <a href="/products/productsList"><span>Product</span></a>
                  <ul class="dropdown arrow-top">
                    <li class="has-children"><a href="/products/productsList?prodHiClass=Woman">Woman</a>
						<ul class="dropdown">
							<li class="has-children"><a href="/products/productsList?prodHiClass=Woman&prodMiClass=Outwear">Outwear</a>							
								<ul class="dropdown">
								<li><a href="/products/productsList?prodHiClass=Woman&prodMiClass=Outwear&prodLoClass=Padding">Padding</a></li>
								<li><a href="/products/productsList?prodHiClass=Woman&prodMiClass=Outwear&prodLoClass=Cardigan">Cardigan</a></li>
								<li><a href="/products/productsList?prodHiClass=Woman&prodMiClass=Outwear&prodLoClass=Jacket">Jacket</a></li>
								</ul>
							</li>
							<li class="has-children"><a href="/products/productsList?prodHiClass=Woman&prodMiClass=Top">Top</a>							
								<ul class="dropdown">
								<li><a href="/products/productsList?prodHiClass=Woman&prodMiClass=Top&prodLoClass=Hoodie">Hoodie</a></li>
								<li><a href="/products/productsList?prodHiClass=Woman&prodMiClass=Top&prodLoClass=Knit">Knit</a></li>
								<li><a href="/products/productsList?prodHiClass=Woman&prodMiClass=Top&prodLoClass=T-shits">T-shits</a></li>
								</ul>
							</li>
							<li class="has-children"><a href="/products/productsList?prodHiClass=Woman&prodMiClass=Bottom">Bottom</a>							
								<ul class="dropdown">
								<li><a href="/products/productsList?prodHiClass=Woman&prodMiClass=Bottom&prodLoClass=Pants">Pants</a></li>
								<li><a href="/products/productsList?prodHiClass=Woman&prodMiClass=Bottom&prodLoClass=Skirt">Skirt</a></li>
								</ul>
							</li>
						</ul>
					</li>
                    <li class="has-children"><a href="/products/productsList?prodHiClass=Man">Man</a>
						<ul class="dropdown">
							<li class="has-children"><a href="/products/productsList?prodHiClass=Man&prodMiClass=Outwear_">Outwear</a>							
								<ul class="dropdown">
								<li><a href="/products/productsList?prodHiClass=Man&prodMiClass=Outwear_&prodLoClass=Padding">Padding</a></li>
								<li><a href="/products/productsList?prodHiClass=Man&prodMiClass=Outwear_&prodLoClass=Cardigan">Cardigan</a></li>
								<li><a href="/products/productsList?prodHiClass=Man&prodMiClass=Outwear_&prodLoClass=Jacket">Jacket</a></li>
								</ul>
							</li>
							<li class="has-children"><a href="/products/productsList?prodHiClass=Man&prodMiClass=Top_">Top</a>							
								<ul class="dropdown">
								<li><a href="/products/productsList?prodHiClass=Man&prodMiClass=Top_&prodLoClass=Hoodie">Hoodie</a></li>
								<li><a href="/products/productsList?prodHiClass=Man&prodMiClass=Top_&prodLoClass=Knit">Knit</a></li>
								<li><a href="/products/productsList?prodHiClass=Man&prodMiClass=Top_&prodLoClass=T-shits">T-shits</a></li>
								</ul>
							</li>
							<li class="has-children"><a href="/products/productsList?prodHiClass=Man&prodMiClass=Bottom_">Bottom</a>							
								<ul class="dropdown">
								<li><a href="/products/productsList?prodHiClass=Man&prodMiClass=Bottom_&prodLoClass=Training_Pants" >Training Pants</a></li>
								<li><a href="/products/productsList?prodHiClass=Man&prodMiClass=Bottom_&prodLoClass=Shorts_Pants" >Shorts Pants</a></li>
								</ul>
							</li>
						</ul>
					</li>

                    <li class="has-children"><a href="/products/productsList?prodHiClass=Acc">Acc</a>
						<ul class="dropdown">
							<li><a href="/products/productsList?prodHiClass=Acc&prodMiClass=Shoes">Shoes</a></li>
							<li><a href="/products/productsList?prodHiClass=Acc&prodMiClass=Hat" >Hat</a></li>
							<li><a href="/products/productsList?prodHiClass=Acc&prodMiClass=Socks" >Socks</a></li>
						</ul>
					</li>
                   
                  </ul>
                </li>
                <li><a href="/company/about"><span>About</span></a></li>
                <li><a href="/company/qAnda"><span>Q&A</span></a></li>
                <c:if test="${vo.memId !=null }">
                <li><a href="/products/carts?memId=${vo.memId }"><span>Cart</span></a></li>
                </c:if> 
                <li id="search"><a href="#"><input type="search" name="prodName" placeholder="search" id="searchBox" /></a></li>  
              </ul>
	       </nav>
          </div>


          <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-white"><span class="icon-menu h3"></span></a></div>
          </div>
        </div>
    </header>
    
<script>
$(function(){
	

 $('#searchBox').on('keyup',function() {
    if (event.keyCode == 13) {
        let search = $(this).val();
        console.log(search);
        
        $.ajax({
        	 url : "/products/search",
             type : "POST",
             data: { 'prodName': search },
             success: function(data){
                 console.log(data);
              },
            error: function(xhr, status, error) {
                console.log(xhr.responseText);
              },
            complete: function(){
                 location.href='/products/productSearch';
              }
        


        });
    }
 })
});


   
</script>



<script type="text/javascript">
$('.message a').click(function() {
	$('form').animate({
		height : "toggle",
		opacity : "toggle"
	}, "slow");
});

var modal = document.getElementById("myModal");
var btn = document.getElementById("active");
btn.onclick = function() {
	modal.style.display = "block";
}
var span = document
		.getElementsByClassName("close")[0];
span.onclick = function() {
	modal.style.display = "none";
}

$('.register-form').validate({
    rules: {
    	memPwd: {
            required: true,
            minlength: 5
        },
        passwordConfirm: {
            required: true,
            minlength: 5,
            equalTo: '[name="memPwd"]'
        }
    },
    messages : {
    	memPwd: {
    		required: "필수 입력 항목입니다.",
    		minlength : "최소 5글자이상이어야 합니다"
    	},
    	passwordConfirm:{
    		required: "필수 입력 항목입니다.",
    		minlength : "최소 5글자이상이어야 합니다",
    		equalTo: '비밀번호가 일치하지 않습니다.',
    	},
    } 
}); 

$('.confirm').click(()=>{
	console.log('confirm click');	
	var id = $('#memId').val();
	$.ajax({
		url : "/myPage/idCheck",
		type : "POST", 
		data: { memId: id }, 
      success: function(data){
      	
      	if(data=='fail'){
        	alert('입력하신 아이디가 없거나 이미 등록된 아이디입니다');
      	}else if (data=="success"){
          	alert('사용하실 수 있는 아이디입니다');
      	}
      },
     error: function(xhr) {
        console.log(xhr.status);
      },
	    complete: function(){
      }
	
	});   

})

</script>

    <div class="hero" ></div>

    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.sticky.js"></script>
    <script src="/resources/js/main.js"></script>
   
</body>
</html>