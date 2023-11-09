using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;

namespace Saving.Applications.assist.ws_as_cancelrequest_ctrl
{
    public partial class ws_as_cancelrequest : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public string PostSearch { get; set; }
        [JsPostBack]
        public string PostMBNo { get; set; }

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
            dsList.InitDsList(this);
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                dsMain.DDloantype();
                dsMain.DATA[0].select_check = "0";  
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostSearch)
            {
                dsList.ResetRow();
                dsMain.DATA[0].select_check = "0";         
                string sqlwhere = "";

                if (dsMain.DATA[0].member_no != "")
                {
                    sqlwhere += " and ar.member_no like '%" + dsMain.DATA[0].member_no + "%' ";
                }
                else { sqlwhere += ""; }

                if (dsMain.DATA[0].assisttype_code != "")
                {
                    sqlwhere += " and ar.assisttype_code = '" + dsMain.DATA[0].assisttype_code + "' ";
                }
                else { sqlwhere += ""; }
                dsList.RetrieveList(sqlwhere);
            }
            else if (eventArg == PostMBNo)
            {
                string ls_mbno = dsMain.DATA[0].member_no;

                ls_mbno = WebUtil.MemberNoFormat(ls_mbno);

                dsMain.DATA[0].member_no = ls_mbno;
            }
        }

        public void SaveWebSheet()
        {
            string ls_assisDoc;

            try
            {
                for (int i = 0; i < dsList.RowCount; i++)
                {
                    if (dsList.DATA[i].choose_flag == "1")
                    {
                        ls_assisDoc = dsList.DATA[i].assist_docno.Trim();

                        string sqlStr = @"update assreqmaster 
                            set    
                                req_status = -9,cancel_date={2} , cancel_id = {3}
                            where COOP_ID = {0} and assist_docno = {1}";
                        sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopControl, ls_assisDoc,state.SsWorkDate, state.SsUsername);
                        WebUtil.ExeSQL(sqlStr);
                    }
                }

                LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกเรียบร้อย");
                dsList.ResetRow();
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกไม่สำเร็จ : " + ex);
            }
        }

        public void WebSheetLoadEnd()
        {
            throw new NotImplementedException();
        }
    }
}