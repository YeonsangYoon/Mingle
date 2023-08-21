<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- partial:index.partial.html -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row" style="text-align: center;">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>마이페이지</h4>
                    <div class="breadcrumb__links">
                        <a href="${pageContext.request.contextPath}/main/main.do">Home</a>
                        <span>마이페이지</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="app-container">
    <div class="sidebar">
        <div class="account-info">
            <div class="account-info-picture">
                <img src="https://images.unsplash.com/photo-1527736947477-2790e28f3443?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE2fHx3b21hbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60" alt="Account">
            </div>
            <div class="account-info-name">${sessionScope.id}</div>
        </div>
        <ul class="sidebar-list">
            <li class="sidebar-list-item ${content_jsp=='info.jsp' || content_jsp=='edit_info.jsp' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/mypage/info.do">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                        <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5ZM9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8Zm1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5Z"/>
                        <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2ZM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96c.026-.163.04-.33.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1.006 1.006 0 0 1 1 12V4Z"/>
                    </svg>
                    <span>회원정보</span>
                </a>
            </li>
            <li class="sidebar-list-item ${content_jsp=='space.jsp' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/mypage/space.do">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pie-chart"><path d="M21.21 15.89A10 10 0 1 1 8 2.83"/><path d="M22 12A10 10 0 0 0 12 2v10z"/></svg>
                    <span>공간대여</span>
                </a>
            </li>
            <li class="sidebar-list-item ${content_jsp=='mento.jsp' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/mypage/mento.do">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-inbox"><polyline points="22 12 16 12 14 15 10 15 8 12 2 12"/><path d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"/></svg>
                    <span>멘토신청</span>
                </a>
            </li>
            <li class="sidebar-list-item ${content_jsp=='study.jsp' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/mypage/study.do">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>
                    <span>스터디 모집</span>
                </a>
            </li>
        </ul>
    </div>
    <jsp:include page="${content_jsp}"/>
</div>
<!-- partial -->