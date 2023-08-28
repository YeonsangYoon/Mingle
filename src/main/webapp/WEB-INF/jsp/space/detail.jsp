<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a1ffbe66e5a8ba9af15d82e0b41ceac"></script>
    <style type="text/css">
        #map {
            width: 100%;
            height: 350px;
        }
    </style>
</head>
<body>

<!-- Shop Details Section Begin -->
<section class="shop-details" id="spaceVueData">
    <div class="space__details__pic">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="space__details__title">
                        <h2>{{space_detail.title}} <span>{{space_detail.subject}}</span></h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-9 col-md-9">
                    <div class="tab-content">
                        <div v-for="(image, index) in images" :key="index" class="tab-pane"
                             :class="{'active':(active_image==index)}" :id="'tabs-'+(index+1)" role="tabpanel">
                            <div class="space__details__pic__item">
                                <img :src="image" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3">
                    <ul class="nav nav-tabs" role="tablist">
                        <li v-for="(image, index) in images" :key="index" class="nav-item"
                            :class="{'active':(active_image==index)}">
                            <a class="nav-link" data-toggle="tab" :href="'#tabs-'+(index+1)" role="tab">
                                <img :src="image" class="space__thumb__pic">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="space__details__content">
        <div class="container">
            <div class="row">
                <div class="col-lg-11">
                    <div class="space__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-6" role="tab" aria-select=>공간소개
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">이용정보
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-8" role="tab">이용후기
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-6" role="tabpanel">
                                <div class="space__details__tab__content">
                                    <div class="space__details__tab__content__item">
                                        <h5>공간 설명</h5>
                                        <pre>{{space_detail.description}}</pre>
                                    </div>
                                    <div class="space__details__tab__content__item">
                                        <h5>시설 안내</h5>
                                        <pre v-for="f,index in fcst_guides"><img 
                                        src="/mingle/img/spaceIcon/checked.svg"> {{f}}</pre>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-7" role="tabpanel">
                                <div class="space__details__tab__content">
                                    <div class="space__details__tab__content__item">
                                        <h5>{{space_detail.title}}</h5>
                                        <p>주소: {{space_detail.address}}</p>
                                        <div id="map" style="width:100%;height:350px"></div>


                                    </div>
                                    <div class="space__details__tab__content__item">
                                        <h5>주의사항</h5>
                                        <pre v-for="c,index in cautions"><img src="/mingle/img/spaceIcon/checked.svg"> {{c}}</pre>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-8" role="tabpanel">
                                <div class="space__details__tab__content">
                                    <div class="space__details__tab__content__item">
                                        <h5 class="d-inline">이용 후기 <span>{{cnt_rate}}</span>개 / 평균 평점 <span>{{avg_rate}}</span></h5>
                                        <button class="btn_review" @click="modalReview">리뷰 쓰기</button>
                                    </div>
                                    <div class="space__details__tab__content__review" v-for="r in rList">
                                        <strong class="guest_name">{{r.nickname}}
                                            <span>
								            <i v-for="star in r.ratings" class="fa fa-star"></i><i
                                                    v-for="star in 5 - r.ratings" class="fa fa-star-o"></i>
								         </span>
                                        </strong>
                                        <pre class="content">{{r.content}}</pre>
                                        <span class="regdate">{{r.dbday}}</span>
                                    </div>
                                    <div class="space__details__tab__content__review" v-if="cnt_rate==0">
                                        <p>아직 리뷰가 없어요. 첫 리뷰의 주인공이 되어보세요!</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="height:20px"></div>
                    <div class="alignBtn">
                        <button @click="popCalendar" class="reserve-button">예약하기</button>
                        <button @click="javascript:history.back()" class="reserveReverse-button">뒤로 가기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="reviewform" class="modal modal-review">
     <form class="mb-3" name="myform" id="myform" method="post" action="/mingle/space/submitreview.do">
		<fieldset>
			<span class="text-bold">별점을 선택해주세요</span>
			<input type="radio" name="ratings" value="5" id="rate1"><label
				for="rate1">★</label>
			<input type="radio" name="ratings" value="4" id="rate2"><label
				for="rate2">★</label>
			<input type="radio" name="ratings" value="3" id="rate3"><label
				for="rate3">★</label>
			<input type="radio" name="ratings" value="2" id="rate4"><label
				for="rate4">★</label>
			<input type="radio" name="ratings" value="1" id="rate5"><label
				for="rate5">★</label>
			<input type="hidden" name="space_id" :value="space_id">
		</fieldset>
		<div class="mb-20">
		  <textarea class="col-auto form-control" type="text" name="content" id="reviewContents"
			 placeholder="여러분의 후기는 밍글의 소중한 자산입니다♡"></textarea>
		</div>
		<div class="text-center">
		  <button class="reserve-button" >후기 등록</button>
		</div>
	</form>	
    </div>
    <div id="bookinfo" class="modal modal-calendar">
        <div>
            <h4 class="text-left" style="padding: 30px 100px 0px">날짜 선택 <span class="selectedInfo" :class="{'d-none':selectedDate==0}">{{selectedYear}}년 {{selectedMonth}}월 {{selectedDate}}일 </span></h4>
            <div id="cal-area">
                <table class="Calendar" @click="selected_day">
                    <thead>
                    <tr>
                        <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                        <td colspan="5">
                            <span id="calYear"></span>년
                            <span id="calMonth"></span>월
                        </td>
                        <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
                    </tr>
                    <tr>
                        <td>일</td>
                        <td>월</td>
                        <td>화</td>
                        <td>수</td>
                        <td>목</td>
                        <td>금</td>
                        <td>토</td>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>

            <h4 class="text-left" :class="{'d-none':selectedDate==0}" style="padding: 10px 85px;;">
                 시간 선택 <span class="selectedInfo" :class="{'d-none':selectedTime.length<2}">{{selectedTime[0]}}시~{{selectedTime[1]+1}}시</span></h4>
                <div :class="{'d-none':selectedDate==0}" style="padding: 10px 80px;">
                    <div class="time_info_box"
                         :class="{'time-unable' : availableHours[index] == 0, 'time-select' : availableHours[index] == 1 }"
                         v-for="(h,index) in workingHours" @click="select_time(h)">{{h}}시
                    </div>
                </div>
			<h4 class="text-left" :class="{'d-none':selectedTime.length<2}" style="padding: 10px 85px;">
                 예약 인원 </h4>
			<div :class="{'d-none':selectedTime.length<2}">
			    <div class="text-center">
			        <div class="input-group" style="width: 200px !important; margin-left: 150px;">
			            <span class="input-group-btn">
			                <button class="btn btn-default" type="button" @click="decreaseQuantity">-</button>
			            </span>
			            <input type="number" class="form-control text-center" v-model="quantity" @change="updateTotalAmount">
			            <span class="input-group-btn">
			                <button class="btn btn-default" type="button" @click="increaseQuantity">+</button>
			            </span>
			        </div>
			    </div>
			</div>
			<div :class="{'d-none':selectedTime.length<2}">
			    <div class="text-center" style="margin-top:50px;">
			        <button class="reserve-button" @click="bookingNow">{{ totalAmount | currency }}원 바로 예약하기</button>
			    </div>
			</div>

        </div>
    </div>

