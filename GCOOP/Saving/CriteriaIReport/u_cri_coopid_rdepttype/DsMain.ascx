<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsMain.ascx.cs" Inherits="Saving.CriteriaIReport.u_cri_coopid_rdepttype.DsMain" %>
<link id="css1" runat="server" href="../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit">
    <EditItemTemplate>
        <table class="iReportDataSourceFormView">
            <tr>
                <td>
                    <div>
                        <span>สาขา:</span>
                    </div>
                </td>
                <td colspan="3">
                    <asp:DropDownList ID="coop_id" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
         
            <tr>
                <td>
                    <div>
                        <span>ตั้งแต่ประเภทเงินฝาก:</span>
                    </div>
                </td>
                <td colspan="3">
                    <asp:DropDownList ID="start_depttype" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>ถึงประเภทเงินฝาก:</span>
                    </div>
                </td>
                <td colspan="3">
                    <asp:DropDownList ID="end_depttype" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </EditItemTemplate>
</asp:FormView>
