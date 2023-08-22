<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="app-content" id="mento-list-area">
    <div class="app-content-header">
        <h1 class="app-content-headerText">멘토 등록 현황</h1>
    </div>
    <div class="app-content-actions">
        <input class="search-bar" placeholder="Search..." type="text">
    </div>
    <div class="products-area-wrapper tableView">
        <div class="products-header">
            <div class="product-cell">아이디</div>
            <div class="product-cell">직무</div>
            <div class="product-cell">재직기업</div>
            <div class="product-cell">부서</div>
            <div class="product-cell"></div>
        </div>
        <div class="products-row" v-for="(mento, index) in mento_list" v-on:click="selectMento(index)">
            <div class="product-cell">
                <span>{{mento.user_id}}</span>
            </div>
            <div class="product-cell">
                <span>{{mento.job_cat}}</span>
            </div>
            <div class="product-cell">
                <span>{{mento.job}}</span>
            </div>
            <div class="product-cell">
                <span>{{mento.dept}}</span>
            </div>
            <div class="product-cell">
                <span class="status active" style="margin: 0 auto;" v-on:click.stop="deleteMento(index)">삭제</span>
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
    <div id="mento-detail-modal" class="modal info-content">
        <h3 class="text-center" style="margin-bottom: 10px;">멘토 상세 정보</h3>
        <div class="row">
            <div class="col-sm-3">
                <p>아이디</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMento.user_id}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>직무</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMento.job_cat}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>재직기업</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMento.job}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>부서</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMento.dept}}</p>
            </div>
        </div>
        <div>
            <h4>{{selectedMento.title}}</h4>
            <h5>멘토 소개</h5>
            <p>{{selectedMento.intro}}</p>
            <h5>주요 경력</h5>
            <pre>{{selectedMento.career}}</pre>
        </div>
    </div>
</div>
<script>
    new Vue({
        el : '#mento-list-area',
        data : {
            mento_list : [],
            curpage : ${curpage},
            totalpage : 0,
            page_list : [],
            selectedMento : {}
        },
        mounted : function(){
            this.requestMentoData();
        },
        methods : {
            requestMentoData : function(){
                axios.get('/mingle/admin/mento_list.do',{
                    params : {
                        page : this.curpage
                    }
                }).then(response => {
                    this.mento_list = response.data.list;
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
                this.requestMentoData();
            },
            next : function (){
                if(this.curpage === this.totalpage){
                    return;
                }
                this.curpage = this.page_list[this.page_list.length-1] + 1;
                this.curpage = (this.curpage > this.totalpage) ? this.totalpage : this.curpage;
                this.requestMentoData();
            },
            prev : function () {
                if (this.curpage === 1) {
                    return;
                }
                this.curpage = this.page_list[0] - 1;
                this.curpage = (this.curpage < 1) ? 1 : this.curpage;
                this.requestMentoData();
            },
            selectMento : function(index){
                this.selectedMento = this.mento_list[index];
                $('#mento-detail-modal').modal();
            },
            deleteMento : function (index){
                let user_id = this.mento_list[index].user_id;
                let mento_no = this.mento_list[index].mento_no;
                if(confirm('정말 ' + user_id + '님이 등록한 멘토 정보를 삭제하시겠습니까?')){
                    axios.post('/mingle/admin/deleteMento.do', null, {
                        params: {
                            mento_no : mento_no
                        }
                    }).then(response => {
                        if(response.data === 'OK'){
                            location.href = "/mingle/admin/mento.do?page=" + this.curpage;
                        }
                        else{
                            alert('멘토 삭제에 실패했습니다');
                        }
                    })
                }
            }
        }
    })
</script>