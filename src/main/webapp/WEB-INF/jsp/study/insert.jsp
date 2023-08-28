<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>

</head>
<body>

<!-- 부제목 -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row" style="text-align: center;">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>스터디 글 작성</h4>
                    <div class="breadcrumb__links">
                        <a href="#">스터디 모집</a>
                        <span>스터디 글 작성</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<c:if test="${sessionScope.id==null}">
    <script>
        alert("로그인 후 진행해주세요.");
        window.location.href = '/mingle/main/main.do';
    </script>
    <i>로그인 후 진행해 주세요!</i>
</c:if>

<!-- 프로그램 정보 기입란 -->
<section class="shop spad">
    <div class="container" id="insert-all">
        <ul class="Category_categories__F4wF5">
            <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">스터디 글 작성</li>
        </ul>
        <div class="insertpage">
            <form method="post" action="insert_ok.do" onsubmit="fillContent()">
                <div class="row">
                    <div class="col-sm-6">
                        <table class="table">
                            <tr>
                                <th width="20%">진행방식</th>
                                <td width="80%">
                                    <div>
                                        <select name="onoff" class="iselect">
                                            <option value="전체">전체</option>
                                            <option value="온라인">온라인</option>
                                            <option value="오프라인">오프라인</option>
                                            <option value="온/오프라인 병행">온/오프라인 병행</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th width="20%">진행기간</th>
                                <td width="80%">
                                    <div>
                                        <select name="period" class="iselect">
                                            <option value="전체">전체</option>
                                            <option value="기간미정">기간미정</option>
                                            <option value="1개월">1개월</option>
                                            <option value="2개월">2개월</option>
                                            <option value="3개월">3개월</option>
                                            <option value="4개월">4개월</option>
                                            <option value="5개월">5개월</option>
                                            <option value="장기">장기(6개월 이상)</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th width="20%">기술스택</th>
                                <td width="80%">
                                    <div class="ui form">
                                        <div class="field">
                                            <select name="tech" class="label ui selection fluid dropdown" multiple="">
                                                <option name="lang" value="전체">전체</option>
                                                <option name="lang" value="javascript">JavaScript</option>
                                                <option name="lang" value="typescript">TypeScript</option>
                                                <option name="lang" value="react">React</option>
                                                <option name="lang" value="vue">Vue</option>
                                                <option name="lang" value="svelte">Svelte</option>
                                                <option name="lang" value="nextjs">Nextjs</option>
                                                <option name="lang" value="nodejs">Nodejs</option>
                                                <option name="lang" value="java">Java</option>
                                                <option name="lang" value="spring">Spring</option>
                                                <option name="lang" value="go">Go</option>
                                                <option name="lang" value="nestjs">Nestjs</option>
                                                <option name="lang" value="kotlin">Kotlin</option>
                                                <option name="lang" value="express">Express</option>
                                                <option name="lang" value="mysql">MySQL</option>
                                                <option name="lang" value="mongodb">MongoDB</option>
                                                <option name="lang" value="python">Python</option>
                                                <option name="lang" value="django">Django</option>
                                                <option name="lang" value="c">C++</option>
                                                <option name="lang" value="php">php</option>
                                                <option name="lang" value="graphql">GraphQL</option>
                                                <option name="lang" value="firebase">Firebase</option>
                                                <option name="lang" value="flutter">Flutter</option>
                                                <option name="lang" value="swift">Swift</option>
                                                <option name="lang" value="reactnative">ReactNative</option>
                                                <option name="lang" value="unity">Unity</option>
                                                <option name="lang" value="aws">AWS</option>
                                                <option name="lang" value="kubernetes">Kubernetes</option>
                                                <option name="lang" value="docker">Docker</option>
                                                <option name="lang" value="git">Git</option>
                                                <option name="lang" value="figma">Figma</option>
                                                <option name="lang" value="zeplin">Zeplin</option>
                                                <option name="lang" value="jest">Jest</option>
                                            </select>
                                        </div>
                                        <div class="ui button" id="uibutton"
                                             style="position:absolute; right: 32px; top:0px;">
                                            전체 취소
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-sm-6">
                        <table class="table">
                            <tr>
                                <th width="20%">모집인원</th>
                                <td width="80%">
                                    <div>
                                        <select name="recruit" class="iselect">
                                            <option>전체</option>
                                            <option value="0">인원미정</option>
                                            <option value="1">1명</option>
                                            <option value="2">2명</option>
                                            <option value="3">3명</option>
                                            <option value="4">4명</option>
                                            <option value="5">5명</option>
                                            <option value="6">6명</option>
                                            <option value="7">7명</option>
                                            <option value="8">8명</option>
                                            <option value="9">9명</option>
                                            <option value="10">10명 이상</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th width="20%">모집마감일</th>
                                <td width="80%">
                                    <input type="date" name="deadline" class="iselect">
                                </td>
                            </tr>
                            <tr>
                                <th width="20%">연락방법</th>
                                <td width="80%">
                                    <div>
                                        <select name="contact_type" class="iselect">
                                            <option value="전체">전체</option>
                                            <option value="카카오 오픈채팅">카카오 오픈채팅</option>
                                            <option value="구글폼">구글폼</option>
                                            <option value="이메일">이메일</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th width="20%">연락주소</th>
                                <td width="80%">
                                    <input type="text" name="contact_link" size="40" class="input-sm iselect">
                                    <input type="hidden" name="user_id" value="${sessionScope.id}">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-sm-12">
                        <table class="table">
                            <tr>
                                <th width="20%">제목</th>
                                <td width=80%>
                                    <input type=text name=title size=90 class="input-sm iselect">
                                </td>
                            </tr>
                            <tr>
                                <th width="20%">내용</th>
                                <td width=80%>
                                    <div id="editor" class="html-smart-editor">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <input type=submit value="글쓰기" class="btn btn-sm btn-primary">
                                    <input type=button value="취소" class="btn btn-sm btn-danger"
                                           onclick="javascript:history.back()">
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <input type="hidden" name="content" id="study-content-hidden">
            </form>
        </div>
    </div>
</section>
</body>
</html>