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
                        <h4>스터디 글 작성</h4>
                        <div class="breadcrumb__links">
                            <a href="#">스터디 모집</a>
                            <span>스터디 글 작성</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<!-- 프로그램 정보 기입란 -->
	<section class="shop spad">
	<div class="container" id="insert-all">
	
	 <div class="insertpage">
 	  <form method="post" action="insert_ok.do">
	 	<div class="row">
	 		<div class="col-sm-6">
	 			<table class="table">
	 			  <tr>
	 				<th width="20%">진행방식</th>
	 				<td width="80%">
						 <div class="select-dropdown">
						    <select name="onoff">
						      <option value="전체">전체</option>
						      <option value="온라인">온라인</option>
						      <option value="오프라인">오프라인</option>
						      <option value="온/오프라인 병행">온/오프라인 병행</option>
						    </select>
						 </div>
	 				</td>
	 			  </tr>
	 			  <tr>
	 				<th width="20%">모집마감일</th>
	 				<td width="80%">
							<input type="date" name="deadline">
	 				</td>
	 			  </tr>
	 			  <tr>
	 				<th width="20%">진행기간</th>
	 				<td width="80%">
						 <div class="select-dropdown">
						    <select name="period">
						      <option value="전체">전체</option>
						      <option value="기간미정">기간미정</option>
						      <option value="1달">1</option>
						      <option value="2달">2</option>
						      <option value="3달">3</option>
						      <option value="4달">4</option>
						      <option value="5달">5</option>
						      <option value="장기">장기(6개월 이상)</option>
						      
						    </select>
						 </div>
	 				</td>
	 			  </tr>
	 			</table>
	 		</div>
	 		<div class="col-sm-6">
	 			<table class="table">
	 			  <tr>
	 				<th width="20%">모집인원</th>
	 				<td width="80%">
						 <div class="select-dropdown">
						    <select name="recruit">
						      <option>전체</option>
						      <option value="0">인원미정</option>
						      <option value="1">1</option>
						      <option value="2">2</option>
						      <option value="3">3</option>
						      <option value="4">4</option>
						      <option value="5">5</option>
						      <option value="6">6</option>
						      <option value="7">7</option>
						      <option value="8">8</option>
						      <option value="9">9</option>
						      <option value="10">10명 이상</option>
						    </select>
						 </div>
	 				</td>
	 			  </tr>
	 			  <tr>
	 				<th width="20%">기술스택</th>
	 				<td width="80%">
						 <div class="aa">
						    <select>
						    	<!-- 달력 -->
						    </select>
						 </div>
	 				</td>
	 			  </tr>
	 			  <tr>
	 				<th width="20%">연락방법</th>
	 				<td width="80%">
						 <div class="select-dropdown">
						    <select name="contact_type">
						      <option value="전체">전체</option>
						      <option value="카카오 오픈채팅">카카오 오픈채팅</option>
						      <option value="구글폼">구글폼</option>
						      <option value="이메일">이메일</option>
						    </select>
						 </div>
	 				</td>
	 			  <tr>
	 			  	<th width="20%">연락주소</th>
	 				<td width="80%">
						 <input type="text" name="contact_link" size="40" class="input-sm">
						 <input type="hidden" name="user_id" value="${sessionScope.id}"> 
	 				</td>
	 			  </tr>
	 			  </tr>
	 			</table>
	 		</div>
	 		<div class="col-sm-12">
	 		<table class="table">
	 			<tr>
					<th width="20%">제목</th>
			        <td width=80%>
			        	<input type=text name=title size=90 class="input-sm">
			        </td>	 			
	 			</tr>
	 			<tr>
					<th width="20%">내용</th>
			        <td width=80%>
           				<textarea rows="10" cols="94" name="content"></textarea>
			        </td>
	 			</tr>
	 			<tr>
		          <td colspan="2" class="text-center">
		           <input type=submit value="글쓰기" class="btn btn-sm btn-primary">
		           <input type=button value="취소" class="btn btn-sm btn-danger"
		            onclick="javascript:history.back()">
		          </td>
	 			</tr>
	 		</table>
	 		</div>
		 </div>
    	</form>
	 </div>
	</div>
	</section>
</body>
</html>