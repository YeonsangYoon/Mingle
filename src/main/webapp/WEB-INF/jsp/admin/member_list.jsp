<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="app-content" id="member-list-area">
    <div class="app-content-header">
        <h1 class="app-content-headerText">회원 등록 현황</h1>
    </div>
    <div class="app-content-actions">
        <input class="search-bar" placeholder="Search..." type="text">
    </div>
    <div class="products-area-wrapper tableView">
        <div class="products-header">
            <div class="product-cell">아이디</div>
            <div class="product-cell">가입일</div>
            <div class="product-cell">이름</div>
            <div class="product-cell">닉네임</div>
            <div class="product-cell">성별</div>
            <div class="product-cell"></div>
        </div>
        <div class="products-row" v-for="(member, index) in member_list" v-on:click="selectMember(index)">
            <div class="product-cell">
                <span>{{member.user_id}}</span>
            </div>
            <div class="product-cell">
                <span>{{member.dbday}}</span>
            </div>
            <div class="product-cell">
                <span>{{member.user_name}}</span>
            </div>
            <div class="product-cell">
                <span>{{member.nickname}}</span>
            </div>
            <div class="product-cell">
                <span>{{member.gender == 'm' ? '남자' : '여자'}}</span>
            </div>
            <div class="product-cell">
                <span class="status active" v-if="member.user_id != 'admin'" v-on:click.stop="withdrawMember(index)">탈퇴</span>
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
    <div id="member-detail-modal" class="modal info-content">
        <h3 class="text-center" style="margin-bottom: 10px;">회원정보카드</h3>
        <div class="row">
            <div class="col-sm-3">
                <p>아이디</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMember.user_id}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>가입일</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMember.dbday}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>이름</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMember.user_name}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>닉네임</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMember.nickname}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>성별</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMember.gender=='m' ? '남자' : '여자'}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>전화번호</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMember.phone}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>이메일</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMember.email}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>생년 월일</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMember.birthday}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>주소</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMember.address}}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>상세 주소</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>{{selectedMember.detail_address}}</p>
            </div>
        </div>
    </div>
</div>
<script>
    new Vue({
        el : '#member-list-area',
        data : {
            member_list : [],
            curpage : ${curpage},
            totalpage : 0,
            page_list : [],
            selectedMember : {}
        },
        mounted : function(){
            this.requestMemberData();
        },
        methods : {
            requestMemberData : function(){
                axios.get('/mingle/admin/member_list.do',{
                    params : {
                        page : this.curpage
                    }
                }).then(response => {
                    this.member_list = response.data.list;
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
                this.requestMemberData();
            },
            next : function (){
                if(this.curpage === this.totalpage){
                    return;
                }
                this.curpage = this.page_list[this.page_list.length-1] + 1;
                this.curpage = (this.curpage > this.totalpage) ? this.totalpage : this.curpage;
                this.requestMemberData();
            },
            prev : function () {
                if (this.curpage === 1) {
                    return;
                }
                this.curpage = this.page_list[0] - 1;
                this.curpage = (this.curpage < 1) ? 1 : this.curpage;
                this.requestMemberData();
            },
            selectMember : function(index){
                this.selectedMember = this.member_list[index];
                $('#member-detail-modal').modal();
            },
            withdrawMember : function(index){
                let user_id = this.member_list[index].user_id;
                if(confirm('정말 ' + user_id + '님을 탈퇴시키겠습니까?')){
                    axios.post('/mingle/admin/withdraw.do', null, {
                        params : {
                            user_id : user_id
                        }
                    }).then(response => {
                        if(response.data === 'OK'){
                            location.href = '/mingle/admin/admin.do?page='+this.curpage;
                        }
                        else{
                            alert("회원탈퇴에 실패했습니다.");
                        }
                    })
                }
            }
        }
    })
</script>