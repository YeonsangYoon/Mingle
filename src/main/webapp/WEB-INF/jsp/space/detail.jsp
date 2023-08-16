<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <!-- Breadcrumb Section Begin 
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row" style="text-align: center;">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>스터디 공간</h4>
                        <div class="breadcrumb__links">
                            <a href="#">Home</a>
                            <span>스터디 공간</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     Breadcrumb Section End -->
    
    <!-- Shop Details Section Begin -->
    <section class="shop-details">
        <div class="space__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">

						<div id="wrapper">
						   	  <div id="slider-wrap">
						      	  <ul id="space-slider">
						          	 <li data-color="#1abc9c">
						                <div>
						                </div>                
						             </li>
						          </ul>
						          
						           <!--controls-->
						          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
						          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
						          <div id="counter"></div>
						          
						          <div id="pagination-wrap">
						            <ul>
						            </ul>
						          </div>
						          <!--controls-->  
						      </div>
						   </div>              
                    
                    </div>
                    
                    <div class="col-lg-5 aligning">
			            <h4 class="mb-4">숙소 이름</h4>
			            <p class="mb-4 text-muted">부제목 라라라라라라라랄ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ</p>
			            <div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-sm-between mb-4">
			              <ul class="list-inline mb-2 mb-sm-0">
			                <li class="list-inline-item h4 font-weight-light mb-0">$할인가</li>
			                <li class="list-inline-item text-muted font-weight-light"> 
			                  <del>정가</del>
			                </li>
			              </ul>
			              <div class="d-flex align-items-center text-sm">
			                <ul class="list-inline mr-2 mb-0">
			                  <li class="list-inline-item mr-0"><i class="fa fa-star text-primary"></i></li>
			                  <li class="list-inline-item mr-0"><i class="fa fa-star text-primary"></i></li>
			                  <li class="list-inline-item mr-0"><i class="fa fa-star text-primary"></i></li>
			                  <li class="list-inline-item mr-0"><i class="fa fa-star text-primary"></i></li>
			                  <li class="list-inline-item mr-0"><i class="fa fa-star text-gray-300"></i></li>
			                </ul><span class="text-muted text-uppercase">25 reviews</span>
			              </div>
			            </div>
			            
			              <div class="row">
			                <div class="col-sm-6 col-lg-12 detail-option mb-4">
		                  <h6 class="detail-option-heading">예약일 <span>(required)</span></h6>
			                  <select class="selectpicker" name="size" data-style="btn-selectpicker">
			                    <option value="value_0">Small</option>
			                    <option value="value_1">Medium</option>
			          	          <option value="value_2">Large</option>
			                  </select>
			                </div>
			              </div>
			              <div class="input-group w-100 mb-4">
			                <input class="form-control form-control-lg detail-quantity" name="items" type="number" value="1">
			                <div class="input-group-append flex-grow-1">
			                  <button class="btn btn-dark btn-block" type="submit"> <i class="fa fa-shopping-cart mr-2"></i>예약하기</button>
			                </div>
			              </div>
			              <div class="row mb-4">
			                <div class="col-6"><a href="#"> <i class="far fa-heart"></i>Add to wishlist </a></div>
			                <div class="col-6 text-right">
			                  <ul class="list-inline mb-0">
			                    <li class="list-inline-item mr-2"><a class="text-dark text-hover-primary" href="#"><i class="fab fa-facebook-f"> </i></a></li>
			                    <li class="list-inline-item"><a class="text-dark text-hover-primary" href="#"><i class="fab fa-twitter"> </i></a></li>
			                  </ul>
			                </div>
			              </div>
                    </div>
                </div>
                
            </div>
        </div>


    <div class="space__details__content">
      <div class="container">
       <div class="row">
        <div class="col-lg-12">
         <div class="space__details__tab">       
           <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item"><a class="nav-link detail-nav-link active" data-toggle="tab" href="#tab-5" role="tab">공간소개</a></li>
            <li class="nav-item"><a class="nav-link detail-nav-link" data-toggle="tab" href="#tab-6" role="tab">위치정보</a></li>
            <li class="nav-item"><a class="nav-link detail-nav-link" data-toggle="tab" href="#tab-7" role="tab">이용후기</a></li>
           </ul>

          <div class="tab-content">
            <div class="tab-pane active" id="tab-5" role="tabpanel">
              <div class="space__details__tab__content">
                <p class="note">Nam tempus turpis at metus scelerisque placerat nulla deumantos
                pharetras loremos.</p>
                <div class="space__details__tab__content__item">
                  <h5>공간 설명</h5>
                  <p>모임이 즐겁다-! 모임공간 모락(樂) 서울대입구점 입니다 :D
											👉 여러 명이 접속해도 끊김 없는 GIGA WIFI
											👉 스터디, 소모임, 회의, 과외, 면접, 인터뷰, 영상 촬영, 원데이클래스, 파티 등 단독 모임을 위한 복합 공간
											👉 단독으로 사용 가능한 약 9평의 공간 및 편안한 휴식이 가능한 쇼파 구비
											👉 화이트보드 / 55인치 TV / 노트북 / 프린터 / 조명 및 삼각대 / 블루투스 스피커 / 간단한 차, 커피 등 기본 제공
											
											※ 주차 : 본 건물 주차타워에 유료 주차(최초 1시간 3,000원 이후 시간 2,000원)
											
											* 소음 관련 문제로 24시 이후 야간 이용이 불가하오니 예약 시 참고 부탁드립니다
											
											※ 기타 문의사항은 유선 또는 카카오톡(@moraksn)으로 연락 바랍니다.
											※ 인원이 확정되지 않은 경우, 확정된 인원으로 우선 예약 후 이용 당일 추가 이체해 주시면 됩니다.
											※ 예약 시 이용 당일 2시간 전에 비밀번호 포함된 안내 문자가 카카오톡으로 발송됩니다.</p>
                </div>
                <div class="space__details__tab__content__item">
                  <h5>시설 안내</h5>
				  <p>55인치 4K UHD TV (유튜브 프리미엄/넷플릭스/디즈니+/노트북 미러링) / HDMI 케이블 구비
                                               55인치 4K UHD TV (유튜브 프리미엄/넷플릭스/디즈니+/노트북 미러링) / HDMI 케이블 구비
                                               55인치 4K UHD TV (유튜브 프리미엄/넷플릭스/디즈니+/노트북 미러링) / HDMI 케이블 구비
                                               55인치 4K UHD TV (유튜브 프리미엄/넷플릭스/디즈니+/노트북 미러링) / HDMI 케이블 구비
                                               55인치 4K UHD TV (유튜브 프리미엄/넷플릭스/디즈니+/노트북 미러링) / HDMI 케이블 구비</p>
                  <p>He must have tried it a hundred times, shut his eyes so that he wouldn't have to look at the floundering legs, and only stopped when he began to feel a mild, dull pain there that he had never felt before.</p>
                  <h5>You will love</h5>
                </div>
                <div class="space__details__tab__content__item">
                  <h5>주의사항</h5>
                  <p>최소 3인, 최대 8인 이용이 가능합니다.(3인 미만은 3인 요금 결제)
                  최소 2시간 이상, 1시간 단위로 이용이 가능합니다.
                  예약은 선입금제로만 가능하며, 예약된 사용 시간 전에 퇴실하여도 잔여 시간은 환불이 불가합니다.</p>
                </div>
              </div>
            </div>
          
            <div class="tab-pane" id="tab-6" role="tabpanel">
             <div class="space__details__tab__content">
               <div class="space__details__tab__content__item">
                <div class="col-lg-6">
                <table class="table text-sm">
                  <tbody>
                    <tr>
                      <th class="font-weight-normal border-0">Product #</th>
                      <td class="text-muted border-0">Lorem ipsum dolor sit amet</td>
                    </tr>
                    <tr>
                      <th class="font-weight-normal ">Available packaging</th>
                      <td class="text-muted ">LOLDuis aute irure dolor in reprehenderit</td>
                    </tr>
                    <tr>
                      <th class="font-weight-normal ">Weight</th>
                      <td class="text-muted ">dolor sit amet</td>
                    </tr>
                    <tr>
                      <th class="font-weight-normal ">Sunt in culpa qui</th>
                      <td class="text-muted ">Lorem ipsum dolor sit amet</td>
                    </tr>
                  </tbody>
                </table>
              </div>
                <div class="col-lg-6">
                <table class="table text-sm">
                  <tbody>
                    <tr>
                      <th class="font-weight-normal border-0">Weight</th>
                      <td class="text-muted border-0">dolor sit amet                           </td>
                    </tr>
                    <tr>
                      <th class="font-weight-normal ">Sunt in culpa qui</th>
                      <td class="text-muted ">Lorem ipsum dolor sit amet                           </td>
                    </tr>
                    <tr>
                      <th class="font-weight-normal ">Product #</th>
                      <td class="text-muted ">Lorem ipsum dolor sit amet                           </td>
                    </tr>
                    <tr>
                      <th class="font-weight-normal ">Available packaging</th>
                      <td class="text-muted ">LOLDuis aute irure dolor in reprehenderit                           </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              </div>
             </div>
            </div>
             
            <div class="tab-pane" id="tab-7" role="tabpanel">
            </div>
            
           </div>
            
            
          </div> <!--  product_detail_tab -->
        </div> <!--  col-lg-12 -->
        </div> <!-- row -->
       </div>  <!--  container -->
      </div> <!-- product_detail_content -->
      
      
    </section>
    <!-- Shop Details Section End -->
    <div style="height:200px"></div>
</body>
</html>