import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"
import "bootstrap";
require("flatpickr/dist/themes/material_green.css");


flatpickr(".datepicker", {
  enableTime: true,
  minTime: "09:00"
});

