<%--suppress ALL --%>
<%@ tag import="com.dihaozhe.hebaocounter.entity.dto.AssetType" %>
<%@ tag import="java.util.Arrays" %>
<%@ tag import="java.util.List" %>
<%@ tag import="java.util.Objects" %>
<%@ tag import="com.dihaozhe.hebaocounter.entity.dto.Account" %>
<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    #add-asset {
      width: 100%;
      height: 100%;
      position: fixed;
      top: 0;
      z-index: 1000;
      background: rgba(0, 0, 0, 0.5);
      display: none;
    }
    #add-asset-container {
      width: 0;
      height: 100%;
      position: fixed;
      right: 0;
      background: var(--background);
      transition: 0.3s;
    }
    .create-asset-form {
      user-select: none;
      width: 100%;
    }
    .create-asset-container .title {
      display: block;
      width: 100%;
      height: 32px;
      padding: 10px 20px;
      line-height: 32px;
      vertical-align: middle;
      white-space: nowrap;
      overflow: hidden;
      font-size: 21px;
      font-weight: 500;
      background: var(--white);
      border-bottom: 1px #f8fafb solid;
    }
    .create-asset-form .content {
      width: 378px;
      border-radius: 12px;
      margin-top: 20px;
      margin-left: 10px;
      padding-top: 5px;
      padding-bottom: 15px;
      background: var(--white);
      border: 1px #f8fafb solid
    }
    .create-asset-container .sub-title {
      display: block;
      width: 100%;
      white-space: nowrap;
      overflow: hidden;
      padding: 10px 10px;
      font-size: 16px;
      font-weight: 500;
    }
    .create-asset-container .item {
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
    }
    .create-asset-container .item:hover {
      background: var(--background);
    }
    .create-asset-form .create-asset-form-select {
      float: right;
      display: inline-block;
      margin-right: 21px;
      margin-left: 10px;
      height: 32px;
      font-size: 14px;
      line-height: 32px;
      vertical-align: middle;
      color: var(--theme-6);
      cursor: pointer;
    }
    .create-asset-form .asset-type-img {
      display: inline-block;
      float: right;
      height: 26px;
      width: 26px;
      margin-top: 3px;
      border-radius: 50%;
    }
    .create-asset-form .create-asset-form-input {
      border: none;
      outline: none;
      background: none;
      float: right;
      text-align: right;
      position: relative;
      top: -2px;
      height: 32px;
      width: 280px;
      font-size: 14px;
      line-height: 20px;
      vertical-align: middle;
      right: 20px;
      color: var(--blue);
    }
    .create-asset-form .create-asset-form-input::placeholder {
      color: var(--gray);
    }
    input:-internal-autofill-previewed,
    input:-internal-autofill-selected {
      -webkit-text-fill-color: var(--blue);
      transition: background-color 1000s ease-out 0.5s;
    }
    .create-asset-form #errorText {
      margin-left: 10px;
      font-size: 12px;
    }
    .update-asset-form #update-errorText {
      margin-left: 10px;
      font-size: 12px;
    }
    .create-asset-form .save-button {
      width: 378px;
      border-radius: 12px;
      margin-top: 20px;
      margin-left: 10px;
      border: none;
      background: var(--blue);
      color: var(--white);
      height: 32px;
      cursor: pointer;
      transition: 0.3s;
    }
    .create-asset-form .save-button:hover {
      opacity: 0.8;
    }
    .create-asset-form .save-button:active {
      transform: scale(95%);
    }
    .get-asset-type {
      position: fixed;
      top: 0;
      right: 0;
      width: 400px;
      height: 100%;
      background: rgba(0, 0, 0, 0.6);
      z-index: 250;
      cursor: pointer;
    }
    .assets-type {
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
    .assets-type .sub-title {
      position: fixed;
      border-radius: 12px 12px 0 0;
      display: block;
      width: 100%;
      height: 20px;
      white-space: nowrap;
      overflow: hidden;
      padding: 10px 10px;
      font-size: 16px;
      font-weight: 500;
      z-index: 300;
    }
    .assets-type .asset-types {
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
    .assets-type .asset-types .item {
      position: relative;
      left: -10px;
      width: 400px;
    }
    .assets-type .asset-type-img {
      display: inline-block;
      float: left;
      height: 26px;
      width: 26px;
      margin-top: 3px;
      border-radius: 50%;
    }
    .assets-type .asset-type {
      margin-left: 10px;
    }
    @media (width <= 960px) {
      #add-asset-container {
        width: 100%;
        height: 0;
        position: fixed;
        bottom: 0;
        background: var(--background);
        border-radius: 12px 12px 0 0;
        transition: 0.3s;
      }
      .create-asset-form .content {
        width: 96%;
        border-radius: 12px;
        margin-top: 20px;
        margin-left: 2%;
        margin-right: 2%;
        padding-top: 5px;
        padding-bottom: 15px;
        background: var(--white);
        border: 1px #f8fafb solid;
      }

      .create-asset-form .save-button {
        width: 96%;
        border-radius: 12px;
        margin-top: 20px;
        margin-left: 2%;
        margin-right: 2%;
        border: none;
        background: var(--blue);
        color: var(--white);
        height: 32px;
        cursor: pointer;
        transition: 0.3s;
      }

      .get-asset-type {
        position: fixed;
        top: 0;
        bottom: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.6);
        z-index: 250;
        cursor: pointer;
      }
      .assets-type {
        position: fixed;
        bottom: 0;
        right: 0;
        width: 100%;
        height: 0;
        border-radius: 12px 12px 0 0;
        background: var(--white);
      }
      .assets-type .asset-types .item {
        position: relative;
        left: -10px;
        width: 100%;
      }
    }
</style>

