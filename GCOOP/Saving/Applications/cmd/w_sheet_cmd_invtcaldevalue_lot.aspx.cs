using System;
using CoreSavingLibrary;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using DataLibrary;
using System.Globalization;
using System.Data.OracleClient;
using Sybase.DataWindow;
using CoreSavingLibrary.WcfNCommon;

namespace Saving.Applications.cmd
{
    public partial class w_sheet_cmd_invtcaldevalue_lot : PageWebSheet, WebSheet
    {
        protected String jsProcess;
        protected String jsAccYear;

        Sdt dt ;
        String pbl = "cmd_invtcaldevalue.pbl";

        public void InitJsPostBack()
        {
            jsProcess = WebUtil.JsPostBack(this, "jsProcess");
            jsAccYear = WebUtil.JsPostBack(this, "jsAccYear");
        }

        public void WebSheetLoadBegin()
        {
            this.ConnectSQLCA();
            DwDetail.SetTransaction(sqlca);
            if (!IsPostBack)
            {
                DwMain.InsertRow(0);
                JsPostSetBegin();
            }
            else
            {
                this.RestoreContextDw(DwMain);
            }
           
        }

        public void CheckJsPostBack(string eventArg)
        {
            switch (eventArg)
            {
                case "jsProcess":
                    SaveWebSheet();
                    break;
                case "jsAccYear":
                    JsChangeAccYear();
                    break;
            }
        }

        public void SaveWebSheet()
        {
            String invt_id = "", invt_lotid = "", insertsql = "", upsql = "";
            Decimal acc_year = 0, invt_month = 0, invt_bfamt = 0, invtincrease_amt = 0, invtdecrease_amt = 0;
            Decimal invt_type = 1, invt_bal = 0, post_status = 1;
            DateTime entry_date = new DateTime();
            int row = DwDetail.RowCount;
            acc_year = DwMain.GetItemDecimal(1, "acc_year") - 543;
            invt_month = DwMain.GetItemDecimal(1, "invt_month");

            try
            {
                for (int i = 1; i <= row; i++)
                {
                    try { invt_id = DwDetail.GetItemString(i, "invt_id").Trim(); }
                    catch { }
                    try { invt_lotid = DwDetail.GetItemString(i, "invt_lotid").Trim(); }
                    catch { }
                    try { invt_bfamt = DwDetail.GetItemDecimal(i, "invt_bfamt"); }
                    catch { invt_bfamt = 0; }
                    try { invtincrease_amt = DwDetail.GetItemDecimal(i, "increase_bal"); }
                    catch { invtincrease_amt = 0; }
                    try { invtdecrease_amt = DwDetail.GetItemDecimal(i, "decrease_bal"); }
                    catch { invtdecrease_amt = 0; }
                    try { invt_bal = DwDetail.GetItemDecimal(i, "invt_bal"); }
                    catch { invt_bal = 0; }

                    ///insert ptinvtcaldevalue
                    insertsql = @"INSERT INTO ptinvtcaldevalue 
                            ( acc_year, invt_month, invt_bfamt, invtincrease_amt, invtdecrease_amt,	
	                            invt_bal, invt_type,  invt_id, invt_lotid, entry_date, post_status
                            ) values
                            (" + acc_year + "," + invt_month + "," + invt_bfamt + "," + invtincrease_amt + @",
                                " + invtdecrease_amt + "," + invt_bal + "," + invt_type + ",'" + invt_id + @"',
                                '" + invt_lotid + "',to_date('" + entry_date.ToString("dd/MM/yyyy") + @"','dd/MM/yyyy')," + post_status + ")";
                    dt = WebUtil.QuerySdt(insertsql);

                    ///update ptinvtmast
                    upsql = @"update ptinvtmast set qty_bfbal = "+ invt_bal +" where invt_id = '"+ invt_id +"'";
                    dt = WebUtil.QuerySdt(upsql);
                }
                LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกสำเร็จ");
            }
            catch (Exception ex)
            { LtServerMessage.Text = WebUtil.ErrorMessage(ex); }

        }

