<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThemLoadControl.ascx.cs" Inherits="SanThuongMaiDienTu.cms.TrangQuanLy.Thêm.ThemLoadControl" %>
<table class="tblThemSP">
    <tbody>
        <tr class="tblThemSP_hang">
            <td class="tblThemSP_cotTieuDe">Loại hàng</td>
            <td class="tblThemSP_CotNhap"><asp:DropDownList ID="drlLoaiHang" runat="server"></asp:DropDownList></td>
        </tr>
        <tr class="tblThemSP_hang">
            <td class="tblThemSP_cotTieuDe">Tên sản phẩm</td>
            <td class="tblThemSP_CotNhap">
            <asp:TextBox ID="txtTenSp" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtTenSp" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr class="tblThemSP_hang">
            <td class="tblThemSP_cotTieuDe">Ảnh sản phẩm</td>
            <td class="tblThemSP_CotNhap">
                <asp:FileUpload ID="fulAnh" runat="server" /></td>
        </tr>
        <tr class="tblThemSP_hang">
            <td class="tblThemSP_cotTieuDe">Mô tả</td>
            <td class="tblThemSP_CotNhap">
            <asp:TextBox ID="txtMota" runat="server"></asp:TextBox></td>
        </tr>
        <tr class="tblThemSP_hang">
            <td class="tblThemSP_cotTieuDe">Giá</td>
            <td class="tblThemSP_CotNhap">
            <asp:TextBox ID="txtGia" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtGia" ForeColor="Red"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Giá phải là kiểu số" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtGia" ValidationExpression="(\d)*"  ForeColor="Red"></asp:RegularExpressionValidator></td>

        </tr>
        <tr class="tblThemSP_hang">
            <td class="tblThemSP_cotTieuDe">Số lượng</td>
            <td class="tblThemSP_CotNhap">
            <asp:TextBox ID="txtSoLuong" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtSoLuong" ForeColor="Red"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Số lượng phải là kiểu số" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtSoLuong" ValidationExpression="(\d)*"  ForeColor="Red"></asp:RegularExpressionValidator></td>
        </tr>
        <tr class="tblThemSP_hang">
            <td class="tblThemSP_cotTieuDe"></td>
            <td class="tblThemSP_CotNhap_btn">
                <asp:Button ID="btnTroLai" runat="server" Text="Trở lại" CssClass="btn" OnClick="btnTroLai_Click" CausesValidation="false"/>
                <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
        </tr>
    </tbody>
</table>