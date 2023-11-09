using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;

namespace Saving.Applications.divavg.ws_divsrv_chg_membgroup_ctrl
{
    public partial class ws_divsrv_chg_membgroup : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public String PostMemberNo { get; set; }
        
        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
        }

        public void WebSheetLoadBegin()
        {
                JsGetYear();
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostMemberNo)
            {
                string member_no = WebUtil.MemberNoFormat(dsMain.DATA[0].MEMBER_NO);
                string divyear = dsMain.DATA[0].DIV_YEAR;
                string membgroup = "";
                dsMain.RetrieveMain(member_no,divyear);
                string sql_membgroup = "select * from yrbgmaster where member_no = '" + member_no + "' and div_year = '" + divyear + "'";
                Sdt dt = WebUtil.QuerySdt(sql_membgroup);
                if (dt.Next()) 
                {
                     membgroup = dt.GetString("membgroup_code");
                }
                dsMain.RetrieveMembgroup();
            }
         
            
        }

        private void JsGetYear()
        {
            int account_year = 0;
            try
            {
                String sql = @"select max(current_year) from yrcfconstant";
                Sdt dt = WebUtil.QuerySdt(sql); ;
                if (dt.Next())
                {
                    account_year = int.Parse(dt.GetString("max(current_year)"));
                    dsMain.DATA[0].DIV_YEAR = Convert.ToString(account_year);
                }
                else
                {
                    sqlca.Rollback();
                }
            }
            catch (Exception ex)
            {
                account_year = DateTime.Now.Year;
                account_year = account_year + 543;
                dsMain.DATA[0].DIV_YEAR = Convert.ToString(account_year);
            }
        }

        public void SaveWebSheet()
        {

            try
            {
                string member_no = dsMain.DATA[0].MEMBER_NO;
                string divyear = dsMain.DATA[0].DIV_YEAR;
                string membgroup = dsMain.DATA[0].MEMBGROUP_CODE;
                string sql_update = @"update yrbgmaster set membgroup_code = '" + membgroup + "' where member_no = '" + member_no + "' and div_year = '" + divyear + "'";
                WebUtil.Query(sql_update);
                LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกสำเร็จ");
                dsMain.ResetRow();
                JsGetYear();
//                ExecuteDataSource exe = new ExecuteDataSource(this);
//                exe.AddFormView(dsMain, ExecuteType.Insert);
//                exe.AddFormView(dsDetail, ExecuteType.Insert);
//                exe.Execute();
//                exe.SQL.Clear();
//                String sqlupdate_sequest = (@"update yrbgmaster
//                    set sequest_flag = {0}
//                    where coop_id = {1}
//                    and member_no = {2}
//                    and div_year = {3}");
//                sqlupdate_sequest = WebUtil.SQLFormat(sqlupdate_sequest, dsMain.DATA[0].REQCHG_STATUS, state.SsCoopControl, dsMain.DATA[0].MEMBER_NO, dsMain.DATA[0].DIV_YEAR);
//                Sta taupdate = new Sta(state.SsConnectionString);
//                int result = taupdate.Exe(sqlupdate_sequest);

//                sqlupdate_sequest = (@"update yrdivmethpay
//                    set sequest_flag = {0}
//                    where coop_id = {1}
//                    and member_no = {2}
//                    and div_year = {3}");
//                sqlupdate_sequest = WebUtil.SQLFormat(sqlupdate_sequest, dsMain.DATA[0].REQCHG_STATUS, state.SsCoopControl, dsMain.DATA[0].MEMBER_NO, dsMain.DATA[0].DIV_YEAR);
//                result = taupdate.Exe(sqlupdate_sequest);

//                LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกสำเร็จ");
//                dsMain.ResetRow();
//                dsDetail.ResetRow();
//                JsGetYear();
            }
            catch (Exception ex) { LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกไม่สำเร็จ " + ex); }
        }

        public void WebSheetLoadEnd()
        {
        }
    }
}