using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;

namespace Saving.Applications.assist.ws_as_approve_rfsc_ctrl
{
    public partial class DsList : DataSourceRepeater
    {
        public DataSet1.DT_LISTDataTable DATA { get; set; }
        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        List<string> ListChecked = new List<string>();

        private int _pageSize = 20;
        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        public void InitDsList(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.DT_LIST;
            this.EventItemChanged = "OnDsDsListItemChanged";
            this.EventClicked = "OnDsListClicked";
            this.InitDataSource(pw, Repeater1, this.DATA, "dsList");

            this.Register();
        }

        public Int64 RetrieveListPage(string sl_select, string sqlsearch, string sqlorder, int index)
        {
            if (index == 0)
            {
                CurrentPage = 0;
            }

            ViewState["sl_select"] = sl_select;
            ViewState["sqlsearch"] = sqlsearch;
            ViewState["sqlorder"] = sqlorder;
            Int64 countrow = 0;
            String sqlList = @"select ROW_NUMBER() OVER( " + sqlorder + " ) AS seq_no, " + sl_select + "  from mbmembmaster mb " +
                            " join assreqmaster req on req.member_no = mb.member_no " +
                            " join assucfassisttype ast on req.assisttype_code = ast.assisttype_code " +
                            " join assucfassisttypepay uap on req.assisttype_code = uap.assisttype_code and req.assistpay_code = uap.assistpay_code " +
                            " left join assucfedulevel lv on req.edu_levelcode = lv.edulevel_code and req.assist_year = lv.assist_year " +
                            " where req.req_status = 8 " +
                            " and req.coop_id = {0} "
                            + sqlsearch + sqlorder;
            sqlList = WebUtil.SQLFormat(sqlList, state.SsCoopControl);
            DataTable dtMain = WebUtil.Query(sqlList);
            //this.ImportData(dtMain);
            countrow = dtMain.Rows.Count;
            //Row
            index = index * _pageSize;
            String sqlOffSet = " offset " + index + " rows fetch  next  " + _pageSize + "  rows only ";
            sqlOffSet = sqlList + " " + sqlOffSet;
            //sqlOffSet = WebUtil.SQLFormat(sqlOffSet, "%" + member_no + "%", "%" + fullname + "%" + fullmembgroup +"%");
            DataTable dtOffSet = WebUtil.Query(sqlOffSet);
            if (Session["SSAppove"] != null)
            {
                var obj = (List<string>)Session["SSAppove"];
                for (int i = 0; i < obj.Count; i++)
                {
                    string val = obj[i].ToString();
                    if (!string.IsNullOrEmpty(val))
                    {
                        DataRow dr = dtOffSet.Select("assist_docno='" + val.Trim().ToString() + "'").FirstOrDefault();
                        if (dr != null)
                        {
                            dr["choose_flag"] = "1";
                            dr["req_status"] = 1;
                        }
                    }
                }
            }
            this.ImportData(dtOffSet);
            BindDataIntoRepeater(dtMain);
            Int32 s_req = 0;
            decimal s_balance = 0;
            for (int i = 0; i < dtMain.Rows.Count; i++)
            {
                s_req = dtMain.Rows.Count;
                s_balance += dtMain.Rows[i].Field<decimal>("assistnet_amt");
            }
            sum_req.InnerText = s_req.ToString("#,##0");
            sum_balance.InnerText = s_balance.ToString("N");
            return countrow;
        }

        private void BindDataIntoRepeater(DataTable dtMain)
        {
            _pgsource.DataSource = dtMain.DefaultView;
            _pgsource.AllowPaging = true;
            // Number of items to be displayed in the Repeater
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;
            // Keep the Total pages in View State
            ViewState["TotalPages"] = _pgsource.PageCount;
            // Example: "Page 1 of 10"
            lblpage.Text = "หน้าที่ " + (CurrentPage + 1).ToString("#,##0") + " จาก " + _pgsource.PageCount.ToString("#,##0");
            // Enable First, Last, Previous, Next buttons
            lbPrevious.Enabled = !_pgsource.IsFirstPage;
            lbNext.Enabled = !_pgsource.IsLastPage;
            lbFirst.Enabled = !_pgsource.IsFirstPage;
            lbLast.Enabled = !_pgsource.IsLastPage;

            // Bind data into repeater
            Repeater1.DataSource = _pgsource;
            Repeater1.DataBind();

            HandlePaging();
        }

