using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanThuongMaiDienTu
{
    public partial class TimKiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["KhachHang"] != null && Session["KhachHang"].ToString() == "1")
                {
                    //Đã đăng nhập
                    plDaDN.Visible = true;
                    plChuaDN.Visible = false;
                    if (Session["TenKH"] != null)
                        ltrTenKH.Text = Session["TenKH"].ToString();
                }
                else
                {
                    plDaDN.Visible = false;
                    plChuaDN.Visible = true;
                }
            }
        }

        protected void lbtDangXuat_Click(object sender, EventArgs e)
        {
            Session["KhachHang"] = null;
            Session["MaKh"] = null;
            Session["TenKH"] = null;
            Session["SDT"] = null;
            Session["sDiaChi"] = null;
            Session["Email"] = null;
            Session["Mk"] = null;
            Response.Redirect("/TrangChu.aspx");
        }

        protected void lbtTimKiem_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtTimKiem.Text))
            {
                Response.Redirect("/TimKiem.aspx?SanPham=" + txtTimKiem.Text + @"");
            }
        }
        private DataTable GetTkBanHang()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("laytkBanHang_TK_Mk", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@taikhoan", Session["Email"]);
                    Cmd.Parameters.AddWithValue("@matkhau", Session["Mk"]);
                    using (SqlDataAdapter Da = new SqlDataAdapter(Cmd))
                    {
                        DataTable tbl = new DataTable("tblTaiKhoanBanHang");
                        Da.Fill(tbl);
                        return tbl;
                    }
                }
            }
        }
        protected void lbtBanHang_Click(object sender, EventArgs e)
        {
            DataTable tblTKBanHang = GetTkBanHang();
            if (tblTKBanHang.Rows.Count > 0)
            {
                Session["TenShop"] = tblTKBanHang.Rows[0]["sTenNoiBan"];
                Session["MaShop"] = tblTKBanHang.Rows[0]["iMaNoiBan"];
                Session["DiaChiShop"] = tblTKBanHang.Rows[0]["sDiaChi"];
                Session["SDTShop"] = tblTKBanHang.Rows[0]["sDienThoai"];
                Response.Redirect("/QuanLyShop.aspx");
            }
            else
            {
                Response.Redirect("/DangKyBanHang.aspx");
            }
        }
    }
}