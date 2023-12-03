<%@ tag pageEncoding="UTF-8" language="java" %>
<%-- 资产面板 --%>
<style>
  .asset-detail {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 1000;
    transition: 0.1s;
    cursor: pointer;
    user-select: none;
  }
  .asset-detail-container {
    position: fixed;
    top: 0;
    right: 0;
    width: 0;
    height: 100%;
    background: var(--background);
    transition: 0.5s;
    cursor: auto;
    overflow-x: hidden;
  }
  .asset-detail-container::-webkit-scrollbar {
    width: 0 !important;
  }

  .asset-detail-form {
    width: 100%;
    overflow-y: scroll;
    overflow-x: hidden;
  }
  .asset-detail-form::-webkit-scrollbar {
    width: 0 !important;
  }

  .asset-detail-form .title {
    position: fixed;
    top: 0;
    display: inline-block;
    width: 160px;
    height: 32px;
    padding: 10px 20px;
    line-height: 32px;
    vertical-align: middle;
    white-space: nowrap;
    font-size: 21px;
    font-weight: 500;
    background: var(--white);
    border-bottom: 1px #f8fafb solid;
    z-index: 280;
  }

  .asset-detail-form .asset-detail-right {
    position: fixed;
    top: 0;
    display: inline-block;
    text-align: right;
    width: 370px;
    height: 32px;
    padding: 10px 20px;
    line-height: 32px;
    vertical-align: middle;
    white-space: nowrap;
    font-size: 21px;
    font-weight: 500;
    background: var(--white);
    border-bottom: 1px #f8fafb solid;
    z-index: 250;
    overflow: hidden;
  }

  .asset-detail-form .change-button {
    position: relative;
    top: -2px;
    right: 0px;
    width: 40px;
    height: 32px;
    padding: 10px 10px;
    line-height: 32px;
    vertical-align: middle;
    white-space: nowrap;
    font-size: 16px;
    font-weight: 500;
    background: var(--white);
    border-radius: 8px;
    z-index: 250;
    transition: 0.3s;
    cursor: pointer;
    overflow: hidden;
  }

  .asset-detail-form .change-button:hover {
    background: var(--background);
  }

  .asset-detail-form .more-button {
    position: relative;
    top: -2px;
    right: 0px;
    width: 40px;
    height: 32px;
    padding: 10px 10px;
    line-height: 32px;
    vertical-align: middle;
    white-space: nowrap;
    font-size: 16px;
    font-weight: 500;
    background: var(--white);
    border-radius: 8px;
    z-index: 250;
    transition: 0.3s;
    cursor: pointer;
    overflow: hidden;
  }

  .asset-detail-form .more-button:hover {
    background: var(--background);
  }

  .asset-detail-form .sub-title {
    width: 380px;
    border-radius: 12px;
    margin-top: 62px;
    margin-left: 10px;
    padding-top: 20px;
    padding-bottom: 20px;
    background: var(--white);
    border: 1px #f8fafb solid;
    text-align: center;
    font-size: 14px;
    color: var(--gray);
  }

  .asset-detail-form .asset-detail-money {
    font-size: 24px;
    font-weight: 700;
    color: var(--black);
  }


  .asset-detail-form .content {
    width: 380px;
    border-radius: 12px;
    margin-top: 10px;
    margin-left: 10px;
    padding-top: 5px;
    padding-bottom: 15px;
    background: var(--white);
    border: 1px #f8fafb solid
  }

  .asset-detail-form .content .title {
    position: relative;
    top: 5px;
    width: 380px;
    height: 40px;
    background: none;
    font-size: 16px;
    padding: 0;
    z-index: 200;
  }

  .asset-detail-form .content .title .month {
    position: absolute;
    top: 0;
    left: 15px;
    height: 40px;
    background: none;
    font-size: 16px;
  }

  .asset-detail-form .content .title .in-out {
    position: absolute;
    top: 0;
    right: 15px;
    height: 40px;
    background: none;
    font-size: 11px;
    line-height: 15px;
    text-align: right;
    font-weight: 500;
  }

  .asset-detail-form .content .title .in {
    display: block;
    margin-right: 10px;
    height: 20px;
    width: 100%;
    background: none;
  }

  .asset-detail-form .content .title .out {
    display: block;
    margin-right: 10px;
    height: 20px;
    width: 100%;
    background: none;
  }

  .asset-detail-form .content .bill {
    position: relative;
    top: 5px;
    width: 380px;
    height: 56px;
    background: var(--white);
    font-size: 16px;
    padding: 0;
    transition: 0.3s;
    border-bottom: 1px #f8fafb solid;
    cursor: pointer;
  }

  .asset-detail-form .content .bill:hover {
    background: var(--background);
  }

  .asset-detail-form .content .bill .bill-color {
    position: absolute;
    top: 25px;
    left: 20px;
    width: 6px;
    height: 6px;
    border-radius: 50%;
  }

  .asset-detail-form .content .bill .bill-color-out {
    background: var(--red);
  }

  .asset-detail-form .content .bill .bill-color-in {
    background: var(--green);
  }

  .asset-detail-form .content .bill .bill-color-transfer {
    background: var(--blue);
  }

  .asset-detail-form .content .bill .bill-left {
    position: absolute;
    top: 10px;
    left: 46px;
    width: 180px;
    height: 45px;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
  }

  .asset-detail-form .content .bill .bill-left .bill-left-class {
    display: block;
    font-size: 16px;
  }

  .asset-detail-form .content .bill .bill-left .bill-left-time {
    display: inline;
    font-size: 12px;
  }

  .asset-detail-form .content .bill .bill-left .bill-left-description {
    display: inline;
    font-size: 12px;
  }

  .asset-detail-form .content .bill .bill-right {
    position: absolute;
    top: 10px;
    right: 15px;
    width: 180px;
    height: 45px;
    text-align: right;
  }

  .asset-detail-form .content .bill .bill-right .bill-right-money {
    display: block;
    font-size: 16px;
  }

  .asset-detail-form .content .bill .bill-right .bill-money-out {
    color: var(--red);
  }

  .asset-detail-form .content .bill .bill-right .bill-money-in {
    color: var(--green);
  }

  .asset-detail-form .content .bill .bill-right .bill-money-transfer {
    color: var(--blue);
  }

  .asset-detail-form .content .bill .bill-right .bill-right-asset {
    display: inline;
    font-size: 12px;
  }

