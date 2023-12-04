<%@ tag import="java.util.Arrays" %>
<%@ tag import="java.util.List" %>
<%@ tag import="com.dihaozhe.hebaocounter.dao.impl.AssetDaoImpl" %>
<%@ tag import="static com.dihaozhe.hebaocounter.utils.Money.formatMoney" %>
<%@ tag import="com.dihaozhe.hebaocounter.dao.impl.BillDaoImpl" %>
<%@ tag import="com.dihaozhe.hebaocounter.entity.dto.*" %>
<%@ tag import="java.util.Objects" %>
<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
<%--    创建账单圆形加号    --%>
        .add-bill {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            color: var(--white);
            background: var(--blue);
            z-index: 100;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
        }
        .add-bill:hover {
            opacity: 0.8;
        }
        .add-bill .iconfont {
            color: var(--white);
            position: relative;
            top: 10%;
            left: 13%;
            font-size: 36px;
        }

<%--    创建账单    --%>
        #bill {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            transition: 0.1s;
            cursor: pointer;
            user-select: none;
            z-index: 1000;
        }
        #bill-container {
            position: fixed;
            top: 0;
            right: 0;
            width: 0;
            height: 100%;
            white-space: nowrap;
            overflow: hidden;
            background: var(--background);
            transition: 0.5s;
            cursor: auto;
        }

<%--    账单类型选择：支出、收入、转账    --%>
        .bill-type {
            position: relative;
            top: 0;
            left: 0;
            width: 100%;
            height: 40px;
            background: var(--white);
            border-bottom: 2px solid var(--cutline);
            text-align: center;
        }
        .bill-type-item {
            display: inline-block;
            width: 65px;
            height: 38px;
            text-align: center;
            margin: 1px;
            border-radius: 4px 4px 0 0;
            border-bottom: 2px solid rgba(0,0,0,0);
            line-height: 38px;
            vertical-align: middle;
            font-size: 16px;
            font-weight: 500;
            transition: 0.3s;
            cursor: pointer;
        }
        .bill-type-item:hover {
             background: var(--background);
         }
        .bill-out {
            color: var(--red);
            border-bottom: 2px var(--red) solid;
        }
        .bill-in {
            color: var(--green);
            border-bottom: 2px var(--green) solid;
        }
        .bill-transfer {
            color: var(--blue);
            border-bottom: 2px var(--blue) solid;
        }

<%--    账单一级子类选择  --%>
        .bill-classes {
            position: relative;
            right: 0;
            background: var(--white);
            width: 400px;
            height: 100%;
            padding-bottom: 50px;
            font-size: 0;
            white-space: normal;
        }
        .bill-class {
            display: inline-block;
            background: var(--white);
            width: 80px;
            height: 75px;
            margin-bottom: 2px;
            border-radius: 8px;
            cursor: pointer;
            text-align: center;
            font-size: 12px;
            vertical-align: middle;
            white-space: nowrap;
            overflow-x: hidden;
        }
        .bill-class:hover {
            background: var(--background);
        }
        .bill-class .iconfont {
            display: block;
            font-size: 26px;
            width: 26px;
            height: 26px;
            margin-left: 19px;
            margin-top: 10px;
            color: #869099;
            background: #eaebec;
            border-radius: 50%;
            padding: 8px;
            transition: 0.3s;
        }
        .bill-class-name {

        }
        .bill-class-active-out {
            color: var(--red);
        }
        .bill-class-active-out .iconfont {
            color: var(--white);
            background: var(--red);
        }
        .bill-class-active-in {
            color: var(--green);
        }
        .bill-class-active-in .iconfont {
            color: var(--white);
            background: var(--green);
        }
        .bill-class-active-transfer {
            color: var(--blue);
        }
        .bill-class-active-transfer .iconfont {
            color: var(--white);
            background: var(--blue);
        }

