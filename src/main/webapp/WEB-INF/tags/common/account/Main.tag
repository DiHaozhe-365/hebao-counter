<%@ tag import="com.dihaozhe.hebaocounter.entity.dto.Account" %>
<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    main {
      width: 100%;
      margin-top: 100px;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;
      user-select: none;
    }
    #account-avatar img {
      border-radius: 50%;
      height: 90px;
      width: 90px;
      -webkit-user-drag: none;
    }
    .information-card {
      width: 94%;
      background: var(--white);
      border-radius: 12px;
      display: flex;
      flex-direction: column;
      padding: 15px 0;
      margin-top: 20px;
    }
    .information-card .title{
      padding-bottom: 15px;
      font-size: 16px;
      font-weight: 500;
      margin-left: 20px;
    }
    .information-card .item {
      width: 100%;
      display: flex;
      justify-content: space-between;
      border-top: 1px solid var(--bluegray);
      padding: 10px 0;
    }
    .information-card .item:hover {
      background: var(--bluegray);
    }
    .information-card .item span {
      margin-left: 20px;
      margin-right: 20px;
    }
    @media (width > 960px) {
      main {
        margin-left: 220px;
        margin-right: 210px;
        width: auto;
      }
      .information-card {
        width: 55%;
      }
    }
</style>

<main>
    <%
        String avatar = "default.png";
        String nickName = "游客";
        String username = "-";
        String createTime = "-";
        String email = "-";
        String phone = "-";
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            avatar = account.getAvatar();
            nickName = account.getNickName();
            username = account.getUsername();
            createTime = String.valueOf(account.getCreateTime());
            email = account.getEmail();
            phone = account.getPhone();
            if (email == null) {
                email = "-";
            }
            if (phone == null) {
                phone = "-";
            }
        }
    %>
    <div id="account-avatar" style="cursor: pointer">
        <img src="../public/avatar/<%=avatar%>" alt="avatar"/>
    </div>
    <div class="information-card">
        <span class="title">基本信息</span>
        <div class="item" style="cursor: pointer" onclick="getChangeNickNameAlert()">
            <span>昵称</span>
            <span style="color: var(--blue)"><%=nickName%></span>
        </div>
        <div class="item">
            <span>账号</span>
            <span><%=username%></span>
        </div>
        <div class="item">
            <span>注册日期</span>
            <span><%=createTime%></span>
        </div>
    </div>
    <div class="information-card">
        <span class="title">绑定信息</span>
        <div class="item" style="cursor: pointer">
            <span>邮箱</span>
            <span style="color: var(--blue)"><%=email%></span>
        </div>
        <div class="item" style="cursor: pointer">
            <span>手机</span>
            <span style="color: var(--blue)"><%=phone%></span>
        </div>
    </div>
    <div class="information-card">
        <span class="title">操作</span>
        <div class="item" style="justify-content: center; cursor: pointer" onclick="logout()">
            <span class="iconfont icon-logout" style="color: var(--red)"> 退出登录</span>
        </div>
    </div>
</main>

<script>
    function logout(){
        let r=confirm("确定要退出登录吗？");
        if (r===true) {
            window.location.href = "../logout-servlet";
        } else {
            return false
        }
    }
</script>