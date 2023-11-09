using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLibrary;
using CoreSavingLibrary;
using System.Data;


namespace Saving.Applications.assist.ws_as_ucfbank_membgroup_ctrl
{
    public partial class ws_as_ucfbank_membgroup : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public String GetSearch { get; set; }
        [JsPostBack]
        public String JsPostRtbranch { get; set; }

        public void InitJsPostBack()
        {
            dsSearch.InitDsSearch(this);
            
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                retreivedata();

            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == GetSearch)
            {
                string getgroup_code = dsSearch.DATA[0].MEMBGROUP_CODE;
                string getgroup_desc = dsSearch.DATA[0].MEMBGROUP_DESC;
                string sql = @"select mbg.membgroup_code,mbg.membgroup_desc,mbg.bank_code,mbg.branch_id,
                                TO_CHAR(mbg.account_no,REPLACE(REPLACE(CMUCFBANK.account_format, '-', 'g'),'@','0'),'nls_numeric_characters=.-') as account_no 
                                ,mbg.used_flag ,cmucfbank.account_format as format_bank
                                from mbucfmembgroup  mbg
                                left join cmucfbank on cmucfbank.bank_code  = mbg.bank_code 
                                where mbg.used_flag = 1  and mbg.membgroup_code like '%" + getgroup_code +"%' and mbg.membgroup_desc like '%" +getgroup_desc +"%' order by mbg.membgroup_code";
                sql = WebUtil.SQLFormat(sql);
                DataTable dt = WebUtil.Query(sql);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else if (eventArg== JsPostRtbranch)
            {
                int i = Convert.ToInt16(HdRow.Value) - 1;
                DropDownList bank_code = (DropDownList)GridView1.Rows[i].FindControl("bank_code");
                string bank_code1 = bank_code.SelectedItem.Value;
                PostSetformatbank(bank_code1);
                ((HiddenField)GridView1.Rows[i].FindControl("format_bank")).Value = Hd_bankcode.Value;
                string dd = ((HiddenField)GridView1.Rows[i].FindControl("format_bank")).Value;
                //HdRow.Value = Convert.ToString(i);
                //((TextBox)GridView1.Rows[i].FindControl("account_no")).Text = "";
                ClientScript.RegisterStartupScript(GetType(), "format_bank_mask", "onload_format_bank_mask();", true);
            }
        }

        protected void chg_bankcode(object sender, EventArgs e)
        {
            int i = Convert.ToInt16(HdRow.Value) - 1;
            DropDownList bank_code = (DropDownList)GridView1.Rows[i].FindControl("bank_code");
            string bank_code1 = bank_code.SelectedItem.Value;
            string sql = @" select m.* from( select  branch_id,branch_id || ' - '||branch_name as branch_name , 1 as sorter
                                from cmucfbankbranch
                                where bank_code = '" + bank_code1 + "' "
                                + " union "
                                + " select   '' as branch_id, '--กรุณาเลือก--' as branch_name,0 as sorter from dual) m order by m.sorter,m.branch_id";
            DataTable dt = WebUtil.Query(sql);
            DropDownList ddl_branchid = (DropDownList)GridView1.Rows[i].FindControl("branch_id");
            ddl_branchid.DataSource = dt;
            ddl_branchid.DataTextField = "branch_name";
            ddl_branchid.DataValueField = "branch_id";
            ddl_branchid.DataBind();
            string branchid = "";
            ddl_branchid.SelectedIndex = ddl_branchid.Items.IndexOf(ddl_branchid.Items.FindByValue(branchid));
        }

        public void PostSetformatbank(string bank_code)
        {
            string sqlStr = "select account_format from cmucfbank where bank_code = '" + bank_code + "'";
            Sdt dt = WebUtil.QuerySdt(sqlStr);

            if (dt.Next())
            {
                Hd_bankcode.Value = dt.GetString("account_format");
            }
        }

