﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;

namespace Saving.CriteriaIReport.u_cri_coopid_rdepttype
{
    public partial class DsMain : DataSourceFormView
    {
        public DataSet1.DataTable1DataTable DATA { get; set; }
        public void InitDsMain(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.DataTable1;
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.InitDataSource(pw, FormView1, this.DATA, "dsMain");
            this.Register();
        }

        public void DdCoopId()
        {
            String sql = @"select coop_id, coop_name from cmcoopmaster ";
            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "coop_id", "coop_name", "coop_id");
        }
        public void DdDeptTypeS()
        {
            String sql = @"select coop_id,
                                  depttype_code,
                                  depttype_code||'-'||depttype_desc as display,
                                  depttype_desc,1 as sorter
                             from dpdepttype
                             union
                             select '','','','',0 from dual order by sorter,depttype_code";
            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "start_depttype", "display", "depttype_code");
        }
        public void DdDeptTypeE()
        {
            String sql = @"select coop_id,
                                  depttype_code,
                                  depttype_code||'-'||depttype_desc as display,
                                  depttype_desc,1 as sorter
                             from dpdepttype
                             union
                             select '','','','',0 from dual order by sorter,depttype_code";
            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "end_depttype", "display", "depttype_code");
        }
    }
}