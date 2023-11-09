using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;

namespace Saving.CriteriaIReport.u_cri_coopid_date_rloantype_rmembgroup_rcountdate
{
    public partial class u_cri_coopid_date_rloantype_rmembgroup_rcountdate : PageWebReport, WebReport
    {

        protected String app;
        protected String gid;
        protected String rid;

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
        }

        public void WebSheetLoadBegin()
        {
            //--- Page Arguments
            try
            {
                app = Request["app"].ToString();
            }
            catch { }
            if (app == null || app == "")
            {
                app = state.SsApplication;
            }
            try
            {
                gid = Request["gid"].ToString();
            }
            catch { }
            try
            {
                rid = Request["rid"].ToString();
            }
            catch { }

            //Report Name.
            try
            {
                Sta ta = new Sta(state.SsConnectionString);
                String sql = "";
                sql = @"SELECT REPORT_NAME  
                    FROM WEBREPORTDETAIL  
                    WHERE ( GROUP_ID = '" + gid + @"' ) AND ( REPORT_ID = '" + rid + @"' )";
                Sdt dt = ta.Query(sql);
                ReportName.Text = dt.Rows[0]["REPORT_NAME"].ToString();
                ta.Close();
            }
            catch
            {
                ReportName.Text = "[" + rid + "]";
            }
            if (!IsPostBack)
            {
                dsMain.DdCoopId();
                dsMain.DdLoanTypeS();
                dsMain.DdLoanTypeE();
                dsMain.DdMembgroupS();
                dsMain.DdMembgroupE();
                dsMain.DATA[0].coop_id = state.SsCoopControl;
                dsMain.DATA[0].start_date = state.SsWorkDate;
                //dsMain.DATA[0].end_date = state.SsWorkDate;
                string[] minmax = ReportUtil.GetMinMaxLoantype();
                dsMain.DATA[0].start_loantype = minmax[0];
                dsMain.DATA[0].end_loantype = minmax[1];
                string[] minmax1 = ReportUtil.GetMinMaxMembgroup();
                dsMain.DATA[0].start_membgroup = minmax1[0];
                dsMain.DATA[0].end_membgroup = minmax1[1];
                dsMain.DATA[0].start_countdate = 30;
                dsMain.DATA[0].end_countdate = 60;
            }
        }

        public void CheckJsPostBack(string eventArg)
        {

        }

        public void RunReport()
        {
            try
            {
                String coop_id = dsMain.DATA[0].coop_id;
                DateTime start_date = dsMain.DATA[0].start_date;
                //DateTime end_date = dsMain.DATA[0].end_date;
                String start_loantype = dsMain.DATA[0].start_loantype;
                String end_loantype = dsMain.DATA[0].end_loantype;
                String start_membgroup = dsMain.DATA[0].start_membgroup;
                String end_membgroup = dsMain.DATA[0].end_membgroup;
                decimal start_countdate = dsMain.DATA[0].start_countdate;
                decimal end_countdate = dsMain.DATA[0].end_countdate;

                iReportArgument arg = new iReportArgument();

                arg.Add("as_coopid", iReportArgumentType.String, coop_id);
                arg.Add("adtm_sdate", iReportArgumentType.Date, start_date);
                //arg.Add("adtm_enddate", iReportArgumentType.Date, end_date);
                arg.Add("as_sloantype", iReportArgumentType.String, start_loantype);
                arg.Add("as_eloantype", iReportArgumentType.String, end_loantype);
                arg.Add("as_smembgroup", iReportArgumentType.String, start_membgroup);
                arg.Add("as_emembgroup", iReportArgumentType.String, end_membgroup);
                arg.Add("an_scountdate", iReportArgumentType.Integer, start_countdate);
                arg.Add("an_ecountdate", iReportArgumentType.Integer, end_countdate);

                iReportBuider report = new iReportBuider(this, arg);
                report.Retrieve();
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }

        }

        public void WebSheetLoadEnd()
        {

        }
    }
}