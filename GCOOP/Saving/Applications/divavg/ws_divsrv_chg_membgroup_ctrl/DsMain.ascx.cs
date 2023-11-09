using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;

namespace Saving.Applications.divavg.ws_divsrv_chg_membgroup_ctrl
{
    public partial class DsMain : DataSourceFormView
    {
        public DataSet1.YRBGMASTERDataTable DATA { get; set; }

        public void InitDsMain(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.YRBGMASTER;
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.InitDataSource(pw, FormView1, this.DATA, "dsMain");
            this.Button.Add("b_search");
            this.Register();
        }

        public void RetrieveMain(string member_no, string div_year)
        {
            string sql = @"
            SELECT MBMEMBMASTER.COOP_ID,
                MBMEMBMASTER.MEMBER_NO,
                MBUCFPRENAME.PRENAME_DESC || MBMEMBMASTER.MEMB_NAME || ' ' || MBMEMBMASTER.MEMB_SURNAME as cp_membname,
                MBUCFMEMBGROUP.MEMBGROUP_CODE || ' - ' || MBUCFMEMBGROUP.MEMBGROUP_DESC as cp_membgroup,
                YRBGMASTER.DIV_YEAR ,
                1 as sorter
            FROM 
	            MBMEMBMASTER,
	            MBUCFPRENAME,	
                MBUCFMEMBGROUP ,
                YRBGMASTER
            WHERE ( MBMEMBMASTER.PRENAME_CODE = MBUCFPRENAME.PRENAME_CODE )
                AND ( MBMEMBMASTER.COOP_ID = MBUCFMEMBGROUP.COOP_ID )
                
                AND ( YRBGMASTER.MEMBER_NO = MBMEMBMASTER.MEMBER_NO )
AND ( YRBGMASTER.MEMBGROUP_CODE = MBUCFMEMBGROUP.MEMBGROUP_CODE )
                AND ( YRBGMASTER.DIV_YEAR = {2} )
                AND ( MBMEMBMASTER.COOP_ID = {0} )
	            AND ( MBMEMBMASTER.MEMBER_NO = {1} )";

            sql = WebUtil.SQLFormat(sql, state.SsCoopControl, member_no, div_year);
            DataTable dt = WebUtil.Query(sql);
            this.ImportData(dt);
           

        }
        public void RetrieveMembgroup()
        {
            string sql = @"
            SELECT membgroup_code,   
               membgroup_code||' - '|| membgroup_desc as membgroup_desc,   
                1 as sorter
            FROM mbucfmembgroup 
           where length(trim(membgroup_code)) = 7
            union
            select '','',0 from dual ORDER BY sorter,membgroup_code ASC";

            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "membgroup_code", "membgroup_desc", "membgroup_code");

        }

        }
    }
