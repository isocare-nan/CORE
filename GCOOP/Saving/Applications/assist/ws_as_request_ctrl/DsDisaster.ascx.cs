﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;

namespace Saving.Applications.assist.ws_as_request_ctrl
{
    public partial class DsDisaster : DataSourceFormView
    {
        public DataSet1.ASSREQMASTERDataTable DATA { get; set; }
        public void InitDsDisaster(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.ASSREQMASTER;
            this.EventItemChanged = "OnDsDisasterItemChanged";
            this.EventClicked = "OnDsDisasterClicked";
            this.InitDataSource(pw, FormView1, this.DATA, "dsDisaster");
            this.Button.Add("b_linkaddress");
            this.Register();
        }

        public void Retrieve(String as_reqno, ref String ls_olddisaster, ref String ls_oldhouse_status)
        {
            string sql = @"select * from assreqmaster where coop_id={0} and assist_docno = {1}";
            sql = WebUtil.SQLFormat(sql, state.SsCoopControl, as_reqno);
            DataTable dt = WebUtil.Query(sql);
            ls_olddisaster = dt.Rows[0].Field<string>("dis_distype");
            ls_oldhouse_status = dt.Rows[0].Field<string>("dis_house_status");
            this.ImportData(dt);
        }

        public void DdAsspaytype(String assisttype_code, ref String ls_minpaytype)
        {
            string sql = @"select
		                        assistpay_code,
		                        assistpay_desc
	                        from assucfassisttypepay
	                        where coop_id = {0} and assisttype_code = {1}
	                        order by assistpay_code";
            sql = WebUtil.SQLFormat(sql, state.SsCoopControl, assisttype_code);
            DataTable dt = WebUtil.Query(sql);
            ls_minpaytype = dt.Rows[0].Field<string>("assistpay_code");
            this.DropDownDataBind(dt, "assistpay_code", "assistpay_desc", "assistpay_code");
        }

        public void Disaster(ref String ls_disaster)
        {
            string sql = @"select disaster_code,disaster_desc from assucfdisaster order by disaster_code";
            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);
            ls_disaster = dt.Rows[0].Field<string>("disaster_code");
            this.DropDownDataBind(dt, "disaster_code", "disaster_desc", "disaster_code");
        }
    }
}
