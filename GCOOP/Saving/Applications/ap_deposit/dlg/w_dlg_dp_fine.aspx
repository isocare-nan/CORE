﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="w_dlg_dp_fine.aspx.cs"
    Inherits="Saving.Applications.ap_deposit.dlg.w_dlg_dp_fine" %>

<%@ Register Assembly="WebDataWindow" Namespace="Sybase.DataWindow.Web" TagPrefix="dw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ระบบเงินฝาก</title>
    <%=newClear%>
    <%=postSubmit%>
    <style type="text/css">
        .buttonWidth
        {
            width: 60px;
        }
    </style>
    <script type="text/javascript">

        function ok_onclick() {
            postSubmit();
        }

        function cancel_onclick() {
            window.close();
            parent.RemoveIFrame();
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
                    พิมพ์ค่าปรับ</td>
                <td valign="top">
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <input id="ok" class="buttonWidth" type="button" value="พิมพ์" onclick="return ok_onclick()" />
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