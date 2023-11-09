<%@ Page Title="" Language="C#" MasterPageFile="~/FrameDialog.Master" AutoEventWireup="true" CodeBehind="wd_as_agentaccount.aspx.cs" 
    Inherits="Saving.Applications.assist.dlg.wd_as_agentaccount_ctrl.wd_as_agentaccount" %>

<%@ Register Src="DsList.ascx" TagName="DsList" TagPrefix="uc1" %>
<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../../../../JsCss/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="../../../../js/Gcoop.js" type="text/javascript"></script>
    <script type="text/javascript">
        var dsList = new DataSourceTool();
        var dsMain = new DataSourceTool();
        function OnDsMainClicked(s, r, c) {
            if (c == "b_search") {
                PostSearch();
            }
        }
       
//       function OnDsListClicked(s, r, c) {
//           var deptno = dsList.GetItem(r, "deptaccount_no");
//            try {
//                window.opener.GetDeptNoFromDlg(deptno);
//                window.close();
//            } catch (err) {
//                parent.GetDeptNoFromDlg(deptno);
//                parent.RemoveIFrame();
//            }
        //        }

        $(document).ready(function () {
            var totalRows = document.getElementById("ctl00_ContentPlace_Hd_row").value;
            if (totalRows > 10) {
                $('#ctl00_ContentPlace_GridView1 tbody tr ').not(':last-child').click(function () {
                    try {
                        var account_no = $(this).closest('tr').find('td .account_no').val();
                        if (isConfirm) {
                            window.opener.GetaccountnoFromDlg(account_no);
                            window.close();
                        }

                    } catch (err) {
                        parent.GetaccountnoFromDlg(account_no);
                        window.close();
                    }

                });
            }
            else {
                $('#ctl00_ContentPlace_GridView1 tbody').on('click', 'tr', function () {
                    try {
                        var account_no = $(this).closest('tr').find('td .account_no').val();
                        if (isConfirm) {
                            window.opener.GetaccountnoFromDlg(account_no);
                            window.close();
                        }

                    } catch (err) {
                        parent.GetaccountnoFromDlg(account_no);
                        window.close();
                    }

                });
            }

        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
   
    <uc2:DsMain ID="dsMain" runat="server" />
    <br />
    <%--<uc1:DsList ID="dsList" runat="server" />--%>
    <table cellspacing="0" rules="all" class="DataSourceRepeater" border="1" style="border-collapse: collapse; ">
                        <tr>
                            <th align="center" style="width: 20%;">
                                ชื่อหน่วยงาน
                            </th>
                            <%--<th align="center" style="width: 15%;">
                                ธนาคาร
                            </th>
                            <th align="center" style="width: 15%;">
                                สาขา
                            </th>--%>
                            <th style="text-align:center; width: 10%;">
                                เลขบัญชี
                            </th>
                            <th style="text-align:center; width: 20%;">
                                 ชื่อบัญชี
                            </th>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="DataSourceRepeater" 
                         ShowHeader="false" AllowPaging="true"  OnPageIndexChanging="GridView1_OnPageIndexChanging"  PageSize="15" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                        <asp:TemplateField HeaderText="ชื่อหน่วยงาน" ItemStyle-Width="20%">
                    <ItemTemplate>
                        <asp:TextBox ID="agent_name"  runat="server" Text='<%# Bind("agent_name") %>'
                            Style="text-align: left" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="ธนาคาร" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:TextBox ID="bank_desc"  runat="server" Text='<%# Bind("bank_desc") %>'
                            Style="text-align: Center" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                            <asp:TemplateField HeaderText="สาขา" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:TextBox ID="branch_name"  runat="server" Text='<%# Bind("branch_name") %>'
                            Style="text-align: Center" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                 <asp:TemplateField HeaderText="เลขบัญชี" ItemStyle-Width="10%">
                    <ItemTemplate>
                        <asp:TextBox ID="account_no" class ="account_no" runat="server" Text='<%# Bind("account_no") %>'
                            Style="text-align: center" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ชื่อบัญชี" ItemStyle-Width="20%">
                    <ItemTemplate>
                        <asp:TextBox ID="account_name" runat="server" Text='<%# Bind("account_name") %>'
                            Style="text-align: left" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
    <asp:Label ID="LbCount" runat="server" ForeColor="Green" Font-Bold="True" Font-Names="Tahoma"
        Font-Size="14px"></asp:Label>
    <br />
    <asp:HiddenField ID="Hd_row" Value="" runat="server" />
</asp:Content>