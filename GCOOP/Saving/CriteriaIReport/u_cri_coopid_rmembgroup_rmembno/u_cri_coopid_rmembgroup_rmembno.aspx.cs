using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;

namespace Saving.CriteriaIReport.u_cri_coopid_rmembgroup_rmembno
{
    public partial class u_cri_coopid_rmembgroup_rmembno : PageWebReport, WebReport
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
                dsMain.DATA[0].coop_id = state.SsCoopControl;
                dsMain.DdMembgroup();
                string[] aa = ReportUtil.GetMinMaxMembgroup();
                string[] bb = ReportUtil.GetMinMaxMembno();
                dsMain.DATA[0].smembgroup_code = aa[0];
                dsMain.DATA[0].smembgroup_desc = aa[0];
                dsMain.DATA[0].emembgroup_code = aa[1];
                dsMain.DATA[0].emembgroup_desc = aa[1];
                dsMain.DATA[0].start_membno = bb[0];
                dsMain.DATA[0].end_membno = bb[1];
            }
        }

        public void CheckJsPostBack(string eventArg)
        {

        }

        public void RunReport()
        {
            string coop_id = dsMain.DATA[0].coop_id;
            string start_membgroup = dsMain.DATA[0].smembgroup_code;
            string end_membgroup = dsMain.DATA[0].emembgroup_code;
            string start_membno = WebUtil.MemberNoFormat( dsMain.DATA[0].start_membno );
            string end_membno = WebUtil.MemberNoFormat( dsMain.DATA[0].end_membno );
            string[] minmax = ReportUtil.GetMinMaxMembgroup();
            if (start_membgroup.Length < 1)
            {
                start_membgroup = minmax[0];
            }

            if (end_membgroup.Length < 1)
            {
                end_membgroup = minmax[1];
            }


            try
            {
                iReportArgument arg = new iReportArgument();
                arg.Add("as_coopid", iReportArgumentType.String, coop_id);
                arg.Add("as_smembgroup", iReportArgumentType.String, start_membgroup);
                arg.Add("as_emembgroup", iReportArgumentType.String, end_membgroup);
                arg.Add("as_smembno", iReportArgumentType.String, start_membno);
                arg.Add("as_emembno", iReportArgumentType.String, end_membno);
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