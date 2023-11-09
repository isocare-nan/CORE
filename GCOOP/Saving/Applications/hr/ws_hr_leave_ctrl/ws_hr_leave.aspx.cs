using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;
using DataLibrary;

namespace Saving.Applications.hr.ws_hr_leave_ctrl
{
    public partial class ws_hr_leave : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public string PostEmpNo { get; set; }
        [JsPostBack]
        public String PostEmpLeave { get; set; }

        public void InitJsPostBack()
        {
            dsLeave.InitDs(this);
            dsMain.InitDs(this);
            dsDetail.InitDsDetail(this);
            //dsLasrights.InitDs(this);
            //dsCallas.InitDs(this);
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                dsLeave.DdHrucfleavecode();
                dsLeave.DdHrucfleaveapvby();
                dsLeave.DATA[0].COOP_ID = state.SsCoopId;//Data[0] คือ กำหนดข้อมูลที่ฟิวไหน กรณีรูปแบบของ FormView
                dsLeave.Visible = false;
                dsDetail.Visible = false;
                dsLasrights.Visible = false;
                dsCallas.Visible = false;
            }
            else
            {
                
                dsLeave.Visible = false;
                dsDetail.Visible = false;
                dsLasrights.Visible = false;
                dsCallas.Visible = false;
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostEmpNo)
            {
                dsLeave.Visible = true;
                dsDetail.Visible = true;
                dsLasrights.Visible = true;
                dsCallas.Visible = true;
                string EmpNo = dsMain.DATA[0].EMP_NO;
                dsMain.RetrieveEmp(EmpNo);
                dsLeave.DATA[0].EMP_NO = EmpNo;//นำข้อมูล emp_no จากที่ RetrieveEmp
                displeyAddress(EmpNo);
                dsDetail.RetrieveDetail(EmpNo);
                dsLasrights.Retrieveleavemax(EmpNo);
                dsCallas.RetrieveWorkage(EmpNo);
                calleave(EmpNo);
            }
            else if (eventArg == PostEmpLeave)
            {
                dsLeave.Visible = true;
                dsDetail.Visible = true;
                dsLasrights.Visible = true;
                dsCallas.Visible = true;
                int row = dsDetail.GetRowFocus();
                string Seqno = Convert.ToString(dsDetail.DATA[row].SEQ_NO);
                string EmpNo = dsMain.DATA[0].EMP_NO;
                dsLeave.Retrieveleave(Seqno,EmpNo);
                displeyAddress(EmpNo);
                dsDetail.RetrieveDetail(EmpNo);
                dsLeave.DdHrucfleaveapvby();
                dsLeave.DdHrucfleavecode();
                dsLasrights.Retrieveleavemax(EmpNo);
                dsCallas.RetrieveWorkage(EmpNo);
                calleave(EmpNo);
            } 
        }

        private void displeyAddress(string EmpNo)
        {
            string sql, address = "", addr_no = "", addr_moo = "", addr_village = ""
                , addr_road = "", addr_tambol = "", addr_province = "", addr_postcode = "", addr_mobilephone = "";
            try
            {
                sql = @"select 
                            hr.emp_no,
                            hr.ref_membno,
                            ma.member_no,
                            ma.addr_no as addr_no,
                            ma.addr_moo as addr_moo,
                            ma.addr_village as addr_village,
                            ma.addr_road as addr_road,
                            ma.addr_mobilephone as  addr_mobilephone,
						    ucftam.tambol_desc as ta,
						    ucfpro.province_desc as pr,
                            ma.addr_postcode as addr_postcode
                         from
                            hremployee hr,mbmembmaster ma,mbucftambol ucftam
						    ,mbucfprovince ucfpro
                         where
                            hr.emp_no = {0} and
                            hr.ref_membno=ma.member_no and
						    ma.tambol_code=ucftam.tambol_code and
						    ma.province_code=ucfpro.province_code";
                sql = WebUtil.SQLFormat(sql, EmpNo);
                Sdt dt = WebUtil.QuerySdt(sql);
                if (dt.Next())
                {
                    addr_no = dt.GetString("addr_no");
                    addr_moo = dt.GetString("addr_moo");
                    addr_village = dt.GetString("addr_village");
                    addr_road = dt.GetString("addr_road");
                    addr_tambol = dt.GetString("ta");
                    addr_province = dt.GetString("pr");
                    addr_postcode = dt.GetString("addr_postcode");
                    addr_mobilephone = dt.GetString("addr_mobilephone");
                }
                if (addr_no != "")
                {
                    address = "เลขที่ " + addr_no;
                }
                else
                {
                    address += "";
                }
                if (addr_moo != "")
                {
                    address += " หมู่ที่ " + addr_moo;
                }
                else
                {
                    address += "";
                }
                if (addr_village != "")
                {
                    address += " หมู่บ้าน" + addr_village;
                }
                else
                {
                    address += "";
                }
                if (addr_road != "")
                {
                    address += " ถ." + addr_road;
                }
                else
                {
                    address += "";
                }
                if (addr_tambol != "")
                {
                    address += " ตำบล" + addr_tambol;
                }
                else
                {
                    address += "";
                }
                if (addr_province != "")
                {
                    address += " จ." + addr_province;
                }
                else
                {
                    address += "";
                }
                if (addr_postcode != "")
                {
                    address += " " + addr_postcode;
                }
                else
                {
                    address += "";
                }
                
                dsLeave.DATA[0].LEAVE_PLACE = address;
                dsLeave.DATA[0].LEAVE_TEL = addr_mobilephone;
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.WarningMessage(ex.ToString());
            }
        }

        public void calleave(string EmpNo)
        {
            string year = Convert.ToString(WebUtil.GetAccyear(state.SsCoopControl, state.SsWorkDate));
            string year_eng = Convert.ToString(Convert.ToInt32(year) - 543);
            string year_eng2 = Convert.ToString(Convert.ToInt32(year_eng) - 1);
            string date_leave = "";
            string sql = @"select TO_CHAR(WORK_DATE, 'YYYY') as WORK_DATE from HREMPLOYEE where EMP_NO = {0}";
            sql = WebUtil.SQLFormat(sql, EmpNo);
            Sdt dt = WebUtil.QuerySdt(sql);
            if(dt.Next()){
                date_leave = dt.GetString("WORK_DATE");
            }
            //เช็คปีที่ทำงาน
            if (date_leave == year_eng)
            {
                //นับวันลาพักผ่อนของปีปัจจุบัน
                sql = @"select sum(hl.TOTALDAY) as TODAY
              FROM hrlogleave hl,
                   hrucfleavecode hlc,
                   hremployee he 
              where hl.leave_code = hlc.leave_code 
                                       and hl.emp_no = he.emp_no
                                       and TO_CHAR(hl.operate_date, 'YYYY') = {0}
                                       and he.emp_no = {1}
                                       and hl.leave_code = '006'";
                sql = WebUtil.SQLFormat(sql, year_eng, EmpNo);
                dt = WebUtil.QuerySdt(sql);
                string total = dt.GetString("TODAY");
                if (total == "")
                {
                    total = "0";
                }
                else
                {
                    total = dt.GetString("TODAY");
                }
                //เก็บจำนวนสิทธิวันลาปีนี้
                string today = dsCallas.DATA[0].TO_YEAR;
                dsCallas.DATA[0].FROM_YEAR = "0";
                //นำค่าวันลาปีนี้ลบออกจาสิทธิที่ลาได้
                int sumtoday = Convert.ToInt32(dsCallas.DATA[0].TO_YEAR) - Convert.ToInt32(total);
                //นำค่าวันลาปีนี้บวกกับสิทธิลาของปีก่อน
                int sumday = Convert.ToInt32(sumtoday) + Convert.ToInt32(dsCallas.DATA[0].FROM_YEAR);
                //ตรวจสอบการลาทั้ง 2 ปีรวมกันไม่เกิน 30 วัน
                if (sumday > 30)
                {
                    dsCallas.DATA[0].TOTAL = "30";
                }
                else
                {
                    dsCallas.DATA[0].TOTAL = Convert.ToString(sumday);
                }
            }
            else
            {
                //เก็บจำนวนสิทธิวันลาปีนี้
                string today = dsCallas.DATA[0].TO_YEAR;
                //นับวันลาพักผ่อนของปีก่อน
                sql = @"select sum(hl.TOTALDAY) as TODAY
              FROM hrlogleave hl,
                   hrucfleavecode hlc,
                   hremployee he 
              where hl.leave_code = hlc.leave_code 
                                       and hl.emp_no = he.emp_no
                                       and TO_CHAR(hl.operate_date, 'YYYY') = {0}
                                       and he.emp_no = {1}
                                       and hl.leave_code = '006'";
                sql = WebUtil.SQLFormat(sql, year_eng2, EmpNo);
                dt = WebUtil.QuerySdt(sql);
                string total = dt.GetString("TODAY");
                if (total == "")
                {
                    total = "0";
                }
                else
                {
                    total = dt.GetString("TODAY");
                }
                
                //คำนวนวันลาที่เหลือของปีก่อน
                string day = Convert.ToString(Convert.ToInt32(today) - Convert.ToInt32(total));
                dsCallas.DATA[0].FROM_YEAR = day;
                int sumday = Convert.ToInt32(dsCallas.DATA[0].TO_YEAR) + Convert.ToInt32(dsCallas.DATA[0].FROM_YEAR);
                if (sumday > 30)
                {
                    dsCallas.DATA[0].TOTAL = "30";
                }
                else
                {
                    dsCallas.DATA[0].TOTAL = Convert.ToString(sumday);
                }
                string to_sumtal = dsCallas.DATA[0].TOTAL;
                //นับวันลาพักผ่อนของปีปัจจุบัน
                string to_tal = "",leave = "";
                string sql2 = @"select sum(hl.TOTALDAY) as TO_DAY
              FROM hrlogleave hl,
                   hrucfleavecode hlc,
                   hremployee he 
              where hl.leave_code = hlc.leave_code 
                                       and hl.emp_no = he.emp_no
                                       and TO_CHAR(hl.operate_date, 'YYYY') = {0}
                                       and he.emp_no = {1}
                                       and hl.leave_code = '006'";
                sql2 = WebUtil.SQLFormat(sql2, year_eng, EmpNo);
                Sdt dt2 = WebUtil.QuerySdt(sql2);
                if (dt2.Next())
                {
                    to_tal = dt2.GetString("TO_DAY");
                }
                if (to_tal == "")
                {
                    to_tal = "0";
                }
                else
                {
                    to_tal = dt2.GetString("TO_DAY");
                }
                leave = Convert.ToString(Convert.ToInt32(to_sumtal) - Convert.ToInt32(to_tal));
                dsCallas.DATA[0].DAYTAL = leave;
            }
        }

        public void SaveWebSheet()
        {
            ExecuteDataSource exed = new ExecuteDataSource(this);
            string coop_id = state.SsCoopControl;
            string EmpNo = dsMain.DATA[0].EMP_NO;
            string sql = "select * from hrlogleave where coop_id = {0} and emp_no = {1}";
            string row = dsLeave.DATA[0].SEQ_NO.ToString();
            sql = WebUtil.SQLFormat(sql, state.SsCoopControl, dsMain.DATA[0].EMP_NO.Trim());
            Sdt dt = WebUtil.QuerySdt(sql);
            try
            {
                if (dt.Rows.Count <= 0  )
                {
                    decimal SeqNo = 1;//unique
                    string fullname = dsMain.DATA[0].FULLNAME;
                    dsLeave.DATA[0].SEQ_NO = SeqNo;//กำหนดค่าให้ ds.Leave >> SEQ_NO ใหม่ ให้เป็น ค่าใหม่ที่กำหนด จาก string sql select max(seq_no)+1
                    //SavePass ตัวดัก Eror
                    dsLeave.DATA[0].EMP_NO = EmpNo;
                    dsLeave.DATA[0].COOP_ID = coop_id;
                    ExecuteDataSource exe = new ExecuteDataSource(this);
                    exe.AddFormView(dsLeave, ExecuteType.Insert);
                    exe.Execute();
                    LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกการลาสำเร็จ " + " " + EmpNo + " " + fullname);
                    reset();
                    dsDetail.RetrieveDetail(EmpNo);
                    
                }
                else 
                {
                
                string fullname = dsMain.DATA[0].FULLNAME;
                //string seqno = Convert.ToString(dsDetail.DATA[0].SEQ_NO);
                if (dsLeave.DATA[0].SEQ_NO.ToString() != "0")
                    {
                        string sql2 = "select * from hrlogleave where coop_id = {0} and emp_no = {1}";
                        sql2 = WebUtil.SQLFormat(sql2, state.SsCoopControl, dsLeave.DATA[0].EMP_NO.Trim());
                        Sdt dt2 = WebUtil.QuerySdt(sql);
                        dsLeave.DATA[0].COOP_ID = coop_id;
                        exed.AddFormView(dsLeave, ExecuteType.Update);
                        exed.Execute();
                        exed.SQL.Clear();
                        LtServerMessage.Text = WebUtil.CompleteMessage("แก้ไขข้อมูลสำเร็จ" + " " + EmpNo + " " + fullname);
                        reset();
                        dsDetail.RetrieveDetail(EmpNo);
                    }
                    else 
                    //if (dsLeave.DATA[0].SEQ_NO.ToString() == SeqNo.ToString())
                    {
                        string CoopId = state.SsCoopId;//unique
                        decimal SeqNo = 1;//unique
                        string sql2 = @"select max(seq_no)+1 as seq_no from hrlogleave where emp_no ={0} and coop_id={1}";//นำค่าแมกของ seq_no บวก 1 เพื่อให้เป็นค่า seq_no ของลำดับต่อไป
                        sql2 = WebUtil.SQLFormat(sql2, EmpNo, CoopId);//format ในรูปของ sql
                        Sdt dt2 = WebUtil.QuerySdt(sql2);
                        if (dt2.Next())
                        {
                            SeqNo = dt2.GetDecimal("seq_no");
                        }
                        dsLeave.DATA[0].SEQ_NO = SeqNo;//กำหนดค่าให้ ds.Leave >> SEQ_NO ใหม่ ให้เป็น ค่าใหม่ที่กำหนด จาก string sql select max(seq_no)+1
                        //SavePass ตัวดัก Eror
                        dsLeave.DATA[0].COOP_ID = coop_id;
                        ExecuteDataSource exe = new ExecuteDataSource(this);
                        exe.AddFormView(dsLeave, ExecuteType.Insert);
                        exe.Execute();
                        LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกการลาสำเร็จ " + " " + EmpNo + " " + fullname);
                        reset();
                        dsDetail.RetrieveDetail(EmpNo);
                    }
                }

                dsDetail.RetrieveDetail(EmpNo);
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }
        }

        private void reset()
        {
            dsMain.ResetRow();
            dsLeave.ResetRow();
            dsLeave.DdHrucfleavecode();
            dsLeave.DdHrucfleaveapvby();
        }

        public void WebSheetLoadEnd()
        {

        }

        public object LAS_EMWORK { get; set; }
    }
}