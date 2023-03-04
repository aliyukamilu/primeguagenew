let userInfo = JSON.parse(window.localStorage.getItem("userDataPrime"));

let userID = userInfo.id;
$('#theUser').html(`<span>${userInfo.surname} ${userInfo.first_name}</span></h1>`)

async function fetchInvoice() {
  $("#showInvoice").html("");
  $("#loader").css("display", "flex");

  let config = {
    mode: "cors",
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "*",
    },
  };
  const response = await fetch(
    `${HOST}/php/index.php?userInvoices&payer_id=${userID}`
  );
  let gg = []
  const userInvoices = await response.json();
  // console.log(userInvoices);
  $("#loader").css("display", "none");
  if (userInvoices.status === 1) {
    let NumberOFInvoices = userInvoices.message.length;
    $(".invNumbers").html(userInvoices.message.length)
   
    for (let i = 0; i < userInvoices.message.length; i++) {
      const userInvoice = userInvoices.message[i];
      $("#showInvoice").append(`
        <tr class="relative">
          <td>${i + 1}</td>
          <td><a class="text-primary" href="./invoice.html?id=${userInvoice.payer_id}&invnum=${userInvoice.invoice_number}">${userInvoice.tax_number}</a></td>
          <td>${userInvoice.invoice_number}</td>
          <td>${userInvoice.due_date}</td>
          <td>${userInvoice.due_date}</td>            
        </tr>
      `);

      if (i === 4) {
        break;
      }
      if(userInvoice.payment_status == "paid") {
        gg.push("g")
      }
      
    }
     let NumberOfPaid = gg.length
     $("#paid_invoices").html(NumberOfPaid)
console.log(NumberOfPaid)
    const ctx = document.getElementById('dashboardGuage');

new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ['Invoice Generated', 'Invoice Paid'],
    datasets: [{
      label: 'Invoice',
      data: [NumberOFInvoices, NumberOfPaid],
      borderWidth: 0,
      borderRadius: 5,
      barThickness: 40,
      backgroundColor: '#F68C36',
    }]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});
  } else {
    $("#showInvoice").html(`
      <tr>
        <td colspan="5" class="text-center">No data available</td>
      </tr>
    `);
    $("#dataTable").DataTable();
  }
}

fetchInvoice()

async function fetchPayment() {
  $("#showPayment").html("");
  $("#loader").css("display", "flex");

  let config = {
    mode: "cors",
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "*",
    },
  };
  const response = await fetch(
    `${HOST}/php/index.php?fetchPayment&user_id=${userID}`
  );
  const userInvoices = await response.json();
  // console.log(userInvoices);
  $("#loader").css("display", "none");
  if (userInvoices.status === 1) {
    for (let i = 0; i < userInvoices.message.length; i++) {
      const userInvoice = userInvoices.message[i];
      $("#showPayment").append(`
        <tr class="relative">
          <td>${i + 1}</td>
          <td>${userInvoice["COL_4"]}</td>
          <td>${userInvoice["receipt_number"]}</td>
          <td>&#8358;${userInvoice["COL_6"]}</td>
          <td>${userInvoice.timeIn}</td>            
        </tr>
      `);

      if (i === 4) {
        break;
      }
    }
  } else {
    $("#showPayment").html(`
      <tr>
        <td colspan="5" class="text-center">No data available</td>
      </tr>
    `);
    // $("#dataTable").DataTable();
  }
}

fetchPayment()


async function fetchAnalytics() {

  let config = {
    mode: "cors",
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "*",
    },
  };
  try {
    const response = await fetch(
      `${HOST}/php/index.php?getDashboardAnalytics&user_id=${userID}`
    );

    const userAnalytics = await response.json();
    $("#due_amount").html(userAnalytics.due_amount)
    $("#due_invoices").html(userAnalytics.due_invoices)
    $("#total_amount").html(userAnalytics.total_amount_invoiced)
    $("#total_amountP").html(userAnalytics.total_amount_paid)
    // console.log(userAnalytics)
  } catch (error) {
    console.log(error)
  }


}

fetchAnalytics()

var chartDom = document.getElementById('chart');
var myChart = echarts.init(chartDom);
var option;

option = {
  series: [
    {
      type: 'gauge',
      startAngle: 180,
      endAngle: 0,
      center: ['50%', '75%'],
      radius: '90%',
      min: 0,
      max: 1,
      splitNumber: 8,
      axisLine: {
        lineStyle: {
          width: 6,
          color: [
            [0.25, '#FF6E76'],
            [0.5, '#FDDD60'],
            [0.75, '#58D9F9'],
            [1, '#7CFFB2']
          ]
        }
      },
      pointer: {
        icon: 'path://M12.8,0.7l12,40.1H0.7L12.8,0.7z',
        length: '12%',
        width: 20,
        offsetCenter: [0, '-60%'],
        itemStyle: {
          color: 'inherit'
        }
      },
      axisTick: {
        length: 12,
        lineStyle: {
          color: 'inherit',
          width: 2
        }
      },
      splitLine: {
        length: 20,
        lineStyle: {
          color: 'inherit',
          width: 5
        }
      },
      axisLabel: {
        color: '#464646',
        fontSize: 20,
        distance: -60,
        rotate: 'tangential',
        formatter: function (value) {
          if (value === 0.875) {
            return '100%';
          } else if (value === 0.625) {
            return '75%';
          } else if (value === 0.375) {
            return '50%';
          } else if (value === 0.125) {
            return '0%';
          }
          return '';
        }
      },
      title: {
        offsetCenter: [0, '-10%'],
        fontSize: 20
      },
      detail: {
        fontSize: 20,
        offsetCenter: [0, '-35%'],
        valueAnimation: true,
        formatter: function (value) {
          return Math.round(value * 100) + '';
        },
        color: 'inherit'
      },
      data: [
        {
          value: 0.7,
          name: ''
        }
      ]
    }
  ]
};

option && myChart.setOption(option);
