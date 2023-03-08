// let HOST = "http://localhost:8080/primeGuage/php/index.php"
let HOST = "https://steamledge.com/primeguage/php/index.php";
// let HOST = "http://localhost/Primeguage-IBS/php/index.php"

$(".aside").html(`
    <div class="app-brand demo">
    <div class="flex gap-x-2">
      <a href="index.html">
        <img src="./assets/img/logo.png" class="w-[70px] -ml-2" alt="" />
      </a>
      <div class="pt-3">
      <h5 class="text-[#FFFFFF] text-[16px]">Primegauge IBS</h5>
      <p class="text-[#727283] text-[12px] pt-2">Future of tax payment</p>
      </div>
</div>
      <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
        <i class="bx bx-chevron-left bx-sm align-middle"></i>
      </a>
    </div>


    <ul class="menu-inner">
      <!-- Dashboard -->
      <h4 class="menu-link pl-8 pt-5">MENU</h4>
      <li class="menu-item">
        <a href="index.html"  class="menu-link dass">
          <i class="menu-icon tf-icons bx bx-home-circle"></i>
          <div data-i18n="Analytics">Dashboard</div>
        </a>
      </li>
      <li class="menu-item">
        <a href="revhead.html" class="menu-link">
          <i class='menu-icon tf-icons bx bx-buildings' ></i>
          <div data-i18n="Basic">My taxes</div>
        </a>
      </li>
      <li class="menu-item">
        <a href="payments.html" class="menu-link">
          <i class='menu-icon tf-icons bx bxs-credit-card' ></i>
          <div data-i18n="Basic">Invoice</div>
        </a>
      </li>
      <li class="menu-item">
        <a href="users.html" class="menu-link mdd">
        <i class='menu-icon tf-icons bx bxs-group' ></i>
          <div data-i18n="Basic">Payment history</div>
        </a>
      </li>
      <li class="menu-item">
        <a href="users.html" class="menu-link mdd">
        <i class='menu-icon tf-icons bx bxs-group' ></i>
          <div data-i18n="Basic">E-Services</div>
        </a>
      </li>
      <li class="menu-item">
        <a href="users.html" class="menu-link mdd">
        <i class='menu-icon tf-icons bx bxs-group' ></i>
          <div data-i18n="Basic">Profile</div>
        </a>
      </li>
      <h4 class="menu-link pl-8 mt-5">YOUR ACCOUNT</h4>
      <li class="menu-item">
        <a href="index.html"  class="menu-link dass">
          <i class="menu-icon tf-icons bx bx-home-circle"></i>
          <div data-i18n="Analytics">Help & Support</div>
        </a>
      </li>
      <li class="menu-item">
        <a href="revhead.html" class="menu-link">
          <i class='menu-icon tf-icons bx bx-buildings' ></i>
          <div data-i18n="Basic">Log Out</div>
        </a>
      </li>
    </ul>

`);

$(".navi")
  .html(`<div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
  <i class="bx bx-menu bx-sm"></i>
</a>
</div>

<div class="navbar-nav-right flex items-center justify-between" id="navbar-collapse">
<div class="">
<p class="text-sm text-black" id="datei">-</p>
<h1 class="md:text-[30px] text-[14px] text-[#151515] pt-2">Dashboard</h1>
</div>

                  <div class="mt-4 flex gap-x-5">
                  <div class="input-group input-group-merge md:w-72 hidden md:flex">
<span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
<input type="text" class="form-control" placeholder="Search..." aria-label="Search..."
  aria-describedby="basic-addon-search31">
</div>
<button data-bs-toggle="modal" data-bs-target="#generateInvModal" class="button ">
              <iconify-icon icon="ic:baseline-plus"></iconify-icon> Generate Invoice</button>
                  <iconify-icon icon="mdi:bell-notification" class="hidden md:flex" width="32" height="32"></iconify-icon>
                  <div class="avatar avatar-online">
        <img src="./assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
      </div>
                  </div>
                  
</div>

`);
const currentDate = new Date();
$("#datei").html(currentDate.toLocaleDateString());



function Profile() {
  let userInfo = JSON.parse(window.localStorage.getItem("mdaDataPrime"));
  let allProf = document.querySelector("#profilead");
  allProf.innerHTML = `
  <a class="dropdown-item" href="#" >
  <div class="d-flex">
    <div class="flex-shrink-0 me-3">
      <div class="avatar avatar-online">
        <img src="./assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
      </div>
    </div>
    <div class="flex-grow-1">
      <span class="fw-semibold d-block">${userInfo.name}</span>
      <small class="text-muted">Admin</small>
    </div>
  </div>
</a>
      `;
}

Profile();


