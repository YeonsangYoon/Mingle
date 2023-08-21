<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="app-content">
    <div class="app-content-header">
        <h1 class="app-content-headerText">회원 정보 수정</h1>
    </div>
    <div class="info-content edit-info-content">
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
                <input id="edit-user-name" type="text" value="${member.user_name}">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>닉네임</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <input id="edit-nickname" type="text" value="${member.nickname}">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>성별</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <p>
                    <input id="info-man" type="radio" name="gender" value="m" ${member.gender=='남자' ? 'checked' : ''}><label for="info-man">남자</label>
                    <input id="info-woman" type="radio" name="gender" value="w" ${member.gender=='여자' ? 'checked' : ''}><label for="info-woman">여자</label>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>전화번호</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <input id="edit-phone" type="text" value="${member.phone}">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>이메일</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <input id="edit-email" type="email" value="${member.email}">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>생년 월일</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <input id="edit-birthday" type="date" value="${member.birthday}">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>주소</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <input id="edit-address" type="text" value="${member.address}" readonly>
                <button id="address-check" onclick="openAddressSearch()">주소검색</button>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>상세 주소</p>
            </div>
            <div class="offset-sm-1 col-sm-8">
                <input id="edit-detail-address" type="text" value="${member.detail_address}">
            </div>
        </div>
        <div class="text-center">
            <button class="confirm" onclick="editInfoRequest()">정보수정</button>
            <button class="cancel" onclick="history.back()">취소</button>
        </div>
    </div>
</div>
