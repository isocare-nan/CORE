using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;

namespace Saving.Applications.assist.ws_as_assstatement_ctrl
{
    public partial class ws_as_assstatement : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public string PostMBNo { get; set; }
        [JsPostBack]
        public string JsPostStatement { get; set; }

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
            dsList.InitDsList(this);
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostMBNo)
            {
                string ls_memno = "", ls_asscontno = "";

                ls_memno = WebUtil.MemberNoFormat(dsMain.DATA[0].member_no);
                dsMain.DATA[0].member_no = ls_memno;
                dsMain.RetrieveMain(ls_memno);
                dsList.ResetRow();
            }
            else if (eventArg == JsPostStatement) {
                dsList.ResetRow();
                dsList.RetrieveData(dsMain.DATA[0].member_no,dsMain.DATA[0].assisttype_code);
            }
        }

        public void SaveWebSheet()
        {
            
        }

        public void WebSheetLoadEnd()
        {
            dsMain.DdAssistType();
        }

    }
}