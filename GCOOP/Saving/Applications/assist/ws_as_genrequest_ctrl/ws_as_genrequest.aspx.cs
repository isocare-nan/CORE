using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;
using System.Data;
using System.Data.SqlClient;

namespace Saving.Applications.assist.ws_as_genrequest_ctrl
{
    public partial class ws_as_genrequest : PageWebSheet, WebSheet
    {

        [JsPostBack]
        public string PostProcess { get; set; }
        [JsPostBack]
        public string PostSave { get; set; }
        [JsPostBack]
        public string PostDefaultAcc { get; set; }
        [JsPostBack]
        public string PostBank { get; set; }
        [JsPostBack]
        public string PostBranch { get; set; }
        [JsPostBack]
        public string SetCaldate { get; set; }
        [JsPostBack]
        public string PostSeleteData { get; set; }
        [JsPostBack]
        public string JsPostCheckBoxRow { get; set; }
        [JsPostBack]
        public string JsCheckBoxAll { get; set; }
        [JsPostBack]
        public string JsSearchaccount { get; set; }

        decimal gdc_membage = 0, gdc_age = 0, gdc_membmod = 0, gdc_workage = 0;

        List<string> ListCheckedflag = new List<string>();

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
            dsList.InitDsList(this);
            dsSum.InitDsSum(this);
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)//show data first  
            {
                Session.Remove("SSGenrequest");
                dsMain.GetAssYear();
                Hd_coopid.Value = state.SsCoopId;
                // แก้ปัญหาถ้าไม่ active dropdown ปี มัน get ค่า 0 มา
                string sqlStr = @"select max(ass_year) ass_year from assucfyear where coop_id = {0}";
                sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopId);
                Sdt dt1 = WebUtil.QuerySdt(sqlStr);
                dt1.Next();
                dsMain.DATA[0].process_year = dt1.GetInt32("ass_year");
                dsMain.DATA[0].process_month = state.SsWorkDate.Month.ToString("00");
                dsMain.DATA[0].cal_date = state.SsWorkDate;

