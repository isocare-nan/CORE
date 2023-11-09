<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsMain.ascx.cs" Inherits="Saving.Applications.divavg.ws_divsrv_chg_membgroup_ctrl.DsMain" %>
<link id="css1" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit">
    <EditItemTemplate>
        <table class="DataSourceFormView">
            <tr>
                <td style="width:90px;">
                    <div>
                        <span>ปีปันผล:</span>
                    </div>
                </td>
                <td style="width:300px;">
                    <asp:TextBox ID="div_year" runat="server" Style="text-align: center;"></asp:TextBox>
                </td>
                
            </tr>
           <tr>
                <td>
                    <div>
                        <span>เลขสมาชิก:</span>
                    </div>
                </td>
                <td>
                    <asp:TextBox ID="member_no" runat="server" Style="width: 90px; text-align: center;"></asp:TextBox>
                    <asp:Button ID="b_search" runat="server" Text="..." Style="width: 25px;" />
                </td>
                 <tr>
                <td>
                    <div>
                        <span>ชื่อ-สกุล:</span>
                    </div>
                </td>
                <td>
                    <asp:TextBox ID="cp_membname" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
                </tr>
           </tr>
           <tr>
                <td>
                    <div>
                        <span>สังกัดปัจจุบัน:</span>
                    </div>
                </td>
                <td >
                    <asp:TextBox ID="cp_membgroup" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <div>
                        <span>สังกัดที่เปลี่ยน:</span>
                    </div>
                </td>
           
                <td >
                    <asp:DropDownList ID="membgroup_code" runat="server">
                        </asp:DropDownList>
                </td>
            </tr>
        </table>
    </EditItemTemplate>
</asp:FormView>
