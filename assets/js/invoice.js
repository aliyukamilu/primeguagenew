let user_session = JSON.parse(localStorage.getItem("userDataPrime"))
function editoo() {
  let theBal = $(".theBal").text();

  $(".showEorAp").html(`
    <button class="textPrimary gap-2 flex items-center" id="applyBtn">
      <i class="fas fa-check"></i>
      <span>Apply</span>
    </button>
  `);

  $("#showBal").html(`
      <input type="number" id="inpBal" class="p-[5px] outline-none w-[100px] rounded-lg border border-gray-500" value="${theBal}" />
    `);

  $("#applyBtn").on("click", function () {
    $(".showEorAp").html(`
        <button class="textPrimary gap-2 flex items-center" id="editBtn">
          <i class="fas fa-pen"></i>
          <span>Edit</span>
        </button>
      `);
    $("#editBtn").on("click", function () {
      editoo();
    });
    let theFBal = $("#inpBal").val();

    $("#showBal").html(`
        &#8358; <span class="theBal">${theFBal}</span>
      `);
  });
}

const urlParams = new URLSearchParams(window.location.search);
const invoice_number = urlParams.get('invnum');
const pagePrint = urlParams.get('page')

async function fetchTheInvoice() {
  console.log(invoice_number)
  let config = {
    mode: "cors",
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "*",
    },
  };
  const response = await fetch(
    `${HOST}/php/index.php?getSingleInvoice&invoiceNumber=${invoice_number}`
  );
  const userInvoices = await response.json();
  console.log(userInvoices);

  if (userInvoices.status === 1) {

    userInvoices.message.forEach((invoice_info, i) => {
      let address = ""
      if (user_session) {
        address = `${user_session.lga}, ${user_session.state}, Nigeria`
      } else {
        address = "Akwa Ibom, Nigeria"
      }
      $("#invoiceCard").html(`
        <div class="flex justify-between">
          <p class="text-lg">INVOICE</p>
          <img src="./assets/img/logo.png" class="w-[80px]" />
        </div>
        
        <div class="mt-2 flex justify-between items-center">
          <div class="w-6/12">
            <p class="text-lg">Billed From</p>
            <div class="mt-2">
              <p class="text-sm fontBold">${invoice_info.COL_3}</p>
              <p class="text-sm text-gray-600">Akwa Ibom, Nigeria</p>
            </div>
          </div>

          <div class="flex-1">
            <p class="text-sm fontBold text-right">${invoice_info.first_name} ${invoice_info.surname}</p>
            <div class="flex justify-end">
              <p class="text-sm text-gray-600 text-right w-[70%]">${address}</p>
            </div>
          </div>

        </div>

        <table class="table table-borderless invTable mt-8 w-8/12">
          <tr>
            <td>Payer ID:</td>
            <td>${invoice_info.tax_number}</td>
          </tr>
          <tr>
            <td>Invoice Number:</td>
            <td>${invoice_info.invoice_number}</td>
          </tr>
          <tr>
            <td>Invoice Date:</td>
            <td>${invoice_info.due_date}</td>
          </tr>
          <tr>
            <td>Due Date:</td>
            <td>${invoice_info.due_date}</td>
          </tr>
          <tr>
            <td>Expiry Date:</td>
            <td>${invoice_info.due_date}</td>
          </tr>
        </table>

        <table class="table invTable2 mt-5">
          <tr>
            <td>Description</td>
            <td>Qty</td>
            <td>Amount</td>
          </tr>
          <tr>
            <td>${invoice_info.COL_4}</td>
            <td>1</td>
            <td>${invoice_info.COL_6}</td>
          </tr>
        </table>

        <div class="flex justify-end mt-5">
          <div class="bg-[#F9F9FA] border-[#DFE4EA] border  w-9/12 rounded-md p-3">
            <table class="table table-borderless invTable3 mb-0">
              <tr>
                <td>Sub total: </td>
                <td></td>
                <td>&#8358;${invoice_info.COL_6}</td>
              </tr>
              <tr>
                <td>Total to be paid:</td>
                <td>
                  <div class="showEorAp">
                    <button class="textPrimary gap-1 flex items-center" id="editBtn">
                      <i class="fas fa-pen"></i>
                      <span>Edit</span>
                    </button>
                  </div>
                </td>
                <td>
                  <div id="showBal">
                    &#8358; <span class="theBal">${invoice_info.COL_6}</span>
                  </div>
                </td>
              </tr>
              <tr>
                <td>Amount due on 20 Jan 2023:</td>
                <td></td>
                <td>&#8358; ${invoice_info.COL_6}</td>
              </tr>
            </table>
          </div>
        </div>
      `)
    })

    $("#editBtn").on("click", function () {
      editoo();
    });
  } else {
    $("#invoiceCard").html(`Invalid Invoice, or expired invoice`)
  }
}

fetchTheInvoice().then(res => {
  if (pagePrint) {
    $("#editBtn").remove()
    window.print()
    // Print it

    // alert("print")
  }
})

function printInvoice() {
  window.location.href = `printinvoice.html?invnum=${invoice_number}&page=print`
}

function downloadInvoice() {
  const element = document.getElementById('invoiceCard');
  html2pdf()
    .from(element)
    .save();

}