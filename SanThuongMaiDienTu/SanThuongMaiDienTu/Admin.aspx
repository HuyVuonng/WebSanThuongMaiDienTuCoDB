<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SanThuongMaiDienTu.Admin" %>

<%@ Register Src="~/cms/TrangAdmin/TrangAdminLoadControl.ascx" TagPrefix="uc1" TagName="TrangAdminLoadControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                         
                            <footer class="header_notify-footer">
                                <a href="" class="header_notify-footer-btn">Xem tất cả</a>
                            </footer>
                        </div>
                    </li>
                    <li class="header__navbar-item">
                        <a href="/TrangChu.aspx" class="header__navbar-item-link">Về trang chủ</a>
                    </li>
                    <li class="header__navbar-item">
                        <a href="" class="header__navbar-item-link"><i
                                class="header_napa-icon far fa-question-circle"></i>Trợ giúp</a>
                    </li>
                     <li class="header__navbar-item">
                         <span>ADMIN</span>
                    </li>
                   
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
            </div>

        </div>
    </header>

        <div class="app__container" id="app__container">
            <div class="grid">
                <div class="grid__row app__content">
                    <div class="grid__colum-10 l-12 c-12">

                        <uc1:TrangAdminLoadControl runat="server" id="TrangAdminLoadControl" />

                    </div>
                </div>
            </div>
        </div>

    </form>
     <script src="Scripts/app.js"></script>
    <script>
        function Conform_DeleteShop() {
            return confirm("Bạn có chắc chắn muốn xóa shop này không?");
        }
        function Conform_DeleteAccount() {
            return confirm("Bạn có chắc chắn muốn xóa tài khoản này không?");
        }
    </script>
</body>
</html>
