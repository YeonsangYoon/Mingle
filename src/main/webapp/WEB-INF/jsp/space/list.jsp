<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row" style="text-align: center;">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>스터디 공간</h4>
                    <div class="breadcrumb__links">
                        <a href="../space/detail.do">Home</a>
                        <span>스터디 공간</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<!-- Shop Section Begin -->
<section class="shop slpad">
    <h2 class="text-center">어떤 공간을 찾고 있나요?</h2>
    <div class="container container-area">
        <div class="row space_category">
            <div class="text-center">
                <button class="btn btn-sm" @click="spaceCategoryData('all')">
                    <img src="../img/spaceIcon/private_office.svg">
                    <div>전체</div>
                </button>
                <button class="btn btn-sm" @click="spaceCategoryData('스터디룸')">
                    <img src="../img/spaceIcon/study.svg">
                    <div>스터디룸</div>
                </button>
                <button class="btn btn-sm" @click="spaceCategoryData('회의실')">
                    <img src="../img/spaceIcon/meeting.svg">
                    <div>회의실</div>
                </button>
                <button class="btn btn-sm" @click="spaceCategoryData('카페')">
                    <img src="../img/spaceIcon/cafe.svg">
                    <div>카페</div>
                </button>
                <button class="btn btn-sm" @click="spaceCategoryData('세미나실')">
                    <img src="../img/spaceIcon/seminar.svg">
                    <div>세미나실</div>
                </button>
                <button class="btn btn-sm" @click="spaceCategoryData('컨퍼런스')">
                    <img src="../img/spaceIcon/conference.svg">
                    <div>컨퍼런스</div>
                </button>
                <button class="btn btn-sm" @click="spaceCategoryData('강의실')">
                    <img src="../img/spaceIcon/lecture.svg">
                    <div>강의실</div>
                </button>
            </div>
        </div>

        <div class="row">
            <%--            <div class="shop__space__option" style="display:contents">--%>
            <%--                <div class="nice-select" tabindex="0" style="margin-right:20px;">--%>
            <%--                    <span class="current">지역</span>--%>
            <%--                    <ul class="list">--%>
            <%--                        <li data-value="" class="option selected">최신순</li>--%>
            <%--                        <li data-value="" class="option">인기순</li>--%>
            <%--                    </ul>--%>
            <%--                </div>--%>
            <%--                <div class="nice-select" tabindex="0" style="margin-right:20px;">--%>
            <%--                    <span class="current">카테고리</span>--%>
            <%--                    <ul class="list">--%>
            <%--                        <li data-value="" class="option selected">최신순</li>--%>
            <%--                        <li data-value="" class="option">인기순</li>--%>
            <%--                    </ul>--%>
            <%--                </div>--%>
            <%--                <div class="nice-select" tabindex="0" style="margin-right:20px;">--%>
            <%--                    <span class="current">날짜</span>--%>
            <%--                    <ul class="list">--%>
            <%--                        <li><input type="text" id="datepicker_init_day" placeholder="예약할 날짜를 입력하세요."></li>--%>
            <%--                    </ul>--%>
            <%--                </div>--%>
            <%--                <div class="space__sidebar__search">--%>
            <%--                    <input type="text" placeholder="검색어를 입력하세요." size="25">--%>
            <%--                    <button type="submit"><span class="icon_search"></span></button>--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <div class="col-lg-3 col-md-6 col-sm-6" v-for="vo in space_list">
                <div class="space__item">

                    <div class="space__item__pic">
                        <a :href="'../space/detail.do?space_id='+vo.space_id"><img :src="vo.poster"></a>
                        <ul class="space__hover">
                            <li><a href="../space/list.do"><img src="/mingle/img/icon/heart.png" alt=""></a></li>
                        </ul>
                    </div>

                    <div class="space__item__text">
                        <ul>
                            <li><a :href="'../space/detail.do?space_id='+vo.space_id">{{vo.title}}</a></li>
                            <li>서초동</li>
                            <li><b>{{vo.price|currency}}</b>원/시간</li>
                            <li>최대 <b>{{vo.max_guest}}</b>인</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <%-- class="active" --%>
                <div class="product__pagination inline">
                    <ul>
                        <li v-if="startPage>1">
                            <span v-on:click="prev()"><i class="fa fa-angle-left"></i></span>
                        </li>
                        <li href="#" v-for="p in range(startPage,endPage)">
                            <span :class="p==curpage?'active':''" v-on:click="selectPage(p)">{{p}}</span>
                        </li>
                        <li v-if="endPage<totalpage">
                            <span @click="next()"><i class="fa fa-angle-right"></i></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->
<script>
    new Vue({
        el: '.container-area',
        data: {
            space_list: [],
            curpage: 1,
            totalpage: 0,
            startPage: 0,
            endPage: 0,
            category: 'all'
        },
        filters: {
            currency: function (value) {
                let num = new Number(value);
                return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
            }
        },
        mounted: function () {
            this.spaceCategoryData(this.category)
        },
        methods: {
            spaceCategoryData: function (category) {
                this.category = category;

                axios.get("/mingle/space/list_vue.do", {
                    params: {
                        page: this.curpage,
                        category: this.category
                    }
                })
                    .then(res => {
                        console.log(res.data)
                        this.space_list = res.data.list;
                        this.totalpage = res.data.totalpage;
                        this.startPage = Math.trunc((this.curpage - 1) / 10) * 10 + 1;
                        this.endPage = (this.startPage + 9 > this.totalpage) ? this.totalpage : this.startPage + 9;
                    }).catch(error => {
                    console.log(error.res)
                })
            },
            range: function (start, end) {
                let arr = []
                let length = end - start
                for (let i = 0; i <= length; i++) {
                    arr[i] = start
                    start++
                }
                return arr
            },
            selectPage: function (page) {
                this.curpage = page
                this.spaceCategoryData(this.category)
            },
            prev: function () {
                this.curpage = this.startPage - 1
                this.spaceCategoryData(this.category)
            },
            next: function () {
                this.curpage = this.endPage + 1
                this.spaceCategoryData(this.category)
            }
        }
    })
</script>