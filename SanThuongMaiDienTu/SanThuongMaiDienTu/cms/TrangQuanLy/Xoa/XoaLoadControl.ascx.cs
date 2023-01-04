using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanThuongMaiDienTu.cms.TrangQuanLy.Xóa
{
    public partial class XoaLoadControl : System.Web.UI.UserControl
    {
        private string maSp = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["maSp"] != null)
            {
                maSp = Request.QueryString["maSp"];
            }
            xoaSp(maSp);
            Response.Redirect("/QuanLyShop.aspx");
        }

        private void xoaSp(string ma)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("xoaSp", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@maMH", ma);
                    Cnn.Open();
                    int n = Cmd.ExecuteNonQuery();
                    Cnn.Close();
                    
                }//cmd
            }//Cnn
        }
    }
}