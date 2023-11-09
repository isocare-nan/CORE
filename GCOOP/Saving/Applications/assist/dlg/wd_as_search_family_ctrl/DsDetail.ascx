<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsDetail.ascx.cs" 
    Inherits="Saving.Applications.assist.dlg.wd_as_search_family_ctrl.DsDetail" %>



<link id="css1" runat="server" href="../../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<div align="left">
    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Left">
        <table class="DataSourceRepeater" style="width: 700px;">
            <tr>
                <th width="40%">
                    ชื่อ-สกุล
                </th>
                <th width="20%">
                    เลขบัตรประชาชน
                </th>
                <th width="10%">
                    วันเกิด
                </th>
                <th width="10%">
                    เกี่ยวข้องเป็น
                </th>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Height="390px" ScrollBars="Auto" Width="700px"  HorizontalAlign="Left">
        <table class="DataSourceRepeater" style="width: 700px;">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td width="40%">
                            <asp:TextBox ID="family_name" runat="server" ReadOnly="true" Style="cursor: pointer; text-align:left" ></asp:TextBox>
                        </td>
                        <td width="20%">
                            <asp:TextBox ID="card_person" runat="server" ReadOnly="true" Style="cursor: pointer;text-align:center"></asp:TextBox>
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="birth_date" runat="server" ReadOnly="true" Style="cursor: pointer;text-align:center"></asp:TextBox>
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="relation_desc" runat="server" ReadOnly="true" Style="cursor: pointer;text-align:center"></asp:TextBox>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </asp:Panel>
</div>
