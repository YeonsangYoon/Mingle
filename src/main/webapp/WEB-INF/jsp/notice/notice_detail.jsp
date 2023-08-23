<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <h3>[공지사항] ${notice.title}</h3>

        </div>
    </div>
</div>
