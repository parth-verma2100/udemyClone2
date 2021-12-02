// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("@rails/ujs").start()
require("turbolinks").start()
require("channels")


//Dependencias globales
import "bootstrap"
import "../globals/off-canvas"
import "../globals/hoverable-collapse"
import "../globals/misc"
import "../globals/settings"



// Componentes externos
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"
import "jquery-steps/build/jquery.steps"
import "jquery-validation/dist/jquery.validate"

//Componentes de proleague

// JS especifico para ciertas páginas
import "../pages/wizard-forms"
import "../pages/datepicker"
import "../pages/form-validation"
//= require jquery.validate.additional-methods 
//= require jquery.validate
//= require jquery
//= require jquery_ujs

Rails.start()
Turbolinks.start()
ActiveStorage.start()

