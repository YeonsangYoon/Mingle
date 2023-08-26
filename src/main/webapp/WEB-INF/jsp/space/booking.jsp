<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script type="text/javascript" src="https://cdn.channel.io/plugin/ch-plugin-web.js" charset="UTF-8"></script>
        <script type="text/javascript"
            src="https://www.googletagmanager.com/gtag/js?id=G-H78GSC65VQ&amp;l=dataLayer&amp;cx=c"></script>
        <script type="text/javascript" src="https://www.google-analytics.com/analytics.js"></script>
        <script
            src="https://cr.acecounter.com/Web/AceCounter_AW.js?gc=BS4A43851178693&amp;py=0&amp;gd=gtc14&amp;gp=8080&amp;up=NaPm_Ncisy&amp;rd=1692288867714"></script>
        <script src="https://www.googletagmanager.com/gtm.js?id=GTM-NL2ZTQM"></script>
    </head>

    <body>
        <div class="pc-mobile-header-container">
            <div class="container p-0">
                <div class="row my-lg-5 reservation-row">
                    <div class="col-lg-7 cm-lg-rounded">
                            <section class="bk-detail-section">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12">
                                            <nav class="nav nav-classic nav-fill">
                                                <div class="nav-item text-center">
                                                    <div class="nav-link click-effect-press active">예약 정보</div>
                                                </div>
                                            </nav>
                                            <div style="height:20px"></div>
                                            <img src="/mingle/img/space_main.png">
                                            <div class="text-20 font-weight-bold color-grey-3 mb-0 text-center">{{업체명}}
                                            </div>
                                            <hr class="mb-2">
                                            <div class="dc-flex justify-content-center">
                                                <div class="booking-period-item text-center">
                                                    <div class="text-12 color-grey-5">체크인시간</div>
                                                    <div class="dc-flex justify-content-center text-16-b color-grey-3">8. 19 (토) 10:00</div>
                                                </div>
                                                <div class="booking-period-item text-center">
                                                    <div class="text-12 color-grey-5">체크아웃시간</div>
                                                    <div class="dc-flex justify-content-center text-16-b color-grey-3">8. 19 (토) 13:00</div>
                                                </div>
                                            </div>
                                            <hr class="mb-2">
                                        </div>
                                    	<div class="col-12">
                                            <nav class="nav nav-classic nav-fill">
                                                <div class="nav-item text-center">
                                                    <div class="nav-link click-effect-press active">예약정보</div>
                                                </div>
                                            </nav>
                                            <div style="height:20px"></div>
                                        <div class="text-20 font-weight-bold color-grey-3 py-3">렌트카 예약 전, 꼭 확인해주세요!
                                        </div>
                                        <div class="dc-flex align-items-start">
                                            <img src="/mingle/img/spaceIcon/checked.svg">
                                            <div class="ml-1 text-14 color-grey-4">제주도의 경우, 렌트카 업체 영업시간 외 대여/반납이 필요한 경우
                                                카모아 고객센터를 통한 상담 후 예약 진행해주세요.
                                            </div>
                                        </div>
                                        <div class="dc-flex align-items-start mt-2">
                                            <img src="/mingle/img/spaceIcon/checked.svg">
                                            <div class="ml-1 text-14 color-grey-4">외국인 대여, 낚시용품 지참, 애견동물 동반 가능 여부와 주행거리
                                                제한 규정은 업체별로 상이하므로 업체별 대여규정을 확인해주세요. 대여조건이 맞지 않을 경우 렌트카 이용이 불가합니다.
                                            </div>
                                        </div>
                                        <div class="dc-flex justify-content-between">
                                           <button
                                               class="btn btn-outline-grey-4 w-50 mr-1"
                                               data-bt="0647492139">
                                               <div class="dc-flex justify-content-center align-items-center"><img
                                                       src="/mingle/img/spaceIcon/phone.svg">
                                                   <div class="text-16 color-grey-4 ml-1">셔틀 문의하기</div>
                                               </div>
                                           </button><button
                                               class="btn btn-outline-grey-4 w-50 text-16 color-grey-4 ml-1"
                                               >셔틀 이용 방법</button>
                                         </div>
                                       </div>
                                       <div class="col-12">
                                         <nav class="nav nav-classic nav-fill">
                                           <div class="nav-item text-center">
                                             <div class="nav-link click-effect-press active">업체 정보</div>
                                           </div>
                                         </nav>  
                                         <div style="height:20px"></div>
                                         <div class="click-effect-press" id="sci_btn_open_branch_map">
                                            <div class="map-wrap w-100" style="height: 164px;">
                                                <div class="map-container"
                                                    id="sci_map_branch" style="display: block;"><img
                                                        class="object-fit center-crop w-100 h-100"
                                                        src="https://apis.openapi.sk.com/tmap/staticMap?version=1&amp;appKey=l7xx34e73ce4f8b44937b9d00814353b233a&amp;longitude=126.50206139188276&amp;latitude=33.51494245002263&amp;zoom=16&amp;markers=pin-m%40BLUE%28126.50206139188276%2C33.51494245002263%29viewSize%3A0.4">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-14 font-weight-bold color-grey-3 mt-3">주소</div>
                                        <div class="dc-flex justify-content-between mt-2">
                                            <div class="text-14 color-grey-4 wordbreak-keepall pr-2">
                                                제주특별자치도 제주시 용마서길 34 아리랑렌트카
                                            </div>
                                        </div>
                                        <div class="text-14 font-weight-bold color-grey-3 mt-3">연락처</div>
                                        <div class="dc-flex justify-content-between mt-2">
                                            <div class="text-14 color-grey-4 wordbreak-keepall pr-2">
                                                010-9987-4564
                                            </div>
                                            
                                        </div>
                                        <div class="text-14 font-weight-bold color-grey-3 mt-3">영업시간</div>
                                        <div class="dc-flex justify-content-between mt-2">
                                            <div class="text-14 color-grey-4 wordbreak-keepall pr-2">
                                                08:00~20:00
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
                                            <span class="color-grey-2 font-weight-bold">결제 정보</span>
                                        </div>
                                    </div>
                                    <div class="pay-info-desc" style="display: flex;">
                                        <div>
                                            <div class="dc-flex justify-content-between align-items-center">
                                                <div class="text-14 color-grey-3">예약</div>
                                                <div
                                                    class="flex-grow-1 click-effect-press text-right font-weight-bold">
                                                    <span class="color-blue-dark-light mr-2"> 12,000원/일 x 2시간 x
                                                        2명</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="dc-flex justify-content-between align-items-center">
                                                <div
                                                    class="text-14 color-blue font-weight-bold">
                                                    예상 결제액</div>
                                                <div
                                                    class="text-14 color-blue font-weight-bold">
                                                    37,830원</div>
                                            </div>
                                        </div>
                                    </div>
                                    <button
                                        class="btn-primary btn-block btn-lg btn-border-10 mt-3 click-effect-press">
                                        <div class="text-18 font-weight-bold text-white">
                                            <span><a href="../space/booking_test.do" style="text-decoration:none;">바로 결제하기</a></span>
                                        </div>
                                    </button>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="//t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
        <script src="https://www.gstatic.com/firebasejs/8.2.5/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/8.2.3/firebase-auth.js"></script>
        <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
        <script src="https://wcs.naver.net/wcslog.js"></script>
        <script charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    </body>

    </html>