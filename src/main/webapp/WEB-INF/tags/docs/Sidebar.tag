<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    <%-- 主要内容主体 --%>
    #sidebar {
      width: 319px;
      height: 100%;
      position: fixed;
      top: 60px;
      left: 0;
      background: var(--white);
      border-right: 1px solid var(--cutline);
      display: flex;
      justify-content: center;
      align-items: center;
      user-select: none;
    }
    #sidebar-container {
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
    }
    <%-- 适配手机端 --%>
    @media (width <= 663px) {
      #sidebar {
        width: 0;
      }
    }
    @media (width <= 500px) {

    }
</style>
<div id="sidebar">
    <div id="sidebar-container">
        <div id="main-title">
            <span id="title">荷包记账</span>
            <span id="introduce">一站式钱包管理助手</span>
        </div>
    </div>
</div>

<script>
</script>