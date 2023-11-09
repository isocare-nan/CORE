<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true"
    CodeBehind="ws_as_assistpay.aspx.cs" Inherits="Saving.Applications.assist.ws_as_assistpay_ctrl.ws_as_assistpay" %>

<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc1" %>
<%@ Register Src="DsList.ascx" TagName="DsList" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var dsMain = new DataSourceTool;
        var dsList = new DataSourceTool;

        function Validate() {
           // return confirm("ยืนยันการบันทึกข้อมูล");
        }

        function OnDsMainItemChanged(s, r, c, v) {
            if (c == "assisttype_code") {
                InitAsssistpaytype();
            } else if (c == "select_check") {
                if (v == 0) {
                    for (var i = 0; i < dsList.GetRowCount(); i++) {
                        dsList.SetItem(i, "choose_flag", v);
                        dsList.GetElement(i, "cp_name").style.background = "#FFFFFF";
                        dsList.GetElement(i, "assisttype_desc").style.background = "#FFFFFF";
                        dsList.GetElement(i, "approve_date").style.background = "#FFFFFF";
                        dsList.GetElement(i, "approve_amt").style.background = "#FFFFFF";
                    }
                } else {
                    for (var i = 0; i < dsList.GetRowCount(); i++) {
                        dsList.SetItem(i, "choose_flag", v);
                        dsList.GetElement(i, "cp_name").style.background = "#FFFF99";
                        dsList.GetElement(i, "assisttype_desc").style.background = "#FFFF99";
                        dsList.GetElement(i, "approve_date").style.background = "#FFFF99";
                        dsList.GetElement(i, "approve_amt").style.background = "#FFFF99";
                    }
                }
                JsSumnet();
            }
        }

        function OnDsMainClicked(s, r, c) {
            if (c == "b_clear") {
                dsMain.SetItem(0, "member_no", "");
                dsMain.SetItem(0, "assisttype_code", "");
                PostSearch();
            } else if (c == "b_search") {
                PostSearch();
            } else if (c == "b_searchmem") {
                Gcoop.OpenIFrame2(650, 600, 'wd_as_member_search.aspx', '')
            } else if (c == "b_pay") {
                var assist = "";
                var word = "";
                var assist_pay = "";

                for (var i = 0; i < dsList.GetRowCount(); i++) {
                    if (dsList.GetItem(i, "choose_flag") == 1) {
                        assist = dsList.GetItem(i, "asscontract_no");
                        word += "," + assist;
                    }
                }
                if (word != "") {
                    word = word.substring(1, word.length);
                    Gcoop.OpenIFrame2("800", "550", "wd_as_assistpay.aspx", "?assists=" + word);

                } else { alert('กรุณาเลือกใบคำร้อง!!!'); }
            }
        }

        function GetMembNoFromDlg(memberno) {
            dsMain.SetItem(0, "member_no", memberno.trim());
        }
        function GetRetrivedata() {
            PostSearch();
        }
        function OnDsDsListItemChanged(s, r, c, v) {
            if (c == "choose_flag") {
                if (v == 0) {
                    dsMain.SetItem(0, "select_check", 0);
                    dsList.SetItem(r, "choose_flag", v);
                    dsList.GetElement(r, "cp_name").style.background = "#FFFFFF";
                    dsList.GetElement(r, "assisttype_desc").style.background = "#FFFFFF";
                    dsList.GetElement(r, "approve_date").style.background = "#FFFFFF";
                    dsList.GetElement(r, "approve_amt").style.background = "#FFFFFF";
                } else {
                    dsList.SetItem(r, "choose_flag", v);
                    dsList.GetElement(r, "cp_name").style.background = "#FFFF99";
                    dsList.GetElement(r, "assisttype_desc").style.background = "#FFFF99";
                    dsList.GetElement(r, "approve_date").style.background = "#FFFF99";
                    dsList.GetElement(r, "approve_amt").style.background = "#FFFF99";
                }
                 JsSumnet();
            } else if (c == "req_status") {
                if (v != 8) {
                    dsList.SetItem(r, "choose_flag", 1);
                    dsList.GetElement(r, "cp_name").style.background = "#FFFF99";
                    dsList.GetElement(r, "assisttype_desc").style.background = "#FFFF99";
                    dsList.GetElement(r, "approve_date").style.background = "#FFFF99";
                    dsList.GetElement(r, "approve_amt").style.background = "#FFFF99";
                } else {
                    dsList.SetItem(r, "choose_flag", 0);
                    dsList.GetElement(r, "cp_name").style.background = "#FFFFFF";
                    dsList.GetElement(r, "assisttype_desc").style.background = "#FFFFFF";
                    dsList.GetElement(r, "approve_date").style.background = "#FFFFFF";
                    dsList.GetElement(r, "approve_amt").style.background = "#FFFFFF";
                }
            }

        }

        function JsSumnet() {
            var sum = 0, sum_req = 0;
             for (var i = 0; i < dsList.GetRowCount(); i++) {
                if (dsList.GetItem(i, "choose_flag") == 1) {
                    var assistnet_amt = dsList.GetItem(i, "approve_amt");
                    sum += assistnet_amt;
                    sum_req++;
                }
            }
            document.getElementById("ctl00_ContentPlace_dsList_sumpayment_new").value = sum.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
            document.getElementById("ctl00_ContentPlace_dsList_sum_req").value = sum_req;
        }

        function OnDsListClicked(s, r, c) {
        }

        function SheetLoadComplete() {
            for (var i = 0; i < dsList.GetRowCount(); i++) {
                if (dsList.GetItem(i, "choose_flag") == 1) {
                    dsList.GetElement(i, "asscontract_no").style.background = "#FFFF99";
                    dsList.GetElement(i, "assistpay_code").style.background = "#FFFF99";
                    dsList.GetElement(i, "assisttype_desc").style.background = "#FFFF99";
                    dsList.GetElement(i, "full_name").style.background = "#FFFF99";
                    dsList.GetElement(i, "approve_amt").style.background = "#FFFF99";
                    dsList.GetElement(i, "req_status").style.background = "#FFFF99";
                }
            }
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <uc1:DsMain ID="dsMain" runat="server" />
    <uc2:DsList ID="dsList" runat="server" />
</asp:Content>
