<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    <%-- 主要内容主体 --%>
    #main {
      margin-top: 60px;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      user-select: none;
    }
    #main-container {
      margin-top: 10px;
      width: 1200px;
      height: 500px;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
    }
    <%-- 主要内容logo --%>
    #main-logo {
      margin: auto;
      animation: logo-out 0.8s;
    }
    @keyframes logo-out {
      0% {
        opacity: 0;
      }
      100% {
        opacity: 1;
      }
    }
    #main-logo img {
      -webkit-user-drag: none;
      width: 250px;
      animation: logo-up-down 6s infinite linear;
    }
    @keyframes logo-up-down {
      0% {
        transform: translateY(0px);
      }
      25% {
        transform: translateY(-10px);
      }
      75% {
        transform: translateY(10px);
      }
      100% {
        transform: translateY(0px);
      }
    }
    <%-- 主要内容title --%>
    #main-title {
      margin: auto;
      display: flex;
      flex-direction: column;
    }
    #title {
      font-size: 64px;
      font-weight: 700;
      animation: title-out 1.6s;
    }
    #introduce {
      font-size: 46px;
      font-weight: 500;
      animation: introduce-out 2.4s;
      color: var(--gray);
    }
    @keyframes title-out {
      0% {
        opacity: 0;
        transform: translateY(10px);
      }
      20% {
        opacity: 0;
        transform: translateY(10px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }
    @keyframes introduce-out {
      0% {
        opacity: 0;
        transform: translateY(10px);
      }
      20% {
        opacity: 0;
        transform: translateY(10px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }
    #buttons {
      display: flex;
      flex-direction: row;
    }
    #main-title .primary-button {
      margin-top: 40px;
      margin-right: 20px;
      width: 90px;
      height: 40px;
      border-radius: 12px;
      border: none;
      background: var(--blue);
      color: var(--white);
      animation: button-out 2.4s;
      transition: 0.3s;
    }
    #main-title .primary-button:hover {
      cursor: pointer;
      opacity: 0.8;
      transform: scale(102%);
    }
    #main-title .primary-button:active {
      transform: scale(95%);
    }
    #main-title .common-button {
      margin-top: 40px;
      width: 90px;
      height: 40px;
      border-radius: 12px;
      border: 1px solid var(--gray);
      color: var(--gray);
      animation: button-out 2.4s;
      transition: 0.3s;
    }
    #main-title .common-button:hover {
      cursor: pointer;
      opacity: 0.8;
      transform: scale(102%);
      border: 1px solid var(--blue);
      color: var(--blue);
    }
    #main-title .common-button:active {
      transform: scale(95%);
    }
    @keyframes button-out {
      0% {
        opacity: 0;
        transform: translateY(10px);
      }
      20% {
        opacity: 0;
        transform: translateY(10px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }
    <%-- 适配手机端 --%>
    @media (width <= 663px) {
      #title {
        margin: auto;
        font-size: 60px;
        font-weight: 700;
      }
      #introduce {
        margin: auto;
        font-size: 40px;
        font-weight: 500;
      }

      #buttons {
        margin: 10px auto;
      }
    }
    @media (width <= 500px) {
      #main-logo img {
        width: 180px;
      }
      #title {
        margin: auto;
        font-size: 60px;
        font-weight: 700;
      }
      #introduce {
        margin: auto;
        font-size: 40px;
        font-weight: 500;
      }

      #buttons {
        margin: 10px auto;
      }
    }
</style>
<div id="main">
    <div id="main-container">
        <div id="main-logo">
            <img src="./public/img/logo.svg" alt="logo">
        </div>
        <div id="main-title">
            <span id="title">荷包记账</span>
            <span id="introduce">一站式钱包管理助手</span>
            <div id="buttons">
                <button class="primary-button" onclick="goLogin()">项目演示</button>
                <button class="common-button" onclick="goDocs()">快速开始</button>
            </div>
        </div>
    </div>
</div>

<script>
    function goLogin() {
        window.open('./views/login.jsp', '_blank')
    }
    function goDocs() {
        window.location.href = './views/docs.jsp'
    }
</script>