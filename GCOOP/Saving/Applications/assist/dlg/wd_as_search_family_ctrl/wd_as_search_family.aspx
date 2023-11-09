<%@ Page Title="" Language="C#" MasterPageFile="~/FrameDialog.Master" AutoEventWireup="true" CodeBehind="wd_as_search_family.aspx.cs" 
    Inherits="Saving.Applications.assist.dlg.wd_as_search_family_ctrl.wd_as_search_family" %>


<%@ Register Src="DsDetail.ascx" TagName="DsDetail" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       
        var dsDetail = new DataSourceTool();

        function OnDsDetailClicked(s, r, c) {
            var family_name = dsDetail.GetItem(r, "family_name");
            var card_person = dsDetail.GetItem(r, "card_person");
            var birth_date = dsDetail.GetItem(r, "birth_date");
            var relation_code = dsDetail.GetItem(r, "relation_code");
            try {
                window.opener.GetempFromDlgfamily(family_name, card_person,birth_date,relation_code);
                window.close();
            } catch (err) {
                parent.GetempFromDlgfamily(family_name, card_person,birth_date,relation_code);
                parent.RemoveIFrame();
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
<br />
    <uc2:DsDetail ID="dsDetail" runat="server" />
    <asp:HiddenField ID="Hd_status" runat="server" />
     <asp:HiddenField ID="Hd_deptcode" runat="server" />
</asp:Content>
