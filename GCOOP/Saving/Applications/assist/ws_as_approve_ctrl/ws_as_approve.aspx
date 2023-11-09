<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true"
    CodeBehind="ws_as_approve.aspx.cs" Inherits="Saving.Applications.assist.ws_as_approve_ctrl.ws_as_approve" %>

<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc1" %>
<%@ Register Src="DsList.ascx" TagName="DsList" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var dsMain = new DataSourceTool;
        var dsList = new DataSourceTool;

        function Validate() {
            return confirm("ยืนยันการบันทึกข้อมูล");
        }

        function OnDsMainItemChanged(s, r, c, v) {
            if (c == "assisttype_code") {
                InitAsssistpaytype();
            } else if (c == "select_check") {
                if (v == 0) {
                    for (var i = 0; i < dsList.GetRowCount(); i++) {
                        dsList.SetItem(i, "choose_flag", v);
                        dsList.SetItem(i, "req_status", 8);
                        dsList.GetElement(i, "cp_name").style.background = "#FFFFFF";
                        dsList.GetElement(i, "assistpay_desc").style.background = "#FFFFFF";
                        dsList.GetElement(i, "ass_date").style.background = "#FFFFFF";
                        dsList.GetElement(i, "edulevel_desc").style.background = "#FFFFFF";
                        dsList.GetElement(i, "salary_amount").style.background = "#FFFFFF";
                        dsList.GetElement(i, "req_status").style.background = "#FFFFFF";
                        dsList.GetElement(i, "assistnet_amt").style.background = "#FFFFFF";

                    }
                } else {
                    for (var i = 0; i < dsList.GetRowCount(); i++) {
                        dsList.SetItem(i, "choose_flag", v);
                        dsList.SetItem(i, "req_status", 1);
                        dsList.GetElement(i, "cp_name").style.background = "#FFFF99";
                        dsList.GetElement(i, "assistpay_desc").style.background = "#FFFF99";
                        dsList.GetElement(i, "ass_date").style.background = "#FFFF99";
                        dsList.GetElement(i, "edulevel_desc").style.background = "#FFFF99";
                        dsList.GetElement(i, "salary_amount").style.background = "#FFFF99";
                        dsList.GetElement(i, "req_status").style.background = "#FFFF99";
                        dsList.GetElement(i, "assistnet_amt").style.background = "#FFFF99";
                    }
                }
                JsSumnet();
            } else if (c == "req_status") {
                PostChangeStatus();
            }
            else if (c == "sort_type") {
                PostSort();
            }
            else if (c == "member_no") {
                var mem_no = dsMain.GetItem(0, "member_no");
                mem_no = pad(mem_no, 8);
                dsMain.SetItem(0, "member_no", mem_no);
            }
        }

        function pad(num, size) {
            num = num.toString();
            while (num.length < size) num = "0" + num;
            return num;
        }

        function OnDsMainClicked(s, r, c) {
            if (c == "b_clear") {
                dsMain.SetItem(0, "member_no", "");
                dsMain.SetItem(0, "assisttype_code", "");
                dsMain.SetItem(0, "conclusion_no", "");
                InitAsssistpaytype();
                PostSearch();
            } else if (c == "b_search") {
                PostSearch();
            } else if (c == "b_searchmem") {
                Gcoop.OpenIFrame2(650, 600, 'wd_as_member_search.aspx', '')
                //Gcoop.OpenIFrame2Extend(650, 600, 'wd_as_member_search.aspx', '')
            }
        }

        function GetMembNoFromDlg(memberno) {
            dsMain.SetItem(0, "member_no", memberno.trim());
        }

        function OnDsDsListItemChanged(s, r, c, v) {
            if (c == "choose_flag") {
                if (v == 0) {
                    dsMain.SetItem(0, "select_check", 0);
                    dsList.SetItem(r, "choose_flag", v);
                    dsList.SetItem(r, "req_status", 8);
                    dsList.GetElement(r, "cp_name").style.background = "#FFFFFF";
                    dsList.GetElement(r, "assistpay_desc").style.background = "#FFFFFF";
                    dsList.GetElement(r, "ass_date").style.background = "#FFFFFF";
                    dsList.GetElement(r, "edulevel_desc").style.background = "#FFFFFF";
                    dsList.GetElement(r, "salary_amount").style.background = "#FFFFFF";
                    dsList.GetElement(r, "req_status").style.background = "#FFFFFF";
                    dsList.GetElement(r, "assistnet_amt").style.background = "#FFFFFF";
//                    dsList.GetElement(r, "ass_rcvname").style.background = "#FFFFFF";
                } else {
                    dsList.SetItem(r, "choose_flag", v);
                    dsList.SetItem(r, "req_status", 1);
                    dsList.GetElement(r, "cp_name").style.background = "#FFFF99";
                    dsList.GetElement(r, "assistpay_desc").style.background = "#FFFF99";
                    dsList.GetElement(r, "ass_date").style.background = "#FFFF99";
                    dsList.GetElement(r, "edulevel_desc").style.background = "#FFFF99";
                    dsList.GetElement(r, "salary_amount").style.background = "#FFFF99";
                    dsList.GetElement(r, "req_status").style.background = "#FFFF99";
                    dsList.GetElement(r, "assistnet_amt").style.background = "#FFFF99";
//                    dsList.GetElement(r, "ass_rcvname").style.background = "#FFFF99";
                }
                JsSumnet();
            } else if (c == "req_status") {
                if (v != 8) {
                    dsList.SetItem(r, "choose_flag", 1);
                    dsList.GetElement(r, "cp_name").style.background = "#FFFF99";
                    dsList.GetElement(r, "assistpay_desc").style.background = "#FFFF99";
                    dsList.GetElement(r, "ass_date").style.background = "#FFFF99";
                    dsList.GetElement(r, "edulevel_desc").style.background = "#FFFF99";
                    dsList.GetElement(r, "salary_amount").style.background = "#FFFF99";
                    dsList.GetElement(r, "req_status").style.background = "#FFFF99";
                    dsList.GetElement(r, "assistnet_amt").style.background = "#FFFF99";
//                    dsList.GetElement(r, "ass_rcvname").style.background = "#FFFF99";
                } else {
                    dsList.SetItem(r, "choose_flag", 0);
                    dsList.GetElement(r, "cp_name").style.background = "#FFFFFF";
                    dsList.GetElement(r, "assistpay_desc").style.background = "#FFFFFF";
                    dsList.GetElement(r, "ass_date").style.background = "#FFFFFF";
                    dsList.GetElement(r, "edulevel_desc").style.background = "#FFFFFF";
                    dsList.GetElement(r, "salary_amount").style.background = "#FFFFFF";
                    dsList.GetElement(r, "req_status").style.background = "#FFFFFF";
                    dsList.GetElement(r, "assistnet_amt").style.background = "#FFFFFF";
                    dsList.GetElement(r, "ass_rcvname").style.background = "#FFFFFF";
                }
            }

        }

        function JsSumnet() {
            var sum = 0;
            var req_sum = 0;
             for (var i = 0; i < dsList.GetRowCount(); i++) {
                if (dsList.GetItem(i, "choose_flag") == 1) {
                    var assistnet_amt = dsList.GetItem(i, "assistnet_amt");
                    sum += assistnet_amt;
                    req_sum += 1;
                }
            }
            document.getElementById("ctl00_ContentPlace_dsList_sumpayment_new").value = sum.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
            $('#ctl00_ContentPlace_dsList_sum_req').text(req_sum);
        }

        function OnDsListClicked(s, r, c) {
        }

        function SheetLoadComplete() {
            for (var i = 0; i < dsList.GetRowCount(); i++) {
                if (dsList.GetItem(i, "choose_flag") == 1) {
                    dsList.GetElement(i, "cp_name").style.background = "#FFFF99";
                    dsList.GetElement(i, "assistpay_desc").style.background = "#FFFF99";
                    dsList.GetElement(i, "ass_date").style.background = "#FFFF99";
                    dsList.GetElement(i, "edulevel_desc").style.background = "#FFFF99";
                    dsList.GetElement(i, "salary_amount").style.background = "#FFFF99";
                    dsList.GetElement(i, "req_status").style.background = "#FFFF99";
                    dsList.GetElement(i, "assistnet_amt").style.background = "#FFFF99";
                    dsList.GetElement(i, "ass_rcvname").style.background = "#FFFF99";
                }
            }
        }

        function setlabel() {
            var assis_grp = "";
            var assis_grp = Gcoop.GetEl("Hd_setlabel").value;
            if (assis_grp == "01") {
                $('#ctl00_ContentPlace_dsList_text_reqdate').text("วันที่ส่งไปรษณีย์");
                $('#ctl00_ContentPlace_dsList_text_edulevel').text("ระดับชั้น");
                $('#ctl00_ContentPlace_dsList_text_salary').text("เงินเดือน");
            }
            else {
                $('#ctl00_ContentPlace_dsList_text_reqdate').text("วันที่ขอ");
                $('#ctl00_ContentPlace_dsList_text_edulevel').text("สิทธิสวัสดิการ");
                $('#ctl00_ContentPlace_dsList_text_salary').text("รายการหัก");
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <uc1:DsMain ID="dsMain" runat="server" />
    <br />
       <uc2:DsList ID="dsList" runat="server" />

       <asp:HiddenField ID="Hd_sortbegin" runat="server" />
       <asp:HiddenField ID="Hd_setlabel" runat="server" />
</asp:Content>
