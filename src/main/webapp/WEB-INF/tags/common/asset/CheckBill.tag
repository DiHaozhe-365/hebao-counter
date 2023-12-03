<%@ tag pageEncoding="UTF-8" language="java" %>
<%--点击账单查看账单详情--%>
<style>
  #bill-detail-more {
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

  #bill-detail-more-container {
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

  .bill-detail-more-container-title {
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

  .bill-detail-more-container-items {
    position: absolute;
    top: 52px;
    right: 0;
    text-align: left;
  }

  .bill-detail-more-container-item {
    display: block;
    width: 360px;
    height: 32px;
    border-bottom: 1px solid #f8fafb;
    padding: 10px 20px;
    line-height: 32px;
    vertical-align: middle;
  }

  .bill-detail-more-container-item:hover {
    background: var(--background);
  }

  .bill-detail-more-container-item-key {
    font-weight: 500;
  }

  .bill-detail-more-container-item-value {
    float: right;
  }

  .bill-detail-more-container-item-value-button {
    font-size: 12px;
    background: var(--red);
    color: var(--white);
    padding: 0px 15px;
    border-radius: 4px;
    cursor: pointer;
    transition: 0.3s;
  }

  .bill-detail-more-container-item-value-button:hover {
    background: rgba(235, 89, 93, 0.8);
  }

  .bill-detail-more-container-item-value-button:active {
    background: var(--red);
  }
</style>
<div id="bill-detail-more"
     class="bill-detail-more-background"
     style="display: none"
     onclick="removeBillDetailMore()">
    <div id="bill-detail-more-container"
         class="bill-detail-more-container"
         onclick="event.cancelBubble = true">
    </div>
</div>
<script>
    // 查看账单详情
    function getBillDetailMore(billId) {
        const xhr = new XMLHttpRequest()
        xhr.open("GET", '../get-bill-by-id-servlet?id='+billId)
        xhr.send()
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    // 获取用于输出的<div>元素
                    var billDetailMoreContent = document.getElementById("bill-detail-more-container");
                    console.log(billDetailMoreContent)
                    billDetailMoreContent.style.display = "none";
                    var data = JSON.parse(xhr.responseText);
                    if (data.bill.length !== 0) {
                        billDetailMoreContent.style.display = "";
                        billDetailMoreContent.innerText = "";
                        // 处理金钱
                        var money = data.bill.money + "";
                        if (money.includes("-")) {
                            money = "-￥" + formatMoneyForCheckAsset(data.bill.money).slice(1)
                        } else {
                            money = "￥" + formatMoneyForCheckAsset(data.bill.money)
                        }
                        if (data.bill.billType==='支出') {
                            money = "-" + money
                        } else if (data.bill.billType==='收入') {
                            money = "+" + money
                        }
                        var billHTML =
                            `<div class="bill-detail-more-container-title">账单详情</div>
                            <div class="bill-detail-more-container-items">
                                <div class="bill-detail-more-container-item">
                                    <span class="bill-detail-more-container-item-key">操作</span>
                                    <span class="bill-detail-more-container-item-value">
                                        <div id="bill-delete" class="bill-detail-more-container-item-value-button">删除账单</div>
                                    </span>
                                </div>
                                <div class="bill-detail-more-container-item">
                                    <span class="bill-detail-more-container-item-key">金额</span>
                                    <span id="bill-detail-more-container-item-money" class="bill-detail-more-container-item-value">\${money}</span>
                                </div>
                                <div class="bill-detail-more-container-item">
                                    <span class="bill-detail-more-container-item-key">分类</span>
                                    <span class="bill-detail-more-container-item-value">\${data.bill.billClass}</span>
                                </div>
                                <div class="bill-detail-more-container-item">
                                    <span class="bill-detail-more-container-item-key">描述</span>
                                    <span class="bill-detail-more-container-item-value">\${data.bill.description}</span>
                                </div>
                                <div class="bill-detail-more-container-item">
                                    <span class="bill-detail-more-container-item-key">时间</span>
                                    <span class="bill-detail-more-container-item-value">\${data.bill.time}</span>
                                </div>
                            </div>`;
                        billDetailMoreContent.innerHTML += billHTML;
                        if (data.bill.billType==='支出') {
                            document.getElementById('bill-detail-more-container-item-money').style.color = 'var(--red)'
                        } else if (data.bill.billType==='收入') {
                            document.getElementById('bill-detail-more-container-item-money').style.color = 'var(--green)'
                        }
                        // 删除方法
                        document.getElementById("bill-delete").onclick = function () {
                            let r = confirm("确定要删除该账单吗？")
                            if (r === true) {
                                window.location.href = "../delete-bill-servlet?id=" + billId
                            }
                        }
                    }
                } else {
                    console.error("请求失败");
                }
            }
        };
        document.getElementById("bill-detail-more").style.display = "";
        setTimeout(function() {
            document.getElementById("bill-detail-more-container").style.height = "320px";
        }, 60);
    }

    // 移除账单详情
    function removeBillDetailMore() {
        document.getElementById("bill-detail-more-container").style.height = "0";
        setTimeout(function() {
            document.getElementById("bill-detail-more").style.display = "none";
        }, 310);
    }
</script>

<%--适配移动端--%>
<style>
  @media (width <= 960px) {
    #bill-detail-more {
      width: 100%;
    }
    #bill-detail-more-container {
      width: 100%;
    }
    .bill-detail-more-container-title {
      width: 100%;
      right: -40px;
    }
    .bill-detail-more-container-items {
      width: 100%;
      display: flex;
      justify-content: center;
      flex-direction: column;
    }
    .bill-detail-more-container-item {
      width: 94%;
      padding: 10px 3%;
    }
  }
</style>