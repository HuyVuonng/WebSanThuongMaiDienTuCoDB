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
    public partial class DangNhapKH : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private DataTable GetTk()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("laytkKhachHang_TK_Mk", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@taikhoan", txtEmail.Text);
                    Cmd.Parameters.AddWithValue("@matkhau", txtMk.Text);
                    using (SqlDataAdapter Da = new SqlDataAdapter(Cmd))
                    {
                        DataTable tbl = new DataTable("tblTaiKhoanKhachHang");
                        Da.Fill(tbl);
                        return tbl;
                    }
                }
            }
        }


        protected void lbtnDangNhap_Click(object sender, EventArgs e)
        {
            DataTable tbTKKhachHang = GetTk();
            if (tbTKKhachHang.Rows.Count > 0)
            {
                Session["KhachHang"] = "1";//Thể hiện đã đăng nhập thành công
                //Lấy thông tin
                Session["MaKh"] = tbTKKhachHang.Rows[0]["iMaKH"];
                Session["TenKH"] = tbTKKhachHang.Rows[0]["sHoTen"];
                Session["SDT"] = tbTKKhachHang.Rows[0]["sDienThoai"];
                Session["sDiaChi"] = tbTKKhachHang.Rows[0]["sDiaChi"];
                Session["Email"] = tbTKKhachHang.Rows[0]["sTaiKhoan"];
                Session["Mk"] = tbTKKhachHang.Rows[0]["sMatKhau"];
                Response.Redirect("/TrangChu.aspx");
            }
            else
            {
                lbThongBao.Text = "Tài khoản hoặc mật khâu sai";
            }

        }
    }
}