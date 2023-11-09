<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsMain.ascx.cs" Inherits="Saving.Applications.ap_deposit.dlg.wd_dep_booknew_ctrl.DsMain" %>
<link id="css1" runat="server" href="../../../../JsCss/DataSourceTool.css" rel="stylesheet" type="text/css" />
<asp:FormView ID="FormViewMain" runat="server" DefaultMode="Edit">
   <EditItemTemplate>
   <center>
        <table class="DataSourceFormView" style="width:600px;padding:50px;">
            <tr>
                <td>
                    <span style="width:130px">เลขที่สมุด:</span>
                </td>
              <td >
                   <%-- as_booknew--%>
                    <asp:TextBox ID="as_bookno" runat="server" Width="150px" Style="text-align:center;">
                    </asp:TextBox>     
                </td>
                <td >
                     <asp:TextBox ID="as_oldbook" runat="server" Style="text-align:center;width:152px;"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                   <span>เหตุผลในการออก :</span>
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="as_bookreson" runat="server" Style="font-size: 12px;">
                    </asp:DropDownList>
                </td>                
            </tr>
         <tr>
       
        </tr> 
          <td colspan="3">
             <asp:Button ID="b_comfirm_first" runat="server" Text="พิมพ์ปกหน้า"   Width="100px"  />    
        <asp:Button ID="b_comfirm_back" runat="server" Text="พิมพ์ปกหลัง"  Width="100px" />     
        <asp:Button ID="b_fee" runat="server" Text="ค่าปรับสมุดบัญชีใหม่"   Width="100px"/>   
        <asp:Button ID="b_cancle" runat="server" Text="ยกเลิก"  Width="100px"/>    
        </td>
        </table> 
    </center>
    </EditItemTemplate>
</asp:FormView>