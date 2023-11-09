using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;
using System.Data;
using System.Xml;
using CoreSavingLibrary.WcfNDeposit;
using CoreSavingLibrary.WcfNCommon;

namespace Saving.Applications.ap_deposit.dlg.wd_dep_booknew_ctrl
{
    public partial class wd_dep_booknew : PageWebDialog, WebDialog
    {
        [JsPostBack]
        public string PostSubmit_first { get; set; }
        [JsPostBack]
        public string PostSubmit_back { get; set; }
        [JsPostBack]
        public string PostSubmit_fee { get; set; }
        [JsPostBack]
        public string PostChkPassbook { get; set; }
        
        private n_commonClient ncommon;
        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);            
        }

        public void WebDialogLoadBegin()
        {
            HdCloseDlg.Value = "false";
            if (!IsPostBack)
            {
                try
                {
                    HdDeptAccountNo.Value = Request["deptAccountNo"].Trim();
                    HdLastSeqNo.Value = int.Parse(Request["seqNo"].Trim().Replace(",","")).ToString();
                    dsMain.DATA[0].as_oldbook = Request["deptPassBookNo"].Trim();
                    string ls_control = state.SsCoopControl;
                    dsMain.BOOKRESON();
                    dsMain.DATA[0].as_bookno = "";
                    dsMain.DATA[0].as_bookreson = "01";
                    dsMain.FindTextBox(0, "as_bookno").Focus();
                }
                catch (Exception ex)
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage("ไม่พบเลขลำดับรายการ");
                }              
            }
            else
            {
                
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostSubmit_first)
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
                string apvId = state.SsUsername;
                string bookNo = dsMain.DATA[0].as_bookno;
                string reason = dsMain.DATA[0].as_bookreson;
                short normFlag = 1;
                try
                {
                    short printStatus = 1;
                    string xml_return = "";
                    short reprint = 1;
                    
                    wcf.NDeposit.of_print_book_firstpage(state.SsWsPass, HdDeptAccountNo.Value, state.SsCoopId, state.SsWorkDate, state.SsUsername, bookNo, reason, apvId, normFlag, state.SsPrinterSet, reprint, printStatus, ref xml_return);

                    if (xml_return != "" && printStatus == 1)
                    {
                        UpdateNewBookLastPB(HdDeptAccountNo.Value, lastSeqNo);
                        Printing.DeptPrintBookFirstPage(this, xml_return);
                        HdCloseDlg.Value = "true";
                    }
                    LtServerMessage.Text = WebUtil.CompleteMessage("พิมพ์ปกหน้าสำเร็จ");
                }
                catch (Exception ex)
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage(ex);
                }
            }
            else if (eventArg == PostSubmit_back)
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
                    LtServerMessage.Text = WebUtil.CompleteMessage("พิมพ์ปกหลังสำเร็จ");
                }

                catch (Exception ex)
                {                  
                }
            }
            else if (eventArg == PostSubmit_fee)
            {
                String reason = dsMain.DATA[0].as_bookreson;
                if ((reason == "01" || reason == "02" || reason == "03" || reason == "04") && state.SsCoopControl == "018001") { PostFeeOfBook_Nan(); }

                string fils_no = HdFREE.Value;
                try
                {
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
                    LtServerMessage.Text = WebUtil.CompleteMessage("พิมพ์ใบเสร็จสำเร็จ");
                }
                catch (Exception ex)
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage("ไม่พบเลขเลขที่ใบเสร็จ");
                }
            }
            else if (eventArg == PostChkPassbook) {
                string passbookNo = "", passbookNohis = "", dep_No = "";
                try { passbookNo =dsMain.DATA[0].as_bookno.Replace("-", ""); }
                catch { passbookNo = ""; }                
                if (passbookNo.Length > 0)
                {
                    //เช็คเลขสมุดซ้ำกับที่มีใน dpdeptmaster
                    string sql = "select deptaccount_no from dpdeptmaster where deptpassbook_no = {0}";
                    sql = WebUtil.SQLFormat(sql, passbookNo);
                    Sdt dt_pb = WebUtil.QuerySdt(sql);
                    if (dt_pb.Next())
                    {
                        dep_No = dt_pb.GetString("deptaccount_no").Trim();
                    }
                    if (dep_No.Length > 0)
                    {
                        LtServerMessage.Text = WebUtil.ErrorMessage("เลขสมุด " + passbookNo + " มีการใช้แล้วในเลขบัญชี " + dep_No); return;
                    }
                    //เช็คไม่มีการลงทะเบียนสมุดในระบบ
                    sql = @"SELECT BOOK_NO FROM DPDEPTBOOKHIS  WHERE ( BOOK_STATUS = 8 ) AND BOOK_NO = {0}";
                    sql = WebUtil.SQLFormat(sql, passbookNo);
                    dt_pb = WebUtil.QuerySdt(sql);
                    if (dt_pb.Next())
                    {
                        passbookNohis = dt_pb.GetString("book_no").Trim();
                    }
                    if (passbookNohis.Length < 1)
                    {
                        LtServerMessage.Text = WebUtil.ErrorMessage("เลขสมุด " + passbookNo + " ไม่มีการลงทะเบียนสมุดในระบบ"); return;
                    }
                }
               
            }
        }

        public void WebDialogLoadEnd()
        {
            
        }
        private void PostFeeOfBook_Nan()
        {
            ncommon = wcf.NCommon;
            string member_no = "";
            string deptname = "", ls_chkinsert = "";

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
            try
            {
                int seqNew = seqNo - 1;
                seqNew = seqNew < 0 ? 0 : seqNew; //ถ้าน้อยกว่า 0 ให้เป็น 0
                string sql = "update dpdeptmaster set lastrec_no_pb = " + seqNew + ", lastline_no_pb = 1, lastpage_no_pb = 1 where coop_id = '" + state.SsCoopControl + "' and deptaccount_no='" + deptAccountNo + "'";
                Sdt dt = WebUtil.QuerySdt(sql);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return 1;
        }
    }
}