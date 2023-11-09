<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true"
    CodeBehind="ws_as_ucfagent_membgroup.aspx.cs" Inherits="Saving.Applications.assist.ws_as_ucfagent_membgroup_ctrl.ws_as_ucfagent_membgroup" %>

<%@ Register Src="DsSearch.ascx" TagName="DsSearch" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var dsMain = new DataSourceTool();
        var dsList = new DataSourceTool();
        var dsSearch = new DataSourceTool();

        function Validate() {
            return confirm("ยืนยันการบันทึกข้อมูล");
        }

        function OnDsSearchClicked(s, r, c) {
            if (c == "b_search") {
                GetSearch();
            }
        }

        $(document).ready(function () {
            $("#ctl00_ContentPlace_GridView1 tbody tr .bankcode").on('focus', function () {
            }).change(function () {
                var table = document.getElementById('ctl00_ContentPlace_GridView1'),
                    rows = table.getElementsByTagName('tr'),
                    i, j, cells;
                var tr = $(this).closest('tr')
                Gcoop.GetEl("HdRow").value = $(this).closest("tr").index();
                var bank_code = tr.find('td:eq(4) input[name$=format_bank]').val();
                JsPostRtbranch();
                });
            var thisRow = $('#ctl00_ContentPlace_GridView1 tbody')
            thisRow.on('click', 'tr td .accountno', function () {
                var rowfocus = $(this).closest("tr").index();
                var tr = $(this).closest('tr')
                var rowpad = pad(rowfocus, 2);
                Gcoop.GetEl("HdRow").value = rowpad;
                Gcoop.GetEl("Hd_format").value = document.getElementById("ctl00_ContentPlace_GridView1_ctl" + pad(parseInt(rowpad) + 1, 2) + "_format_bank").value;
                onload_format_bank_mask();
            });
        });

        function pad(num, size) {
            num = num.toString();
            while (num.length < size) num = "0" + num;
            return num;
        }

        function format_bank_mask() {
            //var row_focus = Gcoop.GetEl("HdRow").value;
            var rowpad = Gcoop.GetEl("HdRow").value;
            var row_focus = pad(parseInt(rowpad) + 1, 2);
            //var bank_code = document.getElementById("ctl00_ContentPlace_GridView1_ctl" + row_focus + "_format_bank").value;
            var bank_code = Gcoop.GetEl("Hd_format").value;
            var myMask = bank_code.replaceAll("@","_");
            var myCaja = document.getElementById("ctl00_ContentPlace_GridView1_ctl" + row_focus + "_account_no");
            var myText = "";
            var myNumbers = [];
            var myOutPut = ""
            var theLastPos = 1;
            myText = myCaja.value;
            //get numbers
            for (var i = 0; i < myText.length; i++) {
                if (!isNaN(myText.charAt(i)) && myText.charAt(i) != " ") {
                    myNumbers.push(myText.charAt(i));
                }
            }
            //write over mask
            for (var j = 0; j < myMask.length; j++) {
                if (myMask.charAt(j) == "_") { //replace "_" by a number 
                    if (myNumbers.length == 0)
                        myOutPut = myOutPut + myMask.charAt(j);
                    else {
                        myOutPut = myOutPut + myNumbers.shift();
                        theLastPos = j + 1; //set caret position
                    }
                } else {
                    myOutPut = myOutPut + myMask.charAt(j);
                }
            }

                document.getElementById("ctl00_ContentPlace_GridView1_ctl" + row_focus + "_account_no").value = myOutPut;
                document.getElementById("ctl00_ContentPlace_GridView1_ctl" + row_focus + "_account_no").setSelectionRange(theLastPos, theLastPos);
           
        }


        function validate_int(myEvento) {
            if ((myEvento.charCode >= 48 && myEvento.charCode <= 57) || myEvento.keyCode == 9 || myEvento.keyCode == 10 || myEvento.keyCode == 13 || myEvento.keyCode == 8 || myEvento.keyCode == 116 || myEvento.keyCode == 46 || (myEvento.keyCode <= 40 && myEvento.keyCode >= 37)) {
                dato = true;
            } else {
                dato = false;
            }
            return dato;
        }

        function onload_format_bank_mask() {
            var rowpad = Gcoop.GetEl("HdRow").value;
            var row_focus = pad(parseInt(rowpad) + 1, 2);
            document.getElementById("ctl00_ContentPlace_GridView1_ctl" + row_focus + "_account_no").onkeypress = validate_int;
            document.getElementById("ctl00_ContentPlace_GridView1_ctl" + row_focus + "_account_no").onkeyup = format_bank_mask;
        }
 

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <table align="center">
        <tr>
            <td>
                <uc2:DsSearch ID="dsSearch" runat="server" />
            </td>
        </tr>

        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" Height="450px" ScrollBars="Vertical" HorizontalAlign="Center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="DataSourceRepeater"  OnRowDataBound="GvKpCutorder_RowDataBound">
                       <Columns>  
                <asp:TemplateField HeaderText="รหัสสังกัด" ItemStyle-Width="10%">
                    <ItemTemplate>
                        <asp:TextBox ID="membgroup_code" runat="server" Text='<%# Bind("membgroup_code") %>' Style="text-align: center" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ชื่อสังกัด" ItemStyle-Width="30%">
                    <ItemTemplate>
                        <asp:TextBox ID="membgroup_desc" class="description" runat="server"  Text='<%# Bind("membgroup_desc") %>'
                            Style="text-align: left" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField> 
                           <asp:TemplateField HeaderText="หน่วยงาน" ItemStyle-Width="20%">
                    <ItemTemplate>
                        <asp:DropDownList ID="assagent_code"  runat="server" >
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                           <%--<asp:TemplateField HeaderText="สาขา" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:DropDownList ID="branch_id" runat="server">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>  
                           <asp:TemplateField HeaderText="เลขบัญชี" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:TextBox ID="account_no" class="accountno" runat="server" Text='<%# Bind("account_no") %>'
                            Style="text-align: left" ReadOnly="false"  ></asp:TextBox>
                        <asp:HiddenField ID="format_bank" runat="server" Value='<%# Bind("format_bank") %>' />
                    </ItemTemplate>
                </asp:TemplateField>--%>  
                          <%-- <asp:TemplateField HeaderText="สาขา" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:TextBox ID="format_bank" runat="server" Text='<%# Bind("format_bank") %>' Style="text-align: center" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField> --%> 
            </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="HdMembgroup" runat="server" />
    <asp:HiddenField runat="server" ID="HdRow" Value="0" />
     <asp:HiddenField ID="Hd_bankcode" runat="server" />
    <asp:HiddenField ID="Hd_format" runat="server" />
</asp:Content>
