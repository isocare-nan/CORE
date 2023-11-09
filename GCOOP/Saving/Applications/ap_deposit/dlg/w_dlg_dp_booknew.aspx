<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="w_dlg_dp_booknew.aspx.cs"
    Inherits="Saving.Applications.ap_deposit.dlg.w_dlg_dp_booknew" %>

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
            width: 100px;
        }
        .style1
        {
            color: #FF0000;
            font-size: small;
        }
    </style>
    <script type="text/javascript">
        function DialogLoadComplete() {
            objDwMain.SetItem(1, "as_bookno", ""); console.log('start');
//            var dataWindowControl = objDwMain.GetControl("DwMain"); // เปลี่ยนเป็นชื่อที่ใช้จริง
//            console.log(dataWindowControl);
//            var columnToFocus = "as_bookno"; // ตั้งชื่อคอลัมน์ที่ต้องการให้โฟกัส
//            dataWindowControl.SetColumnFocus(columnToFocus);
         //   Gcoop.SetLastFocus("as_bookno_1");
            objDwMain.Focus("as_bookno_1");
            alert('1');
            try {
                var closeDlg = Gcoop.GetEl("HdCloseDlg").value;
                if (closeDlg == "true") {
                    //window.close();
                    //parent.RemoveIFrame();
                    var newBookNo = objDwMain.GetItem(1, "as_bookno");
                    parent.UpNewBookFinish(newBookNo);
                }
            } catch (err) { }
           
          
        }

        function ok_onclick() {
            postSubmit();
        }

        function cancel_onclick() {
            window.close();
            parent.RemoveIFrame();
        }

        function OnDwMainItemChanged(sender, rowNumber, columnName, newValue) {
            objDwMain.itemGainFocus(0, 1, this, objDwMain.gobs.as_bookno); 
            Gcoop.SetLastFocus("as_bookno_1");
            Gcoop.Focus();
            if (columnName == "as_bookreson" || columnName == "as_bookno") {
                objDwMain.SetItem(rowNumber, columnName, newValue);
                objDwMain.AcceptText();
            }
        }
    </script>
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
        <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
        <table>
        <tr>
            <td>
            กรุณาเลือกทำรายการ
            </td>
        </tr>
            <tr>
                <td valign="top" align="center">
                    <dw:WebDataWindowControl ID="DwMain" runat="server" ClientScriptable="True" DataWindowObject="d_dp_booknew"
                        LibraryList="~/DataWindow/ap_deposit/dp_slip.pbl" HorizontalScrollBar="NoneAndClip"
                        VerticalScrollBar="NoneAndClip" UseCurrentCulture="True" AutoRestoreContext="False"
                        AutoSaveDataCacheAfterRetrieve="True" AutoRestoreDataCache="True" ClientFormatting="True"
                        ClientEventItemChanged="OnDwMainItemChanged">
                    </dw:WebDataWindowControl>
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <input id="ok" class="buttonWidth" type="button" value="พิมพ์ปกหน้า" onclick="return ok_onclick()" />
                     &nbsp;
                    <asp:Button ID="Button1" runat="server" Text="พิมพ์ปกหลัง" onclick="btnback_Click" />
                    &nbsp;
                    <asp:Button ID="Button2" runat="server" Text="ค่าปรับสมุดบัญชีใหม่" onclick="FREE_Click" />
                    &nbsp;
                    <input id="cancel" class="buttonWidth" type="button" value="ยกเลิก" onclick="return cancel_onclick()" />
                </td>
            </tr>
             <tr>
                <td class="style1"> <strong>หมายเหตุ : ให้พิมพ์สมุดก่อนถึงจะสามารถพิมพ์ใบเสร็จค่าปรับสมุดบัญชีใหม่</strong></td>
             </tr>
        </table>
        <br />
    </div>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <asp:HiddenField ID="HdDeptAccountNo" runat="server" />
    <asp:HiddenField ID="HdFREE" Value="" runat="server" />
    <asp:HiddenField ID="HdCloseDlg" runat="server" />
    <asp:HiddenField ID="HdLastSeqNo" Value="" runat="server" />
    <asp:HiddenField ID="HdColumFocus" runat="server" />
    </form>
</center>
</body>
</html>
