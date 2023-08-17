<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

  <!-- 부제목 -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row" style="text-align: center;">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>스터디 목록</h4>
                        <div class="breadcrumb__links">
                            <a href="#">스터디 모집</a>
                            <span>스터디 홈</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="shop spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
            	
            <!-- 검색바 -->
			<table class="table">
				<tr>
				  <td class="text-right">
				  <form method="post" action="../board/find.do" class="inline">
				   Search:<input type="checkbox" name="fs" value="N">작성자
				     <input type="checkbox" name="fs" value="S">제목
				     <input type="checkbox" name="fs" value="C">내용
				     <input type=text name=ss size=15 class="input-sm">
				     <button class="btn btn-sm btn-danger">검색</button>
				  </form>
				  </td>
				</tr>
			</table>
            	
            	<!-- 기술분야 탭 -->
				<div class="css-goiz5j" id="headlessui-popover-panel-3" tabindex="-1" data-headlessui-state="open">
				    <ul class="Category_categories__F4wF5">
				        <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">기술스택</li>
				    </ul>
				    <ul class="LanguageBar_languages__243rH">
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/javascript.svg" alt="JavaScript"><span
				                class="LanguageBar_languageName__2dSeC">JavaScript</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/typescript.svg" alt="TypeScript"><span
				                class="LanguageBar_languageName__2dSeC">TypeScript</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/react.svg" alt="React"><span class="LanguageBar_languageName__2dSeC">React</span>
				        </li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/vue.svg" alt="Vue"><span class="LanguageBar_languageName__2dSeC">Vue</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/svelte.svg" alt="Svelte"><span
				                class="LanguageBar_languageName__2dSeC">Svelte</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/nextjs.svg" alt="Nextjs"><span
				                class="LanguageBar_languageName__2dSeC">Nextjs</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/nodejs.svg" alt="Nodejs"><span
				                class="LanguageBar_languageName__2dSeC">Nodejs</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/java.svg" alt="Java"><span class="LanguageBar_languageName__2dSeC">Java</span>
				        </li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/spring.svg" alt="Spring"><span
				                class="LanguageBar_languageName__2dSeC">Spring</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/go.svg" alt="Go"><span class="LanguageBar_languageName__2dSeC">Go</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/nestjs.svg" alt="Nestjs"><span
				                class="LanguageBar_languageName__2dSeC">Nestjs</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/kotlin.svg" alt="Kotlin"><span
				                class="LanguageBar_languageName__2dSeC">Kotlin</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/express.svg" alt="Express"><span
				                class="LanguageBar_languageName__2dSeC">Express</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/mysql.svg" alt="MySQL"><span class="LanguageBar_languageName__2dSeC">MySQL</span>
				        </li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/mongodb.svg" alt="MongoDB"><span
				                class="LanguageBar_languageName__2dSeC">MongoDB</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/python.svg" alt="Python"><span
				                class="LanguageBar_languageName__2dSeC">Python</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/django.svg" alt="Django"><span
				                class="LanguageBar_languageName__2dSeC">Django</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/php.svg" alt="php"><span class="LanguageBar_languageName__2dSeC">php</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/graphql.svg" alt="GraphQL"><span
				                class="LanguageBar_languageName__2dSeC">GraphQL</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/firebase.svg" alt="Firebase"><span
				                class="LanguageBar_languageName__2dSeC">Firebase</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/flutter.svg" alt="Flutter"><span
				                class="LanguageBar_languageName__2dSeC">Flutter</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/swift.svg" alt="Swift"><span class="LanguageBar_languageName__2dSeC">Swift</span>
				        </li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/reactnative.svg" alt="ReactNative"><span
				                class="LanguageBar_languageName__2dSeC">ReactNative</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/unity.svg" alt="Unity"><span class="LanguageBar_languageName__2dSeC">Unity</span>
				        </li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/aws.svg" alt="AWS"><span class="LanguageBar_languageName__2dSeC">AWS</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/kubernetes.svg" alt="Kubernetes"><span
				                class="LanguageBar_languageName__2dSeC">Kubernetes</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/docker.svg" alt="Docker"><span
				                class="LanguageBar_languageName__2dSeC">Docker</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/git.svg" alt="Git"><span class="LanguageBar_languageName__2dSeC">Git</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/figma.svg" alt="Figma"><span class="LanguageBar_languageName__2dSeC">Figma</span>
				        </li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/zeplin.svg" alt="Zeplin"><span
				                class="LanguageBar_languageName__2dSeC">Zeplin</span></li>
				        <li class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP"><img class="LanguageBar_logo__rGfFz"
				                src="../img/language/jest.svg" alt="Jest"><span class="LanguageBar_languageName__2dSeC">Jest</span>
				        </li>
				    </ul>
				    <div class="SelectedLanguage_selectedWrapper__3dpZm">
				        <ul class="SelectedLanguage_selectedLanguages__3r4F4"></ul>
				    </div>
				</div>
            	
            	<!-- 소제목 및 정렬순 -->
                <div class="shop__product__option">
				    <ul class="Category_categories__F4wF5">
				        <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">스터디 목록</li>
				    </ul>
                    <div class="row">
                        <div class="shop__product__option__right" style="text-align: right">
                            <div class="nice-select" tabindex="0">
                               <span class="current">정렬순서</span>
                                 <ul class="list">
                                    <li data-valueA="" class="option selected">최신순</li>
                                    <li data-value="" class="option">인기순</li>
                                 </ul>
                           </div>
                        </div>
                    </div>
                </div>
                
                <!-- 스터디 글 -->
