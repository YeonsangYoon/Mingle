<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                    <h4>스터디 글 수정</h4>
                    <div class="breadcrumb__links">
                        <a href="#">스터디 모집</a>
                        <span>스터디 글 수정</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 프로그램 정보 기입란 -->
<section class="shop spad">
    <div class="container" id="update-all">
        <ul class="Category_categories__F4wF5">
            <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">스터디 글 수정</li>
        </ul>
        <div class="updatepage">
            <form method="post" action="update_ok.do" onsubmit="fillContent()">
                <div class="row">
                    <div class="col-sm-6">
                        <table class="table">
                            <tr>
                                <th width="20%">진행방식</th>
                                <td width="80%">
                                    <div>
                                        <select name="onoff" class="iselect">
                                            <option value="전체" ${vo.onoff == '전체' ? 'selected' : ''}>전체</option>
                                            <option value="온라인" ${vo.onoff == '온라인' ? 'selected' : ''}>온라인</option>
                                            <option value="오프라인" ${vo.onoff == '오프라인' ? 'selected' : ''}>오프라인</option>
                                            <option value="온/오프라인 병행" ${vo.onoff == '온/오프라인 병행' ? 'selected' : ''}>온/오프라인 병행</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th width="20%">진행기간</th>
                                <td width="80%">
                                    <div>
                                        <select name="period" class="iselect" value="${vo.period }">
                                            <option value="전체" ${vo.period  == '전체' ? 'selected' : '' }>전체</option>
                                            <option value="기간미정" ${vo.period  == '기간미정' ? 'selected' : '' }>기간미정</option>
                                            <option value="1개월" ${vo.period  == '1개월' ? 'selected' : '' }>1개월</option>
                                            <option value="2개월" ${vo.period  == '2개월' ? 'selected' : '' }>2개월</option>
                                            <option value="3개월" ${vo.period  == '3개월' ? 'selected' : '' }>3개월</option>
                                            <option value="4개월" ${vo.period  == '4개월' ? 'selected' : '' }>4개월</option>
                                            <option value="5개월" ${vo.period  == '5개월' ? 'selected' : '' }>5개월</option>
                                            <option value="장기" ${vo.period  == '장기' ? 'selected' : '' }>장기(6개월 이상)</option>
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
                                                <option name="lang" value="javascript" ${fn:contains(vo.techs, 'javascript') ? 'selected' : ''}>JavaScript</option>
                                                <option name="lang" value="typescript" ${fn:contains(vo.techs, 'typescript') ? 'selected' : '' }>TypeScript</option>
                                                <option name="lang" value="react" ${fn:contains(vo.techs, 'react') ? 'selected' : '' }>React</option>
                                                <option name="lang" value="vue" ${fn:contains(vo.techs, 'vue') ? 'selected' : '' }>Vue</option>
                                                <option name="lang" value="svelte" ${fn:contains(vo.techs, 'svelte') ? 'selected' : '' }>Svelte</option>
                                                <option name="lang" value="nextjs" ${fn:contains(vo.techs, 'nextjs') ? 'selected' : '' }>Nextjs</option>
                                                <option name="lang" value="nodejs" ${fn:contains(vo.techs, 'nodejs') ? 'selected' : '' }>Nodejs</option>
                                                <option name="lang" value="java" ${fn:contains(vo.techs, 'java') ? 'selected' : '' }>Java</option>
                                                <option name="lang" value="spring" ${fn:contains(vo.techs, 'spring') ? 'selected' : '' }>Spring</option>
                                                <option name="lang" value="go" ${fn:contains(vo.techs, 'go') ? 'selected' : '' }>Go</option>
                                                <option name="lang" value="nestjs" ${fn:contains(vo.techs, 'nestjs') ? 'selected' : '' }>Nestjs</option>
                                                <option name="lang" value="kotlin" ${fn:contains(vo.techs, 'kotlin') ? 'selected' : '' }>Kotlin</option>
                                                <option name="lang" value="express" ${fn:contains(vo.techs, 'express') ? 'selected' : '' }>Express</option>
                                                <option name="lang" value="mysql" ${fn:contains(vo.techs, 'mysql') ? 'selected' : '' }>MySQL</option>
                                                <option name="lang" value="mongodb" ${fn:contains(vo.techs, 'mongodb') ? 'selected' : '' }>MongoDB</option>
                                                <option name="lang" value="python" ${fn:contains(vo.techs, 'python') ? 'selected' : '' }>Python</option>
                                                <option name="lang" value="django" ${fn:contains(vo.techs, 'django') ? 'selected' : '' }>Django</option>
                                                <option name="lang" value="c" ${fn:contains(vo.techs, 'c') ? 'selected' : '' }>C++</option>
                                                <option name="lang" value="php" ${fn:contains(vo.techs, 'php') ? 'selected' : '' }>php</option>
                                                <option name="lang" value="graphql" ${fn:contains(vo.techs, 'graphql') ? 'selected' : '' }>GraphQL</option>
                                                <option name="lang" value="firebase" ${fn:contains(vo.techs, 'firebase') ? 'selected' : '' }>Firebase</option>
                                                <option name="lang" value="flutter" ${fn:contains(vo.techs, 'flutter') ? 'selected' : '' }>Flutter</option>
                                                <option name="lang" value="swift" ${fn:contains(vo.techs, 'swift') ? 'selected' : '' }>Swift</option>
                                                <option name="lang" value="reactnative" ${fn:contains(vo.techs, 'reactnative') ? 'selected' : '' }>ReactNative</option>
                                                <option name="lang" value="unity" ${fn:contains(vo.techs, 'unity') ? 'selected' : '' }>Unity</option>
                                                <option name="lang" value="aws" ${fn:contains(vo.techs, 'aws') ? 'selected' : '' }>AWS</option>
                                                <option name="lang" value="kubernetes" ${fn:contains(vo.techs, 'kubernetes') ? 'selected' : '' }>Kubernetes</option>
                                                <option name="lang" value="docker" ${fn:contains(vo.techs, 'docker') ? 'selected' : '' }>Docker</option>
                                                <option name="lang" value="git" ${fn:contains(vo.techs, 'git') ? 'selected' : '' }>Git</option>
                                                <option name="lang" value="figma" ${fn:contains(vo.techs, 'figma') ? 'selected' : '' }>Figma</option>
                                                <option name="lang" value="zeplin" ${fn:contains(vo.techs, 'zeplin') ? 'selected' : '' }>Zeplin</option>
                                                <option name="lang" value="jest" ${fn:contains(vo.techs, 'jest') ? 'selected' : '' }>Jest</option>
                                            </select>
                                        </div>
                                        <i class="fa fa-times" id="uibutton"></i>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th width="20%">모집상태</th>
                                <td width="80%">
                                    <div>
                                        <select name="isclosed" class="iselect">
                                            <option value="전체" ${vo.isclosed == '전체' ? 'selected' : ''}>전체</option>
                                            <option value="O" ${vo.isclosed == 'O' ? 'selected' : ''}>모집중</option>
                                            <option value="C" ${vo.isclosed == 'C' ? 'selected' : ''}>모집완료</option>
                                        </select>
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
                                        <select name="recruit" class="iselect" value="${vo.recruit }">
                                            <option>전체</option>
                                            <option value="0" ${vo.recruit  == '0' ? 'selected' : '' }>인원미정</option>
                                            <option value="1" ${vo.recruit  == '1' ? 'selected' : '' }>1명</option>
                                            <option value="2" ${vo.recruit  == '2' ? 'selected' : '' }>2명</option>
                                            <option value="3" ${vo.recruit  == '3' ? 'selected' : '' }>3명</option>
                                            <option value="4" ${vo.recruit  == '4' ? 'selected' : '' }>4명</option>
                                            <option value="5" ${vo.recruit  == '5' ? 'selected' : '' }>5명</option>
                                            <option value="6" ${vo.recruit  == '6' ? 'selected' : '' }>6명</option>
                                            <option value="7" ${vo.recruit  == '7' ? 'selected' : '' }>7명</option>
                                            <option value="8" ${vo.recruit  == '8' ? 'selected' : '' }>8명</option>
                                            <option value="9" ${vo.recruit  == '9' ? 'selected' : '' }>9명</option>
                                            <option value="10" ${vo.recruit  == '10' ? 'selected' : '' }>10명 이상</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th width="20%">모집마감일</th>
                                <td width="80%">
                                    <input type="date" name="deadline" class="iselect" value="${vo.deadline }">
                                </td>
                            </tr>
                            <tr>
                                <th width="20%">연락방법</th>
                                <td width="80%">
                                    <div>
                                        <select name="contact_type" class="iselect" value="${contact_type }">
                                            <option value="전체" ${vo.contact_type  == '전체' ? 'selected' : '' }>전체</option>
                                            <option value="카카오 오픈채팅" ${vo.contact_type  == '카카오 오픈채팅' ? 'selected' : '' }>카카오 오픈채팅</option>
                                            <option value="구글폼" ${vo.contact_type  == '전체' ? '구글폼' : '' }>구글폼</option>
                                            <option value="이메일" ${vo.contact_type  == '전체' ? '이메일' : '' }>이메일</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th width="20%">연락주소</th>
                                <td width="80%">
                                    <input type="text" name="contact_link" size="40" class="input-sm iselect" value="${vo.contact_link }">
                                    <input type="hidden" name="user_id" value="${sessionScope.id}">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-sm-12">
                        <table class="table">
                            <tr>
                                <td>
                                   <input class="study-edit-header" type=text
                                   		name=title size=90 class="input-sm iselect" value="${vo.title }" required>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="editor" class="html-smart-editor">${vo.content}</div>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">
                                    <input type=submit value="수정" class="btn btn-sm btn-primary">
                                    <input type=button value="취소" class="btn btn-sm btn-danger"
                                           onclick="javascript:history.back()">
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <input type="hidden" name="study_id" value="${vo.study_id}">
                <input type="hidden" name="content" id="study-content-hidden">
            </form>
        </div>
    </div>
</section>
</body>
</html>