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

flatpickr(".datepicker", {
    disable: [
        {
            from: "2000-01-01",
            to: Date.today.prev_day
        },
    ]
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
appStatusInput.addEventListener("change", changeInterviewStatus);
