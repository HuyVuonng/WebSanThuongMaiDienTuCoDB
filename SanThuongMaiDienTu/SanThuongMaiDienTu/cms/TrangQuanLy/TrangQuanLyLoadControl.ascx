<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrangQuanLyLoadControl.ascx.cs" Inherits="SanThuongMaiDienTu.cms.TrangQuanLy.TrangQuanLyLoadControl" %>
<asp:PlaceHolder ID="plQuanLyLoadControl" runat="server" Visible="false"></asp:PlaceHolder>
<asp:PlaceHolder ID="plQuanLy" runat="server" Visible="true">
     <a href="/QuanLyShop.aspx?modulQuanLy=Them" class='Them' style="font-size:16px; color:black;text-decoration:none;">Thêm sản phẩm mới</a>
    <table class="tblQuanLyHang">
                            <tbody>
                                <tr class="hangtbl">
                                    <td class=" cotTieuDe cotTenhang">Tên mặt hàng</td>
                                     <td class="cotTieuDe cotLoaihang">Loại hàng</td>
                                     <td class="cotTieuDe cotAnhBia">Ảnh bìa</td>
                                     <td class="cotTieuDe cotMota">Mô tả</td>
                                     <td class="cotTieuDe cotSoLuong">Số lượng còn</td>
                                     <td class="cotTieuDe cotGiaban">Giá bán</td>
                                    <td class="cotTieuDe cotTacvu">Tác vụ</td>
                                </tr>

                                <asp:Literal ID="ltrDanhSach" runat="server"></asp:Literal>

                               
                                 
                            </tbody>
                        </table>

 
</asp:PlaceHolder>

