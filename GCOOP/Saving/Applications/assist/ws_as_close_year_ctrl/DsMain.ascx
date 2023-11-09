<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsMain.ascx.cs" Inherits="Saving.Applications.assist.ws_as_close_year_ctrl.DsMain" %>
<link id="css1" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet" type="text/css" />


<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit" 
    style="margin-right: 10px" Width="100%" >
    <EditItemTemplate>
         <table class="DataSourceFormView"  style="width:600px; align-content:center;" >
          <td width="15%">
                    <div>
                        <span>ปีสวัสดิการปัจจุบัน :</span>
                    </div>
                </td>
              <td width="15%">
                    <div>
                        <asp:TextBox ID="present_account_year" runat="server" Style="text-align: center" ReadOnly="True"></asp:TextBox>
                    </div>
                </td>

        </table>

        

    </EditItemTemplate>


</asp:FormView>

