<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsList.ascx.cs" Inherits="Saving.Applications.assist.ws_as_assistpaygroup_ctrl.DsList" %>
<link id="css1" runat="server" href="../../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<link id="css2" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />

<asp:Panel ID="Panel"  runat="server" >
<table cellspacing="0" rules="all" class="DataSourceRepeater" style="width: 800px;
            border-collapse: collapse;">
        <tr>
        <%--<td width="4%">

        </td>--%>
        <td  width="33%" style="text-align: right; background-color:#FFF5EE	;" colspan="2">
            รวมจำนวนรายการ :
        </td>
        <td width="25%" style="text-align: center ; background-color:#FFF5EE;">
            <label id="sum_req"  runat="server" ></label>
        </td>
         <td width="20%" style="text-align: right;background-color:#FFF5EE;">
            รวมเงินสวัสดิการ :
        </td>
        <td width="10%" style="text-align: right;background-color:#FFF5EE;">
            <label id="sum_balance"  runat="server" ></label>
        </td>
        <td width="13%" style="border:0px; ">

        </td>
    </tr>
    </table>

 <table cellspacing="0" rules="all" class="DataSourceRepeater" style="width: 800px;
            border-collapse: collapse;">
    <tr>
        <th width="4%">
        </th>
        <th width="4%">
            ลำดับ
        </th>
        <th width="25%">
            ชื่อ - สกุล
        </th>
        <th width="25%">
            ประเภท
        </th>
        <th width="10%">
            วันที่เกิด
        </th>
        <th width="10%">
            วันที่อนุมัติ
        </th>
        <th width="10%">
            เงินสวัสดิการ
        </th>
        <th width="13%">
            เลขบัญชี
        </th>
     </tr>
</table>
<div style="overflow-y: scroll; overflow-x: hidden;  width: 800px">
   <table cellspacing="0" rules="all" class="DataSourceRepeater" style="width: 800px;
            border-collapse: collapse;">
   
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
          
           <tr>
                    <td width="4%" align="center">
                        <asp:CheckBox ID="choose_flag" runat="server" />
                    </td>
               <td width="4%">
                        <asp:TextBox ID="running_number" runat="server" Style="text-align: center" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="cp_name" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="assisttype_desc" runat="server" Style="text-align: left" ReadOnly="true"></asp:TextBox>
                    </td>
               <td width="10%">
                        <asp:TextBox ID="birth_date" runat="server" ReadOnly="true" Style="text-align: center" ></asp:TextBox>
                    </td>
                    <td width="10%">
                        <asp:TextBox ID="approve_date" runat="server" ReadOnly="true" Style="text-align: center" ></asp:TextBox>
                    </td>
                    <td width="10%">
                        <asp:TextBox ID="approve_amt" runat="server" Style="text-align: right" ToolTip="#,##0.00" ReadOnly="true"></asp:TextBox>
                    </td>     
                    <td width="13%">
                        <asp:TextBox ID="expense_accid" runat="server" Style="text-align: right" Width="85%"  ReadOnly="true"></asp:TextBox>
                    </td>              
                </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>
</div>
</asp:Panel>