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
          	<select style="display:inline;" v-model="column">
				<option value="all">전체</option>          	
				<option value="title">제목</option>          	
				<option value="job">회사명</option>          	
				<option value="dept">부서명</option>   	
          	</select>
          	<input type="text" class="input-sm" size=20 ref="fd" v-model="fd">
          	<input type="button" value="검색" class="btn btn-sm btn-primary" @click="find()">
        </div>
        <!-- Search Section End -->
        
        <div class="container">
            <div class="row">
            	
            	<!-- 멘토 리스트 Start-->
            	<div class="col-sm-4 text-center" v-for="vo in mento_list">
            		
            		<!-- 상세보기 -->
            	  <div class="mento_list_box "  >
            		<div class="mento_list_box_top boxhover" @click="mentoDetail(vo.mento_no,true)">
            			<div style="height: 100px;"> 
            				<h3 class="mento_list_box_title">{{vo.job}}</h3>
            				<h3 class="mento_list_box_title" style="font-size: 20px !important">{{vo.intro}}</h3>
            			</div>
            			<div class="mento_list_info" style="height:100px;">
            				<div style="width: 140px;" >
	            				<div style="margin-top: 5px">
	            					<span class="mento_list_info_detail_title">직무</span>
	            					<span class="mento_list_info_detail_content">{{vo.job_cat}}</span> 
	            				</div>
	            				<div tyle="margin-top: 5px" >
	            					<span class="mento_list_info_detail_title">부서</span>
	            					<span class="mento_list_info_detail_content">{{vo.dept}}</span> 
	            				</div>
	            				<div tyle="margin-top: 5px" >
	            					<div class="mento_list_info_detail_title">경력</div>
	            					<div class="mento_list_info_detail_content">{{vo.career}}</div> 
	            				</div>
		            		</div>
		            		<div style="width: 100px; height:100px;">
		            			<div>
		            				<img src="${pageContext.request.contextPath}/img/blog/blog-1.jpg" alt="">
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
        
        <div id="dialog" title="멘토 상세보기" v-if="isShow">
        <table class="table">
          <tr>
           <td class="text-center" >
            <img src="${pageContext.request.contextPath}/img/blog/blog-2.jpg" style="width: 100%">
           </td>
          </tr>
        </table>
        
        <table class="table">
          <tr>
           <td colspan="2">
            <h3>{{mento_detail.title}}&nbsp;<span style="color:orange">{{mento_detail.follow}}</span></h3>
            <br>
            <h5>{{mento_detail.intro}}</h5>
           </td>
          </tr>
          <tr>
            <td width="25%">현 재직 기업</td>
            <td width="75%">{{mento_detail.job}}</td>
          </tr>
          <tr>
            <td width="25%">담당 부서</td>
            <td width="75%">{{mento_detail.dept}}</td>
          </tr>
          <tr>
            <td width="25%">재직 직군</td>
            <td width="75%">{{mento_detail.job_cat}}</td>
          </tr>
          <tr>
            <td width="30%">시간당 멘토링 비용</td>
            <td width="70%">{{mento_detail.cost}}</td>
          </tr>
          <tr>
            <td width="25%">커리어</td>
            <td width="75%">{{mento_detail.career}}</td>
          </tr>
          <tr>
            <td colspan=2 class="text-center">
            	<span class="follow"><a href="../mento/mento_contact.do">멘토링 신청</a></span>
            	<input type="button" value="닫기" class="star" @click="modalClose(false)">
            </td>
          </tr>
          
        </table>
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
   			
   			isShow:false
			
    	},
    	mounted:function(){
    		this.setData();
    		/* this.mentoEdit(); */
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
			mentoDetail:function(mento_no,bool){
				this.isShow=bool;
				axios.get('http://localhost/mingle/mento/mento_detail_vue.do',{
					params:{
						mento_no:mento_no
					}
				}).then(response=>{
					console.log(response.data)
					this.mento_detail=response.data
					/* this.posters=this.food_detail.poster.split("^"); */
					
					$('#dialog').dialog({
						autoOpen:false,
						modal:true,
						width:700,
						height:800
					}).dialog("open")
					
				}).catch(error=>{
					console.log(error.response)
				})
			},
			mentoContact:function(){
				
			},
			modalClose:function(bool){
				$('#dialog').dialog({
					autoOpen:false,
					modal:true,
					width:700,
					height:800
				}).dialog("close")
			}
    	}
    })
    
    </script>
    <!-- Blog Section End -->



