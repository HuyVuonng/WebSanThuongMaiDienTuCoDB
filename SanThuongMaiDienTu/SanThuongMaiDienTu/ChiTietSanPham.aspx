﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChiTietSanPham.aspx.cs" Inherits="SanThuongMaiDienTu.ChiTietSanPham" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="fonts/fontawesome-free-5.15.3-web/css/all.min.css" rel="stylesheet" />
    <link href="fonts/fontawesome-free-6.1.1-web/css/all.min.css" rel="stylesheet" />

    <style>
        .l-6.detail {
    padding-left: 20px;
}
        .header_cart-notice{
    display:none;
}
span.Product_name {
    display: block;
    font-size: 35px;
    line-height: 35px;
}

span.giaSp {
    font-size: 1.6rem;
}

span.MoTatitle {
    font-size: 1.6rem;
    font-weight: bold;
}

span.motatxt {
    display: block;
    margin-left: 16px;
    font-size: 1.4rem;
}

.soLuong {
    display: flex;
    padding: 15px 0;
}

span.soluong_title {
    font-size: 1.6rem;
    margin-right: 20px;
    font-weight: bold;
}

input.soluongmua {
    width: 45px;
    text-align: center;
    margin: 0 5px;
}

.gia {
    display: block;
    margin: 15px 0;
}

span.giatitle {
    font-size: 1.6rem;
    font-weight: bold;
}

.Mota {
    margin-bottom: 15px;
}

.daucong, .dautru {
    padding: 2px;
}

    .daucong:hover, .dautru:hover {
        opacity: 0.7;
        cursor: pointer;
    }

.soHangcon {
    margin-bottom: 15px;
    font-size: 1.4rem;
}

.btn_ThemVaoGioHang:hover {
    opacity: 0.7;
}

span.shopname_title {
    font-size: 1.6rem;
    font-weight: bold;
}

span.shopname {
    font-size: 1.4rem;
}
    </style>
