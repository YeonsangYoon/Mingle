<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 부제목 -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row" style="text-align: center;">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>스터디 검색</h4>
                    <div class="breadcrumb__links">
                        <a href="#">스터디 홈</a>
                        <span>스터디 검색</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="study" id="vue-area">
    <div class="container">
    
        <!-- 소제목 및 정렬순 -->
        <div id="row">
            <div class="shop__product__option">
                <ul class="Category_categories__F4wF5">
                    <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">스터디 검색 결과</li>
                </ul>
                <div id="row">
                    <div class="shop__product__option__right" style="text-align: right">
                        <div class="nice-select" tabindex="0">
                            <span class="current">정렬순서</span>
                            <ul class="list">
                                <li data-value="" class="option selected">최신순</li>
                                <li data-value="" class="option">인기순</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 스터디 글 -->
        <div id="row">
            <ul class="studyList_studyList__3xoys">
              <c:forEach var="vo" items="${list }">
                <a class="studyItem_studyItem__1Iipn"
                	:href="../study/detail.do?study_id=${study_id}">
                    <li>
                        <div class="studyItem_badgeWrapper__3AW7k">
                            <div class="badge_badge__ZfNyB">
                                <div class="badge_new__DZ5tY">new</div>
                            </div>
                        </div>

                        <div class="studyItem_schedule__3oAnA">
                            <p class="studyItem_scheduleTitle__1KN_9">마감일 |</p>
                            <p>${vo.deadline}</p>
                        </div>

                        <h1 class="studyItem_title__2B_2o">${vo.title}</h1>

                        <ul class="studyItem_content__1mJ9M">
                            <li class="studyItem_language__20yqw">
                                <img class="studyItem_languageImage__1AfGa" title="java"
                                     src="../img/language/figma.svg" alt="language">
                            </li>
                        </ul>
                        <div class="study_info">
                            <span>작성자</span>
                            <span style="float: right">
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><path d="M288 80c-65.2 0-118.8 29.6-159.9 67.7C89.6 183.5 63 226 49.4 256c13.6 30 40.2 72.5 78.6 108.3C169.2 402.4 222.8 432 288 432s118.8-29.6 159.9-67.7C486.4 328.5 513 286 526.6 256c-13.6-30-40.2-72.5-78.6-108.3C406.8 109.6 353.2 80 288 80zM95.4 112.6C142.5 68.8 207.2 32 288 32s145.5 36.8 192.6 80.6c46.8 43.5 78.1 95.4 93 131.1c3.3 7.9 3.3 16.7 0 24.6c-14.9 35.7-46.2 87.7-93 131.1C433.5 443.2 368.8 480 288 480s-145.5-36.8-192.6-80.6C48.6 356 17.3 304 2.5 268.3c-3.3-7.9-3.3-16.7 0-24.6C17.3 208 48.6 156 95.4 112.6zM288 336c44.2 0 80-35.8 80-80s-35.8-80-80-80c-.7 0-1.3 0-2 0c1.3 5.1 2 10.5 2 16c0 35.3-28.7 64-64 64c-5.5 0-10.9-.7-16-2c0 .7 0 1.3 0 2c0 44.2 35.8 80 80 80zm0-208a128 128 0 1 1 0 256 128 128 0 1 1 0-256z"/></svg>
                                ${vo.hit}
                            </span>
                        </div>
                    </li>
                </a>
              </c:forEach>
            </ul>

            <!-- 페이징 -->
            <div id="row">
                <div class="text-center">
                   <div class="product__pagination">
                    <ul>
                        <li v-if="startpage>1">
                        	<span v-on:click="prev()"><i class="fa fa-angle-left"></i></span>
                        </li>
                        <li v-for="i in range(startpage,endpage)">
                        	<span :class="i==curpage?'active':''" v-on:click="selectpage(i)">{{i}}</span>
                        </li>
                        <li v-if="endpage<totalpage">
                        	<span @click="next()"><i class="fa fa-angle-right"></i></span>
                        </li>
                    </ul>
                  </div>
                </div>
            </div>
        </div>
	</div>
</section>