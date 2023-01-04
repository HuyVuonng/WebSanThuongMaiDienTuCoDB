<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuenMK.aspx.cs" Inherits="SanThuongMaiDienTu.QuenMK" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>
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
</head>
<body>
    <form id="form1" runat="server">
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
                                        <img src="https://cf.shopee.vn/file/25fecab4d0c9dbfc7dc590df1e732026_tn" alt=""
                                            class="header_notify-img">
                                        <div class="header_notify-info">
                                            <span class="header_notify-name">Mỹ phẩm Ohui chính hãng </span>
                                            <span class="header_notify-decription">Mô tả: Mỹ phẩm Ohui chính
                                                hãng</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="header_notify-item">
                                    <a href="#" class="header_notify-link">
                                        <img src="https://cf.shopee.vn/file/25fecab4d0c9dbfc7dc590df1e732026_tn" alt=""
                                            class="header_notify-img">
                                        <div class="header_notify-info">
                                            <span class="header_notify-name">Mỹ phẩm Ohui chính hãng</span>
                                            <span class="header_notify-decription">Mô tả: Mỹ phẩm Ohui chính
                                                hãng</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="header_notify-item">
                                    <a href="#" class="header_notify-link">
                                        <img src="https://cf.shopee.vn/file/25fecab4d0c9dbfc7dc590df1e732026_tn" alt=""
                                            class="header_notify-img">
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
                    <!-- <li class="header__navbar-item header__navbar-user">
                        <img src="./assets/img/148819050_978251009372346_2252646809833946081_n.jpg" alt="" class="header__navbar-user-img">
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
                        <input type="text" class="header_search-input" id="search"
                            placeholder="Nhập để tìm kiêm sản phẩm">
                    </div>
                   

                    <button class="header_search-btn">
                        <i class="header_search-btn-icon fas fa-search"></i>
                    </button>
                </div>
                <!-- cart -->
                <div class="header_cart">
                    <div class="header_cart-wrap">
                        <a href=""><i class="header_cart-icon fas fa-shopping-cart"></i>

                            <!-- no-cart:  header_cart-list--no-cart -->
                            <!-- <div class="header_cart-list">
                            <img src="./assets/img/no-cart.png" alt="" class="header_cart-no-cart-img">
                            <span class="header_cart-list--no-cart-msg">Chưa có sản phẩm</span>


                            <h4 class="header_cart-heading"> Sản phẩm đã thêm</h4>
                            <ul class="header_cart-list-item">
                                cart-item
                                <li class="header_cart-item">
                                    <img src="https://img.abaha.vn/photos/resized/320x/73-1573649832-myohui.png"
                                        class="header_cart-img" alt="">
                                    <div class="header_cart-item-info">
                                        <div class="header_cart-item-header">
                                            <h5 class="header_cart-item-header-name">Bo kem dac tri vung mat</h5>
                                            <div class="header_cart-item-price-wrap">
                                                <span class="header_cart-item-price">2.000.000d</span>
                                                <span class="header_cart-item-multiply">x</span>
                                                <span class="header_cart-item-quantity">2</span>
                                            </div>
                                        </div>
                                        <div class="header_cart-item-body">
                                            <span class="header_cart-item-decription">Phan loai: Bac</span>
                                            <span class="header_cart-item-remove">Xoa</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="header_cart-item">
                                    <img src="https://img.abaha.vn/photos/resized/320x/73-1573649832-myohui.png"
                                        class="header_cart-img" alt="">
                                    <div class="header_cart-item-info">
                                        <div class="header_cart-item-header">
                                            <h5 class="header_cart-item-header-name">Bo kem dac tri vung mat</h5>
                                            <div class="header_cart-item-price-wrap">
                                                <span class="header_cart-item-price">2.000.000d</span>
                                                <span class="header_cart-item-multiply">x</span>
                                                <span class="header_cart-item-quantity">2</span>
                                            </div>
                                        </div>
                                        <div class="header_cart-item-body">
                                            <span class="header_cart-item-decription">Phan loai: Bac</span>
                                            <span class="header_cart-item-remove">Xoa</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="header_cart-item">
                                    <img src="https://img.abaha.vn/photos/resized/320x/73-1573649832-myohui.png"
                                        class="header_cart-img" alt="">
                                    <div class="header_cart-item-info">
                                        <div class="header_cart-item-header">
                                            <h5 class="header_cart-item-header-name">Bo kem dac tri vung mat</h5>
                                            <div class="header_cart-item-price-wrap">
                                                <span class="header_cart-item-price">2.000.000d</span>
                                                <span class="header_cart-item-multiply">x</span>
                                                <span class="header_cart-item-quantity">2</span>
                                            </div>
                                        </div>
                                        <div class="header_cart-item-body">
                                            <span class="header_cart-item-decription">Phan loai: Bac</span>
                                            <span class="header_cart-item-remove">Xoa</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="header_cart-item">
                                    <img src="https://img.abaha.vn/photos/resized/320x/73-1573649832-myohui.png"
                                        class="header_cart-img" alt="">
                                    <div class="header_cart-item-info">
                                        <div class="header_cart-item-header">
                                            <h5 class="header_cart-item-header-name">Bo kem dac tri vung mat</h5>
                                            <div class="header_cart-item-price-wrap">
                                                <span class="header_cart-item-price">2.000.000d</span>
                                                <span class="header_cart-item-multiply">x</span>
                                                <span class="header_cart-item-quantity">2</span>
                                            </div>
                                        </div>
                                        <div class="header_cart-item-body">
                                            <span class="header_cart-item-decription">Phan loai: Bac</span>
                                            <span class="header_cart-item-remove">Xoa</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="header_cart-item">
                                    <img src="https://img.abaha.vn/photos/resized/320x/73-1573649832-myohui.png"
                                        class="header_cart-img" alt="">
                                    <div class="header_cart-item-info">
                                        <div class="header_cart-item-header">
                                            <h5 class="header_cart-item-header-name">Bo kem dac tri vung mat</h5>
                                            <div class="header_cart-item-price-wrap">
                                                <span class="header_cart-item-price">2.000.000d</span>
                                                <span class="header_cart-item-multiply">x</span>
                                                <span class="header_cart-item-quantity">2</span>
                                            </div>
                                        </div>
                                        <div class="header_cart-item-body">
                                            <span class="header_cart-item-decription">Phan loai: Bac</span>
                                            <span class="header_cart-item-remove">Xoa</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="header_cart-item">
                                    <img src="https://img.abaha.vn/photos/resized/320x/73-1573649832-myohui.png"
                                        class="header_cart-img" alt="">
                                    <div class="header_cart-item-info">
                                        <div class="header_cart-item-header">
                                            <h5 class="header_cart-item-header-name">Bo kem dac tri vung mat</h5>
                                            <div class="header_cart-item-price-wrap">
                                                <span class="header_cart-item-price">2.000.000d</span>
                                                <span class="header_cart-item-multiply">x</span>
                                                <span class="header_cart-item-quantity">2</span>
                                            </div>
                                        </div>
                                        <div class="header_cart-item-body">
                                            <span class="header_cart-item-decription">Phan loai: Bac</span>
                                            <span class="header_cart-item-remove">Xoa</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                            <a href="#" class="header_cart-view-cart btn btn-primary">Xem gio hang</a>
                        </div> -->
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

    <header class="header-mobile">
        <div class="grid wide">
            <div class="header-mobi-nav">
                <div class="header-mobi-menu-item" id="header-mobi-menu-item">
                    <i class="header-mobi-menu-icon fas fa-bars"></i>
                </div>
                <div class="header_logo">
                    <a href="#app" class="header_logo-link">
                        <img src="img/logo3.png" alt="">
                        <span class="title">Shopping Vui</span>
                    </a>
                </div>
                <div class="header_cart">
                    <a href="" class="link_cart">
                        <div class="header_cart-wrap">
                            <i class="header_cart-icon fas fa-shopping-cart"></i>

                        </div>
                    </a>
                </div>
            </div>

        </div>
    </header>

    <!-- modal-header-->
    <div class="modal" id="modal">
        <div class="moda_body">
            <!-- register-form -->
            <div class="auth-form" id="auth-form-register">
                <div class="auth-form_container" id="auth-form_container-register">
                    <div class="auth-form_header">
                        <h3 class="auth-form_heading">Quên mật khẩu</h3>
                        <span class="auth-form_swith-btn" id="auth-form_swith-btn-login"><a
                                class="auth-form_swith-btn-a" href="DangNhapKH.aspx">Đăng nhập</a></span>
                         <span class="auth-form_swith-btn" id="auth-form_swith-btn-login"><a
                                class="auth-form_swith-btn-a" href="DangKyKH.aspx">Đăng ký</a></span>
                    </div>

                    <div class="auth-form_form">


                        <div class="auth-form_group">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="auth-form_input" placeholder="Nhập email của bạn"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Email sai định dạng" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>


                        <div class="auth-form_group">
                            <asp:TextBox ID="txtMK" runat="server" CssClass="auth-form_input" placeholder="Nhập mật khẩu của bạn" TextMode="Password"></asp:TextBox>   
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtMK" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                        <div class="auth-form_group">
                            <asp:TextBox ID="txtNhapLaiMK" runat="server" CssClass="auth-form_input" placeholder="Nhập lại mật khẩu của bạn" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtNhapLaiMK" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                        <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>

                    </div>

                    <div class="auth-form_aside">
                        <p class="auth-form_policy-text">
                            Bằng việc đăng kí, bạn đã đồng ý với chúng tôi về
                            <a href="" class="auth-form_text-link">Điều khoản dịch vụ</a> &
                            <a href="" class="auth-form_text-link">Chính sách bảo mật</a>
                        </p>
                    </div>

                    <div class="auth-form_control">
                        <button class="btn btn-normal auth-form_control-back">TRỞ LẠI</button>
                        <asp:Button ID="lbtXacNhan" runat="server" CssClass="btn btn-primary" Text="Xác nhận" OnClick="lbtXacNhan_Click"/>

                    </div>
                </div>

                <div class="social">
                    <a href="" class="social--facebook btn btn--size-s btn-with-icon">
                        <i class="social-icon fab fa-facebook-square"></i>
                        <span class="social-label">Facebook</span>
                    </a><a href="" class="social--google btn btn--size-s btn-with-icon">
                        <i class="social-icon fab fa-google" style="color: gray;"></i>
                        <span class="social-label">Google</span>

                    </a>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
