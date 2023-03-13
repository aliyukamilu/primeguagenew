// let HOST = "http://localhost/primeguagenew/php/index.php";
let HOST = "http://localhost:8080/primeGuage/php/index.php"
// let HOST = "https://steamledge.com/primeguage/php/index.php"
// let HOST = "https://useibs.com/php/index.php"
// let THE_SESSION = localStorage.getItem("userDataPrime")


// if (THE_SESSION) {
$("#theHeader").html(`
  <div class="flex gap-2 items-center">
    <div class="w-[40px] h-[40px]">
      <img src="./assets/img/logo.png" class="" />
    </div>
    <p class="text-black fontBold">Pay Ibom</p>
  </div>

  <div class="md:flex hidden items-center gap-5 text-[#555555]">

    <div class="flex gap-3">
      <a href="index.html">Home</a>
      <a href="about.html">About Us</a>
      <a href="eservices.html">E-Services</a>
      <a href="offer.html">What we offer</a>
      <a href="howtopay.html">How to pay</a>
    </div>

    <div class="flex items-center gap-3">
      <a class="outline-btn" href="signin.html">Sign In</a>
      <a class="button" href="regcategory.html">Register</a>
    </div>

  </div>

  <div class="mobile_nav p-6">
    <div class="flex flex-col text-left gap-3">
      <a class="text-xl" href="index.html">Home</a>
      <a class="text-xl" href="about.html">About Us</a>
      <a class="text-xl" href="eservices.html">E-Services</a>
      <a class="text-xl" href="offer.html">What we offer</a>
      <a class="text-xl" href="howtopay.html">How to pay</a>
    </div>

      <h1 class="text-left mb-3 mt-3">Links</h1>
      <hr class="mb-3">
      <div class="text-left gap-5 text-[#555555] theNav">
        <a href="faqs.html" class="flex items-center gap-3 mb-4">
            <iconify-icon icon="wpf:faq"></iconify-icon>
            <p class="text-sm m-0">FAQ</p>
        </a>

        <a href="contact.html" class="flex items-center gap-3 mb-4">
            <iconify-icon icon="fluent:contact-card-32-filled"></iconify-icon>
            <p class="text-sm m-0">Contact Us</p>
        </a>

        <a href="news.html" class="flex items-center gap-3 mb-4">
            <iconify-icon icon="fluent:news-20-filled"></iconify-icon>
            <p class="text-sm m-0">News</p>
        </a>

        <a href="gallery.html" class="flex items-center gap-3 mb-4">
            <iconify-icon icon="dashicons:format-gallery"></iconify-icon>
            <p class="text-sm m-0">Gallery</p>
        </a>
      </div>

    <div class="flex items-center gap-3 mt-5">
      <a class="outline-btn" href="signin.html">Sign In</a>
      <a class="button" href="register.html">Register</a>
    </div>
  </div>

  <div class="hamburger md:hidden block">
    <span class="bar"></span>
    <span class="bar"></span>
    <span class="bar"></span>
  </div>
`)

const hamburger = document.querySelector(".hamburger");
const mobile_nav = document.querySelector(".mobile_nav")
if (hamburger) {
  hamburger.addEventListener("click", function () {
    mobile_nav.classList.toggle("active");
    hamburger.classList.toggle("active");

  });
}

// } else {
//   let heeaderr = ""

//   let url = window.location.href
//   let indexx = url.split("/")
//   let lastIndex = indexx[indexx.length - 1]

//   heeaderr = `
//     <div class="flex items-center justify-between py-3 px-[5%]">
//     <a href="index.html" class="logo-container">
//       <img src="./assets/img/logo.png" alt="" class="h-[50px]" />
//     </a>

//       <div class="transition-all sidebarrr bg-white h-[100vh] absolute w-[70%] gap-3 top-0  flex flex-col p-3">

//         <div class="dropdown show">
//           <a class="dropdown-toggle" href="#" role="button" id="paymentLink" data-bs-toggle="dropdown">
//             Payments
//           </a>

//           <div class="dropdown-menu" aria-labelledby="paymentLink" id="paymentLinks">
//             <a class="dropdown-item" data-bs-toggle="modal" href="#generateInvModal">Generate Invoice</a>
//             <a class="dropdown-item" data-bs-toggle="modal" href="#verifyInvModal">Verify Invoice</a>
//             <a class="dropdown-item" href="paynow.html">Pay now</a>
//             <a class="dropdown-item" data-bs-toggle="modal" href="#contInvModal">Continue payment</a>
//           </div>
//         </div>

//         <a href="aboutus.html" class="navItem">About Us</a>
//         <a href="support.html" class="navItem">FAQs</a>
//         <div class="dropdown show">
//           <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown">
//             Taxes
//           </a>

//           <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
//             <a class="dropdown-item" href="taxcategories.html">Tax Categories</a>
//             <a class="dropdown-item" href="whattopay.html">What to pay for</a>
//             <a class="dropdown-item" href="howtopay.html">How to pay</a>
//           </div>
//         </div>

