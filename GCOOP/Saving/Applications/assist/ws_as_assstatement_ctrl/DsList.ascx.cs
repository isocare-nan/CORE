using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;

namespace Saving.Applications.assist.ws_as_assstatement_ctrl
{
    public partial class DsList : DataSourceRepeater
    {
        public DataSet1.ASSCONTSTATEMENTDataTable DATA { get; private set; }
        public void InitDsList(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.ASSCONTSTATEMENT;
            this.EventItemChanged = "OnDsListItemChanged";
            this.EventClicked = "OnDsListClicked";
            this.InitDataSource(pw, Repeater1, this.DATA, "dsList");
            this.Register();
        }

        public void RetrieveData(string member_no, string assisttype_code)
        {
            string sql = @"select	 distinct
                                astm.item_code||':'||aitm.item_desc as itemdesc,
                                aitm.sign_flag,
                                astm.*,mt.share_value
                                from	asscontmaster ass
                                join asscontstatement astm on ass.asscontract_no = astm.asscontract_no
                                join assucfassitemcode aitm on astm.item_code = aitm.item_code
                                right join ASSREQMASTER mt on ass.assistreq_docno = mt.assist_docno
                                where   ass.coop_id = {0}
                                and ass.member_no = {1}  and ass.assisttype_code ={2} order by astm.operate_date,astm.seq_no";
            sql = WebUtil.SQLFormat(sql, state.SsCoopControl, member_no, assisttype_code);
            DataTable dt = WebUtil.Query(sql);
            this.ImportData(dt);
        }
    }
}