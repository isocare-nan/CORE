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
using Sybase.DataWindow;
using System.Data.OracleClient;
using System.Globalization;
using CoreSavingLibrary.WcfNDeposit;
using CoreSavingLibrary.WcfNCommon;
using DataLibrary;
using System.Web.Services.Protocols;

namespace Saving.Applications.ap_deposit
{
    public partial class w_dlg_dp_dayproc_wizard_new : PageWebSheet, WebSheet
    {
        // JavaSctipt PostBack
        protected String postCloseDay;
        private DwThDate tdw_closeday;
        public string outputProcess;

        #region WebSheet Members

        public void InitJsPostBack()
        {
            postCloseDay = WebUtil.JsPostBack(this, "postCloseDay");
            tdw_closeday = new DwThDate(Dw_date, this);
            tdw_closeday.Add("proc_date", "proc_tdate");
        }

        public void WebSheetLoadBegin()
        {
            HdCloseday.Value = "false";
            if (!IsPostBack)
            {
                Dw_date.InsertRow(0);
                Dw_date.SetItemDate(1, "proc_date", state.SsWorkDate);
                tdw_closeday.Eng2ThaiAllRow();
            }
            else
            {
                this.RestoreContextDw(Dw_date);
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == "postCloseDay")
            {
                JsPostCloseDay();
            }
        }

        public void SaveWebSheet()
        {
        }

        public void WebSheetLoadEnd()
        {
            Dw_date.SaveDataCache();
            //update ดอกเบี้ยสะสม
            try
            {
                ExecuteDataSource exe = new ExecuteDataSource(this);
                string sql = @"update dpdeptmaster a set a.accuint_amt = ( select a1.accuint_amt
                                                                       from dpdeptstatement a1
                                                                       where	a1.deptaccount_no	= a.deptaccount_no and
                                                                       a1.coop_id				= '018001' and
                                                                       a1.seq_no = ( select a2.laststmseq_no
                                                                                     from dpdeptmaster a2
                                                                                     where a2.deptaccount_no	= a.deptaccount_no and
                                                                                     a2.coop_id = '018001' ))
                           where (select a1.accuint_amt from dpdeptstatement a1                           
                           	      where	a1.deptaccount_no = a.deptaccount_no and
				                        a1.coop_id = '018001' and
				                        a1.seq_no = ( select a2.laststmseq_no
						                              from dpdeptmaster a2
						                              where a2.deptaccount_no = a.deptaccount_no and
								                            a2.coop_id = '018001' ) ) <> a.accuint_amt";
                exe.SQL.Add(sql);
                exe.Execute();
            }
            catch { }
        }

        #endregion

        private void JsPostCloseDay()
        {
            n_depositClient depService = wcf.NDeposit;
            DateTime closeDate = new DateTime(1370, 1, 1);
            try
            {
                closeDate = Dw_date.GetItemDateTime(1, "proc_date");
            }
            catch { }
            try
            {
                //depService.RunCloseDayProcess(state.SsWsPass, state.CurrentPage, closeDate, state.SsWorkDate, state.SsApplication,state.SsCoopControl, state.SsUsername, state.SsClientIp);
                //HdCloseday.Value = "true";
                outputProcess = WebUtil.runProcessing(state, "DPCLSDAY", closeDate.ToString("dd/MM/yyyy"), state.SsClientIp, "");

            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }

        }
    }
}