﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;
using DataLibrary;

namespace Saving.Applications.assist.ws_as_assdetail_ctrl
{
    public partial class DsContSTM : DataSourceRepeater
    {
        public DataSet1.ASSCONTSTATEMENTDataTable DATA { get; private set; }
        public void InitDsContSTM(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.ASSCONTSTATEMENT;
            this.EventItemChanged = "OnDsContSTMItemChanged";
            this.EventClicked = "OnDsContSTMClicked";
            this.InitDataSource(pw, Repeater1, this.DATA, "dsContSTM");
            this.Register();
        }

        public void RetrieveData(string as_asscontno)
        {
             String sql = @"select
                                astm.item_code||':'||aitm.item_desc as itemdesc,
                                aitm.sign_flag,
                                astm.*
                           from asscontstatement astm
                                join assucfassitemcode aitm on astm.item_code = aitm.item_code
                        where astm.coop_id={0} and astm.asscontract_no ={1}
                        order by astm.seq_no ";

            sql = WebUtil.SQLFormat(sql, state.SsCoopControl, as_asscontno);
            DataTable dt = WebUtil.Query(sql);
            this.ImportData(dt);
        }
    }
}