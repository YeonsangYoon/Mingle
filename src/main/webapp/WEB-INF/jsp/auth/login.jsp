<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="login-modal" class="modal" style="height: 600px;">
    <div class="login-content">
        <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg" alt="logo">
        <h2 class="title">Login</h2>
        <form>
            <div class="input-div one">
                <div class="i">
                    <i class="fa fa-user"></i>
                </div>
                <div class="div">
                    <input type="text" class="input" id="idInput" placeholder="아이디 입력">
                </div>
            </div>
            <div class="input-div pass">
                <div class="i">
                    <i class="fa fa-lock"></i>
                </div>
                <div class="div">
                    <input type="password" class="input" id="pwdInput" autocomplete="off"  placeholder="비밀번호 입력">
                </div>
            </div>
        </form>
        <p id="login-result-msg"></p>
        <a href="#" style="float: left">Forgot ID?</a>
        <a href="#">Forgot Password?</a>
        <input type="button" class="btn" id="loginBtn" value="Login">
    </div>
</div>
