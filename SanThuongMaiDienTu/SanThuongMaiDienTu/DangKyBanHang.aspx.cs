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
    public partial class DangKyBanHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtDangKy_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;

            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("themTKBanHang", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@tennoiban", txtTenShop.Text);
                    Cmd.Parameters.AddWithValue("@taikhoan", Session["Email"].ToString());
                    Cmd.Parameters.AddWithValue("@matkhau", Session["MK"].ToString());
                    Cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                    Cmd.Parameters.AddWithValue("@sdt", txtSDT.Text);

                    Cnn.Open();
                    int n = Cmd.ExecuteNonQuery();
                    Cnn.Close();
                    if (n > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Đăng ký thành công!')", true);


                    }
                }//cmd
            }//Cnn
        }
           
        
    }
}