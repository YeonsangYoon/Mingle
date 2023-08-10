<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
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
                                <i class="fa fa-user-plus"><a href="#">회원가입</a></i>
                                <i class="fa fa-sign-in"><a href="#login-modal" rel="modal:open">로그인</a></i>
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
                            <li><a href="#">스터디 공간</a></li>
                            <li><a href="#">멘토링</a></li>
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
