<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    <%-- 主要内容主体 --%>
    #feature {
      width: 100%;
      display: flex;
      justify-content: center;
      user-select: none;
    }
    #feature-container {
      width: 1200px;
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
    }
    <%-- 特性卡片 --%>
    .feature-card {
      margin: 10px;
      width: 300px;
      padding: 40px;
      background: var(--white);
      border-radius: 12px;
      box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
      display: flex;
      flex-direction: column;
      justify-content: center;
      transition: 0.3s;
    }
    .feature-card:hover {
      transform: scale(105%);
      box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
    }
    .card-1 {
      animation: card-out 1.8s;
    }
    .card-2 {
      animation: card-out 2.2s;
    }
    .card-3 {
      animation: card-out 2.6s;
    }
    @keyframes card-out {
      0% {
        opacity: 0;
        transform: translateY(20px);
      }
      50% {
        opacity: 0;
        transform: translateY(20px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }
    .card-title {
      font-size: 24px;
      font-weight: 700;
      margin-bottom: 20px;
    }
    <%-- 适配1200px宽度 --%>
    @media (width <= 1200px) {
      .feature-card {
        margin: 10px;
        width: 100%;
        align-items: center;
      }
    }
    <%-- 适配手机端 --%>
    @media (width <= 500px) {
    }
</style>
<div id="feature">
    <div id="feature-container">
        <div class="feature-card card-1">
            <span class="card-title">简洁至上</span>
            <span class="card-description">
                界面遵循企业级设计规范，提炼开发者的多个产品，追求界面简约而不失美感。
            </span>
        </div>
        <div class="feature-card card-2">
            <span class="card-title">专注记录</span>
            <span>
                功能纯粹，专注个人记账，将每一笔收支都清晰记录，让消费随时了然于心。
            </span>
        </div>
        <div class="feature-card card-3">
            <span class="card-title">多端适配</span>
            <span class="card-description">
                响应式布局，操作界面成功适配 PC 端和移动端，随时随地，想记就记。
            </span>
        </div>
    </div>
</div>