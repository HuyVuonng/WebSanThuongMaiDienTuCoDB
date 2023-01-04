using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrangThuongMaiDienTu.cms.TrangChu
{
    public partial class TrangChuLoadControl : System.Web.UI.UserControl
    {
        private string modul = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["modul"] != null)
            {
                modul = Request.QueryString["modul"];
                plTRangchu.Visible = false;
                plTrangchuLoadControl.Visible = true;
            }
            else
            {
                if (!IsPostBack)
                {
                    LayAllSanPham();
                }
            }
               

            switch (modul)
            {
                case "DoDienTu":
                    plTrangchuLoadControl.Controls.Add(LoadControl("DoDienTu/DoDienTuLoadControl.ascx"));
                    break;
                case "DoChoTre":
                    plTrangchuLoadControl.Controls.Add(LoadControl("DoChoTre/DoChoTreLoadControl.ascx"));
                    break;
                case "QuanAo":
                    plTrangchuLoadControl.Controls.Add(LoadControl("QuanAo/QuanAoLoadControl.ascx"));
                    break;
                case "DoGiaDung":
                    plTrangchuLoadControl.Controls.Add(LoadControl("DoGiaDung/DoGiaDungLoadControl.ascx"));
                    break;
            }
                    
        }

        private DataTable getAllMatHang()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("layToanBoMatHang", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter Da = new SqlDataAdapter(Cmd))
                    {
                        DataTable tbl = new DataTable("tblAllMatHang");
                        Da.Fill(tbl);
                        return tbl;
                    }
                }
            }
        }
        private void LayAllSanPham()
        {
            DataTable tblAllMatHang = getAllMatHang();
            for (int i = 0; i < tblAllMatHang.Rows.Count; i++)
            {
                string tien = Convert.ToDouble(tblAllMatHang.Rows[i]["fGiaBan"]).ToString("N0");//Them dau phan cach hang nghin

      
                ltrListMatHang.Text += @"<div class='grid__colum-2-4 l-2-4 m-4 c-12'>
                                    <a class='home-product-item' href='/ChiTietSanPham.aspx?Sp=" + tblAllMatHang.Rows[i]["iMaHang"] + @"'>
                                        <div class='home-product-item__img'
                                            style='background-image: url(/img/" + tblAllMatHang.Rows[i]["AnhBia"] + @");'>
                                        </div>
                                        <h4 class='home-product-item__name'>" + tblAllMatHang.Rows[i]["sTenHang"] + @"</h4>
                                        <div class='home-product-item-price'>
                                            <span class='home-product-item-price-new'>" + tien +"đ"+ @"</span>
                                        </div>
                                        <div class='home-product-item-action'>
                                            <span class='home-product-item_like home-product-item_like--liked'>
                                                <i class='home-product-item_like-icon-emty far fa-heart'></i>
                                                <i class='home-product-item_like-icon-fill fas fa-heart'></i>
                                            </span>
                                            <div class='home-product-item_rating'>
                                                <i class='home-product-item_gold fas fa-star'></i>
                                                <i class='home-product-item_gold fas fa-star'></i>
                                                <i class='home-product-item_gold fas fa-star'></i>
                                                <i class='home-product-item_gold fas fa-star'></i>
                                                <i class='fas fa-star'></i>
                                            </div>
                                            <span class='home-product-item_sold'>100 đã bán</span>
                                        </div>
                                        <!-- <div class='home-product-item-origin'>
                                            <span class='home-product-item_brand'>Whoo</span>
                                            <span class='home-product-item-origin-name'>Nhật Bản</span>
                                        </div> -->
                                        <div class='home-product-item_favorite'>
                                            <i class='fas fa-check'></i>
                                            <span>Yêu thích</span>
                                        </div>
                                    </a>
                                </div>";
            }
        }
    }
}