<%--    账单账户选择  --%>
        #bill-assets {
            position: fixed;
            top: 0;
            right: 0;
            width: 400px;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 250;
            cursor: pointer;
        }
        #bill-assets-container {
            position: fixed;
            bottom: 0;
            right: 0;
            width: 400px;
            height: 0;
            border-radius: 12px 12px 0 0;
            background: var(--white);
            transition: 0.5s;
            cursor: auto;
            overflow: hidden;
        }
        .bill-assets-container-title {
            position: absolute;
            top: 0;
            right: 0;
            width: 100%;
            height: 40px;
            text-align: center;
            font-size: 16px;
            font-weight: 500;
            padding: 6px;
        }
        .bill-assets-container .asset-types {
            margin-top: 40px;
            background: var(--white);
            border-radius: 12px 12px 0 0;
            display: block;
            width: 100%;
            height: 90%;
            white-space: nowrap;
            padding: 10px 10px;
            font-size: 16px;
            overflow-y: scroll;
            overflow-x: hidden;
        }
        .bill-assets-container .item {
            position: relative;
            display: block;
            width: 100%;
            white-space: nowrap;
            overflow: hidden;
            padding: 10px 10px;
            font-size: 14px;
            height: 32px;
            line-height: 32px;
            vertical-align: middle;
            border-top: 1px #edf2f5 solid;
            transition: 0.3s;
            cursor: pointer;
            left: -10px;
        }
        .bill-assets-container .item:hover {
            background: var(--background);
        }
        .bill-assets-container .asset-type-img {
            display: inline-block;
            float: left;
            height: 26px;
            width: 26px;
            margin-top: 3px;
            border-radius: 50%;
        }
        .bill-assets-container .asset-type {
            margin-left: 10px;
        }
        .bill-assets-container .asset-name {
            margin-left: 0px;
        }
        .bill-assets-container .asset-money {
            float: right;
            margin-right: 10px;
        }

<%--    账单日期选择  --%>
        #bill-calendar {
            position: fixed;
            top: 0;
            right: 0;
            width: 400px;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 250;
            cursor: pointer;
        }
        #bill-calendar-container {
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
        .bill-calendar-container-title {
            position: absolute;
            top: 0;
            right: 0;
            width: 100%;
            height: 40px;
            text-align: center;
            font-size: 16px;
            font-weight: 500;
            padding: 6px;
        }
        .bill-calendar-container-date {
            position: absolute;
            top: 50px;
            right: 0;
            width: 100%;
            height: 100px;
            text-align: center;
        }
        #bill-form-asset {
            transition: 0.3s;
        }
        #bill-form-asset:hover {
            background: var(--bluegray);
        }
        #bill-form-asset:active {
            background: var(--bluegray);
        }
        #bill-form-time {
            transition: 0.3s;
        }
        #bill-form-time:hover {
            background: var(--bluegray);
        }
        #bill-form-time:active {
            background: var(--bluegray);
        }
        #date-input {
            padding: 3px;
            font-size: 16px;
            border-radius: 4px;
            border: 1px var(--blue) solid;
            width: 150px;
            cursor: pointer;
        }
        #time-input {
            padding: 3px;
            font-size: 16px;
            border-radius: 4px;
            border: 1px var(--blue) solid;
            width: 100px;
            cursor: pointer;
        }
        .bill-calendar-container-button {
            position: absolute;
            top: 100px;
            right: 0;
            width: 100%;
            height: 60px;
            text-align: center;
        }
        .bill-calendar-container-button button {
            width: 280px;
            border-radius: 12px;
            margin-top: 2px;
            border: none;
            background: var(--blue);
            color: var(--white);
            height: 32px;
            cursor: pointer;
            transition: 0.3s;
        }
        .bill-calendar-container-button button:hover {
            opacity: 0.8;
        }

