<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 부제목 -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row" style="text-align: center;">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>스터디 상세보기</h4>
                    <div class="breadcrumb__links">
                        <a href="#">스터디 홈</a>
                        <span>스터디 상세보기</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 프로그램 정보 -->
<section class="shop spad">
    <div class="container" id="sdetail">
        <h2 style="margin-bottom: 30px;">${vo.title}</h2>
        <div class="row">
            <div class="col-sm-6">
                <table class="table">
                    <tr>
                        <th width="25%">진행방식</th>
                        <td width="75%">${vo.onoff}</td>
                    </tr>
                    <tr>
                        <th width="25%">시작예정일</th>
                        <td width="75%">${vo.deadline}</td>
                    </tr>
                    <tr>
                        <th width="25%">진행기간(개월)</th>
                        <td width="75%">${vo.period}</td>
                    </tr>
                    <tr>
                        <th>기술스택</th>
                        <td>
                            <ul class="studyItem_content__1mJ9M" style="margin: 0">
                                <c:forEach var="tech" items="${vo.techs}">
                                <li class="studyItem_language__20yqw">
                                    <img class="studyItem_languageImage__1AfGa" title="java" src="${pageContext.request.contextPath}/img/language/${tech}.svg" alt="language">
                                </li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-sm-6">
                <table class="table">
                    <tr>
                        <th width="25%">모집인원</th>
                        <td width="75%">${vo.recruit}명</td>
                    </tr>
                    <tr>
                        <th>등록일</th>
                        <td>${vo.dbday}</td>
                    </tr>
                    <tr>
                        <th width="25%">연락방법</th>
                        <td width="75%">${vo.contact_type}<a style="margin-left: 10px; font-size: 12px;" href="${vo.contact_link}" title="${vo.contact_link}">링크 바로가기</a></td>
                    </tr>
                    <tr>
                        <th width="25%">작성자</th>
                        <td width="75%">${vo.nickname }</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="row">
            <table class="table">
                <tr>
                    <td>
                        ${vo.content}
                    </td>
                </tr>
            </table>
        </div>
        
		<div class="container">
			<table class="table">
				<tr>
				   <td colspan="4" class="text-center">
				    <a :href="'../study/update.do?study_id='+study_id" class="btn btn-xs btn-success">수정</a>
				    <a :href="'../study/delete.do?study_id='+study_id" class="btn btn-xs btn-danger">삭제</a>
				    <a href="../study/list.do" class="btn btn-xs btn-info">목록</a>
				   </td>
				</tr>
			</table>
		</div>

        <!-- 댓글(미완성) -->
        <div style="height: 20px"></div>
        <table class="table">
            <tr>
                <td>
                    <table class="table" v-for="re in reply_data">
                        <tr>
                            <td class="text-left">
                                ◎<span style="color: blue;">{{re.nickname}}</span>&nbsp;{{re.dbday}}
                            </td>
                            <td class="text-right">
		      	      <span v-if="re.user_id==study_detail.sessionId">
		      	        <input type="button" class="btn btn-xs btn-danger" value="수정" @click="replyUpdateForm(re.no)" :id="'up'+re.no">
		      	        <input type="button" class="btn btn-xs btn-info" value="삭제" @click="replyDelete(re.no)">
		      	      </span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-left" valign="top">
                                <pre style="white-space: pre-wrap; background-color: white; border: none;">{{re.msg}}</pre>
                            </td>
                        </tr>
                        <tr style="display: none" :id="'reply'+re.no" class="updates">
                            <td colspan="2">
                                <textarea rows="3" cols="70" style="float: left" ref="msg" id="'msg'+re.no">{{re.msg}}</textarea>
                                <input type="button" value="댓글수정" style="height: 65px; background-color: orange; color: white" @click="replyUpdate(re.no)">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table class="table" v-if="study_detail.sessionId!=null">
            <tr>
                <td>
                    <textarea rows="3" cols="72" style="float: left" ref="msg" v-model="msg"></textarea>
                    <input type="button" value="댓글쓰기" style="height: 65px; background-color: pink; color: white" @click="replyWrite()">
                </td>
            </tr>
        </table>
    </div>
</section>
<script>
    new Vue({
        el: '#sdetail',
        data: {
            study_id:${study_id},
            study_detail: {},
            reply_data: [],
            msg: '',
            no: 0
        },
        mounted: function () {
            axios.get('../study/study_detail_vue.do', {
                params: {
                    study_id: this.study_id
                }
            }).then(res => {
                console.log(res.data)
                this.study_detail = res.data
            }).catch(error => {
                console.log(error.res)
            })

            axios.get('../study/reply_list_vue.do', {
                params: {
                    study_id: this.study_id
                }
            }).then(res => {
                console.log(res.data)
                this.reply_data = res.data
            }).catch(error => {
                console.log(error.res)
            })
        },
        methods: {
            replyWrite: function () {
                if (this.msg.trim() === '') {
                    this.$refs.msg.focus()
                    return
                }
                axios.post('../study/reply_insert_vue.do', null, {
                    params: {
                        study_id: this.study_id,
                        msg: this.msg
                    }
                }).then(res => {
                    console.log(res.data)
                    this.reply_data = res.data
                    this.msg = ''
                }).catch(error => {
                    console.log(error.res)
                })
            },
            replyDelete: function (no) {
                axios.get('../study/reply_delete_vue.do', {
                    params: {
                        no: no,
                        study_id: this.study_id
                    }
                }).then(res => {
                    console.log(res.data)
                    this.reply_data = res.data
                }).catch(error => {
                    console.log(error.res)
                })
            },
            replyUpdateForm: function (no) {
                $('.updates').hide()
                if (this.no == 0) {
                    $('#reply' + no).show()
                    $('#up' + no).val("취소")
                    this.no = 1
                } else {
                    $('#reply' + no).hide()
                    $('#up' + no).val("수정")
                    this.no = 0
                }
            },
            replyUpdate: function (no) {
                let msg = $('#msg' + no).val()
                if (msg === '') {
                    $('#msg' + no).focus()
                    return
                }
                alert('msg=' + msg)

                axios.post('../study/reply_update_vue.do', null, {
                    params: {
                        no: no,
                        msg: msg,
                        study_id: this.study_id // data:{}안의 변수만 this를 붙인다
                    }
                }).then(res => {
                    console.log(res.data)
                    this.reply_data = res.data // updated => 변경된 데이터값으로 출력
                    $('#reply' + no).hide()
                    $('#up' + no).val("수정")
                    this.no = 0
                }).catch(error => {
                    console.log(error.res)
                })
            }
        }
    })
</script>