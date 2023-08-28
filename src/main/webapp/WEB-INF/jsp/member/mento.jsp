<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="app-content vue-area">
    <div class="mento-info">
        <h4 class="app-content-headerText text-center m-3">
            멘토정보
            <span style="color: orange; font-weight: 800">${sessionScope.nickname}</span>님
        </h4>
        <div>
            <div class="mentoregist mb-3">
                <span>사용자 ID</span>
                <input type="text" value="${sessionScope.id}" readonly>
            </div>

            <div class="mentoregist mb-3">
                <span>직무 카테고리</span>
                <select v-model="mento.job_cat" ref="job_cat" name="job_cat">
                    <option value="IT개발/데이터">IT개발/데이터</option>
                    <option value="회사/재무/금융" selected>회사/재무/금융</option>
                    <option value="공사/공기업">공사/공기업</option>
                    <option value="디자인/예술">디자인/예술</option>
                    <option value="마케팅/MD">마케팅/MD</option>
                    <option value="유통/무역/구매">유통/무역/구매</option>
                </select>
            </div>
            <div class="mentoregist mb-3">
                <span>현재 직업</span>
                <input type="text" v-model="mento.job" ref="job" name="job">
            </div>
            <div class="mentoregist mb-3">
                <span>멘토링 제목</span>
                <input type="text" v-model="mento.title" ref="title" name="title">
            </div>
            <div class="mentoregist mb-3">
                <span style="vertical-align: top;">멘토링 내용</span>
                <textarea rows="6" cols="46" v-model="mento.intro" ref="intro" name="intro"></textarea>
            </div>

            <div class="mentoregist mb-3">
                <span>부서</span>
                <input type="textarea" v-model="mento.dept" ref="dept" name="dept">
            </div>
            <div class="mentoregist mb-3">
                <span style="vertical-align: top;">경력 사항</span>
                <textarea rows="6" cols="46" v-model="mento.career" ref="career" name="career"></textarea>
            </div>

            <div class="mentoregist mb-3">
                <span>시간당 희망금액<br>(15,000이하)</span>
                <input type="number" value="1000" min="1000" max="15000" step="2000" v-model="mento.cost" name="cost" ref="cost">
            </div>
        </div>
    </div>
    <div class="text-center mt-3">
        <span class="button-mento boxhover" v-on:click="updateData()">수정하기</span>
        <span class="button-cancle boxhover" v-on:click="deleteMento()">탈퇴하기</span>
    </div>
</div>
<script type="text/javascript">
    new Vue({
        el: '.vue-area',
        data: {
            mento: {}
        },
        mounted: function () {
            this.mento = ${mento};
        },
        methods: {
            updateData: function () {
                if (this.mento.job_cat === '') {
                    this.$refs.job_cat.focus();
                    return;
                }
                if (this.mento.career === '') {
                    this.$refs.career.focus();
                    return;
                }
                if (this.mento.job === '') {
                    this.$refs.job.focus();
                    return;
                }
                if (this.mento.title === '') {
                    this.$refs.title.focus();
                    return;
                }
                if (this.mento.intro === '') {
                    this.$refs.intro.focus();
                    return;
                }
                if (this.mento.dept === '') {
                    this.$refs.dept.focus();
                    return;
                }
                if (this.mento.cost < 1000 || this.mento.cost > 15000) {
                    this.$refs.cost.focus();
                    alert("시간당 금액은 1,000 ~ 15,000 사이만 가능합니다.");
                    return;
                }
                axios.post("../mento/update_mento.do", null, {
                    params: {
                        job_cat: this.mento.job_cat,
                        career: this.mento.career,
                        job: this.mento.job,
                        cost: this.mento.cost,
                        title: this.mento.title,
                        intro: this.mento.intro,
                        dept: this.mento.dept,
                        image: this.mento.image
                    }
                }).then(response => {
                    console.log(response.data)
                    alert(response.data)
                    location.href = "../mento/mento_list.do"
                })
            },
            deleteMento: function () {

                if (confirm('멘토를 정말 그만두시겠어요? (삭제된 데이터는 복구할 수 없습니다.)')) {
                    location.href = "/mingle/mento/mento_list.do";

                    axios.post("../mento/delete_mento.do", null, {
                        params: {
                            mento_no: this.mento.mento_no
                        }
                    }).then(response => {
                        console.log(response.data)
                    }).catch(error => {
                        console.log(error.response)
                    })

                }
            },
            validateMento: function () {

            }
        }
    })
</script>