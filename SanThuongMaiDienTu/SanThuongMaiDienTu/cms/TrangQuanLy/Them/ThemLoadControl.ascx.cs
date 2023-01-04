using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanThuongMaiDienTu.cms.TrangQuanLy.Thêm
{
    public partial class ThemLoadControl : System.Web.UI.UserControl
    {
        public string maShop = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["MaShop"] != null)
                {
                    maShop = Session["MaShop"].ToString();
                }
                LayLoaiHang();
            }
        }

        private DataTable GetLoaiHang()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("layLoaiHang", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter Da = new SqlDataAdapter(Cmd))
                    {
                        DataTable tbl = new DataTable("tblLoaiHang");
                        Da.Fill(tbl);
                        return tbl;
                    }
                }
            }
        }

        private void LayLoaiHang()
        {
            DataTable tblLoaiHang = GetLoaiHang();
            for(int i = 0; i < tblLoaiHang.Rows.Count; i++)
            {
                drlLoaiHang.Items.Add(new ListItem(tblLoaiHang.Rows[i]["sTenLoaiHang"].ToString(),tblLoaiHang.Rows[i]["iMaLH"].ToString()));
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {

            if (fulAnh.FileContent.Length > 0)
            {
                if(fulAnh.FileName.EndsWith(".jpg")|| fulAnh.FileName.EndsWith(".jpeg")|| fulAnh.FileName.EndsWith(".png")|| fulAnh.FileName.EndsWith(".gif"))
                {
                    fulAnh.SaveAs(Server.MapPath("img/") + fulAnh.FileName);
                }
            }




            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("themSp", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@tenhang", txtTenSp.Text);
                    Cmd.Parameters.AddWithValue("@gia", txtGia.Text);
                    Cmd.Parameters.AddWithValue("@mota", txtMota.Text);
                    Cmd.Parameters.AddWithValue("@anh", fulAnh.FileName);
                    Cmd.Parameters.AddWithValue("@soluong", txtSoLuong.Text);
                    Cmd.Parameters.AddWithValue("@maLH", drlLoaiHang.SelectedValue);
                    Cmd.Parameters.AddWithValue("@manoiban", Session["MaShop"].ToString());
                    Cnn.Open();
                    int n = Cmd.ExecuteNonQuery();
                    Cnn.Close();
                    if (n > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thêm sản phẩm thành công!')", true);
                        txtGia.Text = txtMota.Text = txtSoLuong.Text = txtTenSp.Text = string.Empty;
                    }
                }//cmd
            }//Cnn
        }

        protected void btnTroLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("/QuanLyShop.aspx");
        }
    }
}