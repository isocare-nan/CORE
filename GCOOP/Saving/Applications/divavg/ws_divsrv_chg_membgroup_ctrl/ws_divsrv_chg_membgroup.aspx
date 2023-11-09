<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true"
    CodeBehind="ws_divsrv_chg_membgroup.aspx.cs" Inherits="Saving.Applications.divavg.ws_divsrv_chg_membgroup_ctrl.ws_divsrv_chg_membgroup" %>

<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var dsMain = new DataSourceTool;
       

        function Validate() {
            return confirm("ยืนยันการบันทึกข้อมูล")
        }

        function OnDsMainItemChanged(s, r, c, v) {
            if (c == "member_no") {
                PostMemberNo();
            }
        }

        function OnDsMainClicked(s, r, c) {
            if (c == "b_search") {
                Gcoop.OpenIFrame2(650, 600, 'w_dlg_divsrv_member_search.aspx', '')
            }
        }
        function GetValueFromDlg(memberno) {
            dsMain.SetItem(0, "member_no", memberno.trim());
            PostMemberNo();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <br />
    <uc1:DsMain ID="dsMain" runat="server" />
    <br />
 
</asp:Content>
