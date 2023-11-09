<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="ws_as_assstatement.aspx.cs" Inherits="Saving.Applications.assist.ws_as_assstatement_ctrl.ws_as_assstatement" %>


<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc1" %>
<%@ Register Src="DsList.ascx" TagName="DsList" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        //ประกาศตัวแปร ควรอยู่บริเวณบนสุดใน tag <script>
        var dsMain = new DataSourceTool();
        var dsList = new DataSourceTool();

        function OnDsMainClicked(s, r, c) {
            //alert(c);
            if (c == "b_search") {
                Gcoop.OpenIFrame2(650, 600, 'wd_as_member_search.aspx', '')
            }
        }
        function GetMembNoFromDlg(memberno) {
            dsMain.SetItem(0, "member_no", memberno.trim());
            PostMBNo();
        }

        function OnDsMainItemChanged(s, r, c, v) {
            if (c == "member_no") {
                PostMBNo();
            }
            else if (c == "assisttype_code") {
            JsPostStatement(); 
            }
        }




        function Validate() {
        }

        

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <uc1:DsMain ID="dsMain" runat="server" />
    <br />
    <strong style="font-size: 15px;">รายการเคลื่อนไหว</strong>
     <uc2:DsList ID="dsList" runat="server" />
    <asp:HiddenField ID="hdTabIndex" Value="0" runat="server" />
    <asp:HiddenField ID="hdRow" Value="0" runat="server" />
    <asp:HiddenField ID="HdTokenIMG" runat="server" />
</asp:Content>

