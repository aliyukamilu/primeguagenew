// // let HOST = "http://localhost/Primeguage-IBS/php/index.php"
// // let HOST = "http://localhost:8080/primeGuage/php/index.php"
// // let HOST = "https://steamledge.com/primeguage/php/index.php"
// let HOST = "https://useibs.com/php/index.php"
// let THE_SESSION = localStorage.getItem("userDataPrime")


// if (THE_SESSION) {
//   $("#theHeader").html(`
//   <div class="flex items-center justify-between py-3 px-[5%]">
//     <a href="index.html" class="logo-container">
//       <img src="./assets/img/logo.png" alt="" class="h-[50px]" />
//     </a>

//     <div class="transition-all shadow-lg sidebarrr bg-white h-[100vh] absolute w-[70%] gap-3 top-0  flex flex-col p-3">
//     <a href="index.html" class="navItem">Home</a>
//     <a href="dashboard.html" class="navItem">Dashboard</a>
//     <a href="aboutus.html" class="navItem">About Us</a>
//     <a href="paymenthistory.html" class="navItem">Payment History</a>
//     <a href="invoices.html" class="navItem">Invoices</a>
//     <a href="support.html" class="navItem">FAQs</a>
//       <div class="dropdown show">
//         <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown">
//           Taxes
//         </a>

//         <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
//           <a class="dropdown-item" href="taxcategories.html">Tax Categories</a>
//           <a class="dropdown-item" href="whattopay.html">What to pay for</a>
//           <a class="dropdown-item" href="howtopay.html">How to pay</a>
//         </div>
//       </div>
      
//       <a href="userprofile.html" class="flex items-center space-x-2">
//         <img src="assets/img/profile_pic.png" class="w-[40px] h-[40px]" />
//         <p>John Doe</p>
//       </a>
//     </div>

//     <div class="navItems-mom items-center space-x-8 hidden md:flex">
//       <a href="index.html" class="navItem">Home</a>
//       <a href="dashboard.html" class="navItem">Dashboard</a>
//       <a href="aboutus.html" class="navItem">About Us</a>
//       <a href="support.html" class="navItem">FAQs</a>
//       <div class="dropdown show">
//         <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown">
//           Taxes
//         </a>

//         <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
//           <a class="dropdown-item" href="taxcategories.html">Tax Categories</a>
//           <a class="dropdown-item" href="whattopay.html">What to pay for</a>
//           <a class="dropdown-item" href="howtopay.html">How to pay</a>
//         </div>
//       </div>
      
//       <a href="userprofile.html" class="flex items-center space-x-2">
//         <img src="assets/img/profile_pic.png" class="w-[40px] h-[40px]" />
//         <p></p>
//       </a>
//     </div>
//     <button id="openSideBar" class="block md:hidden">
//       <i class="fas fa-bars"></i>
//     </button>
//   </div>
// `)
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


// $("#footer").html(`
//   <div class="flex justify-between flex-wrap">
//     <div>
//       <img src="./assets/img/logo1.png" class="w-[230px] h-[100px]">
//     </div>


//     <div class="">
//       <ul>
//         <li class="text-sm mb-2"><a href="../aboutus.html" class="hover:text-white text-lg fontBold">About Us</a></li>
//         <li class="text-sm mb-2"><a href="../taxcategories.html" class="hover:text-white">Tax Categories</a></li>
//         <li class="text-sm mb-2"><a href="../whattopay.html" class="hover:text-white">What to pay for</a></li>
//         <li class="text-sm mb-2"><a href="../howtopay.html" class="hover:text-white">How to pay</a></li>
//         <li class="text-sm mb-2"><a href="../support.html" class="hover:text-white">FAQs</a></li>
//       </ul>

      
//     </div>
//     <div class="">
//     <ul>
//         <li class="text-sm mb-2"><a href="#" class="hover:text-white text-lg fontBold">Explore</a></li>
//         <li class="text-sm mb-2"><a href="../index.html" class="hover:text-white">Home</a></li>
//         <li class="text-sm mb-2"><a href="../aboutus.html" class="hover:text-white">About</a></li>
//       </ul>
//     </div>
//     <div class="">
//     <ul>
//         <li class="text-sm mb-2"><a href="#" class="hover:text-white text-lg fontBold">Contact Us</a></li>
//         <div class="mt-2">
//         <div id="contact2">
        
//         </div>
        
//         <div class="flex items-center space-x-6 the_icons mt-4">
//           <a href="#" class="hover:text-white">
//             <i class="fab fa-facebook"></i>
//           </a>
//           <a href="#" class="hover:text-white">
//             <i class="fab fa-instagram"></i>
//           </a>
//           <a href="#" class="hover:text-white">
//             <i class="fab fa-twitter"></i>
//           </a>
//           <a href="#" class="hover:text-white">
//             <i class="fab fa-linkedin"></i>
//           </a>
//         </div>
//       </div>
//       </ul>
//     </div>

//   </div>
//   <hr class="mt-5 color-[#fff]" />
//   <p class="text-center mt-3">&copy; 2022 Primeguage IBS</p>
// `);

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