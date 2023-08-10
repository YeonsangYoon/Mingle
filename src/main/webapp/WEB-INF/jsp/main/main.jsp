<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 플랫폼, Mingle</title>
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet" href="/mingle/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/mingle/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/mingle/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/mingle/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="/mingle/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/mingle/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/mingle/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/mingle/css/style.css" type="text/css">
<link rel="stylesheet" href="/mingle/css/header.css" type="text/css">
<link rel="stylesheet" href="/mingle/css/sign.css" type="text/css">
<!-- jQuery Modal -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
  	<tiles:insertAttribute name="header"/>
  	<tiles:insertAttribute name="content"/>
  	<tiles:insertAttribute name="footer"/>
  	
  	<!-- Log in Modal -->
  	<div id="login-modal" class="login modal">
        <h1>로그인</h1>
        <input type="email" placeholder="ID">
        <input type="password" placeholder="Password"><br>
        <input type="checkbox"><span>아이디 저장</span>
        <a href="#">Forgot password?</a>
        <button id="sign-in">log in</button>
	</div>
    
    <!-- Js Plugins -->
    <script src="/mingle/js/jquery-3.3.1.min.js"></script>
    <script src="/mingle/js/bootstrap.min.js"></script>
    <script src="/mingle/js/jquery.nice-select.min.js"></script>
    <script src="/mingle/js/jquery.nicescroll.min.js"></script>
    <script src="/mingle/js/jquery.magnific-popup.min.js"></script>
    <script src="/mingle/js/jquery.countdown.min.js"></script>
    <script src="/mingle/js/jquery.slicknav.js"></script>
    <script src="/mingle/js/mixitup.min.js"></script>
    <script src="/mingle/js/owl.carousel.min.js"></script>
    <script src="/mingle/js/main.js"></script>
    <script src="/mingle/js/sign.js"></script>
    <!-- jQuery Modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
</body>
</html>
