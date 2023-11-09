﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsDetail.ascx.cs" Inherits="Saving.Applications.assist.ws_as_assucfedulevel_ctrl.DsDetail" %>


<link id="css1" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
    <table class="DataSourceRepeater">
        <tr>
            <th width="15%">
                รหัสระดับชั้นการศึกษา
            </th>
            <th width="50%">
                ระดับชั้นการศึกษา
            </th>
            <th width="7%">
            </th>

        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
            <tr>
                <td>
                    <asp:TextBox ID="edulevel_code" runat="server" style="text-align: center"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="edulevel_desc" runat="server" style="text-align: left"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="b_del" runat="server" text="ลบ"/>
                </td>

            </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</asp:Panel>