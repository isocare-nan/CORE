using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;
using System.Data;

namespace Saving.Applications.assist.dlg.wd_as_search_deptaccount_ctrl
{
    public partial class wd_as_search_deptaccount : PageWebDialog, WebDialog
    {
        [JsPostBack]
        public string PostSearch { get; set; }

        public void InitJsPostBack()
        {
            //dsList.InitDsList(this);
            dsMain.InitDsMain(this);
        }

        public void WebDialogLoadBegin()
        {
            if (!IsPostBack)
            {
                //String ls_memberno = Request["memno"];
                //dsList.RetrieveDeptno(ls_memberno);
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == "PostSearch")
            {
                ofPostSearch();
            }
        }

        public void ofPostSearch()
        {
            string sqltext = "";
            if (dsMain.DATA[0].member_no.Trim() != "")
            {
                sqltext += " and dpdeptmaster.member_no = '" + WebUtil.MemberNoFormat(dsMain.DATA[0].member_no) + "'";
                dsMain.DATA[0].member_no = WebUtil.MemberNoFormat(dsMain.DATA[0].member_no);
            }
            if (dsMain.DATA[0].deptaccount_name.Trim() != "")
            {
                sqltext += " and dpdeptmaster.deptaccount_name like '%" + dsMain.DATA[0].deptaccount_name + "%'";
            }
            if (dsMain.DATA[0].deptaccount_no.Trim() != "")
            {
                sqltext += " and dpdeptmaster.deptaccount_no = '" + dsMain.DATA[0].deptaccount_no + "'";
            }
            RetrieveListPage(sqltext);
        }

        public void RetrieveListPage(string sqltext)
        {
            string sql = @"        select dpdepttype.depttype_code,dpdepttype.depttype_code ||' - '||dpdepttype.depttype_desc as display,
                                dpdeptmaster.deptaccount_no,
                                dpdeptmaster.deptaccount_name 
                                from dpdeptmaster  left join dpdepttype   on dpdeptmaster.depttype_code = dpdepttype.depttype_code
                                where dpdeptmaster.coop_id={0}  and dpdeptmaster.deptclose_status=0 " + sqltext + " order by dpdeptmaster.deptaccount_no";
            

            sql = WebUtil.SQLFormat(sql, state.SsCoopControl);
            DataTable dt = WebUtil.Query(sql);
            GridView1.DataSource = dt;
            ViewState["assdeptaccount"] = dt;
            GridView1.DataBind();
            Hd_row.Value = Convert.ToString(dt.Rows.Count);
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e) { }

        protected void GridView1_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.ofPostSearch();
        }

        public void WebDialogLoadEnd()
        {
        }
    }
}