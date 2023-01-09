<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<style type="text/css">
		@import url(https://fonts.googleapis.com/css?family=Roboto:300);
		
		.login-page {
		  width: 360px;
		  padding: 8% 0 0;
		  margin: auto;
		}
		.form {
		  position: relative;
		  z-index: 1;
		  background: #FFFFFF;
		  max-width: 360px;
		  margin: 0 auto 100px;
		  padding: 45px;
		  text-align: center;
		  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		}
		.form input {
		  font-family: "Roboto", sans-serif;
		  outline: 0;
		  background: #f2f2f2;
		  width: 100%;
		  border: 0;
		  margin: 0 0 15px;
		  padding: 15px;
		  box-sizing: border-box;
		  font-size: 14px;
		}
		.form button {
		  font-family: "Roboto", sans-serif;
		  text-transform: uppercase;
		  outline: 0;
		  background: #4CAF50;
		  width: 100%;
		  border: 0;
		  padding: 15px;
		  color: #FFFFFF;
		  font-size: 14px;
		  -webkit-transition: all 0.3 ease;
		  transition: all 0.3 ease;
		  cursor: pointer;
		}
		.form button:hover,.form button:active,.form button:focus {
		  background: #43A047;
		}
		.form .message {
		  margin: 15px 0 0;
		  color: #b3b3b3;
		  font-size: 12px;
		}
		.form .message a {
		  color: #4CAF50;
		  text-decoration: none;
		}
		.form .register-form {
		  display: none;
		}
		
		body {
		  background: rgb(141,194,111);
		  background: linear-gradient(90deg, rgba(141,194,111,1) 0%, rgba(118,184,82,1) 50%);
		  font-family: "Roboto", sans-serif;
		}
		
		.close {
		  color: #aaaaaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: #000;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		.modal {
		  display: none; /* Hidden by default */
		  position: fixed; /* Stay in place */
		  z-index: 1; /* Sit on top */
		  padding-top: 100px; /* Location of the box */
		  left: 0;
		  top: 0;
		  width: 100%; /* Full width */
		  height: 100%; /* Full height */
		  overflow: auto; /* Enable scroll if needed */
		  background-color: rgb(0,0,0); /* Fallback color */
		  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */		
	  }
			
	</style>
	
	
</head>
<body>
	<h1> 여기가 메인 page 입니다.	</h1>

	<div>
		<button id="myBtn">Open Modal</button>
	</div>

	<div id="myModal" class="modal">	
		<div class="login-page">
		  <div class="form">
		    <form class="register-form" action="/myPage/memberJoinProc" method="post">
		      
		      <input type="text" name="memId" placeholder="아이디"/>
		      <input type="password" name="memPwd" placeholder="비밀번호"/>
		      <input type="text" name="memName" placeholder="성명"/>
		      <button>회원가입</button>
		      <p class="message">회원이신가요? <a href="#">로그인</a>
		      <span class="close">&times;</span>
		      </p>
		    </form>
		    <form class="login-form" action="/login/login" method="post">
		      <input type="text" name="memId" placeholder="아이디"/>
		      <input type="text" name="memPwd" placeholder="비밀번호"/>
		      <button>로그인</button>
		      <p class="message">회원이 아니시라면? <a href="#">회원가입</a>
		      <span class="close">&times;</span>
		      </p>
		      
		    </form>
		  </div>
		</div>
	</div>

	<script type="text/javascript"> 
		$('.message a').click(function(){
		   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
		});

		var modal = document.getElementById("myModal");
		var btn = document.getElementById("myBtn");
		btn.onclick = function() {
			  modal.style.display = "block";
			}
		var span = document.getElementsByClassName("close")[0];
		span.onclick = function() {
			  modal.style.display = "none";
			}
	</script>

</body>

</html>
