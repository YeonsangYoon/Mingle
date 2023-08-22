<%--
  Created by IntelliJ IDEA.
  User: SIST
  Date: 2023-08-16
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 부제목 -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row" style="text-align: center;">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>회원가입</h4>
                    <div class="breadcrumb__links">
                        <a href="${pageContext.request.contextPath}/main/main.do">Home</a>
                        <span>회원가입</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="container" style="margin-top: 30px">
    <form class="register-content">
        <fieldset>
            <div>
                <label for="userId">아이디 :</label>
                <input type="text" id="userId" placeholder="아이디 입력 후 중복체크" oninput="id_change()" autocomplete="off">
                <span id="MsgId" class="none">유효성체크</span>
                <input type="button" onclick="ck_id()" value="중복체크">
            </div>
            <div>
                <label for="pwd">비밀번호 :</label>
                <input type="password" id="pwd" placeholder="영어, 숫자 포함 8자 이상" oninput="ck_pwd()" autocomplete="off">
                <span id="MsgPw" class="none">유효성체크</span>
            </div>
            <div>
                <label for="pwd_ck">비밀번호 확인 :</label>
                <input type="password" id="pwd_ck" placeholder="비밀번호와 동일" oninput="ck_pwd2()" autocomplete="off">
                <span id="MsgPwck" class="none">유효성체크</span>
            </div>
            <div>
                <label for="name">이름 :</label>
                <input type="text" id="name" placeholder="이름" oninput="ck_name()" autocomplete="off">
                <span id="MsgName" class="none">유효성체크</span>
            </div>
            <div>
                <label for="nickname">닉네임 :</label>
                <input type="text" id="nickname" placeholder="닉네임 입력 후 중복체크" oninput="nick_change()" autocomplete="off">
                <span id="MsgNickName" class="none">유효성체크</span>
                <input type="button" onclick="ck_nickname()" value="중복체크">
            </div>
            <div>
                <label for="email">이메일 :</label>
                <input type="email" id="email" placeholder="이메일 ( example@naver.com)" oninput="ck_email()" autocomplete="off">
                <span id="MsgEmail" class="none"></span>
            </div>
            <div>
                <label>성별 :</label>
                <div id="wrap_gender">
                    <span id="wrap_man" class="gender">
                        <input type="radio" id="man" name="gender" value="m" onclick="ck_gender()">
                        <label for="man"> 남자 </label>
                    </span><span id="wrap_woman" class="gender no_line">
                        <input type="radio" id="woman" name="gender" value="w" onclick="ck_gender()">
                        <label for="woman" onclick="ck_gender()"> 여자 </label>
                    </span>
                </div>
            </div>
            <span id="MsgGender" class="none">유효성체크</span>
            <div>
                <label for="phone">전화번호 :</label>
                <input type="text" id="phone" placeholder="- 없이 입력" oninput="ck_phone()" autocomplete="off">
                <span id="MsgPhone" class="none"></span>
            </div>
            <div>
                <label for="birthday">생년월일 :</label>
                <input type="date" id="birthday" onchange="ck_birthday()">
            </div>
            <div>
                <label for="zipcode">우편번호 :</label>
                <input type="text" class="nofocus" id="zipcode" style="width: 20%" readonly>
                <input type="button" onclick="openZipCodeSearch()" value="우편번호 검색">
            </div>
            <div>
                <label for="address">주소 :</label>
                <input type="text" class="nofocus" id="address" readonly>
            </div>
            <div>
                <label for="detail_address">상세 주소:</label>
                <input type="text" id="detail_address" onblur="ck_detail_address()" autocomplete="off">
            </div>
            <input type="button" value="회원가입" onclick="sendMemberRegisterRequest()" class="block_buttion" style="display: block; margin: 0 auto">
        </fieldset>
    </form>
</div>
<div id="alertModal" class="modal" >
    <p></p>
</div>