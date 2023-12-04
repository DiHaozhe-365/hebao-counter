<%@ tag pageEncoding="UTF-8" language="java" %>
<%@ taglib tagdir="/WEB-INF/tags/common/home" prefix="home" %>
<style>
    main {
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;
      margin-left: 220px;
      margin-right: 210px;
    }
    #month-summary {
      display: flex;
      justify-content: space-between;
      width: 100%;
    }
    .month-summary-item {
      height: 140px;
      width: 33%;
      border-radius: 12px;
      display: flex;
      justify-content: space-evenly;
      align-items: center;
    }
    #month-outcome {
      background: #F4E5E6;
    }
    #month-income {
      background: #E0EFE8;
    }
    #month-balance {
      background: #E2EBF5;
    }
    .month-summary-item .iconfont {
      color: var(--white);
      width: 28px;
      font-size: 28px;
      padding: 5px;
      border-radius: 50%;
      margin-right: 15px;
      margin-left: 30px;
    }
    #month-outcome .iconfont {
      background: #EB595E;
    }
    #month-income .iconfont {
      background: #24B87A;
    }
    #month-balance .iconfont {
      background: #3792FA;
    }
    .month-summary-item-sum {
      display: flex;
      flex-direction: column;
      flex: 1;
    }
    .month-summary-item-sum-money {
      font-size: 16px;
      font-weight: 700;
    }
    #month-outcome-charts {
      display: flex;
      justify-content: space-between;
      width: 100%;
    }
    @media (width <= 960px) {
      main {
        margin-left: 10px;
        margin-right: 10px;
      }
      #month-outcome-charts {
        flex-wrap: wrap;
      }
    }
    @media (width <= 500px) {
      #month-summary {
        flex-wrap: wrap;
        justify-content: center;
        flex-direction: column;
      }
      .month-summary-item {
        width: 100%;
        height: 50px;
        padding: 10px 0;
        margin-bottom: 5px;
        border-radius: 12px;
        display: flex;
        justify-content: space-around;
        align-items: center;
      }
    }
</style>

<main>
    <div id="month-summary">
        <div id="month-outcome" class="month-summary-item">
            <span class="iconfont icon-red-packet"></span>
            <div class="month-summary-item-sum">
                <span>月支出</span>
                <span id="month-out-money"
                      class="month-summary-item-sum-money"></span>
            </div>
        </div>
        <div id="month-income" class="month-summary-item">
            <span class="iconfont icon-money-packet"></span>
            <div class="month-summary-item-sum">
                <span>月收入</span>
                <span id="month-in-money"
                      class="month-summary-item-sum-money"></span>
            </div>
        </div>
        <div id="month-balance" class="month-summary-item">
            <span class="iconfont icon-pig"></span>
            <div class="month-summary-item-sum">
                <span>月结余</span>
                <span id="month-balance-money"
                      class="month-summary-item-sum-money"></span>
            </div>
        </div>
    </div>
    <%--  月支出分布  --%>
    <div id="month-outcome-charts">
        <home:MonthOutcomeDistribution/>
        <home:MonthOutcomeTypePie/>
    </div>
</main>

<script>
    // 计算月支出、月收入、月结余
    let accountId = '${account.id}'
    let monthOutcome = 0;
    let monthIncome = 0;
    let monthBalance = 0;

    if (accountId !== '') {
        $.ajax({
            url: '../get-month-summary-servlet',
            type: 'POST',
            data: { id: accountId },
            success: function(data) {
                monthOutcome = data.homeVO.monthOutcome
                monthIncome = data.homeVO.monthIncome
                monthBalance = data.homeVO.monthBalance
                $('#month-out-money').text(formatMoney(monthOutcome))
                $('#month-in-money').text(formatMoney(monthIncome))
                $('#month-balance-money').text(formatMoney(monthBalance))
            },
            error: function(xhr, status, error) {
                console.log('请求出错:', error);  // 可选的错误处理
            }
        });
    }

    $('#month-out-money').text(formatMoney(monthOutcome))
    $('#month-in-money').text(formatMoney(monthIncome))
    $('#month-balance-money').text(formatMoney(monthBalance))
</script>