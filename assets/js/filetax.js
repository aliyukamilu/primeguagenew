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

$("#selectAccType").on("change", function () {
    let val = $(this).val()
    if (val === "2") {
      $("#indivCorporate").html(`
      <div class="md:flex gap-3 mt-3">
      <div class="form-group md:w-6/12  w-full">
      <label class="">Self-assessment form upload *</label>
      <input class="form-control mt-1 regInputs" type="file" placeholder="Individual" maxlength="15" />
      </div>
      <div class="form-group md:w-6/12  w-full">
        <label class="">Income tax form *</label>
         <input class="form-control mt-1 regInputs" type="file" placeholder="Individual" maxlength="15" />
        </div>
    </div>
    <div class="md:flex gap-3 mt-3">
      <div class="form-group md:w-6/12 w-full">
      <label class="">Evidence of tax payment *</label>
      <input class="form-control mt-1 regInputs" type="file" placeholder="Individual" maxlength="15" />
      </div>
    </div> 
      `)
  
    } else {
  
      $("#indivCorporate").html(`
      <div class="md:flex gap-3 mt-3">
      <div class="form-group md:w-6/12 w-full">
      <label class="">Self-assessment form upload *</label>
      <input class="form-control mt-1 regInputs" type="file" placeholder="Individual" maxlength="15" />
      </div>
      <div class="form-group md:w-6/12 w-full">
        <label class="">Income tax form *</label>
         <input class="form-control mt-1 regInputs" type="file" placeholder="Individual" maxlength="15" />
        </div>
    </div>
    <div class="md:flex gap-3 mt-3">
      <div class="form-group md:w-6/12 w-full">
      <label class="">Form H1 *</label>
      <input class="form-control mt-1 regInputs" type="file" placeholder="Individual" maxlength="15" />
      </div>
      <div class="form-group md:w-6/12 w-full">
        <label class="">Schedule of Tax deductions *</label>
        <input class="form-control mt-1 regInputs" type="file" placeholder="Individual" maxlength="15" />
        </div>
    </div>
    <div class="md:flex gap-3 mt-3">
      <div class="form-group md:w-6/12 w-full">
      <label class="">Evidence of tax payment *</label>
      <input class="form-control mt-1 regInputs" type="file" placeholder="Individual" maxlength="15" />
      </div>
    </div>
  </div>
      `)
  
    }
  })