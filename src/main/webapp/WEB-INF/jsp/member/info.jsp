<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="app-content">
    <div class="app-content-header">
        <h1 class="app-content-headerText">회원 정보</h1>
    </div>
    <div class="info-content">
        <div class="row">
            <div class="col-sm-3">
                <p>아이디</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>${member.user_id}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>가입일</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p><fmt:formatDate value="${member.regdate}" pattern="yyyy-MM-dd"/></p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>이름</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>${member.user_name}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>닉네임</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>${member.nickname}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>성별</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>${member.gender}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>전화번호</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>${member.phone}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>이메일</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>${member.email}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>생년 월일</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>${member.birthday}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>주소</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>${member.address}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>상세 주소</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>${member.detail_address}</p>
            </div>
        </div>
    </div>
    <div class="info-modify">
        <a href="#edit-profile-modal" rel="modal:open" id="edit-profile-button">회원 정보 수정</a>
        <a href="#withdraw-modal" rel="modal:open" id="withdraw-button">회원 탈퇴</a>
        <div id="edit-profile-modal" class="modal" style="height: 300px; display: none;">
            <div class="login-content">
                <h3 class="title text-center">비밀번호 재확인</h3>
                <form>
                    <div class="input-div pass">
                        <div class="i">
                            <i class="fa fa-lock"></i>
                        </div>
                        <div class="div">
                            <input type="password" class="input" id="pwd-edit" autocomplete="off" placeholder="비밀번호 입력">
                        </div>
                    </div>
                    <input type="button" value="확인" class="btn okBtn" onclick="editInfoPage()">
                </form>
            </div>
        </div>
        <div id="withdraw-modal" class="modal" style="height: 300px; display: none;">
            <div class="login-content">
                <p style="font-size: 18px;">탈퇴 시 삭제된 데이터는 복구되지 않습니다.</p>
                <p style="font-size: 18px;">정말 탈퇴하시겠습니까?</p>
                <form>
                    <div class="input-div pass">
                        <div class="i">
                            <i class="fa fa-lock"></i>
                        </div>
                        <div class="div">
                            <input type="password" class="input" id="pwd-withdraw" autocomplete="off" placeholder="비밀번호 입력">
                        </div>
                    </div>
                    <input type="button" value="확인" class="btn okBtn" onclick="withdrawMemberRequest()">
                </form>
            </div>
        </div>
    </div>
</div>
