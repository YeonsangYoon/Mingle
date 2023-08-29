<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="app-content mentoring-list">
    <div class="app-content-header">
        <h1 class="app-content-headerText">멘토링 신청 목록</h1>
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
    
    <div class="products-area-wrapper tableView ">
        <!-- 헤더 -->
        <div class="products-header">
            <div class="product-cell image">
                멘토 이미지
            </div>
            <div class="product-cell category">멘토 번호
	            <button class="sort-button">
	                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
	            </button>
            </div>
            
            <div class="product-cell sales">시작시간<button class="sort-button">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
            </button></div>
            <div class="product-cell stock">종료시간<button class="sort-button">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
            </button></div>
            
            <div class="product-cell price">후기<button class="sort-button">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
            </button></div>
            
            <div class="product-cell status-cell">승인 상태<button class="sort-button">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
            </button></div>
        </div>
        
        <!-- 내용 -->
        <div class="products-row" v-for="(vo, index) in mentoring_list">
            <button class="cell-more-button">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" 
                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" 
                stroke-linecap="round" stroke-linejoin="round" 
                class="feather feather-more-vertical">
                <circle cx="12" cy="12" r="1"/>
                <circle cx="12" cy="5" r="1"/>
                <circle cx="12" cy="19" r="1"/></svg>
            </button>
            
            <div class="product-cell image">
                <img :src="vo.image" alt="product">
                <span>{{vo.content}}</span>
            </div>
            
            <div class="product-cell category"><span class="cell-label">멘토 번호:</span>{{vo.mento_no}}.번</div>
            <div class="product-cell sales"><span class="cell-label">시작시간:</span>{{vo.str_time}}시</div>
            <div class="product-cell stock"><span class="cell-label">종료시간:</span>{{vo.end_time}}시</div>
            <div class="product-cell price">
            	<span class="cell-label">후기</span>
            	<span class="status approve" v-if="vo.state === 1 && vo.rep_state===0" @click="replyModal(index)">후기작성</span>
            	<span class="status disabled" v-else-if="vo.state === 1 && vo.rep_state===1">작성완료</span>
			    <span class="status active" v-else>작성불가</span>
            </div>
            
            <div class="product-cell status-cell">
            	<span class="cell-label">승인 상태:</span>
			    <span class="status disabled" v-if="vo.state === 0">대기상태</span>
			    <span class="status approve" v-else-if="vo.state === 1">승인</span>
			    <span class="status active" v-else>거절</span>
            </div>
        </div>
        <!-- 내용 끝 -->
        
        <!-- PageNation -->
	    <div class="col-lg-12 inline">
	        <div class="product__pagination">
	            <ul style="display:inline-flex;">
	                <li v-if="startPage>1">
	                    <span v-on:click="prev()"><i class="fa fa-angle-left"></i> 이전</span>
	                </li>
	                <li v-for="i in range(startPage, endPage)">
	                    <span v-on:click="pageChange(i)" :class="i==curpage?'active':''">{{i}}</span>
	                </li>
	                <li v-if="endPage<totalpage">
	                    <span @click="next()">다음 <i class="fa fa-angle-right"></i></span>
	                </li>
	            </ul>
	        </div>
	    </div>
        
    </div>
    
    
    <div id="replyModal" class="modal modal-review" >
     <form class="mb-3" name="myform" id="myform" method="post" action="/mingle/mento/submitreview.do">
		<fieldset>
			<span class="text-bold">별점을 선택해주세요</span>
			<input type="radio" name="star" value="5" id="rate1"><label
				for="rate1">★</label>
			<input type="radio" name="star" value="4" id="rate2"><label
				for="rate2">★</label>
			<input type="radio" name="star" value="3" id="rate3"><label
				for="rate3">★</label>
			<input type="radio" name="star" value="2" id="rate4"><label
				for="rate4">★</label>
			<input type="radio" name="star" value="1" id="rate5"><label
				for="rate5">★</label>
			<input type="hidden" name="counsel_no" :value="mentoring_list[selectedMento].counsel_no">
			<input type="hidden" name="mento_no" :value="mentoring_list[selectedMento].mento_no">
		</fieldset>
		<div class="mb-20">
		  <textarea class="col-auto form-control" type="text" name="content" id="reviewContents"
			 placeholder="다른 멘티분들이 볼 수 있게 솔직한 리뷰를 남겨주세요!"></textarea>
		</div>
		<div class="text-center">
		  <button class="reserve-button" >후기 등록</button>
		</div>
	 </form>	
    </div>
    
    
</div>

<script>
new Vue({
	el:'.mentoring-list',
	data:{
		mentoring_list: [],
        mentoring_detail: {},
        column: 'all',
        selectedMento:0,
        page_list: {},
        curpage: 1,
        totalpage: 0,
        startPage: 0,
        endPage: 0
	},
	mounted:function(){
		this.setData();
	},
	methods:{
		setData: function () {
            axios.get("/mingle/mento/mentoring_list.do", {
                params: {
                    column: this.column,
                    page: this.curpage
                }
            }).then(response => {
                console.log(response.data)
                this.mentoring_list = response.data
            })
            axios.get("/mingle/mento/mentoring_page_vue.do", {
                params: {
                    column: this.column,
                    page: this.curpage
                }
            }).then(response => {
                console.log(response.data);
                this.page_list = response.data;
                this.curpage = this.page_list.curpage
                this.totalpage = this.page_list.totalpage
                this.startPage = this.page_list.startPage
                this.endPage = this.page_list.endPage
            }).catch(error => {
                console.log(error.response)
            })
        },
        range: function (start, end) {
            let arr = [];
            let length = end - start;
            for (let i = 0; i <= length; i++) {
                arr[i] = start
                start++;
            }
            return arr;
        },
        pageChange: function (page) {
            this.curpage = page
            this.setData()
        },
        prev: function () {
            this.curpage = this.startPage > 1 ? this.startPage - 1 : this.startPage;
            this.setData()
        },
        next: function () {
            //this.curpage=this.endPage<totalpage?this.endPage+1:this.endPage;
            this.curpage = this.endPage + 1;
            this.setData();
        },
        find: function () {
            this.curpage = 1;
            this.setData();
        },
        mentoDetail: function (mento_no) {
            $('#Detailmodal').modal();

            axios.get('/mingle/mento/mento_detail_vue.do', {
                params: {
                    mento_no: mento_no
                }
            }).then(response => {
                console.log(response.data)
                this.mentoring_detail = response.data

            }).catch(error => {
                console.log(error.response)
            })
        },
        replyModal:function(index){
        	this.selectedMento = index;
        	$('#replyModal').modal();
        }
	}
})

</script>




