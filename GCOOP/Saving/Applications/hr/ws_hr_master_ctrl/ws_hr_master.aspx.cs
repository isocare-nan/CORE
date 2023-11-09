﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;

namespace Saving.Applications.hr.ws_hr_master_ctrl
{
    public partial class ws_hr_master : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public String PostEmpNo { get; set; }
        [JsPostBack]
        public String PostInsertRowFamily { get; set; }
        [JsPostBack]
        public String PostInsertRowEdu { get; set; }
        [JsPostBack]
        public String PostInsertRowExperience { get; set; }
        [JsPostBack]
        public String PostInsertRowTraining { get; set; }
        [JsPostBack]
        public String PostInsertRowAssist { get; set; }
        [JsPostBack]
        public String PostDeleteFamilyRow { get; set; }
        [JsPostBack]
        public String PostDeleteEduRow { get; set; }
        [JsPostBack]
        public String PostDeleteExperienceRow { get; set; }
        [JsPostBack]
        public String PostDeleteTrainingRow { get; set; }
        [JsPostBack]
        public String PostDeleteAssistRow { get; set; }
        [JsPostBack]
        public String PostAdnProvince { get; set; }
        [JsPostBack]
        public String PostAdrProvince { get; set; }
        [JsPostBack]
        public String PostAdnAmphur { get; set; }
        [JsPostBack]
        public String PostAdrAmphur { get; set; }
        [JsPostBack]
        public String PostExpBank { get; set; }
        [JsPostBack]
        public String PostInsertRowGuarantee { get; set; }
        [JsPostBack]
        public String PostDeleteGaranteeRow { get; set; }
        [JsPostBack]
        public String PostInsertRowDisoffense { get; set; }
        [JsPostBack]
        public String PostDeleteDisoffenseRow { get; set; }
        [JsPostBack]
        public String displeyAddress { get; set; }
        

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
            dsDetail.InitDsDetail(this);
            dsSalary.InitDsSalary(this);
            dsFamily.InitDsFamily(this);
            dsEdu.InitDsEdu(this);
            dsExperience.InitDsExperience(this);
            dsTraining.InitTraining(this);
            dsAssist.InitDsAssist(this);
            dsGuarantee.InitDsGuarantee(this);
            dsLeaves.InitDsLeave(this);
            dsMovework.InitDsMovework(this);
            dsDisoffense.InitDsDisoffense(this);
            dsLeaveout.InitDsLeaveout(this);
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                NewClear();
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostEmpNo)
            {
                string ls_empno = dsMain.DATA[0].EMP_NO;

                dsMain.Retrieve(ls_empno);
                dsDetail.Retrieve(ls_empno);
                dsSalary.Retrieve(ls_empno);
                dsFamily.Retrieve(ls_empno);
                dsEdu.Retrieve(ls_empno);
                dsExperience.Retrieve(ls_empno);
                dsTraining.Retrieve(ls_empno);
                dsAssist.Retrieve(ls_empno);
                dsGuarantee.RetrieveHrGuarantee(ls_empno);
                dsLeaves.RetrieveHrLeaves(ls_empno);
                dsMovework.Retrieve(ls_empno);
                dsDisoffense.Retrieve(ls_empno);
                dsLeaveout.RetrieveHrLeaveout(ls_empno);

                dsMain.DdDeptgrp();
                dsMain.DdPosition();
                dsMain.DdEmptype();
                dsMain.DdPrename();
                dsDetail.DdProvince();
                dsDetail.DdAdnAmphur(dsDetail.DATA[0].ADN_PROVINCE);
                dsDetail.DdAdrAmphur(dsDetail.DATA[0].ADR_PROVINCE);
                dsDetail.DdAdnTambol(dsDetail.DATA[0].ADN_AMPHUR);
                dsDetail.DdAdrTambol(dsDetail.DATA[0].ADR_AMPHUR);
                dsDetail.DdBloodtype();
                dsEdu.DdEducation();
                dsAssist.DdAssist();
                dsDisoffense.DdDisoffense();
            }
            else if (eventArg == PostInsertRowFamily)
            {
                dsFamily.InsertLastRow();
            }
            else if (eventArg == PostInsertRowEdu)
            {
                dsEdu.InsertLastRow();
                dsEdu.DdEducation();
            }
            else if (eventArg == PostInsertRowExperience)
            {
                dsExperience.InsertLastRow();
            }
            else if (eventArg == PostInsertRowTraining)
            {
                dsTraining.InsertLastRow();
            }
            else if (eventArg == PostInsertRowAssist)
            {
                dsAssist.InsertLastRow();
                dsAssist.DdAssist();
            }
            else if (eventArg == PostDeleteFamilyRow)
            {
                int row = dsFamily.GetRowFocus();
                dsFamily.DeleteRow(row);
            }
            else if (eventArg == PostDeleteEduRow)
            {
                int row = dsEdu.GetRowFocus();
                dsEdu.DeleteRow(row);
                dsEdu.DdEducation();
            }
            else if (eventArg == PostDeleteExperienceRow)
            {
                int row = dsExperience.GetRowFocus();
                dsExperience.DeleteRow(row);
            }
            else if (eventArg == PostDeleteTrainingRow)
            {
                int row = dsTraining.GetRowFocus();
                dsTraining.DeleteRow(row);
            }
            else if (eventArg == PostDeleteAssistRow)
            {
                int row = dsAssist.GetRowFocus();
                dsAssist.DeleteRow(row);
                dsAssist.DdAssist();
            }
            else if (eventArg == PostAdnProvince)
            {
                dsDetail.DATA[0].ADN_AMPHUR = "";
                dsDetail.DATA[0].ADN_TAMBOL = "";
                dsDetail.DATA[0].ADN_POSTCODE = "";
                dsDetail.DdAdnAmphur(dsDetail.DATA[0].ADN_PROVINCE);
            }
            else if (eventArg == PostAdrProvince)
            {
                dsDetail.DATA[0].ADR_AMPHUR = "";
                dsDetail.DATA[0].ADR_TAMBOL = "";
                dsDetail.DATA[0].ADR_POSTCODE = "";
                dsDetail.DdAdrAmphur(dsDetail.DATA[0].ADR_PROVINCE);
            }
            else if (eventArg == PostAdnAmphur)
            {
                dsDetail.DATA[0].ADN_TAMBOL = "";
                dsDetail.DdAdnTambol(dsDetail.DATA[0].ADN_AMPHUR);
                String sql = @"SELECT MBUCFDISTRICT.POSTCODE   
                    FROM MBUCFDISTRICT,  
	                    MBUCFPROVINCE         	                        
                    WHERE ( MBUCFPROVINCE.PROVINCE_CODE = MBUCFDISTRICT.PROVINCE_CODE )   
	                    and ( MBUCFDISTRICT.PROVINCE_CODE = {0} ) 
	                    and ( MBUCFDISTRICT.DISTRICT_CODE = {1} )";
                sql = WebUtil.SQLFormat(sql, dsDetail.DATA[0].ADN_PROVINCE, dsDetail.DATA[0].ADN_AMPHUR);
                Sdt dt = WebUtil.QuerySdt(sql);
                if (dt.Next())
                {
                    dsDetail.DATA[0].ADN_POSTCODE = dt.Rows[0]["postcode"].ToString();
                }
            }
            else if (eventArg == PostAdrAmphur)
            {
                dsDetail.DATA[0].ADR_TAMBOL = "";
                dsDetail.DdAdrTambol(dsDetail.DATA[0].ADR_AMPHUR);
                String sql = @"SELECT MBUCFDISTRICT.POSTCODE   
                    FROM MBUCFDISTRICT,  
	                    MBUCFPROVINCE         	                        
                    WHERE ( MBUCFPROVINCE.PROVINCE_CODE = MBUCFDISTRICT.PROVINCE_CODE )   
	                    and ( MBUCFDISTRICT.PROVINCE_CODE = {0} ) 
	                    and ( MBUCFDISTRICT.DISTRICT_CODE = {1} )";
                sql = WebUtil.SQLFormat(sql, dsDetail.DATA[0].ADR_PROVINCE, dsDetail.DATA[0].ADR_AMPHUR);
                Sdt dt = WebUtil.QuerySdt(sql);
                if (dt.Next())
                {
                    dsDetail.DATA[0].ADR_POSTCODE = dt.Rows[0]["postcode"].ToString();
                }
            }
            else if (eventArg == PostExpBank)
            {
                string salexp_bank = dsSalary.DATA[0].SALEXP_BANK;
                dsSalary.DdBranch(salexp_bank);
            }
            else if (eventArg == PostInsertRowGuarantee)
            {
                dsGuarantee.InsertLastRow();
            }
            else if (eventArg == PostDeleteGaranteeRow)
            {
                int row = dsGuarantee.GetRowFocus();
                dsGuarantee.DeleteRow(row);
            }
            else if (eventArg == PostInsertRowDisoffense)
            {
                dsDisoffense.InsertLastRow();
                dsDisoffense.DdDisoffense();
            }
            else if (eventArg == PostDeleteDisoffenseRow)
            {
                int row = dsDisoffense.GetRowFocus();
                dsDisoffense.DeleteRow(row);
                dsDisoffense.DdDisoffense();
            }
            else if (eventArg == displeyAddress)
            {
               
            string sql, address = "", addr_no = "", addr_moo = "", addr_village = ""
                , addr_road = "", addr_tambol = "", addr_province = "", addr_postcode = "", addr_mobilephone = ""
                , curraddr_no ="",curraddr_moo = "",curraddr_village = "",curraddr_road = "",curraddr_tambol = "",
                curraddr_province = "", curraddr_postcode = "", curraddress = "";
            string EmpNo = dsMain.DATA[0].EMP_NO;
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
                            ma.addr_postcode as addr_postcode,
                            
                            ma.curraddr_no as curraddr_no,
                            ma.curraddr_moo as curraddr_moo,
                            ma.curraddr_village as curraddr_village,
                            ma.curraddr_road as curraddr_road,
                            ucftam2.tambol_desc as ta2,
                            ucfpro2.province_desc as pr2,
                            ma.curraddr_postcode as curraddr_postcode
                         from
                            hremployee hr,
                            mbmembmaster ma,
                            mbucftambol ucftam,
                            mbucfprovince ucfpro,
                            mbucftambol ucftam2,
                            mbucfprovince ucfpro2
                         where
                            hr.emp_no = {0} and
                            hr.ref_membno=ma.member_no and
                            ma.tambol_code=ucftam.tambol_code and
                            ma.province_code=ucfpro.province_code and
                            ma.tambol_code=ucftam2.tambol_code and
                            ma.province_code=ucfpro2.province_code";
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

                    curraddr_no = dt.GetString("curraddr_no");
                    curraddr_moo = dt.GetString("curraddr_moo");
                    curraddr_village = dt.GetString("curraddr_village");
                    curraddr_road = dt.GetString("curraddr_road");
                    curraddr_tambol = dt.GetString("ta2");
                    curraddr_province = dt.GetString("pr2");
                    curraddr_postcode = dt.GetString("curraddr_postcode");
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

                //ที่อยู่ตามทะเบียนบ้าน
                if (curraddr_no != "")
                {
                    curraddress = "เลขที่ " + curraddr_no;
                }
                else
                {
                    curraddress += "";
                }
                if (curraddr_moo != "")
                {
                    curraddress += " หมู่ที่ " + curraddr_moo;
                }
                else
                {
                    curraddress += "";
                }
                if (curraddr_village != "")
                {
                    curraddress += " หมู่บ้าน" + curraddr_village;
                }
                else
                {
                    curraddress += "";
                }
                if (curraddr_road != "")
                {
                    curraddress += " ถ." + curraddr_road;
                }
                else
                {
                    curraddress += "";
                }
                if (curraddr_tambol != "")
                {
                    curraddress += " ตำบล" + curraddr_tambol;
                }
                else
                {
                    curraddress += "";
                }
                if (curraddr_province != "")
                {
                    curraddress += " จ." + curraddr_province;
                }
                else
                {
                    curraddress += "";
                }
                if (curraddr_postcode != "")
                {
                    curraddress += " " + curraddr_postcode;
                }
                else
                {
                    curraddress += "";
                }

                dsDetail.DATA[0].ADN_NO = address;
                dsDetail.DATA[0].ADR_NO = curraddress;
                
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.WarningMessage(ex.ToString());
            }
        
            }
        }

        

        public void NewClear()
        {
            dsMain.ResetRow();
            dsDetail.ResetRow();
            dsSalary.ResetRow();
            dsFamily.ResetRow();
            dsEdu.ResetRow();
            dsExperience.ResetRow();
            dsTraining.ResetRow();
            dsAssist.ResetRow();
            dsMovework.ResetRow();
            dsGuarantee.ResetRow();
            dsLeaves.ResetRow();
            dsDisoffense.ResetRow();

            dsMain.DdDeptgrp();
            dsMain.DdPosition();
            dsMain.DdEmptype();
            dsMain.DdPrename();
            dsDetail.DdProvince();
            dsSalary.DdBank();
            dsDetail.DdBloodtype();
        }

        public void SaveWebSheet()
        {
            ExecuteDataSource exe = new ExecuteDataSource(this);
            string coop_id = state.SsCoopControl, ls_empno = "";
            string fullname = dsMain.DATA[0].EMP_NAME + " " + dsMain.DATA[0].EMP_SURNAME;
            string last_documentno = "";
            if (dsMain.DATA[0].EMP_NO == "Auto")
            {
                string sex = dsMain.DATA[0].SEX;
                string type = dsMain.DATA[0].EMPTYPE_CODE;
                if (sex == "M")
                {
                    sex = "1";
                }
                else
                {
                    sex = "2";
                }
                if (type == "02")
                {
                    last_documentno = wcf.NCommon.of_getnewdocno(state.SsWsPass, state.SsCoopId, "HREMPLFILEMASNO") + sex;
                }
                else
                {
                    last_documentno = wcf.NCommon.of_getnewdocno(state.SsWsPass, state.SsCoopId, "HREMPLFILEMAS") + sex;
                }
                
                dsMain.DATA[0].COOP_ID = coop_id;
                dsMain.DATA[0].EMP_NO = last_documentno;

                dsDetail.DATA[0].COOP_ID = coop_id;
                dsDetail.DATA[0].EMP_NO = last_documentno;

                dsSalary.DATA[0].COOP_ID = coop_id;
                dsSalary.DATA[0].EMP_NO = last_documentno;

                for (int i = 0; i < dsFamily.RowCount; i++)
                {
                    dsFamily.DATA[i].COOP_ID = coop_id;
                    dsFamily.DATA[i].EMP_NO = last_documentno;
                    dsFamily.DATA[i].SEQ_NO = i + 1;
                }
                for (int i = 0; i < dsEdu.RowCount; i++)
                {
                    dsEdu.DATA[i].COOP_ID = coop_id;
                    dsEdu.DATA[i].EMP_NO = last_documentno;
                    dsEdu.DATA[i].SEQ_NO = i + 1;
                }
                for (int i = 0; i < dsExperience.RowCount; i++)
                {
                    dsExperience.DATA[i].COOP_ID = coop_id;
                    dsExperience.DATA[i].EMP_NO = last_documentno;
                    dsExperience.DATA[i].SEQ_NO = i + 1;
                }
                for (int i = 0; i < dsTraining.RowCount; i++)
                {
                    dsTraining.DATA[i].COOP_ID = coop_id;
                    dsTraining.DATA[i].EMP_NO = last_documentno;
                    dsTraining.DATA[i].SEQ_NO = i + 1;
                }
                for (int i = 0; i < dsAssist.RowCount; i++)
                {
                    dsAssist.DATA[i].COOP_ID = coop_id;
                    dsAssist.DATA[i].EMP_NO = last_documentno;
                    dsAssist.DATA[i].SEQ_NO = i + 1;
                }
                for (int i = 0; i < dsDisoffense.RowCount; i++)
                {
                    dsDisoffense.DATA[i].COOP_ID = coop_id;
                    dsDisoffense.DATA[i].EMP_NO = last_documentno;
                    dsDisoffense.DATA[i].SEQ_NO = i + 1;
                }
                for (int i = 0; i < dsGuarantee.RowCount; i++)
                {
                    dsGuarantee.DATA[i].COOP_ID = coop_id;
                    dsGuarantee.DATA[i].EMP_NO = last_documentno;
                    dsGuarantee.DATA[i].SEQ_NO = i + 1;
                }
                try
                {
                    exe.AddFormView(dsMain, ExecuteType.Insert);
                    exe.AddFormView(dsDetail, ExecuteType.Update);
                    exe.AddFormView(dsSalary, ExecuteType.Update);
                    exe.AddRepeater(dsFamily);
                    exe.AddRepeater(dsEdu);
                    exe.AddRepeater(dsExperience);
                    exe.AddRepeater(dsTraining);
                    exe.AddRepeater(dsAssist);
                    exe.AddRepeater(dsDisoffense);
                    exe.AddRepeater(dsGuarantee);
                    exe.Execute();

                    LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกข้อมูลเรียบร้อย" + " " + ls_empno);

                    NewClear();
                }
                catch (Exception ex)
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกไม่สำเร็จ" + ex);
                }
            }
            else
            {
                ls_empno = dsMain.DATA[0].EMP_NO;
                String sql = @"UPDATE HREMPLOYEE SET EMP_ENAME = {0}  WHERE EMP_NO = {1}";
                sql = WebUtil.SQLFormat(sql, dsDetail.DATA[0].EMP_ENAME, ls_empno);
                Sdt dt = WebUtil.QuerySdt(sql);
                exe.AddFormView(dsMain, ExecuteType.Update);
                exe.AddFormView(dsDetail, ExecuteType.Update);
                exe.AddFormView(dsSalary, ExecuteType.Update);
                try
                {
                    //dsFamily
                    for (int i = 0; i < dsFamily.RowCount; i++)
                    {
                        dsFamily.DATA[i].COOP_ID = coop_id;
                        dsFamily.DATA[i].EMP_NO = ls_empno;
                        dsFamily.DATA[i].SEQ_NO = i + 1;
                    }

                    if (dsFamily.RowCount >= 0)
                    {
                        String ls_sql = ("delete hremployeefamily where coop_id ='" + coop_id + "' and emp_no = '" + ls_empno + "'");
                        exe.SQL.Add(ls_sql);
                    }

                    for (int i = 0; i < dsFamily.RowCount; i++)
                    {
                        string sqlInsertFamily = @"insert into hremployeefamily(coop_id,
                            emp_no,   
                            seq_no,   
                            f_name,   
                            f_relation,   
                            birth_date,   
                            occupation )values({0},{1},{2},{3},{4},{5},{6})";
                        object[] argslistInsert = new object[] { coop_id,
                        dsFamily.DATA[i].EMP_NO,
                        dsFamily.DATA[i].SEQ_NO,
                        dsFamily.DATA[i].F_NAME,
                        dsFamily.DATA[i].F_RELATION,
                        dsFamily.DATA[i].BIRTH_DATE,
                        dsFamily.DATA[i].OCCUPATION };
                        sqlInsertFamily = WebUtil.SQLFormat(sqlInsertFamily, argslistInsert);
                        exe.SQL.Add(sqlInsertFamily);
                    }
                }
                catch (Exception ex) { LtServerMessage.Text = WebUtil.ErrorMessage("hremployeefamily " + ex); }
                try
                {
                    //dsEdu
                    for (int i = 0; i < dsEdu.RowCount; i++)
                    {
                        dsEdu.DATA[i].COOP_ID = coop_id;
                        dsEdu.DATA[i].EMP_NO = ls_empno;
                        dsEdu.DATA[i].SEQ_NO = i + 1;
                    }

                    if (dsEdu.RowCount >= 0)
                    {
                        String ls_sql = ("delete hremployeeedu where coop_id ='" + coop_id + "' and emp_no = '" + ls_empno + "'");
                        exe.SQL.Add(ls_sql);
                    }

                    for (int i = 0; i < dsEdu.RowCount; i++)
                    {
                        string sqlInsertEdu = @"insert into hremployeeedu(coop_id,
                            emp_no,   
                            seq_no,   
                            education_code,   
                            edu_inst,   
                            edu_degree,   
                            edu_major,   
                            edu_gpa,   
                            edu_succyear )values({0},{1},{2},{3},{4},{5},{6},{7},{8})";
                        object[] argslistInsert = new object[] { coop_id,
                        dsEdu.DATA[i].EMP_NO,
                        dsEdu.DATA[i].SEQ_NO,
                        dsEdu.DATA[i].education_code,
                        dsEdu.DATA[i].EDU_INST,
                        dsEdu.DATA[i].EDU_DEGREE,
                        dsEdu.DATA[i].EDU_MAJOR,
                        dsEdu.DATA[i].EDU_GPA,
                        dsEdu.DATA[i].EDU_SUCCYEAR};
                        sqlInsertEdu = WebUtil.SQLFormat(sqlInsertEdu, argslistInsert);
                        exe.SQL.Add(sqlInsertEdu);
                    }
                }
                catch (Exception ex) { LtServerMessage.Text = WebUtil.ErrorMessage("hremployeeedu " + ex); }
                try
                {
                    //dsTraining                    
                    for (int i = 0; i < dsTraining.RowCount; i++)
                    {
                        dsTraining.DATA[i].COOP_ID = coop_id;
                        dsTraining.DATA[i].EMP_NO = ls_empno;
                        dsTraining.DATA[i].SEQ_NO = i + 1;
                    }

                    if (dsTraining.RowCount >= 0)
                    {
                        String ls_sql = ("delete hremployeetraining where coop_id ='" + coop_id + "' and emp_no = '" + ls_empno + "'");
                        exe.SQL.Add(ls_sql);
                    }

                    for (int i = 0; i < dsTraining.RowCount; i++)
                    {
                        string sqlInsertTraining = @"insert into hremployeetraining(coop_id,
                            emp_no,   
                            seq_no,   
                            tr_date,   
                            tr_code,   
                            tr_subject,   
                            tr_cause,   
                            tr_location,   
                            tr_institution,   
                            tr_fromdate,   
                            tr_todate,   
                            tr_day,   
                            tr_expamt,   
                            tr_certdesc,   
                            remark )values({0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14})";
                        object[] argslistInsert = new object[] { coop_id,
                        dsTraining.DATA[i].EMP_NO,
                        dsTraining.DATA[i].SEQ_NO,
                        dsTraining.DATA[i].TR_DATE,
                        dsTraining.DATA[i].TR_CODE,
                        dsTraining.DATA[i].TR_SUBJECT,
                        dsTraining.DATA[i].TR_CAUSE,
                        dsTraining.DATA[i].TR_LOCATION,
                        dsTraining.DATA[i].TR_INSTITUTION,
                        dsTraining.DATA[i].TR_FROMDATE,
                        dsTraining.DATA[i].TR_TODATE,
                        dsTraining.DATA[i].TR_DAY,
                        dsTraining.DATA[i].TR_EXPAMT,
                        dsTraining.DATA[i].TR_CERTDESC,
                        dsTraining.DATA[i].REMARK };
                        sqlInsertTraining = WebUtil.SQLFormat(sqlInsertTraining, argslistInsert);
                        exe.SQL.Add(sqlInsertTraining);
                    }
                }
                catch (Exception ex) { LtServerMessage.Text = WebUtil.ErrorMessage("hremployeetraining " + ex); }
                try
                {
                    //dsAssist
                    //ls_sql = 
                    //Sta tadelassist = new Sta(state.SsConnectionString);
                    //tadelassist.Exe(ls_sql);

                    for (int i = 0; i < dsAssist.RowCount; i++)
                    {
                        dsAssist.DATA[i].COOP_ID = coop_id;
                        dsAssist.DATA[i].EMP_NO = ls_empno;
                        dsAssist.DATA[i].SEQ_NO = i + 1;
                    }

                    if (dsAssist.RowCount >= 0)
                    {
                        String ls_sql = ("delete hremployeeassist where coop_id ='" + coop_id + "' and emp_no = '" + ls_empno + "'");
                        exe.SQL.Add(ls_sql);
                    }

                    for (int i = 0; i < dsAssist.RowCount; i++)
                    {
                        string sqlInsertAssist = @"insert into hremployeeassist(coop_id,
                            emp_no,   
                            seq_no,   
                            assist_code,   
                            assist_date,   
                            assist_detail,   
                            assist_amt,   
                            assist_remark,
                            assist_learn,
                            assist_use,
                            assist_draw,
                            assist_posit )values({0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11})";
                        object[] argslistInsert = new object[] { coop_id,
                        dsAssist.DATA[i].EMP_NO,
                        dsAssist.DATA[i].SEQ_NO,
                        dsAssist.DATA[i].ASSIST_CODE,
                        dsAssist.DATA[i].ASSIST_DATE,
                        dsAssist.DATA[i].ASSIST_DETAIL,
                        dsAssist.DATA[i].ASSIST_AMT,
                        dsAssist.DATA[i].ASSIST_REMARK,
                        dsAssist.DATA[i].ASSIST_LEARN,
                        dsAssist.DATA[i].ASSIST_USE,
                        dsAssist.DATA[i].ASSIST_DRAW,
                        dsAssist.DATA[i].ASSIST_POSIT};
                        sqlInsertAssist = WebUtil.SQLFormat(sqlInsertAssist, argslistInsert);
                        exe.SQL.Add(sqlInsertAssist);
                    }
                }
                catch (Exception ex) { LtServerMessage.Text = WebUtil.ErrorMessage("hremployeeassist " + ex); }
                try
                {
                    //dsGuarantee
                    for (int i = 0; i < dsGuarantee.RowCount; i++)
                    {
                        dsGuarantee.DATA[i].COOP_ID = coop_id;
                        dsGuarantee.DATA[i].EMP_NO = ls_empno;
                        dsGuarantee.DATA[i].SEQ_NO = i + 1;
                    }

                    if (dsGuarantee.RowCount >= 0)
                    {
                        String ls_sql = ("delete hrgarantee where coop_id ='" + coop_id + "' and emp_no = '" + ls_empno + "'");
                        exe.SQL.Add(ls_sql);
                    }

                    for (int i = 0; i < dsGuarantee.RowCount; i++)
                    {
                        string sqlInsertGuarantee = @"insert into hrgarantee(coop_id,
                            emp_no,   
                            seq_no,   
                            GARAN_NAME,   
                            GARAN_BIRTH,   
                            GARAN_WORK,   
                            GARAN_TEL,   
                            GARAN_AGE )values({0},{1},{2},{3},{4},{5},{6},{7})";
                        object[] argslistInsert = new object[] { coop_id,
                        dsGuarantee.DATA[i].EMP_NO,
                        dsGuarantee.DATA[i].SEQ_NO,
                        dsGuarantee.DATA[i].GARAN_NAME,
                        dsGuarantee.DATA[i].GARAN_BIRTH,
                        dsGuarantee.DATA[i].GARAN_WORK,
                        dsGuarantee.DATA[i].GARAN_TEL,
                        dsGuarantee.DATA[i].GARAN_AGE };
                        sqlInsertGuarantee = WebUtil.SQLFormat(sqlInsertGuarantee, argslistInsert);
                        exe.SQL.Add(sqlInsertGuarantee);
                    }
                }
                catch (Exception ex) { LtServerMessage.Text = WebUtil.ErrorMessage("hrgarantee " + ex); }
                try
                {
                    //dsExperience
                    for (int i = 0; i < dsExperience.RowCount; i++)
                    {
                        dsExperience.DATA[i].COOP_ID = coop_id;
                        dsExperience.DATA[i].EMP_NO = ls_empno;
                        dsExperience.DATA[i].SEQ_NO = i + 1;
                    }

                    if (dsExperience.RowCount >= 0)
                    {
                        String ls_sql = ("delete hremployeeexperience where coop_id ='" + coop_id + "' and emp_no = '" + ls_empno + "'");
                        exe.SQL.Add(ls_sql);
                    }

                    for (int i = 0; i < dsExperience.RowCount; i++)
                    {
                        string sqlInsertExperience = @"insert into hremployeeexperience(coop_id,
                            emp_no,   
                            seq_no,   
                            corp_name,   
                            pos_name,   
                            yearstart,   
                            yearend,   
                            last_salary,   
                            job_type,   
                            job_desc,   
                            awaycause,   
                            remark )values({0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11})";
                        object[] argslistInsert = new object[] { coop_id,
                        dsExperience.DATA[i].EMP_NO,
                        dsExperience.DATA[i].SEQ_NO,
                        dsExperience.DATA[i].CORP_NAME,
                        dsExperience.DATA[i].POS_NAME,
                        dsExperience.DATA[i].YEARSTART,
                        dsExperience.DATA[i].YEAREND,
                        dsExperience.DATA[i].LAST_SALARY,
                        dsExperience.DATA[i].JOB_TYPE,
                        dsExperience.DATA[i].JOB_DESC,
                        dsExperience.DATA[i].AWAYCAUSE,
                        dsExperience.DATA[i].REMARK };
                        sqlInsertExperience = WebUtil.SQLFormat(sqlInsertExperience, argslistInsert);
                        exe.SQL.Add(sqlInsertExperience);
                    }
                }
                catch (Exception ex) { LtServerMessage.Text = WebUtil.ErrorMessage("hremployeeexperience " + ex); }
                try
                {
                    //dsDisoffense
                    for (int i = 0; i < dsDisoffense.RowCount; i++)
                    {
                        dsDisoffense.DATA[i].COOP_ID = coop_id;
                        dsDisoffense.DATA[i].EMP_NO = ls_empno;
                        dsDisoffense.DATA[i].SEQ_NO = i + 1;
                    }

                    if (dsDisoffense.RowCount >= 0)
                    {
                        String ls_sql = ("delete hremployeedisof where coop_id ='" + coop_id + "' and emp_no = '" + ls_empno + "'");
                        exe.SQL.Add(ls_sql);
                    }

                    for (int i = 0; i < dsDisoffense.RowCount; i++)
                    {
                        string sqlInsertDisoffense = @"insert into hremployeedisof(coop_id,
                            emp_no,   
                            seq_no,
                            disof_docno,
                            disof_date,
                            disof_inflic,
                            disof_remark,
                            disoffense_code)values({0},{1},{2},{3},{4},{5},{6},{7})";
                        object[] argslistInsert = new object[] { coop_id,
                        dsDisoffense.DATA[i].EMP_NO,
                        dsDisoffense.DATA[i].SEQ_NO,
                        dsDisoffense.DATA[i].DISOF_DOCNO,
                        dsDisoffense.DATA[i].DISOF_DATE,
                        dsDisoffense.DATA[i].DISOF_INFLIC,
                        dsDisoffense.DATA[i].DISOF_REMARK,
                        dsDisoffense.DATA[i].DISOFFENSE_CODE};
                        sqlInsertDisoffense = WebUtil.SQLFormat(sqlInsertDisoffense, argslistInsert);
                        exe.SQL.Add(sqlInsertDisoffense);
                    }
                }
                catch (Exception ex) { LtServerMessage.Text = WebUtil.ErrorMessage("hremployeedisof " + ex); }
                try
                {
                    exe.Execute();
                    LtServerMessage.Text = WebUtil.CompleteMessage("แก้ไขข้อมูลเรียบร้อย" + " " + ls_empno );
                }
                catch (Exception ex) { LtServerMessage.Text = WebUtil.ErrorMessage(ex); }

                NewClear();
            }
        }

        public void WebSheetLoadEnd()
        {

        }
    }
}