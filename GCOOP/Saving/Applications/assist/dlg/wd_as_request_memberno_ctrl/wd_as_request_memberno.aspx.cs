using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataLibrary;

namespace Saving.Applications.assist.dlg.wd_as_request_memberno_ctrl
{
    public partial class wd_as_request_memberno : PageWebDialog, WebDialog
    {
        [JsPostBack]
        public string InitAsssistpaytype { get; set; }

        public void InitJsPostBack()
        {
            dsList.InitDsList(this);
        }

        public void WebDialogLoadBegin()
        {
            if (!IsPostBack)
            {
                string member_no = "", assisttype_code = "";

                if (Request.QueryString["member_no"] != null || Request.QueryString["member_no"] != "")
                {
                    member_no = Request.QueryString["member_no"];
                    assisttype_code = Request.QueryString["assisttype_code"];
                }
                Getreqdocno(member_no, assisttype_code);
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            
        }

        public void WebDialogLoadEnd()
        {

        }

        public void Getreqdocno (string member_no,string assisttype_code)
        {
            try
            {
                String ls_memno = "", ls_asstype = "", ls_asspay1 = "";
                String ls_memname = "", ls_memsurname = "", ls_asspay2 = "", ass_reqno = "";
                Decimal ldc_assyear = 0;

                string ls_sqlext = "";

                string coop_id = state.SsCoopControl;

                ls_memno = member_no.Trim();
                ls_asstype = assisttype_code.Trim();

                if (ls_memno.Length > 0)
                {
                    ls_sqlext += " and (  assreqmaster.member_no like '%" + ls_memno + "%') ";
                }
                if (ls_asstype != "00")
                {
                    ls_sqlext += " and (  assreqmaster.assisttype_code = '" + ls_asstype + "') ";
                }
                

                string sql = sql = @"
                SELECT DISTINCT
                    ASSREQMASTER.ASSIST_DOCNO,
                    ASSREQMASTER.REQ_DATE,
                    ASSREQMASTER.MEMBER_NO, 
                    MBUCFPRENAME.PRENAME_DESC || MBMEMBMASTER.MEMB_NAME || ' ' || MBMEMBMASTER.MEMB_SURNAME as MEMB_NAME, 
                    ASSUCFASSISTTYPE.ASSISTTYPE_DESC,
                    ASSUCFASSISTTYPE.ASSISTTYPE_CODE,ASSREQMASTER.ENTRY_ID
                FROM         
                    ASSREQMASTER , ASSUCFASSISTTYPE, MBMEMBMASTER, MBUCFPRENAME
                WHERE     
                    ASSREQMASTER.MEMBER_NO = MBMEMBMASTER.MEMBER_NO AND 
                    ASSREQMASTER.COOP_ID = MBMEMBMASTER.COOP_ID AND 
                    ASSREQMASTER.ASSISTTYPE_CODE = ASSUCFASSISTTYPE.ASSISTTYPE_CODE AND
                    MBMEMBMASTER.PRENAME_CODE = MBUCFPRENAME.PRENAME_CODE AND
                    ASSREQMASTER.REQ_STATUS = 8 AND ASSREQMASTER.COOP_ID = '" + coop_id + "' " + ls_sqlext + "  order by ASSREQMASTER.ASSIST_DOCNO";

                DataTable dt = WebUtil.Query(sql);
                dsList.ImportData(dt);

            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }
        }
    }
}