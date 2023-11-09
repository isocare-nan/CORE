<%@ Page Title="" Language="C#" MasterPageFile="~/FrameDialog.Master" AutoEventWireup="true" CodeBehind="wd_dep_booknew.aspx.cs" Inherits="Saving.Applications.ap_deposit.dlg.wd_dep_booknew_ctrl.wd_dep_booknew" %>
<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        var dsMain = new DataSourceTool;
        function OnDsMainItemChanged(s, r, c, v) {
            if (c == "as_bookno") {
                PostChkPassbook();
            }
        }
        function OnDsMainClicked(s, r, c) {
            if (c == "b_comfirm_first" || c == "b_comfirm_back" || c == "b_fee") {
                if (dsMain.GetItem(0, "as_bookno") == null || dsMain.GetItem(0, "as_bookno") == "") {
                    alert("กรุณาระบุเลขที่สมุด!!"); return false;
                }
                if (c == "b_comfirm_first") {
                    checkError();
                    PostSubmit_first();
                } else if (c == "b_comfirm_back") {
                    checkError();
                    PostSubmit_back();
                } else if (c == "b_fee") {
                    checkError();
                    PostSubmit_fee();
                } 
            }
            else if (c == "b_cancle") {
                window.close();
                parent.RemoveIFrame();
            }
        }
        function checkError() {
            if (dsMain.GetItem(0, "as_bookno") == null || dsMain.GetItem(0, "as_bookno") == "") {
                alert("กรุณาระบุเลขที่สมุด!!");return false;
            }
        }
        function DialogLoadComplete() {
                try {
                var closeDlg = Gcoop.GetEl("HdCloseDlg").value;
                if (closeDlg == "true") {
                    window.close();
                    parent.UpNewBookFinish(newBookNo);
                }
            } catch (err) { }
        }

     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <uc1:DsMain ID="dsMain" runat="server" />
    <asp:HiddenField ID="HdLastSeqNo" runat="server" />
    <asp:HiddenField ID="HdDeptAccountNo"  runat="server" />
    <asp:HiddenField ID="HdCloseDlg"  runat="server" />
    <asp:HiddenField ID="HdFREE" Value="" runat="server" />
</asp:Content>
