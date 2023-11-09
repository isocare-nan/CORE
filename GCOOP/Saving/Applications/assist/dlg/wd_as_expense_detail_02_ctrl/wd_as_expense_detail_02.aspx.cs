using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;

namespace Saving.Applications.assist.dlg.wd_as_expense_detail_02_ctrl
{
    public partial class wd_as_expense_detail_02 : PageWebDialog, WebDialog
    {
        [JsPostBack]
        public string PostDeptaccount { get; set; }


        public void InitJsPostBack()
        {
            dsList.InitDsList(this);
        }

        public void WebDialogLoadBegin()
        {
            if (!IsPostBack)
            {
                String ls_memno, ls_expcode, ls_expbank, ls_expbranch, ls_expaccid, ls_chqpayname, ls_tofromaccid, ls_expclr, ls_deptno = "" , ls_deptaccno = "";

                try
                {
                    ls_memno = Request["memno"].ToString();
                }
                catch { ls_memno = ""; }
                try
                {
                    ls_expcode = Request["exp_code"].ToString();
                }
                catch { ls_expcode = ""; }
                try
                {
                    ls_expbank = Request["exp_bank"].ToString();
                    if (ls_expbank == "null")
                    {
                        ls_expbank = "";
                    }
                }
                catch { ls_expbank = ""; }
                try
                {
                    ls_expbranch = Request["exp_branch"].ToString();
                    if (ls_expbranch == "null")
                    {
                        ls_expbranch = "";
                    }
                }
                catch { ls_expbranch = ""; }
                try
                {
                    ls_expaccid = Request["exp_accid"].ToString();
                    if (ls_expaccid == "null")
                    {
                        ls_expaccid = "";
                    }
                }
                catch { ls_expaccid = ""; }
                try
                {
                    ls_chqpayname = Request["chq_payname"].ToString();
                    if (ls_chqpayname == "null")
                    {
                        ls_chqpayname = "";
                    }
                }
                catch { ls_chqpayname = ""; }
                try
                {
                    ls_tofromaccid = Request["tofrom_accid"].ToString();
                    if (ls_tofromaccid == "null")
                    {
                        ls_tofromaccid = "";
                    }
                }
                catch { ls_tofromaccid = ""; }

                try
                {
                    ls_expclr = Request["exp_clr"].ToString();
                    if (ls_expclr == "null")
                    {
                        ls_expclr = "";
                    }
                }
                catch { ls_expclr = ""; }

                try
                {
                    ls_deptaccno = Request["deptaccount_no"].ToString();
                    if (ls_deptaccno == "null")
                    {
                        ls_deptaccno = "";
                    }
                    Hd_deptaccount.Value = ls_deptaccno;
                }
                catch { ls_expclr = ""; }

                dsList.DdFromAccId(ls_expcode);
                

                dsList.DATA[0].tofrom_accid = ls_tofromaccid;
                
                 if (ls_expcode == "TRN")
                {
                    if (ls_memno.ToLower().Trim() != "null")
                    {
                        dsList.DATA[0].member_no = WebUtil.MemberNoFormat(ls_memno);
                    }
                    dsList.RetrieveDeptaccount(ls_memno, ref ls_deptno);
                    dsList.DATA[0].deptaccount_no = ls_deptaccno;
                    if (ls_deptaccno == "")
                    {
                        dsList.DATA[0].deptaccount_no = ls_deptno;
                    }
                }
                
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostDeptaccount)
            {
                string ls_memno = WebUtil.MemberNoFormat(dsList.DATA[0].member_no);
                dsList.DATA[0].member_no = ls_memno;
                string ls_deptno = "";
                dsList.RetrieveDeptaccount(ls_memno, ref ls_deptno);
                dsList.DATA[0].deptaccount_no = ls_deptno;
                if (ls_deptno == "")
                {
                    dsList.DATA[0].deptaccount_no = Hd_deptaccount.Value;
                }
            }
        }

        private void of_setclearing()
        {
            string ls_sql, ls_expcode, ls_expbank;
            ls_expcode = dsList.DATA[0].cashtype;
            ls_expbank = dsList.DATA[0].bank_code;

            if (ls_expcode != "CBT" )
            {
                return;
            }

            ls_sql = " select clearing_type from cmucfbank where bank_code = '" + ls_expbank + "' ";

            Sdt dt = WebUtil.QuerySdt(ls_sql);
            if (dt.Next())
            {
                //dsList.DATA[0].expense_clearing = dt.GetString("clearing_type");
            }

        }

        public void WebDialogLoadEnd()
        {
        }
    }
}