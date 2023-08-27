<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="contact spad">
        <div class="container mento-contact">
        <form action="#">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="">
                        <div class="">
                            <span>Mentoring</span>
                            <h2>멘토에게 질문하기</h2>
                            <p><span style=" font-size:18px; color: orange; font-weight: 800">${sessionScope.nickname}</span>님 고민이 있나요?<br>
								커리어, 직무 고민에 대한 해답을 진짜 현직자에게 받아보세요.</p>
                        </div>
                        <div style="margin-top: 40px;">
                            <div>
                                <h4>1. 질문을 구체적으로 작성해 주세요.</h4>
                                <div>예시) 영업 직무 취업을 목표로 3개월 계획을 세웠는데<br> 방향성이 맞는지 모르겠어요</div>
                                <textarea rows="15" cols="50" v-model="content" ref="content" name="content" ></textarea>
                            </div>
                        </div>
                    </div>
                </div>

				<div class="col-lg-6 col-md-6">
					<span>Reservation</span>
					<h2>희망 날짜를 선택해 주세요!</h2>
					<h4 class="text-center" style="padding-top: 10px;">예약 날짜와 시간을 선택하세요!</h4>
					<div id="cal-area" >
						<table class="Calendar MCalendar">
							<thead>
								<tr>
									<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
									<td colspan="5"><span id="calYear"></span>년 &nbsp; <span
										id="calMonth"></span>월</td>
									<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
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
					<div class="" id="reserve-time">
						<div>
							<span> 시작시간 </span>
							<select id="startTime" v-model="str_time">
								<option>시간선택</option>
								<option selected value=9>9시</option>
								<option value=10>10시</option>
								<option value=11>11시</option>
								<option value=12>12시</option>
								<option value=13>13시</option>
								<option value=14>14시</option>
								<option value=15>15시</option>
								<option value=16>16시</option>
								<option value=17>17시</option>
								<option value=18>18시</option>
								<option value=19>19시</option>
								<option value=20>20시</option>
								<option value=21>21시</option>
								<option value=22>22시</option>
								<option value=23>23시</option>
								<option value=24>24시</option>
							</select> &nbsp;
						</div>
						<div>
							<span> 종료시간  </span>
							<select ref="endTime" v-model="end_time">
								<option>시간선택</option>
								<option selected value=9>9시</option>
								<option value=10>10시</option>
								<option value=11>11시</option>
								<option value=12>12시</option>
								<option value=13>13시</option>
								<option value=14>14시</option>
								<option value=15>15시</option>
								<option value=16>16시</option>
								<option value=17>17시</option>
								<option value=18>18시</option>
								<option value=19>19시</option>
								<option value=20>20시</option>
								<option value=21>21시</option>
								<option value=22>22시</option>
								<option value=23>23시</option>
								<option value=24>24시</option>
							</select>
						</div> 
					</div>
					 <div>
			            <span> 선택한 날짜: </span>{{ selectedDate }}
			        </div>
				</div>

					<div class="contact__form" >
					<div class="col-lg-12">
						<button class="site-btn" >신청하기</button>
					</div>
				</div>
            </div>
			</form>			
        </div>
    </section>
    
    <script type="text/javascript">
    new Vue({
    	el:'.mento-contact',
    	data:{
    		mento_no:'',
    		user_id:'${sessionScope.id}',
    		content:'',
    		str_time:'',
    		end_time:'',
    		selectedYear: 0,
            selectedMonth: 0,
            selectedDate: 0,
    		
    	},
    	mounted:function(){
    		const urlParams = new URLSearchParams(window.location.search);
            this.mento_no = urlParams.get('mentono');
    	},
    	methods:{
    		sendData:function(){
    			const syear = document.querySelector('#calYear');
                const smonth = document.querySelector('#calMonth');
                const sdate = document.querySelector('.choiceDay');
                this.selectedYear = syear.innerText;
                this.selectedMonth = smonth.innerText;
                this.selectedDate = sdate.innerText;
    			
    			axios.post('../mento/contact_ok.do',null,{
     			   params:{
     				   	user_id:this.user_id,
     				   	mento_no:this.mento_no,
     				   	content:this.content,
     				   	startTime:this.startTime,
     				    endTime:this.endTime,
     				    year : this.selectedYear,
                        month : this.selectedMonth,
                        date : this.selectedDate
     			   }
     		   }).then(response => {
     			   console.log(response.data)
     			   location.href="../mento/mento_list.do"
     		   })
    		}
    		
    	}
    })
    </script>

</body>
</html>