<%@ tag pageEncoding="UTF-8" language="java" %>
<%--点击更多按钮后显示资产详情--%>
<style>
  #asset-detail-more {
    position: fixed;
    top: 0;
    right: 0;
    width: 400px;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    z-index: 1000;
    cursor: pointer;
    user-select: none;
  }

  #asset-detail-more-container {
    position: fixed;
    bottom: 0;
    right: 0;
    width: 400px;
    height: 0;
    border-radius: 12px 12px 0 0;
    background: var(--white);
    transition: 0.3s;
    cursor: auto;
    overflow: hidden;
  }

  .asset-detail-more-container-title {
    position: absolute;
    top: 0;
    right: 0;
    width: 360px;
    height: 32px;
    text-align: left;
    font-size: 16px;
    font-weight: 500;
    padding: 10px 20px;
    line-height: 32px;
    vertical-align: middle;
    border-bottom: 1px solid #f8fafb;
  }

  .asset-detail-more-container-items {
    position: absolute;
    top: 52px;
    right: 0;
    text-align: left;
  }

  .asset-detail-more-container-item {
    display: block;
    width: 360px;
    height: 32px;
    border-bottom: 1px solid #f8fafb;
    padding: 10px 20px;
    line-height: 32px;
    vertical-align: middle;
  }

  .asset-detail-more-container-item:hover {
    background: var(--background);
  }

  .asset-detail-more-container-item-key {
    font-weight: 500;
  }

  .asset-detail-more-container-item-value {
    float: right;
  }

  .asset-detail-more-container-item-value-button {
    font-size: 12px;
    background: var(--red);
    color: var(--white);
    padding: 0px 15px;
    border-radius: 4px;
    cursor: pointer;
    transition: 0.3s;
  }

  .asset-detail-more-container-item-value-button:hover {
    background: rgba(235, 89, 93, 0.8);
  }

  .asset-detail-more-container-item-value-button:active {
    background: var(--red);
  }
</style>
<div id="asset-detail-more"
     class="asset-detail-more-background"
     style="display: none"
     onclick="removeAssetDetailMore()">
    <div id="asset-detail-more-container"
         class="asset-detail-more-container"
         onclick="event.cancelBubble = true">
    </div>
</div>
<script>
    // 查看资产详情
    function getAssetDetailMore(assetId) {
        const xhr = new XMLHttpRequest()
        xhr.open("GET", '../get-asset-by-id-servlet?id='+assetId)
        xhr.send()
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    // 获取用于输出的<div>元素
                    var assetDetailMoreContent = document.getElementById("asset-detail-more-container");
                    assetDetailMoreContent.style.display = "none";
                    var data = JSON.parse(xhr.responseText);
                    if (data.asset.length !== 0) {
                        assetDetailMoreContent.style.display = "";
                        assetDetailMoreContent.innerText = "";
                        // 处理金钱
                        var money = data.asset.money + "";
                        if (money.includes("-")) {
                            money = "-￥" + formatMoneyForCheckAsset(data.asset.money).slice(1)
                        } else {
                            money = "￥" + formatMoneyForCheckAsset(data.asset.money)
                        }
                        var billHTML =
                            `<div class="asset-detail-more-container-title">资产详情</div>
                                    <div class="asset-detail-more-container-items">
                                        <div class="asset-detail-more-container-item">
                                            <span class="asset-detail-more-container-item-key">操作</span>
                                            <span class="asset-detail-more-container-item-value">
                                                <div id="asset-delete" class="asset-detail-more-container-item-value-button">删除资产</div>
                                            </span>
                                        </div>
                                        <div class="asset-detail-more-container-item">
                                            <span class="asset-detail-more-container-item-key">初始金额</span>
                                            <span class="asset-detail-more-container-item-value">\${money}</span>
                                        </div>
                                        <div class="asset-detail-more-container-item">
                                            <span class="asset-detail-more-container-item-key">计入总资产</span>
                                            <span class="asset-detail-more-container-item-value">\${data.asset.isInclude}</span>
                                        </div>
                                        <div class="asset-detail-more-container-item">
                                            <span class="asset-detail-more-container-item-key">创建时间</span>
                                            <span class="asset-detail-more-container-item-value">\${data.asset.createTime}</span>
                                        </div>
                                    </div>`;
                        assetDetailMoreContent.innerHTML += billHTML;
                        // 删除方法
                        document.getElementById("asset-delete").onclick = function () {
                            let r = confirm("确定要删除该资产吗？删除资产属于非常危险的操作，请务必慎重！")
                            if (r === true) {
                                window.location.href = "../delete-asset-servlet?id=" + assetId
                            }
                        }
                    }
                } else {
                    console.error("请求失败");
                }
            }
        };
        document.getElementById("asset-detail-more").style.display = "";
        setTimeout(function() {
            document.getElementById("asset-detail-more-container").style.height = "265px";
        }, 60);
    }
    // 移除资产详情
    function removeAssetDetailMore() {
        document.getElementById("asset-detail-more-container").style.height = "0";
        setTimeout(function() {
            document.getElementById("asset-detail-more").style.display = "none";
        }, 310);
    }
</script>

<%--适配移动端--%>
<style>
  @media (width <= 960px) {
    #asset-detail-more {
      width: 100%;
    }
    #asset-detail-more-container {
      width: 100%;
    }
    .asset-detail-more-container-title {
      width: 100%;
      right: -40px;
    }
    .asset-detail-more-container-items {
      width: 100%;
      display: flex;
      justify-content: center;
      flex-direction: column;
    }
    .asset-detail-more-container-item {
      width: 94%;
      padding: 10px 3%;
    }
  }
</style>

