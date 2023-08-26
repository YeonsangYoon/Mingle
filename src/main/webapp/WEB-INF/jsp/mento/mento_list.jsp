<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Breadcrumb Section Begin 상단 탭 -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row" style="text-align: center;">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>멘토링</h4>
                        <div class="breadcrumb__links">
                            <a href="../main/main.do">Home</a>
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
    	<div class="text-center" style="display:flex; justify-content: center; padding-bottom: 50px " v-model="column">
          	<a :href="'../mento/mento_contact.do?mentono='+311">
	           	<div>
	           		멘토링 신청
	           	</div>
          	</a>
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
			<div class="col-sm-4" v-for="vo in mento_list">
				<div class="card open-mentoring-card " style="display: block;">
					<div v-on:click="mentoDetail(vo.mento_no)" class="boxhover">
						<div class="thumbnail">
							<img :src=vo.image>
						</div>
	
						<div class="card-content card-content-padding">
							<div class="open_mentoring_card__jobtype">{{vo.job_cat}}</div>
	
	
							<div class="content-body" type="external">
								<div class="mentee-question">{{vo.job}}</div>
								<div class="oversize">{{vo.title}}</div> 
							</div>
	
							<div>
								<div style="display:flex">
									<span class="mento_list_info_detail_title" style="display: inline-block;">부서</span> 
									<span class="mento_list_info_detail_content" style="display: inline-block;">{{vo.dept}}</span>
								</div>
								<div style="display:flex">
									<span class="mento_list_info_detail_title" style="display: inline-block;">경력</span>
									<span class="mento_list_info_detail_content oversize" style="display: inline-block;" v-html="vo.career"></span>
										<!-- v-html="vo.career" 넣어줘야함 -->
								</div>
							</div>
	
						</div>
					</div>
					<div class="" >
						<div class="card-footer text-center">
							<div class="follow mento_list_info">팔로워 &nbsp; {{vo.follow}}</div>
							<div class="star mento_list_info">별점 &nbsp; {{vo.avg_star}}
							</div>
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
        
     <div id="Detailmodal" class="modal modal-my">
     <div class="modalinner">
        <table class="table">
          <tr>
           <td class="text-center" >
            <img :src=mento_detail.image style="width: 100%">
           </td>
          </tr>
        </table>
        
        <table class="table">
          <tr>
           <td colspan="2" class="detail-modal-font">
            <h3>{{mento_detail.title}}&nbsp;<span style="color:#ff188d; font-size: 12px;" >팔로워 &nbsp; {{mento_detail.follow}}</span></h3>
            <br>
            <h5 v-html="mento_detail.intro"></h5>
           </td>
          </tr>
          <tr>
            <td width="25%" class="detail-modal-font">현 재직 기업</td>
            <td width="75%">{{mento_detail.job}}</td>
          </tr>
          <tr>
            <td width="25%" class="detail-modal-font">담당 부서</td>
            <td width="75%">{{mento_detail.dept}}</td>
          </tr>
          <tr>
            <td width="25%" class="detail-modal-font">재직 직군</td>
            <td width="75%">{{mento_detail.job_cat}}</td>
          </tr>
          <tr>
            <td width="30%" class="detail-modal-font">시간당 멘토링 비용</td>
            <td width="70%">{{mento_detail.cost}}</td>
          </tr>
          <tr>
            <td width="25%" class="detail-modal-font">커리어</td>
            <td width="75%" v-html="mento_detail.career"></td>
          </tr>
          <tr>
            <td colspan=2 class="text-center follow">
            	<a :href="'../mento/mento_contact.do?mentono='+mento_detail.mento_no">
	            	<div>
	            		멘토링 신청
	            	</div>
            	</a>
            </td>
          </tr>
        </table> 
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
   			
			
    	},
    	mounted:function(){
    		this.setData();
    		/* this.mentoEdit(); 
    		this.imageInput();*/
    	},
    	
    	methods:{
    		setData:function(){
    			axios.get("/mingle/mento/mento_list_vue.do",{
    				params:{
    					column:this.column,
    					fd:this.fd,
    					page:this.curpage
    				}
    			}).then(response=>{
    				console.log(response.data)
    				this.mento_list=response.data
    			})
    			axios.get("/mingle/mento/mento_page_vue.do",{
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
			mentoDetail:function(mento_no){
				$('#Detailmodal').modal();
				
				axios.get('/mingle/mento/mento_detail_vue.do',{
					params:{
						mento_no:mento_no
					}
				}).then(response=>{
					console.log(response.data)
					this.mento_detail=response.data
					
				}).catch(error=>{
					console.log(error.response)
				})
			},
			mentoContact:function(){
				
			},
			imageInput(){
				axios.get('/mingle/mento/image_input.do',{
					
				}).then(response=>{
					
				}).catch(error=>{
					console.log(error.response)
				})
			}
			
    	}
    })
    
    </script>
    <!-- Blog Section End -->



