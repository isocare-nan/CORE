using System;
using CoreSavingLibrary;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using DataLibrary;
using System.Globalization;

namespace Saving.Applications.assist.ws_as_ucf_constant_ctrl
{
    public partial class ws_as_ucf_constant : PageWebSheet, WebSheet
    {
        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
            
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                dsMain.retrieve();
                dsMain.DATA[0].PRESENT_ASSIST_YEAR = dsMain.DATA[0].PRESENT_ASSIST_YEAR + 543;
            }
        }

        public void CheckJsPostBack(string eventArg)
        {

        }

        public void SaveWebSheet()
        {
            try
            {
                ExecuteDataSource exc = new ExecuteDataSource(this);
                dsMain.DATA[0].PRESENT_ASSIST_YEAR = dsMain.DATA[0].PRESENT_ASSIST_YEAR - 543;
                exc.AddFormView(dsMain, ExecuteType.Update);
                exc.Execute();
                exc.SQL.Clear();
                dsMain.retrieve();
                dsMain.DATA[0].PRESENT_ASSIST_YEAR = dsMain.DATA[0].PRESENT_ASSIST_YEAR + 543;
                LtServerMessage.Text = WebUtil.CompleteMessage("บันทึก สำเร็จ");
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกรายการไม่สำเร็จ");
            }
        }
           

        public void WebSheetLoadEnd()
        {
           
        }

        
        

    }
}