</head>
<body>
    <div class="app" id="app">
       <header class="header" id="header">
            <div class="grid">
                <nav class="header__navbar ">


                    <ul class="header__navbar-list">
                        <li class="header__navbar-item header__navbar-item--has-notify">
                            <a href="" class="header__navbar-item-link"> <i class="header_napa-icon far fa-bell"></i>
                                Thông báo</a>
                            <div class="header_notify">
                                <header class="header_notify-header">
                                    <h3>Thông báo mới nhận</h3>
                                </header>
                                <ul class="header_notify-list">
                                    <li class="header_notify-item">
                                        <a href="#" class="header_notify-link">
                                            <img src="https://cf.shopee.vn/file/25fecab4d0c9dbfc7dc590df1e732026_tn"
                                                alt="" class="header_notify-img">
                                            <div class="header_notify-info">
                                                <span class="header_notify-name">Mỹ phẩm Ohui chính hãng </span>
                                                <span class="header_notify-decription">Mô tả: Mỹ phẩm Ohui chính
                                                    hãng</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="header_notify-item">
                                        <a href="#" class="header_notify-link">
                                            <img src="https://cf.shopee.vn/file/25fecab4d0c9dbfc7dc590df1e732026_tn"
                                                alt="" class="header_notify-img">
                                            <div class="header_notify-info">
                                                <span class="header_notify-name">Mỹ phẩm Ohui chính hãng</span>
                                                <span class="header_notify-decription">Mô tả: Mỹ phẩm Ohui chính
                                                    hãng</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="header_notify-item">
                                        <a href="#" class="header_notify-link">
                                            <img src="https://cf.shopee.vn/file/25fecab4d0c9dbfc7dc590df1e732026_tn"
                                                alt="" class="header_notify-img">
                                            <div class="header_notify-info">
                                                <span class="header_notify-name">Mỹ phẩm Ohui chính hãng</span>
                                                <span class="header_notify-decription">Mô tả: Mỹ phẩm Ohui chính
                                                    hãng</span>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                                <footer class="header_notify-footer">
                                    <a href="" class="header_notify-footer-btn">Xem tất cả</a>
                                </footer>
                            </div>
                        </li>
                        <li class="header__navbar-item">
                            <a href="" class="header__navbar-item-link"><i
                                    class="header_napa-icon far fa-question-circle"></i>Trợ giúp</a>
                        </li>
                            <form id="form" runat="server">
                                <!-- modal-PC -->
                        <asp:PlaceHolder ID="plChuaDN" runat="server" Visible="true">
                            <li class="header__navbar-item header__navbar-item--strong header__navbar-item--separate"
                            id="register"><a class="header__navbar-item header__navbar-item--strong header__navbar-item--separate-a" href="DangKyKH.aspx">Đăng ký</a></li>
                        <li class="header__navbar-item header__navbar-item--strong" id="login"><a class="header__navbar-item header__navbar-item--strong header__navbar-item--separate-a" href="DangNhapKH.aspx">Đăng nhập</a></li>
                        </asp:PlaceHolder>

                        <asp:PlaceHolder ID="plDaDN" runat="server" Visible="false">
                            <li class="header__navbar-item header__navbar-item--strong" id="login">
                            <asp:LinkButton ID="lbtBanHang" runat="server" OnClick="lbtBanHangCTSP_Click">Bán hàng</asp:LinkButton></li>
                                 <li class="header__navbar-item header__navbar-item--strong header__navbar-item--separate"
                            id="register">
                                     <asp:Literal ID="ltrTenKH" runat="server"></asp:Literal></li>
                        <li class="header__navbar-item header__navbar-item--strong" id="login">
                            <asp:LinkButton ID="lbtDangXuat" runat="server" OnClick="lbtDangXuatCTSP_Click" CausesValidation="false">Đăng xuất</asp:LinkButton></li>
                        </asp:PlaceHolder>


                          <!-- modal-mobile -->
    <div class="modal-mobile" id="modal-mobile">
       
        <div class="modal-overlay" id="modal-overlay"></div>
        <div class="modal-body">
            <i class="close-icon fas fa-times" id="close-icon"></i>
            <ul class="nav_list_mobile">
                   <li class="nav_list_item"><a href="/TrangChu.aspx" class="nav_list_item_link">Trang chủ</a></li>
                        <li class="nav_list_item"><a href="/DanhMuc.aspx?malh=01" class="nav_list_item_link">Quần áo</a></li>
                        <li class="nav_list_item"><a href="/DanhMuc.aspx?malh=02" class="nav_list_item_link">Đồ gia dụng</a></li>
                        <li class="nav_list_item"><a href="/DanhMuc.aspx?malh=03" class="nav_list_item_link">Đồ điện tử</a></li>
                        <li class="nav_list_item"><a href="/DanhMuc.aspx?malh=04" class="nav_list_item_link">Đồ cho trẻ</a></li>
            </ul>
            <asp:PlaceHolder ID="plChuaDNmobile" runat="server" Visible="true">
                            <div class="header__navbar-item header__navbar-item--strong header__navbar-item--separate"
                            id="register-mobile"><a class="header__navbar-item header__navbar-item--strong header__navbar-item--separate-a" href="DangKyKH.aspx">Đăng ký</a></div>
                        <div class="header__navbar-item header__navbar-item--strong" id="login-mobile"><a class="header__navbar-item header__navbar-item--strong header__navbar-item--separate-a" href="DangNhapKH.aspx">Đăng nhập</a></div>
                        </asp:PlaceHolder>

                        <asp:PlaceHolder ID="plDaDN_mobile" runat="server" Visible="false">
                            <div class="header__navbar-item header__navbar-item--strong" id="login">
                            <asp:LinkButton ID="lbtBanHangmobile" runat="server" OnClick="lbtBanHangCTSP_Click">Bán hàng</asp:LinkButton></div>
                                 <div class="header__navbar-item header__navbar-item--strong header__navbar-item--separate"
                            id="register-mobile">
                                     <asp:Literal ID="ltrTenKH_mobile" runat="server"></asp:Literal></div>
                        <div class="header__navbar-item header__navbar-item--strong" id="login-mobile">
                            <asp:LinkButton ID="lbtDangXuatmobile" runat="server" OnClick="lbtDangXuatCTSP_Click" CausesValidation="false">Đăng xuất</asp:LinkButton></div>
                        </asp:PlaceHolder>
        </div>

    </div>

                        <!-- <li class="header__navbar-item header__navbar-user">
                            <img src="img/148819050_978251009372346_2252646809833946081_n.jpg" alt="" class="header__navbar-user-img">
                            <span class="header__navbar-user-name">Huy Vương</span>

                            <ul class="header__navbar-user-menu">
                                <li class="header__navbar-user-item">
                                    <a href="">Tài khoản của tôi</a>
                                </li> 
                                <li class="header__navbar-user-item">
                                    <a href="">Địa chỉ của tôi</a>
                                </li>
                                <li class="header__navbar-user-item">
                                    <a href="">Đơn mua</a>
                                </li>
                                <li class="header__navbar-user-item header__navbar-user-item--separate">
                                    <a href="">Đăng xuất</a>
                                </li>
                            </ul>
                        </li> -->
                    </ul>
                </nav>
                <!-- header with search -->
                <div class="header-with-search">
                    <div class="header_logo">
                        <a href="/TrangChu.aspx" class="header_logo-link">
                            <img src="img/logo3.png" alt="">
                            <span class="title">Shopping Vui</span>
                        </a>
                    </div>
                      
                    <div class="header_search">
                        <div class="header_search-input-wrap">
        
                            <asp:TextBox ID="txtTimKiem" runat="server" CssClass="header_search-input"  placeholder="Nhập để tìm kiêm sản phẩm"></asp:TextBox>
                        </div>

                        <asp:LinkButton ID="lbtTimKiem" runat="server" CssClass="header_search-btn" style="position: relative;" OnClick="lbtTimKiemCTSP_Click">
                        <i class="header_search-btn-icon fas fa-search" style="position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);"></i></asp:LinkButton>
                       
                    </div>
                      

                    <!-- cart -->
                    <div class="header_cart">
                        <div class="header_cart-wrap">
                            <a href="/GioHang.aspx"><i class="header_cart-icon fas fa-shopping-cart"></i>
                                <span class="header_cart-notice">3</span></a>

                            
                        </div>


                    </div>
                </div>
                <div class="header_nav">

                    <ul class="nav_list l-12">
                        <li class="nav_list_item"><a href="/TrangChu.aspx" class="nav_list_item_link">Trang chủ</a></li>
                        <li class="nav_list_item"><a href="/TrangChu.aspx?modul=QuanAo" class="nav_list_item_link">Quần áo</a></li>
                        <li class="nav_list_item"><a href="/TrangChu.aspx?modul=DoGiaDung" class="nav_list_item_link">Đồ gia dụng</a></li>
                        <li class="nav_list_item"><a href="/TrangChu.aspx?modul=DoDienTu" class="nav_list_item_link">Đồ điện tử</a></li>
                        <li class="nav_list_item"><a href="/TrangChu.aspx?modul=DoChoTre" class="nav_list_item_link">Đồ cho trẻ</a></li>
                    </ul>
                </div>
            </div>
        </header>

        <!-- header for mobile -->
        <header class="header-mobile">
            <div class="grid wide">
                <div class="header-mobi-nav">
                    <div class="header-mobi-menu-item" id="header-mobi-menu-item">
                        <i class="header-mobi-menu-icon fas fa-bars"></i>
                    </div>
                    <div class="header_logo">
                        <a href="/TrangChu.aspx" class="header_logo-link">
                            <img src="img/logo3.png" alt="">
                            <span class="title">Shopping Vui</span>
                        </a>
                    </div>
                    <div class="header_cart">
                        <a href="" class="link_cart">
                            <div class="header_cart-wrap">
                                <i class="header_cart-icon fas fa-shopping-cart"></i>
                                <span class="header_cart-notice">3</span>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
        </header>

        <!-- header for mobile -->
        <header class="header-mobile">
            <div class="grid wide">
                <div class="header-mobi-nav">
                    <div class="header-mobi-menu-item" id="header-mobi-menu-item">
                        <i class="header-mobi-menu-icon fas fa-bars"></i>
                    </div>
                    <div class="header_logo">
                        <a href="/TrangChu.aspx" class="header_logo-link">
                            <img src="img/logo3.png" alt="">
                            <span class="title">Shopping Vui</span>
                        </a>
                    </div>
                    <div class="header_cart">
                        <a href="" class="link_cart">
                            <div class="header_cart-wrap">
                                <i class="header_cart-icon fas fa-shopping-cart"></i>
                                <span class="header_cart-notice">3</span>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
        </header>






        <div class="app__container" id="app__container">
            <div class="grid">
                <div class="grid__row app__content">
                  
                    <div class="grid__colum-10 l-12 c-12">
                        <h1 class="title_page" style="margin-top: 30px;">Thông tin sản phẩm</h1>
  
                              <div class="product_detail">
                            <div class="grid__row">
                                
                               <div class='l-6 m-12 c-12'>
                                   <div class='home-product-item__img'
                                       <asp:Literal ID="ltrAnhSP" runat="server"></asp:Literal>></div>
                               </div>

                                <div class='l-6 m-12 c-12 detail' style="padding-left: 50px;">
                                    

                                    <span class='Product_name'>
                                            <asp:Literal ID="ltrTenSP" runat="server"></asp:Literal></span>
        
                                    <div class='gia'>
                                        <span class='giatitle'>Giá của sản phẩm: </span>
                                        <span class='giaSp'>
                                            <asp:Literal ID="ltrGiaban" runat="server"></asp:Literal>đ</span>
                                    </div>
                                    <div class='Mota'>
                                        <span class='MoTatitle'>Mô tả: </span>
                                        <span class='motatxt'>
                                            <asp:Literal ID="ltrMota" runat="server"></asp:Literal></span>
                                    </div>
                                    <div class='shopname_box'>
                                        <span class='shopname_title'> Shop bán: </span>
                                        <span class='shopname'>
                                            <asp:Literal ID="ltrShopBan" runat="server"></asp:Literal></span>
                                    </div>
                                    <div class='soLuong'>
                                        <span class='soluong_title'>Số lượng:</span>
                                        <div class='dautru' id='dautru' onclick='BotSLSP()'><i class='fa-solid fa-minus'></i></div>
                                        <input onchange="chekSLban()" type = 'text' name='soluongmua' class='soluongmua' value=<asp:Literal ID="soluongmua" runat="server"></asp:Literal>
                                        <div class='daucong' id='daucong' onclick='themSLSP()'><i class='fa-solid fa-plus'></i></i></div>
                                    </div>
                                    <div class='soHangcon'>                                        
                                        <span class='soluongcon_title'>Lượng sản phẩm còn: </span>
                                        <span class='soluongcon_value' id='soluongcon'>
                                            <asp:Literal ID="ltrSoLuongCon" runat="server"></asp:Literal></span>
                                    </div>
                                    <asp:Button ID="btnThemvaoGioHang" runat="server" Text="Thêm vào giỏ hàng" CssClass="btn btn-primary btn_ThemVaoGioHang" OnClick="btnThemvaoGioHang_Click"/>
                                </div>
                            
                               
                                  </form>
                            </div>
                        </div>
                        
                        <!-- <div class="grid__colum-2-4 l-2-4 m-4 c-12">
                            <a class="home-product-item" href="#">
                                <div class="home-product-item__img"
                                    style="background-image: url(https://cf.shopee.vn/file/cdf494d0b01e833facbf88e7dbf3df33_tn);">
                                </div>
                                <h4 class="home-product-item__name">Đèn ngủ chiếu ngàn sao mẫu mới 2020 ( dùng
                                    cáp sạc usb )</h4>
                                <div class="home-product-item-price">
                                    <span class="home-product-item-price-new">41.000d</span>
                                </div>
                                <div class="home-product-item-action">
                                    <span class="home-product-item_like home-product-item_like--liked">
                                        <i class="home-product-item_like-icon-emty far fa-heart"></i>
                                        <i class="home-product-item_like-icon-fill fas fa-heart"></i>
                                    </span>
                                    <div class="home-product-item_rating">
                                        <i class="home-product-item_gold fas fa-star"></i>
                                        <i class="home-product-item_gold fas fa-star"></i>
                                        <i class="home-product-item_gold fas fa-star"></i>
                                        <i class="home-product-item_gold fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <span class="home-product-item_sold">100 đã bán</span>
                                </div>
                                <div class="home-product-item-origin">
                                    <span class="home-product-item_brand">Whoo</span>
                                    <span class="home-product-item-origin-name">Nhật Bản</span>
                                </div>
                                <div class="home-product-item_favorite">
                                    <i class="fas fa-check"></i>
                                    <span>Yêu thích</span>
                                </div>
                            </a>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            <div class="grid">
                <div class="grid__row footer_item">
                    <div class="grid__colum-2-4 l-3">
                        <h3 class="footer-heading">Chăm sóc khánh hàng</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">Trung tâm trợ giúp</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">Mail</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">Hướng dẫn mua hằng</a>
                            </li>
                        </ul>
                    </div>
                    <div class="grid__colum-2-4 l-3">
                        <h3 class="footer-heading">Giới thiệu</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">Giới thiệu</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">Tuyển dụng</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">Điều khoẳn</a>
                            </li>
                        </ul>
                    </div>
                    <div class="grid__colum-2-4 l-3">
                        <h3 class="footer-heading">Theo dõi</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">
                                    <i class="footer__list-item-icon fab fa-facebook"></i>
                                    Facebook
                                </a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">
                                    <i class="footer__list-item-icon fab fa-instagram"></i>
                                    Instagram
                                </a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">
                                    <i class="footer__list-item-icon fab fa-linkedin-in"></i>
                                    Linkedin
                                </a>
                            </li>
                        </ul>

                    </div>
                    <div class="grid__colum-2-4 l-3">
                        <h3 class="footer-heading">Danh mục</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">Trang điểm mặt</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">Trang điểm môi</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer__list-item-link">Trang điểm mắt</a>
                            </li>
                        </ul>
                    </div>
                </div>


            </div>
            <div class="footer-bottom">
                <div class="grid">
                    <p class="footer-copyright">© 2021 - Bản quyền thuộc về Công ty HV</p>
                </div>
            </div>
        </footer>
    </div>


   

   

 
    <script>
        function themSLSP() {
            var soluongmua = document.getElementById("soluongmua");
            var soluongcon = document.getElementById("soluongcon");
            if (parseInt(soluongmua.value) >= parseInt(soluongcon.innerHTML)) {
                alert("Số lượng mua vượt quá số lượng hiện có");
                return false;
            }
            else {
                var sLMua = parseInt(soluongmua.value) + 1;
                soluongmua.value = sLMua;
            }


        }

        function BotSLSP() {
            var soluongmua = document.getElementById("soluongmua");
            var sLMua = parseInt(soluongmua.value);
            if (sLMua > 1) {
                sLMua -= 1;
                soluongmua.value = sLMua;
            }


        }
        function chekSLban() {
            var soluongmua = document.getElementById("soluongmua");
            var soluongcon = document.getElementById("soluongcon");
            if (parseInt(soluongmua.value) > parseInt(soluongcon.innerHTML)) {
                alert("Số lượng mua đã vượt quá số lượng hiện có");
                soluongmua.value = soluongcon.innerHTML;
            }

        }

        function checkDNThemSP() {
            var tk = document.getdocument.getElementById("login");
            if (tk.value == "Đăng nhập") {
                alert("Bạn cần đăng nhập vào tài khoản để thêm sản phẩm này vào giỏ hàng");
                return false;
            }


        }

    </script>



    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <script src="Scripts/app.js"></script>
</body>
</html>
