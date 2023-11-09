using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;

namespace Saving.Applications.assist.ws_as_assstatement_ctrl
{
    public partial class DsMain : DataSourceFormView
    {
        public DataSet1.DsMainDataTable DATA { get; set; }
        public void InitDsMain(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.DsMain;
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.InitDataSource(pw, FormView1, this.DATA, "dsMain");
            this.Button.Add("b_search");
            this.Register();
        }

        public void RetrieveMain(String as_memno)
        {
            String ls_sql = "";
            ls_sql = @" select mb.member_no,
                                 ft_getmbname( mb.coop_id, mb.member_no ) as mbname,
                                 mb.membgroup_code||' - '||mgrp.membgroup_desc as mbgroup,
                                 mb.membtype_code||' - '||mtyp.membtype_desc as mbtype
                          from mbmembmaster mb
                               join mbucfmembgroup mgrp on mb.membgroup_code = mgrp.membgroup_code
                               join mbucfmembtype mtyp on mb.membtype_code = mtyp.membtype_code
                          where mb.coop_id = {0} and mb.member_no = {1} ";

            ls_sql = WebUtil.SQLFormat(ls_sql, state.SsCoopControl, as_memno);
            DataTable dt = WebUtil.Query(ls_sql);
            this.ImportData(dt);
        }

        public void DdAssistType()
        {
            string sql = @" select 
	                        assucfassisttype.assisttype_code,   
	                        assucfassisttype.assisttype_code || ' : ' || assucfassisttype.assisttype_desc as fulltype_desc  ,
	                        1 as sorter
                        from assucfassisttype
                        where assucfassisttype.coop_id = {0}
                        union
                        select '','--กรุณาเลือก--',0 from dual order by sorter,assisttype_code";
            sql = WebUtil.SQLFormat(sql, state.SsCoopControl);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "assisttype_code", "fulltype_desc", "assisttype_code");

        }

    }
}