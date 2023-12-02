<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
    /*适配pc端*/
    @media (width > 960px) {
      main {
        margin-left: 200px;
        margin-right: 150px;
        display: flex;
        justify-content: center;
      }
    }
    #asset-total {
      width: 97%;
      height: 140px;
      margin-bottom: 1%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      user-select: none;
    }
    #borrow-in-total {
      width: 48%;
      height: 80px;
      margin-right: 0.5%;
    }
    #borrow-out-total {
      width: 48%;
      height: 80px;
      margin-left: 0.5%;
    }
    .asset-card {
      background: var(--white);
      border-radius: 12px;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      user-select: none;
    }
    .label {
      font-size: 12px;
      color: var(--gray);
    }
    .item-2 {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
    }
    .item-2-1 {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      width: 50%;
    }
    .item-2-2 {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      width: 50%;
    }
    .net-asset-money{
      display: block;
      font-size: 21px;
      font-weight: 700;
      color: var(--black);
      margin-bottom: 20px;
    }
    .total-asset-money{
      display: block;
      font-size: 18px;
      font-weight: 700;
      color: var(--black);
    }
    .total-debt-money{
      display: block;
      font-size: 18px;
      font-weight: 700;
      color: var(--black);
    }
    .total-borrow-in-money{
      display: block;
      font-size: 18px;
      font-weight: 700;
      color: var(--black);
    }
    .total-borrow-out-money{
      display: block;
      font-size: 18px;
      font-weight: 700;
      color: var(--black);
    }
    #asset-list {
      background: var(--white);
      width: 97%;
      padding: 20px 0;
      margin-top: 1%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      user-select: none;
      border-radius: 12px;
    }
    .asset-item {
      height: 39px;
      width: 95%;
      background: var(--white);
      border-top: 1px solid var(--bluegray);
      padding: 10px 2.5%;
      display: flex;
      justify-content: center;
      align-items: center;
      user-select: none;
      cursor: pointer;
    }
    .asset-item:hover {
      background: var(--bluegray);
    }
    @media(width <= 960px) {
      #asset-total {
        margin-bottom: 10px;
      }
      #asset-list {
        margin-top: 10px;
      }
    }
</style>

<main>
    <div id="asset-total" class="asset-card">
        <div class="item-1">
            <span class="label">净资产</span>
        </div>
        <span id="netMoney" class="net-asset-money"></span>
        <div class="item-2">
            <div class="item-2-1">
                <span class="label">总资产</span>
                <span id="totalAsset" class="total-asset-money"></span>
            </div>
            <div class="item-2-2">
                <span class="label">总负债</span>
                <span id="totalDebt" class="total-debt-money"></span>
            </div>
        </div>
    </div>
    <div id="borrow-in-total" class="asset-card">
        <span class="label">总借入</span>
        <span id="totalBorrowIn" class="total-borrow-in-money"></span>
    </div>
    <div id="borrow-out-total" class="asset-card">
        <span class="label">总借出</span>
        <span id="totalBorrowOut" class="total-borrow-out-money"></span>
    </div>
    <div id="asset-list">
        <div style="display: flex; width: 95%; margin-bottom: 20px">
            <span class="asset-list-title" style="margin-right: auto; font-weight: 500">资产列表</span>
            <span id="totalAssetList" class="asset-list-money" style="margin-left: auto; font-weight: 500"></span>
        </div>
        <div id="asset-items" style="width: 100%">
        </div>
    </div>
</main>

<script>
    let accountId = '${account.id}'
    let netMoney = '￥0.00'  // 净资产
    let totalAsset = '￥0.00'  // 总资产
    let totalDebt = '￥0.00'  // 总负债
    let totalBorrowIn = '￥0.00'  // 总借入
    let totalBorrowOut = '￥0.00'  // 总借出
    let totalAssetList = '￥0.00'  // 资产列表总额

    if (accountId !== '') {
    $.ajax({
            url: '../get-assets-servlet',
            type: 'POST',
            data: { id: accountId },
            success: function(data) {
                totalAssetList = data.assetVO.totalAssetList
                $('#totalAssetList').text(totalAssetList)
                let assets = data.assetVO.assets
                // 循环遍历数据，并将每个数据插入到指定的 DOM 元素中
                $.each(assets, function(index, asset) {
                    var html =
                        '<div class="asset-item">'+
                            '<img class="asset-item-img" style="width: 30px; border-radius: 50%; margin-right: 10px" alt="item" src="../public/asset/' + asset.type + '.png"/>'+
                            '<span class="asset-item-title" style="margin-right: auto; font-weight: 500">' + asset.name + '</span>'+
                            '<span class="asset-item-money" style="margin-left: auto; font-weight: 500">' + formatMoney(asset.money) + '</span>'+
                        '</div>'
                $('#asset-list').append(html); // 将每个资产项追加到指定的容器中
                });
            },
            error: function(xhr, status, error) {
                console.log('请求出错:', error);  // 可选的错误处理
            }
        });
    }

    // 将数据插入到页面
    $('#netMoney').text(netMoney)
    $('#totalAsset').text(totalAsset)
    $('#totalDebt').text(totalDebt)
    $('#totalBorrowIn').text(totalBorrowIn)
    $('#totalBorrowOut').text(totalBorrowOut)
    $('#totalAssetList').text(totalAssetList)
</script>