<%--    账单计算器区  --%>
        .bill-form {
            position: absolute;
            bottom: 0;
            right: 0;
            background: var(--background);
            width: 100%;
            height: 290px;
            padding-top: 10px;
        }
        #bill-form-description {
            border: none;
            outline: none;
            background: none;
            text-align: left;
            position: relative;
            top: 0;
            left: 10px;
            height: 32px;
            width: 180px;
            font-size: 16px;
            line-height: 20px;
            vertical-align: middle;
            color: var(--blue);
        }
        #bill-form-description::placeholder {
            color: var(--gray);
        }
        #bill-form-money {
            border: none;
            outline: none;
            background: none;
            text-align: right;
            position: relative;
            top: 0;
            right: 30px;
            height: 32px;
            width: 180px;
            font-size: 24px;
            line-height: 20px;
            vertical-align: middle;
            color: var(--blue);
            cursor: auto;
        }
        #bill-form-money-type {
            border: none;
            outline: none;
            background: none;
            text-align: right;
            position: relative;
            top: 0;
            right: 30px;
            height: 32px;
            width: 20px;
            font-size: 16px;
            font-weight: 500;
            line-height: 20px;
            vertical-align: middle;
            color: var(--black);
        }
        #bill-form-information {
            width: 100%;
            height: 40px;
            padding-left: 4px;
        }
        #bill-form-asset {
            height: 36px;
            padding: 6px 16px;
            text-align: center;
            line-height: 40px;
            vertical-align: middle;
            background: var(--white);
            color: var(--gray);
            border-radius: 14px;
            font-size: 14px;
            margin-right: 10px;
            cursor: pointer;
        }
        #bill-form-time {
            height: 36px;
            padding: 6px 16px;
            text-align: center;
            line-height: 40px;
            vertical-align: middle;
            background: var(--white);
            color: var(--gray);
            border-radius: 14px;
            font-size: 14px;
            margin-right: 10px;
            cursor: pointer;
        }
        #bill-form-buttons {
            position: relative;
            right: 0;
            width: 400px;
            height: 100%;
            font-size: 0;
            white-space: normal;
        }
        .bill-form-button {
            display: inline-block;
            position: relative;
            width: 87.5px;
            height: 42px;
            margin-left: 8px;
            margin-top: 6px;
            background: var(--white);
            border-radius: 8px;
            cursor: pointer;
            text-align: center;
            font-size: 18px;
            font-weight: 500;
            line-height: 42px;
            vertical-align: middle;
            white-space: nowrap;
            overflow-x: hidden;
            transition: 0.3s;
        }
        .bill-form-button:hover {
            background: var(--background);
        }
        .bill-form-button:active {
            background: var(--bluegray);
        }
        #bill-form-button-cancel {
            color: var(--green);
        }
        #bill-form-button-clear {
            color: var(--red);
        }
        #bill-form-button-save {
            color: var(--blue);
        }
        .back-button {
          display: none;
        }
    @media (width <= 960px) {
      .add-bill {
        position: fixed;
        bottom: 0;
        left: 50%;
        right: 50%;
        transform: translate(-50%, -5%);
      }
      #bill-content {
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
        flex-direction: column;
      }
      .bill-classes {
        position: relative;
        width: 400px;
        margin-top: 20px;
        border-radius: 12px;
        right: 0;
        white-space: normal;
        flex-shrink: 0;
      }
      .bill-form {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
        height: 290px;
        padding-top: 10px;
        margin-bottom: 40px;
      }
      #bill-assets {
        width: 100%;
      }
      #bill-assets-container {
        width: 100%;
      }
      #bill-calendar {
        width: 100%;
      }
      #bill-calendar-container {
        width: 100%;
      }
      .bill-assets-container .asset-types {
        width: 98%;
      }
      #bill-classes-container {
        width: 100%;
        background: var(--white);
        display: flex;
        justify-content: center;
      }
      .back-button {
        display: inline;
        position: absolute;
        top: 10px;
        left: 10px;
      }
    }
</style>

<div class="add-bill" onclick="getBill()">
    <span class="iconfont icon-add" ></span>
</div>

