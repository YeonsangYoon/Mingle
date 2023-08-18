<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- 부제목 -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row" style="text-align: center;">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>스터디 목록</h4>
                    <div class="breadcrumb__links">
                        <a href="#">스터디 모집</a>
                        <span>스터디 홈</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="study" id="vue-area">
    <div class="container">
        <div class="row">
            <!-- 검색바 -->
            <div class="study-search-bar">
                <label for="writer" class="pretty-checkbox">
                    <input id="writer" type="checkbox">
                    <span class="checkmark"></span>
                    <span>작성자</span>
                </label>
                <label for="title" class="pretty-checkbox">
                    <input id="title" type="checkbox">
                    <span class="checkmark"></span>
                    <span>제목</span>
                </label>
                <label for="content" class="pretty-checkbox">
                    <input id="content" type="checkbox">
                    <span class="checkmark"></span>
                    <span>내용</span>
                </label>
                <label for="searchBar">
                    <input id="searchBar" type="text">
                </label>

                <button class="search-btn">검색</button>
            </div>
        </div>
        <div class="row">
            <!-- 기술분야 탭 -->
            <div class="css-goiz5j" id="headlessui-popover-panel-3" tabindex="-1" data-headlessui-state="open">
                <ul class="Category_categories__F4wF5">
                    <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">기술스택</li>
                </ul>
                <ul class="LanguageBar_languages__243rH">
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/javascript.svg" alt="JavaScript"><span
                            class="LanguageBar_languageName__2dSeC">JavaScript</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/typescript.svg" alt="TypeScript"><span
                            class="LanguageBar_languageName__2dSeC">TypeScript</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/react.svg" alt="React"><span
                            class="LanguageBar_languageName__2dSeC">React</span>
                    </li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/vue.svg" alt="Vue"><span
                            class="LanguageBar_languageName__2dSeC">Vue</span>
                    </li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/svelte.svg" alt="Svelte"><span
                            class="LanguageBar_languageName__2dSeC">Svelte</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/nextjs.svg" alt="Nextjs"><span
                            class="LanguageBar_languageName__2dSeC">Nextjs</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/nodejs.svg" alt="Nodejs"><span
                            class="LanguageBar_languageName__2dSeC">Nodejs</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/java.svg" alt="Java"><span
                            class="LanguageBar_languageName__2dSeC">Java</span>
                    </li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/spring.svg" alt="Spring"><span
                            class="LanguageBar_languageName__2dSeC">Spring</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/go.svg" alt="Go"><span
                            class="LanguageBar_languageName__2dSeC">Go</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/nestjs.svg" alt="Nestjs"><span
                            class="LanguageBar_languageName__2dSeC">Nestjs</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/kotlin.svg" alt="Kotlin"><span
                            class="LanguageBar_languageName__2dSeC">Kotlin</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/express.svg" alt="Express"><span
                            class="LanguageBar_languageName__2dSeC">Express</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/mysql.svg" alt="MySQL"><span
                            class="LanguageBar_languageName__2dSeC">MySQL</span>
                    </li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/mongodb.svg" alt="MongoDB"><span
                            class="LanguageBar_languageName__2dSeC">MongoDB</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/python.svg" alt="Python"><span
                            class="LanguageBar_languageName__2dSeC">Python</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/django.svg" alt="Django"><span
                            class="LanguageBar_languageName__2dSeC">Django</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/php.svg" alt="php"><span
                            class="LanguageBar_languageName__2dSeC">php</span>
                    </li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/graphql.svg" alt="GraphQL"><span
                            class="LanguageBar_languageName__2dSeC">GraphQL</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/firebase.svg" alt="Firebase"><span
                            class="LanguageBar_languageName__2dSeC">Firebase</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/flutter.svg" alt="Flutter"><span
                            class="LanguageBar_languageName__2dSeC">Flutter</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/swift.svg" alt="Swift"><span
                            class="LanguageBar_languageName__2dSeC">Swift</span>
                    </li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/reactnative.svg" alt="ReactNative"><span
                            class="LanguageBar_languageName__2dSeC">ReactNative</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/unity.svg" alt="Unity"><span
                            class="LanguageBar_languageName__2dSeC">Unity</span>
                    </li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/aws.svg" alt="AWS"><span
                            class="LanguageBar_languageName__2dSeC">AWS</span>
                    </li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/kubernetes.svg" alt="Kubernetes"><span
                            class="LanguageBar_languageName__2dSeC">Kubernetes</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/docker.svg" alt="Docker"><span
                            class="LanguageBar_languageName__2dSeC">Docker</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/git.svg" alt="Git"><span
                            class="LanguageBar_languageName__2dSeC">Git</span>
                    </li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/figma.svg" alt="Figma"><span
                            class="LanguageBar_languageName__2dSeC">Figma</span>
                    </li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/zeplin.svg" alt="Zeplin"><span
                            class="LanguageBar_languageName__2dSeC">Zeplin</span></li>
                    <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img
                            class="LanguageBar_logo__rGfFz"
                            src="../img/language/jest.svg" alt="Jest"><span
                            class="LanguageBar_languageName__2dSeC">Jest</span>
                    </li>
                </ul>
                <div class="SelectedLanguage_selectedWrapper__3dpZm">
                    <ul class="SelectedLanguage_selectedLanguages__3r4F4"></ul>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- 소제목 및 정렬순 -->
            <div class="shop__product__option">
                <ul class="Category_categories__F4wF5">
                    <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">스터디 목록</li>
                </ul>
                <div class="row">
                    <div class="shop__product__option__right" style="text-align: right">
                        <div class="nice-select" tabindex="0">
                            <span class="current">정렬순서</span>
                            <ul class="list">
                                <li data-valueA="" class="option selected">최신순</li>
                                <li data-value="" class="option">인기순</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 스터디 글 -->
        <div class="row">
            <ul class="studyList_studyList__3xoys">
                <a v-for="vo in study_list" class="studyItem_studyItem__1Iipn" href="#">
                    <li>
                        <div class="studyItem_badgeWrapper__3AW7k">
                            <div class="badge_badge__ZfNyB">
                                <div class="badge_new__DZ5tY">new</div>
                            </div>
                        </div>

                        <div class="studyItem_schedule__3oAnA">
                            <p class="studyItem_scheduleTitle__1KN_9">마감일 |</p>
                            <p>{{vo.deadline}}</p>
                        </div>

                        <h1 class="studyItem_title__2B_2o">{{vo.title}}</h1>

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
                                {{vo.hit}}
                            </span>
                        </div>
                    </li>
                </a>
            </ul>

            <!-- 페이징 -->
            <div class="row">
                <div class="text-center">
                    <ul class="product__pagination">
                        <li v-if="startpage>1"><a href="#" v-on:click="prev()">&lt;</a></li>
                        <li v-for="i in range(startpage,endpage)" :class="i==curpage?'active':''"><a
                                href="#" v-on:click="selectpage(i)">{{i}}</a></li>
                        <li v-if="endpage<totalpage"><a href="#" @click="next()">&gt;</a></li>
                    </ul>
                </div>
            </div>
        </div>
</section>