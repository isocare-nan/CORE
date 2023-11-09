﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsList.ascx.cs" Inherits="Saving.Applications.assist.dlg.wd_as_request_memberno_ctrl.DsList" %>
<link id="css1" runat="server" href="../../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<link id="css2" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<div align="left">
    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Left">
        <table class="DataSourceRepeater" style="width: 600px;">
            <tr>
                <th width="14%">
                    เลขที่ใบคำขอ
                </th>
                <th width="14%">
                    วันที่ขอ
                </th>
                <th width="14%">
                    ทะเบียน
                </th>
                <th width="29%">
                    ชื่อ - นามสกุล
                </th>
                <th width="29%">
                    ผู้ทำรายการ
                </th>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server"  Width="600px"
        HorizontalAlign="Left">
        <table class="DataSourceRepeater" style="width: 600px;">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td width="14%">
                            <asp:TextBox ID="ASSIST_DOCNO" runat="server" ReadOnly="true" Style="cursor: pointer"></asp:TextBox>
                        </td>
                        <td width="14%" align="center">
                            <asp:TextBox ID="REQ_DATE" runat="server" ReadOnly="true" Style="cursor: pointer"></asp:TextBox>
                        </td>
                        <td width="14%" align="center">
                            <asp:TextBox ID="MEMBER_NO" runat="server" ReadOnly="true" Style="cursor: pointer"></asp:TextBox>
                        </td>
                        <td width="29%">
                            <asp:TextBox ID="MEMB_NAME" runat="server" ReadOnly="true" Style="cursor: pointer"></asp:TextBox>
                        </td>
                        <td width="29%">
                            <asp:TextBox ID="entry_id" runat="server" ReadOnly="true" Style="cursor: pointer"></asp:TextBox>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </asp:Panel>
</div>