<div id="bill"
     style="display: none"
     onclick="removeBill()">
    <div id="bill-container"
         onclick="event.cancelBubble = true">
        <%--    账单类型选择：支出、收入、转账    --%>
        <div class="bill-type">
            <div class="back-button" onclick="removeBill()"><span class="iconfont icon-back"></span></div>
            <div class="bill-type-item" onclick="getBillType(0)">支出</div>
            <div class="bill-type-item" onclick="getBillType(1)">收入</div>
            <div class="bill-type-item" onclick="getBillType(2)">转账</div>
        </div>
        <div id="bill-content">
            <div id="bill-classes-container">
                <div class="bill-classes">
                    <%
                        List<BillClass> billClasses = Arrays.asList(BillClass.values());
                        for (int i = 0; i < billClasses.size(); i++) {
                            BillClass billClass = billClasses.get(i);
                            if (billClass.level.equals("一级分类")) {
                    %>
                    <div id="bill-class-<%=billClass.id%>"
                         class="bill-class"
                         onclick="setBillClass(<%=billClass.id%>)">
                        <span class="iconfont icon-<%=billClass.icon%>"></span>
                        <span id="bill-class-name-<%=billClass.id%>"
                              class="bill-class-name"><%=billClass.name%></span>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <div class="bill-form">
                <form action="../create-bill-servlet" method="post" onsubmit="return checkBillForm()">
                    <%
                        String accountId = "0";
                        if (Objects.nonNull(session.getAttribute("account"))) {
                            Account account = (Account) session.getAttribute("account");
                            accountId = String.valueOf(account.getId());
                        }
                    %>
                    <button id="bill-submit-button" type="submit" hidden="hidden">提交</button>
                    <input id="bill-form-account-id" name="accountId" value="<%=accountId%>" hidden="hidden" />
                    <input id="bill-form-type" name="billType" value="" hidden="hidden" />
                    <input id="bill-form-class" name="billClass" value="" hidden="hidden" />
                    <input id="bill-form-description" name="description" placeholder="点此输入备注..." />
                    <input id="bill-form-money" name="money" value="0" maxlength="13" readonly />
                    <span id="bill-form-money-type">CNY</span>
                    <div id="bill-form-information">
                        <span id="bill-form-asset" onclick="getAssets()">选择账户</span>
                        <input id="bill-form-asset-id" name="assetId" hidden="hidden"/>
                        <span id="bill-form-time" onclick="getCalendar()"></span>
                        <input id="bill-input-time" name="time" hidden="hidden"/>
                    </div>
                    <div id="bill-form-buttons">
                        <span id="bill-form-button-1" class="bill-form-button" onclick="inputNumber(1)">1</span>
                        <span id="bill-form-button-2" class="bill-form-button" onclick="inputNumber(2)">2</span>
                        <span id="bill-form-button-3" class="bill-form-button" onclick="inputNumber(3)">3</span>

                        <span id="bill-form-button-cancel" class="bill-form-button" onclick="cancelMoney()">←</span>

                        <span id="bill-form-button-4" class="bill-form-button" onclick="inputNumber(4)">4</span>
                        <span id="bill-form-button-5" class="bill-form-button" onclick="inputNumber(5)">5</span>
                        <span id="bill-form-button-6" class="bill-form-button" onclick="inputNumber(6)">6</span>

                        <span id="bill-form-button-minus" class="bill-form-button" onclick="inputKey('-')">-</span>

                        <span id="bill-form-button-7" class="bill-form-button" onclick="inputNumber(7)">7</span>
                        <span id="bill-form-button-8" class="bill-form-button" onclick="inputNumber(8)">8</span>
                        <span id="bill-form-button-9" class="bill-form-button" onclick="inputNumber(9)">9</span>

                        <span id="bill-form-button-plus" class="bill-form-button" onclick="inputKey('+')">+</span>

                        <span id="bill-form-button-clear" class="bill-form-button" onclick="inputClear()">清空</span>

                        <span id="bill-form-button-0" class="bill-form-button" onclick="inputNumber(0)">0</span>

                        <span id="bill-form-button-dot" class="bill-form-button" onclick="inputDot('.')">.</span>

                        <span id="bill-form-button-save" class="bill-form-button" onclick="inputSave()">保存</span>
                    </div>
                </form>
            </div>
        </div>
        <div id="bill-assets"
             class="bill-assets"
             style="display: none"
             onclick="removeAssets()">
            <div id="bill-assets-container"
                 class="bill-assets-container"
                 onclick="event.cancelBubble = true">
                <div class="bill-assets-container-title">选择账户</div>
                <div class="asset-types">
                    <%
                        AssetDaoImpl assetDao = new AssetDaoImpl();
                        BillDaoImpl billDao = new BillDaoImpl();
                        List<Asset> myAssets = assetDao.readAssetsByAccountId(Integer.parseInt(accountId));
                        List<Bill> bills = null;
                        for (int i = 0; i < myAssets.size(); i++) {
                            double changeMoney = 0;
                            Asset myAsset = myAssets.get(i);
                            bills = billDao.readBillsByAssetId(myAsset.getId());
                            for (int j = 0; j < bills.size(); j++) {
                                Bill bill = bills.get(j);
                                if (bill.getBillType().equals("支出")) {
                                    changeMoney = changeMoney - bill.getMoney();
                                } else if (bill.getBillType().equals("收入")) {
                                    changeMoney = changeMoney + bill.getMoney();
                                }
                            }
                            myAsset.setMoney(myAsset.getMoney() + changeMoney);
                            String assetMoney;
                            if (myAsset.getMoney()>=0) {
                                assetMoney = "￥" + formatMoney(String.valueOf(myAsset.getMoney()));
                            } else {
                                assetMoney = "-￥" + formatMoney(String.valueOf(myAsset.getMoney() - myAsset.getMoney() - myAsset.getMoney()));
                            }
                    %>
                    <span class="item" onclick="setAsset('<%=myAsset.getId()%>', '<%=myAsset.getType()%>', '<%=myAsset.getName()%>')">
                        <img class="asset-type-img" src="../public/asset/<%=myAsset.getType()%>.png" alt="asset-type">
                        <span class="asset-type">[<%=myAsset.getType()%>]</span>
                        <span class="asset-name"><%=myAsset.getName()%></span>
                        <span class="asset-money"><%=assetMoney%></span>
                    </span>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <div id="bill-calendar"
             class="bill-calendar"
             style="display: none"
             onclick="removeCalendar()">
            <div id="bill-calendar-container"
                 class="bill-calendar-container"
                 onclick="event.cancelBubble = true">
                <div class="bill-calendar-container-title">选择日期</div>
                <div class="bill-calendar-container-date">
                    <input id="date-input" name="date" type="date" min="2000-01-01" max="9999-12-31">
                    <input id="time-input" name="time" type="time">
                </div>
                <div class="bill-calendar-container-button">
                    <button type="button" onclick="setBillTime()">确 定</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var billType = 0;
    var billClassOut = 1;
    var billClassIn = 23;
    document.getElementById("bill-form-type").value = "支出"
    document.getElementById("bill-form-class").value = "三餐"

    function checkBillForm() {
        if (document.getElementById("bill-form-asset-id").value === "") {
            getAssets()
            return false
        }
        return true
    }
    function getBill() {
        if ($(window).width() <= 960) {
            document.querySelector("body").style.overflow="hidden";
            getBillType(billType);
            document.getElementById("bill").style.display = "";
            setTimeout(function() {
                document.getElementById("bill-container").style.width = "100%";
            }, 10);
        } else {
            document.querySelector("body").style.overflow="hidden";
            getBillType(billType);
            document.getElementById("bill").style.display = "";
            setTimeout(function() {
                document.getElementById("bill-container").style.width = "400px";
            }, 10);
        }
    }

    function removeBill() {
        if ($(window).width() <= 960) {
            if (document.getElementById("bill-assets").style.display!=="none") {
                removeAssets()
            } else if (document.getElementById("bill-calendar").style.display!=="none") {
                removeCalendar()
            } else {
                document.querySelector("body").style.overflow="";
                document.getElementById("bill-container").style.width = "0";
                setTimeout(function() {
                    document.getElementById("bill").style.display = "none";
                }, 510);
            }
        } else {
            if (document.getElementById("bill-assets").style.display!=="none") {
                removeAssets()
            } else if (document.getElementById("bill-calendar").style.display!=="none") {
                removeCalendar()
            } else {
                document.querySelector("body").style.overflow="";
                document.getElementById("bill-container").style.width = "0";
                setTimeout(function() {
                    document.getElementById("bill").style.display = "none";
                }, 510);
            }
        }
    }

    function getBillType(type) {
        var elements = document.getElementsByClassName("bill-class");
        Array.prototype.forEach.call(elements, function (element) {
            element.className = 'bill-class';
        });
        if (type === 0) {
            document.getElementsByClassName("bill-type-item").item(0).className = "bill-type-item bill-out";
            document.getElementsByClassName("bill-type-item").item(1).className = "bill-type-item";
            document.getElementsByClassName("bill-type-item").item(2).className = "bill-type-item";
            document.getElementById("bill-class-" + billClassOut).className = "bill-class bill-class-active-out";
            billType = 0;
            document.getElementById("bill-form-type").value = "支出"
            document.getElementById("bill-form-class").value = document.getElementsByClassName("bill-class-active-out").item(0).lastElementChild.innerText;
            selectBillClasses();
        } else if (type === 1) {
            document.getElementsByClassName("bill-type-item").item(0).className = "bill-type-item";
            document.getElementsByClassName("bill-type-item").item(1).className = "bill-type-item bill-in";
            document.getElementsByClassName("bill-type-item").item(2).className = "bill-type-item";
            document.getElementById("bill-class-" + billClassIn).className = "bill-class bill-class-active-in";
            document.getElementById("bill-form-class").value = document.getElementsByClassName("bill-class-active-in").item(0).lastElementChild.innerText;
            billType = 1;
            document.getElementById("bill-form-type").value = "收入"
            selectBillClasses();
        } else if (type === 2)  {
            document.getElementsByClassName("bill-type-item").item(0).className = "bill-type-item";
            document.getElementsByClassName("bill-type-item").item(1).className = "bill-type-item";
            document.getElementsByClassName("bill-type-item").item(2).className = "bill-type-item bill-transfer";
            billType = 2;
            document.getElementById("bill-form-type").value = "转账"
            document.getElementById("bill-form-class").value = "转账";
            selectBillClasses();
        }
    }

    function setBillClass(id) {
        var elements = document.getElementsByClassName("bill-class");
        Array.prototype.forEach.call(elements, function (element) {
            element.className = 'bill-class';
        });
        if (billType === 0) {
            billClassOut = id;
            document.getElementById("bill-class-" + id).className = "bill-class bill-class-active-out"
            document.getElementById("bill-form-class").value = document.getElementById("bill-class-name-" + id).innerText
        } else if (billType === 1) {
            billClassIn = id;
            document.getElementById("bill-class-" + id).className = "bill-class bill-class-active-in"
            document.getElementById("bill-form-class").value = document.getElementById("bill-class-name-" + id).innerText
        } else if (billType === 2) {
            document.getElementById("bill-class-" + id).className = "bill-class bill-class-active-transfer"
            document.getElementById("bill-form-class").value = document.getElementById("bill-class-name-" + id).innerText
        }
    }

    function selectBillClasses() {
        var elements = document.getElementsByClassName("bill-class");
        Array.prototype.forEach.call(elements, function (element) {
            element.style.display = 'none';
        });
        if (billType === 0) {
            Array.prototype.forEach.call(elements, function (element) {
                for (var i = 1; i < 23; i++) {
                    document.getElementById("bill-class-" + i).style.display = "";
                }
            });
        } else if (billType === 1) {
            Array.prototype.forEach.call(elements, function (element) {
                for (var i = 23; i < 29; i++) {
                    document.getElementById("bill-class-" + i).style.display = "";
                }
            });
        } else if (billType === 2) {
            elements = document.getElementsByClassName("bill-class");
            Array.prototype.forEach.call(elements, function (element) {
                element.style.display = 'none';
            });
        }
    }
    // 资产相关
    function setAsset(assetId, assetType, assetName) {
        document.getElementById("bill-form-asset-id").value = assetId;
        document.getElementById("bill-form-asset").innerText = "[" + assetType + "]" + assetName
        removeAssets();
    }

    // 查看资产
    function getAssets() {
        document.getElementById("bill-assets").style.display = "";
        setTimeout(function() {
            document.getElementById("bill-assets-container").style.height = "600px";
        }, 10);
    }
    // 移除资产
    function removeAssets() {
        document.getElementById("bill-assets-container").style.height = "0";
        setTimeout(function() {
            document.getElementById("bill-assets").style.display = "none";
        }, 510);
    }

    // 日期相关
    var calendar = 0;
    if (calendar === 0) {
        var billTime = new Date();
        var billYear = billTime.getFullYear();
        var billMonth = billTime.getMonth() + 1;
        var billDate = billTime.getDate();
        var billHours = billTime.getHours();
        var billMinutes = billTime.getMinutes();
        // 格式化为"yyyy-mm-dd"的日期字符串
        var formattedDate = billYear + "-" + (billMonth < 10 ? "0" + billMonth : billMonth) + "-" + (billDate < 10 ? "0" + billDate : billDate);

        // 格式化为"hh-MM"的日期字符串
        var formattedTime = (billHours < 10 ? "0" + billHours : billHours) + ":" + (billMinutes < 10 ? "0" + billMinutes : billMinutes);
        // 动态设置默认值
        document.getElementById("date-input").value = formattedDate;
        document.getElementById("time-input").value = formattedTime;
        document.getElementById("bill-form-time").innerText = "今天 " + formattedTime;
        document.getElementById("bill-input-time").value = formattedDate + " " + formattedTime;
        calendar = 1;
    }

    // 查看日历
    function getCalendar() {
        document.getElementById("bill-calendar").style.display = "";
        setTimeout(function() {
            document.getElementById("bill-calendar-container").style.height = "200px";
        }, 10);
    }
    // 移除日历
    function removeCalendar() {
        document.getElementById("bill-calendar-container").style.height = "0";
        setTimeout(function() {
            document.getElementById("bill-calendar").style.display = "none";
        }, 310);
    }
    // 保存日期
    function setBillTime() {
        var date = document.getElementById("date-input").value
        var time = document.getElementById("time-input").value
        if (date === formattedDate || date === "") {
            var datetime = "今天 " + time
        } else {
            var datetime = date + " " + time
        }
        if (date === "") {
            date = formattedDate
            document.getElementById("date-input").value = formattedDate
        }
        document.getElementById("bill-form-time").innerText = datetime;
        document.getElementById("bill-input-time").value = date + " " + time;
        removeBill()
    }

    // 计算器相关方法
    var counter = 0;

    // 获取当前金额
    function getMoney() {
        return document.getElementById("bill-form-money").value;
    }

    // 设置当前金额
    function setMoney(money) {
        document.getElementById("bill-form-money").value = money;
    }

    // 获取字符串倒数第i个字符
    function getReverse(money, i) {
        // 判断当前金额长度是否小于i
        if (money.length < i) {
            return null
        } else {
            return money.substr(-i).substr(0,1)
        }
    }

    // 获取金额整数部分
    function getIntPart(money) {
        number = money.split(".");
        return intPart = number[0]
    }

    // 获取金额小数部分
    function getFloatPart(money) {
        number = money.split(".");
        return floatPart = number[1].substr(0,2)
    }

    // 回退按键校验机制
    function cancelMoney() {
        if (getMoney().length === 1) {
            setMoney("0")
        } else {
            setMoney(getMoney().substr(0, getMoney().length - 1))
        }
    }

    // 数字按键校验机制
    function inputNumber(number) {
        if (getMoney().length===13) {
            alert("达到最大输入长度")
            return null
        }
        if (getMoney()==="0") {
            setMoney(number)
        } else {
            if (getMoney().length>3) {
                // 获取money最后一个字符和倒数第三个字符
                var char3 = getMoney().slice(-3).slice(0,1);
                var char1 = getMoney().slice(-1);
                if (!getMoney().includes("+") && !getMoney().includes("-")) {
                    if (char3===".") {
                        return null
                    } else {
                        setMoney(getMoney()+number)
                        return null
                    }
                } else {
                    if (char1!=="+" && char1!=="-") {
                        if (char3===".") {
                            return null
                        } else {
                            setMoney(getMoney()+number)
                            return null
                        }
                    } else {
                        setMoney(getMoney()+number)
                        return null
                    }
                }
            } else {
                setMoney(getMoney()+number)
                return null
            }
        }
    }

    // 小数点按钮校验机制
    function inputDot(dot) {
        if (getMoney().length===13) {
            alert("达到最大输入长度")
            return null
        }
        if (getMoney() === "0") {
            setMoney(getMoney()+dot)
        }

        // 判断当前money是单个金额还是表达式
        if (getMoney().includes("+") || getMoney().includes("-")) {
            if (getReverse(getMoney(),1) === "+" || getReverse(getMoney(),1) === "-") {
                if (getMoney().includes(".")) {
                    return null
                } else {
                    setMoney(getMoney().substr(0, getMoney().length - 1) + dot)
                }
            } else {
                if (getReverse(getMoney(),1) === ".") {
                    return null
                }
                if (getMoney().includes("+")) {
                    var number = getMoney().split("+")
                    if (number[1].includes(".")) {
                        return null
                    } else {
                        setMoney(getMoney()+dot)
                    }
                }
                if (getMoney().includes("-")) {
                    var number = getMoney().split("-")
                    if (number[1].includes(".")) {
                        return null
                    } else {
                        setMoney(getMoney()+dot)
                    }
                }
            }
        } else {
            if (getMoney().includes(".")) {
                return null
            } else {
                setMoney(getMoney()+dot)
            }
        }
    }

    // 加减按钮校验机制
    function inputKey(key) {
        if (getMoney().length===13) {
            alert("达到最大输入长度")
            return null
        }
        let number;
        if (getMoney()==="0") {
            return null
        }
        if (getMoney().substr(-1)===".") {
            setMoney(getMoney().substr(0, getMoney().length - 1))
        }
        if (getMoney().includes("+")) {
            if (getMoney().substr(-1)==="+") {
                setMoney(getMoney().substr(0, getMoney().length - 1) + key)
            } else {
                var numbers = getMoney().split("+")
                counter = math.add(math.bignumber(numbers[0]), math.bignumber(numbers[1]))
                setMoney(counter)
                if (getMoney().includes(".")) {
                    number = getMoney().split(".");
                    counter = number[0] + "." + number[1].substr(0,2)
                }
                setMoney(counter)
            }
        }

        if (getMoney().includes("-")) {
            if (getMoney().substr(-1)==="-") {
                setMoney(getMoney().substr(0, getMoney().length - 1) + key)
            } else {
                var numbers = getMoney().split("-");
                counter = math.subtract(math.bignumber(numbers[0]), math.bignumber(numbers[1]))
                setMoney(counter)
                if (counter > 0) {
                    if (getMoney().includes(".")) {
                        number = getMoney().split(".");
                        counter = number[0] + "." + number[1].substr(0,2)
                    }
                    setMoney(counter)
                } else {
                    setMoney("0")
                    counter = 0;
                    return null
                }
            }
        }

        if (!getMoney().includes("+") && !getMoney().includes(("-"))) {
            setMoney(getMoney() + key)
        }
    }

    // 保存按钮校验机制
    function inputSave() {
        if (document.getElementById("bill-form-account-id").value === "0") {
            alert("请登录使用此功能")
        } else {
            if (getMoney().substr(-1)==="+" || getMoney().substr(-1)==="-" || getMoney().substr(-1) === ".") {
                setMoney(getMoney().substr(0, getMoney().length - 1))
                document.getElementById("")
            }
            // 判断当前money是单个金额还是表达式
            if (getMoney().includes("+") || getMoney().includes("-")) {
                if (getReverse(getMoney(),1) === "+" || getReverse(getMoney(),1) === "-") {
                    // 单个金额
                    // x.0+
                    if (getReverse(getMoney(),3)==="." && getReverse(getMoney(),2)==="0") {
                        setMoney(getMoney().substr(0, getMoney().length - 3))
                    }
                    // x.00-
                    if (getReverse(getMoney(),4)==="." && getReverse(getMoney(),3)==="0" && getReverse(getMoney(),2)==="0") {
                        setMoney(getMoney().substr(0, getMoney().length - 4))
                    }
                } else {
                    // 表达式
                    if (getMoney().includes("+")) {
                        if (getMoney().substr(-1)==="+") {
                            setMoney(getMoney().substr(0, getMoney().length - 1) + key)
                        } else {
                            var numbers = getMoney().split("+")
                            counter = math.add(math.bignumber(numbers[0]), math.bignumber(numbers[1]))
                            setMoney(counter)
                            if (getMoney().includes(".")) {
                                number = getMoney().split(".");
                                counter = number[0] + "." + number[1].substr(0,2)
                            }
                            setMoney(counter)
                        }
                    }
                    if (getMoney().includes("-")) {
                        if (getMoney().substr(-1)==="-") {
                            setMoney(getMoney().substr(0, getMoney().length - 1) + key)
                        } else {
                            var numbers = getMoney().split("-")
                            counter = math.subtract(math.bignumber(numbers[0]), math.bignumber(numbers[1]))
                            setMoney(counter)
                            if (counter > 0) {
                                if (getMoney().includes(".")) {
                                    number = getMoney().split(".")
                                    counter = number[0] + "." + number[1].substr(0,2)
                                }
                                setMoney(counter)
                            } else {
                                setMoney("0")
                                counter = 0;
                                return null
                            }
                        }
                    }
                    if (getMoney().includes(".")) {
                        number = getMoney().split(".");
                        counter = number[0] + "." + number[1].substr(0,2)
                    }
                    setMoney(counter)
                    if (getReverse(getMoney(),2)==="." && getReverse(getMoney(),1)==="0") {
                        setMoney(getMoney().substr(0, getMoney().length - 2))
                    }
                    // x.00
                    if (getReverse(getMoney(),3)==="." && getReverse(getMoney(),2)==="0" && getReverse(getMoney(),1)==="0") {
                        setMoney(getMoney().substr(0, getMoney().length - 3))
                    }
                    // x.x0
                    if (getReverse(getMoney(),3)==="." && getReverse(getMoney(),2)!=="0" && getReverse(getMoney(),1)==="0") {
                        setMoney(getMoney().substr(0, getMoney().length - 1))
                    }
                }
            } else {
                // 单个金额
                // x.0
                if (getReverse(getMoney(),2)==="." && getReverse(getMoney(),1)==="0") {
                    setMoney(getMoney().substr(0, getMoney().length - 2))
                }
                // x.00
                if (getReverse(getMoney(),3)==="." && getReverse(getMoney(),2)==="0" && getReverse(getMoney(),1)==="0") {
                    setMoney(getMoney().substr(0, getMoney().length - 3))
                }
                // x.x0
                if (getReverse(getMoney(),3)==="." && getReverse(getMoney(),2)!=="0" && getReverse(getMoney(),1)==="0") {
                    setMoney(getMoney().substr(0, getMoney().length - 1))
                }
            }
            if (getMoney() !== "0") {
                document.getElementById("bill-submit-button").click();
            } else {
                let r = confirm("当前账单金额为0，确定要保存吗");
                if (r === true) {
                    document.getElementById("bill-submit-button").click();
                }
            }
        }
    }

    // 归零按钮校验机制
    function inputClear() {
        setMoney("0")
        counter = 0;
    }
</script>