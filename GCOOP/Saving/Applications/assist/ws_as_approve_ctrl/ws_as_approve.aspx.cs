using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;
using System.Data;
using System.Globalization;
using System.Drawing;

namespace Saving.Applications.assist.ws_as_approve_ctrl
{
    public partial class ws_as_approve : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public string PostSearch { get; set; }
        [JsPostBack]
        public string PostChangeStatus { get; set; }
        [JsPostBack]
        public string PostSort { get; set; }
        [JsPostBack]
        public string InitAsssistpaytype { get; set; }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostSearch)
            {

                Hd_sortbegin.Value = "1";
                dsMain.DATA[0].sort_type = "";
                this.of_getdata();
            }
            else if (eventArg == PostChangeStatus)
            {
                for (int i = 0; i < dsList.RowCount; i++)
                {
                    if (dsList.DATA[i].choose_flag == "1")
                    {
                        dsList.DATA[i].REQ_STATUS = Convert.ToDecimal(dsMain.DATA[0].req_status);
                    }
                }
            }
            else if (eventArg == PostSort)
            {
                Hd_sortbegin.Value = "2";
                this.of_getdata();
            }
            else if (eventArg == InitAsssistpaytype)
            {
                string ls_minpaytype = "", ls_maxpaytype = "";
                if (dsMain.DATA[0].assisttype_code == "")
                {
                    dsMain.ResetRow();
                    dsMain.DdAssistType();
                    dsMain.DATA[0].conclusion_no = "";
                    dsMain.DATA[0].conclusion_date = state.SsWorkDate;
                }
                else
                {
                    dsMain.AssistPayType(dsMain.DATA[0].assisttype_code, ref ls_minpaytype, ref ls_maxpaytype);
                    dsMain.DATA[0].assistpay_code1 = ls_minpaytype;
                    dsMain.DATA[0].assistpay_code2 = ls_maxpaytype;
                }
                Page.ClientScript.RegisterStartupScript(this.GetType(), "setlabel", "setlabel()", true);
            }
        }

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
            dsList.InitDsList(this);
        }

        public void SetgrpLabel()
        {
            Hd_setlabel.Value = "";
            string sqlassgrp = @" select  assisttype_code,assisttype_group from assucfassisttype
                                where assisttype_code={0}";
            sqlassgrp = WebUtil.SQLFormat(sqlassgrp, dsMain.DATA[0].assisttype_code);
            Sdt ta = WebUtil.QuerySdt(sqlassgrp);
            if (ta.Rows.Count > 0)
            {
                if (ta.Next())
                { 
                    Hd_setlabel.Value = ta.GetString("assisttype_group");
                }
            }
        }

        public void SaveWebSheet()
        {

            string ls_assisreq = "", ls_assiscont = "", ls_remark = "", ls_contractno = "", ls_moneytype = "", ls_sendsystem = "", ls_deptno = "";
            Int32 li_apvstt;
            Int32 li_result = 0, li_stmflag = 0;

            // ตรวจสอบก่อนว่ามีปรับสถานะเป็นอนุมัติหรือยัง
            for (int i = 0; i < dsList.RowCount; i++)
            {
                if (dsList.DATA[i].choose_flag == "1")
                {
                    li_apvstt = Convert.ToInt32(dsList.DATA[i].REQ_STATUS);
                    if (li_apvstt == 8)
                    {
                        LtServerMessage.Text = WebUtil.ErrorMessage("กรุณาระบุสถานะการอนุมัติให้ครบถ้วนด้วย");
                        return;
                    }
                }
            }

            for (int i = 0; i < dsList.RowCount; i++)
            {
                if (dsList.DATA[i].choose_flag == "1")
                {
                    ls_assisreq = dsList.DATA[i].ASSIST_DOCNO.Trim();
                    li_apvstt = Convert.ToInt32(dsList.DATA[i].REQ_STATUS);
                    ls_remark = dsMain.DATA[0].conclusion_no;
                    li_stmflag = dsList.DATA[i].stm_flag; //กรณีจ่ายต่อเนื่อง ไม่ต้องสร้างสัญญาใหม่
                    ls_contractno = dsList.DATA[i].asscontract_no;
                    ls_moneytype = dsList.DATA[i].moneytype_code;
                    ls_sendsystem = dsList.DATA[i].send_system;
                    ls_deptno = dsList.DATA[i].deptaccount_no;

                    if (li_stmflag != 1 && (ls_contractno == "" || ls_contractno == null))
                    {
                        if (li_apvstt == 1)
                        {
                            ls_assiscont = wcf.NCommon.of_getnewdocno(state.SsWsPass, state.SsCoopId, "ASSISTCONTNO");
                        }

                        li_result = this.of_buildasscont(ls_assisreq, ls_assiscont, li_apvstt, ls_remark, li_stmflag);

                        if (li_result != 1)
                        {
                            return;
                        }
                    }
                    else if (li_stmflag == 1 && (ls_contractno == "" || ls_contractno == null))
                    {
                        if (li_apvstt == 1)
                        {
                            ls_assiscont = wcf.NCommon.of_getnewdocno(state.SsWsPass, state.SsCoopId, "ASSISTCONTNO");
                        }

                        li_result = this.of_buildasscont(ls_assisreq, ls_assiscont, li_apvstt, ls_remark, li_stmflag);

                        if (li_result != 1)
                        {
                            return;
                        }
                    }
                    else
                    {
                        li_result = this.of_Updateasscont(ls_assisreq, ls_contractno, li_apvstt, ls_remark, li_stmflag, ls_moneytype, ls_sendsystem, ls_deptno);

                        if (li_result != 1)
                        {
                            return;
                        }
                    }
                }
            }

            LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกเรียบร้อย");
            dsList.ResetRow();
        }

        private void of_getdata()
        {
            dsList.ResetRow();
            dsMain.DATA[0].select_check = "0";
            dsMain.DATA[0].req_status = "8";

            string sqlwhere = "", sqlorder = "";

            if (dsMain.DATA[0].member_no != "")
            {
                sqlwhere += " and req.member_no like '%" + dsMain.DATA[0].member_no + "%' ";
            }
            else { sqlwhere += ""; }

            if (dsMain.DATA[0].assisttype_code != "")
            {
                sqlwhere += " and req.assisttype_code = '" + dsMain.DATA[0].assisttype_code + "' ";
            }
            else { sqlwhere += ""; }
            if (dsMain.DATA[0].assistpay_code1 != "")
            {
                sqlwhere += " and req.assistpay_code between '" + dsMain.DATA[0].assistpay_code1 + "'  and '" + dsMain.DATA[0].assistpay_code2 + "' ";
            }
            else { sqlwhere += ""; }
            if (dsMain.DATA[0].req_sdate.Year > 1900 && dsMain.DATA[0].req_edate.Year > 1900)
            {
                sqlwhere += " and req.req_date between to_date('" + dsMain.DATA[0].req_sdate.ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "'  , 'MM/dd/yyyy') and to_date('" + dsMain.DATA[0].req_edate.ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "'  , 'MM/dd/yyyy')";
            }
            else { sqlwhere += ""; }
            if (dsMain.DATA[0].moneytype_code != "")
            {
                sqlwhere += " and req.moneytype_code = '" + dsMain.DATA[0].moneytype_code + "' ";
            }
            else { sqlwhere += ""; }



            if (Hd_sortbegin.Value == "1")
            {
                sqlorder = "order by req.assist_docno asc";
            }
            else {
                if (dsMain.DATA[0].sort_type == "1")
                {
                    sqlorder = "order by req.assist_docno,req.assisttype_code asc ";

                }
                else if (dsMain.DATA[0].sort_type == "2")
                {
                    sqlorder = "order by req.assisttype_code,req.assist_docno asc ";
                }
                else if (dsMain.DATA[0].sort_type == "3")
                {
                    sqlorder = "order by req.assisttype_code,req.assistpay_code asc ";
                }
            }

           
            SetgrpLabel();
            if (Hd_setlabel.Value == "01")
            {
                dsList.RetrieveList(sqlwhere, sqlorder);
            }
            else
            {
                dsList.RetrieveListass(sqlwhere, sqlorder);
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "setlabel", "setlabel()", true);

        }

        private Int32 of_buildasscont(string as_reqno, string as_contno, Int32 ai_status, string remark, Int32 stm_flag)
        {
            string SqlIns = "", SqlUpd = "";
            DateTime ldtm_apvdate;

            ldtm_apvdate = dsMain.DATA[0].conclusion_date;

            SqlIns = @"insert into  asscontmaster
		                        ( coop_id, asscontract_no, assisttype_code, member_no, assistpay_code, assistreq_docno, 
		                        assist_year, approve_date, approve_amt, withdrawable_amt, pay_balance, 
		                        last_periodpay, payment_status, last_stm, ass_rcvcardid, ass_prcardid, 
		                        moneytype_code, expense_bank, expense_branch, expense_accid, send_system, deptaccount_no, 
		                        ass_rcvname, approve_id, asscont_status, stm_flag, stmpay_num, stmpay_type , remark )
                        select	a.coop_id, {1}, a.assisttype_code, a.member_no, a.assistpay_code, a.assist_docno,
		                        a.assist_year, {2}, a.assistnet_amt, a.assistnet_amt, 0, 
                                0, 1, 0, a.ass_rcvcardid,  a.ass_prcardid, 
		                        a.moneytype_code, a.expense_bank, a.expense_branch, a.expense_accid, a.send_system, a.deptaccount_no, 
                                a.ass_rcvname, {3}, 1, a.stm_flag, a.stmpay_num, a.stmpay_type , {4}
                        from	assreqmaster a
		                        join mbmembmaster mb on a.member_no = mb.member_no
		                        join assucfassisttype b on a.assisttype_code = b.assisttype_code
		                        join assucfassisttypegroup c on b.assisttype_group = c.assisttype_group
                        where assist_docno = {0} ";

            SqlUpd = "update assreqmaster set req_status = {1}, approve_id = {2}, approve_date = {3} where assist_docno = {0} ";

            try
            {
                // ถ้าอนุมัติให้สร้างทะเบียนสวัสดิการขึ้นมา
                if (ai_status == 1)
                {
                    SqlIns = WebUtil.SQLFormat(SqlIns, as_reqno, as_contno, ldtm_apvdate, state.SsUsername, remark);
                    WebUtil.ExeSQL(SqlIns);
                }

                SqlUpd = WebUtil.SQLFormat(SqlUpd, as_reqno, ai_status, state.SsUsername, ldtm_apvdate);
                WebUtil.ExeSQL(SqlUpd);

            }
            catch (Exception ex)
            {
                WebUtil.ExeSQL("rollback");
                LtServerMessage.Text = WebUtil.ErrorMessage("Error Build ASSCONTMASTER " + ex);
                return -1;
            }

            return 1;
        }

        private Int32 of_Updateasscont(string as_reqno, string as_contno, Int32 ai_status, string remark, Int32 stm_flag, string as_moneytype, string as_sendsystem, string as_deptno)
        {
            string SqlUpd = "", SqlUpMas = "";
            DateTime ldtm_apvdate;

            if(state.SsCoopId == "056001")
            {
                ldtm_apvdate = dsMain.DATA[0].conclusion_date;
            }
            else
            {
                ldtm_apvdate = state.SsWorkDate;
            }

            //เช็คเป็นการจ่ายแบบต่อเนื่องหรือไม่
            if(stm_flag != 1)
            {
                decimal assist_amt = 0, pay_balance = 0, withdrawable_amt = 0;
                //ยอด approve ใหม่
                string sqlassreq = @"select assist_amt from assreqmaster where coop_id = {0} and   assist_docno = {1}";
                sqlassreq = WebUtil.SQLFormat(sqlassreq,state.SsCoopId, as_reqno);
                Sdt ta = WebUtil.QuerySdt(sqlassreq);
                if (ta.Rows.Count > 0)
                {
                    if (ta.Next())
                    {
                        assist_amt = ta.GetDecimal("assist_amt");
                    }
                }

                //ยอดที่เคยได้รับ
                
                string sqlasscont = @"select pay_balance,approve_amt  from  asscontmaster where  coop_id = {0} and asscontract_no = {1}";
                sqlasscont = WebUtil.SQLFormat(sqlasscont, state.SsCoopId, as_contno);
                Sdt ta1 = WebUtil.QuerySdt(sqlasscont);
                if (ta1.Rows.Count > 0)
                {
                    if (ta1.Next())
                    {
                        pay_balance = ta1.GetDecimal("pay_balance");
                    }
                }
                withdrawable_amt = assist_amt - pay_balance;

                SqlUpMas = "update asscontmaster set assistreq_docno = {0} , moneytype_code = {2} , send_system = {3} , deptaccount_no = {4} ,approve_amt = '"+ assist_amt + "' , withdrawable_amt = '"+ withdrawable_amt+ "'  where asscontract_no = {1} ";
            }
            else
            {

                SqlUpMas = "update asscontmaster set assistreq_docno = {0} , moneytype_code = {2} , send_system = {3} , deptaccount_no = {4} where asscontract_no = {1} ";
            }
            


            SqlUpd = "update assreqmaster set req_status = {1}, approve_id = {2}, approve_date = {3} where assist_docno = {0} ";

            try
            {
                SqlUpMas = WebUtil.SQLFormat(SqlUpMas, as_reqno, as_contno, as_moneytype, as_sendsystem, as_deptno);
                WebUtil.ExeSQL(SqlUpMas);

            }
            catch (Exception ex)
            {
                WebUtil.ExeSQL("rollback");
                LtServerMessage.Text = WebUtil.ErrorMessage("Error Update ASSCONTMASTER " + ex);
                return -1;
            }

            try
            {
                SqlUpd = WebUtil.SQLFormat(SqlUpd, as_reqno, ai_status, state.SsUsername, ldtm_apvdate);
                WebUtil.ExeSQL(SqlUpd);

            }
            catch (Exception ex)
            {
                WebUtil.ExeSQL("rollback");
                LtServerMessage.Text = WebUtil.ErrorMessage("Error Build ASSCONTMASTER " + ex);
                return -1;
            }

            return 1;
        }

        public void WebSheetLoadBegin()
        {
            this.ConnectSQLCA();
            if (!IsPostBack)
            {
                dsMain.DdAssistType();
                dsMain.DATA[0].conclusion_no = "";
                dsMain.DATA[0].conclusion_date = state.SsWorkDate;
                Hd_sortbegin.Value = "1";
                dsMain.RetrieveMoneyType();
            }
        }

        public void WebSheetLoadEnd()
        {
            if (state.SsCoopId == "057001")
            {
                for (int i = 0; i <= dsList.RowCount; i++)
                {
                    string dead_status = dsList.DATA[i].dead_status;
                    string resign_status = dsList.DATA[i].resign_status;
                    if (dead_status == "1" || resign_status == "1")
                    {
                        dsList.FindTextBox(i, "cp_name").BackColor = Color.Red;
                        dsList.FindTextBox(i, "assistpay_desc").BackColor = Color.Red;
                        dsList.FindTextBox(i, "ass_date").BackColor = Color.Red;
                        dsList.FindTextBox(i, "edulevel_desc").BackColor = Color.Red;
                        dsList.FindTextBox(i, "salary_amount").BackColor = Color.Red;
                        dsList.FindTextBox(i, "assistnet_amt").BackColor = Color.Red;
                        dsList.FindDropDownList(i, "req_status").BackColor = Color.Red;
                        dsList.FindCheckBox(i, "choose_flag").BackColor = Color.Red;
                    }
                }
            }

        }
    }

}