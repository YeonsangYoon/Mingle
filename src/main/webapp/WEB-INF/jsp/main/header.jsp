<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>모두의 스터디 플랫폼, Mingle</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                                <c:choose>
                                    <c:when test="${sessionScope.id==null}">
                                        <i class="fa fa-user-plus"><a href="#">회원가입</a></i>
                                        <i class="fa fa-sign-in"><a id="open-login-btn" href="#login-modal" rel="modal:open">로그인</a></i>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${sessionScope.id=='admin'}">
                                            <i class="fa fa-user-circle"><a href="${pageContext.request.contextPath}/member/admin.do">관리자페이지</a></i>
                                        </c:if>
                                        <c:if test="${sessionScope.id!='admin'}">
                                            <i class="fa fa-user-circle"><a href="${pageContext.request.contextPath}/mypage/info.do">마이페이지(${sessionScope.nickname})</a></i>
                                        </c:if>
                                        <i class="fa fa-sign-out"><span id="logout-btn">로그아웃</span></i>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="${pageContext.request.contextPath}/main/main.do"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""></a>
                    </div>
                </div>
                
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="../space/main.do">스터디 공간</a></li>
                            <li><a href="../mento/mento_list.do">멘토링</a></li>
                            <li><a href="#">스터디 모집</a>
                                <ul class="dropdown">
                                    <li><a href="#">About Us</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Q&A</a></li>
                            <li><a href="#">공지사항</a></li>
                        </ul>
                    </nav>
                </div>
                
            </div>
        </div>
    </header>
    <!-- Header Section End -->
