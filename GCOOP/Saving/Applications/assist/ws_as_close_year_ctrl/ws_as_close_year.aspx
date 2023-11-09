<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="ws_as_close_year.aspx.cs" 
    Inherits="Saving.Applications.assist.ws_as_close_year_ctrl.ws_as_close_year" %>
<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        //ประกาศตัวแปร ควรอยู่บริเวณบนสุดใน tag <script>
        var dsMain = new DataSourceTool();

        //ประกาศฟังก์ชันสำหรับ event ItemChanged
        function OnDsListItemChanged(s, r, c, v) {

            if (c == "ass_year") {
                Gcoop.GetEl("HdYear").value = v;
                Gcoop.GetEl("HdRow").value = r;
                PostSetDefaltDate();
                alert(c);
            }
        }

        //ประกาศฟังก์ชันสำหรับ event Clicked
        function OnDsListClicked(s, r, c) {
            if (c == "b_del") {
                dsList.SetRowFocus(r);
                if (confirm("ลบข้อมูลแถวที่ " + (r + 1) + " ?") == true) {
                    PostDelRow();
                } 
            }
        }

        function Validate() {
//           return confirm("ยืนยันการบันทึกข้อมูล");           
        }

        function SheetLoadComplete() {
        }

        function OnClickNewRow() {
            PostNewRow();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <uc1:DsMain ID="dsMain" runat="server" />
    <asp:HiddenField ID="HdYear" runat="server" />
    <br />

     <div id="tabs-1">
                      <input id="Button3" type="button" value="ปิดสิ้นปีสวัสดิการ" onclick="CloseYear()" style="height: 35px;
                    width: 150px;"  runat="server"/>
                    </div>
</asp:Content>
 
