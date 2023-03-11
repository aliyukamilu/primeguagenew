var currentTab = 0;
showTab(currentTab);

function showTab(n) {
  var x = document.getElementsByClassName("formTabs");
  x[n].style.display = "block";

  // fixStepIndicator(n)
}

function nextPrev(n) {
  var x = document.getElementsByClassName("formTabs");
  x[currentTab].style.display = "none";
  currentTab = currentTab + n;


  showTab(currentTab);
}



let theRevs = {}
async function fetchRevHeads(mdn) {
  const response = await fetch(`${HOST}/?getMDAsRevenueHeads&mdName=AKIRS`)
  const revHeads = await response.json()
  $("#listOfpayable").html("")

  if (revHeads.status === 0) {
  } else {
    theRevs = revHeads.message
    // console.log(theRevs)
    $("#rev_heads").html(`
      <option disabled selected>Select--</option>
    `)
    revHeads.message.forEach((revHd, i) => {
      $("#rev_heads").append(`
        <option value="${revHd["COL_4"]}">${revHd["COL_4"]}</option>
      `)
    });

  }
}
fetchRevHeads()

let the_id
$("#rev_heads").on("change", function () {
  let val = $(this).val()
  let theRevenue = theRevs.filter(rr => rr.COL_4 === val)
  console.log(val, theRevenue)
  $("#amountTopay").val(theRevenue[0]["COL_6"])
  the_id = theRevenue[0].id
})

async function generateInvoiceNon() {
  let allInputs = document.querySelectorAll(".payInputs")
  let categ = document.querySelector("#category").value
  let tin = document.querySelector("#tin").value

  $("#msg_box").html(`
    <div class="flex justify-center items-center mt-4">
      <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-gray-900"></div>
    </div>
  `)

  $("#generating_inv").addClass("hidden")



  let obj = {
    "endpoint": "createPayerAccount",
    "data": {
      "state": "Akwa Ibom",
      "category": categ,
      "img": "",
      "tin": tin,
      "lga": "",
      "address": "",
      "password": "12345",
      "verification_status": "grfdses"
    }
  }
  allInputs.forEach(allInput => {
    obj.data[allInput.dataset.name] = allInput.value
  })

  let StringedData = JSON.stringify(obj)
  console.log(StringedData)

  $.ajax({
    type: "POST",
    url: HOST,
    dataType: 'json',
    data: StringedData,
    success: function (data) {
      // console.log(data)
      if (data.status === 2) {

        let taxNumber = data.data.message.tax_number
        console.log(taxNumber)
        generateInvoiceNum(taxNumber)

      } else if (data.status === 1) {

        let taxNumber = data.data.tax_number
        console.log(data)
        generateInvoiceNum(taxNumber)

      }
    },
    error: function (request, error) {
      console.log(error);
      $("#msg_box").html(`
        <p class="text-danger text-center mt-4 text-lg">Something went wrong !</p>
      `)
      $("#generating_inv").removeClass("hidden")
    }
  });

}

async function generateInvoiceNum(taxNumber) {
  console.log(taxNumber)
  $.ajax({
    type: "GET",
    url: `${HOST}?generateSingleInvoices&tax_number=${taxNumber}&revenue_head_id=${the_id}`,
    dataType: 'json',
    success: function (data) {
      console.log(data)
      if (data.status === 2) {


      } else if (data.status === 1) {
        $("#generating_inv").removeClass("hidden")

        $("#msg_box").html(``)
        Swal.fire({
          title: 'Generated',
          text: "Invoice has been generated successfully, Invoice details will be sent to your email and phone number!",
          icon: 'success',
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#3085d6',
          confirmButtonText: 'Open Invoice',
          allowOutsideClick: false
        }).then((result) => {
          if (result.isConfirmed) {
            nextPrev(1)
            openInvoice(data.invoice_number)
            // window.location.href = `invoice.html?invnum=${data.invoice_number}`
          }
        })


      }
    },
    error: function (request, error) {
      $("#msg_box").html(`
        <p class="text-danger text-center mt-4 text-lg">Something went wrong</p>
      `)
      $("#generateInvoice").removeClass("hidden")
      console.log(error);
    }
  });
}