using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;

namespace Saving.Applications.ap_deposit.dlg.wd_dep_booknew_ctrl
{
    public partial class DsMain : DataSourceFormView
    {
        public DataSet1.DsMainDataTable DATA { get; set; }

        public void InitDsMain(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.DsMain;
            this.InitDataSource(pw, FormViewMain, this.DATA, "dsMain");
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.Button.Add("b_comfirm_first");
            this.Button.Add("b_comfirm_back");
            this.Button.Add("b_fee");
            this.Button.Add("b_cancle");
            this.Register();
        }      
        public void BOOKRESON()
        {
            string sql = @"SELECT DPUCFBOOKRESON.RESON_ID,   
                           DPUCFBOOKRESON.RESON_DESC   
                           FROM DPUCFBOOKRESON  
                           WHERE DPUCFBOOKRESON.N_C_RESON = 'N'";
            DataTable dt = WebUtil.Query(sql);
            dt = dt.DefaultView.ToTable();
            this.DropDownDataBind(dt, "as_bookreson", "RESON_DESC", "RESON_ID");
        }
    }
}