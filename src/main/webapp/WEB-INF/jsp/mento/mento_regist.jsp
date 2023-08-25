<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Breadcrumb Section Begin 상단 탭 -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row" style="text-align: center;">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>멘토링</h4>
                        <div class="breadcrumb__links">
                            <a href="../main/main.do">Home</a>
                            <span>멘토 등록</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
    <section class="checkout spad mento-regist">
    
    	<c:if test="${sessionScope.id==null}">
	    	<script>
			    alert("로그인 후 진행해주세요.");
			    window.location.href = '/mingle/main/main.do';
			</script>
        	<i>로그인 후 진행해 주세요!</i> 
        </c:if>
        
        <div class="container">
                    <div class="row">
                    	<h4> 안녕하세요 
                    	<span style="color: orange; font-weight: 800">${sessionScope.nickname}</span> 님<br>
                        지식 공유자가 되기 위해서는 아래의 정보가 필요해요</h4> 
                        <div class="col-lg-8 col-md-6">
                            <div> <hr> </div>
                            
                            <div class="mentoregist">
                            	<span>사용자 ID</span>
                                <input type="text" value="${sessionScope.id}" readonly v-model="user_id" name="user_id" ref="user_id">
                                <span style="color:red;">{{isok}}</span> 
                            </div>
                            
                            <div class="mentoregist">
                                <span>직무 카테고리</span>
                                <select style="height: 60px; width:348px; font-size: 17px" v-model="job_cat" ref="job_cat" name="job_cat">
									<option value="IT개발/데이터" >IT개발/데이터</option>          	
									<option value="회사/재무/금융" selected>회사/재무/금융</option>          	
									<option value="공사/공기업">공사/공기업</option>   	
									<option value="디자인/예술">디자인/예술 </option>   	
									<option value="마케팅/MD">마케팅/MD </option>   	
									<option value="유통/무역/구매">유통/무역/구매 </option> 
					          	</select>
									  	
                            </div>
                            
                            <div class="mentoregist">
                            	<span>현재 직업</span>
                               <input type="text" placeholder="현재 직업을 입력해 주세요" v-model="job" ref="job" name="job">
                            </div>
                            <div class="mentoregist">
                            	<span>멘토링 제목</span>
                                <input type="text" placeholder="등록할 멘토링 제목을 입력해주세요" v-model="title" ref="title" name="title" >
                            </div>
                            <div class="mentoregist">
                            	<span style="vertical-align: top;">멘토링 내용</span>
                            	<textarea rows="10" cols="30" placeholder="간단한 자기소개부터 멘토링에 대한 설명을 해주세요" v-model="intro" ref="intro" name="intro">
                            	</textarea>
                            </div>
                            <div class="mentoregist">
                            	<span>경력 사항</span>
                                <input type="textarea" placeholder="경력사항을 작성해주세요" v-model="career" ref="career" name="career" >
                            </div>
                            <div class="mentoregist">
                            	<span>부서</span>
                                <input type="textarea" placeholder="속하신 부서를 적어주세요" v-model="dept" ref="dept" name="dept">
                            </div>
                            <div class="mentoregist">
                                 <span>시간당 희망금액<br>(15,000이하)</span>
                                 <input type="number" value="1000" min="1000" max="15000" step="2000" v-model="cost" name="cost" ref="cost">
                            </div>
                            
                            <div style="margin-bottom: 50px">
	                            <div style="text-align: center;">
	                                개인정보 활용동의, 수익에 대한 약관 동의
	                            </div>
                                <label class="text-center" style="display: block">
                                    <input type="checkbox"  value="agree" ref="agree" v-model="agree" > 동의하기
                                </label>
                            </div>
                            
                            <div class="text-center">
					           <span class="button-mento boxhover" v-on:click="submitForm()">등록하기</span>
					           <span class="button-cancle boxhover" v-on:click="back()">취소</span>
					        </div>
                            
                        </div>
                        
                        
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4 class="order__title">상담 희망 요일과, 시간대를 선택해 주세요</h4>
                                <label for="birthday">상담 희망 날짜</label>
                				<input type="date" id="birthday" onchange="ck_birthday()">
                                <div class="checkout__order__products">Product <span>Total</span></div>
                                <ul class="checkout__total__products">
                                    <li>01. Vanilla salted caramel <span>$ 300.0</span></li>
                                    <li>02. German chocolate <span>$ 170.0</span></li>
                                    <li>03. Sweet autumn <span>$ 170.0</span></li>
                                    <li>04. Cluten free mini dozen <span>$ 110.0</span></li>
                                </ul>
                                <ul class="checkout__total__all">
                                    <li>Subtotal <span>$750.99</span></li>
                                    <li>Total <span>$750.99</span></li>
                                </ul>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        Create an account?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua.</p>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Check Payment
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div> 
                        
                    </div>
                
        </div>
    </section>
    <!-- Checkout Section End -->
    <script>
    new Vue({
    	el:'.mento-regist',
    	data:{
    		user_id:'${sessionScope.id}',
    		job_cat:'',
    		career:'',
    		job:'',
    		cost:'',
    		title:'',
    		intro:'',
    		dept:'',
    		image:'',
    		agree:'',
    		isok:''
    		
    	},
    	mounted : function(){
    		this.idCheck();
    	},
    	methods:{
    		submitForm:function(){
    			if(this.job_cat===''){
    				this.$refs.job_cat.focus();
    				return;
    			}
    			if(this.career===''){
    				this.$refs.career.focus();
    				return;
    			}
    			if(this.job===''){
    				this.$refs.job.focus();
    				return;
    			}
    			if(this.title===''){
    				this.$refs.title.focus();
    				return;
    			}
    			if(this.intro===''){
    				this.$refs.intro.focus();
    				return;
    			}
    			if(this.dept===''){
    				this.$refs.dept.focus();
    				return;
    			}
    			if(this.agree===''){
    				this.$refs.agree.focus();
    				alert("약관에 동의해 주세요");
    				return;
    			}
    			if(this.cost<1000 || this.cost>15000){
    				this.$refs.cost.focus();
    				alert("시간당 금액은 1,000 ~ 15,000 사이만 가능합니다.");
    				return;
    			}
    			this.idCheck();
    			
    		   axios.post('../mento/regist_ok_vue.do',null,{
    			   params:{
    				   	user_id:this.user_id,
    		    		job_cat:this.job_cat,
    		    		career:this.career,
    		    		job:this.job,
    		    		cost:this.cost,
    		    		title:this.title,
    		    		intro:this.intro,
    		    		dept:this.dept,
    		    		image:this.image
    			   }
    		   }).then(response => {
    			   console.log(response.data)
    			   location.href="../mento/mento_list.do"
    		   })
 			  
    		},
    		back:function(){
    			location.href="../mento/mento_list.do"
    		},
    		idCheck:function(){
    			if(this.user_id==='admin'){
 					alert("관리자계정으로 접근합니다.")
 					this.isok="관리자 계정입니다."
 					return;
 				}
 				if(this.user_id!==''){
 					axios.post("/mingle/member/regist_usercheck.do",null,{
 						params:{
 							user_id:this.user_id
 						}
 					}).then(res=>{
 						if(res.data=='no'){
 							alert("이미 멘토로 등록된 사용자입니다.");
 							this.isok="등록된 계정입니다."
 							/* location.href="../mento/mento_list.do" */
 						}
 						else{
 							this.isok="등록 가능합니다."
 						}
 					})
 				}
 				
 			}
    	}
    })
    </script>


</body>
</html>