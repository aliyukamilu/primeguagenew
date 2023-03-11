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

$("#verifyInvoice").on("click", () => {
  let invoiceNumber = document.querySelector("#invoice_number").value
  $(".verifiyer").html(`
    <div class="flex justify-center items-center mt-4">
      <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-gray-900"></div>
    </div>
  `)
  $("#verifyInvoice").addClass("hidden")

  if (invoiceNumber === "") {
    $(".verifiyer").html("<p class='text-[#ff0000] text-sm'>Please insert your Invoice Number</p>")
    $("#verifyInvoice").removeClass("hidden")
  } else (
    fetch(`${HOST}/index.php?verifyInvoice&invoice_number=${invoiceNumber}`)
      .then((response) => response.json())
      .then((data) => {
        console.log(data)
        if (data.status === 1) {
          if (data.message.payment_status == "unpaid") {

            // $(".verifiyer").html("<p class='text-[#ff0000] text-sm'>Not Paid</p>")
            $("#verifyInvoice").removeClass("hidden")

            $("#receipt").remove()
            $("#verInvv").html(`
              <h1 class="fontBold text-2xl text-center">Verify Invoice</h1>

              <div class="flex justify-center mt-5">
                <img src="./assets/img/notpaid.png" alt="">
              </div>

              <p class="text-center mt-2">This invoice has not been paid!!</p>

              <p class="text-center mt-3 text-sm">Please pay before the due date</p>

              <div class="flex justify-center">
                <div class="flex justify-between mt-4 gap-3">
                  <a href="index.html" class="outline-btn flex gap-3 items-center px-10" type="button">
                    <span>Return to the homepage</span>
                  </a>

                  <button type="button" class="button flex gap-3 items-center px-10" onclick="nextPrev(1)">
                    <span>Pay Now</span>
                  </button>
                </div>
              </div>
            `)
            nextPrev(1)

          } else if (data.message.payment_status == "paid") {

            // $(".verifiyer").html("<p class='text-[green] text-sm'>Paid</p>")
            $("#verifyInvoice").removeClass("hidden")

            $("#payment").remove()
            $("#verInvv").html(`
              <h1 class="fontBold text-2xl text-center">Verify Invoice</h1>

              <div class="flex justify-center mt-5">
                <img src="./assets/img/verify.png" alt="">
              </div>

              <p class="text-center mt-2">This invoice has been paid</p>


              <div class="flex justify-center">
                <div class="flex justify-between mt-4 gap-3">
                  <button type="button" class="outline-btn flex gap-3 items-center px-10" type="button" onclick="nextPrev(1)">
                    <span>View Receipt</span>
                  </button>

                  <a href="index.html" class="button flex gap-3 items-center px-10">
                    <span>Return to home page</span>
                    <iconify-icon icon="eva:arrow-forward-outline" class="text-xl"></iconify-icon>
                  </a>
                </div>
              </div>
            `)

            nextPrev(1)
          }
        } else if (data.status === 0) {
          $(".verifiyer").html("<p class='text-[#ff0000] text-sm'>Wrong Invoice Number</p>")
          $("#verifyInvoice").removeClass("hidden")
        }
      })
  )


})