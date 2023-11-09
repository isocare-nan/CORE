<%@ Page Title="" Language="C#" MasterPageFile="~/FrameDialog.Master" AutoEventWireup="true"
    CodeBehind="wd_as_request_memberno.aspx.cs" Inherits="Saving.Applications.assist.dlg.wd_as_request_memberno_ctrl.wd_as_request_memberno" %>

<%@ Register Src="DsList.ascx" TagName="DsList" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var dsList = new DataSourceTool();

        function OnDsCriteriaItemChanged(s, r, c, v) {
            if (c == "assisttype_code") {
                InitAsssistpaytype();
            }
        }

        function OnDsCriteriaClicked(s, r, c) {
        }

        function OnDsListItemChanged(s, r, c, v) {
        }

        function OnDsListClicked(s, r, c) {
            var memberno = dsList.GetItem(r, "member_no");
            var reqdoc_no = dsList.GetItem(r, "assist_docno");
            var entry_id = dsList.GetItem(r, "entry_id");
            try {
                window.opener.GetRefdocnoFromDlgReqOld(memberno, reqdoc_no, entry_id);
                window.close();
            } catch (err) {
                parent.GetRefdocnoFromDlgReqOld(memberno, reqdoc_no, entry_id);
                parent.RemoveIFrame();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <uc2:DsList ID="dsList" runat="server" />
    <asp:Label ID="LbCount" runat="server" ForeColor="Green" Font-Bold="True" Font-Names="Tahoma"
        Font-Size="14px"></asp:Label>
    <br />
</asp:Content>
