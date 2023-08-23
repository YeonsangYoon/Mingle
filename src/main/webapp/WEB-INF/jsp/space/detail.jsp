<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="space__details__pic__item">
                                    <img :src="space_detail.poster" alt="">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="space__details__pic__item">
                                    <img :src="images[0]" alt="">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="space__details__pic__item">
                                    <img :src="images[1]" alt="">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <div class="space__details__pic__item">
                                    <img :src="images[2]" alt="">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-5" role="tabpanel">
                                <div class="space__details__pic__item">
                                    <img :src="images[3]" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="col-lg-3 col-md-3">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                   <img :src="space_detail.poster" class="space__thumb__pic">
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                   <img :src="images[0]" class="space__thumb__pic">
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                   <img :src="images[1]" class="space__thumb__pic">
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">
                                   <img :src="images[2]" class="space__thumb__pic">
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-5" role="tab">
                                   <img :src="images[3]" class="space__thumb__pic">
                                </a>
                            </li>
                        </ul>
                    </div></div>
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
                    <div class="col-lg-12">
                        <div class="space__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-6" role="tab" aria-select=>공간소개
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">위치정보
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
                                            <pre v-for="a in fcst_guides">{{a}}</pre>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-7" role="tabpanel">
                                    <div class="space__details__tab__content">
                                        <div class="space__details__tab__content__item">
                                            <h5>다음 지도 API</h5>
										    <section class="detailinfo_button pt-0" style="display: block;">  
												      <div class="dc-flex justify-content-between">
												        <button class="btn btn-outline-grey-4 w-50 mr-1" data-bt="0647492139">
													  <div class="dc-flex justify-content-center align-items-center"><i class=fa-fa-phone></i>
													     <div class="text-16 color-grey-4 ml-1">전화걸기</div>
													  </div>
													  </button><button class="btn btn-outline-grey-4 w-50 text-16 color-grey-4 ml-1" data-bi="IN80">길찾기</button></div>
										    </section>                                            

                                        </div>
                                        <div class="space__details__tab__content__item" >
                                            <pre v-for="a in fcst_guides">{{a}}</pre>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-8" role="tabpanel">
                                    <div class="space__details__tab__content">
                                        <div class="space__details__tab__content__item">
                                            <h5>이용자 이름</h5>
                                            <pre>후기후기후기</pre>
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
	 el:'#spaceVueData',
	 data:{
		 space_detail:{},
		 images:[],
		 space_id:${param.space_id},
		 fcst_guides:[]
	 },
	 mounted:function(){
		 axios.get("/mingle/space/detail_vue.do",{
			 params:{
				 space_id:this.space_id
			 }
		 }).then(res=>{
			 console.log(res.data)
			 this.space_detail=res.data.space_detail
			 this.images=res.data.images
	         this.fcst_guides = JSON.parse(res.data.space_detail.fcst_guides)
	         console.log(this.fcst_guides)
		 }).catch(error=>{
			 console.log(error.res)
		 })
	 }
 })
</script>
</body>
</html>

