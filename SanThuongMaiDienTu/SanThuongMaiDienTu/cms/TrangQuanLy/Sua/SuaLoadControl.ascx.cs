using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanThuongMaiDienTu.cms.TrangQuanLy.Sửa
{
    
    public partial class SuaLoadControl : System.Web.UI.UserControl
    {
        private string maSp = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request.QueryString["maSp"] != null)
                {
                    maSp = Request.QueryString["maSp"];
                }
                LayLoaiHang();
                hienTTSP(maSp);
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
            for (int i = 0; i < tblLoaiHang.Rows.Count; i++)
            {
                drlLoaiHang.Items.Add(new ListItem(tblLoaiHang.Rows[i]["sTenLoaiHang"].ToString(), tblLoaiHang.Rows[i]["iMaLH"].ToString()));
            }
        }

        private DataTable getTTSP(string maSP)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("layMatHangTheoMa", Cnn))
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

        private void hienTTSP(string ma)
        {
            DataTable tblTTSP = getTTSP(ma);
            txtTenSp.Text = tblTTSP.Rows[0]["sTenHang"].ToString();
            txtSoLuong.Text = tblTTSP.Rows[0]["iSoLuongCon"].ToString();
            txtMota.Text = tblTTSP.Rows[0]["sMoTa"].ToString();
            txtGia.Text = tblTTSP.Rows[0]["fGiaBan"].ToString();
            drlLoaiHang.SelectedValue= tblTTSP.Rows[0]["iMaLH"].ToString();
            ltrAnh.Text = "<img class='anhdaidien' src='/img/" + tblTTSP.Rows[0]["AnhBia"] + @"'/>";
            hidTenAnhCu.Value = tblTTSP.Rows[0]["AnhBia"].ToString();
        }



        protected void btnSua_Click(object sender, EventArgs e)
        {
            string tenanh = "";
            if (fulAnh.FileContent.Length > 0)
            {
                if (fulAnh.FileName.EndsWith(".jpg") || fulAnh.FileName.EndsWith(".jpeg") || fulAnh.FileName.EndsWith(".png") || fulAnh.FileName.EndsWith(".gif"))
                {
                    fulAnh.SaveAs(Server.MapPath("img/") + fulAnh.FileName);
                    tenanh = fulAnh.FileName;
                }
            }
            if (tenanh == "")
            {
                tenanh = hidTenAnhCu.Value;
            }



            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("suaSp", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@tenhang", txtTenSp.Text);
                    Cmd.Parameters.AddWithValue("@gia", txtGia.Text);
                    Cmd.Parameters.AddWithValue("@mota", txtMota.Text);
                    Cmd.Parameters.AddWithValue("@anh", tenanh);
                    Cmd.Parameters.AddWithValue("@soluong", txtSoLuong.Text);
                    Cmd.Parameters.AddWithValue("@maLH", drlLoaiHang.SelectedValue);
                    Cmd.Parameters.AddWithValue("@maMH", Request.QueryString["maSp"].ToString());
                    Cnn.Open();
                    int n = Cmd.ExecuteNonQuery();
                    Cnn.Close();
                    if (n > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sửa thông tin sản phẩm thành công!')", true);
                        
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