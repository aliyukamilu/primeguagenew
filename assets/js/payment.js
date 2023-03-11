$("#makePayment").html(`
<p class="text-2xl fontBold text-center">Make Payment</p>
<p class="text-center">Select your preferred method</p>

<div class="flex items-center flex-wrap justify-center mt-4 gap-3 px-5">

  <div class="payCards active">
    <div class="flex justify-center">
      <iconify-icon icon="mdi:credit-card-fast" class="textPrimary"></iconify-icon>
    </div>
    <p class="text-center">Online <br> Payment</p>
  </div>

  <div class="payCards">
    <div class="flex justify-center">
      <iconify-icon icon="mdi:instant-transfer" class="textPrimary"></iconify-icon>
    </div>
    <p class="text-center">Bank <br> Transfer</p>
  </div>

  <div class="payCards">
    <div class="flex justify-center">
      <iconify-icon icon="ph:bank-fill" class="textPrimary"></iconify-icon>
    </div>
    <p class="text-center">Bank <br> Branch</p>
  </div>

  <div class="payCards">
    <div class="flex justify-center">
      <iconify-icon icon="fontisto:shopping-pos-machine" class="textPrimary"></iconify-icon>
    </div>
    <p class="text-center">POS <br> &nbsp;</p>
  </div>

  <div class="payCards">
    <div class="flex justify-center">
      <iconify-icon icon="material-symbols:phone-android" class="textPrimary"></iconify-icon>
    </div>
    <p class="text-center">USSD <br> &nbsp;</p>
  </div>

  <div class="payCards">
    <div class="flex justify-center">
      <iconify-icon icon="mdi:naira" class="textPrimary"></iconify-icon>
    </div>
    <p class="text-center">e-Naira <br> &nbsp;</p>
  </div>

  <div class="payCards">
    <div class="flex justify-center">
      <iconify-icon icon="mdi:credit-card-fast" class="textPrimary"></iconify-icon>
    </div>
    <p class="text-center">ATM <br> &nbsp;</p>
  </div>

</div>

<div id="tabcontainer" class="mt-10 mb-10">

  <div class="px-20 tab_steps active">
    <p class="fontBold text-center text-lg">Follow the steps below to make online payments</p>
    <div class="flex justify-center mt-2">
      <img src="./assets/img/linebig.png" alt="">
    </div>

    <p class="text-[#555555] mt-3">You can make payment online with your ATM cards (MasterCard, Visa and
      Verve). Click on the
      <span class="fontBold text-[#000]">"Pay Now"</span> button below to proceed.
    </p>

    <div class="flex justify-center">
      <button class="button w-[60%] mt-3" onclick="nextPrev(1)">Pay Now</button>
    </div>

  </div>

  <div class="px-20 tab_steps">
    <p class="fontBold text-center text-lg">Follow the steps below to make payments on your bank's mobile
      banking platform</p>
    <div class="flex justify-center mt-2">
      <img src="./assets/img/linebig.png" alt="">
    </div>

    <div class="mt-10">
      <div class="mb-4">
        <h1 class="text-xl fontBold">Step 1</h1>
        <img src="./assets/img/curveline.png" class="-mt-5" alt="">
        <p class="mt-2">log in to your bank mobile application and select transfer to bank.</p>
      </div>

      <div class="mb-4">
        <h1 class="text-xl fontBold">Step 2</h1>
        <img src="./assets/img/curveline.png" class="-mt-5" alt="">
        <p class="mt-2">Select "************" as the receiving bank and input your Invoice number *******as
          the receiving
          bank account number.</p>
      </div>

      <div class="mb-4">
        <h1 class="text-xl fontBold">Step 3</h1>
        <img src="./assets/img/curveline.png" class="-mt-5" alt="">
        <p class="mt-2">Enter the exact amount to pay in the "Amount to transfer" field that is (the system
          will pull users
          invoice
          total and display here” and proceed.</p>
      </div>

    </div>
  </div>

  <div class="px-20 tab_steps">
    <p class="fontBold text-center text-lg">Follow the steps below to make payments at a bank branch</p>
    <div class="flex justify-center mt-2">
      <img src="./assets/img/linebig.png" alt="">
    </div>

    <div class="mt-10">
      <p>Kindly walk into any of the under-listed banks and present your Invoice number to make payment.
        Click "<span class="fontBold textPrimary">here</span>" to see the bank list</p>
    </div>
  </div>

  <div class="px-20 tab_steps">
    <p class="fontBold text-center text-lg">Follow the steps below to make payments through POS</p>
    <div class="flex justify-center mt-2">
      <img src="./assets/img/linebig.png" alt="">
    </div>

    <div class="mt-10">
      <p>You can make payment at POS terminals in any of the offices of the Akwa Ibom State Board of Internal
        Revenue
        with your ATM cards (MasterCard, Visa and Verve). You will be required to present your Invoice Number
        and
        input your Pin to approve transaction.</p>
    </div>
  </div>

  <div class="px-20 tab_steps">
    <p class="fontBold text-center text-lg">Follow the steps below to make USSD payments </p>
    <div class="flex justify-center mt-2">
      <img src="./assets/img/linebig.png" alt="">
    </div>

    <div class="mt-10">
      <p>Details coming soon</p>
    </div>
  </div>

  <div class="px-20 tab_steps">
    <p class="fontBold text-center text-lg">Follow the steps below to make e-Naira payments</p>
    <div class="flex justify-center mt-2">
      <img src="./assets/img/linebig.png" alt="">
    </div>

    <div class="mt-10">
      <p>Details coming soon</p>
    </div>
  </div>

  <div class="px-20 tab_steps">
    <p class="fontBold text-center text-lg">Follow the steps below to make payment at the ATM</p>
    <div class="flex justify-center mt-2">
      <img src="./assets/img/linebig.png" alt="">
    </div>

    <div class="mt-10">
      <p>Details coming soon</p>
    </div>
  </div>


</div>
`)

let payCards = document.querySelectorAll(".payCards")
let tab_steps = document.querySelectorAll(".tab_steps")

if (payCards) {

  payCards.forEach((payCard, i) => {

    payCard.addEventListener("click", function () {
      payCards.forEach(dd => dd.classList.remove("active"))
      tab_steps.forEach(ff => ff.classList.remove("active"))
      payCard.classList.add("active")
      tab_steps[i].classList.add("active")

    })

  })
}