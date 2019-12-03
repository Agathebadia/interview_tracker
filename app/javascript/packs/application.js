import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"
import "bootstrap";
require("flatpickr/dist/themes/confetti.css");


flatpickr(".datepicker", {
  enableTime: true,
  minTime: "09:00",
  // dateFormat: "l-M-J-y-",
  altInput: true
});
