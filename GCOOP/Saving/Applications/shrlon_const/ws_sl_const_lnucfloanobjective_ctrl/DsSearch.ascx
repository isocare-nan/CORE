<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsSearch.ascx.cs" Inherits="Saving.Applications.shrlon_const.ws_sl_const_lnucfloanobjective_ctrl.DsSearch" %>
<link id="css1" runat="server" href="../../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<link id="css2" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit">
    <EditItemTemplate>
        <table class="DataSourceFormView" border="0">
           
            <tr>
                <td>
                    <div>
                        <span>ประเภท :</span>
                    </div>
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="loantype_code" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </EditItemTemplate>
</asp:FormView>