<!--                 <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                       <div class="product__item__text">
                           <h6>Piqué Biker Jacket</h6>
                           <div class="rating">
                               <i class="fa fa-star-o"></i>
                           </div>
                           <h5>$67.24</h5>
                       </div>
                    </div>
                </div> -->
                
				<div class="container">
				<ul class="studyList_studyList__3xoys">
				<a class="studyItem_studyItem__1Iipn studyItem_open__1PGn-" href="/study/64d3de39ab30a5001306ca54">
			        <li>
			            <div class="studyItem_badgeWrapper__3AW7k">
			                <div class="badge_badge__ZfNyB">
			                    <div class="badge_new__DZ5tY">new</div>
			                </div>
			            </div>
			            
			            <div class="studyItem_schedule__3oAnA">
			                <p class="studyItem_scheduleTitle__1KN_9">마감일 |</p>
			                <p>2023.08.24</p>
			            </div>
			            
			            <h1 class="studyItem_title__2B_2o">제목</h1>
			            
			            <ul class="studyItem_content__1mJ9M">
			                <li class="studyItem_language__20yqw">
			                  <img class="studyItem_languageImage__1AfGa" title="java" src="../img/language/figma.svg" alt="language">
			                </li>
			            </ul>
			            
			            <div class="studyItem_border__2zAjs"></div>
			            
			            <section class="studyItem_info__OFIQU">
			            
			                <div class="studyItem_userInfo__1KkGa">
			                    <div class="avatar_user__1Pgut"><img class="avatar_userImg__hogPI" width="30px" height="30px"
			                            src="https://hola-post-image.s3.ap-northeast-2.amazonaws.com/default.PNG" alt="avatar">
			                    </div>
			                    <div>작성자</div>
			                </div>
			                
			                <div class="studyItem_viewsAndComment__1Bxpj">
			                
			                    <div class="studyItem_infoItem__3vxSf"><svg stroke="currentColor" fill="currentColor"
			                            stroke-width="0" viewBox="0 0 1024 1024" color="#999999" height="24" width="24"
			                            xmlns="http://www.w3.org/2000/svg" style="color: rgb(153, 153, 153);">
			                        </svg>
			                        <p>조회수</p>
			                    </div>
			                    
			                    <div class="studyItem_infoItem__3vxSf">
			                    	<svg stroke="currentColor" fill="currentColor"
			                            stroke-width="0" viewBox="0 0 512 512" color="#999999" height="18" width="18"
			                            xmlns="http://www.w3.org/2000/svg" style="color: rgb(153, 153, 153);">
			                        </svg>
			                        <p>댓글수</p>
			                    </div>
			                    
			                </div>
			            </section>
			            <img class="studyItem_bookmark__2YtKX" src="../img/language/pen-to-square-regular.svg" alt="bookmark">
			        </li>
			    </a>
			    
			    <a class="studyItem_studyItem__1Iipn studyItem_open__1PGn-" href="/study/64d3de39ab30a5001306ca54">
			        <li>
			            
			            <div class="studyItem_schedule__3oAnA">
			                <p class="studyItem_scheduleTitle__1KN_9">마감일 |</p>
			                <p>2023.08.24</p>
			            </div>
			            
			            <h1 class="studyItem_title__2B_2o">[백엔드] 패션정보 공유 커뮤니티 "폴더" 글로벌 패션 커뮤니티 함께 만드실분!</h1>
			            
			            <ul class="studyItem_content__1mJ9M">
			                <li class="studyItem_language__20yqw">
			                  <img class="studyItem_languageImage__1AfGa" title="java" src="../img/language/figma.svg" alt="language">
			                </li>
			            </ul>
			            
			            <div class="studyItem_border__2zAjs"></div>
			            
			            <section class="studyItem_info__OFIQU">
			            
			                <div class="studyItem_userInfo__1KkGa">
			                    <div class="avatar_user__1Pgut"><img class="avatar_userImg__hogPI" width="30px" height="30px"
			                            src="https://hola-post-image.s3.ap-northeast-2.amazonaws.com/default.PNG" alt="avatar">
			                    </div>
			                    <div>워어닝</div>
			                </div>
			                
			                <div class="studyItem_viewsAndComment__1Bxpj">
			                
			                    <div class="studyItem_infoItem__3vxSf"><svg stroke="currentColor" fill="currentColor"
			                            stroke-width="0" viewBox="0 0 1024 1024" color="#999999" height="24" width="24"
			                            xmlns="http://www.w3.org/2000/svg" style="color: rgb(153, 153, 153);">
			                        </svg>
			                        <p>49</p>
			                    </div>
			                    
			                    <div class="studyItem_infoItem__3vxSf">
			                    	<svg stroke="currentColor" fill="currentColor"
			                            stroke-width="0" viewBox="0 0 512 512" color="#999999" height="18" width="18"
			                            xmlns="http://www.w3.org/2000/svg" style="color: rgb(153, 153, 153);">
			                        </svg>
			                        <p>0</p>
			                    </div>
			                    
			                </div>
			            </section>
			            <img class="studyItem_bookmark__2YtKX" src="../img/language/pen-to-square-regular.svg" alt="bookmark">
			        </li>
			    </a>
				</ul>
				</div>                
                
                <!-- 페이징 -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__pagination">
                            <a class="active" href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <span>...</span>
                            <a href="#">21</a>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
	</section>

</body>
</html>