using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;

namespace Saving.Applications.assist.ws_as_close_year_ctrl
{
    public partial class ws_as_close_year : PageWebSheet, WebSheet
    {
       
        [JsPostBack]
        public string PostNewRow { get; set; }
        [JsPostBack]
        public string PostDelRow { get; set; }
        [JsPostBack]
        public string PostSetDefaltDate { get; set; }

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                //dsList.Retrieve();//show data first
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostNewRow)
            {

            }

        }
       
        public void SaveWebSheet()
        {
            string sqlStr, ls_chkassiscode = "";
            int li_row;
            decimal ld_assyear = 0;
            DateTime start_date, end_date;
            try
            {
                //for (li_row = 0; li_row < dsList.RowCount; li_row++)
                //{
                //    if (dsList.DATA[li_row].ASS_YEAR.ToString() == "")
                //    {
                //        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('กรุณากรอกปีสวัสดิการ');", true); return;
                //    }
                //    else if (dsList.DATA[0].START_YEAR.ToString("dd/MM/yyyy") == "01/01/1500")
                //    {
                //        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('กรุณากรอกวันเริ่มต้นปีสวัสดิการ');", true); return;
                //    }
                //    else if (dsList.DATA[0].END_YEAR.ToString("dd/MM/yyyy") == "01/01/1500")
                //    {
                //        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('กรุณากรอกวันสิ้นสุดปีสวัสดิการ');", true); return;
                //    }
                //    else if (ls_chkassiscode.IndexOf(dsList.DATA[li_row].ASS_YEAR.ToString()) > 0)
                //    {
                //        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('ปีสวัสดิการซ้ำกัน กรุณาตรวจสอบ');", true); return;
                //    }
                //    ls_chkassiscode = ls_chkassiscode + ", " + dsList.DATA[li_row].ASS_YEAR.ToString();

                //}
                //for (li_row = 0; li_row < dsList.RowCount; li_row++)
                //{
                //    ld_assyear = dsList.DATA[li_row].ASS_YEAR - 543;
                //    start_date = dsList.DATA[li_row].START_YEAR;
                //    end_date = dsList.DATA[li_row].END_YEAR;
                //    //chk ปีสวัสดิการ
                //    string sql = @"select * from ASSUCFYEAR where ASS_YEAR={0} and coop_id={1}";
                //    sql = WebUtil.SQLFormat(sql, ld_assyear, state.SsCoopControl);
                //    Sdt dt = WebUtil.QuerySdt(sql);
                //    if (dt.Next())
                //    {
                //        sqlStr = @"update ASSUCFYEAR set 
                //                START_YEAR={2}, END_YEAR={3} where ASS_YEAR={1} and coop_id={0}
                //                ";
                //        sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopId, ld_assyear, start_date, end_date);
                //        WebUtil.ExeSQL(sqlStr);
                //    }
                //    else
                //    {
                //        sqlStr = @"insert into ASSUCFYEAR 
                //            (ASS_YEAR, START_YEAR, END_YEAR,coop_id)
                //            values
                //            ({0}, {1}, {2},{3})";
                //        sqlStr = WebUtil.SQLFormat(sqlStr, ld_assyear, start_date, end_date, state.SsCoopId);
                //        WebUtil.ExeSQL(sqlStr);
                //    }
                //}
                //dsList.Retrieve();
                LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกข้อมูลสำเร็จ");
            }
            catch
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกไม่สำเสร็จ");
            }
        }

        public void WebSheetLoadEnd()
        {

        }
    }
}