<%@ tag import="java.util.Objects" %>
<%@ tag import="com.dihaozhe.hebaocounter.entity.dto.Account" %>
<%@ tag import="com.dihaozhe.hebaocounter.entity.dto.AssetType" %>
<%@ tag import="java.util.List" %>
<%@ tag import="java.util.Arrays" %>
<%@ tag pageEncoding="UTF-8" language="java" %>
<%--点击修改按钮后显示修改资产详情 --%>
<style>
  .update-asset {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.25);
    z-index: 1000;
    transition: 0.1s;
    cursor: pointer;
    user-select: none;
  }
  .update-asset-container {
    position: fixed;
    top: 0;
    right: 0;
    width: 0;
    height: 100%;
    background: var(--background);
    transition: 0.5s;
    cursor: auto;
  }
  .update-asset-form {
    width: 100%;
  }
  .update-asset-container .title {
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
  .update-asset-form .content {
    width: 378px;
    border-radius: 12px;
    margin-top: 20px;
    margin-left: 10px;
    padding-top: 5px;
    padding-bottom: 15px;
    background: var(--white);
    border: 1px #f8fafb solid
  }
  .update-asset-container .sub-title {
    display: block;
    width: 100%;
    white-space: nowrap;
    overflow: hidden;
    padding: 10px 10px;
    font-size: 16px;
    font-weight: 500;
  }
  .update-asset-container .item {
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
  .update-asset-container .item:hover {
    background: var(--background);
  }
  .update-asset-form .update-asset-form-select {
    float: right;
    display: inline-block;
    margin-right: 21px;
    margin-left: 10px;
    height: 32px;
    font-size: 14px;
    line-height: 32px;
    vertical-align: middle;
    color: var(--blue);
    cursor: pointer;
  }
  .update-asset-form .asset-type-img {
    display: inline-block;
    float: right;
    height: 26px;
    width: 26px;
    margin-top: 3px;
    border-radius: 50%;
  }
  .update-asset-form .update-asset-form-input {
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
  .update-asset-form .update-asset-form-input::placeholder {
    color: var(--gray);
  }

  .update-asset-form #errorText {
    margin-left: 10px;
    font-size: 12px;
  }
  .update-asset-form .save-button {
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
  .update-asset-form .save-button:hover {
    opacity: 0.8;
  }
</style>
<div id="update-asset" class="update-asset" style="display: none" onclick="removeUpdateAsset()">
    <div id="update-asset-container" class="update-asset-container" onclick="event.cancelBubble = true">
        <div class="update-asset-form">
            <form action="../update-asset-servlet" method="post" onsubmit="return checkUpdateForm()">
                <input id="update-form-id" name="id" hidden="hidden">
                <span class="title">
                    <div class="back-button-3" onclick="removeUpdateAsset()"><span class="iconfont icon-back"></span></div>
                    修改资产
                </span>
                <div class="content">
                    <%
                        String accountId = "0";
                        if (Objects.nonNull(session.getAttribute("account"))) {
                            Account account = (Account) session.getAttribute("account");
                            accountId = String.valueOf(account.getId());
                        }
                    %>
                    <input id="update-form-account-id" name="account-id" type="text" value="<%=accountId%>" hidden="hidden">
                    <input id="update-form-asset-type" name="type" type="text" value="现金" hidden="hidden">
                    <span class="sub-title">输入资产信息</span>
                    <span class="item" onclick="getUpdateAssetType()">资产类型
                        <span id="update-asset-form-type"
                              class="update-asset-form-select">现金</span>
                        <img id="update-asset-form-img"
                             class="asset-type-img"
                             src="../public/asset/现金.png" alt="asset-type">
                    </span>
                    <span class="item">资产名称
                        <input id="update-asset-form-name"
                               class="update-asset-form-input"
                               name="name"
                               type="text"
                               placeholder="点此输入...">
                    </span>
                    <span class="item">初始金额
                        <input id="update-asset-form-money"
                               class="update-asset-form-input"
                               name="money"
                               type="text"
                               pattern="^\d+(\.\d{1,2})?\$"
                               oninput="validateUpdateAmount(this)"
                               placeholder="0.00">
                    </span>
                    <p id="update-errorText" style="color: var(--red); display: none;">请输入正确的金额</p>
                </div>
                <button class="save-button" type="submit">保 存</button>
            </form>
        </div>
        <div id="get-update-asset-type" style="display: none" class="get-asset-type" onclick="removeUpdateAssetType()">
            <div id="update-assets-type" class="assets-type" onclick="event.cancelBubble = true">
                <span class="sub-title">选择资产类型</span>
                <div class="asset-types">
                    <%
                        List<AssetType> assetTypes = Arrays.asList(AssetType.values());
                        for (int i = 0; i < assetTypes.size(); i++) {
                            AssetType assetType = assetTypes.get(i);
                    %>
                    <span class="item" onclick="setUpdateAssetType('<%=assetType.id%>', '<%=assetType.type%>')">
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
    function getUpdateAsset(id) {
        const xhr = new XMLHttpRequest()
        xhr.open("GET", '../get-asset-by-id-servlet?id='+id)
        xhr.send()
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    // 获取用于输出的<div>元素
                    var assetDetailMoreContent = document.getElementById("asset-detail-more-container");
                    assetDetailMoreContent.style.display = "none";
                    var data = JSON.parse(xhr.responseText);
                    if (data.asset.length !== 0) {
                        document.getElementById("update-form-id").value = id
                        document.getElementById("update-form-asset-type").value = data.asset.type
                        document.getElementById("update-asset-form-type").innerText = data.asset.type
                        document.getElementById("update-asset-form-img").src = "../public/asset/" + data.asset.type + ".png"
                        document.getElementById("update-asset-form-name").value = data.asset.name
                        document.getElementById("update-asset-form-money").value = data.asset.money
                    }
                } else {
                    console.error("请求失败");
                }
            }
        };
        document.querySelector("body").style.overflow="hidden";
        document.getElementById("update-asset").style.display = "";
        if ($(window).width() <=960) {
            setTimeout(function() {
                document.getElementById("update-asset-container").style.width = "100%";
            }, 10);
        } else {
            setTimeout(function() {
                document.getElementById("update-asset-container").style.width = "400px";
            }, 10);
        }
    }

    function removeUpdateAsset() {
        if (document.getElementById("get-update-asset-type").style.display === "none") {
            document.querySelector("body").style.overflow="";
            document.getElementById("update-asset-container").style.width = "0";
            setTimeout(function() {
                document.getElementById("update-asset").style.display = "none";
            }, 510);
        } else {
            removeUpdateAssetType();
        }
    }

    function getUpdateAssetType() {
        document.getElementById("get-update-asset-type").style.display = "";
        setTimeout(function() {
            document.getElementById("update-assets-type").style.height = "75%";
        }, 10);
    }

    function removeUpdateAssetType() {
        document.getElementById("update-assets-type").style.height = "0";
        setTimeout(function() {
            document.getElementById("get-update-asset-type").style.display = "none";
        }, 510);
    }

    function setUpdateAssetType(id, type) {
        document.getElementById("update-form-asset-type").value = type
        document.getElementById("update-asset-form-type").innerText = type;
        document.getElementById("update-asset-form-img").src = "../public/asset/" + type + ".png";
        removeUpdateAssetType();
    }
</script>

<%--适配移动端--%>
<style>
  .back-button-3 {
    display: none;
    cursor: pointer;
  }
  .back-button-3:hover .iconfont {
    color: var(--blue);
  }
  @media (width <= 960px) {
    .back-button-3 {
      display: inline;
      position: absolute;
      top: 10px;
      left: 17px;
      z-index: 1000;
    }
    .update-asset-container .title {
      padding: 10px 40px;
    }
    .update-asset-form .content {
      width: 96%;
      margin-left: 2%;
    }
    .update-asset-form .save-button {
      width: 96%;
      margin-left: 2%;
    }
  }
</style>