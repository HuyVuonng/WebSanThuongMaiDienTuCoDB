<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrangAdminLoadControl.ascx.cs" Inherits="SanThuongMaiDienTu.cms.TrangAdmin.TrangAdminLoadControl" %>
<asp:PlaceHolder ID="plAdminLoadControl" runat="server" Visible="false"></asp:PlaceHolder>
<asp:PlaceHolder ID="plAdmin" runat="server" Visible="true">
    <p>Quản lý các shop bán hàng</p>
   <table class="tblQuanLyHang">
                            <tbody>
                                <tr class="hangtbl">
                                    <td class=" cotTieuDe cotTenhang">Mã Shop</td>
                                     <td class="cotTieuDe cotLoaihang">Tên Shop</td>
                                     <td class="cotTieuDe cotAnhBia">Địa Chỉ</td>
                                     <td class="cotTieuDe cotMota">Tài khoản</td>
                                     <td class="cotTieuDe cotGiaban">SDT</td>
                                    <td class="cotTieuDe cotTacvu">Tác vụ</td>
                                </tr>

                                <asp:Literal ID="ltrDanhSachShop" runat="server"></asp:Literal>

                               
                                 
                            </tbody>
                        </table>
    <hr />
    <p>Quản lý tài khoản khách hàng</p>
    <table class="tblQuanLyHang">
                            <tbody>
                                <tr class="hangtbl">
                                    <td class=" cotTieuDe cotTenhang">Mã TK</td>
                                     <td class="cotTieuDe cotLoaihang">Họ tên</td>
                                     <td class="cotTieuDe cotAnhBia">Tài khoản</td>
                                     <td class="cotTieuDe cotMota">Mật khẩu</td>
                                     <td class="cotTieuDe cotMota">Địa chỉ</td>
                                     <td class="cotTieuDe cotGiaban">SDT</td>
                                    <td class="cotTieuDe cotTacvu">Tác vụ</td>
                                </tr>

                                <asp:Literal ID="ltrDanhSachTKKhach" runat="server"></asp:Literal>

                               
                                 
                            </tbody>
                        </table>
</asp:PlaceHolder>
