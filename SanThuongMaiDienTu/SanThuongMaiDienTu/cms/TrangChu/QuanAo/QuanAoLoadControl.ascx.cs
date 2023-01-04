using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrangThuongMaiDienTu.cms.TrangChu.QuanAo
{
    public partial class QuanAoLoadControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LayAllSanPhamQuanAo();
            }
            
        }
        private DataTable getAllMatHangQuanAo()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("layLoaiHangQuanAo", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter Da = new SqlDataAdapter(Cmd))
                    {
                        DataTable tbl = new DataTable("tblAllMatHangQuanAo");
                        Da.Fill(tbl);
                        return tbl;
                    }
                }
            }
        }
        private void LayAllSanPhamQuanAo()
        {
            DataTable tblAllMatHangQuanAo = getAllMatHangQuanAo();
            for (int i = 0; i < tblAllMatHangQuanAo.Rows.Count; i++)
            {
                string tien = Convert.ToDouble(tblAllMatHangQuanAo.Rows[i]["fGiaBan"]).ToString("N0");//Them dau phan cach hang nghin

                ltrListMatHang.Text += @"<div class='grid__colum-2-4 l-2-4 m-4 c-12'>
                                    <a class='home-product-item' href='#'>
                                        <div class='home-product-item__img'
                                            style='background-image: url(/img/" + tblAllMatHangQuanAo.Rows[i]["AnhBia"] + @");'>
                                        </div>
                                        <h4 class='home-product-item__name'>" + tblAllMatHangQuanAo.Rows[i]["sTenHang"] + @"</h4>
                                        <div class='home-product-item-price'>
                                            <span class='home-product-item-price-new'>" + tien + "đ" + @"</span>
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