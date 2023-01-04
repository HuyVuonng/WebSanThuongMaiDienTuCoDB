$(document).ready(function () {
  $(".slider").slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: true,
    dots: true,
    autoplay: true,
    autoplaySpeed: 3000,
    prevArrow:
      "<button type='button' class='slick-prev pull-left slick-prev-btn slick-btn'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
    nextArrow:
      "<button type='button' class='slick-next pull-right slick-prev-btn slick-btn'><i class='fa fa-angle-right' aria-hidden='true'></i></button>",

    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          infinite: true,
          arrows: false,
          dots: true,
        },
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          infinite: true,
          dots: true,
          arrows: false,
        },
      },
    ],
  });
});

//đổi màu thông báo khi đẫ đọc

const vieweds = document.querySelectorAll(".header_notify-item");

function changeColor() {
  this.classList.add("header_notify-item--viewed");
}
for (const viewed of vieweds) {
  viewed.addEventListener("click", changeColor);
}

// hien menu mobile

var headerMobiMenuItem = document.getElementById("header-mobi-menu-item");
var modalMobile = document.getElementById("modal-mobile");
var closeIcon = document.getElementById("close-icon");
var modalOverlay = document.getElementById("modal-overlay");
function showmenu() {
  modalMobile.classList.add("openmobile");
}

function closemenu() {
  modalMobile.classList.remove("openmobile");
}
headerMobiMenuItem.addEventListener("click", showmenu);
closeIcon.addEventListener("click", closemenu);
modalOverlay.addEventListener("click", closemenu);

//hien, dong  bang dang ki

var register = document.getElementById("register");
var modal = document.getElementById("modal");
var authFormRegister = document.getElementById("auth-form-register");
var authFormContainerRegister = document.getElementById(
  "auth-form_container-register"
);
function showregister() {
  modal.classList.add("open");
  authFormRegister.classList.add("show-form");
}
function hidenregister() {
  modal.classList.remove("open");
  authFormRegister.classList.remove("show-form");
}
modal.addEventListener("click", hidenregister);
register.addEventListener("click", showregister);
authFormContainerRegister.addEventListener("click", function (even) {
  even.stopPropagation();
});

//hien, dong bang dang nhap

var login = document.getElementById("login");
var modal = document.getElementById("modal");
var authFormLogin = document.getElementById("auth-form-login");
var authFormContainerLogin = document.getElementById(
  "auth-form_container-login"
);
function show() {
  modal.classList.add("open");
  authFormLogin.classList.add("show-form");
}
function hiden() {
  modal.classList.remove("open");
  authFormLogin.classList.remove("show-form");
}
modal.addEventListener("click", hiden);
login.addEventListener("click", show);
authFormContainerLogin.addEventListener("click", function (even) {
  even.stopPropagation();
});

//chuyen qua lai tab

var authFormSwithBtnLogin = document.getElementById(
  "auth-form_swith-btn-login"
);
var authFormSwithBtnRegister = document.getElementById(
  "auth-form_swith-btn-register"
);
function show1() {
  authFormLogin.classList.add("show-form");
  authFormRegister.classList.remove("show-form");
}

function show2() {
  authFormLogin.classList.remove("show-form");
  authFormRegister.classList.add("show-form");
}

authFormSwithBtnLogin.addEventListener("click", show1);
authFormSwithBtnRegister.addEventListener("click", show2);

//hiên đóng bảng đăng kí mobile
var register = document.getElementById("register-mobile");
var modal = document.getElementById("modal");
var authFormRegister = document.getElementById("auth-form-register");
var authFormContainerRegister = document.getElementById(
  "auth-form_container-register"
);
function showregister() {
  modal.classList.add("open");
  authFormRegister.classList.add("show-form");
}
function hidenregister() {
  modal.classList.remove("open");
  authFormRegister.classList.remove("show-form");
}
modal.addEventListener("click", hidenregister);
register.addEventListener("click", closemenu);
register.addEventListener("click", showregister);
authFormContainerRegister.addEventListener("click", function (even) {
  even.stopPropagation();
});

//hien, dong bang dang nhap mobile

var login = document.getElementById("login-mobile");
var modal = document.getElementById("modal");
var authFormLogin = document.getElementById("auth-form-login");
var authFormContainerLogin = document.getElementById(
  "auth-form_container-login"
);
function show() {
  modal.classList.add("open");
  authFormLogin.classList.add("show-form");
}

function Conform_Delete() {
    return confirm("Bạn có chắc chắn muốn xóa sản phẩm này khỏi shop không?");
}

function hiden() {
  modal.classList.remove("open");
  authFormLogin.classList.remove("show-form");
}
modal.addEventListener("click", hiden);
login.addEventListener("click", closemenu);
login.addEventListener("click", show);
authFormContainerLogin.addEventListener("click", function (even) {
  even.stopPropagation();
});



