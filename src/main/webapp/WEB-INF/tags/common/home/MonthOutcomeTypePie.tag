<%@ tag pageEncoding="UTF-8" language="java" %>
<style>
  #month-outcome-type-pie {
    width: 33%;
    height: 500px;
    margin-top: 10px;
    background: var(--white);
    border-radius: 12px;
    display: flex;
    flex-direction: column;
  }
  #month-outcome-type-pie-title {
    width: 94%;
    align-self: center;
    margin-top: 20px;
  }
  #month-outcome-type-pie-echarts {
    margin-bottom: 20px;
    flex: 1;
  }
  @media (width <= 960px) {
    #month-outcome-type-pie {
      height: 360px;
      width: 100%;
    }
  }
  @media (width <= 500px) {
    #month-outcome-type-pie {
      height: 300px;
    }
  }
</style>

<div id="month-outcome-type-pie">
    <div id="month-outcome-type-pie-title">
        <span>本月支出类型分布</span>
    </div>
    <div id="month-outcome-type-pie-echarts"></div>
</div>

<script>
    // 获取当前月份每天支出金额
    let userId2 = '${account.id}'
    var outcomeTypeArray = null
    if (userId !== '') {
        $.ajax({
            url: '../get-outcome-type-array-servlet',
            type: 'POST',
            data: { id: userId2 },
            success: function(data) {
                outcomeTypeArray = data.outcomeTypeArray
                // 绘制图形
                var chartDom = document.getElementById('month-outcome-type-pie-echarts');
                var myChart = echarts.init(chartDom);
                var option;

                option = {
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        top: '5%',
                        left: 'center'
                    },
                    series: [
                        {
                            name: 'Access From',
                            type: 'pie',
                            radius: ['40%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                show: false,
                                position: 'center'
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: 40,
                                    fontWeight: 'bold'
                                }
                            },
                            labelLine: {
                                show: false
                            },
                            data: outcomeTypeArray
                        }
                    ]
                };

                option && myChart.setOption(option);
            },
            error: function(xhr, status, error) {
                console.log('请求出错:', error);  // 可选的错误处理
            }
        });
    }
</script>
