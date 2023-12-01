<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    <%-- 顶部导航栏主体 --%>
    #header {
      height: 60px;
      width: 100%;
      position: fixed;
      top: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      background: rgba(255, 255, 255, 0.9);
      border-bottom: 1px solid var(--cutline);
      backdrop-filter: saturate(250%) blur(14px) brightness(100%);
      user-select: none;
      z-index: 1000;
    }
    #header-container {
      height: 100%;
      width: 1200px;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    <%-- 左侧logo和标题 --%>
    #header-logo {
      height: 100%;
      margin-right: auto;
      display: flex;
      align-items: center;
      cursor: pointer;
    }
    #header-logo img {
      -webkit-user-drag: none;
      width: 36px;
      height: 36px;
      margin-left: 10px;
    }
    #header-logo span {
      padding: 0 10px;
      font-size: 18px;
      font-weight: 700;
    }
    <%-- 右侧菜单选项 --%>
    #header-menu {
      height: 100%;
      margin-left: auto;
      display: flex;
      align-items: center;
    }
    #header-menu ul {
      list-style: none;
      margin-left: auto;
      margin-right: 10px;
      display: flex;
      flex-wrap: wrap;
    }
    #header-menu li {
      margin-left: 10px;
      padding: 6px 12px;
      border-radius: 12px;
      transition: 0.3s;
      font-size: 18px;
    }
    #header-menu li:hover {
      background: var(--blue);
      color: var(--white);
      cursor: pointer;
    }
    #header-menu li:active {
      transform: scale(95%);
    }
    <%-- 适配手机端 --%>
    @media (width <= 500px) {
      #header-menu li {
        margin-left: 3px;
        padding: 6px 8px;
        border-radius: 12px;
        transition: 0.3s;
        font-size: 16px;
      }
    }
</style>
<header id="header">
    <div id="header-container">
        <div id="header-logo" onclick="goIndex()">
            <img src="./public/img/logo.svg" alt="logo">
            <span>荷包记账</span>
        </div>
        <div id="header-menu">
            <ul>
                <li onclick="goDocs()">文 档</li>
                <li onclick="goGitHub()">代 码</li>
            </ul>
        </div>
    </div>
</header>

<script>
    function goIndex() {
        window.location.href = './'
    }
    function goGitHub() {
        window.open('https://github.com/DiHaozhe-365/hebao-counter', '_blank')
    }
    function goDocs() {
        window.open('./views/docs.jsp', '_blank')
    }
</script>