</style>
<div id="asset-detail"
     class="asset-detail"
     style="display: none"
     onclick="removeAssetDetail()">
    <div id="asset-detail-container"
         class="asset-detail-container"
         onclick="event.cancelBubble = true">
        <div class="asset-detail-form">
            <div class="back-button-2" onclick="removeAssetDetail()"><span class="iconfont icon-back"></span></div>
            <span id="asset-detail-name" class="title big-title"></span>
            <span id="asset-detail-right" class="asset-detail-right">
                <span id="update-button" class="change-button">修改</span>
                <span id="more-button" class="more-button">更多</span>
            </span>
            <div class="sub-title">
                <span>余额</span><br>
                <span id="asset-detail-money" class="asset-detail-money"></span>
            </div>
            <div id="asset-detail-content">
            </div>
        </div>
    </div>
</div>
<script>
    function getAssetDetail(asset) {
        let assetId = asset.id
        let assetName = asset.name
        let assetMoney = formatMoneyForCheckAsset(asset.money)
        var money;
        if (assetMoney.includes("-")) {
            money = "-￥" + assetMoney.slice(1)
        } else {
            money = "￥" + assetMoney
        }
        document.querySelector("body").style.overflow="hidden"
        getAssetBill(assetId)
        document.getElementById("asset-detail-name").innerText = assetName
        document.getElementById("asset-detail-money").innerText = money
        document.getElementById("asset-detail").style.display = ""
        if ($(window).width() <= '960') {
            setTimeout(function() {
                document.getElementById("asset-detail-container").style.width = "100%"
            }, 10);
        } else {
            setTimeout(function() {
                document.getElementById("asset-detail-container").style.width = "400px"
            }, 10);
        }
        document.getElementById("update-button").onclick = function () {
            getUpdateAsset(assetId)
        }
        document.getElementById("more-button").onclick = function () {
            getAssetDetailMore(assetId)
        }
    }
    function removeAssetDetail() {
        if (document.getElementById("asset-detail-more").style.display !== "none") {
            removeAssetDetailMore()
        } else if (document.getElementById("bill-detail-more").style.display !== "none") {
            removeBillDetailMore()
        } else {
            document.querySelector("body").style.overflow=""
            document.getElementById("asset-detail-container").style.width = "0"
            setTimeout(function() {
                document.getElementById("asset-detail").style.display = "none"
            }, 510)
        }
    }
    function formatMoneyForCheckAsset(number) {
        // 将数字转换为字符串
        var amountString = number.toString()

        // 检查是否存在小数部分
        var parts = amountString.split('.')
        var decimal = ''
        if (parts.length === 2) {
            decimal = parts[1]
            // 如果小数部分少于2位数，则补零
            if (decimal.length < 2) {
                decimal += '0'
            }
        } else {
            decimal = '00'
        }

        // 添加千位分隔符
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',');

        // 拼接金额字符串
        var formattedAmount = parts[0] + '.' + decimal;

        return formattedAmount;
    }
    function getAssetBill(assetId) {
        const xhr = new XMLHttpRequest();
        xhr.open("GET", '../get-bills-by-asset-id-servlet?assetId='+assetId);
        xhr.send();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    // 获取用于输出的<div>元素
                    var assetDetailContent = document.getElementById("asset-detail-content");
                    assetDetailContent.style.display = "none";
                    var data = JSON.parse(xhr.responseText);
                    if (data.bills.length !== 0) {
                        assetDetailContent.style.display = "";
                        assetDetailContent.innerText = "";
                        var flowIn = 0;
                        var flowOut = 0;

                        // 遍历bills列表
                        data.bills.forEach(function(bill) {
                            // 处理时间
                            var time = bill.time.slice(0, 7);
                            var year = new Date();
                            var date = bill.time.slice(5, 10);
                            var timeShow;
                            if (time.slice(0,4) === year.getFullYear()+"") {
                                timeShow = time.slice(5) + "月";
                            } else {
                                timeShow = time.slice(0,4) + "年" + time.slice(5) + "月"
                            }

                            // 处理金钱
                            var colorClass = "";
                            var moneyClass = "";
                            if (bill.billType === "支出") {
                                colorClass = "class='bill-color bill-color-out'"
                                moneyClass = "class='bill-right-money bill-money-out'>-￥"
                            } else if (bill.billType === "收入") {
                                colorClass = "class='bill-color bill-color-in'"
                                moneyClass = "class='bill-right-money bill-money-in'>+￥"
                            } else if (bill.billType === "转账") {
                                colorClass = "class='bill-color bill-color-transfer'"
                                moneyClass = "class='bill-right-money bill-money-transfer'>￥"
                            }
                            if (document.getElementById("asset-detail-month-" + time) === null) {
                                //重置流入流出
                                flowIn = 0;
                                flowOut = 0;
                                if (bill.billType === "收入") {
                                    flowIn = math.add(math.bignumber(flowIn), math.bignumber(bill.money));
                                }
                                if (bill.billType === "支出") {
                                    flowOut = math.add(math.bignumber(flowOut), math.bignumber(bill.money));
                                }
                                var billHTML =
                                    `<div id="asset-detail-month-\${time}" class="content">
                                            <div class="title">
                                                <span class="month">\${timeShow}</span>
                                                <div class="in-out">
                                                    <span id="flow-in-\${time}" class="in"></span>
                                                    <span id="flow-out-\${time}" class="out"></span>
                                                </div>
                                            </div>
                                            <div id="bill-id-\${bill.id}" class="bill" onclick="getUpdateBill(\${bill.id})">
                                                <div \${colorClass}></div>
                                                <div class="bill-left">
                                                    <span class="bill-left-class">\${bill.billClass}</span>
                                                    <span class="bill-left-time">\${date}</span>
                                                    <span class="bill-left-description">\${bill.description}</span>
                                                </div>
                                                <div class="bill-right">
                                                    <span \${moneyClass}\${formatMoneyForCheckAsset(bill.money)}</span>
                                                    <span id="bill-right-asset-\${bill.id}" class="bill-right-asset \${moneyClass}"></span>
                                                </div>
                                            </div>
                                        </div>`;
                                assetDetailContent.innerHTML += billHTML;
                                document.getElementById("flow-in-" + time).innerText = "流入：￥" + formatMoneyForCheckAsset(flowIn);
                                document.getElementById("flow-out-" + time).innerText = "流出：￥" + formatMoneyForCheckAsset(flowOut);
                                document.getElementById("bill-right-asset-" + bill.id).innerText = document.getElementById("asset-detail-name").innerText;
                            } else {
                                if (bill.billType === "收入") {
                                    flowIn = math.add(math.bignumber(flowIn), math.bignumber(bill.money));
                                }
                                if (bill.billType === "支出") {
                                    flowOut = math.add(math.bignumber(flowOut), math.bignumber(bill.money));
                                }
                                var billDetailContent = document.getElementById("asset-detail-month-" + time);
                                var billHTML =
                                    `<div id="bill-id-\${bill.id}" class="bill" onclick="getUpdateBill(\${bill.id})">
                                                <div \${colorClass}></div>
                                                <div class="bill-left">
                                                    <span class="bill-left-class">\${bill.billClass}</span>
                                                    <span class="bill-left-time">\${date}</span>
                                                    <span class="bill-left-description">\${bill.description}</span>
                                                </div>
                                                <div class="bill-right">
                                                    <span \${moneyClass}\${formatMoneyForCheckAsset(bill.money)}</span>
                                                    <span id="bill-right-asset-\${bill.id}" class="bill-right-asset \${moneyClass}"></span>
                                                </div>
                                            </div>`;
                                billDetailContent.innerHTML += billHTML;
                                document.getElementById("flow-in-" + time).innerText = "流入：￥" + formatMoneyForCheckAsset(flowIn);
                                document.getElementById("flow-out-" + time).innerText = "流出：￥" + formatMoneyForCheckAsset(flowOut);
                                document.getElementById("bill-right-asset-" + bill.id).innerText = document.getElementById("asset-detail-name").innerText;
                            }
                        });
                    }
                } else {
                    console.error("请求失败");
                }
            }
        };
    }
    function getUpdateBill(billId) {
        getBillDetailMore(billId)
    }
</script>

<%--适配移动端--%>
<style>
  .back-button-2 {
    display: none;
    cursor: pointer;
  }
  .back-button-2:hover .iconfont {
    color: var(--blue);
  }
    @media (width <= 960px) {
      .asset-detail-form .asset-detail-right {
        width: 98%;
        padding: 10px 1%;
      }
      .asset-detail-form .sub-title {
        width: 94%;
        margin-left: 3%;
      }
      .asset-detail-form .content {
        width: 94%;
        margin-left: 3%;
      }
      .asset-detail-form .content .title {
        width: 100%;
      }
      .asset-detail-form .content .bill {
        width: 100%;
      }
      .back-button-2 {
        display: inline;
        position: absolute;
        top: 17px;
        left: 17px;
        z-index: 1000;
      }
      .asset-detail-form .big-title {
        position: absolute;
        left: 30px;
      }
    }
</style>