<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true"
    CodeBehind="ws_sheet_as_genrequest.aspx.cs" Inherits="Saving.Applications.assist.ws_sheet_as_genrequest_ctrl.ws_sheet_as_genrequest" %>

<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc1" %>
<%@ Register Src="DsList.ascx" TagName="DsList" TagPrefix="uc2" %>
<%@ Register Src="DsSum.ascx" TagName="DsSum" TagPrefix="uc3" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.DataSourceRepeater tbody, table thead
{
    display: block;
}

.DataSourceRepeater th
{
    width: 72px;
}
.DataSourceRepeater td
{
    width: 72px;
}
.TableHeader th
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
        var dsMain = new DataSourceTool;
        var dsList = new DataSourceTool;
        var dsSum = new DataSourceTool;

        function Validate() {
            return confirm("ยืนยันการบันทึกข้อมูล");
        }

        function OnDsMainClicked(s, r, c, v) {
            if (c == "b_process") {
                if (dsMain.GetItem(0, "process_month") == "1") { dsMain.SetItem(0, "process_month", "01"); }
                var chk_assistcode = dsMain.GetItem(0, "assisttype_code");
                var moneytype_code = dsMain.GetItem(0, "moneytype_code");
                var trtype_code = dsMain.GetItem(0, "trtype_code");
                var depttype_code = dsMain.GetItem(0, "depttype_code");

                if (chk_assistcode == "00" || chk_assistcode == null) {
                    alert("กรุณาเลือก ประเภทสวัสดิการ!!!"); return;
                } else {
                    if (moneytype_code == "TRN" && trtype_code == "DEP" && (depttype_code == "" || depttype_code == null)) {
                        alert("กรุณาเลือก ประเภทบัญชีเงินฝาก!!!"); return;
                    }
                    else {
                        PostProcess();
                    }
                }
            } else if (c == "b_save") {
                if (confirm("ยืนยันการบันทึก")) {
                    PostSave();
                }
            }
        }
        function OnDsMainItemChanged(s, r, c, v) {
            if (c == "all_check") {
                var checkbox_grid = false;
                var ap_amt = 0;
                var max_amt = 0;
                var sumallap_amt = 0;
                var H_row = Gcoop.GetEl("Hd_rowcount").value;
                $('table#ctl00_ContentPlace_GridView1').find('td input').removeClass("highlight");
                if (v == "0") {
                    checkbox_grid = false;
                    Gcoop.GetEl("Hd_setsum").value = 0;
                } else {
                    checkbox_grid = true;
                }






                $("#ctl00_ContentPlace_GridView1").find("[type='checkbox']").prop('checked', checkbox_grid);
                $('table#ctl00_ContentPlace_GridView1').find('td input').toggleClass("highlight", checkbox_grid);
                var sumappo_amt = 0;
                var summax_amt = 0;
                var tr_approve_amt = 0;
                var tr_max_payamt = 0;
                var checkacc = 0;
                if (checkbox_grid) {
                    $(".ap_amt").each(function () {

                        var value = $(this).val();
                        if (isNaN(value) && value.length != 0) {
                            sumappo_amt += Number(value.replace(/[^0-9.-]+/g, ""));
                        }
                    });
                    $(".max_amt").each(function () {

                        var value = $(this).val();
                        if (isNaN(value) && value.length != 0) {
                            summax_amt += Number(value.replace(/[^0-9.-]+/g, ""));
                        }
                    });

                    $('#ctl00_ContentPlace_GridView1 > tbody  > tr').each(function () {
                        var expense_accid = $(this).find("td:eq(9) input").val();
                        var trtype_code = dsMain.GetItem(0, "trtype_code");

                        if (expense_accid === "" && trtype_code === "DEP") {
                            checkacc = "1";
                            //                            $(this).find("[type='checkbox']").prop('checked', false)
                            //                            $(this).find('td input').toggleClass("highlight", false)
                            //                            tr_approve_amt += Number($(this).find("td:eq(7) input").val().replace(/[^0-9.-]+/g, ""));
                            //                            tr_max_payamt += Number($(this).find("td:eq(8) input").val().replace(/[^0-9.-]+/g, ""));
                        }
                    });
                    if (checkacc === "1") {
                        alert('มีรายการใบคำขอที่ไม่มีเลขบัญชี กรุณาตรวจสอบ!!!')
                        $("#ctl00_ContentPlace_GridView1").find("[type='checkbox']").prop('checked', false);
                        $('table#ctl00_ContentPlace_GridView1').find('td input').toggleClass("highlight", false);
                        sumappo_amt = 0;
                        summax_amt = 0;
                        dsMain.SetItem(0, "all_check", 0);
                    }
                }

//                sumappo_amt -= tr_approve_amt
//                summax_amt -= tr_max_payamt

                dsSum.SetItem(0, "sumapprove_amt", sumappo_amt);
                dsSum.SetItem(0, "sum_maxpayamt", summax_amt);
            } else if (c == "moneytype_code") {
                if (v == "CSH") {
                    dsMain.SetItem(0, "trtype_code", '');
                    dsMain.GetElement(0, "trtype_code").style.background = "#CCCCCC";
                    dsMain.GetElement(0, "trtype_code").readOnly = true;
                    dsMain.GetElement(0, "trtype_code").disabled = true;
                    dsMain.SetItem(0, "depttype_code", '');
                    dsMain.GetElement(0, "depttype_code").style.background = "#CCCCCC";
                    dsMain.GetElement(0, "depttype_code").readOnly = true;
                    dsMain.GetElement(0, "depttype_code").disabled = true;
                } else if (v == "TRN") {
                    dsMain.SetItem(0, "trtype_code", '');
                    dsMain.GetElement(0, "trtype_code").style.background = "#FFFFFF";
                    dsMain.GetElement(0, "trtype_code").readOnly = false;
                    dsMain.GetElement(0, "trtype_code").disabled = false;
                    dsMain.SetItem(0, "depttype_code", '');
                    dsMain.GetElement(0, "depttype_code").style.background = "#FFFFFF";
                    dsMain.GetElement(0, "depttype_code").readOnly = false;
                    dsMain.GetElement(0, "depttype_code").disabled = false;
                } else {
                    dsMain.SetItem(0, "trtype_code", '');
                    dsMain.GetElement(0, "trtype_code").style.background = "#FFFFFF";
                    dsMain.GetElement(0, "trtype_code").readOnly = false;
                    dsMain.GetElement(0, "trtype_code").disabled = false;
                    dsMain.SetItem(0, "depttype_code", '');
                    dsMain.GetElement(0, "depttype_code").style.background = "#CCCCCC";
                    dsMain.GetElement(0, "depttype_code").readOnly = true;
                    dsMain.GetElement(0, "depttype_code").disabled = true;
                }
            } else if (c == "trtype_code") {
                var moneytype_code = dsMain.GetItem(0, "moneytype_code");
                if (v == "DEP" && moneytype_code != "TRN") {
                    alert("บัญชีเงินฝาก ใช้สำหรับประเภทเงินโอนภายในสหกรณ์เท่านั้น");
                    dsMain.SetItem(0, "trtype_code", '');
                    return;
                }
            }
            else if (c == "process_month") {
                SetCaldate();
            }
            else if (c == "assisttype_code") {
                PostSeleteData();
            } 
        }
        $(document).ready(function () {

            var sumappo_amt = 0;
            var summax_amt = 0;
            var approve_amt = 0;
            var max_payamt = 0;
            var account = "";
            $(".choose_flag").change(function () {
                dsMain.SetItem(0, "all_check", 0);
                var expense_accid = $(this).closest('tr').find('td .expense_accid').val()
                account = $(this).closest('tr').find('td .member_no').val()
                var trtype_code = dsMain.GetItem(0, "trtype_code");
                if (trtype_code === "DEP" && expense_accid != "" || trtype_code != "DEP") {
                    sumappo_amt = 0;
                    summax_amt = 0;

                    $('#ctl00_ContentPlace_GridView1 > tbody  > tr').each(function () {
                        var ischecked = $(this).find("td:eq(0)  input:checkbox")[0].checked;
                        if (ischecked) {
                            var cksumappo_amt = $(this).find("td:eq(7) input").val()
                            var cksummax_amt = $(this).find("td:eq(8) input").val()
                            sumappo_amt += Number(cksumappo_amt.replace(/[^0-9.-]+/g, ""));
                            summax_amt += Number(cksummax_amt.replace(/[^0-9.-]+/g, ""));
                        }
                    });


                    if ($(this).closest('tr').find('td input[type="checkbox"]').is(':checked') === true) {
                        $(this).closest('tr').find('td input').toggleClass("highlight", this.checked);
                        approve_amt = Number($(this).closest('tr').find('td .ap_amt').val().replace(/[^0-9.-]+/g, ""));
                        max_payamt = Number($(this).closest('tr').find('td .max_amt').val().replace(/[^0-9.-]+/g, ""));
                        approve_amt = fncToFixed(approve_amt, 2);
                        sumappo_amt = fncToFixed(sumappo_amt, 2);
                        max_payamt = fncToFixed(max_payamt, 2);
                        summax_amt = fncToFixed(summax_amt, 2);
                        //                        sumappo_amt += approve_amt;
                        //                        summax_amt += max_payamt;

                    }
                    else {
                        $(this).closest('tr').find('td input').removeClass("highlight");
                        approve_amt = Number($(this).closest('tr').find('td .ap_amt').val().replace(/[^0-9.-]+/g, ""));
                        max_payamt = Number($(this).closest('tr').find('td .max_amt').val().replace(/[^0-9.-]+/g, ""));
                        approve_amt = fncToFixed(approve_amt, 2);
                        sumappo_amt = fncToFixed(sumappo_amt, 2);
                        max_payamt = fncToFixed(max_payamt, 2);
                        summax_amt = fncToFixed(summax_amt, 2);
                        //                        sumappo_amt -= approve_amt;
                        //                        summax_amt -= max_payamt;
                    }
                    Gcoop.GetEl("Hd_setsum").value = 1;
                    dsSum.SetItem(0, "sumapprove_amt", sumappo_amt);
                    dsSum.SetItem(0, "sum_maxpayamt", summax_amt);
                } else {
                    $(this).closest('tr').find('td input[type="checkbox"]').prop("checked", false)
                    alert("ทะเบียน " + account + " ไม่มีเลขบัญชี กรุณาตรวจสอบ");
                }
            });

            $('.number').text(function () {
                var str = $(this).html() + '';
                x = str.split('.');
                x1 = x[0]; x2 = x.length > 1 ? '.' + x[1] : '';
                var rgx = /(\d+)(\d{3})/;
                while (rgx.test(x1)) {
                    x1 = x1.replace(rgx, '$1' + ',' + '$2');
                }
                $(this).html(x1 + x2);
            });

        });
     
    </script>
    <style>
     .highlight {
          background-color:PaleGreen !important;
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
   
    <uc1:DsMain ID="dsMain" runat="server" />
    <%--<uc2:DsList ID="dsList" runat="server" />--%>
    <br />
                         <%-- <uc2:DsList ID="dsList" runat="server" />--%>

  <table  cellspacing="0" rules="all" class="TableHeader" border="1" style="border-collapse: collapse; width:1113px">
            <tr>
                
                <th width="3%">
                </th>
                
                <th width="8%">
                    ทะเบียน
                </th>
                <th width="18%">
                    ชื่อ สกุล
                </th>
                <th width="10%">
                    วันที่เป็นสมาชิก
                </th>
                <th width="7%">
                    อายุสมาชิก
                </th>
                <th width="7%">
                    อายุ
                </th>
                <th width="7%">
                    งวดที่จ่าย
                </th>
                <th width="15%">
                    จำนวนเงินตามสิทธิ์
                </th>
                <th width="10%">
                    จำนวนเงิน
                </th>
                <th width="15%">
                    เลขบัญชี
                </th>
            </tr>
        </table>
        <div style="overflow-y: scroll; overflow-x: hidden; height: 450px; width: 1113px;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="DataSourceRepeater"
              Width="1113px" Height="450px" ShowHeader="false"  >

             <Columns>    
                <asp:TemplateField ItemStyle-Width="3%" HeaderText="">
                    <ItemTemplate>
                        <center>
                            <asp:CheckBox ID="choose_flag" class="choose_flag"  ClientIDMode="static" runat="server"  Checked='<%# Eval("choose_flag") != DBNull.Value ? bool.Parse(Eval("choose_flag").ToString()) : false %>'
                                Enable='<%# !bool.Parse(Eval("choose_flag").ToString()) %>' />
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="ทะเบียน" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:TextBox ID="member_no" runat="server" class="member_no" Text='<%# Bind("member_no") %>' Style="text-align: center" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ชื่อ สกุล" ItemStyle-Width="18%">
                    <ItemTemplate>
                        <asp:TextBox ID="full_name" runat="server" Text='<%# Bind("full_name") %>' Style="text-align: left" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField  HeaderText="วันที่เป็นสมาชิก" ItemStyle-Width="10%">
                   <ItemTemplate>
                        <asp:TextBox ID="member_date" runat="server" Text='<%#Eval("member_date2","{0:dd/MM/yyyy}")%>'
                            Style="text-align: center" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="อายุสมาชิก" ItemStyle-Width="7%">
                    <ItemTemplate>
                        <asp:TextBox ID="work_age" runat="server" Text='<%# Bind("work_age") %>' Style="text-align: center" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="อายุ" ItemStyle-Width="7%">
                    <ItemTemplate>
                        <asp:TextBox ID="mem_age" runat="server" Text='<%# Bind("mem_age") %>' Style="text-align: center" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="งวดที่จ่าย" ItemStyle-Width="7%">
                    <ItemTemplate>
                        <asp:TextBox ID="last_periodpay" runat="server" Text='<%# Bind("last_periodpay") %>' Style="text-align: center" ReadOnly="true" ToolTip="###,###,##0"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="จำนวนเงินตามสิทธิ์" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:TextBox ID="approve_amt" runat="server" class="ap_amt"  Text='<%# Eval("approve_amt","{0:n2}") %>'  Style="text-align: right" ReadOnly="true" ToolTip="###,###,##0.00"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="จำนวนเงิน" ItemStyle-Width="10%">
                    <ItemTemplate>
                        <asp:TextBox ID="max_payamt" runat="server" class="max_amt number"  Text='<%# Eval("max_payamt","{0:n2}") %>'  Style="text-align: right" ReadOnly="true" ToolTip="###,###,##0.00"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="เลขบัญชี" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:TextBox ID="expense_accid" class="expense_accid" runat="server" Text='<%# Bind("expense_accid") %>' Style="text-align: center" ReadOnly="true" ></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
         <uc3:DsSum ID="dsSum" runat="server" />
    <asp:HiddenField ID="Hd_rowcount" runat="server" />
    <asp:HiddenField ID="Hd_setsum" runat="server" />
    <asp:HiddenField ID="Hd_type_code" runat="server" />
</asp:Content>