</section>
<!-- Shop Details Section End -->

<!-- Related Section Begin -->
<section class="related spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="related-title">근처 다른 공간도 둘러보세요!</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                <div class="space__item">
                    <div class="space__item__pic set-bg" data-setbg="/mingle/img/product/product-2.jpg">
                        <ul class="space__hover">
                            <li><a href="#"><img src="/mingle/img/icon/heart.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="space__item__text">
                        <ul>
                            <li><a :href="'../space/detail.do?sno='+vo.space_id">{{vo.title}}</a></li>
                            <li>서초동</li>
                            <li>{{vo.price|currency}}원/시간</li>
                            <li>최대 {{vo.max_guest}}인</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Related Section End -->
<script>
    new Vue({
        el: '#spaceVueData',
        data: {
            space_detail: {},
            images: [],
            space_id:${param.space_id},
            fcst_guides: [],
            cautions: [],
            active_image: 0,
            rList: [],
            cnt_rate: '',
            avg_rate: 0,
            workingHours: [],
            selectedTime: [],
            availableHours: [],
            selectedYear: 0,
            selectedMonth: 0,
            selectedDate: 0,
            quantity: 1,
            totalAmount: 0
        },
        filters: {
            currency: function (value) {
                let num = new Number(value);
                return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
            }
        },
        mounted: function () {
            axios.get("/mingle/space/detail_vue.do", {
                params: {
                    space_id: this.space_id
                }
            }).then(res => {
                this.space_detail = res.data.space_detail
                this.images = res.data.images
                this.fcst_guides = JSON.parse(res.data.space_detail.fcst_guides)
                this.cautions = JSON.parse(res.data.space_detail.cautions)
                this.images.unshift(this.space_detail.poster)
                if (this.images.length > 5) {
                    this.images = this.images.slice(0, 5);
                }
                this.rList = res.data.rList
                this.cnt_rate = res.data.rList.length
                this.averageR()
                this.workingHour()
                this.quantity = this.space_detail.min_guest;
                if (window.kakao && window.kakao.maps) {
  			      setTimeout(() => { this.initMap() }, 1000)
                } else {
                    this.addScript();
                }
            }).catch(error => {
                console.log(error.res)
            })
        },
        methods: {
            averageR: function () {
                let sum = 0;
                let avg = 0;
                if (this.cnt_rate != 0) {
                    for (let i = 0; i < this.cnt_rate; i++) {
                        sum += this.rList[i].ratings
                    }
                    avg = sum / this.cnt_rate;
                    this.avg_rate = avg.toFixed(1);
                }
                return avg;
            },
            initMap: function () {
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                        center: new kakao.maps.LatLng(this.space_detail.latitude, this.space_detail.longitude), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };

                var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                // 마커가 표시될 위치입니다
                var markerPosition = new kakao.maps.LatLng(this.space_detail.latitude, this.space_detail.longitude);

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    position: markerPosition
                });

                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);

                // 마커가 드래그 가능하도록 설정합니다
                marker.setDraggable(true);
            },
            addScript: function () {
                const script = document.createElement("script")
                /* global kakao */
                script.onload = () => kakao.maps.load(this.initMap)
                script.src = 'https://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=6a1ffbe66e5a8ba9af15d82e0b41ceac&libraries=services'
                document.head.appendChild(script)
            },
            popCalendar: function () {
                $('#bookinfo').modal();
            },
            modalReview: function () {
                $('#reviewform').modal();
            },
            workingHour: function () {
                let start = this.space_detail.starttime;
                let end = this.space_detail.endtime;
                let arr = [];

                for (let i = start; i < end; i++) {
                    arr.push(i); // 배열에 값을 추가
                    this.availableHours.push(2);
                }
                this.workingHours = arr;
                return arr;
            },
            select_time: function (time) {
                if(this.availableHours[this.workingHours.indexOf(time)] === 0){
                    return;
                }

                let len = this.selectedTime.length;
                if (len === 0) {
                    this.selectedTime.push(time);
                    this.availableHours[this.workingHours.indexOf(time)] = 1;
                } else if (len === 1) {
                    let old = this.selectedTime[0];
                    if (this.selectedTime[0] > time) {
                        this.selectedTime.unshift(time);
                    } else {
                        this.selectedTime.push(time);
                    }
                    let start = this.workingHours.indexOf(this.selectedTime[0]);
                    let end = this.workingHours.indexOf(this.selectedTime[1]);

                    for(let i = start ; i <= end ;i++){
                        if(this.availableHours[i] === 0){
                            this.availableHours[this.workingHours.indexOf(old)] = 2;
                            this.selectedTime = [time];
                            this.availableHours[this.workingHours.indexOf(time)] = 1;
                            return;
                        }
                    }

                    for(let i = start ; i <= end ;i++){
                        this.availableHours[i] = 1;
                    }
                } else if (len === 2) {
                    this.selectedTime = [];
                    this.selectedTime.push(time);

                    for(let i=0;i<this.availableHours.length;i++){
                        if(this.availableHours[i] === 1){
                            this.availableHours[i] = 2;
                        }
                    }
                    this.availableHours[this.workingHours.indexOf(this.selectedTime[0])] = 1;
                }
                if(this.selectedTime.length === 2)
                {
	               this.totalAmount = this.space_detail.price * (this.selectedTime[1] - this.selectedTime[0]+1) * this.quantity;
	            } 
                else 
                {
	               this.totalAmount = 0;
	            }
            },
            selected_day: function () {
                let syear = document.querySelector('#calYear');
                let smonth = document.querySelector('#calMonth');
                let sdate = document.querySelector('.choiceDay');
                this.selectedYear = syear.innerText;
                this.selectedMonth = smonth.innerText;
                this.selectedDate = sdate.innerText;
                console.log(this.selectedYear)
                axios.get('/mingle/space/booking_data.do',{
                    params : {
                        space_id : this.space_id,
                        year : this.selectedYear,
                        month : this.selectedMonth,
                        date : this.selectedDate
                    }
                }).then(response => {
                    for(let i = 0; i < this.availableHours.length; i++){
                        Vue.set(this.availableHours, i, 2);
                    }

                    let bookings = response.data;
                    for(let i = 0 ; i < bookings.length ; i++){
                        let booking = bookings[i];
                        for(let j = booking.startsat ; j < booking.endsat ; j++){
                            Vue.set(this.availableHours, this.workingHours.indexOf(j), 0);
                        }
                    }
                })
            },
            decreaseQuantity: function () {
                if (this.quantity > this.space_detail.min_guest) {
                    this.quantity--;
                    this.updateTotalAmount();
                }
            },
            increaseQuantity: function () {
                if (this.quantity < this.space_detail.max_guest) {
                    this.quantity++;
                    this.updateTotalAmount();
                }
            },
            updateTotalAmount: function () {
                if (this.selectedTime.length === 2) {
                    const hoursCount = this.selectedTime[1] - this.selectedTime[0] + 1;
                    this.totalAmount = this.space_detail.price * hoursCount * (2*this.quantity - this.space_detail.min_guest);
                } else {
                    this.totalAmount = 0;
                }
            },
            bookingNow: function () {
            	window.location.href = '/mingle/space/booking.do?no='+this.space_id+'&year='+this.selectedYear
            			+'&month='+this.selectedMonth+'&date='+this.selectedDate+'&start='+this.selectedTime[0]+'&end='+this.selectedTime[1]
            	        +'&person='+this.quantity+'&amount='+this.totalAmount;
            }
        }
    })
</script>
</body>
</html>