<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsSearch.ascx.cs" Inherits="Saving.Applications.assist.ws_as_ucfagentaccount_ctrl.DsSearch" %>
<link id="css1" runat="server" href="../../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<link id="css2" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit">
    <EditItemTemplate>
        <table class="DataSourceFormView" border="0">

            <tr>
                <%--<td width="15%">
                    <div>
                        <span>รหัสสังกัด :</span>
                    </div>
                </td>
                <td width="20%">
                    <asp:TextBox ID="membgroup_code" runat="server" Style="text-align: center;"></asp:TextBox>
                </td>--%>
                <td width="15%">
                    <div>
                        <span>ชื่อหน่วยงาน :</span>
                    </div>
                </td>
                <td width="35%">
                    <asp:TextBox ID="agent_name" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="b_search" runat="server" Text="ค้นหา" Width="50px" />
                </td>
            </tr>
          <%--  <tr>
                <td>
                    <div>
                        <span>หน่วยคุม :</span>
                    </div>
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="cp_groupcontrol" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>--%>
        </table>
    </EditItemTemplate>
</asp:FormView>