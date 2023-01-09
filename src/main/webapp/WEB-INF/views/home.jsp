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
	
	
	<title>Mall4Us WebSite</title>
</head>
<body>
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
          <img src="/resources/images/logo_wh3.png" />
<!--        	<div class="mb-0 sitelogo" style="background-image: url('/resources/images/5.png');"><a href="#" class="text-white mb-0"></a></div> -->
 	        	<h1 class="mb-0 site-logo"><a href="#" class="text-white mb-0"></a></h1> 
          </div>
          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">
              
 <!-- 로그인 -->                          
     <c:if test="${vo != null}">
		<a href="/login/logout">Logout</a>#nbsp;<a href="/myPage/myPage">Mypage</a><br />
		<span style="color:white;">${vo.memName}님 환영합니다!^0^*</span><br />
		
	</c:if>

	<c:if test="${vo == null}">
		<p>${message }</p>
    </c:if>      
              
              
              
              <li id="active"> <a href="#"> <span>Login</span></a></li>   
              <div id="myModal" class="modal">	
		<div class="login-page">
		  <div class="form">
		    <form class="register-form" action="/myPage/memberJoinProc" method="post">
		      
		      <input type="text" name="memId" placeholder="아이디"/>
		      <input type="text" name="memName" placeholder="성명"/>
		      <input type="password" name="memPwd" placeholder="비밀번호"/>
		      <input type="password" placeholder="비밀번호 확인"/>
		      <input type="text" name="memLivingArea" placeholder="지역"/>
		      <input type="text" name="memAddress" placeholder="주소"/>
		      <input type="text" name="memPhone" placeholder="번호"/>
		      <button>회원가입</button>
		      <p class="message">회원이신가요? <a href="#">로그인</a>
<!-- 		      <span class="close">&times;</span> -->
		      </p>
		    </form>
		    <form class="login-form" action="/login/login" method="post">
		      <input type="text" name="memId" placeholder="아이디"/>
		      <input type="text" name="memPwd" placeholder="비밀번호"/>
		      <button>로그인</button>
		      <p class="message">회원이 아니시라면? <a href="#">회원가입</a>
		      
		      </p>
		      
		    </form>
		    <span class="close">&times;</span>
		  </div>
		</div>
	</div>
<%-- 	</c:if>  --%>
	<script type="text/javascript"> 
		$('.message a').click(function(){
		   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
		});

		var modal = document.getElementById("myModal");
		var btn = document.getElementById("active");
		btn.onclick = function() {
			  modal.style.display = "block";
			}
		var span = document.getElementsByClassName("close")[0];
		span.onclick = function() {
			  modal.style.display = "none";
			}
	</script>
                          
 
<!-- 카테고리 -->             
               <!--  <li class="active"> <a href="/login/loginForm"> <span>Login</span></a></li> -->
                
                <li class="has-children">
                  <a href="about.html"><span>Product</span></a>
                  <ul class="dropdown arrow-top">
                    <li class="has-children"><a href="#">여성</a>
						<ul class="dropdown">
							<li class="has-children"><a href="#">브라우스</a>							
								<ul class="dropdown">
								<li><a href="#">aaa1</a></li>
								<li><a href="#">bbb1</a></li>
								<li><a href="#">ccc1</a></li>
								</ul>
							</li>
							<li class="has-children"><a href="#">원피스</a>							
								<ul class="dropdown">
								<li><a href="#">aaa2</a></li>
								<li><a href="#">bbb2</a></li>
								<li><a href="#">ccc2</a></li>
								</ul>
							</li>
						</ul>
					</li>
                    <li class="has-children"><a href="#">남성</a>
						<ul class="dropdown">
							<li class="has-children"><a href="#">티셔츠</a>							
								<ul class="dropdown">
								<li><a href="#">aaa3</a></li>
								<li><a href="#">bbb3</a></li>
								<li><a href="#">ccc3</a></li>
								</ul>
							</li>
							<li class="has-children"><a href="#">아우터</a>							
								<ul class="dropdown">
								<li><a href="#">aaa4</a></li>
								<li><a href="#">bbb4</a></li>
								<li><a href="#">ccc4</a></li>
								</ul>
							</li>
						</ul>
					</li>

                    <li class="has-children"><a href="#">아동</a>
						<ul class="dropdown">
							<li class="has-children"><a href="#">탑</a>							
								<ul class="dropdown">
								<li><a href="#">aaa5</a></li>
								<li><a href="#">bbb5</a></li>
								<li><a href="#">ccc5</a></li>
								</ul>
							</li>
							<li class="has-children"><a href="#">바톰</a>							
								<ul class="dropdown">
								<li><a href="#">aaa6</a></li>
								<li><a href="#">bbb6</a></li>
								<li><a href="#">ccc6</a></li>
								</ul>
							</li>
						</ul>
					</li>

                    <li class="has-children"><a href="#">악세서리</a>
						<ul class="dropdown">
							<li class="has-children"><a href="#">가방</a>							
								<ul class="dropdown">
								<li><a href="#">aaa7</a></li>
								<li><a href="#">bbb7</a></li>
								<li><a href="#">ccc7</a></li>
								</ul>
							</li>
							<li class="has-children"><a href="#">신발</a>							
								<ul class="dropdown">
								<li><a href="#">aaa8</a></li>
								<li><a href="#">bbb8</a></li>
								<li><a href="#">ccc8</a></li>
								</ul>
							</li>
						</ul>
					</li>
                   
                  </ul>
                </li>
                <li><a href="#"><span>About</span></a></li>
                <li><a href="#"><span>Q&A</span></a></li>
                <li><a href="#"><span>Cart</span></a></li>
                <li><a href="#"><span>Search</span></a></li>
              </ul>
            </nav>
          </div>


          <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-white"><span class="icon-menu h3"></span></a></div>

          </div>

        </div>
      
      
    </header>


    <div class="hero" style="background-color: black;"></div>

    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.sticky.js"></script>
    <script src="/resources/js/main.js"></script>
<!-- ▲ 헤더고정 -->

<!-- 메인 배너 -->
<div class="banner" style="background-image: url('/resources/images/banner2_2.jpg');"></div>
<!-- <div class="banner" style="background-image: url('/resources/images/banner4_1.jpg');"></div>
<div class="banner" style="background-image: url('/resources/images/banner3.jpg');"></div> -->




<!-- 프로모션 -->
<div class="promotion">
	<div class="promotion1" style="background-image: url('/resources/images/promo1.jpg');"></div>
	<div class="promotion2" style="background-image: url('/resources/images/promo2.jpg');"></div>
	<div class="promotion3" style="background-image: url('/resources/images/promo3.jpg');"></div>
</div>





<hr />
<!-- ▼ footer 고정 -->
<footer>
<div class="only-pc">


  
          <div class="company ">
              <p style="color: black">(주)Mall4Us</p>
          	<p>
                  대표이사 : Mall4Us / 대표전화 : 1234-5678<br>
                  경기도 성남시 중원구 성남동 3219번지 KR 아트팰리스 4호 5층<br>
                  개인정보보호책임자 : Mall4Us<br></p> 
          </div>
          <div class="help">
            <p style="color: black">Help Center</p>
            <p>
              	1234-5678<br>
              	AM 12:00 ~ PM 17:00 (토, 일, 공휴일 휴무)<br>
				업무 관련문의: Mall4Us@gmail.com<br>
				CS 관련문의: Mall4Us@gmail.com<br></p>
				<br />
          </div>
      </div>
      <hr />
		<div class="copyright">
			<p style="text-align: center">Copyright 2023 Mall4Us</p>
		</div>
</footer>



</body>
</html>
