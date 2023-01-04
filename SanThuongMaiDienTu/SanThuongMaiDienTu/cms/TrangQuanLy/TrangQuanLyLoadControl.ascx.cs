using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanThuongMaiDienTu.cms.TrangQuanLy
{
    public partial class TrangQuanLyLoadControl : System.Web.UI.UserControl
    {
        private string modulQuanLy = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["modulQuanLy"]!=null)
            {
                modulQuanLy = Request.QueryString["modulQuanLy"];
                plQuanLyLoadControl.Visible = true;
                plQuanLy.Visible = false;
            }
            else
            {
                if (!IsPostBack)
                {
                    LayAllDSHangCuaShop();
                }
            }

            switch (modulQuanLy)
            {
                case "Them":
                    plQuanLyLoadControl.Controls.Add(LoadControl("Them/ThemLoadControl.ascx"));
                    break;
                case "Sua":
                    plQuanLyLoadControl.Controls.Add(LoadControl("Sua/SuaLoadControl.ascx"));
                    break;
                case "Xoa":
                    plQuanLyLoadControl.Controls.Add(LoadControl("Xoa/XoaLoadControl.ascx"));
                    break;
                
            }
        }

        private DataTable getAllDSHangCuaShop()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("prLayHangHoaTheoNguoiBan", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.Add("@taikhoan", Session["Email"].ToString());
                    using (SqlDataAdapter Da = new SqlDataAdapter(Cmd))
                    {
                        DataTable tbl = new DataTable("tblAllDSHangCuaShop");
                        Da.Fill(tbl);
                        return tbl;
                    }
                }
            }
        }

        private void LayAllDSHangCuaShop()
        {
            DataTable tblAllDSHangCuaShop = getAllDSHangCuaShop();
            for (int i = 0; i < tblAllDSHangCuaShop.Rows.Count; i++)
            {
                string tien = Convert.ToDouble(tblAllDSHangCuaShop.Rows[i]["fGiaBan"]).ToString("N0");//Them dau phan cach hang nghin

                ltrDanhSach.Text += @"<tr class='hangtbl'>
                                     <td class='cotThanhPhan cotTenhang'>" + tblAllDSHangCuaShop.Rows[i]["sTenHang"] + @"</td>
                                     <td class='cotThanhPhan cotLoaihang'>" + tblAllDSHangCuaShop.Rows[i]["sTenLoaiHang"] + @"</td>
                                     <td class='cotThanhPhan cotAnhBia'><img class='anhSp' src='img/" + tblAllDSHangCuaShop.Rows[i]["AnhBia"] + @"'></td>
                                     <td class='cotThanhPhan cotMota'>" + tblAllDSHangCuaShop.Rows[i]["sMoTa"] + @"</td>
                                     <td class='cotThanhPhan cotSoLuong'>" + tblAllDSHangCuaShop.Rows[i]["iSoLuongCon"] + @"</td>
                                     <td class='cotThanhPhan cotGiaban'>" + tien + @"</td>
                                    <td class='cotTieuDe cotTacvu'>
                                       <a href='/QuanLyShop.aspx?modulQuanLy=Sua&&maSp=" + tblAllDSHangCuaShop.Rows[i]["iMaHang"] + @"' class='btntacvu SuaBTN' >Sửa</a>
                                       <a onclick='return Conform_Delete()' href = '/QuanLyShop.aspx?modulQuanLy=Xoa&&maSp=" + tblAllDSHangCuaShop.Rows[i]["iMaHang"] + @"' class='btntacvu Xoa'  >Xóa</a>
                                     </td>
                                </tr>";
            }
        }
    }
}