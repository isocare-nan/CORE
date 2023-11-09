using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLibrary;
using CoreSavingLibrary;
using System.Data;


namespace Saving.Applications.assist.ws_as_ucfagentaccount_ctrl
{
    public partial class ws_as_ucfagentaccount : PageWebSheet, WebSheet
    {
        Sdt ta = new Sdt();
        [JsPostBack]
        public String GetSearch { get; set; }
        [JsPostBack]
        public String JsPostRtbranch { get; set; }
        [JsPostBack]
        public string JsInsertRow { get; set; }

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
                //string getgroup_code = dsSearch.DATA[0].MEMBGROUP_CODE;
                string getgroup_desc = dsSearch.DATA[0].AGENT_NAME;
                string sql = @"select   ac.coop_id,
                                ac.agent_code,
                                ac.agent_name,
                                ac.bank_code,
                                ac.branch_id,
                                TO_CHAR(ac.account_no,REPLACE(REPLACE(CMUCFBANK.account_format, '-', 'g'),'@','0'),'nls_numeric_characters=.-') as account_no 
                                 ,cmucfbank.account_format as format_bank,ac.account_name
                                from ASSUCFAGENTACCOUNT  ac
                                left join cmucfbank on cmucfbank.bank_code  = ac.bank_code 
                                where  ac.agent_name like '%" + getgroup_desc +"%'  order by ac.agent_code";
                sql = WebUtil.SQLFormat(sql);
                DataTable dt = WebUtil.Query(sql);
                GridView1.DataSource = dt;
                ViewState["dt"] = dt;
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

