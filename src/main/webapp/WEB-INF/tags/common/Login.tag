<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    .login {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 340px;
        height: 420px;
        padding: 40px;
        background: var(--white);
        border-radius: 12px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
        user-select: none;
        align-content: center;
    }

    @media (500px < width <= 1024px) {
        .login {
            width: 60%;
            height: 100%;
            border-radius: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20%;
            background: var(--white);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
            user-select: none;
            align-content: center;
        }
    }

    @media (width <= 500px) {
        .login {
            width: 90%;
            height: 100%;
            border-radius: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 5%;
            background: var(--white);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
            user-select: none;
            align-content: center;
        }
    }

    .login h2 {
        text-align: left;
    }

    .login input {
        width: 100%;
        height: 42px;
        margin-top: 20px;

        border: 1px var(--gray) solid;
        border-radius: 8px;
        font-size: 16px;
        transition: 0.3s;
        outline: none;
    }

    .login input:hover {
        border: 1px var(--blue) solid;
    }

    .login input:focus {
        border: 1px var(--blue) solid;
    }

    .login input::placeholder {
        color: var(--gray);
    }

    .login span {
        font-size: 12px;
        color: var(--gray);
        cursor: pointer;
        vertical-align: middle;
    }

    .login a {
        text-decoration: none;
        font-size: 12px;
        color: var(--blue);
        cursor: pointer;
        vertical-align: middle;
    }

    .login button {
        width: 100%;
        height: 42px;
        border-radius: 8px;
        color: var(--white);
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    .login .primary {
        margin-top: 20px;
        background: var(--blue);
        border: 1px var(--blue) solid;
        color: var(--white);
    }

    .login .primary:hover {
        opacity: 0.8;
    }

    .login .common {
        margin-top: 10px;
        background: none;
        border: 1px var(--gray) solid;
        color: var(--gray);
    }

    .login .common:hover {
        border: 1px var(--blue) solid;
        color: var(--blue);
    }
</style>
<div class="login">
    <h2>嗨！<br>欢迎使用荷包记账✨</h2>
    <form action="../login-servlet" method="post" onsubmit="return checkForm()">
        <input id="login-form-username"
               name="username"
               type="text"
               placeholder="账号" />
        <input id="login-form-password"
               name="password"
               type="password"
               placeholder="密码" />
        <input id="login-form-agree"
               name="agree"
               type="checkbox"
               hidden="hidden" />
        <button id="login-button" type="submit" class="primary">登 录</button>
        <button type="button" class="common" onclick="goRegister()">注 册</button>
    </form>
</div>

<script>
<%--  最后删掉  --%>
//     document.getElementById("login-form-username").value = "admin";
//     document.getElementById("login-form-password").value = "123456";
//     document.getElementById("login-button").click();
<%--  最后删掉  --%>
    function checkForm() {
        const username = $('#login-form-username').val()
        const password = $('#login-form-password').val()
        if (username==='') {
            alert("请输入账号");
            return false
        } else if (password==='') {
            alert('请输入密码')
            return false
        } else {
            return true
        }
    }
</script>
