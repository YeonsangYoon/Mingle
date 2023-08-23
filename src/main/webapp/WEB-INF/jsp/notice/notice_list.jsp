<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="breadcrumb-option" style="margin-bottom: 20px;">
    <div class="container">
        <div class="row text-center">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>공지사항</h4>
                    <div class="breadcrumb__links">
                        <a href="${pageContext.request.contextPath}/main/main.do">Home</a>
                        <span>공지사항</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="container">
    <div class="app-content">
        <c:if test="${sessionScope.id=='admin'}">

        <div class="notice-button-area">
            <button class="notice-button">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                </svg>
                공지작성
            </button>
        </div>
        </c:if>
        <div class="products-area-wrapper tableView" style="min-height: 500px;">
            <div class="products-header">
                <div class="product-cell" style="flex: 0.5; justify-content: center;">공지번호</div>
                <div class="product-cell" style="flex: 2; justify-content: center;">제목</div>
                <div class="product-cell" style="justify-content: center;">작성일</div>
                <div class="product-cell" style="flex: 0.5; justify-content: center;">작성자</div>
                <div class="product-cell" style="flex: 0.5; justify-content: center;">조회수</div>
            </div>
            <c:forEach var="vo" items="${list}">
                <div class="products-row" onclick="location.href='/mingle/notice/detail.do?notice_id=${vo.notice_id}'">
                    <div class="product-cell" style="flex: 0.5; justify-content: center;">
                        <span>${vo.notice_id}</span>
                    </div>
                    <div class="product-cell" style="flex: 2;">
                        <span>[공지사항] ${vo.title}</span>
                    </div>
                    <div class="product-cell" style="justify-content: center;">
                        <span>${vo.regdate}</span>
                    </div>
                    <div class="product-cell" style="flex: 0.5; justify-content: center;">
                        <span>관리자</span>
                    </div>
                    <div class="product-cell" style="flex: 0.5; justify-content: center;">
                        <span>${vo.hit}</span>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="product__pagination">
            <ul>
                <li>
                    <span><i class="fa fa-angle-double-left"></i></span>
                </li>
                <li>
                    <span><i class="fa fa-angle-left"></i></span>
                </li>
                <c:forEach begin="${startpage}" end="${endpage}" var="i">
                <li>
                    <c:if test="${curpage == i}">
                    <span class="active">${i}</span>
                    </c:if>
                    <c:if test="${curpage != i}">
                    <span>${i}</span>
                    </c:if>
                </li>
                </c:forEach>
                <li>
                    <span><i class="fa fa-angle-right"></i></span>
                </li>
                <li>
                    <span><i class="fa fa-angle-double-right"></i></span>
                </li>
            </ul>
        </div>
    </div>
</div>
