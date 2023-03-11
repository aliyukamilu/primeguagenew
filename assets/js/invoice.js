function convertNumberToWords(number) {
  const ones = ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
  const tens = ['', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];
  const teens = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];

  if (number === 0) {
    return 'zero';
  }

  if (number < 0) {
    return 'minus ' + convertNumberToWords(Math.abs(number));
  }

  let words = '';

  if (Math.floor(number / 1000000) > 0) {
    words += convertNumberToWords(Math.floor(number / 1000000)) + ' million ';
    number %= 1000000;
  }

  if (Math.floor(number / 1000) > 0) {
    words += convertNumberToWords(Math.floor(number / 1000)) + ' thousand ';
    number %= 1000;
  }

  if (Math.floor(number / 100) > 0) {
    words += convertNumberToWords(Math.floor(number / 100)) + ' hundred ';
    number %= 100;
  }

  if (number > 0) {
    if (words !== '') {
      words += 'and ';
    }

    if (number < 10) {
      words += ones[number];
    } else if (number < 20) {
      words += teens[number - 11];
    } else {
      words += tens[Math.floor(number / 10)];
      if (number % 10 > 0) {
        words += '-' + ones[number % 10];
      }
    }
  }

  return words.trim();
}


async function openInvoice(invoicenum) {
  console.log(invoicenum)

  const response = await fetch(
    `${HOST}/php/index.php?getSingleInvoice&invoiceNumber=${invoicenum}`
  );
  const userInvoices = await response.json();
  console.log(userInvoices);

  if (userInvoices.status === 1) {

    userInvoices.message.forEach((invoice_info, i) => {
      // let address = ""
      // if (user_session) {
      //   address = `${user_session.lga}, ${user_session.state}, Nigeria`
      // } else {
      //   address = "Akwa Ibom, Nigeria"
      // }
      $("#invoiceCard").html(`
          <div class="invoicetop"></div>

          <div class="flex px-6 pt-3 items-center justify-between">

            <h1 class="fontBold text-2xl">Invoice</h1>

            <div class="flex items-center gap-1">
              <img src="./assets/img/vector.png" alt="">
              <p class="text-2xl fontBold">${invoice_info.invoice_number}</p>
            </div>

          </div>

          <div class="flex  justify-between px-6 mt-4">
            <div class="w-full">
              <p class="text-[#555555]">FROM :</p>
              <p class="fontBold">${invoice_info.COL_3}</p>
              <p class="text-[#222234] w-[60%] text-sm">Uyo, Akwa Ibom</p>
            </div>

            <div class="w-full mr-[-30%]">
              <p class="text-[#555555]">TO :</p>
              <p class="fontBold text-left">${invoice_info.surname} ${invoice_info.first_name}</p>
              <p class="text-[#222234] text-sm w-[60%]">1 ,Mount Zion Road, Ikot Ekpene, Akwa Ibom,
                Nigeria, Ikot Ekpene
                L.G.A
              </p>
            </div>

          </div>

          <div class="px-6 mt-4">
            <p class="text-[#555555]">INFO :</p>

            <table class="table table-borderless invTa w-[70%]">
              <tr>
                <td>
                  <p class="fontBold">Payer ID: ${invoice_info.tax_number}</p>
                </td>
                <td>Due Date: ${invoice_info.due_date}</td>
              </tr>
              <tr>
                <td>Invoice Date: 27/03/2020</td>
                <td>Expiry Date: 04/04/2020</td>
              </tr>
            </table>
          </div>

          <div class="flex justify-end">
            <div class=" w-[70%]">
              <table class="table table-borderless">
                <tr>
                  <td class="text-[#555555] text-sm">ITEM DESCRIPTION</td>
                  <td class="text-[#555555] text-sm">QTY</td>
                  <td class="text-[#555555] text-sm">RATE</td>
                  <td class="text-[#555555] text-sm">AMOUNT</td>
                </tr>
                <tr class="border-b border-b border-[#6F6F84]">
                  <td class="text-sm">${invoice_info.COL_4}</td>
                  <td class="text-sm">01</td>
                  <td class="text-sm"></td>
                  <td class="text-sm">${invoice_info.COL_6}</td>
                </tr>
                <tr>
                  <td class="text-[#555555] text-sm">Sub Total</td>
                  <td></td>
                  <td></td>
                  <td class="text-[#000] text-sm">${invoice_info.COL_6}</td>
                </tr>
                <tr class="border-b border-b border-[#6F6F84]">
                  <td class="text-[#555555] text-sm">Discount</td>
                  <td></td>
                  <td></td>
                  <td class="text-[#000] text-sm">N0.00</td>
                </tr>

                <tr>
                  <td colspan="3" class="text-[#000]">Grand Total<span class="text-[#555555]"> (NGN)</span></td>
                  <td class="text-[#000] text-xl fontBold">N${invoice_info.COL_6}</td>
                </tr>

                <tr>
                  <td colspan="2" class="text-[#000]">Paying</td>
                  <td class="textPrimary">Edit</td>
                  <td class="text-xl textPrimary fontBold">${invoice_info.COL_6}.00</td>
                </tr>
                <tr>
                  <td colspan="4" class="text-sm text-[#000] pb-0">Amount in words</td>
                </tr>
                <tr>
                  <td colspan="4" class="text-sm text-[#555555] pt-0 text-capitalize">${convertNumberToWords(invoice_info.COL_6)} Naira Only</td>
                </tr>
                <tr>
                  <td colspan="4" class="text-sm text-[#555555] pb-0">Notes</td>
                </tr>
                <tr>
                  <td colspan="4" class="fontBold pt-0">Thanks for the business.</td>
                </tr>
              </table>

              <table class="table table-borderless bg-[#FFF3E9]">
                <tr>
                  <td colspan="3" class="text-[#6F6F84] pb-0">Payment Details</td>
                  <td class="text-right text-uppercase text-[#6F6F84] text-sm pb-0">Online payment </td>
                </tr>
                <tr>
                  <td colspan="3"></td>
                  <td class="text-right pt-0">Remita </td>
                </tr>
              </table>
            </div>
          </div>


          <hr class="my-4 mx-10">

          <div class="px-10 pb-6">
            <div class="flex items-center justify-center">
              <img src="./assets/img/akwaimage.png" alt="">
              <div>
                <p class="text-xl fontBold pb-0">Pay Ibom</p>
                <div class="flex items-center gap-x-3 flex-wrap">
                  <p class="text-sm text-[#6F6F84]">www.akwaibompay.ng</p>
                  <p class="text-sm text-[#6F6F84]">Info@akwaibompay.com</p>
                  <p class="text-sm text-[#6F6F84]">0800 101 5555</p>
                  <img src="./assets/img/logo1.png" class="h-[30px] w-[50px]" alt="">
                </div>
              </div>
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