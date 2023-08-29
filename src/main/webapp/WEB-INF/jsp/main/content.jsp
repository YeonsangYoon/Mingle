<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- Hero Section Begin -->
<section class="hero">
    <div class="hero__slider owl-carousel mt-20">
        <div class="container">
            <div class="hero__items set-bg" data-setbg="${pageContext.request.contextPath}/img/home/study-space.png">
                <div class="row">
                    <div class="col-xl-5 offset-xl-1 col-lg-7 col-md-8">
                        <div class="hero__text">
                            <h6>Study Space</h6>
                            <h2>스터디 공간 대여</h2>
                            <p>스터디룸 뿐만 아니라 다양한 공간을 확인해보세요.</p>
                            <a href="${pageContext.request.contextPath}/space/main.do" class="primary-btn">공간대여
                                바로가기<span class="arrow_right"></span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="hero__items set-bg set-bg-left"
                 data-setbg="${pageContext.request.contextPath}/img/home/mentoring.png">
                <div class="row">
                    <div class="col-xl-5 offset-xl-7 col-lg-7 col-md-8">
                        <div class="hero__text">
                            <h6>Mentoring</h6>
                            <h2>멘토링</h2>
                            <p>차별화된 멘토링 시스템을 직접 경험해보세요.</p>
                            <a href="${pageContext.request.contextPath}/mento/mento_list.do" class="primary-btn">멘토링
                                바로가기<span class="arrow_right"></span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="hero__items set-bg"
                 data-setbg="${pageContext.request.contextPath}/img/home/study-gathering.png">
                <div class="row">
                    <div class="col-xl-5 offset-xl-1 col-lg-7 col-md-8">
                        <div class="hero__text">
                            <h6>Recruit</h6>
                            <h2>스터디 모집</h2>
                            <p>세분화된 스터디 모집으로 다양한 기회를 잡아보세요.</p>
                            <a href="${pageContext.request.contextPath}/study/list.do" class="primary-btn">스터디 모집
                                바로가기<span class="arrow_right"></span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->
<div class="container mt-5">
    <ul class="Category_categories__F4wF5">
        <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">
            <img src="${pageContext.request.contextPath}/img/fire.png" alt="fire" style="width: 40px;">마감 임박 스터디!!
        </li>
    </ul>
    <div class="row">
        <ul class="studyList_studyList__3xoys">
            <c:forEach items="${sList}" var="vo" varStatus="i">
                <a class="studyItem_studyItem__1Iipn"
                   href="${pageContext.request.contextPath}/study/detail.do?study_id=${vo.study_id}"
                   style="width: 254px;">
                    <li>
                        <span class="deadline-bage">마감 ${dayDiff[i.index]}일전</span>
                        <img class="studyItem_bookmark__2YtKX"
                             src="${pageContext.request.contextPath}/img/bookmark-off.png"
                             alt="bookmark">
                        <div class="studyItem_schedule__3oAnA">
                            <p class="studyItem_scheduleTitle__1KN_9">마감일 |</p>
                            <p>${vo.deadline}</p>
                        </div>
                        <h1 class="studyItem_title__2B_2o">${vo.title}</h1>
                        <ul class="studyItem_content__1mJ9M">
                            <c:forEach items="${vo.techs}" var="tech" varStatus="i">
                                <c:if test="${i.index < 5}">
                                    <li class="studyItem_language__20yqw">
                                        <img class="studyItem_languageImage__1AfGa" title="java"
                                             src="${pageContext.request.contextPath}/img/language/${tech}.svg"
                                             alt="language">
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <div class="study_info">
                            <span class="nickname">${vo.nickname}</span>
                            <span class="hit-comment">
                            <i class="fa fa-comments-o" aria-hidden="true"></i>
                            ${vo.reply_cnt}
                            <i class="fa fa-eye" aria-hidden="true"></i>
                            ${vo.hit}
                        </span>
                        </div>
                    </li>
                </a>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="container mt-5">
    <ul class="Category_categories__F4wF5">
        <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">
            <img src="${pageContext.request.contextPath}/img/fire.png" alt="fire" style="width: 40px;">이 시각 가장 핫한 멘토는?
        </li>
    </ul>
    <div class="row" style="padding: 0 20px;">
        <c:forEach items="${mList}" var="vo">
            <div class="col-sm-4">
                <div class="card open-mentoring-card " style="display: block;">
                    <div class="boxhover">
                        <div class="card-content card-content-padding">
                            <div class="open_mentoring_card__jobtype">${vo.job_cat}</div>
                            <div class="content-body" type="external">
                                <div class="mentee-question">${vo.job}</div>
                                <div class="oversize">${vo.title}</div>
                            </div>
                            <div>
                                <div style="display:flex">
                                    <span class="mento_list_info_detail_title">이름</span>
                                    <span class="mento_list_info_detail_content">${vo.user_name}</span>
                                </div>
                                <div style="display:flex">
                                    <span class="mento_list_info_detail_title">부서</span>
                                    <span class="mento_list_info_detail_content">${vo.dept}</span>
                                </div>
                                <div style="display:flex">
                                    <span class="mento_list_info_detail_title">경력</span>
                                    <span class="mento_list_info_detail_content oversize">${vo.career}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="card-footer text-center">
                            <div class="follow mento_list_info active" style="margin-right: 10px;">
                                팔로워 ${vo.follow}
                            </div>
                            <div class="star mento_list_info">
                                별점 ${vo.avg_star}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div class="container mt-5">
    <ul class="Category_categories__F4wF5">
        <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">
            <img src="${pageContext.request.contextPath}/img/fire.png" alt="fire" style="width: 40px;">방금 올라온 공간 후기!
        </li>
    </ul>
    <div class="row pl-4 pr-4">
        <c:forEach items="${rList}" var="vo">
			 <div class="col-sm-4">
			    <div class="card space-card" onclick="location.href='/mingle/space/detail.do?space_id=${vo.space_id}'">
			        <div class="boxhover">
			            <div style="border-radius: 10px;">
			                <img src="${vo.poster}" style="width:100%; height: 250px;">
			            </div>
			            <div class="spaceContent">
			                <div>
			                    <div class="spacetitle">${vo.title}</div>
			                    <div class="ft-14">
			                      <c:forEach begin="1" end="5" varStatus="loop">
								    <c:choose>
								        <c:when test="${loop.index <= vo.ratings}">
								            <i class="fa fa-star"></i>
								        </c:when>
								        <c:otherwise>
								            <i class="fa fa-star-o"></i>
								        </c:otherwise>
								    </c:choose>
								  </c:forEach>
			                      <div>
			                        ${vo.price }원/시간
			                      </div>
			                    </div>
			                </div>
			
			                <div>
			                    <p class="spacereview">${vo.content }
			                    </p>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
        </c:forEach>
    </div>
</div>
