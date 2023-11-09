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

namespace Saving.Applications.assist.ws_sheet_as_genrequest_ctrl
{
    public partial class ws_sheet_as_genrequest : PageWebSheet, WebSheet
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

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
            //dsList.InitDsList(this);
            dsSum.InitDsSum(this);
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)//show data first  
            {
                dsMain.GetAssYear();

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
                dsMain.DATA[0].trtype_code = "DEP";
                sqlStr = @"select min(depttype_code) as depttype_code from dpdepttype where coop_id = {0}";
                sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopId);
                Sdt dt2 = WebUtil.QuerySdt(sqlStr);
                dt2.Next();
                dsMain.DATA[0].depttype_code = dt2.GetString("depttype_code");

                this.SetOnLoadedScript("dsMain.GetElement(0, 'expense_bank').style.background = '#CCCCCC'; dsMain.GetElement(0, 'expense_bank').readOnly = true; dsMain.GetElement(0, 'expense_branch').style.background = '#CCCCCC'; dsMain.GetElement(0, 'expense_branch').readOnly = true;");
            }


        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostProcess)
            {
                //dsList.ResetRow();
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
                GridView1.DataSource = null;
                GridView1.DataBind();
                string month_year = dsMain.DATA[0].process_month + "/" + Convert.ToString(dsMain.DATA[0].process_year);
                string sql = @"select (LAST_DAY(to_date({0},'mm/yyyy'))) cal_date   from dual";
                sql = WebUtil.SQLFormat(sql, month_year);
                Sdt dt = WebUtil.QuerySdt(sql);
                if (dt.Next())
                {
                    dsMain.DATA[0].cal_date = dt.GetDate("cal_date");
                }
              
                
            }
            else if (eventArg == PostSeleteData) {
                GetCalculate(dsMain.DATA[0].assisttype_code);
                GridView1.DataSource = null;
                GridView1.DataBind();
                
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
            string ls_trtypecode = dsMain.DATA[0].trtype_code;
            string ls_asscode = dsMain.DATA[0].assisttype_code;
            string ls_memtypecode, ls_assisgroup, ls_yearmonth, sqlStr, mbcatcode = "", mbcat_code = "", ls_paycode;
            int li_agemem = 0, li_memtypeflag = 0, li_calflag = 0, li_proflag = 0, li_stmflag = 1, li_mbchktype = 0, liage_flag = 0, li_round = 0;
            decimal ldc_permiss = 0, ldc_maxamt = 0, ldc_agenum = 0, ldc_dateflag = 0;
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
                li_proflag = dt_chk1.GetInt32("stmpay_type");// 0 =เดือนตรงวัน , 1 = เดือนระบุวัน , 2 = ปี
                li_stmflag = dt_chk1.GetInt32("stm_flag");// 1 = จ่ายต่อเนื่องทุกเดือน 2 = ประมวลผลจ่ายปีต่อปี
                liage_flag = dt_chk1.GetInt32("age_flag");//เช็คอายุ
                ldc_agenum = dt_chk1.GetDecimal("age_num");
                li_round = dt_chk1.GetInt32("ageround_flag");   //0 ไม่ปัด , 1 ปัดเต็มปี  2 ปัดทิ้ง   
                ldc_dateflag = dt_chk1.GetDecimal("date_flag"); //0 วันเปนสมาชิก , 1 วันโอนย้าย
            }

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

            //ท่อนดึงข้อมูลผู้ที่มีสิทธิ์ได้รับสวัสดิการ
            if (li_stmflag == 2)
            {
                if (li_proflag == 2)
                {
                    sqlStr = @"
    
			        select distinct(mb.member_no) member_no , ft_getmbname(mb.coop_id , mb.member_no) full_name , (mb.birth_date )birth_date ,ftcm_calagemth( mb.birth_date , {3} ) mem_age
                    ,ftcm_calagemth( mb.member_date ,{3} ) work_age, (LAST_DAY(to_date({4},'mm/yyyy'))) slip_date,  add_months( to_date(LAST_DAY(to_date({4},'mm/yyyy'))), 543*12 ) slip_date2,(0) max_payamt,(0) approve_amt,(0) prncbal
                     ,(0)withdrawable_amt,(1) last_periodpay ,(mb.membtype_code) membtype_code,({1}) assisttype_code,('false') choose_flag , (mb.expense_accid) expense_accid, (mb.membcat_code) membcat_code
                    ,nvl( trunc(months_between({3},mb.member_date)), 0) as age_membmth
			        ,nvl( trunc(months_between({3},mb.birth_date)), 0) as age_birthmth
                    ,nvl(( select min(dm.deptaccount_no)  from dpdeptmaster dm where dm.member_no = mb.member_no and dm.deptclose_status = 0  and dm.depttype_code = {6}) , '') as deptaccount_no
                    ,'01' as assistpay_code
                    ,nvl( trunc(months_between({3},mb.tranmem_date)), 0) as tranmem_age
                    ,(select max(asm.lastpay_date) from asscontmaster asm where asm.assisttype_code = {1} and asm.member_no = mb.member_no ) as lastpay_date,mb.member_date,add_months(( mb.member_date), 543*12 ) member_date2
			          from  mbmembmaster mb 
			        where    mb.coop_id = {0} 
                    and   mb.resign_status = 0
                    and mb.membcat_code like {5} 
                    and ftcm_calagemth( mb.birth_date , {3} ) >= {8}
                    and mb.birth_date is not null 
			        and mb.member_date is not null
			        and mb.member_date <= LAST_DAY(to_date({4},'mm/yyyy') )
                    and   mb.member_no not in
		            (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code={1}  
		            and EXTRACT(year FROM req_date)=EXTRACT(year FROM {3}) and req_status<>-9 ) 
			        order by mb.member_no ";
                }
                else
                {
                    sqlStr = @"
    
			        select distinct(mb.member_no) member_no , ft_getmbname(mb.coop_id , mb.member_no) full_name , (mb.birth_date )birth_date ,ftcm_calagemth( mb.birth_date , {3} ) mem_age
                    ,ftcm_calagemth( mb.member_date ,{3} ) work_age, (LAST_DAY(to_date({4},'mm/yyyy'))) slip_date,  add_months( to_date(LAST_DAY(to_date({4},'mm/yyyy'))), 543*12 ) slip_date2,(0) max_payamt,(0) approve_amt,(0) prncbal
                     ,(0)withdrawable_amt,(1) last_periodpay ,(mb.membtype_code) membtype_code,({1}) assisttype_code,('false') choose_flag , (mb.expense_accid) expense_accid, (mb.membcat_code) membcat_code
                    ,nvl( trunc(months_between({3},mb.member_date)), 0) as age_membmth
			        ,nvl( trunc(months_between({3},mb.birth_date)), 0) as age_birthmth
                    ,nvl(( select min(dm.deptaccount_no)  from dpdeptmaster dm where dm.member_no = mb.member_no and dm.deptclose_status = 0  and dm.depttype_code = {6}) , '') as deptaccount_no
                    ,'01' as assistpay_code
                    ,nvl( trunc(months_between({3},mb.tranmem_date)), 0) as tranmem_age
                    ,(select max(asm.lastpay_date) from asscontmaster asm where asm.assisttype_code = {1} and asm.member_no = mb.member_no ) as lastpay_date, mb.member_date,add_months(( mb.member_date), 543*12 ) member_date2
			          from  mbmembmaster mb 
			        where    mb.coop_id = {0} 
                    and   mb.resign_status = 0
                    and mb.membcat_code like {5} 
                    and ftcm_calagemth( mb.birth_date , {3} ) >= {8}
                    and mb.birth_date is not null 
			        and mb.member_date is not null
			        and mb.member_date <= LAST_DAY(to_date({4},'mm/yyyy') )
                    and to_char(mb.birth_date,'mm') = {7}
                    and mb.member_no not in
		            (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code={1}  
		            and EXTRACT(year FROM req_date)=EXTRACT(year FROM {3}) and req_status<>-9 )  
			        order by mb.member_no ";
                }
            }
            else
            {
                sqlStr = @"
			select  (asm.member_no) member_no, ft_getmbname(asm.coop_id , asm.member_no) full_name , (mb.birth_date )birth_date ,ftcm_calagemth( mb.birth_date ,{3} ) mem_age
            ,ftcm_calagemth( mb.member_date , {3} ) work_age, (ast.slip_date) slip_date, add_months( to_date(ast.slip_date), 543*12 ) slip_date2
            ,(0) max_payamt,(asm.approve_amt) approve_amt,(0) prncbal,(asm.withdrawable_amt) withdrawable_amt,( asm.last_periodpay + 1 ) last_periodpay ,(mb.membtype_code) membtype_code,(asm.assisttype_code) assisttype_code,('false') choose_flag,(mb.expense_accid) expense_accid
            , (mb.membcat_code) membcat_code
            ,nvl( trunc(months_between({3},mb.member_date)), 0) as age_membmth
			,nvl( trunc(months_between({3},mb.birth_date)), 0) as age_birthmth
            ,nvl(( select min(dm.deptaccount_no)  from dpdeptmaster dm where dm.member_no = mb.member_no and dm.deptclose_status = 0  and dm.depttype_code = {6}) , '') as deptaccount_no
            ,nvl( (asm.assistpay_code) , '01' ) as assistpay_code
            ,nvl( trunc(months_between({3},mb.tranmem_date)), 0) as tranmem_age
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
            and     mb.membcat_code like {5}
            and     ftcm_calagemth( mb.birth_date , {3} ) >= {8}
            and     asm.assisttype_code = {1}
            and     asm.coop_id = {0}
            and    mb.resign_status = 0
            and   asm.member_no not in
		    (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code={1}  
		     and  to_char(assreqmaster.req_date, 'yyyymm')  =  {2} and assreqmaster.req_status not in (-9,-99) )
            and   asm.member_no not in
		    (select assreqmaster.member_no from  assreqmaster where   assreqmaster.assisttype_code={1}  
		     and  to_char(assreqmaster.req_date, 'yyyymm')  <=  {2} and assreqmaster.req_status = 8 )
            order by mb.member_no ";

            }

            sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopControl, ls_asscode, ls_yearmonth, dsMain.DATA[0].cal_date, month_year, mbcatcode, dsMain.DATA[0].depttype_code, dsMain.DATA[0].process_month, ldc_agenum);
            DataTable dt = WebUtil.Query(sqlStr);
            GridView1.DataSource = dt;
            ViewState["dt"] = dt;
            GridView1.DataBind();


            int row = GridView1.Rows.Count;
            Hd_rowcount.Value = Convert.ToString(row);
           

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
                //deptaccount_no = dt.Rows[ii].Field<string>("deptaccount_no");

                //เช็คเงื่อนไข กรณีที่ไม่มีวันโอนย้าย จะคิดจากวันที่เป็นสมาชิก
                if (ldc_dateflag == 1 && li_trnage == 0)
                {
                    ls_dateflag = "0";
                }

                if (li_calflag == 2) //อายุ
                {
                    li_agemem =  Convert.ToInt32(dt.Rows[ii].Field<Decimal>("age_birthmth")); //(Convert.ToInt32(ls_arr_mem[0]) * 12) + Convert.ToInt32(ls_arr_mem[1]); //อายุสมาชิก
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

                ldc_permiss = of_getpermissmax(mem_no, dsMain.DATA[0].assisttype_code, ls_paycode, li_agemem, mbcat_code, ref ldc_maxamt);

                if(ldc_permiss > 0 ) 
                {
                    if (li_stmflag == 1)
                    {
                        ldc_maxamt = apv_amt;
                    }

                    ((TextBox)GridView1.Rows[ii].FindControl("max_payamt")).Text = ldc_permiss.ToString("###,##0.00");
                    ((TextBox)GridView1.Rows[ii].FindControl("approve_amt")).Text = ldc_maxamt.ToString("###,##0.00");

                    //หาเลขบัญชีตามการรับเงินของสมาชิก
                    if (ls_trtypecode == "DEP")
                    {
                        dt.Rows[ii][15] = dt.Rows[ii].Field<string>("deptaccount_no");
                    }

                    //break;
                }
                else
                {
                    TempRow.Add(ii);
                    //break;
                }

                //if (deptaccount_no == "" || deptaccount_no == null)
                //{
                //    cn_accid = cn_accid + 1;
                //    memno_ms = memno_ms + "  " + mem_no;
                //}


                //if (li_stmflag == 2)
                //{
                    dt.Rows[ii][7] = ldc_permiss.ToString("###,##0.00");
                    dt.Rows[ii][8] = ldc_maxamt.ToString("###,##0.00");
                //}
                //else
                //{
                //    dt.Rows[ii][11] = ldc_permiss.ToString("###,##0.00");
                //    dt.Rows[ii][12] = ldc_maxamt.ToString("###,##0.00");
                //}

                //((TextBox)GridView1.Rows[ii].FindControl("max_payamt")).Text = dec_maxpayamt.ToString("###,##0.00");
                //((TextBox)GridView1.Rows[ii].FindControl("approve_amt")).Text = dec_amount.ToString("###,##0.00");
                ////   ((TextBox)GridView1.Rows[ii].FindControl("prncbal")).Text = dec_prncbal.ToString("###,##0.00");
            }
            if (GridView1.Rows.Count == 0)
            {
                string ls_monthdesc = "";
                switch (dsMain.DATA[0].process_month)
                {
                    case "01":
                        ls_monthdesc = "มกราคม"; break;
                    case "02":
                        ls_monthdesc = "กุมภาพันธ์"; break;
                    case "03":
                        ls_monthdesc = "มีนาคม"; break;
                    case "04":
                        ls_monthdesc = "เมษายน"; break;
                    case "05":
                        ls_monthdesc = "พฤษภาคม"; break;
                    case "06":
                        ls_monthdesc = "มิถุนายน"; break;
                    case "07":
                        ls_monthdesc = "กรกฎาคม"; break;
                    case "08":
                        ls_monthdesc = "สิงหาคม"; break;
                    case "09":
                        ls_monthdesc = "กันยายน"; break;
                    case "10":
                        ls_monthdesc = "ตุลาคม"; break;
                    case "11":
                        ls_monthdesc = "พฤศจิกายน"; break;
                    case "12":
                        ls_monthdesc = "ธันวาคม"; break;
                }

                LtServerMessage.Text = WebUtil.ErrorMessage("ไม่พบสิทธิ์ของสมาชิกในการขอสวัสดิการประเภทนี้ ในปี " + ( dsMain.DATA[0].process_year + 543 ) + " เดือน" + ls_monthdesc);
                return;
            }
            else
            {
                for (int aa = 0; aa <= dt.Rows.Count; aa++)
                {
                    bool isInList = TempRow.IndexOf(aa) != -1;
                    if (isInList)
                    {
                        dt.Rows[aa].Delete();
                    }

                }
                decimal sum_max = 0;
                decimal sum_approve = 0;
                //foreach (DataRow dr in dt.Rows)
                //{
                //    sum_max += Convert.ToDecimal(dr["max_payamt"]);
                //    sum_approve += Convert.ToDecimal(dr["approve_amt"]);
                //}
                GridView1.DataSource = dt;
                GridView1.DataBind();
                //       dsMain.DATA[0].all_check = 1;
                //if (cn_accid > 0 )
                //{
                //    LtServerMessage.Text = WebUtil.ErrorMessage("มีรายการใบคำขอทั้งหมด " + GridView1.Rows.Count + " รายการ มีทะเบียนไม่มีเลขที่บัญชี " + memno_ms + " รวมจำนวน " + cn_accid+ " รายการ");
                //    //cn_accid = cn_accid + 1;
                //    //memno_ms = memno_ms + mem_no;
                //}
                //else
                //{
                //    LtServerMessage.Text = WebUtil.CompleteMessage("มีรายการใบคำขอทั้งหมด " + GridView1.Rows.Count + " รายการ");
                //}
                LtServerMessage.Text = WebUtil.CompleteMessage("มีรายการใบคำขอทั้งหมด " + GridView1.Rows.Count + " รายการ");
                dsSum.DATA[0].sum_maxpayamt = Convert.ToDecimal(sum_max);
                dsSum.DATA[0].sumapprove_amt = Convert.ToDecimal(sum_approve);
            }
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
            Int32 li_mbtypechk = 1, li_limnum = 0, li_mbcattypechk = 1, li_rcvnum = 0;
            decimal ldc_maxamt = 0, ldc_maxloop = 0, ldc_permiss = 0, ldc_maxnextpay = 0;
            decimal ldc_mbrank = 0;
            int li_year = 0;
            String sqlStr = "";
            Sdt dtd;

            // ดูเงื่อนไขกาารให้สวัสดิการ
            sqlStr = @"select limitreq_num, limitmax_amt, max_nextpayamt, limrcvreq_num from assucfassisttype where coop_id = {0} and assisttype_code = {1}";
            sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopControl, as_asscode);
            dtd = WebUtil.QuerySdt(sqlStr);

            if (dtd.Next())
            {
                li_limnum = dtd.GetInt32("limitreq_num");
                ldc_maxloop = dtd.GetDecimal("limitmax_amt");
                ldc_maxnextpay = dtd.GetDecimal("max_nextpayamt");
                li_rcvnum = dtd.GetInt32("limrcvreq_num"); 
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

            return ldc_permiss;
        }

        public void SaveData()
        {
            try
            {
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
                if (ls_trtypecode == "DEP")
                {
                    ls_sendsystem = "DEP";
                }
                string ls_reqdate = dsMain.DATA[0].work_date.Substring(0, 6) + (Convert.ToInt32(dsMain.DATA[0].work_date.Substring(6, 4)) - 543);
                int row = GridView1.Rows.Count;
                for (int ii = 0; ii < row; ii++)
                {
                    CheckBox choose_flag = GridView1.Rows[ii].Cells[1].FindControl("choose_flag") as CheckBox;
                    string choose_flag1 = Convert.ToString(choose_flag.Checked);
                    if (choose_flag1 == "True")
                    {
                        string ls_assno = wcf.NCommon.of_getnewdocno(state.SsWsPass, state.SsCoopId, "ASSISTDOCNO");
                        TextBox ls_memno = (TextBox)GridView1.Rows[ii].FindControl("member_no");
                        TextBox approve_amt = (TextBox)GridView1.Rows[ii].FindControl("approve_amt");
                        TextBox max_payamt = (TextBox)GridView1.Rows[ii].FindControl("max_payamt");
                        TextBox expense_accid = (TextBox)GridView1.Rows[ii].FindControl("expense_accid");
                        decimal approve_payamt = Convert.ToDecimal(approve_amt.Text);
                        decimal maxpay_amt = Convert.ToDecimal(max_payamt.Text);

                        if (ls_trtypecode == "DEP")
                        {
                            deptacc_no = expense_accid.Text;
                            expacc_id = "";
                        }
                        else
                        {
                            expacc_id = expense_accid.Text;
                            deptacc_no = "";
                        }


                        try
                        {
                            string sqlStr = @"insert into assreqmaster
                            (coop_id                    , assist_docno              , assist_year           , member_no 
                            , assisttype_code           , assistpay_code            , assistmax_amt         , assist_amt            , req_status
                            , req_date                            , entry_id              , moneytype_code        , expense_bank
                            , expense_branch            , expense_accid             , assistnet_amt         , send_system           , calage_date
                            , deptaccount_no )
                            values
                            ({0}                           , {1}                   , {2}                   , {3}
                            , {4}                       , {5}                       , {6}                   , {7}                   , {8}
                            , to_date({9},'dd/mm/yyyy'), {10}                  , {11}                  , {12}
                            , {13}                      , {14}                      , {15}                  , {16}                  , {17}
                            , {18} )";
                            sqlStr = WebUtil.SQLFormat(sqlStr,
                                state.SsCoopId, ls_assno, dsMain.DATA[0].process_year, ls_memno.Text
                                , dsMain.DATA[0].assisttype_code, ls_asstypepay, approve_payamt, maxpay_amt, "8"
                                , ls_reqdate, state.SsUsername, dsMain.DATA[0].moneytype_code, dsMain.DATA[0].expense_bank
                                , dsMain.DATA[0].expense_branch, expacc_id, maxpay_amt, ls_sendsystem, dsMain.DATA[0].cal_date
                                , deptacc_no);
                            WebUtil.ExeSQL(sqlStr);
                        }
                        catch
                        {
                            LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกผิดพลาด เลขสมาชิก " + ls_memno); return;
                        }
                    }
                }
                //dsList.ResetRow();
                GridView1.DataSource = null;
                GridView1.DataBind();
                LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกสำเร็จ");
            }
            catch
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("Error"); return;
            }
        }

        public void SaveWebSheet()
        {
            SaveData();
        }

        public void WebSheetLoadEnd()
        {
            if (dsMain.DATA[0].moneytype_code == "CSH")
            {
                this.SetOnLoadedScript("dsMain.GetElement(0, 'expense_bank').style.background = '#CCCCCC'; dsMain.GetElement(0, 'expense_bank').readOnly = true; dsMain.GetElement(0, 'expense_branch').style.background = '#CCCCCC'; dsMain.GetElement(0, 'expense_branch').readOnly = true;");
            }
        }
    }

}