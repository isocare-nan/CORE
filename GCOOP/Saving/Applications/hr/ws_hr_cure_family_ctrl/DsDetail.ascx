<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsDetail.ascx.cs" Inherits="Saving.Applications.hr.ws_hr_cure_family_ctrl.DsDetail" %>
<link id="css1" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit">
    <EditItemTemplate>
        <table class="DataSourceFormView">
            <tr>
                <td width="10%">
                    ผู้ป่วย :
                </td>
                <td width="40%">
                        <asp:TextBox ID="assist_name" runat="server" Style="text-align: center"></asp:TextBox>
                </td>
                <td width="10%">
                    ฐานะเป็น :
                </td>
                <td width="40%">
                        <asp:TextBox ID="assist_state" runat="server" Style="text-align: center"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="10%">
                    อาการ :
                </td>
                <td colspan ="3">
                    <div>
                        <asp:TextBox ID="assist_detail" runat="server" Style="text-align: center"></asp:TextBox>
                        <div>
                </td>
            </tr>
            <tr>
                <td width="10%">
                    สถานพยาบาล :
                </td>
                <td width="40%">
                        <asp:TextBox ID="assist_hosname" runat="server" Style="text-align: center"></asp:TextBox>
                </td>
                <td width="10%">
                    ที่ตั้ง :
                </td>
                <td width="40%">
                        <asp:TextBox ID="assist_posit" runat="server" Style="text-align: center"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="10%">
                    อำเภอ/เขต :
                </td>
                <td width="40%">
                        <asp:TextBox ID="assist_amp" runat="server" Style="text-align: center"></asp:TextBox>
                </td>
                <td width="10%">
                    จังหวัด :
                </td>
                <td width="40%">
                        <asp:TextBox ID="assist_prov" runat="server" Style="text-align: center"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="10%">
                    วันที่เข้ารับการรักษา :
                </td>
                <td width="40%">
                        <asp:TextBox ID="assist_sdate" runat="server" Style="text-align: center"></asp:TextBox>
                </td>
                <td width="10%">
                    ถึงวันที่ :
                </td>
                <td width="40%">
                        <asp:TextBox ID="assist_edate" runat="server" Style="text-align: center"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="10%">
                    วันที่ทำรายการ :
                </td>
                <td width="40%">
                        <asp:TextBox ID="assist_date" runat="server" Style="text-align: center"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan = "2">
                    ตามใบรับเงินที่แนบมาพร้อมนี้ รวม :
                </td>
                <td>
                    <div>
                        <asp:TextBox ID="assist_paper" runat="server" Style="text-align: center"></asp:TextBox>
                        <div>
                </td>
                <td>
                    ฉบับ
                </td>
            </tr>
            <tr>
                <td colspan = "2">
                    รวมทั้งหมดเป็นเงิน :
                </td>
                <td>
                    <div>
                        <asp:TextBox ID="assist_amt" runat="server" Style="text-align: right" ToolTip="#,##0.00"></asp:TextBox>
                        <div>
                </td>
                <td>
                    บาท
                </td>
            </tr>
            <tr>
                <td colspan = "2">
                    ยอดให้เบิกตามระเบียบ :
                </td>
                <td>
                    <div>
                        <asp:TextBox ID="assist_minamt" runat="server" Style="text-align: right" ToolTip="#,##0.00"></asp:TextBox>
                        <div>
                </td>
                <td>
                    บาท
                </td>
            </tr>
        </table>
    </EditItemTemplate>
</asp:FormView>
