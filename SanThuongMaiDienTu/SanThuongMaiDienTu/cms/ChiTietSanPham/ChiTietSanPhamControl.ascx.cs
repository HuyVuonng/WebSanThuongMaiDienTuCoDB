using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanThuongMaiDienTu.cms.ChiTietSanPham
{
    public partial class ChiTietSanPhamControl : System.Web.UI.UserControl
    {
        private string SP = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                if (Request.QueryString["Sp"] != null)
                {
                    SP = Request.QueryString["Sp"];
                }
                LayTTSanPham(SP);
            }
        }

        private DataTable getMatHangTheoMa(string maSP)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("layMatHangTheoMavahientennhacc", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.Add("@maMH", maSP);
                    using (SqlDataAdapter Da = new SqlDataAdapter(Cmd))
                    {
                        DataTable tbl = new DataTable("tblThongTinSPTheoMa");
                        Da.Fill(tbl);
                        return tbl;
                    }
                }
            }
        }

        private void LayTTSanPham(string maSp)
        {
            DataTable tblTTSP = getMatHangTheoMa(maSp);
            string tien = Convert.ToDouble(tblTTSP.Rows[0]["fGiaBan"]).ToString("N0");//Them dau phan cach hang nghin
            LtrCHitietSP.Text += @"<div class='l-6 m-12 c-12'>" +
                        "<div class='home-product-item__img'style='background-image: url(/img/" + tblTTSP.Rows[0]["AnhBia"] + @");'></div>" +
                        "</div>" +
                        "<div class='l-6 m-12 c-12 detail'>" +
                        "<span class='Product_name'>" + tblTTSP.Rows[0]["sTenHang"] + @"</span>" +
                        "<div class='gia'>" +
                        "<span class='giatitle'>Giá của sản phẩm: </span>" +
                        "<span class='giaSp'>" + tien + "đ" + @"</span></div>" +
                        "<div class='Mota'>" +
                        "<span class='MoTatitle'>Mô tả: </span>" +
                        "<span class='motatxt'>" + tblTTSP.Rows[0]["sMoTa"] + @"</span>" +
                        "</div>" +
                        "<div class='shopname_box'>" +
                        "<span class='shopname_title'> Shop bán: </span>" +
                        "<span class='shopname'> " + tblTTSP.Rows[0]["sTenNoiBan"] + @"</span>" +
                        "</div>" +
                        "<div class='soLuong'>" +
                        "<span class='soluong_title'>Số lượng:</span>" +
                        "<div class='dautru' id='dautru' onclick='BotSLSP()'><i class='fa-solid fa-minus'></i></div>" +
                        "<input type = 'text' name='soluongmua' class='soluongmua' value='1' id='soluongmua' onchange='chekSLban()'>" +
                        "<div class='daucong' id='daucong' onclick='themSLSP()'><i class='fa-solid fa-plus'></i></i></div>  " +
                        "</div>" +
                        "<div class='soHangcon'>" +
                        "<span class='soluongcon_title'>Lượng sản phẩm còn: </span>" +
                        "<span class='soluongcon_value' id='soluongcon'>" + tblTTSP.Rows[0]["iSoLuongCon"] + @"</span>" +
                        "</div>" +
                        "<a type = 'submit' name='submit' id='submit' value='Thêm vào giỏ hàng' href='google.com' class='btn btn-primary btn_ThemVaoGioHang'>Thêm vào giỏ hàng</a>" +
                        "</div>";
        }
    }
}