        public void SaveWebSheet()
        {
            try
            {
                ExecuteDataSource exe = new ExecuteDataSource(this);
                for (int i = 0; i < GridView1.Rows.Count; i++) 
                {
                    
                    DropDownList bank_code = (DropDownList)GridView1.Rows[i].FindControl("bank_code");
                    string bank_code1 = bank_code.SelectedItem.Value;
                    DropDownList branch_id = (DropDownList)GridView1.Rows[i].FindControl("branch_id");
                    string branch_id1 = branch_id.SelectedItem.Value;
                    TextBox account_no = (TextBox)GridView1.Rows[i].FindControl("account_no");
                    string accountno = account_no.Text;
                    accountno = accountno.Replace("-", "");
                    TextBox membgroup_code = (TextBox)GridView1.Rows[i].FindControl("membgroup_code");
                    string sqlupdate = "update mbucfmembgroup set bank_code ={1},branch_id={2},account_no={3}  where membgroup_code = {0} ";
                    sqlupdate = WebUtil.SQLFormat(sqlupdate, membgroup_code.Text, bank_code1, branch_id1, accountno);
                    exe.SQL.Add(sqlupdate);
                }
                int results = exe.Execute();
                if (results > 1) 
                {
                    LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกข้อมูลสำเร็จ");
                }
            }
            catch(Exception ex) 
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถบันทึกได้ " + ex.ToString());
            }
        }

        public void WebSheetLoadEnd()
        {

        }

        public void retreivedata()
        {
            string sql = @"select mbg.membgroup_code,mbg.membgroup_desc,mbg.bank_code,mbg.branch_id,
                                TO_CHAR(mbg.account_no,REPLACE(REPLACE(CMUCFBANK.account_format, '-', 'g'),'@','0'),'nls_numeric_characters=.-') as account_no 
                                ,mbg.used_flag ,cmucfbank.account_format as format_bank
                                from mbucfmembgroup  mbg
                                left join cmucfbank on cmucfbank.bank_code  = mbg.bank_code
                                where mbg.used_flag = 1  order by mbg.membgroup_code";
            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);  
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GvKpCutorder_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string sql = @"select m.* from( select  bank_code,bank_code || ' - ' ||bank_desc as bank_desc , 1 as sorter
                                from cmucfbank
                                union 
                                select   '' as bank_code, '--กรุณาเลือก--' as bank_desc,0 as sorter from dual) m order by m.sorter,m.bank_code";
                DataTable dt = WebUtil.Query(sql);
                DropDownList ddl_bankcode = (e.Row.FindControl("bank_code") as DropDownList);
                ddl_bankcode.DataSource = dt;
                ddl_bankcode.DataTextField = "bank_desc";
                ddl_bankcode.DataValueField = "bank_code";
                ddl_bankcode.DataBind();
                string bankcode = DataBinder.Eval(e.Row.DataItem, "bank_code").ToString();
                ddl_bankcode.SelectedIndex = ddl_bankcode.Items.IndexOf(ddl_bankcode.Items.FindByValue(bankcode));


                DropDownList bank_code = (e.Row.FindControl("bank_code") as DropDownList);
                string bank_code1 = bank_code.SelectedItem.Value;
                string sql2 = @" select m.* from( select  branch_id,branch_id || ' - '||branch_name as branch_name , 1 as sorter
                                from cmucfbankbranch
                                where bank_code = '" + bank_code1 + "' "
                                    + " union "
                                    + " select   '' as branch_id, '--กรุณาเลือก--' as branch_name,0 as sorter from dual) m order by m.sorter,m.branch_id";
                DataTable dt2 = WebUtil.Query(sql2);
                DropDownList ddl_branchid = (e.Row.FindControl("branch_id") as DropDownList);
                ddl_branchid.DataSource = dt2;
                ddl_branchid.DataTextField = "branch_name";
                ddl_branchid.DataValueField = "branch_id";
                ddl_branchid.DataBind();
                string branchid = DataBinder.Eval(e.Row.DataItem, "branch_id").ToString();
                ddl_branchid.SelectedIndex = ddl_branchid.Items.IndexOf(ddl_branchid.Items.FindByValue(branchid));
            }
        }


    }
}
        
