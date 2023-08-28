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
    <div class="row">
        <div class="offset-2 col-sm-8">
            <div class="study-content-header" style="padding: 0">
                <h3>[공지사항] ${notice.title}</h3>
                <span class="d-inline-block m-1">관리자 | ${notice.regdate}</span>
                <c:if test="${sessionScope.id == 'admin'}">
                <a href="${pageContext.request.contextPath}/notice/edit.do?notice_id=${notice.notice_id}" class="click-text">수정</a>
                <a href="${pageContext.request.contextPath}/notice/delete.do?notice_id=${notice.notice_id}" class="click-text">삭제</a>
                </c:if>
            </div>
            <div class="study-content">
                <div class="study-content-area">
                    ${notice.content}
                </div>
            </div>
        </div>
    </div>
</div>