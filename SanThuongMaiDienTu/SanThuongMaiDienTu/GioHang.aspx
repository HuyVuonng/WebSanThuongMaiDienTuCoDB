﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="SanThuongMaiDienTu.GioHang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
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

    <style>
        .main{
            display: flex;
            margin-top: 60px;
        }


          .main .bang {
        text-align: center;
        width: 100%;
    }
/**.bang,th,td {
    border:2px solid red;
    border-collapse: collapse;
}**/
.td1 {
    margin-top: 200px;
    width: 150px;
    height: 150px;
}

.anhSp1 {
    width: 80px;
}

.main .cart_product {
    width: 70%;
    height: auto;
    text-align: center;
    font-size: 18px;
}
td,tr,th{
    width:fit-content;
    height:fit-content;
}

.main .cart_price {
    width: 30%;
    background: red;
    height: 100%;
}



/*---------Thanh toán--------*/
.main .cart_price {

    width: 30%;
    height: 350px;
    border-radius: 8px;
    background-color: burlywood;
}

.cart_price{
    display: flex;
    flex-direction: column;
    text-align: center;
    justify-content: center;
}

.main .cart--right {
    text-align: center;
}

    .main .cart--right .cart__title--right {
        margin: 50px;
    }

    .main .cart--right .cart__products-total-price {
        margin: 50px;
    }

#order_total_price {
    color: red;
    margin: 10px;
}

.main .cart--right cart__order-total {
    margin: 20px;
}
.header_cart-notice{
    display:none;
}
a{
    color:black;
}
.purchase-button {
   font-size: 22px;
   padding:6px 12px;
    color: white;
    background-color: darkcyan;
    border-radius: 4px;
    border: 0px;
}
/*.main .cart--right .cart__product-price-unit {
    margin:15px;
}*/

.footer {
    margin-top: 200px;
}
    </style>
