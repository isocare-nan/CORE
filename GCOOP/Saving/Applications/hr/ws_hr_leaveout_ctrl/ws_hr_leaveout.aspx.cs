using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;
using DataLibrary;


namespace Saving.Applications.hr.ws_hr_leaveout_ctrl
{
    public partial class ws_hr_leaveout : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public string PostEmpNo { get; set; }

        [JsPostBack]
        public string Post { get; set; }

        [JsPostBack]
        public string PostLast { get; set; }

        [JsPostBack]
        public String PostEmpLeave { get; set; }

        public void InitJsPostBack()
        {
            dsLeaveout.InitDs(this);
            dsMain.InitDs(this);
            dsDetail.InitDsDetail(this);
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                dsLeaveout.DdHrucfleaveapvby();
                dsLeaveout.DATA[0].COOP_ID = state.SsCoopId;//Data[0] คือ กำหนดข้อมูลที่ฟิวไหน กรณีรูปแบบของ FormView
                dsLeaveout.DATA[0].OPERATE_DATE = state.SsWorkDate;
                dsLeaveout.DATA[0].LEAVE_FROM = state.SsWorkDate;
                dsLeaveout.DATA[0].LEAVE_TO = state.SsWorkDate;
                dsLeaveout.DATA[0].APV_DATE = state.SsWorkDate;
                dsLeaveout.Visible = false;
                dsDetail.Visible = false;
            }
            
        }

        public void CheckJsPostBack(string eventArg)
        {
            string stime = dsLeaveout.DATA[0].START_TIME;
            string ltime = dsLeaveout.DATA[0].LAST_TIME;
            decimal hours = 0, min = 0;

            if (eventArg == PostEmpNo)
            {
                dsLeaveout.Visible = true;
                string EmpNo = dsMain.DATA[0].EMP_NO;
                dsMain.RetrieveEmp(EmpNo);
                dsLeaveout.DATA[0].EMP_NO = EmpNo;//นำข้อมูล emp_no จากที่ RetrieveEmp
                dsDetail.Visible = true;
                dsDetail.RetrieveDetail(EmpNo);
                dsLeaveout.DdHrucfleaveapvby();
            }
            else if (eventArg == PostEmpLeave)
            {
                dsLeaveout.Visible = true;
                int row = dsDetail.GetRowFocus();
                string Seqno = Convert.ToString(dsDetail.DATA[row].SEQ_NO);
                string EmpNo = dsMain.DATA[0].EMP_NO;
                dsLeaveout.Retrieveleave(Seqno, EmpNo);
                dsDetail.Visible = true;
                dsDetail.RetrieveDetail(EmpNo);
                dsLeaveout.DdHrucfleaveapvby();
                dsLeaveout.DdHrucfleavecode();
            } 
            else if (eventArg == Post)
            {

            }
            else if (eventArg == PostLast)
            {
                try
                {
                    //check condition if(totalhours>3.5) then calculate last_time-start-time=3.5
                    //else totaltime   
                    decimal statime = Convert.ToDecimal(stime);
                    decimal entime = Convert.ToDecimal(ltime);
                    if (statime <= 12 && entime >= 13)
                    {
                        string[] args = Convert.ToString(stime).Split('.');
                        string[] args2 = Convert.ToString(ltime).Split('.');
                        string s1, s2, l1, l2;
                        decimal all = 0;
                        s1 = args[0];
                        s2 = args[1];
                        l1 = args2[0];
                        l2 = args2[1];

                        stime = s1 + ':' + s2;
                        ltime = l1 + ':' + l2;
                        string startTime = stime;
                        string endTime = ltime;
                        TimeSpan duration = DateTime.Parse(endTime).Subtract(DateTime.Parse(startTime));
                        string sumtime = Convert.ToString(duration);
                        string[] args3 = Convert.ToString(sumtime).Split(':');
                        string th, tm, ts;
                        th = args3[0];
                        tm = args3[1];
                        ts = args3[2];
                        hours = Convert.ToDecimal(th + "." + tm);
                        all = hours;
                        all = all - 1;
                        dsLeaveout.DATA[0].TOTALTIME = all;
                    }
                    else 
                    {
                        string[] args = Convert.ToString(stime).Split('.');
                        string[] args2 = Convert.ToString(ltime).Split('.');
                        string s1, s2, l1, l2;
                        decimal all = 0;
                        s1 = args[0];
                        s2 = args[1];
                        l1 = args2[0];
                        l2 = args2[1];

                        stime = s1 + ':' + s2;
                        ltime = l1 + ':' + l2;
                        string startTime = stime;
                        string endTime = ltime;
                        TimeSpan duration = DateTime.Parse(endTime).Subtract(DateTime.Parse(startTime));
                        string sumtime = Convert.ToString(duration);
                        string[] args3 = Convert.ToString(sumtime).Split(':');
                        string th, tm, ts;
                        th = args3[0];
                        tm = args3[1];
                        ts = args3[2];
                        hours = Convert.ToDecimal(th + "." + tm);
                        all = hours;
                        dsLeaveout.DATA[0].TOTALTIME = all;
                    }

                }
                catch (Exception ex)
                {
                    LtServerMessage.Text = WebUtil.WarningMessage(ex.ToString());
                }
                
            }
        }

        public bool checkTime(string EmpNo)
        {
            decimal tbox = 0;
            string sql = @"select 
                                seq_no,emp_no,totaltime
                            from
                                hrlogleave
                            where
                                emp_no={0}
                                order by seq_no";
            decimal totalhour = 0;
            sql = WebUtil.SQLFormat(sql, EmpNo);
            Sdt dt = WebUtil.QuerySdt(sql);
            if (dt.Next())
            {
                //totalhour = dt.GetDecimal("totaltime");
                for (int i = 0; i < dt.GetRowCount(); i++)
                {
                    totalhour += Convert.ToDecimal(dt.Rows[i]["totaltime"]);
                }
            }
            tbox = dsLeaveout.DATA[0].TOTALTIME;
            totalhour += tbox;
            if (Convert.ToDouble(totalhour) > 3.5)
                return true;
            else
                return false;
        }

        public void SaveWebSheet()
        {
            ExecuteDataSource exe = new ExecuteDataSource(this);

            string coop_id = state.SsCoopControl;
            string EmpNo = dsMain.DATA[0].EMP_NO;
            string sql = "select * from hrlogleave where coop_id = {0} and emp_no = {1}";
            string row = dsLeaveout.DATA[0].SEQ_NO.ToString();
            sql = WebUtil.SQLFormat(sql, state.SsCoopControl, dsMain.DATA[0].EMP_NO.Trim());
            Sdt dt = WebUtil.QuerySdt(sql);
            string fullname = dsMain.DATA[0].FULLNAME;
            double min = 2.0;
            //decimal status = 0;
            double totaltime = Convert.ToDouble(dsLeaveout.DATA[0].TOTALTIME);
            //status = apv_status();//apv_status= 1 ,-9
            bool check = false;
            check = checkTime(EmpNo);

            try
            {
                if (dt.Rows.Count <= 0)
                {
                    if (totaltime <= min)
                    {
                        try
                        {
                            decimal SeqNo = 1;//unique
                            sql = @"select max(seq_no)+1 as seq_no from hrlogleave where emp_no ={0} and coop_id={1}";//นำค่าแมกของ seq_no บวก 1 เพื่อให้เป็นค่า seq_no ของลำดับต่อไป
                            sql = WebUtil.SQLFormat(sql, EmpNo, coop_id);//format ในรูปของ sql
                            dt = WebUtil.QuerySdt(sql);
                            if (dt.Next())
                            {
                                SeqNo = dt.GetDecimal("seq_no");
                            }
                            dsLeaveout.DATA[0].SEQ_NO = SeqNo;//กำหนดค่าให้ ds.Leave >> SEQ_NO ใหม่ ให้เป็น ค่าใหม่ที่กำหนด จาก string sql select max(seq_no)+1
                            dsLeaveout.DATA[0].LEAVE_CODE = "004";
                            //dsLeaveout.DATA[0].APV_STATUS = status;
                            //SavePass ตัวดัก Eror
                            exe.AddFormView(dsLeaveout, ExecuteType.Insert);
                            exe.Execute();
                            setClear();
                            LtServerMessage.Text = WebUtil.CompleteMessage(EmpNo + " " + fullname + " บันทึกสำเร็จ");
                            dsLeaveout.Visible = false;
                            dsDetail.Visible = false;
                        }
                        catch (Exception ex)
                        {
                            LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถบันทึกได้" + ex.Message);
                        }
                    }
                    else
                    {
                        //LtServerMessage.Text = WebUtil.WarningMessage("ลาเกิน 3.5 ชม");
                        try
                        {
                            decimal SeqNo = 1;
                            sql = @"select max(seq_no)+1 as seq_no from hrlogleave where emp_no ={0} and coop_id={1}";
                            sql = WebUtil.SQLFormat(sql, EmpNo, coop_id);
                            dt = WebUtil.QuerySdt(sql);
                            if (dt.Next())
                            {
                                SeqNo = dt.GetDecimal("seq_no");
                            }
                            dsLeaveout.DATA[0].SEQ_NO = SeqNo;
                            dsLeaveout.DATA[0].LEAVE_CODE = "001";
                            //dsLeaveout.DATA[0].APV_STATUS = status;
                            dsLeaveout.DATA[0].TOTALDAY = Convert.ToDecimal(0.5);
                            dsLeaveout.DATA[0].TOTALTIME = 0;

                            exe.AddFormView(dsLeaveout, ExecuteType.Insert);
                            exe.Execute();
                            setClear();
                            LtServerMessage.Text = WebUtil.CompleteMessage(EmpNo + " " + fullname + " บันทึกป่วยครึ่งวันสำเร็จ");
                            dsLeaveout.Visible = false;
                            dsDetail.Visible = false;
                        }
                        catch (Exception ex)
                        {
                            LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถบันทึกได้" + ex.Message);
                        }
                    }

                }
                else
                {

                    fullname = dsMain.DATA[0].FULLNAME;
                    //string seqno = Convert.ToString(dsDetail.DATA[0].SEQ_NO);
                    if (dsLeaveout.DATA[0].SEQ_NO.ToString() != "0")
                    {
                        if (totaltime <= min)
                        {
                            try
                            {

                                string sql2 = "select * from hrlogleave where coop_id = {0} and emp_no = {1}";
                                sql2 = WebUtil.SQLFormat(sql2, state.SsCoopControl, dsLeaveout.DATA[0].EMP_NO.Trim());
                                Sdt dt2 = WebUtil.QuerySdt(sql);
                                dsLeaveout.DATA[0].COOP_ID = coop_id;
                                dsLeaveout.DATA[0].LEAVE_CODE = "004";
                                exe.AddFormView(dsLeaveout, ExecuteType.Update);
                                exe.Execute();
                                exe.SQL.Clear();
                                LtServerMessage.Text = WebUtil.CompleteMessage("แก้ไขข้อมูลสำเร็จ");
                                setClear();
                                dsLeaveout.Visible = false;
                                dsDetail.Visible = false;
                            }
                            catch (Exception ex)
                            {
                                LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถบันทึกได้" + ex.Message);
                            }
                        }
                        else
                        {
                            //LtServerMessage.Text = WebUtil.WarningMessage("ลาเกิน 3.5 ชม");
                            try
                            {
                                
                                string sql2 = "select * from hrlogleave where coop_id = {0} and emp_no = {1}";
                                sql2 = WebUtil.SQLFormat(sql2, state.SsCoopControl, dsLeaveout.DATA[0].EMP_NO.Trim());
                                Sdt dt2 = WebUtil.QuerySdt(sql);
                                dsLeaveout.DATA[0].COOP_ID = coop_id;
                                dsLeaveout.DATA[0].LEAVE_CODE = "001";
                                dsLeaveout.DATA[0].TOTALDAY = Convert.ToDecimal(0.5);
                                dsLeaveout.DATA[0].TOTALTIME = 0;
                                exe.AddFormView(dsLeaveout, ExecuteType.Update);
                                exe.Execute();
                                exe.SQL.Clear();
                                LtServerMessage.Text = WebUtil.CompleteMessage("แก้ไขข้อมูลสำเร็จ");
                                setClear();
                                dsLeaveout.Visible = false;
                                dsDetail.Visible = false;
                            }
                            catch (Exception ex)
                            {
                                LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถบันทึกได้" + ex.Message);
                            }
                        }
                    }
                    else //if (dsLeave.DATA[0].SEQ_NO.ToString() == SeqNo.ToString())
                    {
                        string CoopId = state.SsCoopId;//unique
                        decimal SeqNo = 1;//unique
                        if (totaltime <= min)
                        {
                        try
                        {
                            SeqNo = 1;//unique
                            sql = @"select max(seq_no)+1 as seq_no from hrlogleave where emp_no ={0} and coop_id={1}";//นำค่าแมกของ seq_no บวก 1 เพื่อให้เป็นค่า seq_no ของลำดับต่อไป
                            sql = WebUtil.SQLFormat(sql, EmpNo, coop_id);//format ในรูปของ sql
                            dt = WebUtil.QuerySdt(sql);
                            if (dt.Next())
                            {
                                SeqNo = dt.GetDecimal("seq_no");
                            }
                            dsLeaveout.DATA[0].SEQ_NO = SeqNo;//กำหนดค่าให้ ds.Leave >> SEQ_NO ใหม่ ให้เป็น ค่าใหม่ที่กำหนด จาก string sql select max(seq_no)+1
                            dsLeaveout.DATA[0].LEAVE_CODE = "004";
                            //dsLeaveout.DATA[0].APV_STATUS = status;
                            //SavePass ตัวดัก Eror
                            exe.AddFormView(dsLeaveout, ExecuteType.Insert);
                            exe.Execute();
                            setClear();
                            LtServerMessage.Text = WebUtil.CompleteMessage(EmpNo + " " + fullname + " บันทึกสำเร็จ");
                            dsLeaveout.Visible = false;
                            dsDetail.Visible = false;
                        }
                        catch (Exception ex)
                        {
                            LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถบันทึกได้" + ex.Message);
                        }
                    }
                    else
                    {
                        //LtServerMessage.Text = WebUtil.WarningMessage("ลาเกิน 3.5 ชม");
                        try
                        {
                            SeqNo = 1;
                            sql = @"select max(seq_no)+1 as seq_no from hrlogleave where emp_no ={0} and coop_id={1}";
                            sql = WebUtil.SQLFormat(sql, EmpNo, coop_id);
                            dt = WebUtil.QuerySdt(sql);
                            if (dt.Next())
                            {
                                SeqNo = dt.GetDecimal("seq_no");
                            }
                            dsLeaveout.DATA[0].SEQ_NO = SeqNo;
                            dsLeaveout.DATA[0].LEAVE_CODE = "002";
                            //dsLeaveout.DATA[0].APV_STATUS = status;
                            dsLeaveout.DATA[0].TOTALDAY = 1;
                            dsLeaveout.DATA[0].TOTALTIME = 0;
                            exe.AddFormView(dsLeaveout, ExecuteType.Insert);
                            exe.Execute();
                            setClear();
                            LtServerMessage.Text = WebUtil.CompleteMessage(EmpNo + " " + fullname + " บันทึกลากิจสำเร็จ");
                            dsLeaveout.Visible = false;
                            dsDetail.Visible = false;
                        }
                        catch (Exception ex)
                        {
                            LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถบันทึกได้" + ex.Message);
                        }
                    }
                    }
                }
                dsDetail.RetrieveDetail(EmpNo);
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }

        }

        //public decimal apv_status()
        //{
        //    decimal apv = 0;
        //    apv = dsLeaveout.DATA[0].APV_STATUS;
        //    if (apv == 0)
        //        apv = 1;
        //    else if (apv == 1)
        //        apv = -9;
        //    return apv;
        //}

        public void setClear()
        {
            dsMain.ResetRow();
            dsLeaveout.ResetRow();
            dsDetail.ResetRow();
        }
        public void WebSheetLoadEnd()
        {

        }
    }
}