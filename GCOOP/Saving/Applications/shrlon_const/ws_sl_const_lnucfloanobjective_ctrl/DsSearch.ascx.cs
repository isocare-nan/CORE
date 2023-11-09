using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;

namespace Saving.Applications.shrlon_const.ws_sl_const_lnucfloanobjective_ctrl
{

    public partial class DsSearch : DataSourceFormView
    {
        public DataSet1.LNUCFLOANOBJECTIVEDataTable DATA { get; set; }

        public void InitDsSearch(PageWeb pw)
        {
            css1.Visible = false;
            css2.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.LNUCFLOANOBJECTIVE;
            this.EventItemChanged = "OnDsSearchItemChanged";
            this.EventClicked = "OnDsSearchClicked";
            this.InitDataSource(pw, FormView1, this.DATA, "dsSearch");

            this.Register();
        }

        public void DdGroupControl()
        {
            string sql = @"select loantype_code,   
                loantype_code || ' - ' || loantype_desc as display , 1 as sorter
            from lnloantype
            union 
            select '%%','00 - ทั้งหมด',0 from dual order by sorter,loantype_code asc";
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "loantype_code", "display", "loantype_code");
        }
    }
}