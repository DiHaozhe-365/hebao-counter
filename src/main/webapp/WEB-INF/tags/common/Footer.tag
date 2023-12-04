<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    <%-- footer主体 --%>
    #footer {
      margin-top: 20px;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      user-select: none;
    }
    #footer-container {
      margin: 60px auto;
      width: 1200px;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
    }
    #footer-container span{
      font-size: 12px;
      color: var(--gray);
    }
    <%-- 适配手机端 --%>
    @media (width <= 960px) {
      #footer-container span {
        color: var(--background);
      }
    }
</style>
<footer id="footer">
    <div id="footer-container">
        <span>基于Web程序设计：荷包记账 | v1.0.0 Alpha | 版权所有 © 2023 邸浩哲</span>
    </div>
</footer>