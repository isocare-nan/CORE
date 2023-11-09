using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Saving.Applications.assist.dlg.wd_as_search_family_ctrl
{
    public partial class DsDetail : DataSourceRepeater
    {
        public DataSet1.MBMEMBFAMILYDataTable DATA { get; set; }

        public void InitDsDetail(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.MBMEMBFAMILY;
            this.InitDataSource(pw, Repeater1, this.DATA, "dsDetail");
            this.EventClicked = "OnDsDetailClicked";
            this.EventItemChanged = "OnDsDetailItemChanged";
            this.Register();

        }
        public void RetrieveDetail(string member_no)
        {
            string sql = @"select mbmembfamily.*,mbucfprename.prename_desc , mbucffamily.relation_desc  from mbmembfamily 
                        left join mbucfprename on mbmembfamily.prename_code = mbucfprename.prename_code
                        left join mbucffamily on mbmembfamily.relation_code = mbucffamily.relation_code
                        where mbmembfamily.coop_id = {0}
                        and mbmembfamily.member_no = {1}
                        order by mbmembfamily.seq_no";
            sql = WebUtil.SQLFormat(sql,state.SsCoopId, member_no);
            DataTable dt = WebUtil.Query(sql);
            foreach (DataRow row in dt.Rows)
            {
                string ls_display = row["prename_desc"].ToString().Trim()+row["family_name"].ToString().Trim() + "  " + row["family_surname"].ToString().Trim();
                row["family_name"] = ls_display;
            }
            this.ImportData(dt);

        }

    }
}