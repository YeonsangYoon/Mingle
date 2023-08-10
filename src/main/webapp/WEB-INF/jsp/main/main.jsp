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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sign.css" type="text/css">
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
        <input id="idInput" type="text" placeholder="아이디 입력">
        <input id="pwdInput" type="password" placeholder="비밀번호 입력"><br>
        <p id="login-result-msg"></p>
        <input type="checkbox"><span>아이디 저장</span>
        <a href="#">Forgot password?</a>
        <button id="loginBtn">log in</button>
	</div>
    
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/sign.js"></script>
    <!-- jQuery Modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
</body>
</html>