<%-- 创建资产面板 --%>
<div id="add-asset">
    <div id="add-asset-container" class="create-asset-container" onclick="event.cancelBubble = true">
        <div class="create-asset-form">
            <form action="../create-asset-servlet" method="post" onsubmit="return checkForm()">
                <span class="title">添加资产</span>
                <div class="content">
                    <%
                        String accountId = "0";
                        if (Objects.nonNull(session.getAttribute("account"))) {
                            Account account = (Account) session.getAttribute("account");
                            accountId = String.valueOf(account.getId());
                        }
                    %>
                    <input id="form-account-id" name="account-id" type="text" value="<%=accountId%>" hidden="hidden">
                    <input id="form-asset-type" name="type" type="text" value="现金" hidden="hidden">
                    <span class="sub-title">输入资产信息</span>
                    <span class="item" onclick="getAssetType()">资产类型
                        <span id="create-asset-form-type"
                              class="create-asset-form-select">现金</span>
                        <img id="create-asset-form-img"
                             class="asset-type-img"
                             src="../public/asset/现金.png" alt="asset-type">
                    </span>
                    <span class="item">资产名称
                        <input id="create-asset-form-name"
                               class="create-asset-form-input"
                               name="name"
                               type="text"
                               placeholder="点此输入...">
                    </span>
                    <span class="item">初始金额
                        <input id="create-asset-form-money"
                               class="create-asset-form-input"
                               name="money"
                               type="text"
                               pattern="^\d+(\.\d{1,2})?\$"
                               oninput="validateAmount(this)"
                               placeholder="0.00">
                    </span>
                    <p id="errorText" style="color: var(--red); display: none;">请输入正确的金额</p>
                </div>
                <button class="save-button" type="submit">保 存</button>
            </form>
        </div>
        <div id="get-asset-type" style="display: none" class="get-asset-type" onclick="removeAssetType()">
            <div id="assets-type" class="assets-type" onclick="event.cancelBubble = true">
                <span class="sub-title">选择资产类型</span>
                <div class="asset-types">
                    <%
                        List<AssetType> assetTypes = Arrays.asList(AssetType.values());
                        for (int i = 0; i < assetTypes.size(); i++) {
                            AssetType assetType = assetTypes.get(i);
                    %>
                    <span class="item" onclick="setAssetType('<%=assetType.id%>', '<%=assetType.type%>')">
                        <img class="asset-type-img" src="../public/asset/<%=assetType.type%>.png" alt="asset-type">
                        <span class="asset-type"><%=assetType.type%></span>
                    </span>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // 加号绑定点击事件控制新增资产弹窗
    $('#header-add-button').css({display:"block"}).click(function () {
        $('#add-asset').css({display: 'block'})
        if ($(window).width() > '960') {
            setTimeout(function () {
                $('#add-asset-container').css({width: '400px'})
            }, 10)
        } else {
            $('#sidebar').css({display: 'none'})
            setTimeout(function () {
                $('#add-asset-container').css({height: '600px'})
            }, 10)
        }
    })

    $('#add-asset').click(function () {
        if ($(window).width() > '960') {
            if (document.getElementById("get-asset-type").style.display === "none") {
                $('#add-asset-container').css({width: '0px'})
                setTimeout(function () {
                    $('#add-asset').css({display: 'none'})
                }, 300)
            } else {
                removeAssetType();
            }
        } else {
            $('#sidebar').css({display: 'none'})
            $('#add-asset-container').css({height: '0px'})
            setTimeout(function () {
                $('#add-asset').css({display: 'none'})
            }, 300)
        }
    })

    function getAssetType() {
        document.getElementById("get-asset-type").style.display = "";
        setTimeout(function() {
            document.getElementById("assets-type").style.height = "75%";
        }, 10);
    }

    function removeAssetType() {
        document.getElementById("assets-type").style.height = "0";
        setTimeout(function() {
            document.getElementById("get-asset-type").style.display = "none";
        }, 510);
    }

    function validateAmount(input) {
        const regex = /^\d+(\.\d{0,2})?\$/;
        const amount = input.value;

        if (regex.test(amount) || amount === "") {
            document.getElementById("errorText").style.display = "none";
        } else {
            document.getElementById("errorText").style.display = "block";
        }
    }

    function validateUpdateAmount(input) {
        const regex = /^\d+(\.\d{0,2})?\$/;
        const amount = input.value;

        if (regex.test(amount) || amount === "") {
            document.getElementById("update-errorText").style.display = "none";
        } else {
            document.getElementById("update-errorText").style.display = "block";
        }
    }

    function checkForm() {
        const accountId = document.getElementById("form-account-id").value;
        const name = document.getElementById("create-asset-form-name").value;
        const money = document.getElementById("create-asset-form-money").value;

        if (accountId === "0") {
            alert("请登录使用此功能");
            return false;
        } else if (name === "") {
            alert("请输入资产名称");
            return false;
        } else if (money === "") {
            document.getElementById("create-asset-form-money").value = 0;
            return true;
        }
        return true;
    }

    function checkUpdateForm() {
        const accountId = document.getElementById("form-account-id").value;
        const name = document.getElementById("update-asset-form-name").value;
        const money = document.getElementById("update-asset-form-money").value;

        if (accountId === "0") {
            alert("请登录使用此功能");
            return false;
        } else if (name === "") {
            alert("请输入资产名称");
            return false;
        } else if (money === "") {
            document.getElementById("update-asset-form-money").value = 0;
            return true;
        }
        return true;
    }

    function setAssetType(id, type) {
        document.getElementById("form-asset-type").value = type;
        document.getElementById("create-asset-form-type").innerText = type;
        document.getElementById("create-asset-form-img").src = "../public/asset/" + type + ".png";
        removeAssetType();
    }
</script>