        public void WebSheetLoadEnd()
        {
            DwMain.SaveDataCache();
        }

        private void JsChangeAccYear()
        {
            Decimal AccYear = 0, InvtMonth = 0;
            DateTime start_date = new DateTime();
            DateTime end_date = new DateTime();
            AccYear = DwMain.GetItemDecimal(1, "acc_year") - 543;
            InvtMonth = DwMain.GetItemDecimal(1, "invt_month");
            start_date = new DateTime(Convert.ToInt32(AccYear), Convert.ToInt32(InvtMonth), 1);
            end_date = start_date.AddMonths(1).AddDays(-1);
            DwDetail.Retrieve(end_date);
        }

        private void JsPostSetBegin()
        {
            String AccYear = "", InvtMonth = "";
            DateTime start_date = new DateTime();
            DateTime end_date = new DateTime();
            Int32 devStatus = 0;

            AccYear = GetAccYear(state.SsWorkDate);
            InvtMonth = state.SsWorkDate.ToString("MM");
            DwMain.SetItemDecimal(1, "acc_year", Convert.ToDecimal(AccYear) + 543);
            DwMain.SetItemDecimal(1, "invt_month", Convert.ToDecimal(InvtMonth));
            start_date = new DateTime(Convert.ToInt32(AccYear), Convert.ToInt32(InvtMonth), 1);
            end_date = start_date.AddMonths(1).AddDays(-1);

            ///เช็คว่าในเดือนที่ทำการประมวลมีการประมวลไปแล้วหรือไม่
            devStatus = CheckDevalue(Convert.ToDecimal(InvtMonth));
            if (devStatus == 1)
            {
                UpReturnInvalueMonth(Convert.ToDecimal(AccYear), Convert.ToDecimal(InvtMonth));
                ClearInvalueMonth(Convert.ToDecimal(AccYear), Convert.ToDecimal(InvtMonth));
            }

            DwDetail.Retrieve(start_date, end_date);
        }

        String GetAccYear(DateTime entry_date)
        {
            String AccYear = "";

            try
            {
                String se = @"select accperiod.account_year as account_year 
                            from	accperiod  
                            where accperiod.period_end_date in 
                            (	select	min( accperiod.period_end_date)
                            from accperiod  
                            where accperiod.period_end_date >= to_date('" + entry_date.ToString("dd/MM/yyyy") + @"','dd/MM/yyyy') ) ";
                dt = WebUtil.QuerySdt(se);
                if (dt.Next())
                {
                    AccYear = dt.GetString("account_year").Trim();
                }
            }
            catch { }
            return AccYear;
        }

        Int32 CheckDevalue(Decimal InvtMonth)
        {
            Int32 status = 0;
            Decimal invt_month = 0;
            String se = "select * from ptinvtcaldevalue where invt_month = " + InvtMonth + "";
            Sdt ta = WebUtil.QuerySdt(se);
            if (ta.Next())
            {
                invt_month = ta.GetDecimal("invt_month");
            }

            if (invt_month == InvtMonth)
            {
                status = 1;
            }
            return status;
        }

        private void UpReturnInvalueMonth(Decimal accYear, Decimal InvtMonth)
        {

            String upinvtbf = "update ptinvtmast p set p.qty_bal = " +
                              "( select pi.invt_bfamt from ptinvtcaldevalue pi " +
                              "where p.invt_id = pi.invt_id " +
                              "and pi.invt_month = " + InvtMonth + ")";
            Sdt upsql = WebUtil.QuerySdt(upinvtbf);
        }

        private void ClearInvalueMonth(Decimal accYear, Decimal InvtMonth)
        {
            String delintvalCal = "delete ptinvtcaldevalue where acc_year = " + accYear + " and invt_month = " + InvtMonth + "";
            Sdt delsql = WebUtil.QuerySdt(delintvalCal);
        }
    }
}