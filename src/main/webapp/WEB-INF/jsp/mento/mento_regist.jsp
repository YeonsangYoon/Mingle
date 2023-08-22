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
    <section class="checkout spad">
    
    	<c:if test="${sessionScope.id==null}">
	    	<script>
			    alert("로그인 후 진행해주세요.");
			    window.location.href = '/mingle/main/main.do';
			</script>
        	<i>로그인 후 진행해 주세요!</i> 
        </c:if>
        
        <div class="container">
                <form action="#">
                    <div class="row">
                    	<h4> 안녕하세요 
                    	<span style="color: orange; font-weight: 800">${sessionScope.nickname}</span> 님<br>
                        지식 공유자가 되기 위해서는 아래의 정보가 필요해요</h4> 
                        <div class="col-lg-8 col-md-6">
                            <div> <hr> </div>
                            
                            <div class="mentoregist">
                            	<span>사용자 ID :</span>
                                <input type="text" value=${sessionScope.id} readonly>
                            </div>
                            
                            <div class="mentoregist">
                                <span>직무 카테고리 :</span>
                                <select style="height: 25px; width:300px; font-size: 17px">
									<option value="all">전체</option>
									<option value="dev">IT개발/데이터</option>          	
									<option value="finance">회사/재무/금융</option>          	
									<option value="official">공사/공기업</option>   	
									<option value="art">디자인/예술 </option>   	
					          	</select>
                            </div>
                            
                            <div class="mentoregist">
                            	<span>현재 직업</span>
                               <input type="text" placeholder="현재 직업을 입력해 주세요" >
                            </div>
                            <div class="mentoregist">
                            	<span>멘토링 제목</span>
                                <input type="text" placeholder="등록할 멘토링 제목을 입력해주세요" >
                            </div>
                            <div class="mentoregist">
                            	<span>멘토링 내용</span>
                                <input type="textarea" placeholder="간단한 자기소개부터 멘토링에 대한 설명을 해주세요" >
                            </div>
                            <div class="mentoregist">
                            	<span>경력 사항</span>
                                <input type="textarea" placeholder="등록할 멘토링 제목을 입력해주세요" >
                            </div>
                            <div class="mentoregist">
                            	<span>부서</span>
                                <input type="textarea" placeholder="속하신 부서를 적어주세요" >
                            </div>
                            <div class="mentoregist">
                                 <span>시간당 희망금액</span>
                                 <input type="number" value="1000" min="1000" max="15000" step="2000">
                            </div>
	                                
                            
                            
                            
                            <div>
	                            <p>
	                                개인정보 활용동의, 수익에 대한 약관 동의
	                            </p>
                                <label>
                                    <input type="checkbox" name="color" value="agree"> 동의하기
                                </label>
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
                </form>
                
        </div>
    </section>
    <!-- Checkout Section End -->


</body>
</html>