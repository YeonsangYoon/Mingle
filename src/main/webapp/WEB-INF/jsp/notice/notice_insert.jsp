<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section class="breadcrumb-option" style="margin-bottom: 20px;">
    <div class="container">
        <div class="row text-center">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>공지사항</h4>
                    <div class="breadcrumb__links">
                        <a href="${pageContext.request.contextPath}/main/main.do">Home</a>
                        <span>공지사항 작성</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="container">
    <form method="post" action="${pageContext.request.contextPath}/notice/insert.do" onsubmit="fillContent()">
        <div class="row">
            <div class="offset-2 col-sm-8">
                <input name="title" class="notice-title-input" type="text" placeholder="제목을 입력하세요" required>
                <div class="notice-content-input" id="editor"></div>
                <input name="content" type="hidden" id="study-content-hidden" required>
            </div>
        </div>
        <div class="row mt-4">
            <div style="margin: 0 auto;">
                <input type="submit" class="submit-button" value="등록">
                <a href="${pageContext.request.contextPath}/notice/list.do" class="submit-button cancel-button">취소</a>
            </div>
        </div>
    </form>
</div>
