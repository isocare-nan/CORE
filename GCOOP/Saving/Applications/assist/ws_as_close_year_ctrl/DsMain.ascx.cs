using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Saving.Applications.assist.ws_as_close_year_ctrl
{
    public partial class DsMain : DataSourceFormView
    {
        

        public DataSet1.ASSUCFYEARDataTable DATA { get; set; }

        public void InitDsMain(PageWeb pw)
        {
            css1.Visible = false;


            DataSet1 ds = new DataSet1();
            this.DATA = ds.ASSUCFYEAR;
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.InitDataSource(pw, FormView1, this.DATA, "dsMain");
           // this.Button.Add("Button3");
            this.Register();
        }

        public void retrieve(string coop_id)
        {
            String sql = @" SELECT accconstant.coop_id,   
         accconstant.present_account_year,   
         accconstant.beginning_of_account,   
         accconstant.ending_of_account  ,
        benifit_total_account
        FROM accconstant   
        where coop_id = {0}";
            sql = WebUtil.SQLFormat(sql, state.SsCoopId);
            DataTable dt = WebUtil.Query(sql);
            this.ImportData(dt);


        }


    }
}