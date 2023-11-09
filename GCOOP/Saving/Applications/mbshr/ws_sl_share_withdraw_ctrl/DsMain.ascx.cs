using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;

namespace Saving.Applications.mbshr.ws_sl_share_withdraw_ctrl
{
    public partial class DsMain : DataSourceFormView
    {
        public DataSet1.SHSHAREMASTERDataTable DATA { get; set; }

        public void InitDsMain(PageWeb pw)
        {
            css1.Visible = false;
            css2.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.SHSHAREMASTER;
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.InitDataSource(pw, FormView1, this.DATA, "dsMain");

            this.Button.Add("b_withdraw");
            this.Button.Add("b_search");
            this.Button.Add("b_print");            

            this.Register();
        }
    }
}