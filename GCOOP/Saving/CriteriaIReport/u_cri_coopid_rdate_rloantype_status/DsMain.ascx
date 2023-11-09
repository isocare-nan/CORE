﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsMain.ascx.cs" Inherits="Saving.CriteriaIReport.u_cri_coopid_rdate_rloantype_status.DsMain" %>
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
                        <span>ตั้งแต่วันที่:</span>
                    </div>
                </td>
                <td>
                    <asp:TextBox ID="start_date" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>ถึงวันที่:</span>
                    </div>
                </td>
                <td>
                    <asp:TextBox ID="end_date" runat="server"></asp:TextBox>
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
                        <span>สถานะ:</span>
                    </div>
                </td>
                <td>
                    <asp:DropDownList ID="status" runat="server">
                    
                    <asp:ListItem Value="1">อนุมัติ</asp:ListItem>
                    <asp:ListItem Value="8">รออนุมัติ</asp:ListItem>
                    <asp:ListItem Value="-1">ไม่อนุมัติ</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </EditItemTemplate>
</asp:FormView>
