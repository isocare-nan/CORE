﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsSum.ascx.cs" Inherits="Saving.Applications.assist.ws_sheet_as_genrequest_ctrl.DsSum" %>


<link id="css1" runat="server" href="../../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<link id="css2" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />

    <style>
.DataSourceRepeater tbody, table thead
{
    display: block;
}

.DataSourceRepeater th
{
    width: 0px;
}
.DataSourceRepeater td
{
    width: 0px;
}
.TableSum th
{
    font-family: Tahoma;
    font-size: 13px;
    font-weight: normal;
    text-align: center;
    border: 1px solid #000000;
    background-color: rgb(211, 231, 255);
    height: 22px;
}
</style>

<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit" 
    style="margin-right: 10px" Width="1113px" >
    <EditItemTemplate>
    <table cellspacing="0" rules="all" class="TableSum" border="0" style="border-collapse: collapse; width:1113px"> 
                 <td style="border-style: none;background-color:#FFFF99; text-align: right; font-size:14px;" width="60%">
            <strong> <center> รวมจำนวนเงิน</center></strong>
        </td>
              <td width="15%">
                        <asp:TextBox ID="sumapprove_amt" runat="server" ToolTip="#,##0.00" Style="text-align: right;background-color:#FFE4E1" ReadOnly="true" Width="98%"></asp:TextBox>
                  
                </td> 
                  <td width="10%">
                        <asp:TextBox ID="sum_maxpayamt" runat="server" ToolTip="#,##0.00" Style="text-align: right;background-color:#B0C4DE" ReadOnly="true" Width="100%"></asp:TextBox>
               
                </td>
                <td width="15%">
                </td> 
      
    </table>
 </EditItemTemplate>


</asp:FormView>
