<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
<style>
  
</style>
</head>
<body>

<section class="contact spad">
    <div class="container mento-contact">
        <div class="row text-center">
            <div class="col-lg-6 col-md-6">
                <div class="mento-question">
                    <div class="">
                        <span>Mentoring</span>
                        <h2 style="margin-bottom: 15px;">멘토에게 질문하기</h2>
                        <p><span
                                style=" font-size:20px; color: orange; font-weight: 800">${sessionScope.nickname}</span>님
                            고민이 있나요?<br>
                            고민에 대한 해답을 진짜 현직자에게 받아보세요.!</p>
                    </div>
                    <div style="margin-top: 40px;">
                        <div>
                            <h4>1. 질문을 구체적으로 작성해 주세요.</h4>
                            <textarea rows="15" cols="43" v-model="content" ref="content" name="content"
                            placeholder="예시) 영업 직무 취업을 목표로 3개월 계획을 세웠는데 방향성이 맞는지 모르겠어요"></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 col-md-6 text-left">
                <div class="text-center mento-question">
	                <span>Reservation</span>
	                <h2>희망 날짜를 선택해 주세요!</h2>
                </div>
                <h4 class="text-center" style="padding-top: 10px;">예약 날짜와 시간을 선택하세요!</h4>
                <div id="cal-area">
                    <table class="Calendar">
                        <thead>
                        <tr>
                            <td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
                            <td colspan="5"><span id="calYear"></span>년 &nbsp; <span
                                    id="calMonth"></span>월
                            </td>
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
                        <tbody ref="date">
                        </tbody>
                    </table>
                    <div id="Mreserve-time" >
                        <div>
                            <span> 시작시간 </span>
                            <select v-model="str_time">
                                <option value=9>9시</option>
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
                            <select v-model="end_time" ref="end_time">
                                <option v-for="num in range(str_time, 24)" :value="num">{{num}}시</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="contact__form text-center" style="margin-top: 30px">
                    <div class="col-lg-12">
                        <button class="Msite-btn" @click="sendData()">신청하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    new Vue({
        el: '.mento-contact',
        data: {
            mento_no: ${mento_no},
            user_id: '${sessionScope.id}',
            content: '',
            str_time: '9',
            end_time: ''
        },
        mounted: function () {
        },
        methods: {
            sendData: function () {
                const syear = document.querySelector('#calYear').innerText;
                const smonth = document.querySelector('#calMonth').innerText;
                const sdateElement = document.querySelector('.choiceDay');
                
                // 유효성 검사
                if (!sdateElement) {
                    alert('멘토링 날짜를 선택해주세요.');
                    return;
                }
                const sdate = sdateElement.innerText;
                let date = syear + '-' + smonth + '-' + sdate;
                
                if (!this.end_time) {
                    alert('종료 시간을 선택해주세요.');
                    return;
                }
                
                

                axios.post('../mento/contact_ok.do', null, {
                    params: {
                        mento_no: this.mento_no,
                        content: this.content,
                        str_time: this.str_time,
                        end_time: this.end_time,
                        hope_date: date
                    }
                }).then(response => {
                    if (response.data === 'NOID') {
                        alert('로그인이 필요한 서비스입니다.')
                    } else {
                    	alert("신청되었습니다!")
                        location.href = "/mingle/mento/mento_list.do"
                    }
                })
            },
            range: function (start, end) {
                const arr = [];
                arr.push('선택해주세요');
                for (let num = start; num <= end; num++) {
                    arr.push(num);
                }
                return arr;
            }
        }
    })
</script>

</body>
</html>