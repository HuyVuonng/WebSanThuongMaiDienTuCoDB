using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanThuongMaiDienTu.cms.TrangAdmin.Xoa
{
    public partial class XoaLoadControl : System.Web.UI.UserControl
    {
        String maShop = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["maShop"] != null)
            {
                maShop = Request.QueryString["maShop"];
            }
            prXoaNoiBan(maShop);
            Response.Redirect("/Admin.aspx");
        }


        private void prXoaNoiBan(string ma)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("prXoaNoiBan", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@imaNoiBan", ma);
                    Cnn.Open();
                    int n = Cmd.ExecuteNonQuery();
                    Cnn.Close();

                }//cmd
            }//Cnn
        }
    }
}