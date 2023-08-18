<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
    <!-- Breadcrumb Section Begin 상단 탭 -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row" style="text-align: center;">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>멘토링</h4>
                        <div class="breadcrumb__links">
                            <a href="#">Home</a>
                            <span>멘토 리스트</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad container-mento">
    	
    	<!-- Search Section Begin -->
    	<div style="display: flex; justify-content: center;">
          	<select style="display:inline;">
				<option value="all">전체</option>          	
				<option value="TITLE">제목</option>          	
				<option value="JOB">회사</option>          	
				<option value="CAREER">직업</option>   	
          	</select>
          	<input type="text" class="input-sm" size=20 >
          	<input type="button" value="검색" class="btn btn-sm btn-primary" @click="find()">
        </div>
        <!-- Search Section End -->
        
        <div class="container">
            <div class="row">
            	
            	<!-- 멘토 리스트 Start-->
            	<div class="col-sm-4 text-center" v-for="vo in mento_list">
            		
            		<!-- 상세보기 -->
            	  <div class="mento_list_box boxhover" @click="mentoDetail()" >
            		<div class="mento_list_box_top">
            			<div style="height: 100px;"> 
            				<h3 class="mento_list_box_title">{{vo.title}}</h3>
            				<h3 class="mento_list_box_title" style="font-size: 20px !important">{{vo.job}}</h3>
            			</div>
            			<div class="mento_list_info" style="height:100px;">
            				<div style="width: 140px;" >
	            				<div style="margin-top: 5px">
	            					<span class="mento_list_info_detail_title">직무</span>
	            					<span class="mento_list_info_detail_content">{{vo.job_cat}}</span> 
	            				</div>
	            				<div tyle="margin-top: 5px" >
	            					<span class="mento_list_info_detail_title">경력</span>
	            					<span class="mento_list_info_detail_content">{{vo.career}}</span> 
	            				</div>
	            				<div tyle="margin-top: 5px" >
	            					<div class="mento_list_info_detail_title">현직</div>
	            					<div class="mento_list_info_detail_content">{{vo.job}}</div> 
	            				</div>
		            		</div>
		            		<div style="width: 100px; height:100px;">
		            			<div>
		            				<img src="${pageContext.request.contextPath}/img/blog/blog-1.jpgg" alt="">
		            				{{vo.image}}
		            			</div>
		            		</div>
            			</div>
            		</div>
            		
            		<div class="mento_list_box_top" style="height:70px; padding: 16px 0px">
	            		<div class="mento_list_info">
	            			<div class="follow">
	            				팔로우 &nbsp; {{vo.follow}}
	            			</div>
	            			<div class="star">
	            				별점 &nbsp; {{vo.avg_star}}</div>
	            		</div>
            		</div>
            		
            	  </div>
            	</div>
            	<!-- 멘토 리스트 End-->
            		
           	  </div>
           	</div>
               
        <!-- PageNation -->
        <div class="col-lg-12 inline">
        	<div class="product__pagination">
	        <ul style="display:inline-flex;">
	          <li v-if="startPage>1">
	          	<a href="#" v-on:click="prev()" style="width:90px">&laquo; Previous</a>
	          </li>
	          <li v-for="i in range(startPage, endPage)" >
	          	<a href="#" v-on:click="pageChange(i)" :class="i==curpage?'active':''">{{i}}</a>
	          </li>
	          <li v-if="endPage<totalpage">
	          	<a href="#"  @click="next()" style="width:90px">Next &raquo;</a>
	          </li>
	        </ul>
	        </div>
        </div>
       
    </section>
    
    <script>
    new Vue({
    	el:'.container-mento',
    	data:{
    		mento_list:[],
    		mento_detail:{},
    		column:'all',
    		fd:'',
    		
   			page_list:{},
   			curpage:1,
   			totalpage:0,
   			startPage:0,
   			endPage:0,
   			
   			isShow:false,
			posters:[],
			menus:[]
    	},
    	mounted:function(){
    		this.setData();
    	},
    	methods:{
    		setData:function(){
    			axios.get("http://localhost/mingle/mento/mento_list_vue.do",{
    				params:{
    					column:this.column,
    					fd:this.fd,
    					page:this.curpage
    				}
    			}).then(response=>{
    				console.log(response.data)
    				this.mento_list=response.data
    			})
    			axios.get("http://localhost/mingle/mento/mento_page_vue.do",{
					params:{
						column:this.column,
						fd:this.fd,
						page:this.curpage
					}
				}).then(response=>{
					console.log(response.data);
					this.page_list=response.data;
					this.curpage=this.page_list.curpage
					this.totalpage=this.page_list.totalpage
					this.startPage=this.page_list.startPage
					this.endPage=this.page_list.endPage
				}).catch(error=>{
					console.log(error.response)
				})
    		},
    		range:function(start,end){
				let arr=[];
				let length=end-start;
				for(let i=0; i<=length; i++){
					arr[i]=start
					start++;
				}
				return arr;
			},
    		pageChange:function(page){
				this.curpage=page
				this.setData()
			},
			prev:function(){
				this.curpage=this.startPage>1?this.startPage-1:this.startPage;
				this.setData()
			},
			next:function(){
				//this.curpage=this.endPage<totalpage?this.endPage+1:this.endPage;
				this.curpage=this.endPage+1;
				this.setData();
			},
			find:function(){
				this.curpage=1;
				this.setData();
			},
			mentoDetail:function(fno,bool){
				this.isShow=bool;
				axios.get('http://localhost/web/food/food_detail_vue.do',{
					params:{
						fno:fno
					}
				}).then(response=>{
					console.log(response.data)
					this.food_detail=response.data
					this.posters=this.food_detail.poster.split("^");
					console.log(this.posters)
					if(this.food_detail.menu!='no'){
						this.menus=this.food_detail.menu.split("원");
					}
					
					$('#dialog').dialog({
						autoOpen:false,
						modal:true,
						width:700,
						height:600
					}).dialog("open")
					
				}).catch(error=>{
					console.log(error.response)
				})
			}
    	}
    })
    
    </script>
    <!-- Blog Section End -->



