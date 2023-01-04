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
    public partial class DangKyKH : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private DataTable getTKKH_Email()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("laytkKhachHang_TK", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@taikhoan", txtEmail.Text);
                    using (SqlDataAdapter Da = new SqlDataAdapter(Cmd))
                    {
                        DataTable tbl = new DataTable("tblTaiKhoanKhachHang_Email");
                        Da.Fill(tbl);
                        return tbl;
                    }
                }
            }
        }

        protected void lbtDangKy_Click(object sender, EventArgs e)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            DataTable tblKH_Email = getTKKH_Email();
            if (tblKH_Email.Rows.Count == 0)
            {
                if (txtMK.Text == txtNhapLaiMK.Text)
                {
                    using (SqlConnection Cnn = new SqlConnection(connectionString))
                    {
                        using (SqlCommand Cmd = new SqlCommand("themTKKhachHang", Cnn))
                        {
                            Cmd.CommandType = CommandType.StoredProcedure;
                            Cmd.Parameters.AddWithValue("@hoten", txtHoTen.Text);
                            Cmd.Parameters.AddWithValue("@taikhoan", txtEmail.Text);
                            Cmd.Parameters.AddWithValue("@matkhau", txtMK.Text);
                            Cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                            Cmd.Parameters.AddWithValue("@sdt", txtSDT.Text);

                            Cnn.Open();
                            int n = Cmd.ExecuteNonQuery();
                            Cnn.Close();
                            if (n > 0)
                            {
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Đăng ký thành công!')", true);
                                txtHoTen.Text = txtEmail.Text = txtDiaChi.Text = txtSDT.Text = string.Empty;
                            }
                        }//cmd
                    }//Cnn
                }
                else
                {
                    lbThongBao.Text = "Mật khẩu không trùng khớp mời nhập lại!";
                }
            }
            else
            {
                lbThongBao.Text = "Tài khoản này đã tồn tại";
                txtEmail.Text = string.Empty;
            }
            
        }

    }
}