                dsMain.AssistType();
                dsMain.DdMoneyType();
                //dsMain.DdFromAccId();
                dsMain.DdDepttype();
                dsMain.DATA[0].work_date = state.SsWorkDate.ToString("dd/MM/") + (state.SsWorkDate.Year + 543).ToString();
                //GetDefaultAcc(); //get เงินสด accid 
                dsMain.DATA[0].moneytype_code = "TRN";
                dsMain.DATA[0].trtype_code = "ASS01";
                sqlStr = @"select min(depttype_code) as depttype_code from dpdepttype where coop_id = {0}";
                sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopId);
                Sdt dt2 = WebUtil.QuerySdt(sqlStr);
                dt2.Next();
                dsMain.DATA[0].depttype_code = dt2.GetString("depttype_code");
                dsMain.DATA[0].search_account = "1";
                dsMain.DATA[0].sort_order = "1";
                dsMain.DATA[0].reqdate_flag = "1";
                this.SetOnLoadedScript("dsMain.GetElement(0, 'expense_bank').style.background = '#CCCCCC'; dsMain.GetElement(0, 'expense_bank').readOnly = true; dsMain.GetElement(0, 'expense_branch').style.background = '#CCCCCC'; dsMain.GetElement(0, 'expense_branch').readOnly = true;");

            }



        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostProcess)
            {
                //dsList.ResetRow();
                Session.Remove("SSGenrequest");
                dsSum.ResetRow();
                dsMain.DATA[0].all_check = 0;
                dsMain.DATA[0].search_account = "1";
                dsMain.DATA[0].sort_order = "1";
                GetShowList();
            }
            else if (eventArg == PostDefaultAcc)
            {
                GetDefaultAcc();
            }
            else if (eventArg == PostBank)
            {
                dsMain.DdBankDesc();
                InitTofromaccid();
            }
            else if (eventArg == PostBranch)
            {
                String bank = dsMain.DATA[0].expense_bank;
                dsMain.DdBranch(bank);
            }
            else if (eventArg == PostSave)
            {
                SaveData();
            }
            else if (eventArg == SetCaldate)
            {
                //GridView1.DataSource = null;
                //GridView1.DataBind();
                dsList.ResetRow();
                string month_year = dsMain.DATA[0].process_month + "/" + Convert.ToString(dsMain.DATA[0].process_year);
                string sql = @"select (LAST_DAY(to_date({0},'mm/yyyy'))) cal_date   from dual";
                sql = WebUtil.SQLFormat(sql, month_year);
                Sdt dt = WebUtil.QuerySdt(sql);
                if (dt.Next())
                {
                    dsMain.DATA[0].cal_date = dt.GetDate("cal_date");
                }


            }
            else if (eventArg == PostSeleteData)
            {
                GetCalculate(dsMain.DATA[0].assisttype_code);
                dsList.ResetRow();
                //GridView1.DataSource = null;
                //GridView1.DataBind();

            }
            else if (eventArg == JsPostCheckBoxRow)
            {
                //PostCheckBoxRow();
                int row = dsList.GetRowFocus();
                decimal choose_flag = dsList.DATA[row].choose_flag;
                string member_no = dsList.DATA[row].member_no.Trim();
                decimal maxpermiss_amt = dsList.DATA[row].maxpermiss_amt;
                decimal itempay_amt = dsList.DATA[row].itempay_amt;
                decimal assistcut_amt = dsList.DATA[row].assistcut_amt;

                if (Session["SSGenrequest"] != null)
                {
                    ListCheckedflag = (List<string>)Session["SSGenrequest"];
                }

                if (choose_flag == 1)
                {
                    dsSum.DATA[0].count_flag += 1;
                    dsSum.DATA[0].sum_maxpayamt += maxpermiss_amt;
                    dsSum.DATA[0].sum_itempayamt += itempay_amt;
                    dsSum.DATA[0].sum_assistcutamt += assistcut_amt;
                    if (!ListCheckedflag.Contains(member_no))
                    {
                        ListCheckedflag.Add(member_no);
                    }
                }
                else
                {
                    dsSum.DATA[0].count_flag -= 1;
                    dsSum.DATA[0].sum_maxpayamt -= maxpermiss_amt;
                    dsSum.DATA[0].sum_itempayamt -= itempay_amt;
                    dsSum.DATA[0].sum_assistcutamt -= assistcut_amt;
                    if (ListCheckedflag.Contains(member_no))
                    {
                        ListCheckedflag.Remove(member_no);
                    }
                }
                Session["SSGenrequest"] = ListCheckedflag;
                LtServerMessage.Text = "";
            }
            else if (eventArg == JsCheckBoxAll)
            {
                string moneytype_code = dsMain.DATA[0].moneytype_code;
                string sqlStr = @"select   *
                                from assgenrequestdocno
                                where assisttype_code ={0} and account_no = '-'
                                order by assisttype_code,seq_no";
                sqlStr = WebUtil.SQLFormat(sqlStr, dsMain.DATA[0].assisttype_code);
                Sdt dtd = WebUtil.QuerySdt(sqlStr);
                if (dtd.Rows.Count > 0)
                {
                    if(state.SsCoopId == "056001")
                    {
                        if (moneytype_code  != "TRN")
                        {
                            CheckBoxAll();
                        }
                        else
                        {
                            LtServerMessage.Text = WebUtil.ErrorMessage("มีรายการที่ไม่มีเลขบัญชี กรุณาตรวจสอบ !!");
                            dsMain.DATA[0].all_check = 0;
                        }
                    }
                    else
                    {
                        LtServerMessage.Text = WebUtil.ErrorMessage("มีรายการที่ไม่มีเลขบัญชี กรุณาตรวจสอบ !!");
                        dsMain.DATA[0].all_check = 0;
                    }
                }
                else
                {
                    CheckBoxAll();
                }
            }
            else if (eventArg == JsSearchaccount)
            {
                Session.Remove("SSGenrequest");
                dsSum.ResetRow();
                RetrieveListPage_Process();
            }
        }

        public void CheckBoxAll()
        {
            if (dsMain.DATA[0].all_check == 1)
            {
                var dt = new DataTable();
                Session.Remove("SSGenrequest");
                RetrieveListPage_Process();
                int rc = Convert.ToInt16(Hd_rowcount.Value);
                //decimal count_flag = 0;

                int minindex = 0;

                string[] memberno = new string[dsList.RowCount];
                for (int j = 0; j < dsList.RowCount; j++)
                {
                    memberno[j] = dsList.DATA[j].member_no.Trim();
                    dsList.DATA[j].choose_flag = 0;
                }
                //รีทีฟข้อมูลมากกว่า 1 หน้า
                dt = dsList.RetrieveList(dsMain.DATA[0].assisttype_code);
                decimal count_flag = 0;
                string minBarcode = memberno[0];
                minindex = Array.IndexOf(memberno, minBarcode);
                decimal maxpermiss_amt = 0;
                decimal itempay_amt = 0;
                decimal assistcut_amt = 0;

                for (int i = 0; i <= rc - 1; i++)
                {
                    var member_no = string.Empty;
                    DataRow dr = dt.Select("seq_no=" + (i + 1)).FirstOrDefault();
                    if (dr != null)
                    {
                        member_no = dr["member_no"].ToString();
                        for (int j = 0; j <= dsList.RowCount - 1; j++)
                        {
                            if (dsList.DATA[j].member_no.Equals(member_no))
                            {
                                dsList.DATA[j].choose_flag = 1;

                            }
                        }
                    }
                    if (!ListCheckedflag.Contains(member_no))
                    {
                        ListCheckedflag.Add(member_no);
                    }
                    maxpermiss_amt += Convert.ToDecimal(dr["maxpermiss_amt"].ToString());
                    itempay_amt += Convert.ToDecimal(dr["itempay_amt"].ToString());
                    assistcut_amt += Convert.ToDecimal(dr["assistcut_amt"].ToString());
                    count_flag += 1;
                }
                dsSum.DATA[0].count_flag = count_flag;
                dsSum.DATA[0].sum_maxpayamt = maxpermiss_amt;
                dsSum.DATA[0].sum_itempayamt = itempay_amt;
                dsSum.DATA[0].sum_assistcutamt = assistcut_amt;
                Session["SSGenrequest"] = ListCheckedflag;
            }
            else
            {
                Session.Remove("SSGenrequest");
                dsSum.ResetRow();
                RetrieveListPage_Process();
            }
        }

        private void GetCalculate(string ls_asscode)
        {
            string sqlStr = @"select 
                            	case calculate_flag when 1 then 'เกรดเฉลี่ย' when 2 then 'อายุ(เดือน)' when 3 then 'อายุการเป็นสมาชิก(เดือน)' when 4 then 'เงินเดือน' when 5 then 'ค่าเสียหาย' when 6 then 'วันที่รักษาพยาบาล' when 7 then 'กำหนดเอง' else '' end calculate_flag,
                                default_paytype
                        from ASSUCFASSISTTYPE where coop_id = {0} and assisttype_code = {1}";
            sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopId, ls_asscode);
            Sdt dt1 = WebUtil.QuerySdt(sqlStr);
            dt1.Next();
            dsMain.DATA[0].calculate_flag = dt1.GetString("calculate_flag");
        }

        private void GetDefaultAcc()
        {
            string sql = @"select cash_account_code from accconstant";
            sql = WebUtil.SQLFormat(sql);
            Sdt dt = WebUtil.QuerySdt(sql);
            if (dt.Next())
            {
                dsMain.DATA[0].tofrom_accid = dt.GetString("cash_account_code");
            }
        }

        private void InitTofromaccid()
        {
            string sql = @" 
                       SELECT MONEYTYPE_CODE,  
                              MONEYTYPE_GROUP, 
                              MONEYTYPE_DESC,   
                              SORT_ORDER  ,
                              MONEYTYPE_CODE || ' - '|| MONEYTYPE_DESC as MONEYTYPE_DISPLAY,
                              DEFAULTPAY_ACCID
                         FROM CMUCFMONEYTYPE WHERE  MONEYTYPE_GROUP IN('BNK','CHQ','CSH')  AND MONEYTYPE_CODE={0}  order by sort_order
                ";
            sql = WebUtil.SQLFormat(sql, dsMain.DATA[0].moneytype_code);
            Sdt dt = WebUtil.QuerySdt(sql);
            if (dt.Next())
            {
                dsMain.DATA[0].tofrom_accid = dt.GetString("DEFAULTPAY_ACCID").Trim();
            }
            else
            {
                dsMain.DATA[0].tofrom_accid = "0";
            }
            dsMain.DdBranch(dsMain.DATA[0].expense_bank);
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        { }

        private void GetShowList()
        {
            long ll_row = 0;
            string ls_trtypecode = dsMain.DATA[0].trtype_code;
            string ls_asscode = dsMain.DATA[0].assisttype_code;
            string ls_memtypecode, ls_assisgroup, ls_yearmonth, sqlStr, mbcatcode = "", mbcat_code = "", ls_paycode;
            int li_agemem = 0, li_memtypeflag = 0, li_calflag = 0, li_proflag = 0, li_stmflag = 1, li_mbchktype = 0, liage_flag = 0, li_round = 0, li_membdate_flag = 0, li_loanflag = 0;
            decimal ldc_permiss = 0, ldc_maxamt = 0, ldc_agenum = 0, ldc_dateflag = 0, ldc_mincheck = 0, ldc_asscut = 0, ldc_loan_percent = 0;
            DateTime ldtm_mbdate = state.SsWorkDate;
            String sqlwhere = "", sql_order = "", ls_arrloantype = "", sqlStrChk = "";
            string ls_sqlext = "", ls_sqlextrq = "", ls_memno = "", ls_assgrp = "" , ls_daymonth = "";
            Int32 li_numreq = 0, li_numper = 0, li_perunit = 1;
            Int32 li_cntass = 0, li_chknum = 0;
            //int cn_accid = 0;
            //string memno_ms = "", deptaccount_no = "";
            List<int> TempRow = new List<int>();
            //เช็คว่า1เป็นการคำนวณแบบเดือน หรือ ปี
            string sql_chk1 = @"select * from assucfassisttype where coop_id = {0} and assisttype_code = {1}";
            sql_chk1 = WebUtil.SQLFormat(sql_chk1, state.SsCoopId, ls_asscode);
            Sdt dt_chk1 = WebUtil.QuerySdt(sql_chk1);
            if (dt_chk1.Next())
            {
                li_calflag = dt_chk1.GetInt32("calculate_flag");
                li_memtypeflag = dt_chk1.GetInt32("membtype_flag");
                ls_assisgroup = dt_chk1.GetString("assisttype_group");
                li_proflag = dt_chk1.GetInt32("stmpay_type");// 0 =เดือนตรงวันเกิด , 1 = เดือนระบุวัน , 2 = ปี
                li_stmflag = dt_chk1.GetInt32("stm_flag");// 0 = ทำใบคำขอเอง ,1 = จ่ายต่อเนื่องทุกเดือน, 2 = ประมวลผลจ่ายปีต่อปี, 3 = จ่ายต่อเนื่องทุกเดือน(ทำใบคำขอเองครั้งแรก), 4 = ประมวลผลจ่ายปีต่อปี(ทำใบคำขอเองครั้งแรก)
                liage_flag = dt_chk1.GetInt32("age_flag");//เช็คอายุ
                ldc_agenum = dt_chk1.GetDecimal("age_num");  //อายุ(ปี)
                li_round = dt_chk1.GetInt32("ageround_flag");   //0 ไม่ปัด , 1 ปัดเต็มปี  2 ปัดทิ้ง   
                ldc_dateflag = dt_chk1.GetDecimal("date_flag"); //0 วันเปนสมาชิก , 1 วันโอนย้าย
                li_membdate_flag = dt_chk1.GetInt32("membdate_flag"); //ตรวจสอบวันสมัครสมาชิก   0 ไม่ตรวจ, 1 ตรวจ
                ldtm_mbdate = dt_chk1.GetDate("member_date"); //วันที่เป็นสมาชิก
                li_loanflag = dt_chk1.GetInt32("loan_flag");// 0 = ไม่ตรวจสอบหักหนี้ , 1 = ตรวจสอบ
                ldc_loan_percent = dt_chk1.GetDecimal("loan_percent");
            }

            //ตรวจสอบประเภทหนี้ที่คิดคำนวณรายการหัก
            if (li_loanflag == 1)
            {

                //set หนี้ที่นำมาหักสวัสดิการ
                string sqlchk_loan = @" select assisttype_loan 
                        from assucfassisttypeloan
                        where coop_id = {0} and assisttype_code = {1} ";
                sqlchk_loan = WebUtil.SQLFormat(sqlchk_loan, state.SsCoopId, dsMain.DATA[0].assisttype_code);
                Sdt dt_chkloan = WebUtil.QuerySdt(sqlchk_loan);

                if (dt_chkloan.Next())
                {
                    int rowchk = dt_chkloan.Rows.Count;
                    for (int chkrow = 0; chkrow < rowchk; chkrow++)
                    {
                        string loantype_code = dt_chkloan.Rows[chkrow].Field<string>("assisttype_loan");

                        if (chkrow == 0)
                        {
                            ls_arrloantype += "" + loantype_code + "',";
                        }
                        else if (chkrow == rowchk - 1)
                        {
                            ls_arrloantype += "'" + loantype_code + "";
                        }
                        else
                        {
                            ls_arrloantype += "'" + loantype_code + "',";
                        }
                    }

                    //try
                    //{
                    //    ls_arrloantype = ls_arrloantype.Substring(1, 100);
                    //}
                    //catch
                    //{

                    //    LtServerMessage.Text = WebUtil.ErrorMessage(ls_arrloantype);
                    //    return;
                    //}
                }

            }

            //เช็คเงื่อนไขต่ำสุดในการคำนวณ
            string sql_chk2 = @"select  min(min_check) as min_check from assucfassisttypedet where coop_id = {0} and assisttype_code = {1} and assist_year = {2}";
            sql_chk2 = WebUtil.SQLFormat(sql_chk2, state.SsCoopId, ls_asscode, dsMain.DATA[0].process_year);
            Sdt dt_chk2 = WebUtil.QuerySdt(sql_chk2);
            if (dt_chk2.Next())
            {
                ldc_mincheck = dt_chk2.GetDecimal("min_check");
            }

            //if (li_proflag == 0)
            //{
            //    ls_daymonth = Convert.ToString(li_year - 1) + dsMain.DATA[0].process_month;
            //}

            if (li_proflag == 2)
            {
                Int32 li_year = dsMain.DATA[0].process_year;
                ls_yearmonth = Convert.ToString(li_year - 1) + dsMain.DATA[0].process_month;
            }
            else
            {
                ls_yearmonth = dsMain.DATA[0].process_year + dsMain.DATA[0].process_month;
            }

            string month_year = dsMain.DATA[0].process_month + "/" + Convert.ToString(dsMain.DATA[0].process_year);

            //เช็คกลุ่มสมาชิกที่ได้รับสิทธิ์สวัสดิการ
            this.ChkMembtypePermiss(ls_asscode, ref  li_mbchktype, ref mbcatcode);  //0 ไม่เช็ค 1 เช็ค

            if (li_mbchktype == 0)
            {
                mbcatcode = "%";
            }

            if (liage_flag != 1) //ตรวจสอบอายุสมาชิก
            {
                ldc_agenum = 0;
            }

            /////////// สร้างเงื่อนไขเพิ่มเติมในการกรองข้อมูลผู้ได้รับสวัสดิการ  /////////////
            if (li_calflag == 2)
            {
                if (li_proflag == 0)
                {
                    sqlwhere += " and FT_CALAGE( mb.birth_date , {3} , 8 ) >= " + ldc_mincheck + " and to_char( mb.birth_date , 'ddmm') =  to_char({3} , 'ddmm' ) ";
                }
                else
                {
                    sqlwhere += " and FT_CALAGE( mb.birth_date , {3} , 8 ) >= " + ldc_mincheck + " ";
                }               
            }
            else if (li_calflag == 3)
            {
                if (li_proflag == 0)
                {
                    sqlwhere += " and FT_CALAGE( mb.member_date , {3} , 8 ) >= " + ldc_mincheck + " and to_char( mb.birth_date , 'ddmm') =  to_char({3} , 'ddmm' ) ";
                }
                else
                {
                    sqlwhere += " and FT_CALAGE( mb.member_date , {3} , 8 ) >= " + ldc_mincheck + "";
                }
            }
            else { sqlwhere += ""; }


            if (li_membdate_flag == 1)
            {
                sqlwhere += " and  mb.member_date <  {9} ";
            }
            else { sqlwhere += ""; }

            if (liage_flag == 1) //ตรวจสอบอายุคน(ปี)
            {
                Decimal round_age = 0;

                if (li_round == 0)  //0 ไม่ปัด , 1 ปัดเต็มปี  2 ปัดทิ้ง
                {
                    sqlwhere += " and ftcm_calagemth( mb.birth_date , {3} ) >= " + ldc_agenum + "";
                }
                else if (li_round == 1)
                {
                    ldc_agenum = ldc_agenum - 1;
                    sqlwhere += " and ftcm_calagemth( mb.birth_date , {3} ) >= " + ldc_agenum + "";
                }
                else if (li_round == 2)
                {
                    sqlwhere += " and ftcm_calagemth( mb.birth_date , {3} ) >= " + ldc_agenum + "";
                }
                else
                {
                    sqlwhere += " and ftcm_calagemth( mb.birth_date , {3} ) >= " + ldc_agenum + "";
                }
            }
            else if (liage_flag == 2) //ตรวจสอบอายุสมาชิก(ปี)
            {
                Decimal round_age = 0;

                if (li_round == 0)  //0 ไม่ปัด , 1 ปัดเต็มปี  2 ปัดทิ้ง
                {
                    sqlwhere += " and ftcm_calagemth( mb.member_date , {3} ) >= " + ldc_agenum + "";
                }
                else if (li_round == 1)
                {
                    ldc_agenum = ldc_agenum - 1;
                    sqlwhere += " and ftcm_calagemth( mb.member_date , {3} ) >= " + ldc_agenum + "";
                }
                else if (li_round == 2)
                {
                    sqlwhere += " and ftcm_calagemth( mb.member_date , {3} ) >= " + ldc_agenum + "";
                }
                else
                {
                    sqlwhere += " and ftcm_calagemth( mb.member_date , {3} ) >= " + ldc_agenum + "";
                }

            }
            else { sqlwhere += ""; }



            sql_order += " order by mb.member_no ";


            //ท่อนดึงข้อมูลผู้ที่มีสิทธิ์ได้รับสวัสดิการ
            if (li_stmflag == 2)   //ประมวลผลจ่ายปีละครั้ง
            {
                if (li_proflag == 2)  // จ่ายปีละครั้ง คิดสิทธิ์ทุกคน
                {
                    sqlStr = @"
    
			        select distinct(mb.member_no) member_no , ft_getmbname(mb.coop_id , mb.member_no) full_name , (mb.birth_date )birth_date ,ftcm_calagemth( mb.birth_date , {3} ) mem_age
                    ,ftcm_calagemth( mb.member_date ,{3} ) work_age, (LAST_DAY(to_date({4},'mm/yyyy'))) slip_date,  add_months( to_date(LAST_DAY(to_date({4},'mm/yyyy'))), 543*12 ) slip_date2,(0) max_payamt,(0) approve_amt,(0) prncbal
                     ,(0)withdrawable_amt,(1) last_periodpay ,(mb.membtype_code) membtype_code,({1}) assisttype_code,('false') choose_flag , nvl(mb.expense_accid , '-') expense_accid,  '0' || to_char( mb.member_type ) membcat_code
                    ,nvl( trunc(months_between({3},mb.member_date)), 0) as age_membmth
                    ,mod(nvl( trunc(months_between({3},mb.member_date)), 0) , 12 ) as age_membmod
			        ,nvl( trunc(months_between({3},mb.birth_date)), 0) as age_birthmth
                    ,nvl(( select min(dm.deptaccount_no)  from dpdeptmaster dm where dm.member_no = mb.member_no and dm.deptclose_status = 0  and dm.depttype_code = {6}) , '-') as deptaccount_no
                    ,'01' as assistpay_code
                    ,0 as tranmem_age
                    ,(select max(asm.lastpay_date) from asscontmaster asm where asm.assisttype_code = {1} and asm.member_no = mb.member_no ) as lastpay_date,mb.member_date,add_months(( mb.member_date), 543*12 ) member_date2
			          from  mbmembmaster mb 
			        where    mb.coop_id = {0}  
                    and   mb.resign_status = 0
                    and '0' || to_char( mb.member_type ) like {5} 
                    and ftcm_calagemth( mb.birth_date , {3} ) >= {8}
                    and mb.birth_date is not null 
			        and mb.member_date is not null
			        and mb.member_date <= LAST_DAY(to_date({4},'mm/yyyy') ) 
                    and   mb.member_no not in
		            (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code={1}  
		            and EXTRACT(year FROM req_date)=EXTRACT(year FROM {3}) and req_status<>-9 ) ";
                }
                else   //คิดสิทธิ์เฉพาะเดือนที่คำนวณ
                {
                    sqlStr = @"
    
			        select distinct(mb.member_no) member_no , ft_getmbname(mb.coop_id , mb.member_no) full_name , (mb.birth_date )birth_date ,ftcm_calagemth( mb.birth_date , {3} ) mem_age
                    ,ftcm_calagemth( mb.member_date ,{3} ) work_age, (LAST_DAY(to_date({4},'mm/yyyy'))) slip_date,  add_months( to_date(LAST_DAY(to_date({4},'mm/yyyy'))), 543*12 ) slip_date2,(0) max_payamt,(0) approve_amt,(0) prncbal
                     ,(0)withdrawable_amt,(1) last_periodpay ,(mb.membtype_code) membtype_code,({1}) assisttype_code,('false') choose_flag , nvl(mb.expense_accid , '-') expense_accid,  '0' || to_char( mb.member_type ) membcat_code
                    ,nvl( trunc(months_between({3},mb.member_date)), 0) as age_membmth
                    ,mod(nvl( trunc(months_between({3},mb.member_date)), 0) , 12 ) as age_membmod
			        ,nvl( trunc(months_between({3},mb.birth_date)), 0) as age_birthmth
                    ,nvl(( select min(dm.deptaccount_no)  from dpdeptmaster dm where dm.member_no = mb.member_no and dm.deptclose_status = 0  and dm.depttype_code = {6}) , '-') as deptaccount_no
                    ,'01' as assistpay_code
                    ,0 as tranmem_age
                    ,(select max(asm.lastpay_date) from asscontmaster asm where asm.assisttype_code = {1} and asm.member_no = mb.member_no ) as lastpay_date, mb.member_date,add_months(( mb.member_date), 543*12 ) member_date2
			          from  mbmembmaster mb 
			        where    mb.coop_id = {0} 
                    and   mb.resign_status = 0
                    and '0' || to_char( mb.member_type ) like {5} 
                    and ftcm_calagemth( mb.birth_date , {3} ) >= {8}
                    and mb.birth_date is not null 
			        and mb.member_date is not null
			        and mb.member_date <= LAST_DAY(to_date({4},'mm/yyyy') )
                    and to_char(mb.birth_date,'mm') = {7}
                    and mb.member_no not in
		            (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code={1}  
		            and EXTRACT(year FROM req_date)=EXTRACT(year FROM {3}) and req_status<>-9 )  ";
                }
            }
            else if (li_stmflag == 4) //จ่ายต่อเนื่องทุกปี แต่ต้องทำใบคำขอเองครั้งแรก
            {
                if (li_proflag == 2)  // จ่ายปีละครั้ง คิดสิทธิ์ทุกคนที่เคยได้รับสวัสดิการมาแล้ว 1 ครั้ง
                {
                    sqlStr = @"
    
			        select distinct(mb.member_no) member_no , ft_getmbname(mb.coop_id , mb.member_no) full_name , (mb.birth_date )birth_date ,ftcm_calagemth( mb.birth_date , {3} ) mem_age
                    ,ftcm_calagemth( mb.member_date ,{3} ) work_age, (LAST_DAY(to_date({4},'mm/yyyy'))) slip_date,  add_months( to_date(LAST_DAY(to_date({4},'mm/yyyy'))), 543*12 ) slip_date2,(0) max_payamt,(0) approve_amt,(0) prncbal
                     ,(0)withdrawable_amt,(1) last_periodpay ,(mb.membtype_code) membtype_code,({1}) assisttype_code,('false') choose_flag , nvl(mb.expense_accid , '-') expense_accid,  '0' || to_char( mb.member_type ) membcat_code
                    ,nvl( trunc(months_between({3},mb.member_date)), 0) as age_membmth
                    ,mod(nvl( trunc(months_between({3},mb.member_date)), 0) , 12 ) as age_membmod
			        ,nvl( trunc(months_between({3},mb.birth_date)), 0) as age_birthmth
                    ,nvl(( select min(dm.deptaccount_no)  from dpdeptmaster dm where dm.member_no = mb.member_no and dm.deptclose_status = 0  and dm.depttype_code = {6}) , '-') as deptaccount_no
                    ,'01' as assistpay_code
                    ,0 as tranmem_age
                    ,(select max(asm.lastpay_date) from asscontmaster asm where asm.assisttype_code = {1} and asm.member_no = mb.member_no ) as lastpay_date,mb.member_date,add_months(( mb.member_date), 543*12 ) member_date2
			        from   asscontmaster asm ,
              			   asscontstatement ast,
                           mbmembmaster mb 
			        where asm.asscontract_no = ast.asscontract_no
        		    and asm.member_no = mb.member_no
				    and asm.coop_id = mb.coop_id
				    and asm.payment_status = 1
				    and ast.seq_no = (select max( asscontstatement.seq_no ) from asscontstatement where asscontstatement.asscontract_no =  asm.asscontract_no)
     	      	    and to_char(ast.slip_date, 'yyyymm')  < {2}
           		    and asm.withdrawable_amt > 0
                    and mb.coop_id = {0}  
                    and mb.resign_status = 0
                    and '0' || to_char( mb.member_type ) like {5} 
                    and ftcm_calagemth( mb.birth_date , {3} ) >= {8}
                    and mb.birth_date is not null 
			        and mb.member_date is not null
			        and mb.member_date <= LAST_DAY(to_date({4},'mm/yyyy') )
                    and   mb.member_no not in
		                (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code = {1}  
		                and EXTRACT(year FROM req_date) = EXTRACT(year FROM {3} ) and req_status  not in (-9,-99)  ) 
                    and mb.member_no not in
		                (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code = {1}   
		                and EXTRACT(year FROM req_date) <= EXTRACT(year FROM {3}) and req_status = 8 ) ";
                }
                else   //คิดสิทธิ์เฉพาะเดือนที่คำนวณ
                {
                    sqlStr = @"
    
			        select distinct(mb.member_no) member_no , ft_getmbname(mb.coop_id , mb.member_no) full_name , (mb.birth_date )birth_date ,ftcm_calagemth( mb.birth_date , {3} ) mem_age
                    ,ftcm_calagemth( mb.member_date ,{3} ) work_age, (LAST_DAY(to_date({4},'mm/yyyy'))) slip_date,  add_months( to_date(LAST_DAY(to_date({4},'mm/yyyy'))), 543*12 ) slip_date2,(0) max_payamt,(0) approve_amt,(0) prncbal
                     ,(0)withdrawable_amt,(1) last_periodpay ,(mb.membtype_code) membtype_code,({1}) assisttype_code,('false') choose_flag , nvl(mb.expense_accid , '-') expense_accid,  '0' || to_char( mb.member_type ) membcat_code
                    ,nvl( trunc(months_between({3},mb.member_date)), 0) as age_membmth
                    ,mod(nvl( trunc(months_between({3},mb.member_date)), 0) , 12 ) as age_membmod
			        ,nvl( trunc(months_between({3},mb.birth_date)), 0) as age_birthmth
                    ,nvl(( select min(dm.deptaccount_no)  from dpdeptmaster dm where dm.member_no = mb.member_no and dm.deptclose_status = 0  and dm.depttype_code = {6}) , '-') as deptaccount_no
                    ,'01' as assistpay_code
                    ,0 as tranmem_age
                    ,(select max(asm.lastpay_date) from asscontmaster asm where asm.assisttype_code = {1} and asm.member_no = mb.member_no ) as lastpay_date,mb.member_date,add_months(( mb.member_date), 543*12 ) member_date2
			        from   asscontmaster asm ,
              			   asscontstatement ast,
                           mbmembmaster mb 
			        where asm.asscontract_no = ast.asscontract_no
        		    and asm.member_no = mb.member_no
				    and asm.coop_id = mb.coop_id
				    and asm.payment_status = 1
				    and ast.seq_no = (select max( asscontstatement.seq_no ) from asscontstatement where asscontstatement.asscontract_no =  asm.asscontract_no)
     	      	    and to_char(ast.slip_date, 'yyyymm')  < {2}
           		    and asm.withdrawable_amt > 0
                    and mb.coop_id = {0}  
                    and mb.resign_status = 0
                    and '0' || to_char( mb.member_type ) like {5} 
                    and ftcm_calagemth( mb.birth_date , {3} ) >= {8}
                    and mb.birth_date is not null 
			        and mb.member_date is not null
			        and mb.member_date <= LAST_DAY(to_date({4},'mm/yyyy') )
                    and to_char(mb.birth_date,'mm') = {7}
                    and   mb.member_no not in
		                (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code = {1}  
		                and EXTRACT(year FROM req_date) = EXTRACT(year FROM {3} ) and req_status  not in (-9,-99)  ) 
                    and mb.member_no not in
		                (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code = {1}   
		                and EXTRACT(year FROM req_date) <= EXTRACT(year FROM {3}) and req_status = 8 ) ";
                }
            }
            else //ประมวลผลเดือนต่อเดือน
            {
                sqlStr = @"
			select  (asm.member_no) member_no, ft_getmbname(asm.coop_id , asm.member_no) full_name , (mb.birth_date )birth_date ,ftcm_calagemth( mb.birth_date ,{3} ) mem_age
            ,ftcm_calagemth( mb.member_date , {3} ) work_age, (ast.slip_date) slip_date, add_months( to_date(ast.slip_date), 543*12 ) slip_date2
            ,(0) max_payamt,(asm.approve_amt) approve_amt,(0) prncbal,(asm.withdrawable_amt) withdrawable_amt,( asm.last_periodpay + 1 ) last_periodpay ,(mb.membtype_code) membtype_code,(asm.assisttype_code) assisttype_code,('false') choose_flag,nvl(mb.expense_accid , '-') expense_accid
            ,  '0' || to_char( mb.member_type ) membcat_code
            ,nvl( trunc(months_between({3},mb.member_date)), 0) as age_membmth
            ,mod(nvl( trunc(months_between({3},mb.member_date)), 0) , 12 ) as age_membmod
			,nvl( trunc(months_between({3},mb.birth_date)), 0) as age_birthmth
            ,nvl(( select min(dm.deptaccount_no)  from dpdeptmaster dm where dm.member_no = mb.member_no and dm.deptclose_status = 0  and dm.depttype_code = {6}) , '-') as deptaccount_no
            ,nvl( (asm.assistpay_code) , '01' ) as assistpay_code
            ,0 as tranmem_age
            ,(select max(asm.lastpay_date) from asscontmaster asm where asm.assisttype_code = {1} and asm.member_no = mb.member_no ) as lastpay_date,mb.member_date,add_months(( mb.member_date), 543*12 ) member_date2
                from  asscontmaster asm ,
              asscontstatement ast,
              mbmembmaster mb
            where   asm.asscontract_no = ast.asscontract_no
            and     asm.member_no = mb.member_no
            and     asm.payment_status = 1
             and    ast.seq_no = (select max( asscontstatement.seq_no ) from asscontstatement where asscontstatement.asscontract_no =  asm.asscontract_no)
            and     to_char(ast.slip_date, 'yyyymm')  < {2}
            and     asm.withdrawable_amt > 0
            and     '0' || to_char( mb.member_type ) like {5}
            and     ftcm_calagemth( mb.birth_date , {3} ) >= {8}
            and     asm.assisttype_code = {1}
            and     asm.coop_id = {0}
            and    mb.resign_status = 0
            and   asm.member_no not in
		    (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code={1}  
		     and  to_char(assreqmaster.req_date, 'yyyymm')  =  {2} and assreqmaster.req_status not in (-9,-99) )
            and   asm.member_no not in
		    (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code={1}  
		     and  to_char(assreqmaster.req_date, 'yyyymm')  <=  {2} and assreqmaster.req_status = 8 ) ";

            }

            sqlStr = sqlStr + sqlwhere + sql_order;
            
            sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopControl, ls_asscode, ls_yearmonth, dsMain.DATA[0].cal_date, month_year, mbcatcode, dsMain.DATA[0].depttype_code, dsMain.DATA[0].process_month, ldc_agenum, ldtm_mbdate);
            DataTable dt;
            try
            {
                dt = WebUtil.Query(sqlStr);
            }
            catch
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(sqlStr);
                return;
            }


            //delete ตาราง temp
            string ls_delete = @"delete from assgenrequestdocno where assisttype_code = {0} ";
            ls_delete = WebUtil.SQLFormat(ls_delete, ls_asscode);
            WebUtil.ExeSQL(ls_delete);

            int row = dt.Rows.Count;
            Hd_rowcount.Value = Convert.ToString(row);

            string deptaccount_no = "", expense_accid = "";

            for (int ii = 0; ii < row; ii++)
            {
                //  dec_prncbal = Convert.ToDecimal(dt.Rows[ii]["withdrawable_amt"]);
                if (li_memtypeflag == 0)
                {
                    ls_memtypecode = "%"; // ไม่เช็ด membtype_code
                }
                else
                {
                    string membtype_code = dt.Rows[ii].Field<string>("membtype_code");
                    ls_memtypecode = membtype_code;
                }

                string mem_no = dt.Rows[ii].Field<string>("member_no");
                string mem_age = dt.Rows[ii].Field<string>("mem_age");
                string work_age = dt.Rows[ii].Field<string>("work_age");
                mbcat_code = dt.Rows[ii].Field<string>("membcat_code");
                ls_paycode = dt.Rows[ii].Field<string>("assistpay_code");
                Decimal apv_amt = dt.Rows[ii].Field<Decimal>("approve_amt");
                Int32 li_trnage = Convert.ToInt32(dt.Rows[ii].Field<Decimal>("tranmem_age"));
                string ls_dateflag = "0";
                li_cntass = 0;
                li_chknum = 0;
                string full_name = dt.Rows[ii].Field<string>("full_name");
                //string expense_accid = dt.Rows[ii].Field<string>("expense_accid");
                DateTime member_date = dt.Rows[ii].Field<DateTime>("member_date");
                DateTime birth_date = dt.Rows[ii].Field<DateTime>("birth_date");
                Int32 last_periodpay = Convert.ToInt32(dt.Rows[ii].Field<Decimal>("last_periodpay"));
                gdc_membmod = dt.Rows[ii].Field<Decimal>("age_membmod");
                gdc_workage = Convert.ToDecimal(work_age);

                if (li_round == 0) ////0 ไม่ปัด , 1 ปัดเต็มปี  2 ปัดทิ้ง
                {
                    gdc_membage = Convert.ToDecimal(work_age);
                    gdc_age = Convert.ToDecimal(mem_age);
                }
                else if (li_round == 1)
                {
                    //round_age = Math.Ceiling(ldc_age);
                    gdc_membage = Math.Ceiling(Convert.ToDecimal(work_age));
                    gdc_age = Math.Ceiling(Convert.ToDecimal(mem_age));
                }
                else
                {
                    gdc_membage = Math.Floor(Convert.ToDecimal(work_age));
                    gdc_age = Math.Floor(Convert.ToDecimal(mem_age));
                }

                try
                {
                    deptaccount_no = dt.Rows[ii].Field<string>("deptaccount_no");
                }
                catch
                {
                    deptaccount_no = "";
                }

                try
                {
                    expense_accid = dt.Rows[ii].Field<string>("expense_accid");
                }
                catch
                {
                    expense_accid = "";
                }
                decimal birthmth = dt.Rows[ii].Field<Decimal>("age_birthmth");
                decimal memmth = dt.Rows[ii].Field<Decimal>("age_membmth");

                //เช็คเงื่อนไข กรณีที่ไม่มีวันโอนย้าย จะคิดจากวันที่เป็นสมาชิก
                if (ldc_dateflag == 1 && li_trnage == 0)
                {
                    ls_dateflag = "0";
                }

                if (li_calflag == 2) //อายุ
                {
                    li_agemem = Convert.ToInt32(dt.Rows[ii].Field<Decimal>("age_birthmth")); //(Convert.ToInt32(ls_arr_mem[0]) * 12) + Convert.ToInt32(ls_arr_mem[1]); //อายุสมาชิก
                }
                else if (li_calflag == 3) //อายุการเป็นสมาชิก
                {
                    if (ls_dateflag == "0")
                    {
                        li_agemem = Convert.ToInt32(dt.Rows[ii].Field<Decimal>("age_membmth")); //(Convert.ToInt32(ls_arr_work_age[0]) * 12) + Convert.ToInt32(ls_arr_work_age[1]); //อายุการเป็นสมาชิก
                    }
                    else
                    {
                        li_agemem = Convert.ToInt32(dt.Rows[ii].Field<Decimal>("tranmem_age"));
                    }
                }

                ldc_permiss = of_getpermissmax(mem_no, dsMain.DATA[0].assisttype_code, "01", li_agemem, mbcat_code, ref ldc_maxamt);
                if (li_loanflag == 1)
                {
                    of_set_shareloan(mem_no, dsMain.DATA[0].assisttype_code, ldc_loan_percent, ls_arrloantype, ref ldc_asscut);

                    if (ldc_asscut > ldc_permiss)
                    {
                        ldc_asscut = ldc_permiss;
                    }
                }
                if (ldc_permiss > 0)
                {
                    if (li_stmflag == 1)
                    {
                        ldc_maxamt = apv_amt;
                    }

                    //DateTime w_date = Convert.ToDateTime(dsMain.DATA[0].work_date);
                    //string ls_reqdate = Convert.ToString(w_date.Day + "/" + w_date.Month + "/" + w_date.Year);
                    string ls_reqdate = dsMain.DATA[0].work_date.Substring(0, 6) + (Convert.ToInt32(dsMain.DATA[0].work_date.Substring(6, 4)) - 543);

                    //หาเลขบัญชีตามการรับเงินของสมาชิก
                    if (ls_trtypecode == "DEP")
                    {
                        expense_accid = deptaccount_no;
                    }
                    else if (ls_trtypecode == "SHR")
                    {
                        expense_accid = mem_no;
                    }
                    else if (ls_trtypecode == "ASS01")
                    {
                        string sqlass = @"select bank_accid from mbmembmoneytr where trtype_code = 'ASS01' and member_no = {0}";
                        string lsbank_accid = "";
                        sqlass = WebUtil.SQLFormat(sqlass, mem_no);
                        Sdt dt_ass = WebUtil.QuerySdt(sqlass);

                        if (dt_ass.Next())
                        {
                            lsbank_accid = dt_ass.GetString("bank_accid");
                            expense_accid = lsbank_accid;
                        }
                    }
                    else if (ls_trtypecode == "DVAV1")
                    {
                        string sqldiv = @"select bank_accid from mbmembmoneytr where trtype_code = 'DVAV1' and member_no = {0}";
                        string lsbank_accid = "";
                        sqldiv = WebUtil.SQLFormat(sqldiv, mem_no);
                        Sdt dt_div = WebUtil.QuerySdt(sqldiv);

                        if (dt_div.Next())
                        {
                            lsbank_accid = dt_div.GetString("bank_accid");
                            expense_accid = lsbank_accid;
                        }
                    }


                    // config สำหรับการตรวจสอบสวัสดิการ
                    sqlStrChk = @"select * from assucfassisttype where assisttype_code = {0}";
                    sqlStrChk = WebUtil.SQLFormat(sqlStrChk, ls_asscode);
                    Sdt dtd = WebUtil.QuerySdt(sqlStrChk);

                    if (dtd.Next())
                    {
                        ls_assgrp = dtd.GetString("assisttype_group");
                        li_numreq = dtd.GetInt32("limrcvreq_num");
                        li_numper = dtd.GetInt32("limrcvper_num");
                        li_perunit = dtd.GetInt32("limrcvper_unit");
                    }


                    // ของเขตการหา
                     ls_sqlext = this.of_getsqlrank(li_perunit, li_numper, "ass");
                     ls_sqlextrq = this.of_getsqlrankreq(li_perunit, li_numper, "req");

                     sqlStrChk = @" select 'OWN' as rcvtype, ass.member_no from asscontmaster ass 
                        where ass.member_no = '" + mem_no + @"' 
                        and ass.assisttype_code='" + ls_asscode + @"' and ass.asscont_status <> -9 " + ls_sqlext + @"
                        union
                        select 'OWN' as rcvtype, req.member_no from assreqmaster req
                        where req.member_no = '" + mem_no + @"' 
                        and req.assisttype_code='" + ls_asscode + "' and req.req_status = 8 " + ls_sqlextrq;



                     dtd = WebUtil.QuerySdt(sqlStrChk);

                    while (dtd.Next())
                    {
                        li_cntass++;

                        if (li_cntass >= li_numreq)
                        {
                            li_chknum++;
                        }

                    }
                    if (li_chknum == 0)
                    {
                        ll_row++;

                        try
                        {
                            sqlStr = @"insert into assgenrequestdocno
                            (assisttype_code             , seq_no            , member_no                 , memb_name           , slip_date                 
                            , mem_age                   , birth_age         , period_pay                , maxpermiss_amt      , itempay_amt
                            , account_no                , member_date       , assistcut_amt             , birth_date )
                            values
                            ({0}                        , {1}               , {2}                       , {3}                 , to_date({4},'dd/mm/yyyy') 
                            , {5}                       , {6}               , {7}                       , {8}                 , {9}
                            , {10}                      , {11}              , {12}                      , {13})";
                            sqlStr = WebUtil.SQLFormat(sqlStr,
                                ls_asscode, ll_row, mem_no, full_name, ls_reqdate
                                , work_age, mem_age, last_periodpay, ldc_maxamt, ldc_permiss - ldc_asscut
                                , expense_accid, member_date, ldc_asscut, birth_date);
                            WebUtil.ExeSQL(sqlStr);

                        }
                        catch
                        {
                            LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกผิดพลาด เลขสมาชิก " + mem_no + " " + sqlStr);
                            return;
                        }
                    }

                }

            }

            RetrieveListPage_Process();
            LtServerMessage.Text = WebUtil.CompleteMessage("ประมวลผลสำเร็จ");
        }

        public void RetrieveListPage_Process()
        {
            string assisttype_code = dsMain.DATA[0].assisttype_code;
            string Slassisttype_code = "";
            Session["SSsearch_account"] = dsMain.DATA[0].search_account;
            Session["SSsort_order"] = dsMain.DATA[0].sort_order;
            Int64 rowcount = dsList.RetrieveListPage(assisttype_code, 0);
            Hd_rowcount.Value = Convert.ToString(rowcount);
        }

        protected void ChkMembtypePermiss(string as_asscode, ref int li_mbchktype, ref string mbcatcode)
        {
            Int32 li_mbcattypechk = 0;
            string sqlStr = "";

            // ตรวจสอบว่าประเภทสมาชิกนี้ได้รับสิทธิ์ในสวัสดิการนี้หรือไม่
            //1. ตรวจสอบก่อนว่ามีการกลุ่มสมาชิกหรือไม่
            sqlStr = @"select count(1) as membtype_flag from assucfassisttypedet where coop_id = {0} and assisttype_code = {1} and assist_year = {2} and  membcat_code = 'AL' ";
            sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopControl, as_asscode, dsMain.DATA[0].process_year);
            Sdt dtd = WebUtil.QuerySdt(sqlStr);

            if (dtd.Next())
            {
                li_mbcattypechk = dtd.GetInt32("membtype_flag");
            }

            if (li_mbcattypechk == 0) //0 = เช็คกลุ่มสมาชิก,   มากกว่า 0 คือ ไม่เช็ค
            {
                li_mbchktype = 1;
                //เช็คตัวหลักก่อน
                sqlStr = "select distinct membcat_code from assucfassisttypedet where coop_id = {0} and assisttype_code = {1} and assist_year = {2} ";
                sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopControl, as_asscode, dsMain.DATA[0].process_year);
                dtd = WebUtil.QuerySdt(sqlStr);

                while (dtd.Next())
                {
                    mbcatcode = dtd.GetString("membcat_code"); ;
                }
            }
            else
            {
                li_mbchktype = 0; //ไม่เช็คกลุ่มสมาชิก
            }

        }

        private decimal of_getpermissmax(string as_memno, string as_asscode, string as_paycode, Int32 adc_rank, string mbcat_code, ref decimal adc_max)
        {
            Int32 li_mbtypechk = 1, li_limnum = 0, li_mbcattypechk = 1, li_rcvnum = 0, li_formula_flag = 0;
            decimal ldc_maxamt = 0, ldc_maxloop = 0, ldc_permiss = 0, ldc_maxnextpay = 0, ldc_minfirstpay = 0, ldc_maxfirstpay = 0;
            decimal ldc_mbrank = 0;
            int li_year = 0;
            String sqlStr = "";
            Sdt dtd;

            // ดูเงื่อนไขกาารให้สวัสดิการ
            sqlStr = @"select limitreq_num, limitmax_amt, max_nextpayamt, limrcvreq_num , formula_flag, min_firstpayamt, max_firstpayamt from assucfassisttype where coop_id = {0} and assisttype_code = {1}";
            sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopControl, as_asscode);
            dtd = WebUtil.QuerySdt(sqlStr);

            if (dtd.Next())
            {
                li_limnum = dtd.GetInt32("limitreq_num");
                ldc_maxloop = dtd.GetDecimal("limitmax_amt");
                ldc_maxnextpay = dtd.GetDecimal("max_nextpayamt");
                li_rcvnum = dtd.GetInt32("limrcvreq_num");
                li_formula_flag = dtd.GetInt32("formula_flag");
                ldc_minfirstpay = dtd.GetDecimal("min_firstpayamt");
                ldc_maxfirstpay = dtd.GetDecimal("max_firstpayamt");
            }

            // ตรวจสอบก่อนว่ามีการแยกกลุ่มสมาชิกหรือไม่
            sqlStr = @"select count(1) as membtype_flag from assucfassisttypedet where coop_id = {0} and assisttype_code = {1} and assist_year = {2} and  membcat_code = 'AL' ";
            sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopControl, as_asscode, dsMain.DATA[0].process_year);
            dtd = WebUtil.QuerySdt(sqlStr);

            if (dtd.Next())
            {
                li_mbcattypechk = dtd.GetInt32("membtype_flag");
            }

            if (li_mbcattypechk == 0) //0 = เช็คกลุ่มสมาชิก,   มากกว่า 0 คือ ไม่เช็ค
            {

                //เช็คตัวหลักก่อน
                sqlStr = "select membtype_code from assucfassisttypedet where coop_id = {0} and assisttype_code = {1} and assist_year = {2} and membcat_code = {3}";
                sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopControl, as_asscode, dsMain.DATA[0].process_year, mbcat_code);
                dtd = WebUtil.QuerySdt(sqlStr);

                if (dtd.GetRowCount() == 0)
                {
                    li_mbtypechk = 0;
                }
                else //กรณ๊มีสิทธิ์ ต้องมาเช็คประเภทย่อยอีกว่ามีสิทธิ์ได้รับสวัสดิการหรือไม่
                {
                    //ตรวจสอบประเภทสมาชิกว่าแยกประเภทมั้ย
                    sqlStr = @"select count(1) as membtype_flag from assucfassisttypedet where coop_id = {0} and assisttype_code = {1} and assist_year = {2} and membcat_code = {3} and membtype_code = 'AL' ";
                    sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopControl, as_asscode, dsMain.DATA[0].process_year, mbcat_code);
                    dtd = WebUtil.QuerySdt(sqlStr);

                    if (dtd.Next())
                    {
                        li_mbtypechk = dtd.GetInt32("membtype_flag");
                    }
                }
            }

            ldc_mbrank = adc_rank;
            li_year = Convert.ToInt16(dsMain.DATA[0].process_year);

            // ตรวจสอบว่าอยู่ในสิทธิ์ช่วงไหน
            sqlStr = @"select max_payamt
                        from assucfassisttypedet 
                        where assisttype_code = '" + as_asscode + "' and assist_year = '" + li_year + "' and assistpay_code = '" + as_paycode + @"' 
                        and " + Convert.ToString(ldc_mbrank) + " between min_check and max_check ";

            if (li_mbcattypechk == 0) //0 = เช็คกลุ่มสมาชิก,   มากกว่า 0 คือ ไม่เช็ค
            {
                sqlStr = sqlStr + " and membcat_code = '" + mbcat_code + "' ";
            }
            if (li_mbtypechk == 0) //0 = เช็คประเภทสมาชิก,   มากกว่า 0 คือ ไม่เช็ค
            {
                sqlStr = sqlStr + " and membtype_code = '" + mbcat_code + "' ";
            }

            dtd = WebUtil.QuerySdt(sqlStr);

            if (dtd.Next())
            {
                ldc_maxamt = dtd.GetDecimal("max_payamt");
            }
            else
            {
                //  LtServerMessage.Text = WebUtil.ErrorMessage("ไม่พบช่วงข้อมูลสิทธิสวัสดิการของสมาชิกคนนี้");
                return 0;
            }

            adc_max = ldc_maxamt;
         
            // กรณีที่รับได้หลายครั้งและมีการกำหนดวงเงินเอาไว้
            if (li_rcvnum > 1 && ldc_maxloop > 0)
            {
                //adc_max = ldc_maxloop;
                ldc_maxamt = ldc_maxnextpay;
            }

            ldc_permiss = ldc_maxamt;

            if (as_asscode == "51" && ldc_permiss == 500)
            {
                if (gdc_membmod >= 6)
                {
                    gdc_workage = Math.Ceiling(Convert.ToDecimal(gdc_workage));
                    ldc_permiss = ldc_permiss * gdc_workage;
                    adc_max = ldc_permiss;
                }
                else
                {
                    gdc_workage = Math.Floor(Convert.ToDecimal(gdc_workage));
                    ldc_permiss = ldc_permiss * gdc_workage;
                    adc_max = ldc_permiss;
                }
            }

            //กรณีคำนวณพิเศษ
            if (li_formula_flag == 1)
            {
                //สิทธิ์ได้สวัสดิการ คือ อายุสมาชิก(ปี) * จำนวนหุ้น / 100
                //หาสูตร   01 = อายุการเป็นสมาชิก , 02 = อายุสมาชิก , 03 = จำนวนหุ้น , 04 = มูลค่าหุ้น , 05 = ค่าคงที่ 100
                // 1 บวก, 2 ลบ , 3 คูณ , 4 หาร
                string ls_caltype = "";
                int li_calflag = 0;
                decimal ldc_formula_permiss = 0, ldc_sharevalue = 0, ldc_sharestk = 0;
                decimal cal1 = 0, cal2 = 0;

                string sql = @"select *
                        from asscalculatorassist
                        where coop_id = {0} 
                        and assisttype_code = {1}
                        order by sort_order";
                sql = WebUtil.SQLFormat(sql, state.SsCoopId, dsMain.DATA[0].assisttype_code);
                Sdt dt = WebUtil.QuerySdt(sql);

                int row = dt.Rows.Count;


                for (int i = 0; i < row; i++)
                {
                    ls_caltype = dt.Rows[i].Field<string>("calculator_type");
                    li_calflag = Convert.ToInt32(dt.Rows[i].Field<Decimal>("operation_type"));

                    if (ls_caltype == "01") { cal1 = gdc_membage; }
                    else if (ls_caltype == "02") { cal1 = gdc_age; }
                    else if (ls_caltype == "03")
                    {
                        string sqlshr = @" select shsharemaster.sharestk_amt as sharestk_amt , shsharemaster.sharestk_amt * shsharetype.unitshare_value as share_value
                        from shsharemaster
                        left join shsharetype on shsharemaster.sharetype_code = shsharetype.sharetype_code and shsharemaster.coop_id = shsharetype.coop_id
                        where shsharemaster.coop_id = {0} and shsharemaster.member_no = {1} ";
                        sqlshr = WebUtil.SQLFormat(sqlshr, state.SsCoopId, as_memno);
                        Sdt dtshr = WebUtil.QuerySdt(sqlshr);
                        if (dtshr.Next())
                        {
                            ldc_sharestk = dtshr.GetDecimal("sharestk_amt");
                            //ldc_sharevalue = dtshr.GetDecimal("share_value");
                        }

                        cal1 = ldc_sharestk;
                    }
                    else if (ls_caltype == "04")
                    {
                        string sqlshr = @" select shsharemaster.sharestk_amt as sharestk_amt , shsharemaster.sharestk_amt * shsharetype.unitshare_value as share_value
                        from shsharemaster
                        left join shsharetype on shsharemaster.sharetype_code = shsharetype.sharetype_code and shsharemaster.coop_id = shsharetype.coop_id
                        where shsharemaster.coop_id = {0} and shsharemaster.member_no = {1} ";
                        sqlshr = WebUtil.SQLFormat(sqlshr, state.SsCoopId, as_memno);
                        Sdt dtshr = WebUtil.QuerySdt(sqlshr);
                        if (dtshr.Next())
                        {
                            //ldc_sharestk = dtshr.GetDecimal("sharestk_amt");
                            ldc_sharevalue = dtshr.GetDecimal("share_value");
                        }

                        cal1 = ldc_sharevalue;
                    }
                    else if (ls_caltype == "05") { cal1 = 100; }


                    if (li_calflag == 1)
                    {
                        ldc_formula_permiss = ldc_formula_permiss + cal1;
                    }
                    else if (li_calflag == 2)
                    {
                        ldc_formula_permiss = ldc_formula_permiss - cal1;
                    }
                    else if (li_calflag == 3)
                    {
                        ldc_formula_permiss = ldc_formula_permiss * cal1;
                    }
                    else if (li_calflag == 4)
                    {
                        ldc_formula_permiss = ldc_formula_permiss / cal1;
                    }
                }


                if (state.SsCoopControl == "056001")
                {

                    if (ldc_formula_permiss >= ldc_permiss * 2)
                    {
                        ldc_permiss = ldc_permiss;
                    }
                    else
                    {
                        ldc_permiss = ldc_sharevalue / 2;
                    }


                    if (ldc_permiss < 10000) { ldc_permiss = 10000; }

                    if (ldc_formula_permiss < ldc_minfirstpay)
                    {
                        ldc_formula_permiss = ldc_minfirstpay;
                    }

                    if (ldc_formula_permiss > ldc_maxfirstpay)
                    {
                        ldc_formula_permiss = ldc_maxfirstpay;
                    }

                    ldc_permiss = ldc_formula_permiss;

                }
                else
                {

                    if (ldc_formula_permiss < ldc_minfirstpay)
                    {
                        ldc_formula_permiss = ldc_minfirstpay;
                    }

                    if (ldc_formula_permiss > ldc_maxfirstpay)
                    {
                        ldc_formula_permiss = ldc_maxfirstpay;
                    }

                    ldc_permiss = ldc_formula_permiss;
                }
            }

            return ldc_permiss;
        }

        private void of_set_shareloan(string as_memno, string as_asstype, decimal adc_loanpercent, String ls_arrloantype, ref decimal adc_asscut_amt)
        {
            string loantype_code = "";
            decimal principal_cal = 0, loan_percent = 0, ldc_sharevalue = 0, princal = 0;
            int loan_flag = 0;

            //set หุ้น
            string sql = @" select shsharemaster.sharestk_amt as sharestk_amt , shsharemaster.sharestk_amt * shsharetype.unitshare_value as share_value
                        from shsharemaster
                        left join shsharetype on shsharemaster.sharetype_code = shsharetype.sharetype_code and shsharemaster.coop_id = shsharetype.coop_id
                        where shsharemaster.coop_id = {0} and shsharemaster.member_no = {1} ";
            sql = WebUtil.SQLFormat(sql, state.SsCoopId, as_memno);
            Sdt dt = WebUtil.QuerySdt(sql);
            if (dt.Next())
            {
                ldc_sharevalue = dt.GetDecimal("share_value");

            }

            //            //set หนี้
            //            sql = @" select sum( principal_balance ) as principal_balance
            //                        from lncontmaster
            //                        where coop_id = {0} and member_no = {1} and contract_status <> -1 and principal_balance > 0";
            //            sql = WebUtil.SQLFormat(sql, state.SsCoopId, as_memno);
            //            dt = WebUtil.QuerySdt(sql);
            //            if (dt.Next())
            //            {
            //                dsAmount.DATA[0].PRINCIPAL_BALANCE = dt.GetDecimal("principal_balance");
            //            }

            //                //set หนี้ที่นำมาหักสวัสดิการ
            //                sql = @" select assisttype_loan 
            //                        from assucfassisttypeloan
            //                        where coop_id = {0} and assisttype_code = {1} ";
            //                sql = WebUtil.SQLFormat(sql, state.SsCoopId, as_asstype);
            //                dt = WebUtil.QuerySdt(sql);
            //                while (dt.Next())
            //                {
            //                    loantype_code = dt.GetString("assisttype_loan");

            String sql2 = @" select sum( principal_balance ) as principal_cal
                        from lncontmaster
                        where coop_id = {0} and member_no = {1} and contract_status <> -1 and principal_balance > 0
                        and loantype_code in ( {2} )";
            sql2 = WebUtil.SQLFormat(sql2, state.SsCoopId, as_memno, ls_arrloantype);
            Sdt dt2 = WebUtil.QuerySdt(sql2);
            if (dt2.Next())
            {
                principal_cal = dt2.GetDecimal("principal_cal");
            }

            //}

            //ตรวจสอบมูลค่าหนี้ว่ามากกว่าหุ้นตามจำนวน % ที่ตั้งไว้หรือไม่

            princal = principal_cal;
            ldc_sharevalue = ldc_sharevalue * (adc_loanpercent / 100); //คิดตามร้อยละของหุ้น

            if (princal > ldc_sharevalue)
            {
                adc_asscut_amt = princal - ldc_sharevalue;
            }
            else
            {
                adc_asscut_amt = 0;
            }

        }

        public void SaveData()
        {
            String ls_reqdate = "";
            try
            {
                ExecuteDataSource exed = new ExecuteDataSource(this);
                string ls_sendsystem = "", deptacc_no = "", expacc_id = "";
                string ls_asstypepay = "00";
                string sql = @"select
	                        min(assucfassisttypepay.assistpay_code) as assistpay_code
                        from assucfassisttype
                        inner join assucfassisttypepay on assucfassisttype.assisttype_code = assucfassisttypepay.assisttype_code
                        where assucfassisttype.coop_id = {0} and assucfassisttype.assisttype_code = {1}";
                sql = WebUtil.SQLFormat(sql, state.SsCoopId, dsMain.DATA[0].assisttype_code);
                Sdt dt = WebUtil.QuerySdt(sql);
                if (dt.Next()) { ls_asstypepay = dt.GetString("assistpay_code"); }

                string ls_trtypecode = dsMain.DATA[0].trtype_code;
                if (ls_trtypecode == "DEP" || ls_trtypecode == "ASS01")
                {
                    ls_sendsystem = "DEP";
                }
                else if (ls_trtypecode == "SHR")
                {
                    ls_sendsystem = "SHR";
                }

                ls_reqdate = dsMain.DATA[0].work_date.Substring(0, 6) + (Convert.ToInt32(dsMain.DATA[0].work_date.Substring(6, 4)) - 543);

                //DateTime w_date = Convert.ToDateTime(dsMain.DATA[0].work_date);
                //ls_reqdate = Convert.ToString(w_date.Day + "/" + w_date.Month + "/" + w_date.Year);
                //Get รายการ

                var str = string.Empty;
                var dtr = new DataTable();
                //แบ่ง retrieve ทีละ 500
                if (Session["SSGenrequest"] != null)
                {
                    ListCheckedflag = (List<string>)Session["SSGenrequest"];
                    string[] buffer;

                    for (int i = 0; i < ListCheckedflag.Count; i += 500)
                    {
                        buffer = new string[500];
                        buffer = ListCheckedflag.Skip(i).Take(500).ToArray();
                        str = string.Join(",", buffer);
                        var a = dsList.RetrieveToSave(dsMain.DATA[0].assisttype_code, str);
                        dtr.Merge(a);

                    }



                }
                //if (Session["SSGenrequest"] != null)
                //{
                //    ListCheckedflag = (List<string>)Session["SSGenrequest"];
                //    str = string.Join(",", ListCheckedflag);
                //    dtr = dsList.RetrieveToSave(dsMain.DATA[0].assisttype_code, str);
                //}
                try
                {
                    string main_moneytype = dsMain.DATA[0].moneytype_code;
                    foreach (DataRow row in dtr.Rows)
                    {
                        string ls_assno = wcf.NCommon.of_getnewdocno(state.SsWsPass, state.SsCoopId, "ASSISTDOCNO");
                        var member_no = row["member_no"].ToString();
                        var assistmax_amt = row["maxpermiss_amt"].ToString();
                        var itempay_amt = row["itempay_amt"].ToString();
                        var assistcut_amt = row["assistcut_amt"].ToString();
                        var expense_accid = row["account_no"].ToString();
                        var birth_date = row["birth_date"].ToString();
                        DateTime b_date = Convert.ToDateTime( birth_date);


                        if (ls_trtypecode == "DEP" || ls_trtypecode == "ASS01")
                        {
                            deptacc_no = expense_accid;
                            expacc_id = "";
                        }
                        else if (ls_trtypecode == "SHR")
                        {
                            deptacc_no = expense_accid;
                            expacc_id = "";
                        }
                        else
                        {
                            expacc_id = expense_accid;
                            deptacc_no = "";
                        }
                        if (dsMain.DATA[0].moneytype_code == "FRT")
                        {
                            dsMain.DATA[0].expense_bank = Getmoneytype(member_no)[0];
                            dsMain.DATA[0].expense_branch = Getmoneytype(member_no)[1];
                            expacc_id = Getmoneytype(member_no)[2];
                            ls_sendsystem = Getmoneytype(member_no)[3];
                            deptacc_no = Getmoneytype(member_no)[4];
                            main_moneytype = Getmoneytype(member_no)[5];
                        }

                        if (dsMain.DATA[0].reqdate_flag == "2")
                        {
                            if (birth_date.Substring(3, 3) == "02" && birth_date.Substring(0, 3) == "29")
                            {
                                ls_reqdate = birth_date.Substring(3, 3) + "28" + (Convert.ToInt32(dsMain.DATA[0].work_date.Substring(6, 4)) - 543);
                                if (state.SsCoopControl == "056001" || state.SsCoopControl == "057001")
                                {
                                    ls_reqdate = Convert.ToString( "28"+ "/" + b_date.Month + "/" + DateTime.Now.Year);
                                }
                            }
                            else
                            {
                                ls_reqdate = birth_date.Substring(3, 3) + birth_date.Substring(0, 3) + (Convert.ToInt32(dsMain.DATA[0].work_date.Substring(6, 4)) - 543);
                                
                                if (state.SsCoopControl == "056001" || state.SsCoopControl == "057001" )
                                {
                                    //ls_reqdate =  birth_date.Substring(2, 2) + birth_date.Substring(0, 2)  + (Convert.ToInt32(dsMain.DATA[0].work_date.Substring(6, 4)) - 543);
                                    ls_reqdate = Convert.ToString(b_date.Day + "/"+ b_date.Month +"/"+ DateTime.Now.Year);
                                }
                            }
                        }

                        string sqlInsert = @"       insert into assreqmaster
                                                    (coop_id                            , assist_docno                  , assist_year                   , member_no 
                                                    , assisttype_code                   , assistpay_code                , assistmax_amt                 , assist_amt            
                                                    , req_status                        , req_date                      , entry_id                      , moneytype_code        
                                                    , expense_bank                      , expense_branch                , expense_accid                 , assistnet_amt         
                                                    , send_system                       , calage_date                   , deptaccount_no                , assistcut_amt
                                                    , assistever_amt )
                                                    values
                                                    ({0}                                , {1}                           , {2}                           , {3}
                                                    , {4}                               , {5}                           , {6}                           , {7}                       
                                                    , {8}                               , to_date({9},'dd/mm/yyyy')     , {10}                          , {11}                  
                                                    , {12}                              , {13}                          , {14}                          , {15}                  
                                                    , {16}                              , {17}                          , {18}                          , {19} 
                                                    , {20} )";
                        sqlInsert = WebUtil.SQLFormat(sqlInsert, state.SsCoopControl, ls_assno, dsMain.DATA[0].process_year, member_no
                                                    , dsMain.DATA[0].assisttype_code, ls_asstypepay, assistmax_amt, assistmax_amt
                                                    , "8", ls_reqdate, state.SsUsername, main_moneytype
                                                    , dsMain.DATA[0].expense_bank, dsMain.DATA[0].expense_branch, expacc_id, itempay_amt
                                                    , ls_sendsystem, dsMain.DATA[0].cal_date, deptacc_no, assistcut_amt, 0);
                        exed.SQL.Add(sqlInsert);
                    }
                    exed.Execute();
                    Session.Remove("SSGenrequest");
                    dsList.ResetRow();
                    dsSum.ResetRow();

                    string ls_delete = @"delete from assgenrequestdocno where assisttype_code = {0} ";
                    ls_delete = WebUtil.SQLFormat(ls_delete, dsMain.DATA[0].assisttype_code);
                    WebUtil.ExeSQL(ls_delete);

                    LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกสำเร็จ");
                }
                catch (Exception ex)
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกผิดพลาด "+ex); return;
                }
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("Error" + ex); return;
            }
        }

        public string [] Getmoneytype (String member_no)
        {
            string [] expense = new string[6];
            String sql = @"select moneytype_code,expense_bank,expense_branch,expense_accid,send_system,deptaccount_no from asscontmaster
                                        where member_no ='" + member_no + "' and assisttype_code ='50'";
            Sdt dt = WebUtil.QuerySdt(sql);
            if (dt.Rows.Count > 0)
            {
                if (dt.Next())
                {
                    expense[0] = dt.GetString("expense_bank");
                    expense[1] = dt.GetString("expense_branch");
                    expense[2] = dt.GetString("expense_accid");
                    expense[3] = dt.GetString("send_system");
                    expense[4] = dt.GetString("deptaccount_no");
                    expense[5] = dt.GetString("moneytype_code");
                }
            }
            
            return expense;
        }

        public void SaveWebSheet()
        {
            SaveData();
        }

        public void WebSheetLoadEnd()
        {
            if (dsMain.DATA[0].moneytype_code == "CSH" || dsMain.DATA[0].moneytype_code == "TGP")
            {
                this.SetOnLoadedScript("dsMain.GetElement(0, 'expense_bank').style.background = '#CCCCCC'; dsMain.GetElement(0, 'expense_bank').readOnly = true; dsMain.GetElement(0, 'expense_branch').style.background = '#CCCCCC'; dsMain.GetElement(0, 'expense_branch').readOnly = true;");
            }
        }
        private string of_getsqlrank(Int32 ai_perunit, Int32 ai_numper, string as_table)
        {
            string ls_lastdate, ls_sqlext = "";
            Int32 li_assyear = 0;
            DateTime ldtm_caldate;

            li_assyear = Convert.ToInt32(dsMain.DATA[0].process_year);
            ldtm_caldate = dsMain.DATA[0].cal_date;

            // 1=นับปี 2=นับเดือน(ชนเดือน) 3=นับเดือน(ชนวัน)
            if (ai_perunit == 1)
            {
                li_assyear = li_assyear - ai_numper;
                ls_sqlext = " and " + as_table + ".assist_year > " + Convert.ToString(li_assyear);
            }
            else if (ai_perunit == 2)
            {
                ls_lastdate = ldtm_caldate.AddMonths(ai_numper * -1).ToString("yyyyMM");
                ls_sqlext = " and to_char(" + as_table + ".approve_date,'yyyymm') > '" + ls_lastdate + "'";
            }
            else if (ai_perunit == 3)
            {
                ls_lastdate = ldtm_caldate.AddMonths(ai_numper * -1).ToString("yyyyMMdd");
                ls_sqlext = " and " + as_table + ".approve_date > to_date('" + ls_lastdate + "','yyyymmdd')";
            }

            return ls_sqlext;
        }

        private string of_getsqlrankreq(Int32 ai_perunit, Int32 ai_numper, string as_table)
        {
            string ls_lastdate, ls_sqlext = "";
            Int32 li_assyear = 0;
            DateTime ldtm_caldate;

            li_assyear = Convert.ToInt32(dsMain.DATA[0].process_year);
            ldtm_caldate = dsMain.DATA[0].cal_date;

            // 1=นับปี 2=นับเดือน(ชนเดือน) 3=นับเดือน(ชนวัน)
            if (ai_perunit == 1)
            {
                li_assyear = li_assyear - ai_numper;
                ls_sqlext = " and " + as_table + ".assist_year > " + Convert.ToString(li_assyear);
            }
            else if (ai_perunit == 2)
            {
                ls_lastdate = ldtm_caldate.AddMonths(ai_numper * -1).ToString("yyyyMM");
                ls_sqlext = " and to_char(" + as_table + ".calage_date,'yyyymm') > '" + ls_lastdate + "'";
            }
            else if (ai_perunit == 3)
            {
                ls_lastdate = ldtm_caldate.AddMonths(ai_numper * -1).ToString("yyyyMMdd");
                ls_sqlext = " and " + as_table + ".calage_date > to_date('" + ls_lastdate + "','yyyymmdd')";
            }

            return ls_sqlext;
        }
    }

}