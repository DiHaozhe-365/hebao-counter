<%@ tag import="com.dihaozhe.hebaocounter.entity.dto.Account" %>
<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    #change-nick-name-alert {
      width: 100%;
      height: 100%;
      z-index: 1000;
      background: rgba(0,0,0,0.3);
      position: fixed;
      top: 0;
      justify-content: center;
      align-items: center;
      display: none;
    }
    #change-nick-name-alert-container {
      width: 350px;
      height: 200px;
      background: var(--white);
      border-radius: 12px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }
    #change-nick-name-alert-container form {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      width: 60%;
    }
    .form-input {
      width: 100%;
      border: none;
      margin-top: 40px;
      margin-bottom: 30px;
      border-bottom: 1px solid var(--cutline);
      text-align: center;
      color: var(--blue);
    }
    .form-input:focus {
      outline: none;
    }
    .buttons {
      display: flex;
      justify-content: space-between;
      width: 100%;
    }
    .button {
      border: none;
      padding: 5px 20px;
      border-radius: 8px;
      cursor: pointer;
      transition: 0.3s;
    }
    .button:active {
      transform: scale(95%);
    }
    .common {
      background: var(--bluegray);
      color: var(--gray);
    }
    .common:hover {
      background: var(--bluegray);
      color: var(--blue);
    }
    .primary {
      background: var(--blue);
      color: var(--white);
    }
    .primary:hover {
      opacity: 0.8;
    }
    @media (width <= 960px) {
      #change-nick-name-alert-container {
        width: 80%;
      }
    }
</style>
<%--修改昵称弹窗--%>
<%
    String accountId = "-";
    String nickName = "游客";
    Account account = (Account) session.getAttribute("account");
    if (account != null) {
        accountId = String.valueOf(account.getId());
        nickName = account.getNickName();
    }
%>
<div id="change-nick-name-alert" onclick="removeChangeNickNameAlert()">
    <div id="change-nick-name-alert-container" onclick="event.cancelBubble = true">
        <span>昵称</span>
        <form action="../update-nick-name-servlet" method="post">
            <input name="id" value="<%=accountId%>" hidden="hidden">
            <input class="form-input" name="nickName" type="text" placeholder="输入要修改的昵称" maxlength="12" value="<%=nickName%>"/>
            <div class="buttons">
                <button class="button common" type="button" onclick="removeChangeNickNameAlert()">返 回</button>
                <button class="button primary" type="submit">确 定</button>
            </div>
        </form>
    </div>
</div>

<script>
    function getChangeNickNameAlert() {
        $('#change-nick-name-alert').css({display: 'flex'})
    }
    function removeChangeNickNameAlert() {
        $('#change-nick-name-alert').css({display: 'none'})
    }
</script>