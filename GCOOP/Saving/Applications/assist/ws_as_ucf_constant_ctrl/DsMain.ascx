<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsMain.ascx.cs" 
    Inherits="Saving.Applications.assist.ws_as_ucf_constant_ctrl.DsMain" %>
<link id="css1" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<script language="JavaScript">
    function chkNumber(ele) {
        var vchar = String.fromCharCode(event.keyCode);
        if ((vchar < '0' || vchar > '9') && (vchar != '.')) return false;
        ele.onKeyPress = vchar;
    }
</script>
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit" Style="margin-right: 10px"
    Width="70%" Height="100%">
    <EditItemTemplate>
        <table class="DataSourceFormView" width="100%">

            <tr>
                <td valign="top">
                    <fieldset>
                        <legend style="color: blue; font-weight: bold;">ปีสวัสดิการ</legend>
                        <asp:Panel ID="Panel3" runat="server" Height="150px">
                            <table class="DataSourceFormView" style="width: 100%;">
                                <td width="40%">
                                    <div>
                                        <span>ปีปัจจุบัน :</span>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:TextBox ID="present_assist_year" runat="server" Style="text-align: center; background-color:lightgrey" 
                                            MaxLength="4" ReadOnly="true" ></asp:TextBox>
                                    </div>
                                </td>
                                <tr>
                                    <td width="40%">
                                        <div>
                                            <span>วันที่เริ่มต้นรอบปีสวัสดิการ :</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:TextBox ID="beginning_of_assist" runat="server" Style="text-align: center;background-color:lightgrey" ReadOnly="true" > </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">
                                        <div>
                                            <span>วันที่สิ้นสุดรอบปีสวัสดิการ :</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:TextBox ID="ending_of_assist" runat="server" Style="text-align: center;background-color:lightgrey" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <fieldset>
                        <legend style="color: blue; font-weight: bold; width: 100%;">ชื่อ-สกุลและตำแหน่ง</legend>
                        <asp:Panel ID="Panel5" runat="server" Height="250px">
                            <table class="DataSourceFormView" style="width: 100;">
                                <td width="40%">
                                    <div>
                                        <span>ชื่อผู้จัดทำ :</span>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:TextBox ID="name_1" runat="server" Style="text-align: left"></asp:TextBox>
                                    </div>
                                </td>
                                <tr>
                                    <td width="40%">
                                        <div>
                                            <span>ตำแหน่งผู้จัดทำ :</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:TextBox ID="position_1" runat="server" Style="text-align: left"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">
                                        <div>
                                            <span>ชื่อหัวหน้าฝ่าย :</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:TextBox ID="name_2" runat="server" Style="text-align: left"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">
                                        <div>
                                            <span>ตำแหน่งหัวหน้าฝ่าย :</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:TextBox ID="position_2" runat="server" Style="text-align: left"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">
                                        <div>
                                            <span>ชื่อรองผู้จัดการ :</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:TextBox ID="name_3" runat="server" Style="text-align: left"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">
                                        <div>
                                            <span>ตำแหน่งรองผู้จัดการ :</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:TextBox ID="position_3" runat="server" Style="text-align: left"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">
                                        <div>
                                            <span>ชื่อผู้จัดการ :</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:TextBox ID="name_4" runat="server" Style="text-align: left"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">
                                        <div>
                                            <span>ตำแหน่งผู้จัดการ :</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:TextBox ID="position_4" runat="server" Style="text-align: left"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                </td>
            </tr>
        </table>
    </EditItemTemplate>
</asp:FormView>
