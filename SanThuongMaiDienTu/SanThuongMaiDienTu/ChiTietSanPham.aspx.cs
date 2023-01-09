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
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        string manoiban = "";
        string SP = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
          
            if (!IsPostBack)
            {
                if (Session["KhachHang"] != null && Session["KhachHang"].ToString() == "1")
                {
                    //Đã đăng nhập
                    plDaDN.Visible = true;
                    plChuaDN.Visible = false;
                    plDaDN_mobile.Visible = true;
                    plChuaDNmobile.Visible = false;
                    if (Session["TenKH"] != null)
                        ltrTenKH_mobile.Text = ltrTenKH.Text = Session["TenKH"].ToString();
                }
                else
                {
                    plDaDN.Visible = false;
                    plChuaDN.Visible = true;
                    plDaDN_mobile.Visible = false;
                    plChuaDNmobile.Visible = true;
                }
                if (Request.QueryString["Sp"] != null)
                {
                    SP = Request.QueryString["Sp"];
                }
                LayTTSanPham(SP);
            }

        }

        protected void lbtDangXuatCTSP_Click(object sender, EventArgs e)
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


        protected void lbtTimKiemCTSP_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(txtTimKiem.Text))
            {
                //Response.Redirect("/TrangChu.aspx?modul=TimKiem&&SanPham="+ txtTimKiem.Text+@"");
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
        protected void lbtBanHangCTSP_Click(object sender, EventArgs e)
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
            soluongmua.Value = "1";
            string tien = Convert.ToDouble(tblTTSP.Rows[0]["fGiaBan"]).ToString("N0");//Them dau phan cach hang nghin
            ltrGiaban.Text = tien;
            ltrMota.Text += tblTTSP.Rows[0]["sMoTa"];
            ltrShopBan.Text += tblTTSP.Rows[0]["sTenNoiBan"];
            ltrSoLuongCon.Text += tblTTSP.Rows[0]["iSoLuongCon"];
            ltrTenSP.Text += tblTTSP.Rows[0]["sTenHang"];
            ltrAnhSP.Text += "style='background-image: url(/img/" + tblTTSP.Rows[0]["AnhBia"] + @");'";
            
        }

        protected void btnThemvaoGioHang_Click(object sender, EventArgs e)
        {
            if (Session["MaKh"]== null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bạn cần đăng nhập tàu khoản để mua sản phẩm')", true);
            }
            else
            {
                string SP1 = Request.QueryString["Sp"];
                DataTable tblTTSP = getMatHangTheoMa(SP1);
                manoiban = tblTTSP.Rows[0]["iMaNoiBan"].ToString();
                string maKH = Session["MaKh"].ToString();
                soluongmua.Value = soluongmua.Value;
                int SLMathangMuonMua = Convert.ToInt16(soluongmua.Value);
                Double giaBan = Convert.ToDouble(ltrGiaban.Text) * SLMathangMuonMua;

                string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
                using (SqlConnection Cnn = new SqlConnection(connectionString))
                {
                    using (SqlCommand Cmd = new SqlCommand("prThemvaoGioHang", Cnn))
                    {
                        Cmd.CommandType = CommandType.StoredProcedure;
                        Cmd.Parameters.AddWithValue("@maKH", maKH);
                        Cmd.Parameters.AddWithValue("@maHang", SP1);
                        Cmd.Parameters.AddWithValue("@maShop", manoiban);
                        Cmd.Parameters.AddWithValue("@soLuong", SLMathangMuonMua);
                        Cmd.Parameters.AddWithValue("@gia", giaBan);

                        Cnn.Open();
                        int n = Cmd.ExecuteNonQuery();
                        Cnn.Close();
                        if (n > 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thêm vào giỏ hàng thành công!')", true);
                        }
                    }//cmd
                }//Cnn
            }
            


           
        }
    }
}