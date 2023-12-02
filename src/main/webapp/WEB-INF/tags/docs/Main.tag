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
    <%-- 侧边栏主体 --%>
    #sidebar {
      width: 319px;
      height: 100%;
      position: fixed;
      top: 60px;
      left: 0;
      background: var(--white);
      border-right: 1px solid var(--cutline);
      display: flex;
      user-select: none;
      z-index: 900;
    }
    #sidebar-container {
      width: 100%;
      display: flex;
      flex-wrap: wrap;
    }
    #sidebar-container ul {
      list-style: none;
    }
    #sidebar-container li {
      list-style: none;
      margin-top: 10px;
      padding: 5px 20px;
    }
    #sidebar-container li:hover {
      color: var(--blue);
      cursor: pointer;
    }

    #sidebar-container .active {
      color: var(--blue);
    }
    <%-- 内容区主体 --%>
    #content {
      height: 100%;
      background: var(--white);
      position: fixed;
      top: 0;
      left: 320px;
      right: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      user-select: none;
    }
    #content-container {
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
      flex-direction: column;
    }

    #content-container iframe {
      position: absolute;
      top: 40px;
      width: 105%;
      height: 100%;
      border: none;
    }

    <%-- 适配手机端 --%>
    @media (width <= 960px) {
      #sidebar {
        width: 100%;
        display: none;
      }
      #content {
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
      }
    }
</style>
<div id="main">
    <div id="sidebar">
        <div id="sidebar-container">
            <ul>
                <li class="active">快速开始</li>
                <li>课程设计说明</li>
                <li>需求分析</li>
                <li>系统设计</li>
                <li>开发者版权协议</li>
            </ul>
        </div>
    </div>
    <div id="content">
        <div id="content-container">
            <iframe id="docs" src="../public/html/1.html"></iframe>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
    $('#sidebar-container li').click(function() {
        let index = $(this).index() + 1 //获取对应html名称
        $('#docs').attr({src: '../public/html/' + index + '.html'}) // 切换对应html文档
        $(this).siblings().removeClass('active'); // 清除其他 li 的 .active 样式
        $(this).addClass('active') // 为点击的 li 添加 .active 样式
        if (!$('#header-menu li').is(":hidden")) {
            $('#sidebar').css({display: 'none'})
        } else {
            $('#sidebar').css({display: 'block'})
        }
    })
    })
    function getMenu() {
        if ($('#sidebar').is(":hidden")) {
            $('#sidebar').css({display: 'block'})
        } else {
            $('#sidebar').css({display: 'none'})
        }
    }

    $(window).resize(function(){				         //  监控窗口宽度变化
        if( $(window).width() > 960 ) {
            $('#sidebar').css({display: 'block'})
        }
    })
    $(window).resize(function(){				         //  监控窗口宽度变化
        if( $(window).width() <= 960 ) {
            $('#sidebar').css({display: 'none'})
        }
    })
</script>