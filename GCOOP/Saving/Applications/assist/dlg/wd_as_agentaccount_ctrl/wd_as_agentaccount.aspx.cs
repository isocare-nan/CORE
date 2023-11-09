using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;
using System.Data;

namespace Saving.Applications.assist.dlg.wd_as_agentaccount_ctrl
{
    public partial class wd_as_agentaccount : PageWebDialog, WebDialog
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
            if (dsMain.DATA[0].agent_code.Trim() != "")
            {
                sqltext += " and ac.agent_code = '" + dsMain.DATA[0].agent_code + "'";
                dsMain.DATA[0].agent_code = dsMain.DATA[0].agent_code;
            }
            if (dsMain.DATA[0].account_no.Length > 0)
            {
                sqltext += " and ac.account_no like '%" + dsMain.DATA[0].account_no.Trim() + "%'";
            }
            if (dsMain.DATA[0].agent_name.Length > 0)
            {
                sqltext += " and ac.agent_name like '%" + dsMain.DATA[0].agent_name.Trim() + "%'";
            }
            RetrieveListPage(sqltext);
        }

        public void RetrieveListPage(string sqltext)
        {
            string sql = @"        select ac.coop_id,ac.agent_code,
                                ac.agent_name,
                                ac.account_no,
                                ac.account_name,
                                cmucfbank.bank_desc,
                                cmucfbankbranch.branch_name
                                from ASSUCFAGENTACCOUNT  ac
                                join cmucfbank on  ac.bank_code = cmucfbank.bank_code
                                join cmucfbankbranch on ac.branch_id = cmucfbankbranch.branch_id 
                                and cmucfbank.bank_code = cmucfbankbranch.bank_code
                                where ac.coop_id = {0}  " + sqltext + "  order by ac.agent_code";
            

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