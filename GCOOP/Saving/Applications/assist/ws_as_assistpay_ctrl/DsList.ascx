<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsList.ascx.cs" Inherits="Saving.Applications.assist.ws_as_assistpay_ctrl.DsList" %>
<link id="css1" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<table cellspacing="0" rules="all" class="DataSourceRepeater" style="width: 728px;
            border-collapse: collapse;">
        <tr>
        <td  width="20%" style="text-align: right; background-color:#FFF5EE	;" colspan="3">
            รวมจำนวนคำขอ :
        </td >
            <td style="border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000; background-color:#FFF5EE;" width="15%">
            <asp:TextBox ID="sum_req" runat="server" Style="text-align: center; 
                font-weight: bold; color:Red; font-size:12px; background-color:#FFF5EE;" ToolTip="###,###,##0.00" ReadOnly="true"></asp:TextBox>
        </td>
         <td width="15%" style="text-align: right;background-color:#FFF5EE;">
            รวมเงิน :
        </td>
            <td style="border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #000000; background-color:#FFF5EE;" width="20%">
            <asp:TextBox ID="sumpayment_new" runat="server" Style="text-align: right; 
                font-weight: bold; color:Red; font-size:12px; background-color:#FFF5EE;" ToolTip="###,###,##0.00" ReadOnly="true"></asp:TextBox>
        </td>
        <td width="8%" style="border:0px; ">

        </td>
    </tr>
    </table>

<table class="DataSourceRepeater" style="width: 697px">
    <tr>
        <th width="4%">
        </th>
        <th width="26%">
            ชื่อ - สกุล
        </th>
        <th width="32%">
            ประเภท
        </th>
        <th width="13%">
            วันที่อนุมัติ
        </th>
        <th width="13%">
            เงินสวัสดิการ
        </th>
     </tr>
</table>
<asp:Panel ID="Panel1" runat="server" Height="450px" Width="728px" ScrollBars="Vertical" >
    <table class="DataSourceRepeater" style="width: 98%; ">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td width="4%" align="center">
                        <asp:CheckBox ID="choose_flag" runat="server" />
                    </td>
                    <td width="26%">
                        <asp:TextBox ID="cp_name" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td width="32%">
                        <asp:TextBox ID="assisttype_desc" runat="server" Style="text-align: left" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td width="13%">
                        <asp:TextBox ID="approve_date" runat="server" ReadOnly="true" Style="text-align: center" ></asp:TextBox>
                    </td>
                    <td width="13%">
                        <asp:TextBox ID="approve_amt" runat="server" Style="text-align: right" ToolTip="#,##0.00" ReadOnly="true"></asp:TextBox>
                    </td>                   
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</asp:Panel>
