<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 부제목 -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row" style="text-align: center;">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>스터디 상세보기</h4>
                    <div class="breadcrumb__links">
                        <a href="#">스터디 홈</a>
                        <span>스터디 상세보기</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 프로그램 정보 -->
<section class="shop spad">
    <div class="container" id="sdetail">
        <div class="row">
            <div class="offset-1 col-sm-10">
                <h2 style="margin-bottom: 20px; padding-left: 10px;">${vo.title}</h2>
                <h5 style="margin-bottom: 30px; padding-left: 10px;">
                    ${vo.nickname} | ${vo.dbday}
                    <a class="study-link float-right" href="javascript:history.back()">목록</a>
                    <a class="study-link float-right" href="#">삭제</a>
                    <a class="study-link float-right" href="#">수정</a>
                </h5>
            </div>
            <div class="offset-1 col-sm-5">
                <table class="table study-detail-info">
                    <tr>
                        <th>진행방식</th>
                        <td>${vo.onoff}</td>
                    </tr>
                    <tr>
                        <th>진행기간(개월)</th>
                        <td>${vo.period}</td>
                    </tr>
                    <tr>
                        <th>기술스택</th>
                        <td>
                            <ul class="studyItem_content__1mJ9M" style="margin: 0; flex-wrap: wrap">
                                <c:forEach var="tech" items="${vo.techs}">
                                    <li class="studyItem_language__20yqw">
                                        <img class="studyItem_languageImage__1AfGa" title="java"
                                             src="${pageContext.request.contextPath}/img/language/${tech}.svg"
                                             alt="language">
                                    </li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-sm-5">
                <table class="table study-detail-info">
                    <tr>
                        <th>모집인원</th>
                        <td>${vo.recruit}명</td>
                    </tr>
                    <tr>
                        <th>시작예정일</th>
                        <td>${vo.deadline}</td>
                    </tr>
                    <tr>
                        <th>연락방법</th>
                        <td>
                            <a href="${vo.contact_link}" title="${vo.contact_link}" class="study-link">${vo.contact_type}</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="offset-1 col-sm-10 study-content">
                <h3 class="study-content-header">스터디 소개</h3>
                <div class="study-content-area">${vo.content}</div>
            </div>
        </div>
        <!-- 댓글(미완성) -->
        <div class="row">
            <div class="offset-1 col-sm-10">
                <div class="study-reply-input-area">
                    <textarea class="study-reply-input"></textarea>
                </div>
                <div class="study-reply-list-area">
                    <div class="study-reply-block">
                        <div class="reply-writer">작성자닉네임</div>
                        <div class="reply-regdate">2023-08-02 23:37</div>
                        <pre>경제학 전공중인데 웹개발 지식이 전무해도 수강에 문제가 없을까요 ?</pre>
                    </div>
                    <div class="study-reply-block">
                        <div class="reply-writer">작성자닉네임</div>
                        <div class="reply-regdate">2023-08-02 23:37</div>
                        <pre>경제학 전공중인데 웹개발 지식이 전무해도 수강에 문제가 없을까요 ?</pre>
                    </div>
                    <div class="study-reply-block">
                        <div class="reply-writer">작성자닉네임</div>
                        <div class="reply-regdate">2023-08-02 23:37</div>
                        <pre>경제학 전공중인데 웹개발 지식이 전무해도 수강에 문제가 없을까요 ?</pre>
                    </div>
                    <div class="study-reply-block">
                        <div class="reply-writer">작성자닉네임</div>
                        <div class="reply-regdate">2023-08-02 23:37</div>
                        <pre>경제학 전공중인데 웹개발 지식이 전무해도 수강에 문제가 없을까요 ?</pre>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
