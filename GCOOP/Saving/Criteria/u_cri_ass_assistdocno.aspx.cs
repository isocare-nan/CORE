﻿using System;
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

namespace Saving.Criteria
{
    public partial class u_cri_ass_assistdocno : PageWebSheet, WebSheet
    {
        protected String app;
        protected String gid;
        protected String rid;
        protected String pdf;
        protected String runProcess;
        protected String popupReport;
        protected String postMemberno;
        private DwThDate tdw_criteria;
        public String outputProcess = "";

        #region WebSheet Members

        private void JspostMemberno()
        {
            String memberno = dw_criteria.GetItemString(1, "as_memberno");
            memberno = WebUtil.MemberNoFormat(memberno);
            dw_criteria.SetItemString(1, "as_memberno", memberno);

            DwUtil.RetrieveDDDW(dw_criteria, "as_docno", "criteria.pbl", memberno);
        }

        public void InitJsPostBack()
        {

            HdOpenIFrame.Value = "False";
            runProcess = WebUtil.JsPostBack(this, "runProcess");
            tdw_criteria = new DwThDate(dw_criteria, this);
            postMemberno = WebUtil.JsPostBack(this, "postMemberno");

        }

        //protected void Page_Load(object sender, EventArgs e)
        public void WebSheetLoadBegin()
        {
            // InitJsPostBack();



            if (IsPostBack)
            {
                dw_criteria.RestoreContext();
            }
            else
            {
                //default values.
                dw_criteria.InsertRow(0);
                dw_criteria.SetItemString(1, "as_memberno", "");
                tdw_criteria.Eng2ThaiAllRow();
            }

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

            //Link back to the report menu.
            LinkBack.PostBackUrl = String.Format("~/ReportDefault.aspx?app={0}&gid={1}", app, gid);
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == "runProcess")
            {
                RunProcess();
            }
            else if (eventArg == "popupReport")
            {
                PopupReport();
            }
            else if (eventArg == "postMemberno")
            {
                JspostMemberno();
            }
        }
        public void SaveWebSheet()
        {
        }

        public void WebSheetLoadEnd()
        {
        }

        #endregion
        #region Report Process
        private void RunProcess()
        {
            //อ่านค่าจากหน้าจอใส่ตัวแปรรอไว้ก่อน.



            String as_docno = dw_criteria.GetItemString(1, "as_docno");

            //แปลง Criteria ให้อยู่ในรูปแบบมาตรฐาน.
            ReportHelper lnv_helper = new ReportHelper();


            lnv_helper.AddArgument(as_docno, ArgumentType.String);

            //ชื่อไฟล์ PDF = YYYYMMDDHHMMSS_<GID>_<RID>.PDF
            String pdfFileName = DateTime.Now.ToString("yyyyMMddHHmmss", WebUtil.EN);
            pdfFileName += "_" + gid + "_" + rid + ".pdf";
            pdfFileName = pdfFileName.Trim();

            //ส่งให้ ReportService สร้าง PDF ให้ {โดยปกติจะอยู่ใน C:\GCOOP\Saving\PDF\}.
            try
            {
                //CoreSavingLibrary.WcfReport.ReportClient lws_report = wcf.Report;
                String criteriaXML = lnv_helper.PopArgumentsXML();
                //this.pdf = lws_report.GetPDFURL(state.SsWsPass) + pdfFileName;

                string printer = dw_criteria.GetItemString(1, "printer");
                outputProcess = WebUtil.runProcessingReport(state, app, gid, rid, criteriaXML, pdfFileName, printer);

                //String li_return = lws_report.Run(state.SsWsPass, app, gid, rid, criteriaXML, pdfFileName);
                //if (li_return == "true")
                //{
                //    HdOpenIFrame.Value = "True";
                //}
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
                return;
            }
        }
        public void PopupReport()
        {
            //เด้ง Popup ออกรายงานเป็น PDF.
            String pop = "Gcoop.OpenPopup('" + pdf + "')";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "DsReport", pop, true);
        }
        #endregion

    }
}
