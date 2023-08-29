<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="app-content" id="study-list-area">
    <div class="app-content-header">
        <h1 class="app-content-headerText">내가 작성한 스터디 목록</h1>
    </div>
    <div class="app-content-actions">
        <input class="search-bar" placeholder="Search..." type="text">
        <div class="app-content-actions-wrapper">
            <button class="action-button list active" title="List View">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/><line x1="3" y1="6" x2="3.01" y2="6"/><line x1="3" y1="12" x2="3.01" y2="12"/><line x1="3" y1="18" x2="3.01" y2="18"/></svg>
            </button>
            <button class="action-button grid" title="Grid View">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
            </button>
        </div>
    </div>
    <div class="products-area-wrapper tableView">
        <div class="products-header">
            <div class="product-cell title" style="flex: 2">스터디 제목</div>
            <div class="product-cell onoff" style="flex: 0.5">진행방식</div>
            <div class="product-cell period" style="flex: 0.5">진행기간</div>
            <div class="product-cell recruit" style="flex: 0.5">모집인원</div>
            <div class="product-cell deadline" style="flex: 0.5">모집마감일</div>
        </div>
        <div class="products-row" v-for="vo in study_list" @click="moveStudyPage(vo.study_id)" style="cursor: pointer">
            <div class="product-cell title" style="flex: 2">
                <span>{{vo.title}}</span>
            </div>
            <div class="product-cell onoff" style="flex: 0.5">
                <span class="cell-label">진행방식</span>
                {{vo.onoff}}
            </div>
            <div class="product-cell period" style="flex: 0.5">
                <span class="cell-label">진행기간</span>
                {{vo.period}}
            </div>
            <div class="product-cell recruit" style="flex: 0.5">
                <span class="cell-label">모집인원</span>
                {{vo.recruit}}명
            </div>
            <div class="product-cell deadline" style="flex: 0.5">
                <span class="cell-label">모집마감일</span>
                {{vo.deadline}}
            </div>
        </div>
    </div>
    <div class="product__pagination">
        <ul>
            <li>
                <span v-on:click="selectPage(1)"><i class="fa fa-angle-double-left"></i></span>
            </li>
            <li>
                <span v-on:click="prev()"><i class="fa fa-angle-left"></i></span>
            </li>
            <li v-for="page in page_list">
                <span :class="page==curpage?'active':''" v-on:click="selectPage(page)">{{page}}</span>
            </li>
            <li>
                <span v-on:click="next()"><i class="fa fa-angle-right"></i></span>
            </li>
            <li>
                <span v-on:click="selectPage(totalpage)"><i class="fa fa-angle-double-right"></i></span>
            </li>
        </ul>
    </div>
</div>
<script>
    new Vue({
        el : '#study-list-area',
        data : {
            study_list : [],
            curpage : ${curpage},
            totalpage : 0,
            page_list : [],
        },
        mounted : function(){
            this.requestStudyData();
        },
        methods : {
            requestStudyData : function(){
                axios.get('/mingle/mypage/mystudy.do',{
                    params : {
                        page : this.curpage
                    }
                }).then(response => {
                    this.study_list = response.data.list;
                    this.totalpage = response.data.totalpage;
                    let start = Math.trunc((this.curpage-1) / 5) * 5 + 1;
                    let end = (this.totalpage > start + 4) ? start + 4 : this.totalpage;
                    this.page_list = [];
                    for(let i = start;i <= end;i++){
                        this.page_list.push(i);
                    }
                })
            },
            selectPage : function(page){
                if(this.curpage === page){
                    return;
                }
                this.curpage = page;
                this.requestStudyData();
            },
            next : function (){
                if(this.curpage === this.totalpage){
                    return;
                }
                this.curpage = this.page_list[this.page_list.length-1] + 1;
                this.curpage = (this.curpage > this.totalpage) ? this.totalpage : this.curpage;
                this.requestStudyData();
            },
            prev : function () {
                if (this.curpage === 1) {
                    return;
                }
                this.curpage = this.page_list[0] - 1;
                this.curpage = (this.curpage < 1) ? 1 : this.curpage;
                this.requestStudyData();
            },
            moveStudyPage : function (study_id){
                location.href = '/mingle/study/detail.do?study_id=' + study_id;
            }
        }
    })
</script>