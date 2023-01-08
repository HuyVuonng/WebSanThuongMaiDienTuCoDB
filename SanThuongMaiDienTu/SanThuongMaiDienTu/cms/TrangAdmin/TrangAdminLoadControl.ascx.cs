using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanThuongMaiDienTu.cms.TrangAdmin
{
    public partial class TrangAdminLoadControl : System.Web.UI.UserControl
    {
        private string modulAdmin = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["modulAdmin"] != null)
            {
                modulAdmin = Request.QueryString["modulAdmin"];
                plAdminLoadControl.Visible = true;
                plAdmin.Visible = false;
            }
            else
            {
                if (!IsPostBack)
                {
                    LayAllDSShop();
                    LayAllDSTK();
                }
            }

            switch (modulAdmin)
            {
                case "Xoa":
                    plAdminLoadControl.Controls.Add(LoadControl("Xoa/XoaShopLoadControl.ascx"));
                    break;
                case "XoaTK":
                    plAdminLoadControl.Controls.Add(LoadControl("Xoa/XoaTKLoadControl.ascx"));
                    break;
            }
        }


        private DataTable getAllDSShop()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("layAllNoiBan", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter Da = new SqlDataAdapter(Cmd))
                    {
                        DataTable tbl = new DataTable("tblAllDSShop");
                        Da.Fill(tbl);
                        return tbl;
                    }
                }
            }
        }

        private DataTable getAllDSTK()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lienKetSQl"].ConnectionString;
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("prlayAllTK", Cnn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter Da = new SqlDataAdapter(Cmd))
                    {
                        DataTable tbl = new DataTable("tblAllDSTK");
                        Da.Fill(tbl);
                        return tbl;
                    }
                }
            }
        }



        private void LayAllDSShop()
        {
            DataTable tblAllDSShop = getAllDSShop();
            for (int i = 0; i < tblAllDSShop.Rows.Count; i++)
            {
                ltrDanhSachShop.Text += @"<tr class='hangtbl'>
                                     <td class='cotThanhPhan cotTenhang'>" + tblAllDSShop.Rows[i]["iMaNoiBan"] + @"</td>
                                     <td class='cotThanhPhan cotLoaihang'>" + tblAllDSShop.Rows[i]["sTenNoiBan"] + @"</td>
                                     <td class='cotThanhPhan cotAnhBia'>"+ tblAllDSShop.Rows[i]["sDiaChi"] + @"</td>
                                     <td class='cotThanhPhan cotMota'>" + tblAllDSShop.Rows[i]["sTaiKhoan"] + @"</td>
                                     <td class='cotThanhPhan cotSoLuong'>" + tblAllDSShop.Rows[i]["sDienThoai"] + @"</td>
                                    <td class='cotTieuDe cotTacvu'>
                                       <a onclick='return Conform_DeleteShop()' href = '/Admin.aspx?modulAdmin=Xoa&&maShop=" + tblAllDSShop.Rows[i]["iMaNoiBan"] + @"' class='btntacvu Xoa'  >Xóa</a>
                                     </td>
                                </tr>";
            }
        }


        private void LayAllDSTK()
        {
            DataTable tblAllDSTK = getAllDSTK();
            for (int i = 0; i < tblAllDSTK.Rows.Count; i++)
            {
                ltrDanhSachTKKhach.Text += @"<tr class='hangtbl'>
                                     <td class='cotThanhPhan cotTenhang'>" + tblAllDSTK.Rows[i]["iMaKH"] + @"</td>
                                     <td class='cotThanhPhan cotLoaihang'>" + tblAllDSTK.Rows[i]["sHoTen"] + @"</td>
                                     <td class='cotThanhPhan cotAnhBia'>" + tblAllDSTK.Rows[i]["sTaiKhoan"] + @"</td>
                                     <td class='cotThanhPhan cotMota'>" + tblAllDSTK.Rows[i]["sMatKhau"] + @"</td>
                                     <td class='cotThanhPhan cotMota'>" + tblAllDSTK.Rows[i]["sDiaChi"] + @"</td>
                                     <td class='cotThanhPhan cotSoLuong'>" + tblAllDSTK.Rows[i]["sDienThoai"] + @"</td>
                                    <td class='cotTieuDe cotTacvu'>
                                       <a onclick='return Conform_DeleteAccount()' href = '/Admin.aspx?modulAdmin=XoaTK&&email=" + tblAllDSTK.Rows[i]["sTaiKhoan"] + @"' class='btntacvu Xoa'  >Xóa</a>
                                     </td>
                                </tr>";
            }
        }


    }
}