using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

namespace Saving.Applications.assist.dlg.wd_as_search_family_ctrl
{
    public partial class wd_as_search_family : PageWebDialog, WebDialog
    {
        [JsPostBack]
        public string postsearch { get; set; }
        string memberno = string.Empty;

        public void InitJsPostBack()
        {
            dsDetail.InitDsDetail(this);
        }

        public void WebDialogLoadBegin()
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["member_no"] != null || Request.QueryString["member_no"] != "")
                {
                    memberno = Request.QueryString["member_no"];
                }
                dsDetail.RetrieveDetail(memberno);
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
        }

        public void WebDialogLoadEnd()
        {

        }
    }
}
