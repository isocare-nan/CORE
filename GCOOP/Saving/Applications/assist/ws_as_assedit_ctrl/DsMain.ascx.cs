using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataLibrary;

namespace Saving.Applications.assist.ws_as_assedit_ctrl
{
    public partial class DsMain : DataSourceFormView
    {
        public DataSet1.DTMainDataTable DATA { get; set; }
        public void InitDsMain(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.DTMain;
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.InitDataSource(pw, FormView2, this.DATA, "dsMain");
            this.Button.Add("b_search");
            this.Register();
        }

        public void InitMembData(string as_memno)
        {
            string ls_sql;
            ls_sql = @" select  mb.member_no,
		                        mpre.prename_desc ||mb.memb_name || '  ' || mb.memb_surname as mbname,
		                        trim( mb.membgroup_code )||' - '||mgrp.membgroup_desc as mbgroup,
		                        trim( mb.membtype_code )|| ':' || mt.membtype_desc  as mbtype
                        from	mbmembmaster mb
		                        join mbucfprename mpre on mb.prename_code = mpre.prename_code
		                        join mbucfmembgroup mgrp on mb.membgroup_code = mgrp.membgroup_code
		                        join mbucfmembtype mt on mb.membtype_code = mt.membtype_code
                        where mb.coop_id = {0} 
                        and mb.member_no = {1} ";

            ls_sql = WebUtil.SQLFormat(ls_sql, state.SsCoopControl, as_memno);
            DataTable dt = WebUtil.Query(ls_sql);
            this.ImportData(dt);
        }

        public void DdAssContNo(string as_memno)
        {
            string sql = @"select   
		                      ass.asscontract_no,
                               ass.asscontract_no || ' : ' || ast.assisttype_desc as assdisplay
                        from	asscontmaster ass
		                        join assucfassisttype ast on ass.assisttype_code = ast.assisttype_code
                        where ass.coop_id = {0} and ass.member_no = {1} and ass.withdrawable_amt > 0";
               

            sql = WebUtil.SQLFormat(sql, state.SsCoopId, as_memno);
            DataTable dt = WebUtil.Query(sql);
            //tomy ต่อ string โดยไมใช้ sql
            dt.Columns.Add("assdisplay1", typeof(System.String));
            dt.Columns.Add("sort", typeof(System.Int32));
            foreach (DataRow row in dt.Rows)
            {
                string ls_moneysheetname = row["assdisplay1"].ToString();
                row["assdisplay1"] = ls_moneysheetname;
                row["sort"] = 1;
            }
            dt.Rows.Add(new Object[] { "", "--กรุณาเลือก--", "", 0 });
            dt.DefaultView.Sort = "sort asc, asscontract_no asc";
            dt = dt.DefaultView.ToTable();

            this.DropDownDataBind(dt, "asscontract_no", "assdisplay", "asscontract_no");

        }
    }
}