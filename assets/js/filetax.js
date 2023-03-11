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