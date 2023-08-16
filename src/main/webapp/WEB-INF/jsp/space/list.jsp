<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>

  <!-- Breadcrumb Section Begin -->
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
    <!-- Breadcrumb Section End -->
    
    <section class="wrapper-keyword slpad">
    <h2 class="text-center">어떤 공간을 찾고 있나요?</h2>
    <div class="container">
      <div class="row">
	     <div class="text-center">
		   <button class="btn btn-sm">
		     <img src="../img/spaceIcon/study.svg">
		     <div>스터디룸</div>
		   </button>
		   <button class="btn btn-sm">
		     <img src="../img/spaceIcon/meeting.svg">
		     <div>회의실</div>
		   </button>
		   <button class="btn btn-sm">
		     <img src="../img/spaceIcon/cafe.svg">
		     <div>카페</div>
		   </button>
		   <button class="btn btn-sm">
		     <img src="../img/spaceIcon/seminar.svg" >
		     <div>세미나실</div>
		   </button>
		   <button class="btn btn-sm">
		     <img src="../img/spaceIcon/conference.svg">
		     <div>컨퍼런스</div>
		   </button>
		   <button class="btn btn-sm">
		     <img src="../img/spaceIcon/lecture.svg">
		     <div>강의실</div>
		   </button>
		   <button class="btn btn-sm">
		     <img src="../img/spaceIcon/private_office.svg">
		     <div>독립오피스</div>
		   </button>
		   <button class="btn btn-sm">
		     <img src="../img/spaceIcon/coworking_office.svg">
		     <div>코워킹오피스</div>
		   </button>
      </div>
    </div> 
   </div>
  </section>
    
        <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container container-area">
            <div class="row">
                    <div class="shop__space__option">
                        <div class="row">
                        
                               <div class="shop__space__option__left" style="display:-webkit-inline-box">
                                    <div class="nice-select" tabindex="0">
		                               <span class="current">&nbsp;지역&nbsp; </span>
		                                 <ul class="list">
		                                    <li data-value="" class="option selected">최신순</li>
		                                    <li data-value="" class="option">인기순</li>
		                                 </ul>
		                            </div>
                                    <div class="nice-select" tabindex="0">
		                               <span class="current"> &nbsp;카테고리&nbsp; </span>
		                                 <ul class="list">
		                                    <li data-value="" class="option selected">최신순</li>
		                                    <li data-value="" class="option">인기순</li>
		                                 </ul>
		                            </div>
                                    <div class="nice-select" tabindex="0">
		                               <span class="current"> &nbsp;날짜&nbsp; </span>
		                                  <ul class="list">
		                                   <p><input type="date"></p>
		                                  </ul>
		                            </div>
		                            
                                </div>
                            
                                <div class="shop__space__option__right">
                                   <div class="space__sidebar__search">
			                            <form action="#">
			                                <input type="text" placeholder="검색어를 입력하세요.">
			                                <button type="submit"><span class="icon_search"></span></button>
			                            </form>
			                       </div>
                                </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6" v-for="vo in space_list">
                            <div class="space__item" >
                            
                                <div class="space__item__pic set-bg" data-setbg="/mingle/img/product/product-2.jpg">
                                    <ul class="space__hover">
                                        <li><a href="../space/addtoZzim.do"><img src="${pageContext.request.contextPath}/img/icon/heart.png" alt=""></a></li>
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
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="space__pagination">
                                <a class="active" href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <span>...</span>
                                <a href="#">21</a>
                            </div>
                        </div>
                    </div>
        </div>
    </section>
    <!-- Shop Section End -->
 <script>
  new Vue({
	  el:'.container-area',
	  data:{
		  space_list:[]
	  },
	  filters:{
          currency: function(value){
              let num = new Number(value);
              return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
          }
      },
	  mounted:function(){
		  axios.get("http://localhost/mingle/space/list_vue.do")
		  .then(res=>{
			  console.log(res.data)
			  this.space_list=res.data
/* 			  this.curpage=res.data.curpage;
			  this.totalpage=res.data;
			  this.startPage=res.data;
			  this.endPage=res.data; */
		  })
	  }
  })
 </script>
</body>
</html>