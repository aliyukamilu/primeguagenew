$("#LoginNow").on("click", (e) => {

  let emailAdd = document.querySelector("#emailAdd").value
  let password = document.querySelector("#password").value

  e.preventDefault()
  $("#msg_box").html(`
    <div class="flex justify-center items-center mt-4">
      <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-gray-900"></div>
    </div>
  `)

  $("#loginNow").addClass("hidden")

  $.ajax({
    type: "GET",
    url: `${HOST}/?login&email=${emailAdd}&password=${password}`,
    dataType: 'json',
    success: function (data) {
      if (data.status === 2) {
        $("#msg_box").html(`
          <p class="text-warning text-center mt-4 text-lg">${data.message}</p>
        `)
        $("#CreateAccountBtn").removeClass("hidden")

      } else if (data.status === 1) {
        $("#msg_box").html(`
          <p class="text-success text-center mt-4 text-lg">${data.message}</p>
        `)
        localStorage.setItem("userDataPrime", JSON.stringify(data.user))
        setTimeout(() => {
          window.location.href = "dashboard.html"
        }, 1000);

      } else if (data.status === 0) {
        $("#msg_box").html(`
          <p class="text-warning text-center mt-4 text-base">${data.message}</p>
        `)
        $("#CreateAccountBtn").removeClass("hidden")
      }
    },
    error: function (request, error) {
      console.log(error);
      $("#msg_box").html(`
        <p class="text-danger text-center mt-4 text-lg">An error occured !</p>
      `)
      $("#CreateAccountBtn").removeClass("hidden")
    }
  });

})

$("#LoginAmin").on("click", (e) => {

  let emailAdd = document.querySelector("#emailAdm").value
  let password = document.querySelector("#passwordm").value

  e.preventDefault()
  $("#msg_boxi").html(`
    <div class="flex justify-center items-center mt-4">
      <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-gray-900"></div>
    </div>
  `)

  $("#loginNow").addClass("hidden")

  $.ajax({
    type: "GET",
    url: `${HOST}/?loginAdmin&email=${emailAdd}&password=${password}`,
    dataType: 'json',
    success: function (data) {
      if (data.status === 2) {
        $("#msg_boxi").html(`
          <p class="text-warning text-center mt-4 text-lg">${data.message}</p>
        `)
        $("#CreateAccountBtn").removeClass("hidden")

      } else if (data.status === 1) {
        $("#msg_boxi").html(`
          <p class="text-success text-center mt-4 text-lg">${data.message}</p>
        `)
        localStorage.setItem("adminDataPrime", JSON.stringify(data.user))
        setTimeout(() => {
          window.location.href = "admin/index.html"
        }, 1000);

      } else if (data.status === 0) {
        $("#msg_boxi").html(`
          <p class="text-warning text-center mt-4 text-base">${data.message}</p>
        `)
        $("#CreateAccountBtn").removeClass("hidden")
      }
    },
    error: function (request, error) {
      console.log(error);
      $("#msg_boxi").html(`
        <p class="text-danger text-center mt-4 text-lg">An error occured !</p>
      `)
      $("#CreateAccountBtn").removeClass("hidden")
    }
  });

})


$("#LoginMda").on("click", (e) => {

  let emailAdd = document.querySelector("#emailmda").value
  let password = document.querySelector("#passwordmda").value
  e.preventDefault()
  $("#msg_boxi").html(`
    <div class="flex justify-center items-center mt-4">
      <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-gray-900"></div>
    </div>
  `)

  $("#loginNow").addClass("hidden")
  $.ajax({
    type: "GET",
    url: `${HOST}/?loginMda&email=${emailAdd}&passwd=${password}`,
    dataType: 'json',
    success: function (data) {
      console.log(data);
      if (data.status === 2) {
        $("#msg_boxi").html(`
          <p class="text-warning text-center mt-4 text-lg">${data.message}</p>
        `)
        $("#CreateAccountBtn").removeClass("hidden")

      } else if (data.status === 1) {
        $("#msg_boxi").html(`
          <p class="text-success text-center mt-4 text-lg">${data.message}</p>
        `)
        localStorage.setItem("mdaDataPrime", JSON.stringify(data.user))
        setTimeout(() => {
          window.location.href = "mdas/index.html"
        }, 1000);

      } else if (data.status === 0) {
        $("#msg_boxi").html(`
          <p class="text-warning text-center mt-4 text-base">${data.message}</p>
        `)
        $("#CreateAccountBtn").removeClass("hidden")
      }
    },
    error: function (request, error) {
      console.log(error);
      $("#msg_boxi").html(`
        <p class="text-danger text-center mt-4 text-lg">An error occured !</p>
      `)
      $("#CreateAccountBtn").removeClass("hidden")
    }
  });

})