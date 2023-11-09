using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
//using CoreSavingLibrary.WcfNCommon;
//using CoreSavingLibrary.WcfNDeposit;
using CoreSavingLibrary.WcfNCommon;
using CoreSavingLibrary.WcfNDeposit;
using Sybase.DataWindow;
using DataLibrary;
using CoreSavingLibrary;

namespace Saving.Applications.ap_deposit.dlg
{
    public partial class w_dlg_dp_fine_interest : PageWebDialog, WebDialog
    {
        protected String newClear;
        protected String postSubmit;
        protected String postSubmit2;
        protected String filterBookNO;

        private n_depositClient ndept;
        private n_commonClient ncommon;
        public void InitJsPostBack()
        {
            newClear = WebUtil.JsPostBack(this, "newClear");
            postSubmit = WebUtil.JsPostBack(this, "postSubmit");
            postSubmit2 = WebUtil.JsPostBack(this, "postSubmit2");
            filterBookNO = WebUtil.JsPostBack(this, "filterBookNO");
        }

        public void WebDialogLoadBegin()
        {
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == "newClear")
            {
                JsNewClear();
            }
            else if (eventArg == "postSubmit")
            {
                JsPostSubmit();
            }
            else if (eventArg == "postSubmit2")
            {
                JsPostSubmit2();
            }
            else if (eventArg == "filterBookNO")
            {
                JsFilterBookNO();
            }
        }

        public void WebDialogLoadEnd()
        {

        }

        private void JsNewClear()
        {
           
        }
        //ค่าปรับ
        private void JsPostSubmit()
        {

            string slip_no = "";

           string sql1 = "select max(finslip.slip_no) as maxseq from  finslip , dpdeptslip where  dpdeptslip.deptslip_no =  finslip.ref_slipno  and finslip.itempaytype_code = 'FEE' and dpdeptslip.deptaccount_no = '" + Request.QueryString["deptAccountNo"] + "' and rownum =1  order by  finslip.slip_no DESC";
           
            Sdt dt1 = WebUtil.QuerySdt(sql1);
           if (dt1.Next())
           {
               slip_no = dt1.GetString("maxseq");
           }
        


            string sql2 = "select coop_type from amsecusers where user_name = '" + state.SsUsername + "'";
            Sdt dt2 = WebUtil.QuerySdt(sql2);
            if (dt2.Next()){
           
                if (dt2.GetString("coop_type").ToString() == "0")
                {
                    //Printing.PrintFinSlipRecv(this, state.SsCoopId, slip_no);
                    Printing.FinPrintSlipReceiveFEENan_Pua(this, state.SsCoopId, slip_no);
                }
                else
                {
                    //Printing.PrintFinSlipRecv_PUA(this, state.SsCoopId, slip_no);
                    Printing.FinPrintSlipReceiveFEENan(this, state.SsCoopId, slip_no);
                   
                }
            }
        }
        //ใบสำคัญจ่าย
        private void JsPostSubmit2()
        {

            string slip_no = "";

           
            string sql1 = "select Slip_no from FINSLIP where from_system = 'DEP' and remark = '" + Request.QueryString["deptAccountNo"] + "' and itempaytype_code = 'CCA'";
            Sdt dt1 = WebUtil.QuerySdt(sql1);
            if (dt1.Next())
            {
                slip_no = dt1.GetString("Slip_no");
            }



            string sql2 = "select coop_type from amsecusers where user_name = '" + state.SsUsername + "'";
            Sdt dt2 = WebUtil.QuerySdt(sql2);
            if (dt2.Next())
            {
                
                if (dt2.GetString("coop_type").ToString() == "0")
                {   
                    Printing.DepPrintSlipPayNan_Pua(this, state.SsCoopId, slip_no);
                }
                else
                {
                    Printing.DepPrintSlipPayNan(this, state.SsCoopId, slip_no);
                }
            }
        }

        private void JsFilterBookNO()
        {

        }
        private void PostFeeOfBook()
        {
           

        }


    }
}