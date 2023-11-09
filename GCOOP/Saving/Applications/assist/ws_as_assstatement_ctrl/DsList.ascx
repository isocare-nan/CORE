<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsList.ascx.cs" Inherits="Saving.Applications.assist.ws_as_assstatement_ctrl.DsList" %>


<link id="css1" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<table class="DataSourceRepeater" >    
    <tr>  
        <th width="5%">
        </th>        
        <th  width="12%">
            วันที่รายการ
        </th>
        <th  width="24%">
            รายการ
        </th>
         <th  width="18%">
            ค่าหุ้น
        </th>
        <th  width="15%">
            จำนวนเงิน
        </th> 
        <th  width="15%">
            ยอดรับแล้ว
        </th> 
        <th width="20%">
            ผู้ทำรายการ
        </th>  
    </tr>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <tr>
                <td>
                    <asp:TextBox ID="seq_no" runat="server" Style="text-align: center;" ReadOnly="True"></asp:TextBox>       
                </td>
                <td>
                    <asp:TextBox ID="operate_date" runat="server" Style="text-align: center;" ReadOnly="True"></asp:TextBox>                 
                </td> 
                <td>
                    <asp:TextBox ID="itemdesc" runat="server" Style="text-align: left;" ReadOnly="true"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="share_value" runat="server" Style="text-align: right;" ToolTip="#,##0.00" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="payvalue" runat="server" Style="text-align: right;" ToolTip="#,##0.00" ReadOnly="True"></asp:TextBox>
                </td>   
                <td>
                    <asp:TextBox ID="pay_balance" runat="server" Style="text-align: right;" ToolTip="#,##0.00" ReadOnly="True"></asp:TextBox>
                </td>   
                <td>
                    <asp:TextBox ID="entry_id" runat="server" Style="text-align: center;" ReadOnly="True"></asp:TextBox>
                </td>               
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>