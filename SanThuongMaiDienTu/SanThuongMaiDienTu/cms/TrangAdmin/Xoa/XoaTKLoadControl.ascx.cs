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
    public partial class XoaTKLoadControl : System.Web.UI.UserControl
    {
        String email = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["email"] != null)
            {
                email = Request.QueryString["email"];
            }
            prXoaTK(email);
            Response.Redirect("/Admin.aspx");
        }

        private void prXoaTK(String email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("prXoaTK", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@email", email);
                    Cnn.Open();
                    int n = Cmd.ExecuteNonQuery();
                    Cnn.Close();

                }//cmd
            }//Cnn
        }
    }
}