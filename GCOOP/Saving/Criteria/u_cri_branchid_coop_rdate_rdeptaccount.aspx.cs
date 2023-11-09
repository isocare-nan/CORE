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
using Sybase.DataWindow;

namespace Saving.Criteria
{
    public partial class u_cri_branchid_coop_rdate_rdeptaccount : PageWebSheet, WebSheet
    {
        protected String app;
        protected String gid;
        protected String rid;
        protected String pdf;
        protected String runProcess;
        protected String popupReport;
        private DwThDate tdw_criteria;
        public String outputProcess = "";

        #region WebSheet Members

        public void InitJsPostBack()
        {
            HdOpenIFrame.Value = "False";
            runProcess = WebUtil.JsPostBack(this, "runProcess");
            tdw_criteria = new DwThDate(dw_criteria, this);
            tdw_criteria.Add("start_date", "start_tdate");
            tdw_criteria.Add("end_date", "end_tdate");

        }

        //protected void Page_Load(object sender, EventArgs e)
        public void WebSheetLoadBegin()
        {
            //InitJsPostBack();
            //this.ConnectSQLCA();
            //dw_criteria.SetTransaction(sqlca);
            DwUtil.RetrieveDDDW(dw_criteria, "branch_id", "criteria.pbl", null);
            if (IsPostBack)
            {
                dw_criteria.RestoreContext();
            }
            else
            {
                //default values.
                dw_criteria.InsertRow(0);

                dw_criteria.SetItemString(1, "branch_id", state.SsCoopId);
                dw_criteria.SetItemDateTime(1, "start_date", state.SsWorkDate);
                dw_criteria.SetItemDateTime(1, "end_date", state.SsWorkDate);
                dw_criteria.SetItemString(1, "start_code", "");
                dw_criteria.SetItemString(1, "end_code", "");
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

            //String start_date = WebUtil.ConvertDateThaiToEng(dw_criteria, "start_tdate", null);
            //String end_date = WebUtil.ConvertDateThaiToEng(dw_criteria, "end_tdate", null);
            //String start_code = dw_criteria.GetItemString(1, "start_code");
            //String end_code = dw_criteria.GetItemString(1, "end_code");
            //String coop_name = state.SsCoopName;

            //String branch_id = dw_criteria.GetItemString(1, "branch_id");



            ////แปลง Criteria ให้อยู่ในรูปแบบมาตรฐาน.
            //ReportHelper lnv_helper = new ReportHelper();
            //lnv_helper.AddArgument(branch_id, ArgumentType.String);
            ////lnv_helper.AddArgument(coop_name, ArgumentType.String);
            //lnv_helper.AddArgument(start_date, ArgumentType.DateTime);
            //lnv_helper.AddArgument(end_date, ArgumentType.DateTime);
            //lnv_helper.AddArgument(start_code, ArgumentType.String);
            //lnv_helper.AddArgument(end_code, ArgumentType.String);

            //อ่านค่าจากหน้าจอใส่ตัวแปรรอไว้ก่อน.
            String start_date = WebUtil.ConvertDateThaiToEng(dw_criteria, "start_tdate", null);
            DateTime sdd = Convert.ToDateTime(start_date);
            String txtstrDate = sdd.ToString("dd/MM/yyyy");
            String end_date = WebUtil.ConvertDateThaiToEng(dw_criteria, "end_tdate", null);
            DateTime edd = Convert.ToDateTime(end_date);
            String txtendDate = edd.ToString("dd/MM/yyyy");
            String start_code = dw_criteria.GetItemString(1, "start_code");
            String end_code = dw_criteria.GetItemString(1, "end_code");
            String coop_name = state.SsCoopName;
            String branch_id = dw_criteria.GetItemString(1, "branch_id");
            ReportHelper lnv_helper = new ReportHelper();

            string sql_report = @"SELECT DPDEPTSTATEMENT.DEPTACCOUNT_NO
                FROM DPDEPTMASTER,   
                     DPDEPTSTATEMENT,   
                     DPDEPTTYPE,   
                     DPUCFDEPTITEMTYPE,   
                     CMCOOPCONSTANT  
               WHERE ( dpdeptmaster.deptaccount_no = dpdeptstatement.deptaccount_no (+)) and  
                     ( DPDEPTTYPE.DEPTTYPE_CODE = DPDEPTMASTER.DEPTTYPE_CODE ) and  
                     ( DPUCFDEPTITEMTYPE.DEPTITEMTYPE_CODE = DPDEPTSTATEMENT.DEPTITEMTYPE_CODE ) and  
                     ( DPDEPTSTATEMENT.COOP_ID = DPDEPTMASTER.COOP_ID ) and  
                     ( DPDEPTMASTER.COOP_ID = DPDEPTTYPE.COOP_ID ) and  
                     ( DPDEPTSTATEMENT.COOP_ID = DPUCFDEPTITEMTYPE.COOP_ID )  and  
                     ( DPDEPTSTATEMENT.DEPTACCOUNT_NO between  '" + start_code + "' and '" + end_code + "' )   AND ( DPDEPTSTATEMENT.OPERATE_DATE between to_date('" + sdd.ToString("dd/MM/yyyy") + "', 'dd/mm/yyyy') and to_date('" + edd.ToString("dd/MM/yyyy") + "', 'dd/mm/yyyy') ) AND    ( DPDEPTSTATEMENT.FORPRNBK_FLAG = 1  ) ";
            Sdt dt = WebUtil.QuerySdt(sql_report);
            //if (dt.Next())
            //{
            if (dt.Rows.Count > 0)
            {
                //แปลง Criteria ให้อยู่ในรูปแบบมาตรฐาน.

                lnv_helper.AddArgument(branch_id, ArgumentType.String);
                //lnv_helper.AddArgument(coop_name, ArgumentType.String);
                lnv_helper.AddArgument(start_date, ArgumentType.DateTime);
                lnv_helper.AddArgument(end_date, ArgumentType.DateTime);
                lnv_helper.AddArgument(start_code, ArgumentType.String);
                lnv_helper.AddArgument(end_code, ArgumentType.String);
            }
            else if (dt.Rows.Count == 0)
            {
                string sql_report2 = @"SELECT max(TO_CHAR(operate_date,'YYYY/MM/DD'))   as OPDATE
                    FROM DPDEPTMASTER,   
                         DPDEPTSTATEMENT,   
                         DPDEPTTYPE,   
                         DPUCFDEPTITEMTYPE,   
                         CMCOOPCONSTANT  
                   WHERE ( dpdeptmaster.deptaccount_no = dpdeptstatement.deptaccount_no (+)) and  
                         ( DPDEPTTYPE.DEPTTYPE_CODE = DPDEPTMASTER.DEPTTYPE_CODE ) and  
                         ( DPUCFDEPTITEMTYPE.DEPTITEMTYPE_CODE = DPDEPTSTATEMENT.DEPTITEMTYPE_CODE ) and  
                         ( DPDEPTSTATEMENT.COOP_ID = DPDEPTMASTER.COOP_ID ) and  
                         ( DPDEPTMASTER.COOP_ID = DPDEPTTYPE.COOP_ID ) and  
                         ( DPDEPTSTATEMENT.COOP_ID = DPUCFDEPTITEMTYPE.COOP_ID )  and 
                         ( DPDEPTSTATEMENT.DEPTACCOUNT_NO between  '" + start_code + "' and '" + end_code + "' )   AND  ( DPDEPTSTATEMENT.OPERATE_DATE < to_date('" + sdd.ToString("dd/MM/yyyy") + "', 'dd/mm/yyyy') )  AND    ( DPDEPTSTATEMENT.FORPRNBK_FLAG = 1  ) ";
                Sdt dt2 = WebUtil.QuerySdt(sql_report2);
                if (dt2.Rows.Count > 0)
                {
                    if (dt2.Next())
                    {
                        String date2 = dt2.GetString("OPDATE");
                        //String date2 = WebUtil.ConvertDateThaiToEng(1,OPDATE);
                        //DateTime date3 = DateTime.ParseExact(date2, "dd/MM/YYYY", null);
                        //แปลง Criteria ให้อยู่ในรูปแบบมาตรฐาน.                           
                        lnv_helper.AddArgument(branch_id, ArgumentType.String);
                        lnv_helper.AddArgument(date2, ArgumentType.DateTime);
                        lnv_helper.AddArgument(date2, ArgumentType.DateTime);
                        lnv_helper.AddArgument(start_code, ArgumentType.String);
                        lnv_helper.AddArgument(end_code, ArgumentType.String);
                    }
                }
            }
            //}

            //-------------------------------------------------------

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
