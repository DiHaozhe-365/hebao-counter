<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    #tab-bar {
      position: fixed;
      bottom: 0;
      width: 100%;
      height: 55px;
      background: var(--white);
      border-top: 1px solid var(--cutline);
      display: none;
    }
    .tab-bar-button .iconfont {
      font-size: 24px;
      margin: 18px;
    }
    .button-home {
      margin-left: auto;
    }
    .button-asset {
      margin-right: auto;
    }
    .button-account {
      margin-left: auto;
    }
    .button-setting {
      margin-right: auto;
    }
    #tab-bar .active {
      color: var(--blue);
      background: none;
      font-weight: 500;
    }
    @media (width <= 960px) {
      #tab-bar {
        display: flex;
        justify-content: center;
        align-items: center;
      }
    }
</style>

<div id="tab-bar">
    <div id="tab-bar-1" class="tab-bar-button button-home" onclick="goHome()"><span class="iconfont icon-home"></span></div>
    <div id="tab-bar-2" class="tab-bar-button button-asset" onclick="goAsset()"><span class="iconfont icon-wallet"></span></div>
    <div id="tab-bar-3" class="tab-bar-button button-account" onclick="goAccount()"><span class="iconfont icon-account"></span></div>
    <div id="tab-bar-4" class="tab-bar-button button-setting" onclick="goSetting()"><span class="iconfont icon-setting"></span></div>
</div>

<script>
    // 判断当前页面，动态控制侧边栏选项高亮
    if (window.location.href === getRootPath() + '/views/home.jsp') {
        document.getElementById("tab-bar-1").classList = "tab-bar-button button-home active";
    } else if (window.location.href === getRootPath() + "/views/asset.jsp") {
        document.getElementById("tab-bar-2").classList = "tab-bar-button button-asset active";
    } else if (window.location.href === getRootPath() + "/views/account.jsp") {
        document.getElementById("tab-bar-3").classList = "tab-bar-button button-account active";
    } else if (window.location.href === getRootPath() + "/views/setting.jsp") {
        document.getElementById("tab-bar-4").classList = "tab-bar-button button-setting active";
    }
</script>