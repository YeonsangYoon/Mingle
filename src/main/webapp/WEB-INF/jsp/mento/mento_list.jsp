<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
    <!-- Breadcrumb Section Begin -->
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
				<option value="title">제목</option>          	
				<option value="USER_ID">아이디</option>          	
				<option value="CAREER">직업</option>          	
          	</select>
          	<input type="text" class="input-sm" size=20 >
          	<input type="button" value="검색" class="btn btn-sm btn-primary" @find="find()">
        </div>
        <!-- Search Section End -->
        
        <div class="container">
            <div class="row">
            
            	<div class="col-sm-4 text-center" v-for="vo in mento_list">
            	  <div class="mento_list_box boxlist" @click="mentoDetail()" >
            		<div class="mento_list_box_top">
            			<div style="height: 100px"> 
            				<h3>제목{{vo.title}}</h3>
            			</div>
            			<div class="mento_list_info" style="height:100px;">
            				<div style="width: 140px;" >
	            				<div class="mento_list_info_detail" >
	            					<span>직무</span>
	            					<span>{{vo.job_cat}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>경력</span>
	            					<span>{{vo.career}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>현직</span>
	            					<span>{{vo.job}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>이름</span>
	            					<span>{{vo.name}}</span> 
	            				</div>
		            		</div>
		            		<div style="width: 110px; height:100px;">
		            			<div>사진{{vo.image}}</div>
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
            	
            	<div class="col-sm-4 text-center" v-for="vo in mento_list">
            	  <div class="mento_list_box">
            		<div class="mento_list_box_top">
            			<div style="height: 100px"> 
            				<h3>제목{{vo.title}}</h3>
            			</div>
            			<div class="mento_list_info" style="height:100px;">
            				<div style="width: 140px;" >
	            				<div class="mento_list_info_detail" >
	            					<span>직무</span>
	            					<span>{{vo.job_cat}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>경력</span>
	            					<span>{{vo.career}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>현직</span>
	            					<span>{{vo.job}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>이름</span>
	            					<span>{{vo.name}}</span> 
	            				</div>
		            		</div>
		            		<div style="width: 110px; height:100px;">
		            			<div>사진{{vo.image}}</div>
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
            	
            	<div class="col-sm-4 text-center" v-for="vo in mento_list">
            	  <div class="mento_list_box">
            		<div class="mento_list_box_top">
            			<div style="height: 100px"> 
            				<h3>제목{{vo.title}}</h3>
            			</div>
            			<div class="mento_list_info" style="height:100px;">
            				<div style="width: 140px;" >
	            				<div class="mento_list_info_detail" >
	            					<span>직무</span>
	            					<span>{{vo.job_cat}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>경력</span>
	            					<span>{{vo.career}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>현직</span>
	            					<span>{{vo.job}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>이름</span>
	            					<span>{{vo.name}}</span> 
	            				</div>
		            		</div>
		            		<div style="width: 110px; height:100px;">
		            			<div>사진{{vo.image}}</div>
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
            	
            	<div class="col-sm-4 text-center" v-for="vo in mento_list">
            	  <div class="mento_list_box">
            		<div class="mento_list_box_top">
            			<div style="height: 100px"> 
            				<h3>제목{{vo.title}}</h3>
            			</div>
            			<div class="mento_list_info" style="height:100px;">
            				<div style="width: 140px;" >
	            				<div class="mento_list_info_detail" >
	            					<span>직무</span>
	            					<span>{{vo.job_cat}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>경력</span>
	            					<span>{{vo.career}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>현직</span>
	            					<span>{{vo.job}}</span> 
	            				</div>
	            				<div class="mento_list_info_detail" >
	            					<span>이름</span>
	            					<span>{{vo.name}}</span> 
	            				</div>
		            		</div>
		            		<div style="width: 110px; height:100px;">
		            			<div>사진{{vo.image}}</div>
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
               
            </div>
        </div>
        
        <div class="text-center">
	        <ul>
	          <li v-if="startPage>1"><a href="#" v-on:click="prev()">&laquo; Previous</a></li>
	          
	          <li v-for="i in range(startPage, endPage)" >
	          	<a href="#" v-on:click="pageChange(i)">{{i}}</a>
	          </li>
	          
	          <li v-if="endPage<totalpage"><a href="#"  @click="next()">Next &raquo;</a></li>
	        </ul>
       </div>
       
       
      
    </section>
    
    <script>
    new Vue({
    	el:'.container-mento',
    	data:{
    		mento_list:[],
    		column:'all',
    		
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
    		this.find();
    	},
    	methods:{
    		find:function(){
    			axios.get("http://localhost/mingle/mento/mento_list_vue.do",{
    				params:{
    					
    				}
    			}).then(response=>{
    				console.log(response.data)
    				this.mento_list=response.data
    			})
    			axios.get("http://localhost/mingle/mento/mento_page_vue.do",{
					params:{
						column:this.column,
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
				this.find()
			},
			prev:function(){
				this.curpage=this.startPage>1?this.startPage-1:this.startPage;
				this.dataSend()
			},
			next:function(){
				//this.curpage=this.endPage<totalpage?this.endPage+1:this.endPage;
				this.curpage=this.endPage+1;
				this.dataSend();
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



