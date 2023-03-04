// let theServices = {}
// let theBanners = {}

// async function fetchServices() {
//   const response = await fetch(`${HOST}?getOurServices`)
//   const data = await response.json()

//   // console.log(data)
//   theServices = data.message

//   data.message.forEach(theservice => {

//     $("#ourServices").append(`
//         <div class="bg-white rounded-lg shadow-md p-4 border-3 border-l-[#F68C36] border-l-[#F68C36]">
//           <h4 class="font-bold text-[18px] pb-3 flex gap-x-3 items-center "> <iconify-icon icon="${theservice.icon}"
//               width="30" height="30"></iconify-icon>${theservice.header}</h4>
//           <p class="h-32">${theservice.body}</p>
//         </div>
//     `)
//   })

// }

// fetchServices()

// async function fetchBanners() {
//   const response = await fetch(`${HOST}?getBanners`)
//   const data = await response.json()

//   // console.log(data)
//   theBanners = data.message

//   console.log(data.message)

//   data.message.forEach((theBanner, i) => {
//     $("#theBanner").append(`
//       <div class="carousel-item h-full">
//         <div class="absolute w-full h-full" style="background: rgba(0, 0, 0, 0.301);"></div>
//         <img src="${theBanner.image}" class="d-block w-100 object-cover h-full" alt="...">
//         <div class="carousel-caption text-left">
//           <h5 class="sm:text-4xl text-3xl font-bold">${theBanner.body}</h5>
//           <p class="sm:text-[20px] text-[14px] mt-3">${theBanner.description}</p>
//           <p class="sm:text-[20px] text-[14px] mt-3">${theBanner.description_2}</p>
//           <div class="mt-5">
//             <a href="register.html" class="button py-3">Click here to get started</a>
//           </div>
//         </div>
//       </div>
//     `)
//   });

//   let allCaro = document.querySelectorAll(".carousel-item")
//   if (allCaro) {
//     allCaro[0].classList.add("active")

//   }

// }
// fetchBanners()

// async function fetchContacts() {
//   const response = await fetch(`${HOST}?getContactUs`)
//   const data = await response.json()

//   // console.log(data)
//   theContactus = data.message

//   data.message.forEach(contactus => {
//     $("#contactSection").html(`
//     <div class="shadow-md rounded-lg p-2 w-64 mt-3 flex gap-4">
//       <div class="">
//         <div class="bg-[#F68C36] py-2 px-3 rounded-md "><iconify-icon icon="material-symbols:location-on"
//             class="text-[#fff]"></iconify-icon></div>
//       </div>
//       <div class="">
//         <p class="text-[14px]">Address:</p>
//         <p class="text-[14px]">${contactus.address}</p>
//       </div>
//     </div>
//     <div class="shadow-md rounded-lg p-2 w-64 mt-3 flex gap-4">
//       <div class="">
//         <div class="bg-[#F68C36] py-2 px-3 rounded-md "><iconify-icon icon="material-symbols:mail-outline"
//             class="text-[#fff]"></iconify-icon></div>
//       </div>
//       <div class="">
//         <p class="text-[14px]">My Email:</p>
//         <p class="text-[14px]">${contactus.email}</p>
//       </div>
//     </div>
//     <div class="shadow-md rounded-lg p-2 w-64 mt-3 flex gap-4">
//       <div class="">
//         <div class="bg-[#F68C36] py-2 px-3 rounded-md "><iconify-icon icon="ic:baseline-phone"
//             class="text-[#fff]"></iconify-icon></div>
//       </div>
//       <div class="">
//         <p class="text-[14px]">Phone Number:</p>
//         <p class="text-[14px]">${contactus.phone_number}</p>
//       </div>
//     </div>
//     `)

//     $("#contact2").html(`
//     <p class="text-sm">${contactus.address}</p>
//     <p class="text-sm mt-3">${contactus.phone_number}</p>
//     `)
//   })

// }

// fetchContacts()