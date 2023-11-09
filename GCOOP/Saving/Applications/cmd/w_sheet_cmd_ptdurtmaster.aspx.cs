﻿using System;
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
using System.Globalization;
using System.Data.OracleClient;
using Sybase.DataWindow;
using CoreSavingLibrary.WcfNCommon;

namespace Saving.Applications.cmd
{
    public partial class w_sheet_cmd_ptdurtmaster : PageWebSheet, WebSheet
    {
        protected String postFindShow;
        protected String jsPostOnInsert;

        private DwThDate tDwMain; 
        Sdt dt = new Sdt();

        public void InitJsPostBack()
        {
            jsPostOnInsert = WebUtil.JsPostBack(this, "jsPostOnInsert");
            postFindShow = WebUtil.JsPostBack(this, "postFindShow");
            tDwMain = new DwThDate(DwMain, this);
            tDwMain.Add("buy_date", "buy_tdate");
            tDwMain.Add("devaluestart_date", "devaluestart_tdate");
        }

        public void WebSheetLoadBegin()
        {
            this.ConnectSQLCA();
            DwMain.SetTransaction(sqlca);
            

            if (!IsPostBack)
            {
                DwMain.InsertRow(0);
                tDwMain.Eng2ThaiAllRow();
                DwMain.SetItemDateTime(1, "buy_date", state.SsWorkDate);
                DwMain.SetItemDateTime(1, "devaluestart_date", state.SsWorkDate);
            }
            else
            {
                this.RestoreContextDw(DwMain, tDwMain);
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            switch (eventArg)
            {
                case "jsPostOnInsert":
                    PostOnInsert();
                    break;
                case "postFindShow":
                    jsPostFindShow();
                    break;
            }
        }

        public void SaveWebSheet()
        {
            String durt_id = "", durt_regno = "", durt_name = "", durtgrp_code = "", brand_name = "", model_desc = "", unit_code = "", lot_id = "", dept_code = "", holder_name = "";
            Decimal devalue_percent=0,devaluelastcal_year=0,unit_price=0;
            DateTime devaluestart_date,buy_date ;
            Sdt ta;
            try
            {
                durt_id = DwMain.GetItemString(1, "durt_id");
                durt_regno = DwMain.GetItemString(1,"durt_regno").Trim();
                durt_name = DwMain.GetItemString(1,"durt_name").Trim();
                durtgrp_code = DwMain.GetItemString(1,"durtgrp_code").Trim();
                brand_name = DwMain.GetItemString(1,"brand_name").Trim();
                model_desc = DwMain.GetItemString(1,"model_desc").Trim();
                unit_code = DwMain.GetItemString(1,"unit_code").Trim();
                lot_id = DwMain.GetItemString(1,"lot_id").Trim();
                dept_code = DwMain.GetItemString(1,"dept_code").Trim();
                holder_name = DwMain.GetItemString(1,"holder_name").Trim();
                devalue_percent = DwMain.GetItemDecimal(1,"devalue_percent");
                devaluelastcal_year =DwMain.GetItemDecimal(1,"devaluelastcal_year");
                unit_price = DwMain.GetItemDecimal(1,"unit_price");
                devaluestart_date = DwMain.GetItemDateTime(1,"devaluestart_date");
                buy_date = DwMain.GetItemDateTime(1,"buy_date");

                if (durt_id == "AUTO")
                {
                    n_commonClient com = wcf.NCommon;
                    durt_id = com.of_getnewdocno(state.SsWsPass,state.SsCoopId, "CMDPRODUCT");

                    try
                    {
                        String insert = @"insert into ptdurtmaster
                                (durt_id,durt_regno, durt_name,durtgrp_code,
                                brand_name,model_desc,unit_code,
                                lot_id,dept_code,holder_name,
                                devalue_percent,devaluelastcal_year,
                                unit_price,devaluestart_date,
                                buy_date )values
                                ('" + durt_id + "','" + durt_regno + "','" + durt_name + "','" + durtgrp_code + @"',
                                '" + brand_name + "','" + model_desc + "','" + unit_code + @"',
                                '" + lot_id + "','" + dept_code + "','" + holder_name + @"',
                                 " + devalue_percent + "," + devaluelastcal_year + @",
                                " + unit_price + ",to_date('" + devaluestart_date.ToString("dd/MM/yyyy") + @"','dd/MM/yyyy'),
                                to_date('" + buy_date.ToString("dd/MM/yyyy") + @"','dd/MM/yyyy'))  ";

                        ta = WebUtil.QuerySdt(insert);
                        LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกสำเร็จ");
                    }
                    catch { }
                }
                else
                {

                    try
                    {
                        //DwMain.SetItemString(1, "durt_id",durt_id);
                        String upsql = @"update ptdurtmaster
                                set durt_id ='" + durt_id + "',durt_regno ='" + durt_regno + "', durt_name='" + durt_name + "',durtgrp_code= '" + durtgrp_code + @"',
                                brand_name='" +brand_name+"',model_desc='"+model_desc+"',unit_code="+unit_code+@",
                                lot_id ='"+lot_id+"',dept_code ='"+dept_code+"',holder_name='"+holder_name+@"',
                                devalue_percent = "+devalue_percent+",devaluelastcal_year="+devaluelastcal_year+@",
                                unit_price="+unit_price+", DEVALUESTART_DATE = to_date('" + devaluestart_date.ToString("dd/MM/yyyy") + @"','dd/MM/yyyy'),
				                buy_date = to_date('" + buy_date.ToString("dd/MM/yyyy") + @"','dd/MM/yyyy')
                                where durt_id = '"+durt_id+"'";
                        ta = WebUtil.QuerySdt(upsql);
                        LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกสำเร็จ");
                    }
                    catch (Exception ex)
                    { LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถอัพเดทข้อมูลได้ " + ex); }
                }
            }
            catch (Exception ex)
            {

                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }

        }

        public void WebSheetLoadEnd()
        {
            if (DwMain.RowCount > 1)
            {
                DwMain.DeleteRow(DwMain.RowCount);
            }
            tDwMain.Eng2ThaiAllRow();
            DwMain.SaveDataCache();
        }

        private void PostOnInsert()
        {
            DwMain.InsertRow(0);
        }

        private void jsPostFindShow()
        {
            String durt_id = "", durt_regno = "", durt_name = "", durtgrp_code = "", brand_name = "", model_desc = "", unit_code = "", lot_id = "", dept_code = "", holder_name = "";
            Decimal devalue_percent = 0, devaluelastcal_year = 0, unit_price = 0;
            DateTime devaluestart_date = new DateTime();
            DateTime buy_date = new DateTime();
            
            Sdt ta;
            Int32 row = 1;
            durt_id = DwMain.GetItemString(row, "durt_id").Trim();
            try
            {
                String se = @"select durt_id, durt_regno,durt_name ,durtgrp_code,brand_name,model_desc,unit_code,unit_price,
                          buy_date,lot_id,devalue_percent,DEVALUESTART_DATE,devaluelastcal_year,dept_code,holder_name 
                          from ptdurtmaster where  durt_id = '" + durt_id + "'";
                ta = WebUtil.QuerySdt(se);
                if (ta.Next())
                {
                    durt_regno = ta.GetString("durt_regno").Trim();
                    durt_name = ta.GetString("durt_name").Trim();
                    durtgrp_code = ta.GetString("durtgrp_code").Trim();
                    brand_name = ta.GetString("brand_name").Trim();
                    model_desc = ta.GetString("model_desc").Trim();
                    unit_code = ta.GetString("unit_code").Trim();
                    lot_id = ta.GetString("lot_id").Trim();
                    dept_code = ta.GetString("dept_code").Trim();
                    holder_name = ta.GetString("holder_name").Trim();
                    devalue_percent = ta.GetDecimal("devalue_percent");
                    devaluelastcal_year = ta.GetDecimal("devaluelastcal_year");
                    unit_price = ta.GetDecimal("unit_price");
                    devaluestart_date = ta.GetDate("devaluestart_date");
                    buy_date = ta.GetDate("buy_date");
                }
                DwMain.SetItemString(row, "durt_regno", durt_regno);
                DwMain.SetItemString(row, "durt_name", durt_name);
                DwMain.SetItemString(row, "durtgrp_code", durtgrp_code);
                DwMain.SetItemString(row, "brand_name", brand_name);
                DwMain.SetItemString(row, "model_desc", model_desc);
                DwMain.SetItemString(row, "unit_code", unit_code);
                DwMain.SetItemString(row, "lot_id", lot_id);
                DwMain.SetItemString(row, "dept_code", dept_code);
                DwMain.SetItemString(row, "holder_name", holder_name);
                DwMain.SetItemDecimal(row, "devalue_percent", devalue_percent);
                DwMain.SetItemDecimal(row, "devaluelastcal_year", devaluelastcal_year);
                DwMain.SetItemDecimal(row, "unit_price", unit_price);
                DwMain.SetItemDateTime(row, "devaluestart_date", devaluestart_date);
                DwMain.SetItemDateTime(1, "buy_date", buy_date);
            }catch{}
        }


    }
}