//         <div class="flex items-center space-x-5">
//           <a href="signin.html" class="button-outline">Sign In</a>
//           <a href="register.html" class="button">Register</a>
//         </div>
//       </div>

//       <div class="navItems-mom items-center space-x-8 hidden md:flex">
//         <div class="dropdown show">
//           <a class="dropdown-toggle" href="#" role="button" id="paymentLink" data-bs-toggle="dropdown">
//             Payments
//           </a>

//           <div class="dropdown-menu" aria-labelledby="paymentLink" id="paymentLinks">
//     `
//   if (lastIndex === "index.html") {

//     heeaderr += `
//       <a class="dropdown-item" data-bs-toggle="modal" href="#generateInvModal">Generate Invoice</a>
//       <a class="dropdown-item" data-bs-toggle="modal" href="#verifyInvModal">Verify Invoice</a>
//       <a class="dropdown-item" href="paynow.html">Pay now</a>
//       <a class="dropdown-item" data-bs-toggle="modal" href="#contInvModal">Continue payment</a>
//     `
//   } else {
//     heeaderr += `
//       <a class="dropdown-item" href="index.html#paymentSection">Generate Invoice</a>
//       <a class="dropdown-item" href="index.html#paymentSection">Verify Invoice</a>
//       <a class="dropdown-item" href="paynow.html">Pay now</a>
//       <a class="dropdown-item" href="index.html#paymentSection">Continue payment</a>
//     `
//   }



//   heeaderr += `        
//           </div>
//         </div>
//         <a href="aboutus.html" class="navItem">About Us</a>
//         <a href="support.html" class="navItem">FAQs</a>
//         <div class="dropdown show">
//           <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown">
//             Taxes
//           </a>

//           <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
//             <a class="dropdown-item" href="taxcategories.html">Tax Categories</a>
//             <a class="dropdown-item" href="whattopay.html">What to pay for</a>
//             <a class="dropdown-item" href="howtopay.html">How to pay</a>
//           </div>
//         </div>

//         <div class="flex items-center space-x-5">
//           <a href="signin.html" class="button-outline">Sign In</a>
//           <a href="register.html" class="button">Register</a>
//         </div>
//       </div>
//       <button id="openSideBar" class="block md:hidden">
//         <i class="fas fa-bars"></i>
//       </button>
//     </div>
//   `

//   $("#theHeader").html(heeaderr)
// }


$("#footer").html(`
    <footer class="bg-white flex justify-between items-center md:px-10 px-3 py-2 landingFooter border-t border-gray-200">
      <div class="flex items-center gap-2">
          <p class="text-[#555555] md:text-sm text-xs">Copyright 2023 Primegauge LTD</p>
          <img src="./assets/img/logo1.png" class="w-[60px] h-[30px]" alt="">
      </div>

      <div class="flex items-center gap-3">
        <p class="text-sm md:block hidden">Follow us on</p>
        <iconify-icon icon="ph:facebook-logo-bold" class="md:text-2xl border-l border-gray-600 pl-3"></iconify-icon>
        <iconify-icon icon="ri:twitter-line" class="md:text-2xl border-l border-gray-600 pl-3"></iconify-icon>
        <iconify-icon icon="bi:instagram" class="md:text-2xl border-l border-gray-600 pl-3"></iconify-icon>
      </div>

      <div class="md:flex hidden items-center gap-5 text-[#555555] theNav">
        <a href="faqs.html" class="text-center">
            <iconify-icon icon="wpf:faq"></iconify-icon>
            <p class="text-sm m-0">FAQ</p>
        </a>

        <a href="contact.html" class="text-center">
            <iconify-icon icon="fluent:contact-card-32-filled"></iconify-icon>
            <p class="text-sm m-0">Contact Us</p>
        </a>

        <a href="news.html" class="text-center">
            <iconify-icon icon="fluent:news-20-filled"></iconify-icon>
            <p class="text-sm m-0">News</p>
        </a>

        <a href="gallery.html" class="text-center">
            <iconify-icon icon="dashicons:format-gallery"></iconify-icon>
            <p class="text-sm m-0">Gallery</p>
        </a>
      </div>
    </footer>
`);

// $("#openSideBar").on("click", () => {
//   let sideBarr = document.querySelector(".sidebarrr");
//   sideBarr.classList.toggle("isActive");
// });
// let theURl = window.location.href;
// let splitted = theURl.split("/");
// let theAtive = document.querySelector(
//   `a[href^='${splitted[splitted.length - 1]}']`
// );
// if (theAtive) {
//   theAtive.classList.add("active");
// }

// window.$crisp = []; window.CRISP_WEBSITE_ID = "c669b149-3ed9-4ff4-b7f2-2c76a219eee3"; (function () {
//   d = document; s = d.createElement("script"); s.src = "https://client.crisp.chat/l.js";
//   s.async = 1; d.getElementsByTagName("head")[0].appendChild(s);
// })();