                DataTable dt = ViewState["dt"] as DataTable;
                int s_row = dt.Rows.Count;
                string now_row = "";
                if (s_row >= 0)
                {
                    if (s_row < 10)
                    {
                        now_row = "0" + s_row;
                    }
                    else
                    {
                        s_row = s_row + 1;
                        now_row = Convert.ToString(s_row);
                    }
                    this.SetOnLoadedScript("$('#ctl00_ContentPlace_GridView1_ctl" + now_row + "_bank_code').focus()");
                    //ctl00_ContentPlace_GridView1_ctl109_bank_code
                }
            }
            else if (eventArg == JsInsertRow)
            {
                  AddRowGridView();
            }
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //string moneysheet_code = dsMain.DATA[0].moneysheet_code;
            DataTable dt = ViewState["dt"] as DataTable;
            string moneysheet_seq = dt.Rows[e.RowIndex].Field<string>("agent_code");
            int index = Convert.ToInt32(e.RowIndex);
            try
            {
                if (state.IsWritable)
                {
                    bool isSaved = true;
                    if (moneysheet_seq.Length > 0)
                    {
                        try
                        {

                            String del = @"delete from  ASSUCFAGENTACCOUNT where  agent_code = {0}";
                            del = WebUtil.SQLFormat(del, moneysheet_seq);
                            ta = WebUtil.QuerySdt(del);
                        }
                        catch (Exception ex)
                        {
                            isSaved = false;
                            LtServerMessage.Text = WebUtil.ErrorMessage(ex);
                        }
                        if (isSaved)
                        {
                            LtServerMessage.Text = WebUtil.CompleteMessage("ลบข้อมูลเสร็จเรียบร้อยแล้ว");
                            retreivedata();
                            dt.Rows.RemoveAt(index);
                            GridView1.DataSource = dt;
                            ViewState["dt"] = dt;
                            GridView1.DataBind();
                        }
                    }
                    else if (moneysheet_seq.Length <= 0)
                    {
                        //dt.Rows[index].Delete();
                        dt.Rows.RemoveAt(index);
                        GridView1.DataSource = dt;
                        ViewState["dt"] = dt;
                        GridView1.DataBind();

                    }
                }
                else
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage("คุณไม่มีสิทธิ์แก้ไขข้อมูลหน้าจอนี้");
                }
                string now_row = "";
                if (index >= 0)
                {
                    if (index < 10)
                    {
                        now_row = "0" + index;
                    }
                    else
                    {
                        index = index + 1;
                        now_row = Convert.ToString(index);
                    }
                    this.SetOnLoadedScript("$('#ctl00_ContentPlace_GridView1_ctl" + now_row + "_num').focus()");
                }
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex.Message);
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
                    TextBox agent_code = (TextBox)GridView1.Rows[i].FindControl("agent_code");
                    TextBox agent_name = (TextBox)GridView1.Rows[i].FindControl("agent_name");
                    DropDownList bank_code = (DropDownList)GridView1.Rows[i].FindControl("bank_code");
                    string bank_code1 = bank_code.SelectedItem.Value;
                    DropDownList branch_id = (DropDownList)GridView1.Rows[i].FindControl("branch_id");
                    string branch_id1 = branch_id.SelectedItem.Value;
                    TextBox account_no = (TextBox)GridView1.Rows[i].FindControl("account_no");
                    string accountno = account_no.Text;
                    accountno = accountno.Replace("-", "");
                    TextBox account_name = (TextBox)GridView1.Rows[i].FindControl("account_name");

                    string sqlSelect = "select * from ASSUCFAGENTACCOUNT where  agent_code = '"+ agent_code.Text.Trim()+"'";
                    Sdt dt = WebUtil.QuerySdt(sqlSelect);
                    Int32 row = dt.Rows.Count;
                    if(row > 0)
                    {
                        string sqlupdate  = @"update ASSUCFAGENTACCOUNT set  agent_code = {0} ,  agent_name ={1}, bank_code = {2}, branch_id ={3}, account_no={4} , 
                                           account_name = {5}  where  agent_code = {0} ";
                        sqlupdate = WebUtil.SQLFormat(sqlupdate, agent_code.Text.Trim(), agent_name.Text, bank_code1, branch_id1, accountno, account_name.Text);
                        exe.SQL.Add(sqlupdate);
                    }
                    else
                    {
                        string sqlinsert = @"insert into ASSUCFAGENTACCOUNT 
                                            (coop_id ,      agent_code ,            agent_name ,            bank_code, 
                                            branch_id,      account_no ,            account_name)
                                            values
                                            ({0},           {1},                    {2},                    {3},
                                            {4},            {5},                    {6}) ";
                        sqlinsert = WebUtil.SQLFormat(sqlinsert,state.SsCoopId, agent_code.Text.Trim(), agent_name.Text, bank_code1, 
                                            branch_id1, accountno, account_name.Text);
                        exe.SQL.Add(sqlinsert);
                    }
                       
                }
                int results = exe.Execute();
                if (results > 1)
                {
                    LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกข้อมูลสำเร็จ");
                }
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถบันทึกได้ " + ex.ToString());
            }
        }

        public void WebSheetLoadEnd()
        {

        }


        protected void AddRowGridView()
        {
            DataRow dr;
            // DataTable dt = (DataTable)Session["SessionFncial"];
            DataTable dt = ViewState["dt"] as DataTable;
            //RetrieveListDataTable(coop_id, moneysheet_code);
            dr = dt.NewRow(); // add last empty row
            dt.Rows.Add(dr);
            foreach (DataRow row in dt.Rows)
            {
                if (row["agent_code"] == DBNull.Value)
                {
                    row["coop_id"] = state.SsCoopId;
                    row["agent_code"] = "";
                    row["agent_name"] = "";
                    row["bank_code"] = "";
                    row["branch_id"] = "";
                    row["account_no"] = "";
                    row["account_name"] = "";
                }
            }
            int s_row = dt.Rows.Count;
            string now_row = "";
            if (s_row >= 0)
            {
                if (s_row < 10)
                {
                    now_row = "0" + s_row;
                }
                else
                {
                    s_row = s_row + 1;
                    now_row = Convert.ToString(s_row);
                }
                this.SetOnLoadedScript("$('#ctl00_ContentPlace_GridView1_ctl" + now_row + "_agent_code').focus()");
                //ctl00_ContentPlace_GridView1_ctl108_agent_code
            }
            GridView1.DataSource = dt; // bind new datatable to grid
            ViewState["dt"] = dt;
            GridView1.DataBind();
        }


        public void retreivedata()
        {
            string sql = @"select ac.coop_id,ac.agent_code,
                            ac.agent_name,
                            ac.bank_code,
                            ac.branch_id,
                            TO_CHAR(ac.account_no,REPLACE(REPLACE(CMUCFBANK.account_format, '-', 'g'),'@','0'),'nls_numeric_characters=.-') as account_no 
                            ,cmucfbank.account_format as format_bank,ac.account_name
                            from ASSUCFAGENTACCOUNT  ac
                            left join cmucfbank on cmucfbank.bank_code  = ac.bank_code
                            order by ac.agent_code";
            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);  
            GridView1.DataSource = dt;
            ViewState["dt"] = dt;
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

            foreach (Button button in e.Row.Cells[6].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    //TextBox num = (TextBox)e.Row.Cells[1].FindControl("num");
                    //string num1 = num.Text;
                    button.Attributes["onclick"] = "if(!confirm('ต้องการลบข้อมูลรายการ หรือไม่')){ return false; };";
                }
            }
        }


    }
}
        
