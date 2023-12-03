<%@ tag import="com.dihaozhe.hebaocounter.entity.dto.Account" %>
<%@ tag import="com.dihaozhe.hebaocounter.dao.impl.AccountDaoImpl" %>
<%@ tag import="java.util.Objects" %>
<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    <%-- 侧边栏主体 --%>
    #sidebar {
      display: block;
      width: 199px;
      height: 100%;
      position: fixed;
      top: 60px;
      left: 0;
      background: var(--white);
      border-right: 1px solid var(--cutline);
      user-select: none;
      z-index: 800;
    }
    #sidebar-container {
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
    }
    <%-- 用户信息 --%>
    #account {
      width: 100%;
      height: 200px;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }
    #account:hover {
      background: var(--bluegray);
      cursor: pointer;
    }
    #account:active {
      transition: 0.3s;
      transform: scale(95%);
      border-radius: 12px;
    }
    #account img {
      width: 90px;
      height: 90px;
      border-radius: 50%;
      -webkit-user-drag: none;
      margin-bottom: 10px;
    }

    #account-role {
      font-size: 12px;
    }

    #account .common-user {
      color: var(--white);
      background: var(--gray);
      padding: 0 3px;
      border-radius: 4px;
    }

    #account .vip {
      color: #D2BC8E;
      background: #393B41;
      padding: 0 3px;
      border-radius: 4px;
    }
    #sidebar-buttons {
      margin-top: 10px;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }
    .sidebar-button {
      margin-bottom: 10px;
      width: 100%;
      height: 45px;
      display: flex;
      align-items: center;
      cursor: pointer;
    }
    .sidebar-button .iconfont {
      font-size: 21px;
      margin-right: 10px;
      margin-left: 45px;
    }
    .sidebar-button:hover {
      background: var(--bluegray);
    }
    .sidebar-button:active {
      transition: 0.3s;
      transform: scale(95%);
      border-radius: 12px;
    }
    .active {
      background: var(--bluegray);
    }
    .active span{
      color: var(--blue);
    }
    <%-- 适配手机端 --%>
    @media (width <= 960px) {
      #sidebar {
        width: 100%;
        display: none;
      }
      .sidebar-button {
        justify-content: center;
      }
      .sidebar-button .iconfont {
        margin-right: 10px;
        margin-left: 0;
      }
    }

    @media (width <= 500px) {

    }
</style>
<div id="sidebar">
    <div id="sidebar-container">
        <div id="account">
            <%
                String avatar = "default.png";
                String nickName = "游客";
                String role = "未登录";
                if (Objects.nonNull(session.getAttribute("account"))) {
                    AccountDaoImpl accountDao = new AccountDaoImpl();
                    Account account = (Account) session.getAttribute("account");
                    account = accountDao.readAccountById(account.getId());
                    avatar = account.getAvatar();
                    nickName = account.getNickName();
                    role = account.getRole();
                }
            %>
            <img src="../public/avatar/<%=avatar%>" alt="avatar">
            <span class="nick-name"><b><%=nickName%></b>
                <span id="account-role" class="common-user"><%=role%></span>
            </span>
        </div>
        <div id="sidebar-buttons">
            <div id="item-1"
                 class="sidebar-button"
                 onclick="goHome()">
                <span class="iconfont icon-home"></span>
                <span class="title">主 页</span>
            </div>
            <div id="item-2"
                 class="sidebar-button"
                 onclick="goAsset()">
                <span class="iconfont icon-wallet"></span>
                <span class="title">资产管理</span>
            </div>
            <div id="item-3"
                 class="sidebar-button"
                 onclick="goBudget()">
                <span class="iconfont icon-budget"></span>
                <span class="title">预算管理</span>
            </div>
            <div id="item-4"
                 class="sidebar-button"
                 onclick="goCard()">
                <span class="iconfont icon-credit-card"></span>
                <span class="title">卡片管理</span>
            </div>
            <div id="item-5"
                 class="sidebar-button"
                 onclick="goCircle()">
                <span class="iconfont icon-time-circle"></span>
                <span class="title">周期记账</span>
            </div>
            <div id="item-6"
                 class="sidebar-button"
                 onclick="goSetting()">
                <span class="iconfont icon-setting"></span>
                <span class="title">设 置</span>
            </div>
        </div>
    </div>
</div>

<script>
    // 判断用户身份
    if (document.getElementById('account-role').innerText === 'VIP') {
        document.getElementById('account-role').classList = 'common-user vip'
    }
    if (document.getElementById('account-role').innerText === '未登录') {
        document.getElementById('account').onclick = goLogin
    } else {
        document.getElementById('account').onclick = goAccount
    }

    // 判断当前页面，动态控制侧边栏选项高亮
    if (window.location.href === getRootPath() + '/views/home.jsp') {
        document.getElementById("item-1").classList = "sidebar-button active";
    } else if (window.location.href === getRootPath() + "/views/asset.jsp") {
        document.getElementById("item-2").classList = "sidebar-button active";
    } else if (window.location.href === getRootPath() + "/views/bugget.jsp") {
        document.getElementById("item-3").classList = "sidebar-button active";
    } else if (window.location.href === getRootPath() + "/views/card.jsp") {
        document.getElementById("item-4").classList = "sidebar-button active";
    } else if (window.location.href === getRootPath() + "/views/circle.jsp") {
        document.getElementById("item-5").classList = "sidebar-button active";
    } else if (window.location.href === getRootPath() + "/views/setting.jsp") {
        document.getElementById("item-6").classList = "sidebar-button active";
    }
</script>