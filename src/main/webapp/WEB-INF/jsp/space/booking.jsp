<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="startTime" value="${book.start}" />
<c:set var="endTime" value="${book.end}" />
<c:set var="duration" value="${(endTime - startTime) + 1}" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a1ffbe66e5a8ba9af15d82e0b41ceac"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${vo.latitude}, ${vo.latitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${vo.latitude}, ${vo.latitude}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

</script>
    <body>
        <div class="pc-mobile-header-container">
            <div class="container p-0">
                <div class="row my-lg-5 reservation-row">
                    <div class="col-lg-7 cm-lg-rounded">
                            <section class="bk-detail-section">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12 mb-20 text-center">
                                            <img src=${vo.poster } class="bookPoster">
                                            <div class="ft-20 font-weight-bold color-grey-3 text-center">${vo.title}
                                            </div>
                                            <hr class="mb-2">
                                            <div class="dc-flex justify-content-center">
                                                <div class="booking-period-item text-center">
                                                    <div class="text-12 color-grey-5">체크인시간</div>
                                                    <div class="dc-flex justify-content-center text-16-b color-grey-3 font-weight-bold">${book.month}월 ${book.date }일 ${book.start }시</div>
                                                </div>
                                                <div class="booking-period-item text-center">
                                                    <div class="text-12 color-grey-5">체크아웃시간</div>
                                                    <div class="dc-flex justify-content-center text-16-b color-grey-3 font-weight-bold">${book.month}월 ${book.date }일 ${book.end }시</div>
                                                </div>
                                            </div>
                                            <hr class="mb-2">
                                        </div>
                                    	<div class="col-12 mb-20">
                                            <nav class="nav nav-classic nav-fill mb-20">
                                                <div class="nav-item text-left">
                                                    <div class="nav-link active">예약자 정보</div>
                                                    <span class="option">
                                                      <span class="txt_required">
                                                        <span class="ico_required">*</span>필수입력
                                                      </span>
                                                    </span>
                                                </div>
                                            </nav>
                                        <div class="requestform">
										    <div class="row">
										        <div class="col-sm-3">
										            <img src="/mingle/img/spaceIcon/checked.svg">
										            <p class="ml-1 text-14 color-grey-4 inblock">이름 *</p>
										        </div>
										        <div class="col-sm-8">
										            <input id="name" name="name" type="text" value="${mvo.user_name }">
										        </div>
										    </div>
										    <div class="row">
										        <div class="col-sm-3">
										            <img src="/mingle/img/spaceIcon/checked.svg">
										            <p class="ml-1 text-14 color-grey-4 inblock">전화번호 *</p>
										        </div>
										        <div class="col-sm-8">
										            <input id="phone" name="phone" type="text" value="${mvo.phone }" readonly>
										        </div>
										    </div>
										    <div class="row">
										        <div class="col-sm-3">
										            <img src="/mingle/img/spaceIcon/checked.svg">
										            <p class="ml-1 text-14 color-grey-4 inblock">이메일 *</p>
										        </div>
										        <div class="col-sm-8">
										            <input id="email" name="email" type="email" value="${mvo.email}">
										        </div>
										    </div>
										    <div class="row">
										        <div class="col-sm-3">
										            <img src="/mingle/img/spaceIcon/checked.svg">
										            <p class="ml-1 text-14 color-grey-4 inblock">사용목적</p>
										        </div>
										        <div class="col-sm-8">
										            <input id="purpose" name="purpose" type="text" placeholder="어떤 활동을 위해 해당 공간을 예약하시나요?">
										        </div>
										    </div>
										    <div class="row">
										        <div class="col-sm-3">
										            <img src="/mingle/img/spaceIcon/checked.svg">
										            <p class="ml-1 text-14 color-grey-4 inblock">요청사항</p>
										        </div>
										        <div class="col-sm-8">
										            <textarea id="bookrequest" name="bookrequest" placeholder="남기고 싶은 말을 적어주세요."></textarea>
										        </div>
										    </div>
										</div>
                                       </div>
                                       <div class="col-12">
                                         <nav class="nav nav-classic nav-fill">
                                           <div class="nav-item text-left">
                                             <div class="nav-link active">업체 정보</div>
                                           </div>
                                         </nav>  
                                         <div style="height:20px"></div>
                                         <div>
                                            <div class="map-wrap w-100" style="height: 164px;">
                                              <div id="map" style="width:100%;height:350px;"></div>
                                            </div>
                                        </div>
                                        <div class="text-14 font-weight-bold color-grey-3 mt-3">주소</div>
                                        <div class="dc-flex justify-content-between mt-2">
                                            <div class="text-14 color-grey-4 wordbreak-keepall pr-2">
                                                ${vo.address }
                                            </div>
                                        </div>
                                        <div class="text-14 font-weight-bold color-grey-3 mt-3">연락처</div>
                                        <div class="dc-flex justify-content-between mt-2">
                                            <div class="text-14 color-grey-4 wordbreak-keepall pr-2">
                                                ${vo.phone }
                                            </div>
                                            
                                        </div>
                                        <div class="text-14 font-weight-bold color-grey-3 mt-3">영업시간</div>
                                        <div class="dc-flex justify-content-between mt-2">
                                            <div class="text-14 color-grey-4 wordbreak-keepall pr-2">
                                                ${vo.starttime }:00 ~ ${vo.endtime }:00
                                            </div>
                                        </div>
                                       </div>
                                    </div>
                                </div>
                            </section>
                    </div>
                    <div class="col-lg-5 dc-lg-block">
                        <div
                            class="cm-rounded bg-shadow bg-white sticky mx-n15px mx-lg-0 sticky-pc-menu-top sticky-element-inner-scroll">
                            <section class="mt-3 p-3">
                                <div class="container">
                                    <div class="sectiontitle">
                                        <div class="mb-3 dc-flex align-items-center justify-content-between text-16">
                                            <span class="color-grey-2 font-weight-bold color-blue ft-20">결제 정보</span>
                                        </div>
                                    </div>
                                    <div class="pay-info-desc" style="display: flex;">
                                       <div class="dc-flex justify-content-between align-items-center">
                                           <div class="text-14 color-grey-3">예약날짜</div>
                                           <div class="text-14 text-right font-weight-bold">
                                               <span> ${book.year }년 ${book.month }월 ${book.date}일</span>
                                           </div>
                                       </div>
                                       <div class="dc-flex justify-content-between align-items-center">
                                           <div class="text-14 color-grey-3">예약시간</div>
                                           <div class="text-14 text-right font-weight-bold">
                                               <span> ${book.start }시 ~ ${book.end }시,  ${duration }시간</span>
                                           </div>
                                       </div>
                                       <div class="dc-flex justify-content-between align-items-center">
                                           <div class="text-14 color-grey-3">인원</div>
                                           <div class="text-14 text-right font-weight-bold">
                                               <span> 
                                                   ${book.person }명</span>
                                           </div>
                                       </div>
                                       <div class="dc-flex justify-content-between align-items-center">
                                           <div class="text-14 color-grey-3 font-weight-bold color-blue">합계</div>
                                           <div class="text-14 color-blue font-weight-bold">
                                             <fmt:formatNumber value="${book.total }"/>원</div>
                                       </div>
                                    </div>
                                    <button class="reserve-button" style="width: 100% !important;">
                                        <div class="text-18 font-weight-bold text-white">
                                            <span><a href="#">바로 결제하기</a></span>
                                        </div>
                                    </button>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
