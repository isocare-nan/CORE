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
    public partial class w_dlg_dp_booknew : PageWebDialog, WebDialog
    {
        protected String newClear;
        protected String postSubmit;
        protected String filterBookNO;
        private n_depositClient ndept;
        private n_commonClient ncommon;
        public void InitJsPostBack()
        {
            newClear = WebUtil.JsPostBack(this, "newClear");
            postSubmit = WebUtil.JsPostBack(this, "postSubmit");
            filterBookNO = WebUtil.JsPostBack(this, "filterBookNO");
        }

        public void WebDialogLoadBegin()
        {
            HdCloseDlg.Value = "false";
            if (!IsPostBack)
            {
                HdDeptAccountNo.Value = Request["deptAccountNo"].Trim();
                DwMain.InsertRow(0);
                try
                {
                    HdLastSeqNo.Value = int.Parse(Request["seqNo"]).ToString();
                    DwMain.SetItemString(1, "as_bookno", Request["deptPassBookNo"].Trim()); 
                }
                catch (Exception ex)
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage("ไม่พบเลขลำดับรายการ");
                }
               // this.SetFocusByClientId("as_bookno_0", this.GetType());
                SetDefaultBarCode();
                //DwUtil.RetrieveDDDW(DwMain, "as_bookno", "dp_slip.pbl", Request["deptTypeCode"].Trim(), state.SsCoopControl);
            }
            else
            {
                this.RestoreContextDw(DwMain);
            }
        }
        //bee barcode
        private void SetDefaultBarCode()
        {
            decimal barcodebook_status = Convert.ToInt32(WebUtil.GetDpDeptConstant("barcodebook_status"));
            if (barcodebook_status == null || barcodebook_status == 0)
            {
                HdColumFocus.Value = "0";
            }
            else
            {
                HdColumFocus.Value = "1";
            }
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
            else if (eventArg == "filterBookNO")
            {
                JsFilterBookNO();
            }
        }

        public void WebDialogLoadEnd()
        {
            try
            {
                DwUtil.RetrieveDDDW(DwMain, "as_bookreson", "dp_slip.pbl", null);
                DwUtil.RetrieveDDDW(DwMain, "as_bookno", "dp_slip.pbl", Request["deptTypeCode"].Trim(),state.SsCoopControl);
                DwMain.SetItemString(1, "as_oldbook", Request["deptPassbookNo"].Trim());


                String sql = "select min(Book_No) as mBN  from DPDEPTBOOKHIS,DPDEPTTYPE where DPDEPTBOOKHIS.Book_Status = '8' and DPDEPTBOOKHIS.Coop_Id = '" + state.SsCoopId + "' and (DPDEPTTYPE.BOOK_GROUP = DPDEPTBOOKHIS.BOOK_GRP) and DPDEPTTYPE.DEPTTYPE_CODE = '" + Request["deptTypeCode"] + "'";
                DataTable dt2 = WebUtil.Query(sql);
                string as_bookno = dt2.Rows[0]["mBN"].ToString().Trim();
                DwMain.SetItemString(1, "as_bookno", as_bookno);
            }
            catch
            {
            }
            DwMain.SaveDataCache();
        }

        private void JsNewClear()
        {
            String oldBook = "";
            String deptTypeCode = "";
            String bookBase = "";
            String bookGrp = "";
            if (IsPostBack)
            {
                DwMain.Reset();
            }
            DwMain.InsertRow(0);
            deptTypeCode = Request["deptTypeCode"];
            DataTable dt = WebUtil.Query("select book_stmbase as bookBase, book_group as bookGrp from dpdepttype where depttype_code='" + deptTypeCode + "'");
            if (dt.Rows.Count > 0)
            {
                bookBase = dt.Rows[0]["bookBase"].ToString().Trim();
                bookGrp = dt.Rows[0]["bookGrp"].ToString().Trim();
            }
            try
            {
                oldBook = Request["deptPassBookNo"].ToString().Trim();
                if (oldBook != "" || oldBook != null)
                {
                    DwMain.SetItemString(1, "as_oldbook", oldBook);
                }
                DwUtil.RetrieveDDDW(DwMain, "as_bookno", "dp_slip.pbl", state.SsCoopId, deptTypeCode);
                DwUtil.RetrieveDDDW(DwMain, "as_bookreson", "dp_slip.pbl", null);
                String sql = "select min(Book_No) as mBN  from DPDEPTBOOKHIS,DPDEPTTYPE where DPDEPTBOOKHIS.Book_Status = '8' and DPDEPTBOOKHIS.Coop_Id = '" + state.SsCoopId + "' and (DPDEPTTYPE.BOOK_GROUP = DPDEPTBOOKHIS.BOOK_GRP) and DPDEPTTYPE.DEPTTYPE_CODE = '" + deptTypeCode + "'";
                DataTable dt2 = WebUtil.Query(sql);
                string as_bookno = dt2.Rows[0]["mBN"].ToString().Trim();
                DwMain.SetItemString(1, "as_bookno", as_bookno);
                DataWindowChild bookNo = DwMain.GetChild("as_bookno");
                bookNo.SetFilter("( book_type ='" + bookBase + "' ) and ( book_grp ='" + bookGrp + "' )");
                bookNo.Filter();
            }
            catch { }
        }

        private void JsPostSubmit()
        {
            int lastSeqNo = -1;
            try
            {
                lastSeqNo = int.Parse(HdLastSeqNo.Value);
            }
            catch
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("ไม่พบเลขลำดับรายการ");
                return;
            }
            //DepositClient dep = wcf.Deposit;
            ndept = wcf.NDeposit;
            String apvId = state.SsUsername;
            String bookNo = DwUtil.GetString(DwMain, 1, "as_bookno", "");
            String reason = DwUtil.GetString(DwMain, 1, "as_bookreson", "");
            short normFlag = 1;
            try
            {
                short printStatus = 1;
                string xml_return = "", xml_return_bf = "";
                short reprint = 1;
                //String resonCode = DwMain.GetItemString(1, "");    // edit by mike ไม่ได้ใช้งาน และทำให้เกิด error

                //if ((reason == "01" || reason == "02" || reason == "03" || reason == "04") && state.SsCoopControl == "018001") { PostFeeOfBook_Nan(); }
                


                //ndept.of_print_book_firstpage(state.SsWsPass, HdDeptAccountNo.Value, state.SsCoopId, state.SsWorkDate, state.SsUsername, bookNo, reason, apvId, state.SsPrinterSet, normFlag, reprint, printStatus, ref xml_return, ref xml_return_bf);
                ndept.of_print_book_firstpage(state.SsWsPass, HdDeptAccountNo.Value, state.SsCoopId, state.SsWorkDate, state.SsUsername, bookNo, reason, apvId, normFlag, state.SsPrinterSet, reprint, printStatus, ref xml_return);
               
                if (xml_return != "" && printStatus == 1)
                {
                    UpdateNewBookLastPB( HdDeptAccountNo.Value, lastSeqNo);
                    Printing.DeptPrintBookFirstPage(this, xml_return);                   


                 //   HdCloseDlg.Value = "true";
                }
                //    HdCloseDlg.Value = "true";
                //tomy
                string reason2 = "", deptAccountNo = HdDeptAccountNo.Value;
                string sqlup = "select reson_desc from dpucfbookreson  where coop_id = '" + state.SsCoopControl + "' and reson_id = '" + reason  + "' and reson_id in ('01','02','03','04') and n_c_reson = 'N'";
                Sdt dtup = WebUtil.QuerySdt(sqlup);
                if (dtup.Next())
                {
                    reason2 = state.SsWorkDate.ToString("dd/MM/yyyy") + " - " + dtup.GetString("reson_desc").ToString();
                    String sql = "update dpdeptmaster set remark = '" + reason2 + "' where coop_id = '" + state.SsCoopControl + "' and deptaccount_no='" + deptAccountNo + "'";
                    Sdt dt = WebUtil.QuerySdt(sql);
                }
            }
            catch (Exception ex)
            {
                Label1.Text = WebUtil.ErrorMessage(ex);
            }
        }
        protected void FREE_Click(object sender, EventArgs e)
        {
            String reason = DwUtil.GetString(DwMain, 1, "as_bookreson", "");
            if ((reason == "01" || reason == "02" || reason == "03" || reason == "04") && state.SsCoopControl == "018001") { PostFeeOfBook_Nan(); }
                
            string fils_no = HdFREE.Value;
            try{
                string sql2 = "select coop_type from amsecusers where user_name = '" + state.SsUsername + "'";
                Sdt dt2 = WebUtil.QuerySdt(sql2);
                if (dt2.Next())
                {

                    if (dt2.GetString("coop_type").ToString() == "0")
                    {
                        Printing.FinPrintSlipReceiveFEENan_Pua(this, state.SsCoopId, fils_no);
                    }
                    else
                    {
                        Printing.FinPrintSlipReceiveFEENan(this, state.SsCoopId, fils_no); 
                    }
                }
            }catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("ไม่พบเลขเลขที่ใบเสร็จ");
            }          
        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            GetXmlPrintBackPage();

        }
        public void GetXmlPrintBackPage()
        {
            try
            {
                string sql = @"select deptaccount_no,
                            deptaccount_name,
                            condforwithdraw,
                             to_char( deptopen_date ,'dd/mm/')|| (to_char( deptopen_date,'yyyy') +543) as deptopen_date
                            from dpdeptmaster 
                            where coop_id = '" + state.SsCoopControl + @"' 
                            and deptaccount_no = '" + HdDeptAccountNo.Value + "'";
                DataTable dt = WebUtil.Query(sql);
                Printing.DeptPrintBookBackPage(this, dt);
            }

            catch (Exception ex)
            {
                Label1.Text = WebUtil.ErrorMessage(ex);
            }
        }

        private void JsFilterBookNO()
        {

        }

        private void PostFeeOfBook_Nan()
        {
            ncommon = wcf.NCommon;
            string member_no = "";
            string deptname = "", ls_chkinsert="";

            string sqlStr = @"select slip_no from finslip where entry_date=to_date('" + state.SsWorkDate.ToString("dd/MM/yyyy") + "', 'dd/mm/yyyy')  and itempaytype_code='FEE'  and account_no='" + HdDeptAccountNo.Value + "'  and ref_system='DEP' and payment_status=1";
            Sdt dt_chk = WebUtil.QuerySdt(sqlStr);
            if (dt_chk.Next())
            {
                ls_chkinsert = dt_chk.GetString("slip_no");
            }
            if (ls_chkinsert == "" || ls_chkinsert == null)
            {
                DataTable dt = WebUtil.Query("select member_no,deptaccount_name from dpdeptmaster where deptaccount_no='" + HdDeptAccountNo.Value + "'");
                if (dt.Rows.Count > 0)
                {
                    member_no = dt.Rows[0]["member_no"].ToString().Trim();
                    deptname = dt.Rows[0]["deptaccount_name"].ToString();
                }
                string ss = state.SsWorkDate.ToString().Substring(0, 10).Trim();
                // string ls_finslipno = ncommon.GetNewDocNo(state.SsWsPass, "FNRECEIVENO");       
                string ls_finslipno = ncommon.of_getnewdocno(state.SsWsPass, state.SsCoopControl, "FNRECEIVENO");
                string ls_receiptno = ncommon.of_getnewdocno(state.SsWsPass, state.SsCoopControl, "FINRECIEPTRECV");
                //HdLastSeqNo.Value = int.Parse(Request["seqNo"]).ToString();
                HdFREE.Value = ls_finslipno;
                String sqlInsert = @"INSERT INTO FINSLIP
                                    (COOP_ID,slip_no,entry_id,entry_date,operate_date,from_system,payment_status,cash_type,payment_desc,
                                     itempay_amt,member_no ,itempaytype_code,pay_recv_status,receive_status,member_flag,nonmember_detail,machine_id,tofrom_accid,account_no,remark,ref_system,pay_towhom,ITEM_AMTNET,receipt_no                       
                                    ) 
                                    VALUES 
                                    ('" + state.SsCoopId + "','" + ls_finslipno + "','" + state.SsUsername + "',to_date('" + state.SsWorkDate.ToString().Substring(0, 10).Trim() + "','mm/dd/yyyy'),to_date('" +
                                        state.SsWorkDate.ToString().Substring(0, 10).Trim() + "','mm/dd/yyyy')" + ",'FIN','" + 1 + "','CSH','ค่าปรับสมุดบัญชีใหม่','" + 50 + "','" + member_no + "','" +
                                    "FEE','" + 1 + "','" + 1 + "','" + 1 + "','" + deptname + "','" + state.SsClientIp + "','11110100','" + HdDeptAccountNo.Value + "','" + HdDeptAccountNo.Value + "','DEP','" + deptname + "','" + 50 + "','" + ls_receiptno + "')";
                Sta taInsert = new Sta(state.SsConnectionString);
                int result = taInsert.Exe(sqlInsert);

                //BY_BEE ผ่านรายการไปการเงิน              
                String laststm_no = "0";
                String amount_balance = "0";
                DataTable dt_fin = WebUtil.Query("select laststm_no+1 as laststm_no,amount_balance+50 as  amount_balance from fintableusermaster where opdatework=to_date('" + state.SsWorkDate.ToString("dd/MM/yyyy") + "', 'dd/mm/yyyy')  and user_name='" + state.SsUsername + "'");
                if (dt_fin.Rows.Count > 0)
                {
                    laststm_no = dt_fin.Rows[0]["laststm_no"].ToString().Trim();
                    amount_balance = dt_fin.Rows[0]["amount_balance"].ToString().Trim();
                }
                String sqlInsert_FIN = @"INSERT INTO fintableuserdetail
                                    (coop_id,user_name,opdatework,seqno,status,amount,itemtype_code,itemtype_desc,amount_balance,moneytype_code,DOC_NO,REF_STATUS ) 
                                    VALUES 
                                    ('" + state.SsCoopId + "','" + state.SsUsername + "',to_date('" + state.SsWorkDate.ToString("dd/MM/yyyy") + "', 'dd/mm/yyyy'),'" + laststm_no + "','22','50','FEE','ค่าปรับสมุดบัญชีใหม่','" + amount_balance + "','CSH','" + ls_finslipno + "','22')";
                Sdt sqlinsert = WebUtil.QuerySdt(sqlInsert_FIN);
                String updateFinmas = "update fintableusermaster set laststm_no = '" + laststm_no +
                                 "', amount_balance = '" + amount_balance + "' where opdatework = to_date('" + state.SsWorkDate.ToString("dd/MM/yyyy") + "', 'dd/mm/yyyy') AND user_name='" + state.SsUsername + "'";
                Sdt sqlupdatefinmas = WebUtil.QuerySdt(updateFinmas);
                //BY_BEE END
            }

        }

        public int UpdateNewBookLastPB(string deptAccountNo, int seqNo)
        {
           // Security sec = new Security(wsPass);
            //Sta ta = new Sta(sec.ConnectionString);
            try
            {
                int seqNew = seqNo - 1;
                seqNew = seqNew < 0 ? 0 : seqNew; //ถ้าน้อยกว่า 0 ให้เป็น 0

                String sql = "update dpdeptmaster set lastrec_no_pb = " + seqNew + ", lastline_no_pb = 1, lastpage_no_pb = 1 where coop_id = '" + state.SsCoopControl + "' and deptaccount_no='" + deptAccountNo + "'";
               // int ii = ta.Exe(sql);
                Sdt dt = WebUtil.QuerySdt(sql);
                //if (ii < 1)
                //{
                //    throw new Exception("ไม่พบการ update lastrec_no_pb " + deptAccountNo);
                //}
                //ta.Close();
            }
            catch (Exception ex)
            {
               // ta.Close();
                throw ex;
            }
            return 1;
        }
    }
}