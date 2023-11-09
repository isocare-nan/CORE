<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsMain.ascx.cs" Inherits="Saving.CriteriaIReport.u_cri_coopid_date_rloantype_rmembgroup_rcountdate.DsMain" %>
<link id="css1" runat="server" href="../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit">
    <EditItemTemplate>
        <table class="iReportDataSourceFormView">
            <tr>
                <td width="30%">
                    <div>
                        <span>สาขา:</span>
                    </div>
                </td>
                <td>
                    <asp:DropDownList ID="coop_id" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>วันที่:</span>
                    </div>
                </td>
                <td>
                    <asp:TextBox ID="start_date" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>ตั้งแต่ประเภทเงินกู้:</span>
                    </div>
                </td>
                <td>
                    <asp:DropDownList ID="start_loantype" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>ถึงประเภทเงินกู้:</span>
                    </div>
                </td>
                <td>
                    <asp:DropDownList ID="end_loantype" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>ตั้งแต่หน่วย:</span>
                    </div>
                </td>
                <td>
                    <asp:DropDownList ID="start_membgroup" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>ถึงหน่วย:</span>
                    </div>
                </td>
                <td>
                    <asp:DropDownList ID="end_membgroup" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>จำนวนวัน :</span>
                    </div>
                </td>
                <td>
                    <asp:TextBox ID="start_countdate" runat="server">
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>ถึง :</span>
                    </div>
                </td>
                <td>
                    <asp:TextBox ID="end_countdate" runat="server">
                    </asp:TextBox>
                </td>
            </tr>
        </table>
    </EditItemTemplate>
</asp:FormView>