</head>
<body>
     <form id="form1" runat="server">
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

                        <asp:PlaceHolder ID="plChuaDN" runat="server" Visible="true">
                            <li class="header__navbar-item header__navbar-item--strong header__navbar-item--separate"
                            id="register"><a class="header__navbar-item header__navbar-item--strong header__navbar-item--separate-a" href="DangKyKH.aspx">Đăng ký</a></li>
                        <li class="header__navbar-item header__navbar-item--strong" id="login"><a class="header__navbar-item header__navbar-item--strong header__navbar-item--separate-a" href="DangNhapKH.aspx">Đăng nhập</a></li>
                        </asp:PlaceHolder>

                        <asp:PlaceHolder ID="plDaDN" runat="server" Visible="false">
                            <li class="header__navbar-item header__navbar-item--strong" id="login">
                            <asp:LinkButton ID="lbtBanHang" runat="server" OnClick="lbtBanHang_Click">Bán hàng</asp:LinkButton></li>
                                 <li class="header__navbar-item header__navbar-item--strong header__navbar-item--separate"
                            id="register">
                                     <asp:Literal ID="ltrTenKH" runat="server"></asp:Literal></li>
                        <li class="header__navbar-item header__navbar-item--strong" id="login">
                            <asp:LinkButton ID="lbtDangXuat" runat="server" OnClick="lbtDangXuat_Click" CausesValidation="false">Đăng xuất</asp:LinkButton></li>
                        </asp:PlaceHolder>


                         
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

                        <asp:LinkButton ID="lbtTimKiem" runat="server" CssClass="header_search-btn" style="position: relative;" OnClick="lbtTimKiem_Click"><i class="header_search-btn-icon fas fa-search" style="position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);"></i></asp:LinkButton>
                       
                    </div>
                    <!-- cart -->
                    <div class="header_cart">
                        <div class="header_cart-wrap">
                            <a href=""><i class="header_cart-icon fas fa-shopping-cart"></i>
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






        <div class="app__container" id="app__container">
            <div class="grid">
             

                  	<div class="main">
	
		<div class="cart_product">
			<table class="bang">
						<tr>
							<th>Ảnh</th>
							<th>Tên sản phẩm</th>
                            <th>Số lượng</th>
							<th>Giá</th>
                            <th>Tác vụ</th>
						</tr>
        
						 <%=HienCart() %>

			</table>
		</div>
		<div class="cart_price">
			<div class="cart--right">
                    <h2 class="cart__title--right" style="font-size: 30px;margin: 0;">Đơn hàng<br></h2>
                 <p style="font-size: 15px;">Tổng số sản phẩm:<%=HienTongSoSPtrongCart()%></p>    
                <div class="cart__products-total-price">
                        <p style="font-size: 20px;">Tổng tiền sản phẩm</p>
                        <p runat="server" id="products_price"><span class="cart__product-price-unit" style="font-size: 18px;"> <%=HienTongTienCart()%>đ</span></p>
                    </div>
                    <!-----<hr>--->
                    <div class="cart__buttons--right">
                        <button class="purchase-button" type="button">Thanh toán</button>
                    </div>
                </div>
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


   

    <!-- modal-mobile -->
    <div class="modal-mobile" id="modal-mobile">
        <div class="modal-overlay" id="modal-overlay"></div>
        <div class="modal-body">
            <i class="close-icon fas fa-times" id="close-icon"></i>
            <ul class="nav_list_mobile">
                 <li class="nav_list_item"><a href="/TrangChu.aspx" class="nav_list_item_link">Trang chủ</a></li>
                 <li class="nav_list_item"><a href="/TrangChu.aspx?modul=QuanAo" class="nav_list_item_link">Quần áo</a></li>
                 <li class="nav_list_item"><a href="/TrangChu.aspx?modul=DoGiaDung" class="nav_list_item_link">Đồ gia dụng</a></li>
                 <li class="nav_list_item"><a href="/TrangChu.aspx?modul=DoDienTu" class="nav_list_item_link">Đồ điện tử</a></li>
                 <li class="nav_list_item"><a href="/TrangChu.aspx?modul=DoChoTre" class="nav_list_item_link">Đồ cho trẻ</a></li>
            </ul>
           


             <asp:PlaceHolder ID="plChuaDNmobile" runat="server" Visible="true">
                            <div class="header__navbar-item header__navbar-item--strong header__navbar-item--separate"
                            id="register-mobile"><a class="header__navbar-item header__navbar-item--strong header__navbar-item--separate-a" href="DangKyKH.aspx">Đăng ký</a></div>
                        <div class="header__navbar-item header__navbar-item--strong" id="login-mobile"><a class="header__navbar-item header__navbar-item--strong header__navbar-item--separate-a" href="DangNhapKH.aspx">Đăng nhập</a></div>
                        </asp:PlaceHolder>

                        <asp:PlaceHolder ID="plDaDN_mobile" runat="server" Visible="false">
                            <div class="header__navbar-item header__navbar-item--strong" id="login">
                            <asp:LinkButton ID="lbtBanHangmobile" runat="server" OnClick="lbtBanHang_Click">Bán hàng</asp:LinkButton></div>
                                 <div class="header__navbar-item header__navbar-item--strong header__navbar-item--separate"
                            id="register-mobile">
                                     <asp:Literal ID="ltrTenKH_mobile" runat="server"></asp:Literal></div>
                        <div class="header__navbar-item header__navbar-item--strong" id="login-mobile">
                            <asp:LinkButton ID="lbtDangXuatmobile" runat="server" OnClick="lbtDangXuat_Click" CausesValidation="false">Đăng xuất</asp:LinkButton></div>
                        </asp:PlaceHolder>
        </div>
    </div>





   <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

       <script src="Scripts/app.js"></script>
          <script>
        function Conform_DeleteProductInCart() {
            return confirm("Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng không?");
        }
          </script>
    </form>
</body>
</html>
