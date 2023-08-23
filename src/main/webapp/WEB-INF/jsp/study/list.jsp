<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- 검색바 -->
        <div class="row-study">
            <div class="study-search-bar">
              <form method="post" action="../board/find.do" class="inline">
                <label for="writer" class="pretty-checkbox">
                    <input id="writer" type="checkbox" name="fs" value="W" v-model="wCheck">
                    <span class="checkmark"></span>
                    <span>작성자</span>
                </label>
                <label for="title" class="pretty-checkbox">
                    <input id="title" type="checkbox" name="fs" value="T" v-model="tCheck">
                    <span class="checkmark"></span>
                    <span>제목</span>
                </label>
                <label for="content" class="pretty-checkbox">
                    <input id="content" type="checkbox" name="fs" value="C" v-model="cCheck">
                    <span class="checkmark"></span>
                    <span>내용</span>
                </label>
                <label for="searchBar">
                    <input id="searchBar" type="text" v-model="searchWord">
                </label>
                <button class="search-btn">검색</button>
              
            </div>
        </div>

        <!-- 기술분야 탭 -->
        <div class="row-study">
            <div class="css-goiz5j" id="headlessui-popover-panel-3" tabindex="-1" data-headlessui-state="open">
                <ul class="Category_categories__F4wF5">
                    <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">기술 스택</li>
                </ul>
                <ul class="LanguageBar_languages__243rH">
                    <li v-for="(tech, index) in tech_list" class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP" :key="index" :class="{'active': index == selectedTech}" v-on:click="selectTech(index)">
                        <img class="LanguageBar_logo__rGfFz" :src="'${pageContext.request.contextPath}/img/language/'+ tech.toLowerCase() +'.svg'" alt="JavaScript">
                        <span class="LanguageBar_languageName__2dSeC">{{tech}}</span>
                    </li>
                </ul>
                <div class="SelectedLanguage_selectedWrapper__3dpZm">
                    <ul class="SelectedLanguage_selectedLanguages__3r4F4"></ul>
                </div>
            </div>
        </div>

        <!-- 소제목 및 정렬순 -->
        <div class="row-study">
            <div class="shop__product">
                <ul class="Category_categories__F4wF5">
                    <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">스터디 목록</li>
                </ul>
                <div>
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
        <div class="row-study">
            <ul class="studyList_studyList__3xoys">
                <div v-for="vo in study_list">
                    <a class="studyItem_studyItem__1Iipn"
                       :href="'../study/detail.do?study_id='+vo.study_id">
                        <li>
                            <c:if test="${today==vo.dbday }">
                                <img src="../img/new_new.png" style="display:inline-block; width:40px;">
                            </c:if>
                            <div class="studyItem_schedule__3oAnA">
                                <p class="studyItem_scheduleTitle__1KN_9">마감일 |</p>
                                <p>{{vo.deadline}}</p>
                            </div>

                            <h1 class="studyItem_title__2B_2o">{{vo.title}}</h1>

                            <ul class="studyItem_content__1mJ9M">
                                <li class="studyItem_language__20yqw" v-for="tech in vo.techs">
                                    <img class="studyItem_languageImage__1AfGa" title="java"
                                         :src="'../img/language/'+tech+'.svg'" alt="language">
                                </li>
                            </ul>
                            <div class="study_info">
                                <span>{{vo.nickname}}</span>
                                <span style="float: right">
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><path
                                        d="M288 80c-65.2 0-118.8 29.6-159.9 67.7C89.6 183.5 63 226 49.4 256c13.6 30 40.2 72.5 78.6 108.3C169.2 402.4 222.8 432 288 432s118.8-29.6 159.9-67.7C486.4 328.5 513 286 526.6 256c-13.6-30-40.2-72.5-78.6-108.3C406.8 109.6 353.2 80 288 80zM95.4 112.6C142.5 68.8 207.2 32 288 32s145.5 36.8 192.6 80.6c46.8 43.5 78.1 95.4 93 131.1c3.3 7.9 3.3 16.7 0 24.6c-14.9 35.7-46.2 87.7-93 131.1C433.5 443.2 368.8 480 288 480s-145.5-36.8-192.6-80.6C48.6 356 17.3 304 2.5 268.3c-3.3-7.9-3.3-16.7 0-24.6C17.3 208 48.6 156 95.4 112.6zM288 336c44.2 0 80-35.8 80-80s-35.8-80-80-80c-.7 0-1.3 0-2 0c1.3 5.1 2 10.5 2 16c0 35.3-28.7 64-64 64c-5.5 0-10.9-.7-16-2c0 .7 0 1.3 0 2c0 44.2 35.8 80 80 80zm0-208a128 128 0 1 1 0 256 128 128 0 1 1 0-256z"/></svg>
                                {{vo.hit}}
                            </span>
                            </div>
                            <c:if test="${!like }">
                                <img class="studyItem_bookmark__2YtKX" src="../img/bookmark-off.png"
                                     @click="like(${vo.user_id })" alt="bookmark">
                            </c:if>
                        </li>
                    </a>
                </div>
            </ul>

            <!-- 페이징 -->
            <div class="row-study">
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

<script>
    new Vue({
        el: '#vue-area',
        data: { // 명시적 초기화
            study_list: [],
            curpage: 1,
            totalpage: 0,
            startpage: 0,
            endpage: 0,
            searchWord : '',
            wCheck : false,
            tCheck : false,
            cCheck : false,
            selectedTech : -1,
            tech_list : ['JavaScript', 'TypeScript', 'React', 'Vue', 'Svelte', 'Nextjs', 'Nodejs', 'Java',
                        'Spring', 'Go', 'Nestjs', 'Kotlin', 'Express', 'MySQL', 'MongoDB', 'Python', 'Django',
                        'php', 'GraphQL', 'Firebase', 'Flutter', 'Swift', 'ReactNative', 'Unity', 'AWS',
                        'Kubernetes', 'Docker', 'Git', 'Figma', 'Zeplin', 'Jest']

        },
        mounted: function () {
            this.send()
        },
        methods: {
            send: function () {
                axios.get("/mingle/study/list_vue.do", {
                    params: { // 전송할 데이터
                        page: this.curpage,
                        tech: (this.selectedTech !== -1) ? this.tech_list[this.selectedTech].toLowerCase() : '',
                        searchWord: this.searchWord.trim(),
                        wCheck : this.wCheck,
                        tCheck : this.tCheck,
                        cCheck : this.cCheck
                    }
                }).then(response => {
                    console.log(response.data);
                    this.totalpage = response.data.totalpage;
                    this.study_list = response.data.list;
                    this.startpage = (Math.trunc((this.curpage - 1) / 5) * 5) + 1;
                    this.endpage = Math.min(this.startpage + 4, this.totalpage);
                })
            },
            range: function (start, end) {
                let arr = []
                let length = end - start
                for (let i = 0; i <= length; i++) {
                    arr[i] = start;
                    start++;
                }
                return arr
            },
            prev: function () {
                this.curpage = this.startpage - 1
                this.send()
            },
            next: function () {
                this.curpage = this.endpage + 1
                this.send()
            },
            selectpage: function (page) {
                this.curpage = page
                this.send()
            },
            selectTech : function (index){
                this.curpage = 1;
                if(this.selectedTech === index){
                    this.selectedTech = -1;
                }
                else{
                    this.selectedTech = index;
                }
                this.send();
            }
        }
    })
</script>