import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"
import "bootstrap";
require("flatpickr/dist/themes/confetti.css");


flatpickr(".datepicker", {
  enableTime: true,
  minTime: "08:00",
  // dateFormat: "l-M-J-y-",
  altInput: true
});


var appStatusInput = document.querySelector('#job_application_status')
var changeInterviewStatus = () => {
  var appStatusInput = document.querySelector('#job_application_status')
  Rails.ajax({
    url: window.location.pathname,
    type: "GET",
    data: appStatusInput.value
  })
};

if (appStatusInput) {
  appStatusInput.addEventListener("change", changeInterviewStatus);
}
