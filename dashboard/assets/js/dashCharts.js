// Initialize the echarts instance based on the prepared dom
var myChart = echarts.init(document.getElementById('totalRemittanceChart'));
var myChart2 = echarts.init(document.getElementById('MonthlyChart'));

// Specify the configuration items and data for the chart
if (myChart) {
  option = {
    tooltip: {
      trigger: 'item'
    },
    legend: {
      orient: 'vertical',
      left: 'right'
    },
    series: [
      {
        name: 'Total remittance by user',
        type: 'pie',
        radius: '50%',
        data: [
          { value: 1048, name: 'Miror Zaki' },
          { value: 735, name: 'Jess Archer ' },
          { value: 580, name: 'Dries Vints' },
          { value: 484, name: 'Ian Landsman' },
          { value: 300, name: 'Mohammed Said' }
        ],
        emphasis: {
          itemStyle: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: 'rgba(0, 0, 0, 0.5)'
          }
        }
      }
    ]
  };
  // Display the chart using the configuration items and data just specified.
  myChart.setOption(option);
}

if (myChart2) {
  option = {
    tooltip: {
      trigger: 'item'
    },
    legend: {
      orient: 'vertical',
      left: 'right'
    },
    series: [
      {
        name: 'Monthly invoice',
        type: 'pie',
        radius: ['40%', '70%'],
        avoidLabelOverlap: false,
        label: {
          show: false,
          position: 'center'
        },
        labelLine: {
          show: false
        },
        data: [
          { value: 1048, name: 'Number of invoices' },
          { value: 735, name: 'Number of paid invoices' },
        ]
      }
    ]
  };
  myChart2.setOption(option);
}