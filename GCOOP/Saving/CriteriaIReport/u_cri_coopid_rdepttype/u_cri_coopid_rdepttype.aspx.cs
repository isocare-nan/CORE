﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;

namespace Saving.CriteriaIReport.u_cri_coopid_rdepttype
{
    public partial class u_cri_coopid_rdepttype : PageWebReport, WebReport
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
                dsMain.DdDeptTypeS();
                dsMain.DdDeptTypeE();
                dsMain.DATA[0].start_depttype = "02";
                dsMain.DATA[0].end_depttype = "30";
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            
        }

        public void RunReport()
        {
           
            string as_coopid = dsMain.DATA[0].coop_id;
            string depttypes = dsMain.DATA[0].start_depttype;
            string depttypee = dsMain.DATA[0].end_depttype;
            //string ls_sql = @"select max(recv_period) as recv_period from kptempreceive";
            //Sdt dt = WebUtil.QuerySdt(ls_sql);
            //if (dt.Next())
            //{
            //    li_period = Convert.ToInt32(dt.GetString("recv_period"));
            //}

            try
            {
                iReportArgument arg = new iReportArgument();
                arg.Add("as_coopid", iReportArgumentType.String, state.SsCoopControl);
                arg.Add("as_starttype", iReportArgumentType.String, depttypes);
                arg.Add("as_endtype", iReportArgumentType.String, depttypee);

                iReportBuider report = new iReportBuider(this, arg);
                //if (an_period < li_period)
                //{
                //    report.AddCriteria("r_010_kp_slip_mthkeep_mas", "ใบเสร็จเรียกเก็บประจำเดือน", ReportType.pdf, arg);
                //}
                //else
                //{
                //    report.AddCriteria("r_010_kp_slip_mthkeep", "ใบเสร็จเรียกเก็บประจำเดือน", ReportType.pdf, arg);
                //}
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