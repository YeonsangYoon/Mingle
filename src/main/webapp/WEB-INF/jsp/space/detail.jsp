<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a1ffbe66e5a8ba9af15d82e0b41ceac"></script>

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
            <!-- <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="space__details__text">
                        <h4>Hooded thermal anorak</h4>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <span> - 5 Reviews</span>
                        </div>
                        <h3>$270.00 <span>70.00</span></h3>
                        <p>Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                            cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                        with placket.</p>
                        <div class="space__details__option">
                            <div class="space__details__option__size">
                                <span>Size:</span>
                                <label for="xxl">xxl
                                    <input type="radio" id="xxl">
                                </label>
                                <label class="active" for="xl">xl
                                    <input type="radio" id="xl">
                                </label>
                                <label for="l">l
                                    <input type="radio" id="l">
                                </label>
                                <label for="sm">s
                                    <input type="radio" id="sm">
                                </label>
                            </div>
                        </div>
                        <div class="space__details__cart__option">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                            <a href="../space/booking.do" class="primary-btn">바로 예약하기</a>
                        </div>
                        <div class="space__details__btns__option">
                            <a href="#"><i class="fa fa-heart"></i> add to wishlist</a>
                        </div>
                        <div class="space__details__last__option">
                            <h5><span>Guaranteed Safe Checkout</span></h5>
                            <ul>
                                <li><span>SKU:</span> 3812912</li>
                                <li><span>Categories:</span> Clothes</li>
                                <li><span>Tag:</span> Clothes, Skin, Body</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div> -->
            <div class="row">
                <div class="col-lg-9">
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
                                        <pre v-for="f,index in fcst_guides"><img src="/mingle/img/spaceIcon/checked.svg"> {{f}}</pre>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-7" role="tabpanel">
                                <div class="space__details__tab__content">
                                    <div class="space__details__tab__content__item">
                                        <h5>다음 지도 API</h5>
 										<div id="map" style="width:100%;height:350px;"></div>

                                        <section class="detailinfo_button pt-0" style="display: block;">
                                            <div class="dc-flex justify-content-between">
                                                <button class="btn btn-outline-grey-4 w-50 text-16 color-grey-4 ml-1">
                                                  전화걸기
                                                </button>
                                                <button class="btn btn-outline-grey-4 w-50 text-16 color-grey-4 ml-1">
                                                  길찾기
                                                </button>
                                            </div>
                                        </section>

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
                                        <h5>이용 후기 <span>{{cnt_rate}}</span>개 / 평균 평점 <span>{{avg_rate}}</span></h5>
                                    </div>
                                    <div class="space__details__tab__content__review" v-for="r in rList">
                                        <strong class="guest_name">{{r.nickname}} <span>{{r.ratings}}점</span></strong>
                                        <pre class="content">{{r.content}}</pre>
                                        <span class="regdate">{{r.dbday}}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
            rList:[],
            cnt_rate:'',
            avg_rate:''
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
                this.rList=res.data.rList
                this.cnt_rate=res.data.rList.length
                this.averageR()
                if (window.kakao && window.kakao.maps) {
			      setTimeout(() => { this.initMap() }, 1000)
			    }
			   else
				{
				   this.addScript();
				}
            }).catch(error => {
                console.log(error.res)
            })
        },
        methods:{
        	averageR:function(){
        		let sum = 0;
        		let avg = 0;
                for (let i = 0; i < this.cnt_rate; i++) {
                    sum += this.rList[i].ratings
                }
                avg = sum / this.cnt_rate;
                this.avg_rate = avg.toFixed(1);
                return avg;
        	},
        	initMap:function(){
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
 		   addScript:function(){
 			   const script=document.createElement("script")
 			   /* global kakao */
 			   script.onload=()=>kakao.maps.load(this.initMap)
 			   script.src='https://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=6a1ffbe66e5a8ba9af15d82e0b41ceac&libraries=services'
 			   document.head.appendChild(script)
 		   }
        }
    })
</script>
</body>
</html>