        private void HandlePaging()
        {
            var dt = new DataTable();
            dt.Columns.Add("PageIndex"); //Start from 0
            dt.Columns.Add("PageText"); //Start from 1

            _firstIndex = CurrentPage - 5;
            if (CurrentPage > 5)
                _lastIndex = CurrentPage + 5;
            else
                _lastIndex = 10;

            // Check last page is greater than total page then reduced it 
            // to total no. of page is last index
            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 10;
            }

            if (_firstIndex < 0)
                _firstIndex = 0;

            // Now creating page number based on above first and last page index
            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            rptPaging.DataSource = dt;
            rptPaging.DataBind();
        }

        protected void lbFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            string sl_select = (string)ViewState["sl_select"];
            string sqlsearch = (string)ViewState["sqlsearch"];
            string sqlorder = (string)ViewState["sqlorder"];


            RetrieveListPage(sl_select,sqlsearch,sqlorder, CurrentPage);
        }
        protected void lbLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            string sl_select = (string)ViewState["sl_select"];
            string sqlsearch = (string)ViewState["sqlsearch"];
            string sqlorder = (string)ViewState["sqlorder"];

            RetrieveListPage(sl_select, sqlsearch, sqlorder, CurrentPage);
        }
        protected void lbPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            string sl_select = (string)ViewState["sl_select"];
            string sqlsearch = (string)ViewState["sqlsearch"];
            string sqlorder = (string)ViewState["sqlorder"];

            RetrieveListPage(sl_select, sqlsearch, sqlorder, CurrentPage);
        }
        protected void lbNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            string sl_select = (string)ViewState["sl_select"];
            string sqlsearch = (string)ViewState["sqlsearch"];
            string sqlorder = (string)ViewState["sqlorder"];

            RetrieveListPage(sl_select, sqlsearch, sqlorder, CurrentPage);
        }

        protected void rptPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (!e.CommandName.Equals("newPage")) return;
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            string sl_select = (string)ViewState["sl_select"];
            string sqlsearch = (string)ViewState["sqlsearch"];
            string sqlorder = (string)ViewState["sqlorder"];

            RetrieveListPage(sl_select, sqlsearch, sqlorder, CurrentPage);
        }

        protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
            if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
            lnkPage.Enabled = false;
            lnkPage.BackColor = System.Drawing.Color.FromName("#EEEEEE");
        }

        public DataTable RetrieveList(string sl_select, string sqlsearch)
        {
            ViewState["sl_select"] = sl_select;
            ViewState["sqlsearch"] = sqlsearch;
            String sqlList = @"select ROW_NUMBER() OVER( order by req.assisttype_code ) AS seq_no, " + sl_select + "  from mbmembmaster mb " +
                            " join assreqmaster req on req.member_no = mb.member_no " +
                            " join assucfassisttype ast on req.assisttype_code = ast.assisttype_code " +
                            " join assucfassisttypepay uap on req.assisttype_code = uap.assisttype_code and req.assistpay_code = uap.assistpay_code " +
                            " left join assucfedulevel lv on req.edu_levelcode = lv.edulevel_code and req.assist_year = lv.assist_year " +
                            " where req.req_status = 8 " +
                            " and req.coop_id = {0} "
                            + sqlsearch + " order by req.assisttype_code ";
            sqlList = WebUtil.SQLFormat(sqlList,state.SsCoopId);

            return WebUtil.Query(sqlList);
        }

        public DataTable RetrieveToSave(string sl_select, string sqlsearch, string listStr)
        {
            ViewState["sl_select"] = sl_select;
            ViewState["sqlsearch"] = sqlsearch;
            String sqlList = @"select ROW_NUMBER() OVER( order by req.assisttype_code ) AS seq_no, " + sl_select + "  from mbmembmaster mb " +
                           " join assreqmaster req on req.member_no = mb.member_no " +
                           " join assucfassisttype ast on req.assisttype_code = ast.assisttype_code " +
                           " join assucfassisttypepay uap on req.assisttype_code = uap.assisttype_code and req.assistpay_code = uap.assistpay_code " +
                           " left join assucfedulevel lv on req.edu_levelcode = lv.edulevel_code and req.assist_year = lv.assist_year " +
                           " where req.req_status = 8 " +
                           " and req.coop_id = {0} "
                           + sqlsearch + " and req.assist_docno in (" + listStr + ")  order by req.assisttype_code ";
            sqlList = WebUtil.SQLFormat(sqlList, state.SsCoopId);


            return WebUtil.Query(sqlList);
        }


        
    }
}