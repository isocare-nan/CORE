<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="ws_as_ucf_constant.aspx.cs" 
Inherits="Saving.Applications.assist.ws_as_ucf_constant_ctrl.ws_as_ucf_constant" %>

<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    var dsMain = new DataSourceTool();



    function MenubarNew() {

    }

    function Validate() {
        return confirm("ยืนยันการบันทึกข้อมูล");
    }
    
    
  

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <center>
    <uc1:DsMain ID="dsMain" runat="server" /></center>
<%--    <br />
    <br />
     <%--<span class="NewRowLink" onclick="OnClickAddRow()" id="add_row" runat="server">เพิ่มแถว</span></div>--%>



     <asp:HiddenField ID="HdR" runat="server" />
       <asp:HiddenField ID="Hexpense_code" runat="server" />
    
</asp:Content>
