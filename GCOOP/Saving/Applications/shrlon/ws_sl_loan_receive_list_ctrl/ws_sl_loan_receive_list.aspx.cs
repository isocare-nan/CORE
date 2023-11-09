using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLibrary;
using System.Drawing;
using CoreSavingLibrary.WcfNShrlon;
using System.Data;
using System.IO;

namespace Saving.Applications.shrlon.ws_sl_loan_receive_list_ctrl
{
    public partial class ws_sl_loan_receive_list : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public string PostShowData { get; set; }
        [JsPostBack]
        public string PostMemberNo { get; set; }

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
            dsList.InitDsList(this);
        }

        public void WebSheetLoadBegin()
        {
            dsMain.RetriveEntryid();

            if (!IsPostBack)
            {
                dsMain.DATA[0].GROUP = "01";
                dsList.RetrieveList("01", "%","");
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostShowData)
            {
                try
                {
                    string group = "", entry = "",str_query="";
                    decimal list_quantity = Convert.ToDecimal(dsMain.DATA[0].LIST_QUANTITY);
                    if (list_quantity>0){
                        str_query = " where rownum <= "+list_quantity;
                    }

                    if (dsMain.DATA[0].GROUP == "0")
                    {
                        group = "%";
                    }
                    else
                    {
                        group = dsMain.DATA[0].GROUP + "%";
                    }

                    entry = "%" + dsMain.DATA[0].ENTRY_ID + "%";

                    dsList.RetrieveList(group, entry,str_query);
                }catch(Exception ex){
                    LtServerMessage.Text = WebUtil.ErrorMessage(ex.Message);
                }

            }
            else if (eventArg == PostMemberNo)
            {
                string ls_membno = WebUtil.MemberNoFormat(dsMain.DATA[0].MEMBER_NO);

                dsMain.DATA[0].MEMBER_NO = ls_membno;
                setcolordefault();
                for (int i = 0; i < dsList.RowCount; i++)
                {
                    if (dsList.DATA[i].MEMBER_NO == ls_membno)
                    {
                        setcolor_row(i);
                        dsList.FindTextBox(i, "member_no").Focus();
                    }
                }
            }
        }

        private void setcolordefault()
        {
            Color myRgbColor = new Color();
            myRgbColor = Color.FromArgb(255, 255, 255);
            for (int index_row = 0; index_row < dsList.RowCount; index_row++)
            {
                dsList.FindTextBox(index_row, "lnrcvfrom_code").BackColor = myRgbColor;
                dsList.FindTextBox(index_row, "loancontract_no").BackColor = myRgbColor;
                dsList.FindTextBox(index_row, "prefix").BackColor = myRgbColor;
                dsList.FindTextBox(index_row, "member_no").BackColor = myRgbColor;
                dsList.FindTextBox(index_row, "name").BackColor = myRgbColor;
                dsList.FindTextBox(index_row, "membgroup_code").BackColor = myRgbColor;
                dsList.FindTextBox(index_row, "withdrawable_amt").BackColor = myRgbColor;
            }
        }

        private void setcolor_row(int index_row)
        {
            Color myRgbColor = new Color();
            myRgbColor = Color.FromArgb(92, 172, 238);

            dsList.FindTextBox(index_row, "lnrcvfrom_code").BackColor = myRgbColor;
            dsList.FindTextBox(index_row, "loancontract_no").BackColor = myRgbColor;
            dsList.FindTextBox(index_row, "prefix").BackColor = myRgbColor;
            dsList.FindTextBox(index_row, "member_no").BackColor = myRgbColor;
            dsList.FindTextBox(index_row, "name").BackColor = myRgbColor;
            dsList.FindTextBox(index_row, "membgroup_code").BackColor = myRgbColor;
            dsList.FindTextBox(index_row, "withdrawable_amt").BackColor = myRgbColor;
        }

        public void SaveWebSheet()
        {
        }

        public void WebSheetLoadEnd()
        {
        }
    }
}