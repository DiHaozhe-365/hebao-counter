<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    .register {
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
        .register {
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
        .register {
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

    .register h2 {
        text-align: left;
    }

    .register input {
        width: 100%;
        height: 42px;
        margin-top: 20px;

        border: 1px var(--gray) solid;
        border-radius: 8px;
        font-size: 16px;
        transition: 0.3s;
        outline: none;
    }

    .register input:hover {
        border: 1px var(--blue) solid;
    }

    .register input:focus {
        border: 1px var(--blue) solid;
    }

    .register input::placeholder {
        color: var(--gray);
    }

    .register span {
        font-size: 12px;
        color: var(--gray);
        cursor: pointer;
        vertical-align: middle;
    }

    .register a {
        text-decoration: none;
        font-size: 12px;
        color: var(--blue);
        cursor: pointer;
        vertical-align: middle;
    }

    .register button {
        width: 100%;
        height: 42px;
        border-radius: 8px;
        color: var(--white);
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    .register button:active {
      transform: scale(95%);
    }

    .register .primary {
        margin-top: 20px;
        background: var(--blue);
        border: 1px var(--blue) solid;
        color: var(--white);
    }

    .register .primary:hover {
        opacity: 0.8;
    }

    .register .common {
        margin-top: 10px;
        background: none;
        border: 1px var(--gray) solid;
        color: var(--gray);
    }

    .register .common:hover {
        border: 1px var(--blue) solid;
        color: var(--blue);
    }
</style>
<div class="register">
    <h2>加入我们！<br>注册荷包记账✨</h2>
    <form action="../register-servlet" method="post" onsubmit="return checkForm()">
        <input id="register-form-username"
               name="username"
               type="text"
               placeholder="账号" />
        <input id="register-form-password"
               name="password"
               type="password"
               placeholder="密码" />
        <input id="register-form-nick-name"
               name="nick-name"
               type="text"
               placeholder="昵称" />
        <button id="register-button" type="submit" class="primary">注 册</button>
        <button type="button" class="common" onclick="goLogin()">返 回</button>
    </form>
</div>

<script>
    function checkForm() {
        const username = $('#register-form-username').val()
        const password = $('#register-form-password').val()
        const nickName = $('#register-form-nick-name').val()
        if (username === '') {
            alert("请输入账号");
            $('#register-form-username').focus()
            return false
        } else if (password === '') {
            alert('请输入密码')
            $('#register-form-password').focus()
            return false
        } else if (nickName === '') {
            alert('请输入昵称')
            $('#register-form-nick-name').focus()
            return false
        } else {
            return true
        }
    }
</script>
