<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="w_dlg_dp_fine_interest.aspx.cs"
    Inherits="Saving.Applications.ap_deposit.dlg.w_dlg_dp_fine_interest" %>

<%@ Register Assembly="WebDataWindow" Namespace="Sybase.DataWindow.Web" TagPrefix="dw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ระบบเงินฝาก</title>
    <%=newClear%>
    <%=postSubmit%>
   <%=postSubmit2%>
    <style type="text/css">
        .buttonWidth
        {
            width: 80px;
        }
    </style>
    <script type="text/javascript">
        function DialogLoadComplete() {
            if (getUrlVars()["other_amt"] > 0) {
                Gcoop.GetEl("Label2").style.visibility = "hidden";
                Gcoop.GetEl("ok").style.visibility = "hidden";
            }
        }
        //ค่าปรับ
        function ok_onclick() {
            postSubmit();
        }
       //ใบสำคัญจ่าย
        function ok2_onclick() {
            postSubmit2();
        }
        function cancel_onclick() {
            window.close();
            parent.RemoveIFrame();
        }
        function getUrlVars() {
            var vars = {};
            var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (m, key, value) {
                vars[key] = value;
            });
            return vars;
        }



    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
        <table>
            <tr>
                <td valign="top" align="center" >

                    <asp:Label ID="Label14" runat="server" Text="พิมพ์ใบสำคัญจ่าย"></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label13" runat="server" Text="พิมพ์ค่าปรับ"></asp:Label>

                    </td>
                <td valign="top">
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                <input id="ok1" class="buttonWidth"  type="button" value="ใบสำคัญจ่าย" onclick="return ok2_onclick()" />
                    &nbsp;
                    <input id="ok" class="buttonWidth" type="button" value="ค่าปรับ" onclick="return ok_onclick()" />
                    &nbsp;
                    <input id="cancel" class="buttonWidth" type="button" value="ยกเลิก" onclick="return cancel_onclick()" />
                </td>
            </tr>
        </table>
        <br />
    </div>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <asp:HiddenField ID="HdDeptAccountNo" runat="server" />
    <asp:HiddenField ID="HdCloseDlg" runat="server" />
    <asp:HiddenField ID="HdLastSeqNo" Value="" runat="server" />
    </form>
</body>
</html>
