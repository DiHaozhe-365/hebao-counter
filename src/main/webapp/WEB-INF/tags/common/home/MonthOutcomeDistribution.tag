<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
  #month-outcome-distribution {
    width: 66%;
    height: 500px;
    margin-top: 10px;
    background: var(--white);
    border-radius: 12px;
    margin-right: 10px;
    display: flex;
    flex: 2;
    flex-direction: column;
  }
  #month-outcome-distribution-title {
    width: 94%;
    align-self: center;
    margin-top: 20px;
  }
  #month-outcome-distribution-echarts {
    margin-bottom: 20px;
    flex: 1;
  }
  @media (width <= 960px) {
    #month-outcome-distribution {
      height: 360px;
      width: 100%;
      margin-right: 0;
    }
  }
  @media (width <= 500px) {
    #month-outcome-distribution {
      height: 300px;
    }
  }
</style>

<div id="month-outcome-distribution">
    <div id="month-outcome-distribution-title">
        <span>本月每日支出分布</span>
    </div>
    <div id="month-outcome-distribution-echarts"></div>
</div>

<script>
    // 获取当前月份天数列表
    var daysArray = getCurrentMonthDaysArray()

    // 获取当前月份每天支出金额
    let userId = '${account.id}'
    var daysOutcomeArray = null
    if (userId !== '') {
        $.ajax({
            url: '../get-days-outcome-array-servlet',
            type: 'POST',
            data: { id: userId },
            success: function(data) {
                daysOutcomeArray = data.daysOutcomeArray
                // 绘制图形
                var chartDom = document.getElementById('month-outcome-distribution-echarts');
                var myChart = echarts.init(chartDom);
                var option;

                option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: daysArray,
                            axisTick: {
                                alignWithLabel: true
                            }
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '支出金额',
                            type: 'bar',
                            barWidth: '60%',
                            data: daysOutcomeArray
                        }
                    ],
                    color: '#EB595E',
                };

                option && myChart.setOption(option);
            },
            error: function(xhr, status, error) {
                console.log('请求出错:', error);  // 可选的错误处理
            }
        });
    }
</script>
