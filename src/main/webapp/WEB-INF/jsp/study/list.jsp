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
                <button class="search-btn" @click="doSearch()">검색</button>
            </div>
        </div>

        <!-- 기술분야 탭 -->
        <div class="row-study">
            <div class="css-goiz5j" id="headlessui-popover-panel-3" tabindex="-1" data-headlessui-state="open">
                <ul class="Category_categories__F4wF5">
                    <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">기술 스택</li>
                </ul>
                <ul class="LanguageBar_languages__243rH">
                    <li v-for="(tech, index) in tech_list"
                        class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP" :key="index"
                        :class="{'active': index == selectedTech}" v-on:click="selectTech(index)">
                        <img class="LanguageBar_logo__rGfFz"
                             :src="'${pageContext.request.contextPath}/img/language/'+ tech.toLowerCase() +'.svg'"
                             alt="JavaScript">
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
					
					<!-- 모집중 토글 -->
					<div class="toggle-container" @click="toggleButton()" onclick="toggleButton()">
					  <div class="toggle-switch"></div>
					  <span class="toggle-text">모집중만 보기</span>
					</div>
					
                </div>
            </div>
        </div>

            <!-- 스터디 글 -->
        <div class="row-study">
            <ul class="studyList_studyList__3xoys">
                <a v-for="vo, index in study_list" class="studyItem_studyItem__1Iipn" @click="moveDetail(vo.study_id)">
                    <li>
                        <span v-if="vo.isclosed == 'O'" class="open-badge">모집중</span>
                        <span v-if="vo.isclosed == 'C'" class="close-badge">모집완료</span>
                        
							<img class="studyItem_bookmark__2YtKX book_mark clicked"
								alt="bookmark"
								@click.stop="changeLiked(index, vo.user_id)"
								:src="vo.isLiked ? '/mingle/img/bookmark-on.png' : '/mingle/img/bookmark-off.png'">

<%--                         <img class="studyItem_bookmark__2YtKX" src="../img/bookmark-off.png" @click="like(${vo.user_id })" alt="bookmark"> --%>
                        
                        <div class="studyItem_schedule__3oAnA">
                            <p class="studyItem_scheduleTitle__1KN_9">마감일 |</p>
                            <p>{{vo.deadline}}</p>
                        </div>

                        <h1 class="studyItem_title__2B_2o">{{vo.title}}</h1>

                        <ul class="studyItem_content__1mJ9M">
                            <li class="studyItem_language__20yqw" v-for="(tech, index) in vo.techs"
                                v-if="index < 5">
                                <img class="studyItem_languageImage__1AfGa" title="java"
                                     :src="'../img/language/'+tech+'.svg'" alt="language">
                            </li>
                        </ul>
                        <div class="study_info">
                            <span class="nickname">{{vo.nickname}}</span>
                            <span class="hit-comment">
                                <i class="fa fa-comments-o" aria-hidden="true"></i>
                                {{vo.reply_cnt}}
                                <i class="fa fa-eye" aria-hidden="true"></i>
                                {{vo.hit}}
                            </span>
                        </div>
                    </li>
                </a>
            </ul>
        </div>

        <!-- 페이징 -->
        <div class="row-study" v-if="page_list.length > 0">
            <div class="text-center">
                <div class="product__pagination">
                    <ul>
                        <li>
                            <span v-on:click="selectpage(1)"><i class="fa fa-angle-double-left"></i></span>
                        </li>
                        <li>
                            <span v-on:click="prev()"><i class="fa fa-angle-left"></i></span>
                        </li>
                        <li v-for="i in page_list">
                                    <span :key="i" :class="{'active' : i==curpage}"
                                          v-on:click="selectpage(i)">{{i}}</span>
                        </li>
                        <li>
                            <span @click="next()"><i class="fa fa-angle-right"></i></span>
                        </li>
                        <li>
                                    <span v-on:click="selectpage(totalpage)"><i
                                            class="fa fa-angle-double-right"></i></span>
                        </li>
                    </ul>
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
            page_list: [],
            searchWord: '',
            wCheck: false,
            tCheck: false,
            cCheck: false,
            isClosed: false,
            onOffToggle: false,
            selectedTech: -1,
            tech_list: ['JavaScript', 'TypeScript', 'React', 'Vue', 'Svelte', 'Nextjs', 'Nodejs', 'C', 'Java',
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
                        wCheck: this.wCheck,
                        tCheck: this.tCheck,
                        cCheck: this.cCheck,
                        isClosed: this.isClosed,
                        onOffToggle: this.onOffToggle
                    }
                }).then(response => {
                    this.totalpage = response.data.totalpage;
                    this.study_list = response.data.list;

                    let start = (Math.trunc((this.curpage - 1) / 5) * 5) + 1;
                    let end = Math.min(start + 4, this.totalpage);

                    this.page_list = [];
                    for (let i = start; i <= end; i++) {
                        this.page_list.push(i);
                    }
                })
            },
            prev: function () {
                if (this.curpage === 1) {
                    return;
                }
                this.curpage = Math.max(this.page_list[0] - 1, 1);
                this.send()
            },
            next: function () {
                if (this.curpage === this.totalpage) {
                    return;
                }
                this.curpage = Math.min(this.totalpage, this.page_list[this.page_list.length - 1] + 1);
                this.send()
            },
            selectpage: function (page) {
                if (page === this.curpage) {
                    return;
                }
                this.curpage = page
                this.send()
            },
            selectTech: function (index) {
                if (this.selectedTech === index) {
                    this.selectedTech = -1;
                } else {
                    this.selectedTech = index;
                }
                this.curpage = 1;
                this.send();
            },
            doSearch: function (page) {
                this.curpage = page;
                this.send();
            },
            changeLiked: function(index, event) {
                if (this.study_list[index].isLiked) {
                    axios.get("/mingle/study/likeOff_vue.do", {
                        params: {
                            study_id: this.study_list[index].study_id
                        }
                    })
                    .then(res => {
                    	if(res.data === 'OK'){
	                        this.study_list[index].isLiked = false
                    	}
                    	else if(res.data === 'NOID'){
                    		alert('로그인이 필요한 서비스입니다');
                    	}
                    	else{
                    		alert('좋아요 실패')
                    	}
                    }).catch(error => {
                        console.log(error.res)
                    })
                } else {
                    axios.get("/mingle/study/likeOn_vue.do", {
                        params: {
                            study_id: this.study_list[index].study_id
                        }
                    })
                    .then(res => {
                    	if(res.data === 'OK'){
	                        this.study_list[index].isLiked = true;
                    	}
                    	else if(res.data === 'NOID'){
                    		alert('로그인이 필요한 서비스입니다');
                    	}
                    	else{
                    		alert('좋아요 실패')
                    	}
                    }).catch(error => {
                        console.log(error.res)
                    });
                }
            },
            moveDetail : function(study_id){
            	location.href = "/mingle/study/detail.do?study_id=" + study_id;
            },
            toggleButton:function(){
				this.onOffToggle=!this.onOffToggle;
				this.send()
            }
        }
    })
</script>