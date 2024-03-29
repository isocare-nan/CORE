$PBExportHeader$n_cst_finance_service.sru
$PBExportComments$Generated Web service object
forward
global type n_cst_finance_service from NonVisualObject
end type
end forward

/// <summary> Generated Web service object
/// </summary>
global type n_cst_finance_service from NonVisualObject
end type
global n_cst_finance_service n_cst_finance_service

type variables
public:
//	ประกาศเพื่อใช้ในการโยนค่า error ในกรณีที่มีปัญหา
Exception	ithw_exception

protected:
n_ds	ids_constant ,idc_printchq , ids_cancelslip , ids_finslip , ids_payinslipdet , ids_payclr
n_cst_datetimeservice 	inv_datetime
n_cst_doccontrolservice	inv_docservice
n_cst_stringservice		inv_string
n_cst_dbconnectservice	inv_db
n_cst_calendarservice	inv_calendar_srv
n_cst_printservice		inv_print_srv
n_cst_dwxmlieservice	inv_dwxmliesrv
//n_cst_deposit_service		inv_deptsrv

transaction		itr_sqlca

constant integer	ITEM_MODE_RETURN		=	16
constant integer	ITEM_MODE_CLOSE		=	14
constant integer	ITEM_MODE_RECIEVE	=	15
constant integer	ITEM_MODE_OPEN		=	11

string is_errormessage = ""
string		is_itemtype, is_name, is_mode , is_coopcontrl
string		is_receiptcode// ='FNRECEIPTNO'
string      is_payslipcode//='FNPAYSLIPNO' 
string      is_slipdocno//  = "FNRECEIVENO" 
boolean	ib_cansave
integer	ii_seqno , ii_pay_recv , ii_slipmode
long		il_seq_no , il_status
integer	success = 1 , ii_reprint 
integer	failure = -1
dec{2}	idc_mainslip , idc_sumsplit
end variables

forward prototypes
public function string of_defaultaccid (string as_moneytype) throws Exception
public function integer of_settrans (n_cst_dbconnectservice anv_conn) throws Exception
public function integer of_postchqmas (string as_chqbook_xml) throws Exception
public function integer of_fin_posttobank (string as_branch, string as_entry_id, datetime adtm_wdate, string as_machine, string as_item_xmt) throws Exception
public function integer of_init_chq_bookno (ref string as_chqbook_xml) throws Exception
public function integer of_fincashcontrol_process (string as_fincashcontrol_xml, string as_machined, string as_appname) throws Exception
public function integer of_finquery (string as_appname, string as_user_xml, ref string as_userdetail_xml, ref string as_recv_xml, ref string as_pay_xml) throws Exception
public function integer of_init_payrecv_member (ref string as_main_xml) throws Exception
public function integer of_init_bankaccount_open (ref n_ds ads_data) throws Exception
public function integer of_postslipbank (string as_main_xml) throws Exception
public function integer of_init_posttobank (string as_branch, datetime adtm_wdate, ref string as_xmlinfo) throws Exception
public function integer of_init_bankaccount_slip (ref string as_main_xml) throws Exception
public function integer of_init_fincashcontrol_user (ref string as_fincashcontrol_xml, ref string as_fullname) throws Exception
public function integer of_chkcardtax (string as_cardtax, string as_memb_no) throws Exception
private function integer of_chk_cansave (ref n_ds ads_data) throws Exception
private function integer of_chk_item_teller (long al_item_type, long al_status, string as_user) throws Exception
private function integer of_chkslip_completefill (n_ds ads_main, n_ds ads_item) throws Exception
private function integer of_chkslipbank_complete (n_ds ads_data) throws Exception
private function integer of_clear_docno (string as_branch_id) throws Exception
private function any of_getattribconstant (string as_attribconstant, string as_type)
private function integer of_is_close_teller (string as_entry_id, datetime adtm_entry, string as_branch_id) throws Exception
private function integer of_postchq (ref n_ds ads_data) throws Exception
private function integer of_postrecvbookchqstm (n_ds ads_chq) throws Exception
private function integer of_posttobank (n_ds ads_data) throws Exception
private function integer of_slipbank_other (n_ds ads_data) throws Exception
private function decimal of_teller_balance (string as_branch, string as_entry_id, datetime adtm_wdate) throws Exception
public function integer of_init_bankaccount_else (datetime adtm_wdate, ref n_ds ads_data) throws Exception
public function integer of_chkchqfullfill (string as_branch, n_ds ads_chqspilt, ref n_ds ads_chqlist) throws Exception
public function integer of_init_paychq_split (string as_branch, datetime adtm_wdate, ref string as_chqcond_xml, ref string as_cutbank_xml, ref string as_chqtype_xml, ref string as_chqlist_xml) throws Exception
public function integer of_setcolumndatamodified (ref n_ds ads_data)
public function integer of_close_day (string as_appname, string as_closeday_xml, string as_chqwait_xml) throws Exception
public function integer of_postfincontrol (n_ds ads_cashmas, string as_machine_id) throws Exception
private function integer of_chkslip_completechq (n_ds ads_main) throws Exception
public function integer of_init_fincontact (ref string as_contact_xml) throws Exception
public function integer of_postfincontact (string as_contact_xml, string as_action) throws Exception
public function integer of_postcancelposttobank (string as_branch, string as_entry, datetime adtm_wdate, string as_machine, string as_banklist_xml) throws Exception
private function string of_cnv_totdate_cheque (datetime adtm_datetime)
private function string of_cnv_totmsdate (datetime adtm_datetime)
public function integer of_caltax (ref string as_main_xml, ref string as_taxdet_xml) throws Exception
private function string of_getmembername (string as_membno)
public subroutine of_init () throws Exception
private function integer of_postpayoutto_finclr (string as_slipno, string as_branch, n_ds ads_data, integer ai_seqno) throws Exception
private function integer of_init_setitembank (string as_branch, datetime adtm_wdate) throws Exception
public function integer of_postupdatebankaccount (string as_bank_xml) throws Exception
public function integer of_init_postotherto_fin (ref string as_memb_xml, ref string as_slipmain_xml, ref string as_slipcancel_xml, string as_appname) throws Exception
public function integer of_postpaylon (string as_slipmain_xml, string as_slipdet_xml) throws Exception
public function integer of_postpayshr (string as_slipmain_xml, string as_slipdet_xml) throws Exception
public function integer of_postcancelpayout (string as_payout_no, string as_branch_id, string as_entry_id, datetime adtm_entry_date) throws Exception
public function integer of_postcancelpayin (string as_payin_no, string as_branch_id, string as_entry_id, datetime adtm_entry_date) throws Exception
public function integer of_postcanceldeptslip (string as_deptslip_no, string as_branch_id, string as_entry_id, datetime adtm_entry_date) throws Exception
private function string of_readnumber (string as_number, boolean ab_posname) throws Exception
private function string of_readthaibaht (string as_money) throws Exception
private function integer of_posttaxatpay (n_ds ads_main, n_ds ads_det, string as_taxdetail_xml) throws Exception
private function integer of_postpaychqstm_split (string as_branch, string as_entry, string as_machine, datetime adtm_wdate, string as_accno, string as_chqtype, integer ai_chequestatus, n_ds ads_chqcond, n_ds ads_chqlist, n_ds ads_chqspilt) throws Exception
private function integer of_importstring_xml (ref n_ds ads_data, string as_data_xml) throws Exception
private function string of_err_generate_import_xml (integer ai_error) throws Exception
public function integer of_retrieveformatchq (string as_branch, string as_bankcode, integer ai_chqtype, integer ai_printtype, ref string as_format_xml) throws Exception
public function integer of_retrievelistformatchq (string as_branch, ref string as_formatlist_xml) throws Exception
public function integer of_postrecvshrlon (string as_slipmain_xml, string as_slipdet_xml, ref string as_receiveno) throws Exception
public function string of_init_printfinstatus (string as_branch, datetime adtm_wdate) throws Exception
public function integer of_postfinstatusexport (string as_coopname, string as_mainxml, string as_path) throws Exception
private function integer of_postbridgechq_chqslipt (string as_branch, string as_referslip, string as_bank, string as_bankbranch, string as_chqbookno, string as_chqno, integer ai_seqno) throws Exception
private function integer of_postpaychqstm_split_n (string as_branch, string as_entry, string as_machine, datetime adtm_wdate, string as_accno, string as_chqtype, integer ai_chequestatus, n_ds ads_chqcond, n_ds ads_chqlist, n_ds ads_chqspilt) throws Exception
public function integer of_init_openday (string as_coop_id, string as_entry_id, datetime adtm_wdate, string as_machine_id, ref string as_startday_info, ref string as_errmessage) throws Exception
private function decimal of_getbalbegin (datetime adtm_date, ref decimal adc_chqbfamt, string as_coop_id) throws Exception
private function integer of_is_open_day (string as_coop_id, datetime adtm_wdate) throws Exception
public function integer of_retrievebankaccount (string as_coopid, ref string as_bank_xml, ref string as_bankstm_xml) throws Exception
public function integer of_open_day (string as_openday_xml) throws Exception
private function integer of_banktracking (string as_coop_id, datetime adtm_wdate) throws Exception
public function integer of_init_fincashcontrol (string as_coop_id, datetime adtm_wdate, string as_permis_id, ref string as_fincashctl_info) throws Exception
private function integer of_is_close_day (string as_coop_id, string as_appname, datetime adtm_today) throws Exception
public function integer of_retrievefinslipdet (string as_coopid, string as_slipno, ref string as_slipdet_xml) throws Exception
public function integer of_postcancelslip (string as_coopid, string as_entry_id, string as_head_xml, string as_cancle_xml) throws Exception
private function integer of_postshrlonto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, ref string as_cancelslipno) throws Exception
private function integer of_postshrswdto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, ref string as_cancelslipno) throws Exception
private function integer of_postdeptto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, ref string as_cancelslipno) throws Exception
private function integer of_postcancelotherto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate) throws Exception
public function string of_postotherto_fin (string as_coopid, string as_entry, datetime adtm_wdate, string as_appname, string as_main_xml, string as_itemdet_xml, string as_cancelslip_xml) throws Exception
private function integer of_postlonlrtto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, ref string as_cancelslipno) throws Exception
public function integer of_itemcaltax (string as_coopid, integer ai_recv_pay, integer ai_calvat, integer ai_taxcode, decimal adc_itemamt, ref decimal adc_taxamt, ref decimal adc_itemamt_net, ref decimal adc_vatamt) throws Exception
public function integer of_getaddress (ref string as_taxaddr, ref string as_taxid, string as_coopid, string as_memberno, integer ai_memberflag)
public function string of_payslip (string as_main_xml, string as_item_xml, string as_taxdetail_xml, string as_appname) throws Exception
private function integer of_is_open_teller (string as_coop_id, string as_entry_id, datetime adtm_entry) throws Exception
private function string of_get_lastslip_docno (string as_doccode) throws Exception
private function integer of_processfinchk (string as_coopid, string as_entry_id, datetime adtm_wdate, ref string as_err) throws Exception
private function integer of_getshrlon (string as_coopid, string as_member, decimal adc_accuint, ref decimal adc_share, ref decimal adc_emer, ref decimal adc_norm, ref decimal adc_extra, ref decimal adc_sharespx) throws Exception
public function integer of_init_chqlistfrom_slip (string as_coopid, datetime adtm_wdate, ref string as_chqcond_xml, ref string as_cutbank_xml, ref string as_chqtype_xml, ref string as_chqlist_xml) throws Exception
public function integer of_retrievechqfromslip (string as_coopid, datetime adtm_wdate, ref string as_chqlist_xml) throws Exception
public function integer of_init_chqnoandbank (string as_coopid, string as_bank, string as_bankbranch, string as_chqbookno, ref string as_accno, ref string as_startchqno) throws Exception
private function integer of_updatetofrom_accid (string as_coopid, datetime adtm_wdate, datetime adtm_chqdate, string as_refslipno, string as_tofromaccid, string as_fromsystem, integer ai_index) throws Exception
private function integer of_postbridgechq (string as_coopid, string as_referslip, string as_bank, string as_bankbranch, string as_chqbookno, string as_chqno, integer ai_seqno) throws Exception
public function integer of_posttobank (string as_coopid, string as_entryid, datetime adtm_wdate, string as_machine, integer ai_seqno) throws Exception
private function integer of_posttobank (string as_coopid, string as_entry_id, datetime adtm_wdate, string as_machine, string as_bankaccno, string as_bank, string as_bankbranch, decimal adc_itemamt, integer ai_waycut) throws Exception
public function integer of_postpaychq_split (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_cond_xml, string as_bankcut_xml, string as_chqtype_xml, string as_chqlist_xml, string as_chqsplit_xml, string as_formset) throws Exception
public function integer of_postprintpreviewchq (string as_coopid, string as_bank, integer ai_chqsize, string as_prnttype, string as_formset) throws Exception
public function integer of_postpaychq_apvloancbt (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_main_xml, string as_payoutslip, string as_formset) throws Exception
public function integer of_retrievecancelchq (string as_coopid, string as_cond_xml, ref string as_chqcancel_xml) throws Exception
public function integer of_postcancelchq (string as_coopid, datetime adtm_wdate, string as_cancleid, string as_machine, string as_cancellist_xml) throws Exception
private function integer of_postnewchq (string as_coopid, string as_chqno, string as_chqbookno, string as_bankchq, string as_bankbranchchq) throws Exception
private function integer of_postreturnslip (string as_coopid, string as_referslip) throws Exception
public function integer of_postbridgechqcancel (string as_coopid, string as_referslip, string as_bank, string as_bankbranch, string as_chqbookno, string as_chqno, integer ai_seqno) throws Exception
protected function integer of_slipbank_open (n_ds ads_data) throws Exception
public function integer of_retrieve_cancleslip (string as_coopid, string as_head_xml, ref string as_itemlist_xml) throws Exception
public function integer of_retrievechangchqdetail (string as_coopid, string as_chqno, string as_bookno, string as_bank, string as_bankbranch, integer ai_seqno, ref string as_chqdetail_xml)
public function integer of_retrievechangechqstatus (string as_coopid, ref string as_chqlist_xml) throws Exception
public function integer of_postchangedstatuschq (string as_coopid, string as_entry_id, datetime adtm_wdate, string as_machine, string as_chqno, string as_chqbookno, string as_bank, string as_bankbranch, integer as_chqseq_no, integer ai_chqstatus) throws Exception
public function integer of_retrievepaychqlist (string as_coopid, datetime adtm_wdate, ref string as_chqlist_xml) throws Exception
public function integer of_init_paychq (string as_coopid, datetime adtm_wdate, ref string as_main_xml, ref string as_chqlist_xml) throws Exception
private function string of_setchqlistdetailslip (string as_coopid, string as_entry, datetime adtm_wdate, string as_machince, n_ds ads_main, n_ds ads_chqlist) throws Exception
public function integer of_postcancelsendchq (string as_coopid, string as_chqno, string as_bank, string as_bankbranch, integer ai_seqno) throws Exception
public function integer of_init_sendchq (string as_coopid, string as_entry, datetime adtm_wdate, ref string as_sendchq_xml) throws Exception
public function integer of_postsavesendchq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_sendchq_xml, string as_waitchq_xml, string as_sendchqacc_xml, integer ai_accknow) throws Exception
private function integer of_postsendchq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, n_ds ads_data, n_ds ads_bank) throws Exception
private function integer of_postwaitchq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, n_ds ads_data, integer ai_accknow) throws Exception
private function integer of_posttobank (string as_coopid, string as_entry_id, datetime adtm_wdate, string as_machine, string as_accid, decimal adc_sumitemamt, integer ai_waycut) throws Exception
public function integer of_retrievecancel_sendchq (string as_coopid, datetime adtm_wdate, string as_bank_xml, ref string as_cancellist) throws Exception
public function integer of_postcancel_sendchq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_bank_xml, string as_cancellist_xml) throws Exception
public function integer of_retrievereprintreceipt (string as_coopid, string as_cond_xml, ref string as_list_xml) throws Exception
public function integer of_postreprintreceipt (string as_coopid, datetime adtm_wdate, string as_list_xml, string as_formset, ref string as_message) throws Exception
public function integer of_postprintslip (string as_coopid, string as_slipno, string as_formset) throws Exception
public function integer of_retrievereprintpayslip (string as_coopid, string as_cond_xml, ref string as_slip_xml) throws Exception
public function integer of_postreprintpayslip (string as_coopid, datetime adtm_wdate, string as_list_xml, string as_formset, ref string as_message) throws Exception
public function integer of_retrievetaxpay (string as_coopid, string as_main_xml, ref string as_list_xml) throws Exception
public function integer of_postreprinttaxpay (string as_coopid, datetime adtm_wdate, string as_slipno, integer ai_topay, integer ai_keep, integer ai_formcoop, string as_formset) throws Exception
public function integer of_postprinttaxpay (string as_coopid, string as_slipno, string as_formset) throws Exception
public function integer of_init_close_day (string as_coopid, string as_entry_id, datetime adtm_wdate, string as_appname, ref string as_closeday_xml, ref string as_chqwait_xml) throws Exception
public function integer of_retrievechq (string as_coopid, datetime adtm_wdate) throws Exception
private function integer of_is_posttobank (string as_coopid, datetime adtm_wdate) throws Exception
private function integer of_is_open_allteller (string as_coopid, datetime adtm_wdate) throws Exception
private function integer of_sendchqall (string as_coopid, datetime adtm_wdate) throws Exception
private function integer of_trackingbank (string as_coopid, datetime adtm_wdate) throws Exception
private function integer of_updatechqin_safe (string as_coopid, datetime adtm_wdate, n_ds ads_data) throws Exception
private function integer of_updateclosestatus (string as_coopid, string as_entry_id, string as_appname, datetime adtm_wdate) throws Exception
private function integer of_is_recvpay_pending (string as_coopid, datetime adtm_wdate) throws Exception
public function integer of_retrievereprintchq (string as_coopid, string as_retreive_xml, ref string as_chqlist_xml) throws Exception
private function integer of_updatetofrom_accid_chqslipt (string as_coopid, datetime adtm_wdate, datetime adtm_chqdate, string as_refslipno, string as_tofromaccid, string as_fromsystem, integer ai_index) throws Exception
public function integer of_postprintslipcashctrl (string as_coopid, string as_coopname, string as_apprv_id, string as_username, datetime adtm_workdate, integer ai_slipcastseq_no, string as_formset) throws Exception
private function integer of_setchqposition (ref n_ds ads_data, string as_coopid, string as_bank, integer an_chqsize, string as_prntype, integer ai_printdate, integer ai_payee_flag) throws Exception
public function integer of_init_payrecv_slip (string as_coop_id, string as_entry_id, string as_machine, datetime adtm_wdate, integer as_recvpay_status, ref string as_slipmain_xml) throws Exception
public function integer of_init_paychq_apvloancbt (string as_coopid, datetime adtm_wdate, ref string as_main_xml, ref string as_chqlist_xml, string as_cashtype) throws Exception
public function integer of_retrievechqfrom_apvloancbt (string as_coopid, datetime adtm_wdate, string as_bankcode, string as_lngroupcode, ref string as_chqlist_xml, string as_cashtype) throws Exception
public function integer of_init_paychq_manual (string as_coopid, datetime adtm_wdate, ref string as_main_xml) throws Exception
public function integer of_postdeptslip_tofin (string as_coopid, string as_member_no, string as_deptslip_no, datetime adtm_operate, string as_entryid) throws Exception
private function integer of_postpaychqstm_apvloan (string as_coopid, string as_entry, string as_machine, datetime adtm_wdate, n_ds ads_chqcond, string as_accno, string as_chqtype, integer ai_chequestatus, n_ds ads_chqlist) throws Exception
private function string of_setchqlistdetailslip_apvloancbt (string as_coopid, string as_entry, datetime adtm_wdate, string as_machince, n_ds ads_main, n_ds ads_chqlist) throws Exception
public function integer of_postprocessotherto_fin (string as_coopid, string as_entryid, datetime adtm_wdate, string as_machineid, string as_procxml) throws Exception
public function string of_postpaychq_fromslip (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_cond_xml, string as_cutbank_xml, string as_chqtype_xml, string as_chqllist_xml, string as_formset) throws Exception
public function string of_postreprintchq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_formset, string as_cond_xml, string as_retreive_xml, string as_chqlist_xml) throws Exception
private function integer of_settolebelchq (ref n_ds adw_data, string as_cheque_no, string as_chequebook_no, string as_bank_code, string as_bank_branch, integer ai_seq_no, integer ai_printdate, integer ai_printpayee, integer ai_printkiller) throws Exception
public function string of_postpaychq_manual (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_main_xml, string as_formset) throws Exception
public function string of_postpaychq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_main_xml, string as_slipno, string as_formset) throws Exception
public function integer of_retrievechqfromapvloan (string as_coopcltr, datetime adtm_wdate, string as_cashtype, ref string as_chqlist_xml, string as_bankcode, string as_bankbranch) throws Exception
public function string of_postpaychq_fromapvloan (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_cond_xml, string as_cutbank_xml, string as_chqtype_xml, string as_payoutslip, string as_formset) throws Exception
public function string of_init_payrcv_listslipcmf (datetime adtm_workdate, string as_coopid, string as_refsys, integer ai_payrecv)
public function integer of_postshrlonto_fincfm (string as_slipno, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, ref string as_cancelslipno, integer ai_status) throws Exception
public function integer of_isexistfinslip (string as_slipno, string as_coop_id)
public function integer of_init_payrecv_slipcfm (string as_coopid, string as_slipno, string as_entryid, string as_machine, datetime adtm_wdate, ref string as_xmlfinslip, ref string as_xmlfinslipdet) throws Exception
public function integer of_postlonlwdto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, ref string as_cancelslipno) throws Exception
public function integer of_postcash (str_slipinfo astr_slipinfo, integer as_row, string as_entryid) throws Exception
private function integer of_postdeptto_finfee (string as_slipno, string as_coopid, string as_entry, datetime adtm_wdate) throws Exception
public function integer of_init_payrecv_slipdlg (string as_coopid, string as_slipno, string as_entryid, string as_machine, datetime adtm_wdate, ref string as_xmlfinslip, ref string as_xmlfinslipdet) throws Exception
public function string of_payslip_pea (string as_main_xml, string as_item_xml, string as_taxdetail_xml, string as_appname) throws Exception
public function integer of_postetcto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_cancelslipno) throws Exception
public function string of_payslip_pia (string as_main_xml, string as_item_xml, string as_taxdetail_xml, string as_appname) throws Exception
private function integer of_postpaychqstm (string as_coopid, string as_entry, string as_machine, datetime adtm_wdate, n_ds ads_chqcond, string as_accno, string as_chqtype, integer ai_chequestatus, n_ds ads_chqlist) throws Exception
public function integer of_postyrto_fin (n_ds ads_data)
public function integer of_postdivto_fin (datetime adtm_date, string as_coopid) throws Exception
public function integer of_retrievereprintpayslip_ir (string as_coopid, string as_cond_xml, ref string as_slip_xml) throws Exception
end prototypes

public function string of_defaultaccid (string as_moneytype) throws Exception;
string	ls_accid

choose case as_moneytype
	case "CSH"
		ls_accid		= trim( string(this.of_getattribconstant( "cash_accid" , "string" )) )
		
	case "CBT", "CHQ", "TRN", "CBO", "TBK", "DRF", "BEX", "KOT", "SAL"
		ls_accid		= trim( string(this.of_getattribconstant( "bankdefault_accid" , "string" )) )

	case else
		ls_accid		= ""
		
end choose

ls_accid		= trim( ls_accid )
if isnull( ls_accid ) then ls_accid = ""

return ls_accid
end function

public function integer of_settrans (n_cst_dbconnectservice anv_conn) throws Exception;itr_sqlca = anv_conn.itr_dbconnection
inv_db = anv_conn




return	 1
end function

public function integer of_postchqmas (string as_chqbook_xml) throws Exception;string		ls_chqno, ls_bankcode, ls_branch, ls_err, ls_start, ls_end, ls_coopid
integer		li_found, li_index, li_amt, li_rc

n_ds		lds_chqbook

lds_chqbook	= create		n_ds
lds_chqbook	.dataobject = "d_recv_chequebook"
lds_chqbook	.settransobject( itr_sqlca )

if not isnull( as_chqbook_xml ) and trim( as_chqbook_xml ) <> "" then
	this.of_importstring_xml( lds_chqbook , as_chqbook_xml )
else
	destroy lds_chqbook
	ithw_exception.text	= "ไม่มีข้อมูลลงทะเบียน ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_chqbook.accepttext( )

ls_err				= ""
li_index			= 0
ls_chqno			= trim( lds_chqbook.object.chequebook_no[1] )
ls_bankcode		= trim( lds_chqbook.object.bank_code[1] )
ls_branch		= trim( lds_chqbook.object.bank_branch[1] )
ls_start			= trim( lds_chqbook.object.start_chqno[1] )
ls_end			= trim( lds_chqbook.object.end_chqno[1] )
li_amt				= lds_chqbook.object.chqslip_amt[1]
ls_coopid		= lds_chqbook.object.coop_id[1] 

if isnull( ls_chqno ) then ls_chqno = ""
if isnull( ls_bankcode ) then ls_bankcode = ""
if isnull( ls_branch ) then ls_branch = ""
if isnull( ls_start ) then ls_start = ""
if isnull( ls_end ) then ls_end = ""
if isnull( li_amt ) then li_amt = 0

if ls_bankcode = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + "ธนาคาร~r~n"
end if

if ls_branch = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + "สาขาธนาคาร~r~n"
end if

if ls_chqno = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + "เล่มที่เช็ค~r~n"
end if

if ls_start = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + "เลขที่เช็คเริ่มต้น~r~n"
end if

if ls_end = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + "เลขที่เช็คสุดท้าย~r~n"
end if

if li_amt = 0 then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + "จำนวนเช็ค~r~n"
end if

if trim( ls_err ) <> "" then
	ithw_exception.text	= "ป้อนข้อมูลไม่สมบูรณ์~r~n"+ ls_err
	throw ithw_exception
end if
		
SELECT	count( chequebook_no )
INTO		:li_found
FROM	FINCHEQUEMAS
WHERE	(	CHEQUEBOOK_NO	= :ls_chqno  ) AND  
			(	BANK_CODE			= :ls_bankcode  ) AND  
			(	BANK_BRANCH		= :ls_branch  )   and
			(	coop_id		= :ls_coopid )
using		itr_sqlca	;
			
if li_found > 0 then
	destroy lds_chqbook
	ithw_exception.text	= "เล่มที่เช็คที่ป้อนมีอยู่แล้วในระบบ กรุณาตรวจสอบ"
	throw ithw_exception
end if

// กำหนดสถานะ update
lds_chqbook.setitemstatus( 1 , 0 ,Primary! , NewModified!)
li_rc	= lds_chqbook.update()

if li_rc <> 1 then
	ithw_exception.text	= "ไม่สามารถเพิ่มเล่มเช็คได้ " + lds_chqbook.of_geterrormessage( )
	destroy lds_chqbook
	rollback using	itr_sqlca ;
	throw ithw_exception
end if

// บันทึก statement เช็ค
li_rc	= this.of_postrecvbookchqstm( lds_chqbook )
destroy lds_chqbook
commit using	itr_sqlca	;
return success
end function

public function integer of_fin_posttobank (string as_branch, string as_entry_id, datetime adtm_wdate, string as_machine, string as_item_xmt) throws Exception;string	ls_accid, ls_accno
dec{2}	ldc_itemamt
integer	li_flag, li_itemflag,  li_found
long		ll_index, ll_seqno , ll_row

n_ds		lds_data

lds_data = create		n_ds
lds_data.dataobject = "d_fin_posttobank_list"

if not isnull( as_item_xmt ) and trim( as_item_xmt ) <> "" then
	this.of_importstring_xml( lds_data , as_item_xmt )
else
	ithw_exception.text	= "ไม่มีข้อมูลการผ่านรายการธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ll_row = lds_data.rowcount()

li_found		= lds_data.find( "select_flag = 1" , 1 , ll_row )

if li_found	< 1 then
	ithw_exception.text	= "ไม่มีข้อมูลการเลือกผ่านรายการธนาคาร"
	throw ithw_exception
end if

do while (li_found	> 0)
	li_itemflag		= lds_data.object.post_flag[li_found]; if isnull( li_itemflag ) then li_itemflag = 0
	ldc_itemamt		= lds_data.object.item_amt[li_found]
	ls_accid			= lds_data.object.account_id[li_found]
	ls_accno			= lds_data.object.account_no[li_found]
	ll_seqno			= lds_data.object.seq_no[li_found]
	li_flag				= lds_data.object.item_flag[li_found]

	if isnull( ldc_itemamt ) then ldc_itemamt = 0 
	
	if li_itemflag <> 0 then 
		li_found++
		if li_found > ll_row then
			exit 
		end if
		li_found		= lds_data.find( "select_flag = 1" , li_found , ll_row )
		continue
	end if
	
	// บันทึกรายการผ่านธนาคาร
	this.of_posttobank(as_branch , as_entry_id, adtm_wdate , as_machine, ls_accid, ldc_itemamt ,  li_flag )
	
	// ปรับปรุงรายการว่าทำรายการไปแล้ว
	UPDATE	FINITEMPOSTTOBANK
	SET		POST_FLAG		= 1  
	WHERE	( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
				( FINITEMPOSTTOBANK.SEQ_NO			= :ll_seqno) AND  
				( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch )   
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถปรับปรุง รายการเคลื่อนไหวธนาคารได้ " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	li_found++
	if li_found > ll_row then
		exit 
	end if
	li_found		= lds_data.find( "select_flag = 1" , li_found , ll_row )
loop

commit using itr_sqlca ;
return		success
end function

public function integer of_init_chq_bookno (ref string as_chqbook_xml) throws Exception;/***********************************************
<description>
	กำหนด XMLConfig การลงรับเล่มเช็ค กำหนดเลขที่เล่มเช็คเริ่มต้น
</description>

<arguments>
  	as_chqbook_xml	ข้อมูลการลงรับเล่มเช็ค , ส่งค่ากลับคืนเป็น xml
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_init_chq_bookno()
	
	Integer li_return 
	String ls_chqbook_xml
	
	li_return = lnv_finservice.of_init_chq_bookno( ls_chqbook_xml  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/9/2010 by PhaiWaan

</usage>
************************************************/

string	ls_bank, ls_bankbranch
string	ls_coopid, ls_CHEQUEBOOK_NO
n_ds		lds_chqbook

lds_chqbook	= create		n_ds
lds_chqbook	.dataobject = "d_recv_chequebook"


if not isnull( as_chqbook_xml ) and trim( as_chqbook_xml ) <> "" then
	this.of_importstring_xml( lds_chqbook , as_chqbook_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลลงทะเบียน ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if


ls_bank			= lds_chqbook.object.BANK_CODE[1]
ls_bankbranch	= lds_chqbook.object.BANK_BRANCH[1]
ls_coopid	= lds_chqbook.object.coop_id[1]

if isnull( ls_bank ) then ls_bank = ""
if isnull( ls_bankbranch ) then ls_bankbranch = ""

if ( ls_bank = "" ) or ( ls_bankbranch = "" ) then
	return Success
end if


SELECT	max( CHEQUEBOOK_NO )
INTO		:ls_CHEQUEBOOK_NO
FROM		FINCHEQUEMAS	
WHERE		( FINCHEQUEMAS.BANK_CODE		= :ls_bank ) AND  
			( FINCHEQUEMAS.BANK_BRANCH		= :ls_bankbranch) AND  
			( FINCHEQUEMAS.COOP_ID	= :ls_coopid ) 
using itr_sqlca ;
			
if isnull( ls_CHEQUEBOOK_NO ) or trim( ls_CHEQUEBOOK_NO ) = "" then ls_CHEQUEBOOK_NO = '0'

ls_CHEQUEBOOK_NO	= string( long( ls_CHEQUEBOOK_NO ) + 1 , '0000000000' )

lds_chqbook.object.chequebook_no[1]	= ls_CHEQUEBOOK_NO
lds_chqbook.object.start_chqno[1]	= "00000000"
lds_chqbook.object.end_chqno[1]	= "00000000"
lds_chqbook.object.book_status[1]	= 1 
lds_chqbook.object.chqslip_remain[1]	= 0
lds_chqbook.object.chqslip_amt[1]	= 0


as_chqbook_xml		= lds_chqbook.describe( "Datawindow.Data.XML" )

destroy( lds_chqbook ) 

return Success
end function

public function integer of_fincashcontrol_process (string as_fincashcontrol_xml, string as_machined, string as_appname) throws Exception;string		ls_name, ls_app, ls_approve, ls_tableuser, ls_itemtype_code, ls_coop_id, ls_remark, ls_cash_detail
string		ls_errprocess ,ls_dtmstr_format
datetime	ldtm_workdate, ldtm_datetime
long		ll_status, ll_seqno, ll_found
dec{5}		ldc_amount, ldc_balance
integer	li_itemtype , li_rc
n_ds	lds_data

lds_data 		= create	n_ds
lds_data.dataobject	=	"d_controlcash"
lds_data.settransobject( itr_sqlca )

if not isnull( as_fincashcontrol_xml ) and trim( as_fincashcontrol_xml ) <> "" then
	this.of_importstring_xml( lds_data , as_fincashcontrol_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลควบคุมเงินสด ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ls_coop_id			= lds_data.object.coop_id[1] 
ldtm_workdate		= lds_data.object.operate_date[1]

// ตรวจสอบข้อมูลการเปิดงานประจำวัน
li_rc	= this.of_is_open_day( ls_coop_id , ldtm_workdate )
if ( li_rc < 1 ) then
	ithw_exception.text	= "ยังไม่ได้ทำการเปิดงานประจำวัน ไม่สามารถทำการเปิดได้"
	throw ithw_exception
end if

// ตรวจสอบข้อมูลการปิดงานประจำวัน
li_rc	= this.of_is_close_day( ls_coop_id , as_appname ,  ldtm_workdate )
if ( li_rc = 1 ) then
	ithw_exception.text	= "ได้ทำการปิดสิ้นแล้ว ไม่สามารถทำรายการได้"
	throw ithw_exception
end if

// ตรวจสอบ กรอกข้อมูลครบรึไม่
this.of_chk_cansave( lds_data )


ls_name				= trim( lds_data.object.entry_id[1] )
ls_app				= lds_data.object.application[1]
ldtm_datetime		= datetime( date( ldtm_workdate ) , now( ) )
ls_approve			= trim( lds_data.object.permis_id[1] )
ls_cash_detail		= trim( lds_data.object.cash_detail[1] )

ldc_amount			= lds_data.object.operate_amt[1] 
ls_tableuser			= ls_name
ls_itemtype_code	= ""
li_itemtype				=	lds_data.object.item_type[1] 


//เปลี่ยนจาก where coop_id เป็น coop_control   edit by Mike 29/03/2016
select count(*)
into	:ll_found
from amsecusers
where user_name	= :ls_name
and coop_control = :is_coopcontrl
using	itr_sqlca ;

if isnull( ll_found ) or itr_sqlca.sqlcode <> 0 then ll_found = 0 

if ll_found < 1 then 
	ithw_exception.text	= "User Name : "  + ls_name + " ไม่มีในระบบ กรุณาตรวจสอบ" 
	throw ithw_exception
end if

if isnull( ldc_amount ) then ldc_amount = 0

SELECT	AMOUNT_BALANCE,	laststm_no
INTO		:ldc_balance,				:ll_seqno
FROM	FINTABLEUSERMASTER  
WHERE	( USER_NAME 		= :ls_name ) AND 
			( OPDATEWORK 	= :ldtm_workdate )  and
			( coop_id			= :ls_coop_id )
using	itr_sqlca ;

if itr_sqlca.sqlcode = -1 then
	ithw_exception.text	= "1.1 select balance from FINTABLEUSERMASTER ไม่ได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

select	max( SEQNO )
into		:ll_seqno
from		FINTABLEUSERDETAIL
where	( USER_NAME		= :ls_name ) and
			( OPDATEWORK	= :ldtm_workdate ) and
			( coop_id			= :ls_coop_id )
using	itr_sqlca ;

if itr_sqlca.sqlcode = -1 then
	ithw_exception.text	= "1.2 .Select Last seq_no FINTABLEUSERDETAIL ไม่สำเร็จ" + itr_sqlca.sqlerrtext 
	throw ithw_exception
end if


if isnull( ldc_balance ) then ldc_balance = 0

ll_found	=	1
ls_dtmstr_format	=  string(ldtm_datetime,"hh:mm:ss") + " : " + string (ldtm_datetime, "dd/mm/") + string( year( date(ldtm_datetime))+ 543) 
choose case li_itemtype
		
	// เปิดลิ้นชัก
	case ITEM_MODE_OPEN
		ls_remark				= ls_tableuser + " เปิดลิ้นชัก : "+ ls_dtmstr_format
		ls_errprocess			= " of_process_open " 
		ldc_balance	= ldc_balance + ldc_amount
		ll_status		=	11
		// หาว่าในวันนั้นได้มีการ insert row แล้วรึยัง 
		select	count( USER_NAME )
		into		:ll_found
		from		FINTABLEUSERMASTER
		where	( USER_NAME		= :ls_name ) and
					( OPDATEWORK	= :ldtm_workdate ) and
					( coop_id			= :ls_coop_id )
		using	itr_sqlca	;
		
		if isnull( ll_found ) then		ll_found = 0

	// ปิดลิ้นชัก	
	case ITEM_MODE_CLOSE
		ls_remark				= ls_tableuser + " ปิดลิ้นชัก : "+ ls_dtmstr_format
		ls_errprocess			= " of_process_close "
		ldc_balance	= ldc_balance - ldc_amount
		ll_status		=	14
	// รับเงินสดเพิ่ม
	case ITEM_MODE_RECIEVE
		ls_remark				= ls_tableuser + " เบิกเพิ่ม : " + ls_dtmstr_format
		ls_errprocess			= " of_process_receive "
		ldc_balance				= ldc_balance + ldc_amount
		ll_status		=	11
		
	// ส่งคืนเงินสด
	case ITEM_MODE_RETURN
		ls_remark				= ls_tableuser + " ส่งคืน " + ls_dtmstr_format
		ls_errprocess			= " of_process_return "
		ldc_balance				= ldc_balance - ldc_amount
		ll_status		=	11
		
end choose

if isnull( ll_seqno ) then	ll_seqno = 0

ll_seqno ++

// หากมีการ insert row แล้ว ให้ Update แต่ถ้ายัง ให้ insert ใหม่
if ll_found > 0 then
	update	FINTABLEUSERMASTER
	set		AMOUNT_BALANCE	= :ldc_balance,
				STATUS					= :ll_status,
				laststm_no				= :ll_seqno
	where	( USER_NAME			= :ls_name ) and
				( OPDATEWORK		= :ldtm_workdate )and
				( coop_id				= :ls_coop_id )
	using	itr_sqlca	;
	
	if itr_sqlca.sqlcode = -1 then
		ithw_exception.text	= "1.update FINTABLEUSERMASTER ไม่สำเร็จ " + ls_errprocess + itr_sqlca.sqlerrtext 
		throw ithw_exception
	end if
	
else
	INSERT INTO FINTABLEUSERMASTER 
		(	USER_NAME,	APPLICATION,			OPDATEWORK,			STATUS,				AMOUNT_BALANCE,
			laststm_no,		coop_id
		)  
	VALUES
		(	:ls_name,		:ls_app,					:ldtm_workdate,			:ll_status,				:ldc_balance,
			:ll_seqno,		:ls_coop_id
		)  
	using	itr_sqlca	;
	
	if itr_sqlca.sqlcode = -1 then
		ithw_exception.text	= "2.1.insert FINTABLEUSERMASTER ไม่สำเร็จ " + ls_errprocess + itr_sqlca.sqlerrtext 
		throw ithw_exception
	end if
end if

il_seq_no	= ll_seqno
il_status		= ll_status
is_name		= ls_name

INSERT INTO FINTABLEUSERDETAIL  
	(	USER_NAME,		APPLICATION,				OPDATEWORK,				SEQNO,						OPDATE,
		STATUS,			AMOUNT,						ITEMTYPE_CODE,			ITEMTYPE_DESC,		DOC_NO,
		MEMBER_NO,		AMOUNT_BALANCE,		MONEYTYPE_CODE,		MONEYTYPE_DESC,	NAMEAPPORVE,
		NAMETABLE,		ref_status,						coop_id,				cash_detail )  
VALUES
	(	:ls_name,			:ls_app,							:ldtm_workdate,			:ll_seqno,					:ldtm_datetime,
		:li_itemtype,			:ldc_amount,					:ls_itemtype_code,		:ls_remark,					'',
		'',						:ldc_balance,					'',								'',								:ls_approve,   
		:ls_tableuser,		1 ,								:ls_coop_id,					:ls_cash_detail
	)
using	itr_sqlca	;

if itr_sqlca.sqlcode = -1 then
	ithw_exception.text	= "2.2.insert FINTABLEUSERDETAIL ไม่สำเร็จ" + ls_errprocess + itr_sqlca.sqlerrtext 
	throw ithw_exception
end if

try
	this.of_postfincontrol(lds_data , as_machined)
	commit using itr_sqlca ;
catch (exception ex )
	rollback using itr_sqlca ;
end try
return integer(ll_seqno)
end function

public function integer of_finquery (string as_appname, string as_user_xml, ref string as_userdetail_xml, ref string as_recv_xml, ref string as_pay_xml) throws Exception;datetime		ldtm_date
string			ls_coopid, ls_userid, ls_idchk
integer			li_found , li_rc

n_ds	 lds_user , lds_userdetail , lds_revc , lds_pay

lds_user = create n_ds
lds_user.dataobject	= "d_finquery_userid"

lds_userdetail = create n_ds
lds_userdetail.dataobject	= "d_finquery_usedetail"
lds_userdetail.settrans( itr_sqlca )

lds_revc = create n_ds
lds_revc.dataobject	= "d_finquery_listrecv"
lds_revc.settrans( itr_sqlca )

lds_pay= create n_ds
lds_pay.dataobject	= "d_finquery_listpay"
lds_pay.settrans( itr_sqlca )

if not isnull( as_user_xml ) and trim( as_user_xml ) <> "" then
	this.of_importstring_xml( lds_user , as_user_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูล User ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ls_coopid		= lds_user.object.as_coopid[1]
ls_userid			= lds_user.object.as_userid[1]
ldtm_date		=	lds_user.object.adtm_date[1]

// ดึงข้อมูล User 
li_found		= lds_userdetail.retrieve( is_coopcontrl, ls_coopid , ls_userid, ldtm_date )
if isnull( li_found ) then li_found =  0
if li_found < 1 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูล User ที่ต้องการ กรุณาตรวจสอบ" 
	throw ithw_exception
end if

// ตรวจสอบการเปิดงานประจำวัน
li_rc = of_is_open_day( ls_coopid , ldtm_date )
if li_rc < 1 then
	ithw_exception.text	= "ยังไม่ได้เปิดงานประจำวัน  ไม่สามารถทำรายการได้ " 
	throw ithw_exception
end if

// ตรวจสอบข้อมูลการปิดงานประจำวัน
li_rc	= this.of_is_close_day( ls_coopid , as_appname ,  ldtm_date )
if ( li_rc = 1 ) then
	ithw_exception.text	= "ได้ทำการปิดสิ้นแล้ว ไม่สามารถทำรายการได้"
	throw ithw_exception
end if

// ดึงข้อมูลรายรับ
lds_revc.retrieve(ls_coopid, ldtm_date ,ls_userid  )

// ดึงข้อมูลรายจ่าย
lds_pay.retrieve( ls_coopid,ldtm_date ,ls_userid  )

as_userdetail_xml		=	lds_userdetail.describe( "Datawindow.data.XML" )
as_recv_xml		=	lds_revc.describe( "Datawindow.data.XML" )
as_pay_xml		=	lds_pay.describe( "Datawindow.data.XML" )

return success
end function

public function integer of_init_payrecv_member (ref string as_main_xml) throws Exception;/***********************************************
<description>
	ขอ XMLConfig ที่เกี่ยวกับ หน้าจอรับ-จ่ายการเงิน ดึงข้อมูลสมาชิกหรือบุคคลภายนอก 
</description>

<arguments>
	as_main_xml	XMLConfig สำหรับ ดึงข้อมูล, ส่งมาเพื่อรับค่ากลับไป.
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_init_payrecv_member()
	
	Integer li_return 
	String ls_main_xml 
	
	li_return = lnv_finservice.of_init_payrecv_member( ls_main_xml  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/9/2010 by PhaiWaan

</usage>
************************************************/


integer	li_membflag  , li_membstatus
string		ls_member_no , ls_membfullname , ls_membgroup , ls_prenamedesc  , ls_persontype , ls_prename_code  ,ls_dwobjectname,ls_coop_id

n_ds		lds_main , lds_item

// ชื่อ Datawindow ที่ใช้
ls_dwobjectname 	= inv_print_srv.of_getdataobject( as_main_xml )

lds_main		=	create n_ds
lds_main.dataobject = ls_dwobjectname
lds_main.settrans( itr_sqlca )

if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_main , as_main_xml )
else
	destroy lds_main 
	destroy lds_item
	ithw_exception.text	= "ไม่มีข้อมูลรับ-จ่าย ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

li_membflag	=	lds_main.object.member_flag[1]
ls_member_no	= lds_main.object.member_no[1]
ls_coop_id =  lds_main.object.coop_id[1]

ls_membfullname  	= ""
ls_membgroup 			= "" 

if li_membflag = 1 then 

	select prename_desc , memb_name || ' ' || memb_surname  , membgroup_code , member_status
	into 	:ls_prenamedesc , :ls_membfullname , :ls_membgroup , :li_membstatus
	from mbmembmaster a , mbucfprename b
	where a.prename_code = b.prename_code
	and	a.coop_id = :is_coopcontrl
	and	(member_no = :ls_member_no ) //or salary_id = substr(:ls_member_no,-6)   เอาออกเพราะข้อมูลมีหลายแถว by bee
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then 
		destroy lds_main 
		destroy lds_item
		ithw_exception.text	= "ไม่พบข้อมูลสมาชิก"
		throw ithw_exception
	end if
	
		
	if trim( ls_prename_code ) <> "ฮฮ" then
		ls_membfullname = ls_prenamedesc + ' ' + ls_membfullname
	end if
	
elseif li_membflag = 0 then
	
	select prename_desc , first_name || ' ' || last_name , persontype_code , a.prename_code
	into 	:ls_prenamedesc , :ls_membfullname , :ls_persontype , :ls_prename_code
	from fincontackmaster a , mbucfprename b
	where a.prename_code = b.prename_code	
	and	a.coop_id = :is_coopcontrl
	and contack_no = :ls_member_no
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then 
		destroy lds_main 
		destroy lds_item
		ithw_exception.text	= "ไม่พบข้อมูลบุคคลภายนอก"
		throw ithw_exception
	end if
	
	// หากเ็ป็นประเภทบุคคลธรรมดา
	if ls_persontype = "01"  then
		if trim( ls_prename_code ) <> "ฮฮ" then
			ls_membfullname = ls_prenamedesc + ' ' + ls_membfullname
		end if
	end if
	
else
	ls_membfullname  	= ""
	ls_membgroup 			= "" 
end if

//if li_membstatus < 0 then
//	ithw_exception.text	= "สมาชิกเลขที่ : " + ls_member_no +  " มีสถานะลาออก" 
//	throw ithw_exception
//end if

if isnull(ls_membgroup) then ls_membgroup = ""
if isnull(ls_membfullname) then ls_membfullname = ""

lds_main.object.nonmember_detail[1]		 = ls_membfullname
lds_main.object.membgroup_code[1]		 	= ls_membgroup

lds_main.accepttext( )


as_main_xml	= lds_main.describe( "Datawindow.Data.Xml" )

destroy lds_main 
destroy lds_item

return success
end function

public function integer of_init_bankaccount_open (ref n_ds ads_data) throws Exception;string		ls_itemtype, ls_bank, ls_branch, ls_accno
integer	li_count

//ads_data.setitem( 1, "open_date", adtm_wdate )
ads_data.setitem( 1, "last_stm", 1 )
ads_data.setitem( 1, "balance", 0 )
ads_data.setitem( 1, "withdraw_amt", 0 )

ls_bank			= ads_data.object.bank_code[1]
ls_branch		= ads_data.object.bank_branch[1]
ls_accno			= ads_data.object.account_no[1]

if isnull( ls_bank ) then ls_bank = ""
if isnull( ls_branch ) then ls_branch = ""
if isnull( ls_accno ) then ls_accno = ""

SELECT	count( account_no )  
INTO		:li_count
FROM		FINBANKACCOUNT
WHERE	(	ACCOUNT_NO			= :ls_accno ) AND  
			(	BANK_CODE				= :ls_bank ) AND  
			(	BANKBRANCH_CODE	= :ls_branch )   
using itr_sqlca ;
				
if isnull( li_count ) then li_count = 0

if li_count > 0 then
	ithw_exception.text	= "เลขที่บัญชีซ้ำ กรุณาตรวจสอบ"
	throw ithw_exception
end if

return Success
end function

public function integer of_postslipbank (string as_main_xml) throws Exception;string		ls_itemtype, ls_slipno
string	ls_docno = "FNRECEIPTBANK"

n_ds		lds_data

lds_data		= create n_ds
lds_data.dataobject = "d_slipbank"

if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_data , as_main_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลทำรายการธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

this.of_chkslipbank_complete(  lds_data )

// ทำการสร้างเลขที่เอกสารก่อน
ls_slipno = this.of_get_lastslip_docno(  ls_docno )

lds_data.setitem( 1, "slip_no", ls_slipno )

ls_itemtype		= lds_data.object.item_code[1]

choose case ls_itemtype
	case "OCA"
		this.of_slipbank_open( lds_data )
	case else
		this.of_slipbank_other( lds_data ) 

end choose

return success
end function

public function integer of_init_posttobank (string as_branch, datetime adtm_wdate, ref string as_xmlinfo) throws Exception;long	ll_row
n_ds lds_data

lds_data = create n_ds
lds_data.dataobject  = "d_fin_posttobank_list" 
lds_data.settransobject( itr_sqlca )

// set postitembank
this.of_init_setitembank( as_branch , adtm_wdate )

ll_row = lds_data.retrieve( adtm_wdate , as_branch )

as_xmlinfo = ""
if ll_row > 0 then
	as_xmlinfo = lds_data.describe( "Datawindow.Data.Xml" )
end if

destroy lds_data

return success
end function

public function integer of_init_bankaccount_slip (ref string as_main_xml) throws Exception;datetime	ldtm_entry
string		ls_itemtype 
long		ll_row

n_ds		lds_data 

lds_data = create	n_ds
lds_data.dataobject = "d_slipbank"

if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_data , as_main_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ll_row	 = lds_data.rowcount( )

if ll_row < 1 then return success

ls_itemtype		= trim( lds_data.object.item_code[1] )
ldtm_entry		= lds_data.object.operate_date[1]

choose case ls_itemtype
	case "OCA"
//		 this.of_init_bankaccount_open( lds_data )
	case else
		 this.of_init_bankaccount_else( ldtm_entry , lds_data  )
end choose

lds_data.accepttext( )

as_main_xml = lds_data.describe( "Datawindow.Data.Xml" )

return success
end function

public function integer of_init_fincashcontrol_user (ref string as_fincashcontrol_xml, ref string as_fullname) throws Exception;/***********************************************
<description>
	กำหนด XMLConfig ข้อมูลผู้ร้องขอ ( User ) ชื่อและยอดเงินสดลิ้นชักคงเหลือ ในการทำรายการควบคุมเงินสดประจำวัน 
</description>

<arguments>
  	as_fincashcontrol_xml	ข้อมูลการควบคุมเงินสด , ส่งค่ากลับคืนเป็น xml
	as_fullname					ข้อมูลชื่อ-สกุล ของผู้ร้องขอ
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_init_fincashcontrol_user()
	
	Integer li_return 
	String ls_fincashcontrol_xml , ls_fullname 
	
	li_return = lnv_finservice.of_init_fincashcontrol_user( ls_fincashcontrol_xml , ls_fullname  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/9/2010 by PhaiWaan

</usage>
************************************************/

long		ll_status, ll_item_type, ll_row, ll_status1
dec{2}	ldc_balance, ldc_dept, ldc_with, ldc_sum, ldc_return
string	ls_app, ls_message, ls_coop_id , ls_username
string		ls_user 
datetime	ldtm_operate_date
integer	li_valid

n_ds lds_userfintable , lds_cashmas

lds_cashmas 		= create	n_ds
lds_cashmas.dataobject	=	"d_controlcash"


if not isnull( as_fincashcontrol_xml ) and trim( as_fincashcontrol_xml ) <> "" then
	this.of_importstring_xml( lds_cashmas , as_fincashcontrol_xml )
else
	destroy lds_cashmas
	ithw_exception.text	= "ไม่มีข้อมูลควบคุมเงินสด ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ls_user					=  lds_cashmas.object.entry_id[1] 
ldtm_operate_date	= lds_cashmas.object.operate_date[1]
ls_coop_id			= lds_cashmas.object.coop_id[1]

//li_valid		= this.of_validuser( ls_user ,branch_id ,  ls_app )

// หาว่า มี user ในระบบหรือไม่ -----------------------------------------
lds_userfintable = create n_ds
lds_userfintable.dataobject ="ds_userfintable"
lds_userfintable.settransobject( itr_sqlca )
lds_userfintable.retrieve(  is_coopcontrl ,ls_user)

ll_row			= lds_userfintable.rowcount( )

if isnull( ll_row	 ) then 	ll_row	 = 0 

if ll_row = 0 then
	destroy lds_cashmas
	ithw_exception.text	= "ไม่มีข้อมูลผู้ร้องขอ กรุณาตรวจสอบข้อมูล "
	throw ithw_exception
end if

ls_app		= lds_userfintable.object.tablefin_code[1]
//----------------------------------------------------------------------------

SELECT	STATUS,	AMOUNT_BALANCE
INTO		:ll_status,	:ldc_balance        
FROM		FINTABLEUSERMASTER
WHERE		( USER_NAME		= :ls_user ) AND
			( OPDATEWORK	= :ldtm_operate_date )  and
			( coop_id		= :ls_coop_id )
using		itr_sqlca		;
			

if isnull( ldc_balance ) then ldc_balance = 0
if isnull( ll_status ) then ll_status = 14

if itr_sqlca.sqlcode = -1 then
	destroy lds_cashmas
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลจาก master ได้ of_init_fincashcontrol_user~r~n" + itr_sqlca.sqlerrtext
	throw ithw_exception
elseif itr_sqlca.sqlcode = 100 then
	ldc_sum	= 0
	ll_status	= 14
else	
	ldc_sum	= ldc_balance
end if

//if this.of_check_item( ll_item_type, ll_status, ldc_balance, as_user ) <> SUCCESS then return FAILURE

lds_cashmas.object.money_remain[1] 	= ldc_sum
lds_cashmas.object.status[1] 				= ll_status
lds_cashmas.object.operate_amt[1] 		= 0.00

// กำหนดค่าเริ่มต้น ประเภททำรายการ
if ll_status = ITEM_MODE_CLOSE then // สถานะ ปิดลิ้นชักแล้ว
	ll_item_type = ITEM_MODE_OPEN
elseif ll_status = ITEM_MODE_OPEN then // สถานะ เปิดลิ้นชักแล้ว
	ll_item_type = ITEM_MODE_CLOSE
else
	ll_item_type = ITEM_MODE_OPEN
end if

//if ll_item_type = ITEM_MODE_CLOSE then
//	lds_cashmas.object.operate_amt[1] = ldc_sum 
//end if
as_fullname	= lds_userfintable.object.full_name[1] // ชื่อ user
lds_cashmas.object.application[1] = ls_app

lds_cashmas.Accepttext( )

as_fincashcontrol_xml		= lds_cashmas.describe( "Datawindow.data.XML" )
destroy lds_cashmas
return success
end function

public function integer of_chkcardtax (string as_cardtax, string as_memb_no) throws Exception;// ตรวจสอบบัตรผู้เสียภาษี

string		ls_mem

if isnull(as_cardtax) or as_cardtax = "" then return success



select	contack_no
into	:ls_mem
from	FINCONTACKMASTER
where	TAX_ID		= :as_cardtax and
		coop_id		= :is_coopcontrl	
using itr_sqlca ;

// ห้าม chek sqlca.sqlcode = 0 เพราะ หากว่ามีซ้ำมากกว่า 1 record  sqlcode จะไม่ใช่ 0
// การที่จะซ้ำได้มี 2 กรณี 
// 1.  เลขที่บัตรนั้นเป็นของสมาชิกคนนี้จริง ๆ กรณีที่เคยลาออกแล้วมาสมัครใหม่
// 2. ผู้ใช้ป้อนผิดเลยมีซ้ำกัน 2 คน

if not isnull( ls_mem )  and  ( ls_mem <> "" )  and ( ls_mem <> as_memb_no ) then
	ithw_exception.text	= "เลขบัตรผู้เสียภาษี ซ้ำกับ ~rทะเบียน " + ls_mem  + "~r กรุณาตรวจสอบ"
	throw ithw_exception
end if


return success
end function

private function integer of_chk_cansave (ref n_ds ads_data) throws Exception;string	ls_approve, ls_app, ls_temp
string	 ls_name, ls_error, ls_user, ls_coopid
dec{2}	ldc_amount, ldc_balance
long		ll_statusdetail, ll_rc, ll_status, ll_item_type
string	ls_DOC = "FNCONTRLCASH"
string	ls_slip_no
integer	li_saveflag

// สร้างเลขที่เอกสาร

ls_slip_no		= of_get_lastslip_docno( ls_DOC)

ads_data.Setitem( 1, "cash_slipno", ls_slip_no )


ads_data.Accepttext( )


ls_approve		= trim(ads_data.getitemstring( 1, "permis_id" ) )
ll_status		= ads_data.getitemNumber( 1, "status" )
ll_item_type	= ads_data.getitemNumber( 1, "item_type" )
ldc_balance		= ads_data.getitemDecimal( 1, "money_remain" )
ls_user			= ads_data.getitemstring( 1, "entry_id" )
ls_coopid		= ads_data.getitemstring( 1, "coop_id" )

if isnull( ls_approve ) then ls_approve = ""
if isnull( ll_status ) then ll_status = 0
if isnull( ll_item_type ) then ll_item_type = 0
if isnull( ldc_balance ) then ldc_balance = 0
if isnull( ls_user ) then ls_user = ""


// if ib_cansave	= false then
//	 
//		ithw_exception.text	= "ใบทำรายการนี้มีการบันทึกแล้ว ไม่สามารถบันทึกซ้ำได้" 
//		throw ithw_exception
// end if

//เปลี่ยน where จาก coop_id เป็น coop_control เพื่อรองรับสาขา Edit By Mike 29/03/2016
SELECT	APVCASH_FLAG  
INTO		:li_saveflag
FROM		AMSECUSERS  
WHERE		( USER_NAME 		= :ls_approve ) and
			( coop_control	= :is_coopcontrl ) 
using itr_sqlca ;

 
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ผู้ใช้ "+ ls_approve + "  ไม่มีอำนาจอนุมัติ" 
	throw ithw_exception
end if

if isnull( li_saveflag ) or li_saveflag = 0 then
	ithw_exception.text	=  "ผู้ใช้ "+ ls_approve + "  ไม่มีอำนาจอนุมัติ" 
	throw ithw_exception
end if

//ls_pass_appv	= trim( ls_pass_appv )		
//if isnull( ls_pass_appv ) then ls_pass_appv = ""
//		
//if ( itr_sqlca.sqlcode <> 0 ) or ( ls_pass_appv <> ls_pass )then
//	ithw_exception.text	=  "ผู้ใช้ "+ ls_approve + " รหัสผ่านผู้อนุมัติไม่ถูกต้อง" 
//	throw ithw_exception
//end if

//***************************************************
// ตรวจสอบข้อมูลเบื้องต้น
//***************************************************
ls_name				= trim(ads_data.GetitemString( 1, "entry_id" ) )
ll_statusdetail	= ads_data.GetitemNumber( 1, "item_type" )
ldc_amount			= ads_data.GetitemDecimal( 1, "operate_amt" )
ls_error				= ""

if isnull( ls_name ) then
	 ls_error	+=  "+ โปรดเลือกผู้ร้องขอ~r~n"
end if

if isnull( ll_statusdetail ) then
	 ls_error	+=  "+ โปรดเลือกประเภทรายการ~r~n"
end if

if ldc_amount < 0 then	
	ls_error		+=  "+ จำนวนเงินสดน้อยกว่าศูนย์ไม่ได้~r~n"
end if

if (  ldc_balance  <> 0 ) and ( ll_item_type = 14 ) then
	ls_error		+=  "+ กรณีปิดลิ้นชัก จำนวนเงินต้อง clear เป็น ศูนย์~r~n"
end if


if ( ll_item_type = 16 ) or ( ll_item_type = 14 ) then
	if ldc_amount > (ldc_balance + ldc_amount ) then
		ls_error		+= " + จำนวนเงินที่ส่งคืน มากกว่าจำนวนเงินที่เหลือครับ~r~n"
		ads_data.setcolumn( "operate_amt" )
		ads_data.setitem( 1 , "operate_amt", 0 )		
		ithw_exception.text	= ls_error
		throw ithw_exception
	end if
end if

//*********** ตรวจสอบข้อมูลเบื้องต้น ************

ll_rc	= this.of_chk_item_teller( ll_item_type, ll_status,  ls_user )

return ll_rc
end function

private function integer of_chk_item_teller (long al_item_type, long al_status, string as_user) throws Exception;choose case al_item_type
	case ITEM_MODE_OPEN
		if al_status = ITEM_MODE_OPEN then
			ithw_exception.text	= "ลิ้นชักของ " + as_user + " มีสถานะเปิดอยู่แล้ว ไม่สามารถเปิดได้อีก"
			throw ithw_exception
		end if
		
	case ITEM_MODE_CLOSE
		if al_status = ITEM_MODE_OPEN then
		else
			ithw_exception.text	= "ลิ้นชักของ " + as_user + " ยังไม่ทำการเปิดลิ้นชัก"
			throw ithw_exception
		end if
		
	case ITEM_MODE_RECIEVE, ITEM_MODE_RETURN
		if al_status = ITEM_MODE_CLOSE then
			ithw_exception.text	= "ลิ้นชักของ " + as_user + " มีสถานะปิด ไม่สามารถทำรายการนี้ได้"
			throw ithw_exception
		elseif al_status = 100 then
			ithw_exception.text	= "ลิ้นชักของ " + as_user + " ยังไม่ทำการเปิดลิ้นชัก ไม่สามารถทำรายการนี้ได้"
			throw ithw_exception
		end if
		
	case else
	
end choose

return SUCCESS
end function

private function integer of_chkslip_completefill (n_ds ads_main, n_ds ads_item) throws Exception;string		ls_cashtype, ls_paydesc, ls_err, ls_refslip, ls_memno,ls_coopid
string		ls_memname, ls_sendtosys
dec{2}	ldc_sumitem, ldc_slipitem
integer	li_index, li_memflag 
integer	li_row, li_found , li_recv_pay , li_posttovc_flag
string		ls_itemtype, ls_accid, ls_desc
dec{2}	ldc_itemamt , ldc_temp


ls_err				= ""
ls_cashtype		= trim( ads_main.object.cash_type[1] )
ls_paydesc		= ads_main.object.payment_desc[1]
ldc_slipitem		= ads_main.object.item_amtnet[1]
ls_memno		= ads_main.object.member_no[1]
li_memflag		= ads_main.object.member_flag[1]
ls_coopid 		= ads_main.object.coop_id[1]
ls_memname	= ads_main.object.nonmember_detail[1]
ls_sendtosys	= trim( ads_main.object.sendto_system[1] )
li_recv_pay		= ads_main.object.pay_recv_status[1]

if ii_slipmode = 0 then
	ldc_sumitem	= dec( ads_item.describe( " evaluate( 'sum(  itempayamt_net  for all )' , 0 ) " ) )
else
	ldc_sumitem	= ldc_slipitem
end if

if isnull( ls_memname ) then ls_memname = ""
if isnull( ls_memno ) then ls_memno = ""
if isnull( ls_cashtype ) then ls_cashtype = ""
if isnull( ls_paydesc ) then ls_paydesc = ""
if isnull( ldc_slipitem ) then ldc_slipitem = 0
if isnull( ldc_sumitem ) then ldc_sumitem = 0
if isnull( ls_sendtosys ) then ls_sendtosys = ''
if isnull( ls_sendtosys ) then ls_sendtosys = ''

li_index			= 0

if li_memflag <> 3 then
	if len( ls_memno ) < 1 then
		li_index ++
		ls_err	+= string( li_index ) + ". กรุณาระบุเลขสมาชิก~r~n"
	end if
end if

if len( ls_memname ) < 1 then
	li_index ++
	ls_err	+= string( li_index ) + ". กรุณาระบุชื่อผู้ติดต่อ~r~n"
end if

if len( ls_cashtype ) < 1 then
	li_index ++
	ls_err	+= string( li_index ) + ". กรุณาเลือกประเภทเงินทำรายการ~r~n"
end if

if len( ls_paydesc ) < 1 then
	li_index ++
	ls_err	+= string( li_index ) + ". กรุณากรอกรายละเอียดการทำรายการ~r~n"
end if

if ldc_sumitem <= 0  then
	li_index ++
	ls_err	+= string( li_index ) + ". กรุณาระบุจำนวนเงินทำรายการ~r~n"
end if

if ldc_sumitem <> ldc_slipitem  then
	li_index ++
	ls_err	+= string( li_index ) + ". จำนวนเงินทำรายการกับรายละเอียดไม่ตรงกัน~r~n"
end if

//if upper( trim( ls_cashtype ) ) = 'TRN' then
//	if isnull( ls_sendtosys ) or trim( ls_sendtosys ) = '' then
//		li_index ++
//		ls_err+= string( li_index ) + ". กรุณาระบุระบบที่ต้องการโอนเงินไปชำระด้วย"
//	end if
//else
//	if upper( trim( ls_sendtosys ) )  = 'DEP' then 
//		li_index ++
//		ls_err+= string( li_index ) + ". กรุณาระบุเลขบัญชีเงินฝากสหกรณ์ที่ต้องการโอนด้วย"
//	end if
//end if

if len( ls_err ) > 0 then
	ithw_exception.text	= ls_err
	throw ithw_exception
end if

// ทำรายการรับเป็นเช็ค
if li_recv_pay = 1 and ls_cashtype = 'CHQ' then
	this.of_chkslip_completechq( ads_main )
end if

//// ตรวจสอบรายละเอียดภาษี
//if this.of_completetax( ) = Failure then
//	return Failure
//end if

li_row		= ads_item.rowcount( )
ls_refslip	= upper( trim( ads_main.object.from_system[ 1 ] ) )

if ( ls_refslip <> "SHL" ) and ( ls_refslip <> "LON" ) and ( ls_refslip <> "INV" ) and ( ls_refslip <> "DEP" ) then
	for li_index = 1 to li_row
		ldc_itemamt		= ads_item.object.itempay_amt[li_index]
		ls_itemtype		= trim( ads_item.object.slipitemtype_code[li_index] )
		ls_accid			= trim( ads_item.object.account_id[li_index] )
		ls_desc			= trim( ads_item.object.slipitem_desc[li_index] )
		li_posttovc_flag	= ads_item.object.posttovc_flag[li_index]
		
		if isnull( ls_desc ) then ls_desc = ""
		if isnull( ls_accid ) then ls_accid = ""
		if isnull( ls_itemtype ) then ls_itemtype = ""
		if isnull( ldc_itemamt ) then ldc_itemamt = 0
		
		if ( ls_desc = "" ) or ( ls_itemtype = "" ) or ( ldc_itemamt = 0 ) then
			ithw_exception.text	= "รายละเอียดรายการ กรอกรายละเอียดไม่ครบถ้วน กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		if li_posttovc_flag = 0 then
			if   ls_accid = "" then
				ithw_exception.text	= "รายละเอียดรายการ ยังไม่ได้กรอกรายละเอียดรหัสคู่บัญชี กรุณาตรวจสอบ"
				throw ithw_exception
			end if
		end if
		
		
		if   ls_accid <> ""  and li_posttovc_flag = 0  then
			// ตรวจสอบรหัสคู่บัญชี
			select count( account_id )
			into	:li_found
			from	accmaster
			where	account_id	= :ls_accid and
					coop_id		= :is_coopcontrl
			using	itr_sqlca ;
			
			if isnull( li_found ) then li_found = 0
			if ( li_found = 0 ) then
				ithw_exception.text	= "ไม่มีเลขคู่บัญชี " + ls_accid +"  กรุณาตรวจสอบ"
				throw ithw_exception
			end if
		end if
	next
end if


return Success
end function

private function integer of_chkslipbank_complete (n_ds ads_data) throws Exception;string	ls_bank, ls_bankbr, ls_accno, ls_accname, ls_bookno
dec{2}	ldc_money
integer	li_index
string	ls_err, ls_itemtype

li_index		= 0
ls_err		= ""
ls_bank		= trim( ads_data.object.bank_code[1] )
ls_bankbr	= trim( ads_data.object.bank_branch[1] )
ls_accno		= trim( ads_data.object.account_no[1] )
ls_accname	= trim( ads_data.object.account_name[1] )
ls_bookno	= trim( ads_data.object.book_no[1] )
ldc_money	= ads_data.object.item_amt[1]
ls_itemtype	= trim( ads_data.object.item_code[1] )

if isnull( ls_bank ) then ls_bank = ""
if isnull( ls_bankbr ) then ls_bankbr = ""
if isnull( ls_accno ) then ls_accno = ""
if isnull( ls_accname ) then ls_accname = ""
if isnull( ls_bookno ) then ls_bookno = ""
if isnull( ldc_money ) then ldc_money = 0
if isnull( ls_itemtype ) then ls_itemtype = ""

if ls_bank = "" then
	li_index ++
	ls_err	+= string (li_index) + ". ชื่อธนาคาร~r~n"
end if

if ls_bankbr = "" then
	li_index ++
	ls_err	+= string (li_index) + ". ชื่อสาขาธนาคาร~r~n"
end if

if ls_accno = "" then
	li_index ++
	ls_err	+= string (li_index) + ". เลขที่บัญชีธนาคาร~r~n"
end if

if ls_accname = "" then
	li_index ++
	ls_err	+= string (li_index) + ". ชื่อบัญชีธนาคาร~r~n"
end if

if ls_bookno = "" then
	li_index ++
	ls_err	+= string (li_index) + ". เลขที่สมุดธนาคาร~r~n"
end if


if ls_itemtype <> "OCA" then
	if ldc_money = 0 then
		li_index ++
		ls_err	+= string (li_index) + ". จำนวนเงินทำรายการ~r~n"
	end if
end if

if ls_err <> "" then
	ithw_exception.text	= "กรุณาตรวจสอบข้อมูล~r~n" + ls_err
	throw ithw_exception
end if

return Success
end function

private function integer of_clear_docno (string as_branch_id) throws Exception;n_ds	 lds_cleardocno
string		ls_year , ls_docno 
integer	li_row , li_index , li_len , li_year
lds_cleardocno	= create n_ds
lds_cleardocno.dataobject		= "d_cm_cleardocno"
lds_cleardocno.settransobject( itr_sqlca )

li_row	= lds_cleardocno.retrieve( as_branch_id )

for li_index = 1 to li_row
	ls_year		= trim( lds_cleardocno.object.document_year[li_index] )
	ls_docno		= trim( lds_cleardocno.object.last_documentno[li_index] )
	
	li_year		= integer( ls_year ) + 1
	ls_year		= string( li_year )
	li_len		= len( ls_docno )
	ls_docno		= fill( "0", li_len )
	
	lds_cleardocno.object.document_year[li_index]		= ls_year
	lds_cleardocno.object.last_documentno[li_index]		= ls_docno
next


if lds_cleardocno.update( ) <> 1 then		
	ithw_exception.text	= "ไม่สามารถทำรายการ update	cmshrloandoccontrol  "+ itr_sqlca.sqlerrtext 
	rollback	using	itr_sqlca	;
	throw ithw_exception
end if

return		success
end function

private function any of_getattribconstant (string as_attribconstant, string as_type);any		la_attribconstant

as_type	= trim( as_type )
choose case upper( as_type )
	case "DATETIME"
		la_attribconstant	= ids_constant.GetitemDatetime( 1,as_attribconstant  )
	case "STRING"
		la_attribconstant	= ids_constant.GetitemString( 1,as_attribconstant  )
	case "INTEGER"
		la_attribconstant	= ids_constant.GetitemNumber( 1,as_attribconstant  )
	case "DECIMAL"
		la_attribconstant	= ids_constant.GetitemDecimal( 1,as_attribconstant  )
	case ELSE
		la_attribconstant	= ids_constant.GetitemNumber( 1,as_attribconstant  )
end choose


return		la_attribconstant
end function

private function integer of_is_close_teller (string as_entry_id, datetime adtm_entry, string as_branch_id) throws Exception;integer	li_rc

SELECT	count(*)
INTO		:li_rc
FROM		FINTABLEUSERMASTER  
WHERE		( USER_NAME 		= :as_entry_id ) AND 
			( OPDATEWORK		= :adtm_entry )  and
			( status				= 14 ) and
			( branch_id	= :as_branch_id)
using		itr_sqlca ;

if isnull( li_rc ) then li_rc = 0


if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถทำรายการได้ยังไม่ได้เปิดลิ้นชัก หรือได้ปิดไปแล้วของ " + as_entry_id + "  "  +  itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return li_rc
end function

private function integer of_postchq (ref n_ds ads_data) throws Exception;string		ls_chqno, ls_bankcode, ls_bankbranch, ls_paywhom, ls_chqbookno, ls_fromacc
string		ls_frombranch, ls_frombank, ls_chequetype, ls_chqno_next, ls_entryid, ls_machineid
string		ls_member, ls_referfinslipno, ls_remark , ls_coopbranch
integer		li_chequestatus, li_seqno, li_chk
datetime	ldtm_entrydate, ldtm_onchq
dec{2}		ldc_itemamt

// กรณีจ่ายเป็นเช็ค
ls_chqno				= trim( ads_data.object.account_no[1] )
ls_bankcode			= trim( ads_data.object.bank_code[1] )
ls_bankbranch		= trim( ads_data.object.bank_branch[1] )
ls_paywhom			= trim( ads_data.object.pay_towhom[1] )
ls_chqbookno		= trim( ads_data.object.chequebook_no[1] )
ls_fromacc				= trim( ads_data.object.from_accno[1] )
ls_frombranch		= trim( ads_data.object.from_branchcode[1] )
ls_frombank			= trim( ads_data.object.from_bankcode[1] )
li_chequestatus		= ads_data.object.cheque_status[1]
ls_chequetype		= trim( ads_data.object.cheque_type[1] )
ldtm_entrydate		= ads_data.object.entry_date[1]
ls_entryid				= trim( ads_data.GetitemString( 1 , "entry_id" ) )
ldc_itemamt			= ads_data.object.item_amtnet[1]
ls_machineid			= trim( ads_data.GetitemString( 1 , "machine_id" ) )
ls_member				= trim( ads_data.object.member_no[1] )
ls_referfinslipno		= trim( ads_data.object.slip_no[1] )
ls_remark				= trim( ads_data.object.payment_desc[1] )
ls_coopbranch			= trim( ads_data.object.coopbranch_id[1] )
if isnull( ls_chequetype ) then ls_chequetype = ""
if isnull( ls_fromacc ) then ls_fromacc = ""
if isnull( ls_frombranch ) then ls_frombranch = ""
if isnull( ls_frombank ) then ls_frombank = ""
if isnull( li_chequestatus ) then li_chequestatus = 1// ถ้าค่าที่ได้เป็นค่า null ถือว่าเช็คฉบับนั้นตัดยอดแล้ว


if ls_fromacc = "" or ls_frombranch = "" or ls_frombank = "" then
	li_chk	= 1//messagebox( this.title, "ป้อนข้อมูลที่จะทำการตัดเงินออก ไม่สมบูรณ์ ต้องการทำรายการต่อหรือไม่", stopsign!, YesNo!, 1 )	
	if li_chk = 1 then
		ads_data.object.payment_status[1]	= 8
		return Success
	end if
	return Failure
end if

if ls_chequetype = "" or ls_chqbookno = "" or  ls_chqno = "" or ls_bankcode = "" or ls_bankbranch = "" or ls_paywhom = "" then
	li_chk	= 1//messagebox( this.title, "ป้อนข้อมูลเกี่ยวกับการจ่ายเช็ค ไม่สมบูรณ์ ต้องการทำรายการต่อหรือไม่", stopsign!, YesNo!, 1 )
	if li_chk = 1 then 
		ads_data.object.payment_status[1]	= 8
		ads_data.object.receive_status[1]	= 0
		return Success
	end if
	return Failure
end if


choose case li_chequestatus
	case 2,0
		ads_data.object.receive_date[1]		= ldtm_entrydate
		ads_data.object.receive_status[1]	= 0
	case else
		ads_data.object.receive_date[1]		= ldtm_entrydate
		ads_data.object.receive_status[1]	= 1
end choose

ads_data.object.payment_status[1]	= 1

//ls_chqno_next		= f_increment_alfanumeric( ls_chqno, 1 )
ldtm_onchq			= ads_data.GetitemDateTime( 1 , "dateon_chq" )

// ทำการตัดจ่ายยอดเงินในธนาคารที่ได้จ่ายเช็ค
// ต้องทำการตรวจเช็คก่อนว่ามียอดเงินพอที่จะทำการตัดจ่ายหรือไม่		
// หาลำดับสูงสุดของของเลขที่เช็คธนาคารสาขานั้นๆ
select	seq_no
into		:li_seqno
from		finchqeuestatement
where	( chequebook_no	= :ls_chqbookno ) and
			( bank_code			= :ls_bankcode ) and
			( bank_branch		= :ls_bankbranch ) and
			( CHEQUE_NO		= :ls_chqno ) and
			( use_status			= 0 ) and
			( coopbranch_id		= :ls_coopbranch ) 
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่ค้นหาข้อมูลเช็คเลขที่ " + ls_chqno +" ได้ จาก finchqeuestatement " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

update		finchqeuestatement
set			DATE_ONCHQ		= :ldtm_onchq ,
				ENTRY_ID				= :ls_entryid,
				ENTRY_DATE		= :ldtm_entrydate,
				TO_WHOM			= :ls_paywhom,
				TYPECHQ_PAY		= 0,
				MONEY_AMT			= :ldc_itemamt,
				CHQEUE_STATUS	= :li_chequestatus,
				ADVANCE_CHQ		= 0,
				COOPBRANCH_ID	= :ls_coopbranch,
				MACHINE_ID			= :ls_machineid,
				MEMBER_NO			= :ls_member,
				from_bankaccno	= :ls_fromacc,
				refer_slipno			= :ls_referfinslipno,
				cheque_type			= :ls_chequetype ,
				printed_status		= 0,
				USE_STATUS		= 1,
				remark					= :ls_remark
where		( CHEQUE_NO			= :ls_chqno ) and
				( CHEQUEBOOK_NO	= :ls_chqbookno ) and
				( BANK_CODE			= :ls_bankcode ) and 
				( BANK_BRANCH		= :ls_bankbranch ) and
				( SEQ_NO					= :li_seqno ) and
				( coopbranch_id			= :ls_coopbranch)
using		itr_sqlca	;


if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchqeuestatement "  + itr_sqlca.sqlerrtext
	rollback	using	itr_sqlca	;
	throw ithw_exception
end if

integer	li_used, li_remain, li_available

select	chqslip_used, chqslip_remain
into		:li_used, :li_remain
from		finchequemas
where	chequebook_no	= :ls_chqbookno and
			bank_code		= :ls_bankcode and
			bank_branch		= :ls_bankbranch and
			coopbranch_id	= :ls_coopbranch
using		itr_sqlca	;

if isnull( li_used ) then li_used = 0
if isnull( li_remain ) then li_remain = 0

li_used ++
li_remain --
li_available	= 1

if li_remain < 1 then
	li_available		= 0
end if

// ทำการปรัปรุงค่าเช็คที่ได้ใช้ไป
update	finchequemas
set		chqslip_used		= :li_used,
			chqslip_remain	= :li_remain,
			available_flag		= :li_available,
			last_chqno			= :ls_chqno_next
where	chequebook_no	= :ls_chqbookno and
			bank_code		= :ls_bankcode and
			bank_branch		= :ls_bankbranch and
			coopbranch_id	= :ls_coopbranch
using 		itr_sqlca	;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchequemas " + itr_sqlca.sqlerrtext
	rollback	using	itr_sqlca	;
	throw ithw_exception
end if


// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น		
if li_chequestatus <> 0 and li_chequestatus <> 2 then
	 this.of_posttobank( ads_data ) 
end if

		
return Success
end function

private function integer of_postrecvbookchqstm (n_ds ads_chq) throws Exception;string	ls_startchq, ls_endchq, ls_chqbookno, ls_chqno
string	ls_bank, ls_bankbranch, ls_coopid
integer	li_remain, li_all, li_index, li_used

ls_startchq		= trim( ads_chq.object.START_CHQNO[1] )
ls_endchq		= trim( ads_chq.object.END_CHQNO[1] )
ls_chqbookno	= trim( ads_chq.object.CHEQUEBOOK_NO[1] )
ls_bank			= ads_chq.object.BANK_CODE[1]
ls_bankbranch	= ads_chq.object.BANK_BRANCH[1]
li_remain		= ads_chq.object.CHQSLIP_REMAIN[1]
li_all			= ads_chq.object.CHQSLIP_AMT[1]
ls_chqno			= trim( ls_startchq )
ls_coopid		= ads_chq.object.coop_id[1]
li_remain		= li_all - li_remain

for li_index = 1 to li_all
	if ls_coopid ="018001" then
			ls_chqno	= string( long( ls_startchq  ) + ( li_index - 1 ) , '00000000' )
		else
			ls_chqno	= string( long( ls_startchq  ) + ( li_index - 1 ) , '0000000' )
		end if
	
	if li_remain >= li_index then
		li_used		= 1
	else
		li_used		= 0
	end if
	
	INSERT INTO	FINCHQEUESTATEMENT
	(	CHEQUE_NO,						CHEQUEBOOK_NO,				DATE_ONCHQ,					SEQ_NO,
		BANK_CODE,						ENTRY_ID,					ENTRY_DATE,					BANK_BRANCH,
		TO_WHOM,							TYPECHQ_PAY,				MONEY_AMT,					CHQEUE_STATUS,
		ADVANCE_CHQ,					COOP_ID,				MACHINE_ID,					CANCEL_ID,
		CANCEL_DATE,					MEMBER_NO,					FROM_BANKACCNO,			REFER_SLIPNO,
		PRINTED_STATUS,				PRINTED_ID,					PRINTED_DATE,				PRINTED_TERMINAL,
		CHEQUE_TYPE,					USE_STATUS
	)  
	VALUES
	(	:ls_chqno,						:ls_chqbookno,				NULL,							1,
		:ls_bank,						NULL,							NULL,							:ls_bankbranch,
		NULL,								NULL,							NULL,							1,
		NULL,								:ls_coopid,					NULL,							NULL,
		NULL,								NULL,							NULL,							NULL,
		0,									NULL,							NULL,							NULL,
		'99',								:li_used
	) using	itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มรายการเช็คได้ " + itr_sqlca.sqlerrtext 
		rollback	using	itr_sqlca ;
		throw ithw_exception
	end if
	
next

return Success
end function

private function integer of_posttobank (n_ds ads_data) throws Exception;// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
dec{2}		ldc_scobal, ldc_sumitemamt
string		ls_account_type, ls_slipbankno, ls_year, ls_account_name, ls_book_no
string		ls_bank,ls_bankbranch, ls_accno, ls_entryid, ls_machineid , ls_coopbranch
long			ll_laststm_seq
integer		li_chk
datetime	ldtm_open_date, ldtm_entrydate


ls_bank				= trim( ads_data.object.from_bankcode[1] )
ls_bankbranch		= trim( ads_data.object.from_branchcode[1] )
ls_accno				= trim( ads_data.object.from_accno[1] )
ldtm_entrydate		= ads_data.object.entry_date[1]
ls_entryid			= trim( ads_data.GetitemString( 1 , "entry_id" ) )
ls_machineid		= trim( ads_data.GetitemString( 1 , "machine_id" ) )
ldc_sumitemamt	= ads_data.object.itempay_amt[1]
ls_coopbranch		= trim( ads_data.object.coopbranch_id[1] )

if isnull( ldc_sumitemamt ) then ldc_sumitemamt = 0

select	SCO_BALANCE, laststm_seq, account_type, open_date, account_name, book_no
into		:ldc_scobal, :ll_laststm_seq, :ls_account_type, :ldtm_open_date, :ls_account_name, :ls_book_no
from		FINBANKACCOUNT
WHERE	(	ACCOUNT_NO			= :ls_accno ) AND  
			(	BANK_CODE				= :ls_bank ) AND  
			( 	BANKBRANCH_CODE	= :ls_bankbranch  ) and
			( COOPBRANCH_ID		= :ls_coopbranch )
using		itr_sqlca	;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT " + itr_sqlca.sqlerrtext
	rollback	using	itr_sqlca ;
	throw ithw_exception
end if

if isnull( ldc_scobal )	then ldc_scobal = 0			
if isnull( ll_laststm_seq )	then ll_laststm_seq = 0		

ldc_scobal			-= ldc_sumitemamt
ll_laststm_seq		+= 1


//a_edit   ls_slipbankno = inv_docservice.of_getnewdocno( "FNRECEIPTBANK" )


INSERT INTO FINSLIP_BANK  
(	SLIP_NO,					ENTRY_ID,				ENTRY_DATE,				OPERATE_DATE,
	COOPBRANCH_ID,		MACHINE_ID,				ACCOUNT_NO,				BANK_CODE,
	BANK_BRANCH,			ACCOUNT_NAME,		OPEN_DATE,					LAST_STM,
	ITEM_AMT,				BALANCE,					WITHDRAW_AMT,			ITEM_CODE,
	BOOK_NO,				ACCOUNT_TYPE 
)  
VALUES
(	:ls_slipbankno,			:ls_entryid,				:ldtm_entrydate,			:ldtm_entrydate,
	:ls_coopbranch,					:ls_machineid,			:ls_accno,						:ls_bank,
	:ls_bankbranch,			:ls_account_name,		:ldtm_open_date,			:ll_laststm_seq,
	:ldc_sumitemamt,		:ldc_scobal,				:ldc_scobal,					'WCA',
	:ls_book_no,				:ls_account_type
) using		itr_sqlca	 ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINSLIP_BANK "+ itr_sqlca.sqlerrtext
	rollback	using	itr_sqlca ;
	throw ithw_exception
end if

INSERT INTO	FINBANKSTATEMENT
(		SEQ_NO,					ACCOUNT_NO,						BANK_CODE,
		BANKBRANCH_CODE,	DETAIL_DESC,						ENTRY_ID,
		ENTRY_DATE,			OPERATE_DATE,					REF_SEQ,
		ITEM_STATUS,			CANCEL_ID,							CANCEL_DATE,
		BALANCE,					BALANCE_BEGIN,					MACHINE_ID,
		COOPBRANCH_ID,		refer_slipno,							item_amt ,
		sign_operate
)
VALUES
( 		:ll_laststm_seq,			:ls_accno,								:ls_bank,
		:ls_bankbranch,			'ถอนเงิน',								:ls_entryid,
		:ldtm_entrydate,		:ldtm_entrydate,					null,
		1,								null,										null,
		:ldc_scobal,				0,											:ls_machineid,
		:ls_coopbranch,					:ls_slipbankno,						:ldc_sumitemamt ,
		-1
) using		itr_sqlca	 ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKSTATEMENT "  + itr_sqlca.sqlerrtext
	rollback	using	itr_sqlca ;
	throw ithw_exception
end if

UPDATE	FINBANKACCOUNT
SET			SCO_BALANCE			= :ldc_scobal,
				laststm_seq				= :ll_laststm_seq
WHERE	(	ACCOUNT_NO			= :ls_accno ) AND  
			(	BANK_CODE				= :ls_bank ) AND  
			( 	BANKBRANCH_CODE	= :ls_bankbranch  ) and
			( COOPBRANCH_ID		= :ls_coopbranch )
using		itr_sqlca	;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKACCOUNT "   + itr_sqlca.sqlerrtext
	rollback	using	itr_sqlca ;
	throw ithw_exception
end if

return Success
end function

private function integer of_slipbank_other (n_ds ads_data) throws Exception;string	ls_accno, ls_bankcode, ls_bankbranch, ls_accname, ls_entryid, ls_bookno
string	ls_acctype, ls_machineid, ls_coopid, ls_slipno, ls_itemtype
dec{2}	ldc_balance, ldc_itemamt, ldc_with, ldc_dept , ldc_scobal
datetime	ldtm_opendate, ldtm_closedate, ldtm_entry_date, ldtm_booklastupdate
integer	li_seqno, li_closestatus, li_sign_operate
string	ls_desc

ls_accno				= ads_data.object.account_no[1]
ls_bankcode			= ads_data.object.bank_code[1]
ls_acctype			= ads_data.object.account_type[1]
ls_bankbranch		= ads_data.object.bank_branch[1]
ls_accname			= ads_data.object.account_name[1]
ls_entryid			= ads_data.object.entry_id[1]
ls_bookno			= ads_data.object.book_no[1]
ls_itemtype			= ads_data.object.item_code[1]
ldc_balance			= ads_data.object.balance[1]
ldc_itemamt			= ads_data.object.item_amt[1]

ldtm_entry_date		= ads_data.object.entry_date[1]
ldtm_booklastupdate	= ads_data.object.entry_date[1]
li_seqno					= ads_data.object.last_stm[1]

ls_machineid		= ads_data.object.machine_id[1]
ls_coopid		= ads_data.object.coop_id[1]
ls_slipno			= ads_data.object.slip_no[1]
li_closestatus		= 0


select	BALANCE, sco_balance, LASTSTM_SEQ
into		:ldc_balance, :ldc_scobal, :li_seqno
from		FINBANKACCOUNT
where		ACCOUNT_NO			= :ls_accno and 
			BANK_CODE			= :ls_bankcode and
			BANKBRANCH_CODE	= :ls_bankbranch and
			coop_id		= :ls_coopid
using itr_sqlca	;	


if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลจาก FINBANKACCOUNT ~r~n" + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;	
	throw ithw_exception
end if

choose case ls_itemtype
	case "DCA"
		ldc_with				= 0
		ldc_dept				= ldc_itemamt
		ldc_balance			= ldc_balance + ldc_itemamt
		ldc_scobal			= ldc_scobal + ldc_itemamt
		ls_desc				= "ฝากเงิน"
		li_sign_operate	= 1
	case "WCA"
		ldc_with			= ldc_itemamt
		ldc_dept			= 0
		ldc_balance		= ldc_balance - ldc_itemamt
		ldc_scobal		= ldc_scobal - ldc_itemamt
		ls_desc			= "ถอนเงิน"
		li_sign_operate	= -1
	case "CCA"
		ldtm_closedate	= ads_data.object.entry_date[1]
		li_closestatus	= 1
		ldc_balance		= 0
		ldc_scobal		= 0
		ls_desc			= "ปิดบัญชี"
		li_sign_operate	= -1
end choose

li_seqno ++

update	FINBANKACCOUNT
set		CLOSE_STATUS		= :li_closestatus,
			CLOSE_DATE			= :ldtm_closedate,
			BALANCE				= :ldc_balance,
			LASTSTM_SEQ			= :li_seqno,
			WITH_AMT				= WITH_AMT - :ldc_with,
			DEPT_AMT				= DEPT_AMT + :ldc_dept,
			LASTACCESS_DATE	= :ldtm_entry_date,
			BOOK_LASTUPDATE	= :ldtm_entry_date,
			sco_balance			= :ldc_scobal
where		ACCOUNT_NO			= :ls_accno and 
			BANK_CODE			= :ls_bankcode and
			BANKBRANCH_CODE	= :ls_bankbranch and
			coop_id		= :ls_coopid 
using itr_sqlca ;	

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลลง FINBANKACCOUNT  ~r~n" + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;	
	throw ithw_exception
end if

INSERT INTO	FINBANKSTATEMENT
(	SEQ_NO,						ACCOUNT_NO,				BANK_CODE,
	BANKBRANCH_CODE,		DETAIL_DESC,				ENTRY_ID,
	ENTRY_DATE,				OPERATE_DATE,			REF_SEQ,
	ITEM_STATUS,				CANCEL_ID,					CANCEL_DATE,
	BALANCE,					BALANCE_BEGIN,			MACHINE_ID,
	COOP_ID,			refer_slipno,				item_amt,
	sign_operate
)
VALUES
( 	:li_seqno,				:ls_accno,				:ls_bankcode,
	:ls_bankbranch,		:ls_desc,				:ls_entryid,
	:ldtm_entry_date,		:ldtm_entry_date,		null,
	1,							null,						null,
	:ldc_balance,			0,							:ls_machineid,
	:ls_coopid,		:ls_slipno,				:ldc_itemamt,
	:li_sign_operate
) using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลลง FINBANKSTATEMENT ~r~n" + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;	
	throw ithw_exception
end if

return Success
end function

private function decimal of_teller_balance (string as_branch, string as_entry_id, datetime adtm_wdate) throws Exception;dec{2}	ldc_balance 
SELECT	AMOUNT_BALANCE 
INTO		:ldc_balance 
FROM		FINTABLEUSERMASTER  
WHERE		( USER_NAME 	= :as_entry_id ) AND
			( OPDATEWORK 	= :adtm_wdate )  and
			( branch_id		= :as_branch )
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0  or isnull( ldc_balance ) then
	ldc_balance = 0.00
end if

return		ldc_balance
end function

public function integer of_init_bankaccount_else (datetime adtm_wdate, ref n_ds ads_data) throws Exception;string		ls_itemtype, ls_accno, ls_bank_code, ls_bank_branch,ls_coopid
string		ls_accountname, ls_bookno, ls_acctype
dec{2}		ldc_balance, ldc_withdrawable , ldc_scobal
integer		li_row, li_seqno
datetime		ldtm_opendate

n_ds lds_bankdet

//ls_itemtype		= astr_bkinfo.account_type
//ls_accno			= astr_bkinfo.account_no
//ls_bank_code	= astr_bkinfo.bank_code
//ls_bank_branch	= astr_bkinfo.bankbranch_id

ls_itemtype			= ads_data.object.account_type[1]
ls_accno				= ads_data.object.account_no[1]
ls_bank_code		= ads_data.object.bank_code[1]
ls_bank_branch		= ads_data.object.bank_branch[1]
ls_coopid	= ads_data.object.coop_id[1]


if isnull( ls_accno ) or trim( ls_accno ) = "" then
	return Success
end if

if isnull( ls_bank_code ) or trim( ls_bank_code ) = "" then
	return Success
end if

if isnull( ls_bank_branch ) or trim( ls_bank_branch ) = "" then
	return Success
end if

lds_bankdet		= create n_ds
lds_bankdet.dataobject	= "d_bankno_detail"
lds_bankdet.settransobject( itr_sqlca )

li_row		= lds_bankdet.retrieve(ls_coopid,ls_accno, ls_bank_code, ls_bank_branch )

if li_row < 1 then
	ithw_exception.text	= "ไม่มีเลขที่บัญชีดังกล่าว"
	throw ithw_exception
end if

ls_accountname	= lds_bankdet.object.account_name[1]
ldc_balance			= lds_bankdet.object.balance[1]
ldc_withdrawable	= ldc_balance
li_seqno				= lds_bankdet.object.laststm_seq[1]
ldtm_opendate		= lds_bankdet.object.open_date[1]
ls_bookno			= lds_bankdet.object.book_no[1]
ls_acctype			= lds_bankdet.object.account_type[1]
ldc_scobal			= lds_bankdet.object.sco_balance[1]

if isnull( ldc_scobal ) then ldc_scobal = 0
if isnull( ldc_balance ) then ldc_balance = 0
if isnull( ls_accountname ) then ls_accountname = ""
if isnull( ldc_withdrawable ) then ldc_withdrawable = 0
				

//astr_bkinfo.balance			= ldc_balance
//astr_bkinfo.withdrawable	= ldc_balance
//astr_bkinfo.lastseq_no		= li_seqno
//astr_bkinfo.book_no			= ls_bookno
//astr_bkinfo.account_type		= ls_acctype
//astr_bkinfo.account_name	= ls_accountname
//
//astr_bkinfo.open_date    		= adtm_wdate

ads_data.object.balance[1]				=	ldc_balance
ads_data.object.withdraw_amt[1]		=	ldc_balance
ads_data.object.last_stm[1]				=	li_seqno
ads_data.object.open_date[1]			=	adtm_wdate
ads_data.object.book_no[1]				=	ls_bookno
ads_data.object.account_type[1]		=	ls_acctype
ads_data.object.account_name[1]		=	ls_accountname


if ls_itemtype = 'CCA' then
	ads_data.object.item_amt[1]		= ldc_balance
end if

return Success
end function

public function integer of_chkchqfullfill (string as_branch, n_ds ads_chqspilt, ref n_ds ads_chqlist) throws Exception;/***********************************************
<description>
	ตรวจข้อมูลก่อนการพิมพ์เช็คหลายใบจาก 1 สลิป 
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	ads_chqlist				รายการที่เลือกพิมพ์เช็ค
	ads_chqspilt				รายการสั่งจ่ายเช็ค
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_chkchqfullfill()
	
	Integer li_return 
	String ls_branch 
	n_ds	lds_chqlist , lds_chqspilt
	
	li_return = lnv_finservice.of_chkchqfullfill( ls_branch , lds_chqlist , lds_chqspilt )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
	Version 1.1 แก้เงื่อนไขการดึงยอดจ่ายเช็ค ก่อนหน้า Modified Date 13/10/2010 by Phaiwaan
</usage>
************************************************/

integer	li_row, li_index , li_selected
string	ls_towhom, ls_slipno, ls_coopbranch
dec{2}	ldc_net, ldc_sum, ldc_item, ldc_itemamt
datetime	ldtm_date

li_row			= ads_chqspilt.rowcount() 
ldc_sum			= 0
ldc_net			= 0

for li_index = 1 to li_row
	ls_towhom	= trim( ads_chqspilt.object.as_towhom[li_index] )
	ldc_item		= ads_chqspilt.object.adc_money[li_index]
	
	if isnull( ls_towhom ) then ls_towhom = ""
	if isnull( ldc_item ) then ldc_item = 0
	
	if ( ls_towhom = "" )  OR ( ldc_item <= 0 ) then
		ithw_exception.text	= "กรุณากรอกข้อมูลรายการเช็ค ให้ครบถ้วนด้วย" 
		throw ithw_exception
	end if
	
	ldc_sum		= ldc_sum + ldc_item
next

li_row		= integer( ads_chqlist.describe( "Evaluate(' sum( if( ai_selected = 1, 1, 0 ) for all ) ' , 0 ) " ) )

if li_row = 0 or li_row > 1 then
	ithw_exception.text	= "กรุณาเลือกรายการที่ต้องการแตกเช็ค เพียงรายการเดียว"
	throw ithw_exception
end if

li_selected		= ads_chqlist.find( "ai_selected = 1 ", 1, ads_chqlist.rowcount( ) )
ldc_net			= ads_chqlist.object.item_amtnet[li_selected]
ls_slipno			= trim( ads_chqlist.object.slip_no[li_selected] )

// filter เพื่อให้มีแค่ row ที่เลือกทำรายการเท่านั้น
ads_chqlist.setfilter( "slip_no = '" +ls_slipno+ "'" )
ads_chqlist.filter()

if isnull( ldc_net ) then ldc_net = 0
if  ( ldc_net <= 0 ) then
	ithw_exception.text	= "รายการที่เลือกมียอด น้อยกว่าหรือเท่ากับ 0"
	throw ithw_exception
end if

// หายอดที่พิมพ์เช็คก่อนหน้า // by Phai
select	sum( MONEY_AMT )
into		:ldc_itemamt
from		finchqeuestatement a , finbridgechq b
where	a.CHEQUEBOOK_NO  	= b.CHEQUEBOOK_NO 	and
			a.BANK_CODE			= b.BANK_CODE	and
			a.BANK_BRANCH 		= b.BANK_BRANCH and
			a.CHEQUE_NO 			= b.CHEQUE_NO and
			b.SLIP_NO				= :ls_slipno and
			a.USE_STATUS			= 1 and
			b.COOP_ID	= :as_branch and
			BRIDGE_STATUS		not in ( -1, -9 ) 
using itr_sqlca ;
				
if isnull( ldc_itemamt ) then ldc_itemamt = 0

if ( ldc_itemamt + ldc_sum ) > ldc_net then
	ithw_exception.text	= "ยอดรวมจ่ายมากกว่า ยอดที่เลือกแยกเช็ค"
	throw ithw_exception
end if

idc_mainslip	= ldc_net
idc_sumsplit	= ldc_itemamt + ldc_sum

ads_chqlist.accepttext()
return Success
end function

public function integer of_init_paychq_split (string as_branch, datetime adtm_wdate, ref string as_chqcond_xml, ref string as_cutbank_xml, ref string as_chqtype_xml, ref string as_chqlist_xml) throws Exception;/***********************************************
<description>
	ขอ XMLConfig ที่เกี่ยวกับ การพิมพ์เช็คหลายใบจาก 1 สลิป
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	adtm_wdate				วันที่ทำการ
	as_chqcond_xml		XMLConfig สำหรับเงื่อนไขการพิมพ์เช็ค, ส่งมาเพื่อรับค่ากลับไป.
	as_cutbank_xml		XMLConfig สำหรับตัดบัญชีธนาคาร, ส่งมาเพื่อรับค่ากลับไป.
	as_chqtype_xml		XMLConfig สำหรับประเภทเช็คที่จะพิมพ์, ส่งมาเพื่อรับค่ากลับไป.
	as_chqlist_xml			XMLConfig สำหรับรายการจ่ายเป็นเช็ค, ส่งมาเพื่อรับค่ากลับไป.
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_init_paychq_split()
	
	Integer li_return
	String ls_cond_xml, ls_bankcut_xml, ls_chqtype_xml, ls_chqlist_xml , ls_branch
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_init_paychq_split( ls_branch,  ldtm_wdate ,  ls_cond_xml, ls_bankcut_xml, ls_chqtype_xml, ls_chqlist_xml )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
</usage>
************************************************/

string		ls_chqdefault
// Impost String XML----------------------------------------------------
n_ds lds_chqlist , lds_cutbank , lds_chqtype , lds_cond

// เงื่อนไขการพิมพ์เช็ค
lds_cond = create n_ds
lds_cond.dataobject = "d_conditionprint_cheque" 
lds_cond.insertrow( 0 )


// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_chequelist_fromslip_split" 
lds_chqlist.settransobject( itr_sqlca )

lds_chqlist.retrieve( adtm_wdate , as_branch )

// ตัดยอดบัญชีธนาคาร
lds_cutbank	= create n_ds
lds_cutbank.dataobject = "d_chqprint_cutfrom" 
lds_cutbank.insertrow( 0 )

// ประเภทเช็คทำรายการ
lds_chqtype	= create n_ds
lds_chqtype.dataobject = "d_chqprint_chqtype" 
lds_chqtype.insertrow( 0 )

//------------------------------------------------------------------------
SELECT	CHQTYPE_DEFAULT
INTO		:ls_chqdefault
FROM		FINCONSTANT  
using	itr_sqlca	;

// กำหนดค่า ประเภทเช็ค
if isnull( ls_chqdefault ) then ls_chqdefault = "01"
if ls_chqdefault <> "" then
	lds_chqtype.object.as_chqprint_chqtype[1]	= ls_chqdefault
end if

lds_chqtype.object.ai_chqstatus[1] 			= 8
lds_chqtype.object.ai_prndate[1] 				= 1

// กำหนดค่า เงื่อนไขพิมพ์เช็ค
lds_cond.object.adtm_date[1]					= adtm_wdate
lds_cond.object.as_printtype[1]				= "LAS"

// กำหนดค่า ตัดบัญชีธนาคาร
lds_cutbank.object.ai_chqsize[1]				=	1

lds_cond.accepttext( )
lds_chqtype.accepttext( )
lds_cutbank.accepttext( )
lds_chqlist.accepttext( )

as_chqcond_xml		=	lds_cond.describe( "Datawindow.Data.Xml" )
as_cutbank_xml		=	lds_chqtype.describe( "Datawindow.Data.Xml" )
as_chqtype_xml		=	lds_cutbank.describe( "Datawindow.Data.Xml" )
as_chqlist_xml = ""
if lds_chqlist.rowcount( ) > 0 then
	as_chqlist_xml			=	lds_chqlist.describe( "Datawindow.Data.Xml" )
end if

destroy lds_chqlist 
destroy lds_cutbank 
destroy lds_chqtype 
destroy lds_cond

return success
end function

public function integer of_setcolumndatamodified (ref n_ds ads_data);long ll_row , ll_index
	// ทำการนับจำนวน column ของ Datawindow
		ll_row	= integer( ads_data.Object.DataWindow.Column.Count )
		for ll_index = 1 to ll_row
			ads_data.setitemstatus( 1 , ll_index  ,Primary! , DataModified!)
		next 
		ads_data.setitemstatus( 1 , 0 ,Primary! , DataModified!)
		
return success
end function

public function integer of_close_day (string as_appname, string as_closeday_xml, string as_chqwait_xml) throws Exception;/***********************************************
<description>
	บันทึกการทำรายการปิดงานสิ้นวัน สรุปยอดเงินสดยกไป , ยอดเงินสดเข้า , ยอดเงินสดออก , ยอดเช็คค้างเซฟ
	และทำรายการเปลี่ยนสถานะเป็นปิดสิ้นวัน
</description>

<arguments>	
	as_appname		ชื่อระบบงานปัจจุบัน
	as_closeday_xml	ข้อมูลการปิดงานสิ้นวัน 
	as_chqwait_xml	ข้อมูลเช็คค้างเซฟ 
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_close_day()
	
	Integer li_return 
	String  ls_appname , ls_closeday_xml , ls_chqwait_xml 
	
	li_return = lnv_finservice.of_close_day( ls_appname , ls_closeday_xml , ls_chqwait_xml  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
</usage>
************************************************/

dec{2}	ldc_itemamt, ldc_cashin, ldc_cashout, ldc_cashsum_amt
dec{2}	ldc_balforward
datetime	ldtm_operatedate, ldtm_entrydate
string	ls_coopid,ls_entry_id, ls_machineid, ls_approve, ls_item_desc
string	ls_type_code, ls_slipno, ls_DOC	= "FINCASHSLIPNO"
integer	li_typeflag, li_lastseq_no , li_closestatus , li_rc 

n_ds		lds_closeday , lds_chqwait

lds_closeday = create		n_ds
lds_closeday.dataobject = "d_close_day"
lds_closeday.settransobject( itr_sqlca )

if not isnull( as_closeday_xml ) and trim( as_closeday_xml ) <> "" then
	this.of_importstring_xml( lds_closeday , as_closeday_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลการปิดวัน ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_chqwait = create		n_ds
lds_chqwait.dataobject = "d_waitchq_list"

if not isnull( as_chqwait_xml ) and trim( as_chqwait_xml ) <> "" then
	this.of_importstring_xml( lds_chqwait , as_chqwait_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเช็ค หรือ ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_closeday.accepttext()

li_lastseq_no		= lds_closeday.GetitemNumber( 1, "lastseq_no" )
ls_coopid		= lds_closeday.GetitemString( 1, "coop_id" )
ls_entry_id			= lds_closeday.GetitemString( 1, "entry_id" )
ls_machineid		= lds_closeday.GetitemString( 1, "machine_id" )
ls_approve			= ls_entry_id
ldc_itemamt			= lds_closeday.GetitemDecimal( 1, "cash_amt" )
ldtm_operatedate	= lds_closeday.GetitemDateTime( 1, "operate_date" )
ldtm_entrydate		= lds_closeday.GetitemDateTime( 1, "entry_date" )
ldc_cashin			= lds_closeday.GetitemDecimal( 1, "cash_in" )
ldc_cashsum_amt	= lds_closeday.GetitemDecimal( 1, "cash_foward" )
ldc_cashout			= lds_closeday.GetitemDecimal( 1, "cash_out" )

ls_type_code		= 'CLS'
ldc_balforward		= ldc_cashsum_amt
li_typeflag			= -1
ls_item_desc		= "ปิดงานประจำวัน"

// ตรวจสอบสถานะการปิดสิ้นวัน
li_closestatus = this.of_is_close_day( ls_coopid , as_appname , ldtm_operatedate )
if li_closestatus = 1 then
	ithw_exception.text	= "ไม่สามารถทำรายการได้ เนื่องจากได้ปิดสิ้นวันแล้ว"
	throw ithw_exception
end if 

// ตรวจสอบรายการรับ-จ่ายประจำวัน
//li_rc			= this.of_is_recvpay_pending( ls_coopid , ldtm_operatedate   )
//
//if li_rc > 0 then
	//ithw_exception.text	= "ยังมีรายการรับ-จ่ายที่ไม่ได้ทำรายการค้างอยู่ กรุณาตรวจสอบ"
	//throw ithw_exception
//end if

// ทำการดึงเช็คมาอีกครั้งเผื่อลือดึงเพื่อต้องทำการนำส่งเช็ค
this.of_retrievechq(	ls_coopid  , ldtm_operatedate )

// ตรวจสอบการผ่านรายการธนาคาร
li_rc	=	this.of_is_posttobank( ls_coopid  , ldtm_operatedate )
if li_rc > 0 then 
	ithw_exception.text	= "ไม่สามารถทำรายการได้ เนื่องจากผ่านรายการธนาคาร ยังไม่ครบ "
	throw ithw_exception
end if

// ตรวจสอบการปิดลิ้นชัก
li_rc	 = this.of_is_open_allteller( ls_coopid  , ldtm_operatedate )
if li_rc > 0 then 
	ithw_exception.text	= "ไม่สามารถปิดงานสิ้นวันได้ เนื่องจากยังไม่ทำการปิดลิ้นชักของทุกคน "
	throw ithw_exception
end if

// ตรวจสอบการนำส่งเช็ค
this.of_sendchqall( ls_coopid  , ldtm_operatedate )

// เริ่มทำรายการ ทำการปรับปรุงรายการเคลื่อนไหวการปิดงานประจำวัน
ls_slipno		=  this.of_get_lastslip_docno( ls_DOC )
if trim( ls_slipno ) = "" or isnull( ls_slipno ) then
	ithw_exception.text	= "ไม่สามารถสร้างเลขที่เอกสารได้"
	throw ithw_exception
end if

lds_closeday.object.close_status[1]  = 1
lds_closeday.object.close_date[1]  = ldtm_entrydate

lds_closeday.accepttext()

this.of_setcolumndatamodified(lds_closeday)
//lds_closeday.setitemstatus( 1 , 0 ,Primary! , DataModified!)

//li_rc  = lds_closeday.update( ) 
update fincashflowmas
set		cash_amt		= :ldc_itemamt	 ,
		cash_foward		= :ldc_balforward ,
		close_id		= :ls_entry_id ,
		close_date		= :ldtm_entrydate,
		close_status	= 1,
		close_time		= :ldtm_entrydate 
where coop_id			= :ls_coopid
and operate_date		= :ldtm_operatedate
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูลลง FINCASHFLOWMAS ได้ " + itr_sqlca.sqlerrtext
	rollback using	itr_sqlca ;
	throw ithw_exception
end if

li_lastseq_no ++

// เพิ่มข้อมูลลงรายการเคลื่อนไหว
INSERT INTO FINRQ_CASHFLOWSTAT
	(	OPERATE_DATE,		SEQ_NO,					FINSLIP_NO,
		ITEM_AMT,					BAL_FORWARD,			BALANCE_AMT,
		ENTRY_ID,					ENTRY_DATE,			APPROVE_DATE,
		APPROVE_ID,				ITEM_FLAG,				ITEM_TYPECODE,
		MACHINE_ID,				COOP_ID,		item_desc
	)  
VALUES
	(	:ldtm_operatedate,		:li_lastseq_no,			:ls_slipno,
		0,								:ldc_balforward,		:ldc_cashsum_amt,
		:ls_entry_id,					:ldtm_entrydate,		:ldtm_entrydate,
		:ls_approve,				:li_typeflag,				:ls_type_code,
		:ls_machineid,				:ls_coopid,		:ls_item_desc
	)  using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูลลง FINRQ_CASHFLOWSTAT ได้  " + itr_sqlca.sqlerrtext
	rollback using	itr_sqlca ;
	throw ithw_exception
end if

//ทำการสรุปยอดธนาคารคงเหลือประจำวัน
this.of_trackingbank(	ls_coopid  , ldtm_operatedate )

// ทำการปรับปรุงค่าในเช็คค้างเซฟ
this.of_updatechqin_safe(	ls_coopid  , ldtm_operatedate  , lds_chqwait  )

// ตรวจสอบการปิดงานทุกสาขา
select count(*)
into	:li_rc
from fincashflowmas a, cmcoopmaster b 
where a.coop_id = b.coop_id and
		close_status = 0	and
		coop_control = :is_coopcontrl
using  itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	li_rc = 0 
end if

if li_rc < 1 then
	// ทำการปรับปรุงการปิดงาน
	this.of_updateclosestatus(	is_coopcontrl  , ls_entry_id , as_appname , ldtm_operatedate  )
end if

commit 	using	itr_sqlca ;
return Success
end function

public function integer of_postfincontrol (n_ds ads_cashmas, string as_machine_id) throws Exception;/***********************************************
<description>
	ทำการบันทึกข้อมูลการเคลื่อนไหวเงินสด และยอดคงเหลือเงินสดสหกรณ์ปัจจุบัน
</description>

<arguments>
  	ads_cashmas	ข้อมูลการทำรายการควบคุมเงินสด
	as_machine_id	ชื่อเครื่องที่ทำรายการ
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postfincontrol()
	
	Integer li_return 
	String ls_machine_id
	n_ds	lds_cashmas
	
	li_return = lnv_finservice.of_postfincontrol( lds_cashmas , ls_machine_id  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/9/2010 by PhaiWaan
	Version 1.1 กำหนดเลขที่เอกสารการควบคุมเงินสด Modified Date 9/10/2010 by PhaiWaan
</usage>
************************************************/

dec{5}		ldc_itemamt, ldc_cashin, ldc_cashout, ldc_cashsum_amt
dec{5}		ldc_balforward
datetime	ldtm_operatedate, ldtm_entrydate
string		ls_coop_id,ls_entry_id,  ls_approve, ls_item_desc, ls_app
string		ls_type_code, ls_slipno , ls_DOC	= "FINCASHSLIPNO"
integer		li_typeflag, li_lastseq_no , li_itemtype

ls_slipno		=  this.of_get_lastslip_docno( ls_DOC )
ls_coop_id		= trim( ads_cashmas.object.coop_id[1] )
//ls_slipno= inv_docservice.of_getnewdocno( ls_coop_id,ls_DOC ) 

ads_cashmas.object.cash_slipno[1] = ls_slipno

ads_cashmas.setitemstatus( 1 , 0 ,Primary! , NewModified!)
if ads_cashmas.update() <> 1 then	
	ithw_exception.text	= "ไม่สามารถบันทึก fincashflowmas " + itr_sqlca.sqlerrtext 
	rollback using	itr_sqlca;
	throw ithw_exception
end if

ads_cashmas.accepttext( )


ldtm_operatedate	= ads_cashmas.object.operate_date[1]


if trim( ls_slipno ) = "" or isnull( ls_slipno ) then
	ithw_exception.text	= "ไม่สามารถสร้างเลขที่เอกสารได้"
	throw ithw_exception
end if


SELECT		CASH_SUMAMT, lastseq_no, cash_in, cash_out
INTO			:ldc_cashsum_amt, :li_lastseq_no, :ldc_cashin, :ldc_cashout
FROM		FINCASHFLOWMAS
WHERE		( OPERATE_DATE 	= :ldtm_operatedate ) and
				( coop_id		= :ls_coop_id )
using		itr_sqlca		;

if isnull( ldc_cashsum_amt ) then ldc_cashsum_amt = 0
if isnull( li_lastseq_no ) then li_lastseq_no = 0
if isnull( ldc_cashin ) then ldc_cashin = 0
if isnull( ldc_cashout ) then ldc_cashout = 0

//ls_coop_id		= ls_coop_id
ls_approve			= ads_cashmas.object.permis_id[1]
ls_entry_id			= ads_cashmas.object.entry_id[1]

ldc_itemamt			= ads_cashmas.object.operate_amt[1]
ls_app				= trim( ads_cashmas.object.application[1] )
li_itemtype			= ads_cashmas.object.item_type[1]
ldtm_entrydate		= ldtm_operatedate

if isnull( ldc_itemamt ) then ldc_itemamt = 0

choose case ls_app
	case 'DEP'
		ls_app	= "เงินฝาก"
	case 'FIN'
		ls_app	= "การเงิน"
	case 'SHL'
		ls_app	= "หุ้นหนี้"
end choose

choose case li_itemtype
	case ITEM_MODE_OPEN, ITEM_MODE_RECIEVE
		ls_type_code			= 'PAY'
		ldc_cashout			+= ldc_itemamt
		ldc_cashsum_amt	-= ldc_itemamt
		li_typeflag				= -1
		ls_item_desc			= "ส่ง"  + ls_app
		
	case ITEM_MODE_RETURN, ITEM_MODE_CLOSE
		ls_type_code			= 'RCV'
		ldc_cashin				+= ldc_itemamt
		ldc_cashsum_amt	+= ldc_itemamt
		li_typeflag				= 1
		ls_item_desc			= "รับคืน"  + ls_app
		
end choose

li_lastseq_no ++

// เพิ่มข้อมูลลงรายการเคลื่อนไหว
INSERT INTO FINRQ_CASHFLOWSTAT
	(	OPERATE_DATE,				SEQ_NO,					FINSLIP_NO,
		ITEM_AMT,						BAL_FORWARD,			BALANCE_AMT,
		ENTRY_ID,						ENTRY_DATE,			APPROVE_DATE,
		APPROVE_ID,					ITEM_FLAG,				ITEM_TYPECODE,
		MACHINE_ID,						COOP_ID,		item_desc
	)  
VALUES
	(	:ldtm_operatedate,			:li_lastseq_no,			:ls_slipno,
		:ldc_itemamt,					:ldc_balforward,			:ldc_cashsum_amt,
		:ls_entry_id,						:ldtm_entrydate,		:ldtm_entrydate,
		:ls_approve,						:li_typeflag,				:ls_type_code,
		:as_machine_id,					:ls_coop_id,			:ls_item_desc
	)  
using		itr_sqlca	;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูลลง FINRQ_CASHFLOWSTAT ได้ " + itr_sqlca.sqlerrtext 
	rollback	using		itr_sqlca ;
	throw ithw_exception
end if

UPDATE	FINCASHFLOWMAS
SET			CASH_SUMAMT	= :ldc_cashsum_amt,
				CASH_IN				= :ldc_cashin,
				CASH_OUT			= :ldc_cashout,
				lastseq_no			= :li_lastseq_no
WHERE		OPERATE_DATE	= :ldtm_operatedate  and
				coop_id		= :ls_coop_id 
using			itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูลลง FINCASHFLOWMAS ได้ " + itr_sqlca.sqlerrtext 
	rollback	using		itr_sqlca ;
	throw ithw_exception
end if


return Success
end function

private function integer of_chkslip_completechq (n_ds ads_main) throws Exception;string	ls_errtext
string	ls_temp
integer	li_index

li_index		= 0
ls_errtext	= ""

ls_temp		= ads_main.GetitemString( 1 , "bank_code" )
if isnull( ls_temp ) or trim( ls_temp ) = "" then
	li_index ++
	if li_index = 1 then
		ls_errtext	= "ป้อนข้อมูลไม่ครบ"		
	end if
	
	ls_errtext		= ls_errtext + "~r~n"+ string( li_index ) + " ธนาคาร"
end if

ls_temp		= ads_main.GetitemString( 1 , "bank_branch" )
if isnull( ls_temp ) or trim( ls_temp ) = "" then
	li_index ++
	if li_index = 1 then
		ls_errtext		= "ป้อนข้อมูลไม่ครบ"		
	end if
	
	ls_errtext		= ls_errtext + "~r~n"+ string( li_index ) + " สาขาธนาคาร"
end if

ls_temp		= ads_main.GetitemString( 1 , "account_no" )
if isnull( ls_temp ) or trim( ls_temp ) = "" then
	li_index ++
	if li_index = 1 then
		ls_errtext		= "ป้อนข้อมูลไม่ครบ"		
	end if
	
	ls_errtext		= ls_errtext + "~r~n"+ string( li_index ) + " เลขที่เช็ค"
end if

ls_temp		= string( ads_main.GetitemDateTime( 1 , "dateon_chq" ) , 'dd/mm/yyyy' )
if isnull( ls_temp ) or trim( ls_temp ) = "" then
	li_index ++
	if li_index = 1 then
		ls_errtext		= "ป้อนข้อมูลไม่ครบ"		
	end if
	
	ls_errtext		= ls_errtext + "~r~n"+ string( li_index ) + " วันที่หน้าเช็ค"
end if


if len( ls_errtext ) > 0 then
	ithw_exception.text	= ls_errtext
	throw ithw_exception
end if


return success
end function

public function integer of_init_fincontact (ref string as_contact_xml) throws Exception;string		ls_contactno,ls_coopid
integer	li_row
n_ds		lds_contact	

lds_contact	= create n_ds
lds_contact.dataobject = "d_fin_contackmaster" 
lds_contact.settransobject( itr_sqlca )

if not isnull( as_contact_xml ) and trim( as_contact_xml ) <> "" then
	this.of_importstring_xml( lds_contact , as_contact_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลบุคคลภายนอก ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ls_contactno = trim( lds_contact.object.contack_no[1]  ) 
ls_coopid = trim( lds_contact.object.coop_id[1]  ) 
li_row = lds_contact.retrieve(ls_coopid, ls_contactno  )

if li_row < 1 then
	destroy lds_contact
	ithw_exception.text	= "ไม่มีข้อมูลบุคคลภายนอก "
	throw ithw_exception
end if


as_contact_xml		=	lds_contact.describe( "Datawindow.Data.Xml" )
destroy lds_contact

return		success
end function

public function integer of_postfincontact (string as_contact_xml, string as_action) throws Exception;string		ls_accno, ls_coopid, ls_membformat
integer	li_rc, li_index 
n_ds		lds_contact	

lds_contact	= create n_ds
lds_contact.dataobject = "d_fin_contackmaster" 
lds_contact.settransobject( itr_sqlca )

if not isnull( as_contact_xml ) and trim( as_contact_xml ) <> "" then
	this.of_importstring_xml( lds_contact , as_contact_xml )
else
	destroy lds_contact
	ithw_exception.text	= "ไม่มีข้อมูลบุคคลภายนอก ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ls_coopid = lds_contact.object.coop_id[ 1 ]

if ls_coopid  = "" or isnull( ls_coopid  ) then
	ls_coopid  = inv_db.is_coopcontrol
end if
string		ls_persontype_code, ls_first_name, ls_last_name, ls_tax_id, ls_address_no, ls_soi_no, ls_prename_code, ls_accid, ls_bankcode
string		ls_email_addr,	ls_phene_no, ls_mobile_no, ls_fax_no, ls_district, ls_subdistrict, ls_postcode, ls_province, ls_road_name, ls_bankbranch

ls_persontype_code 	= lds_contact.object.persontype_code[ 1 ]
ls_prename_code		= lds_contact.object.prename_code[ 1 ]
ls_first_name			= lds_contact.object.first_name[ 1 ]
ls_last_name			= lds_contact.object.last_name[ 1 ]
ls_tax_id					= lds_contact.object.tax_id[ 1 ]
ls_address_no			= lds_contact.object.address_no[ 1 ]
ls_soi_no					= lds_contact.object.soi_no[ 1 ]
ls_road_name			= lds_contact.object.road_name[ 1 ]
ls_email_addr			= lds_contact.object.email_addr[ 1 ]
ls_phene_no			= lds_contact.object.phene_no[ 1 ]
ls_mobile_no			= lds_contact.object.mobile_no[ 1 ]
ls_fax_no				= lds_contact.object.fax_no[ 1 ]
ls_district				= lds_contact.object.district[ 1 ]
ls_subdistrict			= lds_contact.object.subdistrict[ 1 ]
ls_postcode				= lds_contact.object.postcode[ 1 ]
ls_province				= lds_contact.object.province[ 1 ]
ls_accid					= lds_contact.object.acc_id[ 1 ]
ls_bankcode				= lds_contact.object.bank_code[ 1 ]
ls_bankbranch			= lds_contact.object.bank_branch[ 1 ]

if as_action = "ADD" then
	
	select 	membno_format
	into 		:ls_membformat
	from 		cmcoopconstant
	using 		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy lds_contact
		ithw_exception.text	= "ไม่สามารถหาค่าคงที่ความยาวจำนวนเลขที่สมาชิก"
		throw ithw_exception
	end if
	
	SELECT	max(contack_no)  
	INTO		:ls_accno  
	FROM		FINCONTACKMASTER
	WHERE 	coop_id = :ls_coopid
	using 		itr_sqlca ;
	
	if itr_sqlca.sqlcode = -1 then
		destroy lds_contact
		ithw_exception.text	= "ไม่สามารถหาเลขที่บุคคลภายนอกล่าสุดได้"
		throw ithw_exception
	end if
	
	if isnull( ls_accno ) then ls_accno = '0'
	
	ls_accno		= right( "0000000000" + string( long( ls_accno ) + 1   ) , len( ls_membformat ) ) 
	
	
	 INSERT INTO FINCONTACKMASTER  
         ( 	COOP_ID,   		CONTACK_NO,   	PERSONTYPE_CODE,   	PRENAME_CODE,   	FIRST_NAME,   		LAST_NAME,   
           	TAX_ID,   		ADDRESS_NO,   	SOI_NO,   					ROAD_NAME,   			EMAIL_ADDR,   		PHENE_NO,   
           	MOBILE_NO,   	FAX_NO,   			DISTRICT,   	           	SUBDISTRICT,   		POSTCODE,   			PROVINCE,
			ACC_ID,			BANK_CODE,		BANK_BRANCH)  
  VALUES
  (			:ls_coopid,		:ls_accno,			:ls_persontype_code,		:ls_prename_code,	:ls_first_name,			:ls_last_name,
  			:ls_tax_id,		:ls_address_no,	:ls_soi_no,					:ls_road_name,		:ls_email_addr,			:ls_phene_no,			
			:ls_mobile_no,	:ls_fax_no,			:ls_district,					:ls_subdistrict,			:ls_postcode,			:ls_province,
			:ls_accid,		:ls_bankcode,		:ls_bankbranch
  ) using itr_sqlca;
   
	if itr_sqlca.sqlcode <> 0 then
		//by num
		DESTROY	lds_contact
	
		ithw_exception.text	= "ไม่สามารถเพิ่ม บุคคลภายนอกได้ "+itr_sqlca.sqlerrtext 
		rollback using itr_sqlca;
		throw ithw_exception
	end if

elseif (as_action = "EDIT" ) then
	
	ls_accno				= lds_contact.object.contack_no[ 1 ]
	
	update FINCONTACKMASTER
	set		PERSONTYPE_CODE	= :ls_persontype_code,   	
			PRENAME_CODE		= :ls_prename_code,   	
			FIRST_NAME			= :ls_first_name,   		
			LAST_NAME				= :ls_last_name,   
           	TAX_ID					= :ls_tax_id,   		
			ADDRESS_NO			= :ls_address_no,   	
			SOI_NO					= :ls_soi_no,   					
			ROAD_NAME			= :ls_road_name,   			
			EMAIL_ADDR			= :ls_email_addr,   		
			PHENE_NO				= :ls_phene_no,   
           	MOBILE_NO				= :ls_mobile_no,   	
			FAX_NO					= :ls_fax_no,   			
			DISTRICT				= :ls_district,   	           	
			SUBDISTRICT			= :ls_subdistrict,   		
			POSTCODE				= :ls_postcode,   			
			PROVINCE				= :ls_province,
			acc_id					= :ls_accid,
			bank_code				= :ls_bankcode,
			bank_branch			= :ls_bankbranch
	where coop_id 					= :ls_coopid
	and	CONTACK_NO			= :ls_accno
	 using itr_sqlca;
	 
	if itr_sqlca.sqlcode <> 0 then
		//by num
		DESTROY	lds_contact
	
		ithw_exception.text	= "ไม่สามารถแก้ไข บุคคลภายนอกได้ "+itr_sqlca.sqlerrtext 
		rollback using itr_sqlca;
		throw ithw_exception
	end if

end if

destroy( lds_contact ) 

return success
end function

public function integer of_postcancelposttobank (string as_branch, string as_entry, datetime adtm_wdate, string as_machine, string as_banklist_xml) throws Exception;string	ls_accid, ls_accno
dec{2}	ldc_itemamt
integer	li_flag, li_itemflag, li_rc, li_select , li_found
long		ll_index, ll_seqno , ll_row

n_ds		lds_data

lds_data = create		n_ds
lds_data.dataobject = "d_fin_posttobank_list"

if not isnull( as_banklist_xml ) and trim( as_banklist_xml ) <> "" then
	this.of_importstring_xml( lds_data , as_banklist_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลการผ่านรายการธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ll_row			= lds_data.rowcount()
li_found		= lds_data.find( "select_flag = 1" , 1 , ll_row )

do while (li_found	> 0)
	
	li_itemflag		= lds_data.object.post_flag[li_found]
	ldc_itemamt		= lds_data.object.item_amt[li_found]
	ls_accid			= lds_data.object.account_id[li_found]
	ls_accno			= lds_data.object.account_no[li_found]
	ll_seqno			= lds_data.object.seq_no[li_found]
	li_flag			= lds_data.object.item_flag[li_found]
	
	choose case li_itemflag
		case 0 // ยังรอผ่านอยู่
			// ปรับปรุงรายการว่า ยกเลิกผ่านรายการ
			UPDATE	FINITEMPOSTTOBANK
			SET		POST_FLAG		= -9
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.SEQ_NO			= :ll_seqno) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch )   
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถปรับปรุง รายการเคลื่อนไหวธนาคารได้"
				rollback	using itr_sqlca ;
				throw ithw_exception
			end if
			
		case 1 // ผ่านรายการแล้ว
//			li_rc	= inv_finsrv.of_posttobank( ls_accid, ldc_itemamt, li_flag * (-1) , ls_accno )
			this.of_posttobank(as_branch , as_entry , adtm_wdate , as_machine, ls_accid, ldc_itemamt ,  li_flag * (-1)  )		
			
			// ปรับปรุงรายการว่า ยังรอผ่านรายการ
			UPDATE	FINITEMPOSTTOBANK
			SET		POST_FLAG		= 0
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.SEQ_NO			= :ll_seqno) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch )   
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถปรับปรุง รายการเคลื่อนไหวธนาคารได้"
				rollback	using itr_sqlca ;
				throw ithw_exception
			end if
			
		case -9 // รายการที่ถูกยกเลิกไปแล้ว
			// ปรับปรุงรายการว่า ยังรอผ่านรายการ
			UPDATE	FINITEMPOSTTOBANK
			SET		POST_FLAG		= 0
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.SEQ_NO			= :ll_seqno) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch )   
			using itr_sqlca ;
						
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถปรับปรุง รายการเคลื่อนไหวธนาคารได้"
				rollback	using itr_sqlca ;
				throw ithw_exception
			end if
			
			
	end choose
			
	li_found++
	if li_found > ll_row then
		exit 
	end if
	li_found		= lds_data.find( "select_flag = 1" , li_found , ll_row )
	
loop

commit using itr_sqlca ;
return success
end function

private function string of_cnv_totdate_cheque (datetime adtm_datetime);string	ls_tdate,ls_temp

ls_temp	= string( adtm_datetime, "ddmm" )+string( year( date( adtm_datetime ) )+543 )
ls_tdate	= mid(ls_temp,1,1)+'    '+mid(ls_temp,2,1)+'    '+mid(ls_temp,3,1)+'    '+mid(ls_temp,4,1)+'    '+mid(ls_temp,5,1)+'    '+mid(ls_temp,6,1)+'    '+mid(ls_temp,7,1)+'    '+mid(ls_temp,8,1)


return ls_tdate
end function

private function string of_cnv_totmsdate (datetime adtm_datetime);string	ls_year, ls_tdate, ls_day
string	ls_tday[ 7 ] = { "อาทิตย์", "จันทร์", "อังคาร", "พุธ", "พฤหัสบดี", "ศุกร์", "เสาร์" }
string	ls_month[ 12 ] = { "มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม" }
integer	li_month, li_daynum

ls_year		= string( year( date( adtm_datetime ) )+543 )

ls_day		= string( day( date( adtm_datetime ) ) )

li_month	= month( date( adtm_datetime ) )


li_daynum	= daynumber( date( adtm_datetime ) )


//ls_tdate	= "วัน"+ls_tday[ li_daynum ]+" ที่ "+ls_day+" "+ls_month[ li_month ]+" "+ls_year
ls_tdate	= ls_day+" "+ls_month[ li_month ]+" "+ls_year


return ls_tdate
end function

public function integer of_caltax (ref string as_main_xml, ref string as_taxdet_xml) throws Exception;/***********************************************
<description>
	เป็นการคำนวณภาษีหัก ณ ที่จ่าย จากยอดรวม
</description>

<arguments>	
	as_main_xml		ข้อมูลการรับ-จ่ายหลัก , ส่งคืนค่ากลับ
	as_taxdet_xml		ข้อมูลรายละเอียดผู้เสียภาษี , ส่งคืนค่ากลับ
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_caltax()
	
	Integer li_return 
	String ls_main_xml , ls_taxdet_xml
	
	li_return = lnv_finservice.of_caltax( ls_main_xml , ls_taxdet_xml )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
	Version 1.1 (แก้การกำหนดข้อมูลรายละเอียดของผู้เสียภาษี ) Modified Date 13/10/2010 by Phaiwaan
</usage>
************************************************/

string 	ls_membno , ls_memaddr , ls_taxid , ls_coopid , ls_dwobjectname
dec{4}	ldc_taxrate, ldc_taxconstantrate
dec{2}	ldc_taxamt, ldc_net, ldc_itemamt, ldc_temptax, ldc_tempamt, ldc_sub, ldc_taxkeep , ldc_vat
integer	li_taxflag, li_taxwaykeep, li_found , li_vat , li_code , li_membflag , li_includevat

n_ds		lds_main , lds_tax 

// ชื่อ Datawindow ที่ใช้
ls_dwobjectname 	= inv_print_srv.of_getdataobject( as_main_xml )

lds_main		=	create n_ds
lds_main.dataobject = ls_dwobjectname
lds_main.settrans( itr_sqlca )

if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_main , as_main_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลรับ-จ่าย ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_tax = create n_ds
lds_tax.dataobject = "d_fin_taxdetail" 
lds_tax.insertrow( 0 )

// get Child Datawindow เพื่อดึง อัตราภาษี
datawindowchild	ldwc_taxtype

lds_main.getchild( "tax_code", ldwc_taxtype )
ldwc_taxtype.settransobject( itr_sqlca )
ldwc_taxtype.retrieve( )

if isnull( ldc_sub  ) then ldc_sub = 0

li_taxflag			= lds_main.object.tax_flag[1]
ldc_itemamt		= lds_main.object.itempay_amt[1]
ldc_taxkeep		= lds_main.object.tax_amt[1]
li_taxwaykeep	= lds_main.object.taxwaykeep[1]
li_code			=lds_main.object.tax_code[1]
ls_membno		=trim( lds_main.object.member_no[1] )
li_membflag		=lds_main.object.member_flag[1]
ls_coopid		=lds_main.object.coop_id[1]

ldc_taxconstantrate	= dec( this.of_getattribconstant( "tax_rate" , "DECIMAL") )



if isnull( ldc_taxconstantrate ) then ldc_taxconstantrate = 0
if isnull( ldc_taxkeep ) then ldc_taxkeep = 0
if isnull( li_taxwaykeep ) then li_taxwaykeep = 0

if isnull( li_taxflag ) then li_taxflag = 0

if isnull( ldc_itemamt ) then ldc_itemamt = 0

if li_taxflag = 0 then
	lds_main.object.item_amtnet[1]	= ldc_itemamt
	lds_main.object.tax_rate[1]		= 0	
	lds_main.object.tax_amt[1]		= 0
	lds_main.object.tax_flag[1]		= 0
	return 1
end if

ldwc_taxtype.setfilter( "tax_code = " + string( li_code ) )
ldwc_taxtype.filter( )

if ldwc_taxtype.rowcount() > 0 then
	li_found			= ldwc_taxtype.getrow()
	if li_found < 1 then li_found = 1
	ldc_taxrate		= ldwc_taxtype.getitemdecimal( li_found, "tax_rate" )
	string ls_taxdesc 
	ls_taxdesc = ldwc_taxtype.getitemstring( li_found, "tax_desc" )
else
	ldc_taxrate		= 0
end if

li_vat	= lds_main.object.vat_flag[1]
if isnull( li_vat) then li_vat = 0 

if isnull( ldc_taxrate ) then ldc_taxrate = 0

// แบบรวม VAT แล้ว
if li_includevat = 1 then
	ldc_taxconstantrate	= 100 + ( ldc_taxconstantrate * 100 )
	ldc_temptax				= ldc_itemamt - ( ldc_itemamt * 100 / ldc_taxconstantrate )
	ldc_temptax				=	round( ldc_temptax , 2)
	ldc_vat					= ldc_temptax
	ldc_tempamt	= ldc_itemamt - ldc_temptax
else
//	ldc_taxconstantrate	= ( ldc_taxconstantrate * 100 ) 
	ldc_temptax				= ( ldc_itemamt  *  ldc_taxconstantrate )
	ldc_temptax				=	round( ldc_temptax , 2)
	ldc_vat					= ldc_temptax
	ldc_tempamt	= ldc_itemamt + ldc_temptax
end if



if li_vat = 0 then
	ldc_temptax	= 0
	ldc_vat		= 0
end if


ldc_taxamt		= 0//ldc_tempamt * ldc_taxrate

if li_taxwaykeep = 1 then
	ldc_taxamt	= ldc_taxkeep
end if

ldc_net		= ldc_itemamt - ldc_taxkeep  + ldc_vat

lds_main.object.item_amtnet[1]	= ldc_net
//lds_main.object.tax_amt[1]			= ldc_taxamt
lds_main.object.vat_amt[1]			= ldc_vat

this.of_getaddress( ls_coopid,ls_memaddr , ls_taxid , ls_membno , li_membflag  )

lds_tax.object.taxpay_id[1] = trim( ls_taxid )
lds_tax.object.taxpay_addr[1] = trim( ls_memaddr )

lds_main.accepttext( )
lds_tax.accepttext( )

as_main_xml 	= lds_main.describe( "Datawindow.Data.XML" )
as_taxdet_xml 	= lds_tax.describe( "Datawindow.Data.XML" )

return success
end function

private function string of_getmembername (string as_membno);string	ls_membname

as_membno	= trim(as_membno)

select	mbucfprename.prename_short||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname  
into		:ls_membname
from	mbmembmaster, mbucfprename  
where	( mbmembmaster.prename_code = mbucfprename.prename_code )  and
		( mbmembmaster.member_no	= :as_membno )	and
		(mbmembmaster.coop_id = :is_coopcontrl)
using itr_sqlca ;

if isnull(ls_membname) then ls_membname = ""

return trim(ls_membname)
end function

public subroutine of_init () throws Exception;integer	li_row
is_coopcontrl	=  inv_db.is_coopcontrol

if isnull( is_coopcontrl ) or is_coopcontrl = '' then is_coopcontrl = '008001'

ids_constant = create n_ds
ids_constant.dataobject = "d_fn_finance_constant_attrib"
ids_constant.settransobject( itr_sqlca )
ids_constant.retrieve( is_coopcontrl )

li_row = ids_constant.rowcount()
is_receiptcode	= trim( string( this.of_getattribconstant( "receipt_code" , "string" )) )
is_payslipcode	= trim( string( this.of_getattribconstant( "payslip_code" , "string" )) )

// กำหนดสถานะการ Reprint
ii_reprint			= 0

inv_docservice = create n_cst_doccontrolservice	
inv_docservice.of_settrans( inv_db )

inv_datetime = create	n_cst_datetimeservice

inv_string	= create n_cst_stringservice

inv_print_srv	= create	n_cst_printservice
//inv_print_srv.of_reloadsetting( )

inv_dwxmliesrv	= create n_cst_dwxmlieservice

inv_calendar_srv	= create	n_cst_calendarservice
inv_calendar_srv.of_initservice( inv_db )
end subroutine

private function integer of_postpayoutto_finclr (string as_slipno, string as_branch, n_ds ads_data, integer ai_seqno) throws Exception;/***********************************************
<description>
	ทำการบันทึกรายละเอียดการหักกลับจากการจ่ายเงินกู้ หรือจ่ายคืนค่าหุ้น
</description>

<arguments>	
	as_slipno			เลขที่เอกสาร
	as_branch		รหัสสาขาสหกรณ์
	ads_data			ข้อมูลการหักกลบ
	as_seqno		ลำดับในการบันทึก
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postpayoutto_finclr()
	
	Integer li_return , li_seqno
	String ls_slipno , ls_branch 
	n_ds lds_data
	li_return = lnv_finservice.of_postpayoutto_finclr( ls_slipno , ls_branch  , lds_data , li_seqno )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/10/2010 by Phaiwaan
	Version 1.1 แก้ให้บันทึกแยกต้นเงิน กับ ดอกเบี้ยเงินกู้ Modified Date 22/10/2010 by Phaiwaan
</usage>
************************************************/

integer	li_index , li_row
string		ls_desc , ls_refsyst , ls_shrlontype_code , ls_accid_slipdet , ls_loanno
dec{2}	ldc_itempay_amt , ldc_prncclr , ldc_intclr

li_row = ads_data.rowcount()
for li_index = 1 to li_row
	ai_seqno++
	ldc_itempay_amt		= ads_data.object.item_payamt[ li_index ] 	
	ls_refsyst				= trim( ads_data.object.slipitemtype_code[li_index] )
	ls_shrlontype_code	= trim( ads_data.object.shrlontype_code[li_index] )
	ls_loanno				= trim( ads_data.object.loancontract_no[li_index] )
	ldc_prncclr 				= ads_data.object.principal_payamt[li_index]
	ldc_intclr					= ads_data.object.interest_payamt[li_index]

	if isnull( ldc_itempay_amt ) then ldc_itempay_amt = 0.00
	if isnull( ldc_prncclr ) then ldc_prncclr = 0.00
	if isnull( ldc_intclr ) then ldc_intclr = 0.00
	
	if ls_refsyst = "LON" and ldc_prncclr > 0 then
		ls_desc		= "หักเพื่อชำระต้นสัญญาเลขที่ " + ls_loanno
		ldc_itempay_amt	=	ldc_prncclr
	else
		ls_desc		= trim( ads_data.object.slipitem_desc[ li_index ]  ) 
		ls_desc	= ls_desc + "  " + ls_loanno
	end if

	// หาคู่บัญชี ----------------------
	select account_id 
	into 	:ls_accid_slipdet
	from vcmapaccid
	where  system_code = 'LON'
	and slipitemtype_code = :ls_refsyst
	and shrlontype_code = :ls_shrlontype_code
	and shrlontype_status = 1
	using itr_sqlca ;
	
	if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ""
	//----------------------------------------------------
	

	INSERT INTO FINSLIPDET  
	( 	SLIP_NO,              		COOP_ID,              		SEQ_NO,              		SLIPITEMTYPE_CODE,              	SLIPITEM_DESC,   
		SLIPITEM_STATUS,		CANCEL_ID,							CANCEL_DATE,				POSTTOVC_FLAG,						VOUCHER_NO,   
		CANCELTOVC_FLAG,		CANCELVC_NO,						DISPLAYONLY_STATUS,	ITEMPAY_AMT,							ACCOUNT_ID,   
		ITEMPAYAMT_NET,		TAX_FLAG,							VAT_FLAG,					TAX_CODE,								TAXWAY_KEEP,   
		TAX_AMT,					SECTION_ID,						MEMBGROUP_CODE,		OPERATE_FLAG
	)  
	VALUES
	(	:as_slipno ,					:as_branch , 						:ai_seqno , 					'000' , 									:ls_desc ,
		1 , 							null ,									null ,							0 ,											null , 		
		0	,							null ,									0 ,								:ldc_itempay_amt , 					:ls_accid_slipdet ,
		:ldc_itempay_amt , 		0 , 									0	,							0 ,											0 ,
		0 ,								0	,									null ,							-1 
	) using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบหนี้หักกลับ : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
	if ls_refsyst = "LON" and ldc_intclr > 0 then
		ai_seqno++
		
		// หาคู่บัญชี ดอกเบี้ยรับของเงินกู้ ----------------------
		select accint_id 
		into 	:ls_accid_slipdet
		from vcmapaccid
		where  system_code = 'LON'
		and slipitemtype_code = :ls_refsyst
		and shrlontype_code = :ls_shrlontype_code
		and shrlontype_status = 1
		using itr_sqlca ;
		
		if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ""
		//----------------------------------------------------
		
		ls_desc = "หักเพื่อชำระดอกเบี้ยสัญญาเลขที่ " + ls_loanno
		
		INSERT INTO FINSLIPDET  
		( 	SLIP_NO,              		COOP_ID,              		SEQ_NO,              		SLIPITEMTYPE_CODE,              	SLIPITEM_DESC,   
			SLIPITEM_STATUS,		CANCEL_ID,							CANCEL_DATE,				POSTTOVC_FLAG,						VOUCHER_NO,   
			CANCELTOVC_FLAG,		CANCELVC_NO,						DISPLAYONLY_STATUS,	ITEMPAY_AMT,							ACCOUNT_ID,   
			ITEMPAYAMT_NET,		TAX_FLAG,							VAT_FLAG,					TAX_CODE,								TAXWAY_KEEP,   
			TAX_AMT,					SECTION_ID,						MEMBGROUP_CODE,		OPERATE_FLAG
		)  
		VALUES
		(	:as_slipno ,					:as_branch , 						:ai_seqno , 					'000' , 									:ls_desc ,
			1 , 							null ,									null ,							0 ,											null , 		
			0	,							null ,									0 ,								:ldc_intclr , 								:ls_accid_slipdet ,
			:ldc_intclr , 					0 , 									0	,							0 ,											0 ,
			0 ,								0	,									null ,							-1 
		) using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหนี้หักกลับ : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
	end if
next

return success
end function

private function integer of_init_setitembank (string as_branch, datetime adtm_wdate) throws Exception;n_ds	lds_data
long		ll_index, ll_row, ll_seq_no, ll_found, ll_found1
integer	li_flag, li_tax_flag, li_payrecv
string	ls_accountid, ls_referdocno, ls_reapp, ls_temp, ls_account_no
dec{2}	ldc_item

// ดึงข้อมูลส่วนเงินฝาก
lds_data	= create n_ds
lds_data.dataobject	= "d_posttobank_dept"
lds_data.settransobject( itr_sqlca )

// ตรวจสอบข้อมูลล่าสุด
ll_seq_no	= 0
SELECT	max( seq_no )
INTO		:ll_seq_no
FROM		FINITEMPOSTTOBANK
WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND
			( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch )
using itr_sqlca  ;

if isnull( ll_seq_no ) then ll_seq_no = 0

ll_row	= lds_data.retrieve( adtm_wdate, as_branch )
ls_reapp	= 'DEP'
for ll_index = 1 to ll_row
	ls_accountid	= lds_data.object.tofrom_accid[ll_index]
	ls_referdocno	= lds_data.object.deptslip_no[ll_index]
	ldc_item			= lds_data.object.deptslip_netamt[ll_index]
	li_flag			= lds_data.object.recppaytype_flag[ll_index]
	
	// ตรวจสอบการมีอยู่ของคู่บัญชีธนาคาร
	ll_found			= 0
	SELECT	count( account_no )  
	INTO		:ll_found  
	FROM		FINBANKACCOUNT
	WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid 
	using itr_sqlca ;
	
	if isnull( ll_found ) then ll_found = 0
	
	choose case ll_found
		case 0
			continue
			
		case 1
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch )
			using itr_sqlca  ;
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			SELECT	account_no
			INTO		:ls_account_no  
			FROM		FINBANKACCOUNT
			WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid using itr_sqlca  ;
			
		case else // > 2
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) using itr_sqlca  ;
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
	
			if li_flag = 1 then
				ls_temp	= "#ยอด DR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			else
				ls_temp	= "#ยอด CR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			end if
			
//			openwithparm( w_dlg_chooseposttobank, ls_accountid + ls_temp )			
//			ls_account_no	= message.Stringparm
			
	end choose
	
	ll_seq_no ++
	INSERT INTO FINITEMPOSTTOBANK  
	(	ENTRY_DATE,			SEQ_NO,					BRANCH_ID,					ACCOUNT_ID,   
		ITEM_FLAG,			ITEM_AMT,				REFER_DOCNO,				REFER_APP,   
		POST_FLAG,			account_no
	)  
	VALUES
	(	:adtm_wdate,			:ll_seq_no,				:as_branch,				:ls_accountid,
		:li_flag,			:ldc_item,				:ls_referdocno,			:ls_reapp,
		0,						:ls_account_no
	)  using itr_sqlca  ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINITEMPOSTTOBANK"
		rollback using itr_sqlca;
		throw ithw_exception
	end if
next

// ดึงข้อมูลส่วนเงินฝาก ตั๋ว
lds_data	= create n_ds
lds_data.dataobject	= "d_posttobank_pmdept"
lds_data.settransobject( itr_sqlca )

ll_row	= lds_data.retrieve( adtm_wdate, as_branch )
ls_reapp	= 'PRM'
for ll_index = 1 to ll_row
	ls_accountid	= lds_data.object.tofrom_accid[ll_index]
	ls_referdocno	= lds_data.object.deptslip_no[ll_index]
	ldc_item			= lds_data.object.deptslip_amt[ll_index]
	li_flag			= lds_data.object.recppaytype_flag[ll_index]
	
	
	// ตรวจสอบการมีอยู่ของคู่บัญชีธนาคาร
	ll_found			= 0
	SELECT	count( account_no )  
	INTO		:ll_found  
	FROM		FINBANKACCOUNT
	WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid using itr_sqlca  ;
	if isnull( ll_found ) then ll_found = 0
	
	choose case ll_found
		case 0
			continue
			
		case 1
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) using itr_sqlca  ;
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			SELECT	account_no
			INTO		:ls_account_no  
			FROM		FINBANKACCOUNT
			WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid using itr_sqlca  ;
			
		case else
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) using itr_sqlca  ;
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			if li_flag = 1 then
				ls_temp	= "#ยอด DR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			else
				ls_temp	= "#ยอด CR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			end if
			
//			openwithparm( w_dlg_chooseposttobank, ls_accountid + ls_temp )			
//			ls_account_no	= message.Stringparm
			
	end choose
	
	ll_seq_no ++
	INSERT INTO FINITEMPOSTTOBANK  
	(	ENTRY_DATE,			SEQ_NO,					BRANCH_ID,					ACCOUNT_ID,   
		ITEM_FLAG,			ITEM_AMT,				REFER_DOCNO,				REFER_APP,   
		POST_FLAG,			account_no
	)  
	VALUES
	(	:adtm_wdate,			:ll_seq_no,				:as_branch,				:ls_accountid,
		:li_flag,			:ldc_item,				:ls_referdocno,			:ls_reapp,
		0,						:ls_account_no
	)  using itr_sqlca  ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINITEMPOSTTOBANK"
		rollback using itr_sqlca;
		throw ithw_exception
	end if
next


// ดึงข้อมูลจากหุ้น-หนี้
lds_data.dataobject	= "d_posttobank_shrlon"
lds_data.settransobject( itr_sqlca )

ll_row	= lds_data.retrieve( adtm_wdate, as_branch )
ls_reapp	= 'SHL'
for ll_index = 1 to ll_row
	ls_accountid		= lds_data.object.tofrom_accid[ll_index]
	ls_referdocno	= lds_data.object.payinslip_no[ll_index]
	ldc_item			= lds_data.object.slip_amt[ll_index]
	li_flag				= lds_data.object.sliptypesign_flag[ll_index]
	ls_temp			= lds_data.object.sliptype_code[ll_index]
	
	if ls_temp = 'YDI' then
		li_flag	= -1
	end if
	
	// ตรวจสอบการมีอยู่ของคู่บัญชีธนาคาร
	ll_found			= 0
	SELECT	count( account_no )  
	INTO		:ll_found  
	FROM		FINBANKACCOUNT
	WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid using itr_sqlca  ;
	if isnull( ll_found ) then ll_found = 0
	
	choose case ll_found
		case 0
			continue
			
		case 1
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) using itr_sqlca  ;
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			SELECT	account_no
			INTO		:ls_account_no  
			FROM		FINBANKACCOUNT
			WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid using itr_sqlca  ;
			
		case else
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) using itr_sqlca  ;
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			if li_flag = 1 then
				ls_temp	= "#ยอด DR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			else
				ls_temp	= "#ยอด CR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			end if
			
//			openwithparm( w_dlg_chooseposttobank, ls_accountid + ls_temp )			
//			ls_account_no	= message.Stringparm
			
	end choose
	
	ll_seq_no ++
	INSERT INTO FINITEMPOSTTOBANK  
	(	ENTRY_DATE,			SEQ_NO,					BRANCH_ID,					ACCOUNT_ID,   
		ITEM_FLAG,			ITEM_AMT,				REFER_DOCNO,				REFER_APP,   
		POST_FLAG,			account_no
	)  
	VALUES
	(	:adtm_wdate,			:ll_seq_no,				:as_branch,				:ls_accountid,
		:li_flag,			:ldc_item,				:ls_referdocno,			:ls_reapp,
		0,						:ls_account_no
	)  using itr_sqlca  ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINITEMPOSTTOBANK"
		rollback using itr_sqlca;
		throw ithw_exception
	end if
next

// ดึงข้อมูลจากจ่ายเงินกู้
lds_data.dataobject	= "d_posttobank_recvlon"
lds_data.settransobject( itr_sqlca )

ll_row	= lds_data.retrieve( adtm_wdate, as_branch )
ls_reapp	= 'LON'
for ll_index = 1 to ll_row
	ls_accountid	= lds_data.object.tofrom_accid[ll_index]
	ls_referdocno	= lds_data.object.payoutslip_no[ll_index]
	ldc_item			= lds_data.object.payoutnet_amt[ll_index]
	li_flag				= -1
	
	// ตรวจสอบการมีอยู่ของคู่บัญชีธนาคาร
	ll_found			= 0
	SELECT	count( account_no )  
	INTO		:ll_found  
	FROM		FINBANKACCOUNT
	WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid using itr_sqlca  ;
	if isnull( ll_found ) then ll_found = 0
	
	choose case ll_found
		case 0
			continue
			
		case 1
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) using itr_sqlca  ;
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			SELECT	account_no
			INTO		:ls_account_no  
			FROM		FINBANKACCOUNT
			WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid using itr_sqlca  ;
			
		case else
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) using itr_sqlca  ;
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			if li_flag = 1 then
				ls_temp	= "#ยอด DR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			else
				ls_temp	= "#ยอด CR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			end if
			
//			openwithparm( w_dlg_chooseposttobank, ls_accountid + ls_temp )			
//			ls_account_no	= message.Stringparm
			
	end choose
	
	
	ll_seq_no ++
	INSERT INTO FINITEMPOSTTOBANK  
	(	ENTRY_DATE,			SEQ_NO,					BRANCH_ID,					ACCOUNT_ID,   
		ITEM_FLAG,			ITEM_AMT,				REFER_DOCNO,				REFER_APP,   
		POST_FLAG,			account_no
	)  
	VALUES
	(	:adtm_wdate,			:ll_seq_no,				:as_branch,				:ls_accountid,
		:li_flag,			:ldc_item,				:ls_referdocno,			:ls_reapp,
		0,						:ls_account_no
	)  using itr_sqlca  ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINITEMPOSTTOBANK"
		rollback using itr_sqlca;
		throw ithw_exception
	end if
next

// ดึงข้อมูลจากจ่ายเงินถอนหุ้น
lds_data.dataobject	= "d_posttobank_widshr"
lds_data.settransobject( itr_sqlca )

ll_row	= lds_data.retrieve( adtm_wdate, as_branch )
ls_reapp	= 'SHR'
for ll_index = 1 to ll_row
	ls_accountid		= lds_data.object.tofrom_accid[ll_index]
	ls_referdocno	= lds_data.object.payoutslip_no[ll_index]
	ldc_item			= lds_data.object.payoutnet_amt[ll_index]
	li_flag				= -1
	
	// ตรวจสอบการมีอยู่ของคู่บัญชีธนาคาร
	ll_found			= 0
	SELECT	count( account_no )  
	INTO		:ll_found  
	FROM		FINBANKACCOUNT
	WHERE	FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid 
	using itr_sqlca  ;
	
	if isnull( ll_found ) then ll_found = 0
	
	choose case ll_found
		case 0
			continue
			
		case 1
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE	( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch )
			using itr_sqlca ;
			
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			SELECT	account_no
			INTO		:ls_account_no  
			FROM		FINBANKACCOUNT
			WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid 
			using itr_sqlca ;
			
		case else
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) 
			using itr_sqlca ;
			
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			if li_flag = 1 then
				ls_temp	= "#ยอด DR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			else
				ls_temp	= "#ยอด CR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			end if
			
//			openwithparm( w_dlg_chooseposttobank, ls_accountid + ls_temp )			
//			ls_account_no	= message.Stringparm
			
	end choose
	
	ll_seq_no ++
	INSERT INTO FINITEMPOSTTOBANK  
	(	ENTRY_DATE,			SEQ_NO,					BRANCH_ID,					ACCOUNT_ID,   
		ITEM_FLAG,			ITEM_AMT,				REFER_DOCNO,				REFER_APP,   
		POST_FLAG,			account_no
	)  
	VALUES
	(	:adtm_wdate,			:ll_seq_no,				:as_branch,				:ls_accountid,
		:li_flag,			:ldc_item,				:ls_referdocno,			:ls_reapp,
		0,						:ls_account_no
	)  using itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINITEMPOSTTOBANK"
		rollback using itr_sqlca;
		throw ithw_exception
	end if
next

// ดึงข้อมูลจากจ่ายเงิน การเงิน
lds_data.dataobject	= "d_posttobank_fin"
lds_data.settransobject( itr_sqlca )

ll_row	= lds_data.retrieve( adtm_wdate, as_branch )
ls_reapp	= 'FIN'

for ll_index = 1 to ll_row
	ls_accountid	= lds_data.object.tofrom_accid[ll_index]
	ls_referdocno	= lds_data.object.slip_no[ll_index]	
	li_tax_flag		= lds_data.object.tax_flag[ll_index]
	li_payrecv		= lds_data.object.pay_recv_status[ll_index]
	
	//if li_tax_flag = 1 then
	ldc_item			= lds_data.object.item_amtnet[ll_index]
	//else
	//	ldc_item			= lds_data.object.finslipdet_itempay_amt[ll_index]
	//end if
	
	if li_payrecv = 0 then
		li_flag			= -1
	else
		li_flag			= 1
	end if
	
	// ตรวจสอบการมีอยู่ของคู่บัญชีธนาคาร
	ll_found1			= 0
	SELECT	count( account_no )  
	INTO		:ll_found1  
	FROM		FINBANKACCOUNT
	WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid 
	using itr_sqlca ;
	
	if isnull( ll_found1 ) then ll_found1 = 0
	
	choose case ll_found1
		case 0
			
		case 1
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) 
			using itr_sqlca ;
						
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			SELECT	account_no
			INTO		:ls_account_no  
			FROM		FINBANKACCOUNT
			WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid 
			using itr_sqlca ;
			
		case else
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE		( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) 
			using itr_sqlca ;
			
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			if li_flag = 1 then
				ls_temp	= "#ยอด DR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			else
				ls_temp	= "#ยอด CR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			end if
			
//			openwithparm( w_dlg_chooseposttobank, ls_accountid + ls_temp )			
//			ls_account_no	= message.Stringparm
			
	end choose
	
	// รายการ ที่ตัวแม่
	if ll_found1 <> 0 then
		ll_seq_no ++
		INSERT INTO FINITEMPOSTTOBANK  
		(	ENTRY_DATE,			SEQ_NO,				BRANCH_ID,				ACCOUNT_ID,   
			ITEM_FLAG,			ITEM_AMT,			REFER_DOCNO,			REFER_APP,   
			POST_FLAG,			account_no
		)  
		VALUES
		(	:adtm_wdate,			:ll_seq_no,			:as_branch,			:ls_accountid,
			:li_flag,			:ldc_item,			:ls_referdocno,		:ls_reapp,
			0,						:ls_account_no
		)  using itr_sqlca ;
	
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINITEMPOSTTOBANK"
			rollback using itr_sqlca;
			throw ithw_exception
		end if
	end if
	
	// รายการที่ตัวลูก
	ls_accountid		= lds_data.object.account_id[ll_index]
	li_flag				= li_flag * ( -1 )
	ldc_item			= lds_data.object.finslipdet_itempay_amt[ll_index]
	
	// ตรวจสอบการมีอยู่ของคู่บัญชีธนาคาร
	ll_found			= 0
	SELECT	count( account_no )  
	INTO		:ll_found  
	FROM		FINBANKACCOUNT
	WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid 
	using itr_sqlca ;
	
	if isnull( ll_found ) then ll_found = 0
			
	choose case ll_found
		case 0
			continue
			
		case 1
			SELECT	account_no
			INTO		:ls_account_no  
			FROM		FINBANKACCOUNT
			WHERE		FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid 
			using itr_sqlca ;
			
		case else
			
			if li_flag = 1 then
				ls_temp	= "#ยอด DR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			else
				ls_temp	= "#ยอด CR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			end if
			
//			openwithparm( w_dlg_chooseposttobank, ls_accountid + ls_temp )			
//			ls_account_no	= message.Stringparm
			
	end choose
	
	// ตรวจสอบการมีอยู่ของข้อมูล
	if ll_found > 0 then
		ll_found1			= 0
		SELECT	count( account_id )  
		INTO		:ll_found1  
		FROM		FINITEMPOSTTOBANK
		WHERE	( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
					( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
					( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
					( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) and 
					( FINITEMPOSTTOBANK.account_no 		= :ls_account_no  ) and
					( FINITEMPOSTTOBANK.item_amt 		= :ldc_item ) and
					( FINITEMPOSTTOBANK.ITEM_FLAG		= :li_flag ) 
		using itr_sqlca ;
					
		if isnull( ll_found1 ) then ll_found1 = 0
		
		if ll_found1 > 0 then continue
		
	end if
	
	ll_seq_no ++
	INSERT INTO FINITEMPOSTTOBANK  
	(	ENTRY_DATE,			SEQ_NO,					BRANCH_ID,					ACCOUNT_ID,   
		ITEM_FLAG,				ITEM_AMT,				REFER_DOCNO,			REFER_APP,   
		POST_FLAG,			account_no
	)  
	VALUES
	(	:adtm_wdate,			:ll_seq_no,				:as_branch,				:ls_accountid,
		:li_flag,				:ldc_item,				:ls_referdocno,			:ls_reapp,
		0,						:ls_account_no
	)  using itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINITEMPOSTTOBANK"
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
next

// ดึงข้อมูลจากจ่ายเงินกู้ การลงทุน
lds_data.dataobject	= "d_posttobank_recvivlon"
lds_data.settransobject( itr_sqlca )

ll_row	= lds_data.retrieve( adtm_wdate, as_branch )
ls_reapp	= 'INV'
for ll_index = 1 to ll_row
	ls_accountid	= lds_data.object.tofrom_accid[ll_index]
	ls_referdocno	= lds_data.object.loanreceive_no[ll_index]
	ldc_item			= lds_data.object.loanreceivenet_amt[ll_index]
	li_flag			= -1
	
	// ตรวจสอบการมีอยู่ของคู่บัญชีธนาคาร
	ll_found			= 0
	SELECT	count( account_no )  
	INTO		:ll_found  
	FROM		FINBANKACCOUNT
	WHERE	FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid 
	using itr_sqlca ;
	
	if isnull( ll_found ) then ll_found = 0
	
	choose case ll_found
		case 0
			continue
			
		case 1
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE	( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) 
			using itr_sqlca ;
			
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			SELECT	account_no
			INTO		:ls_account_no  
			FROM		FINBANKACCOUNT
			WHERE	FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid 
			using itr_sqlca ;
			
		case else
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE	( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) 
			using itr_sqlca ;
			
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			if li_flag = 1 then
				ls_temp	= "#ยอด DR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			else
				ls_temp	= "#ยอด CR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			end if
			
//			openwithparm( w_dlg_chooseposttobank, ls_accountid + ls_temp )			
//			ls_account_no	= message.Stringparm
			
	end choose
	
	ll_seq_no ++
	INSERT INTO FINITEMPOSTTOBANK  
	(	ENTRY_DATE,		SEQ_NO,					BRANCH_ID,					ACCOUNT_ID,   
		ITEM_FLAG,			ITEM_AMT,				REFER_DOCNO,			REFER_APP,   
		POST_FLAG,		account_no
	)  
	VALUES
	(	:adtm_wdate,			:ll_seq_no,				:as_branch,				:ls_accountid,
		:li_flag,				:ldc_item,				:ls_referdocno,			:ls_reapp,
		0,						:ls_account_no
	)  using itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINITEMPOSTTOBANK"
		rollback using itr_sqlca;
		throw ithw_exception
	end if
next


// ดึงข้อมูลจาก การรับชำระเงินกู้ สอ.อื่น
lds_data.dataobject	= "d_posttobank_invlon"
lds_data.settransobject( itr_sqlca )

ll_row	= lds_data.retrieve( adtm_wdate, as_branch )
ls_reapp	= 'INR'
for ll_index = 1 to ll_row
	ls_accountid		= lds_data.object.tofrom_accid[ll_index]
	ls_referdocno	= lds_data.object.slip_no[ll_index]
	ldc_item			= lds_data.object.slip_amt[ll_index]
	li_flag				= lds_data.object.sliptype_flag[ll_index]	

	// ตรวจสอบการมีอยู่ของคู่บัญชีธนาคาร
	ll_found			= 0
	SELECT	count( account_no )  
	INTO		:ll_found  
	FROM		FINBANKACCOUNT
	WHERE	FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid 
	using itr_sqlca ;
	
	if isnull( ll_found ) then ll_found = 0
	
	choose case ll_found
		case 0
			continue
			
		case 1
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE	( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch )
			using itr_sqlca ;
			
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			SELECT	account_no
			INTO		:ls_account_no  
			FROM		FINBANKACCOUNT
			WHERE	FINBANKACCOUNT.ACCOUNT_ID = :ls_accountid 
			using itr_sqlca ;
			
		case else
			// ตรวจสอบการมีอยู่ของข้อมูล
			ll_found			= 0
			SELECT	count( account_id )  
			INTO		:ll_found  
			FROM		FINITEMPOSTTOBANK
			WHERE	( FINITEMPOSTTOBANK.ENTRY_DATE	= :adtm_wdate ) AND  
						( FINITEMPOSTTOBANK.REFER_DOCNO	= :ls_referdocno ) AND  
						( FINITEMPOSTTOBANK.REFER_APP		= :ls_reapp ) AND  
						( FINITEMPOSTTOBANK.BRANCH_ID		= :as_branch ) 
			using itr_sqlca ;
			
			if isnull( ll_found ) then ll_found = 0
			
			if ll_found > 0 then continue
			
			if li_flag = 1 then
				ls_temp	= "#ยอด DR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			else
				ls_temp	= "#ยอด CR เป็นเงิน " + string( ldc_item , "#,##0.00" )
			end if
			
//			openwithparm( w_dlg_chooseposttobank, ls_accountid + ls_temp )			
//			ls_account_no	= message.Stringparm
			
	end choose
	
	ll_seq_no ++
	INSERT INTO FINITEMPOSTTOBANK  
	(	ENTRY_DATE,		SEQ_NO,					BRANCH_ID,					ACCOUNT_ID,   
		ITEM_FLAG,			ITEM_AMT,				REFER_DOCNO,			REFER_APP,   
		POST_FLAG,		account_no
	)  
	VALUES
	(	:adtm_wdate,			:ll_seq_no,				:as_branch,				:ls_accountid,
		:li_flag,				:ldc_item,				:ls_referdocno,			:ls_reapp,
		0,						:ls_account_no
	)  using itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINITEMPOSTTOBANK"
		rollback using itr_sqlca;
		throw ithw_exception
	end if
next

commit using itr_sqlca ;
return success
end function

public function integer of_postupdatebankaccount (string as_bank_xml) throws Exception;n_ds	lds_bank 

string	ls_accno	,	ls_accname , ls_acctype , ls_remark , ls_bankbranch , ls_bank , ls_coopid , ls_bookno
string	ls_accid
integer	li_lastseqno
lds_bank	= create n_ds
lds_bank.dataobject  = "d_fin_bankaccount2"
lds_bank.settransobject( itr_sqlca )

if not isnull( as_bank_xml ) and trim( as_bank_xml ) <> "" then
	this.of_importstring_xml( lds_bank , as_bank_xml )
else
	ithw_exception.text	= "ไม่มีข้อเลขที่บัญชีธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ls_accno			=	trim(lds_bank.object.account_no[1] )
ls_accname		=	trim(lds_bank.object.account_name[1] )
ls_acctype		=	trim(lds_bank.object.account_type[1] )
ls_remark		=	trim(lds_bank.object.remark[1] )
ls_bankbranch	=	trim(lds_bank.object.bankbranch_code[1] )
ls_bank			=	trim(lds_bank.object.bank_code[1] )
ls_bookno		=	trim(lds_bank.object.book_no[1] )
li_lastseqno		= lds_bank.object.laststm_seq[1]
ls_coopid		=	trim(lds_bank.object.coop_id[1] )
ls_accid			=	trim(lds_bank.object.account_id[1] )

update finbankaccount
set		bank_code 			= :ls_bank
		, account_name 	= :ls_accname
		, laststm_seq 		= :li_lastseqno
		, account_type 		= :ls_acctype
		, book_no 			= :ls_bookno
		, account_id 		= :ls_accid
		, remark 				= :ls_remark
		, bankbranch_code = :ls_bankbranch
where account_no = :ls_accno
and coop_id =:ls_coopid
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลบัญชีธนาคารได้ " + itr_sqlca.sqlerrtext
	rollback using	itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;
return Success
end function

public function integer of_init_postotherto_fin (ref string as_memb_xml, ref string as_slipmain_xml, ref string as_slipcancel_xml, string as_appname) throws Exception;/***********************************************
<description>
	ดึงข้อมูลจากระบบอื่น บันทึกลงระบบการเงิน
</description>

<arguments>	
	as_memb_xml			ข้อมูลสมาชิก , ส่งคืนค่ากลับ
	as_slipmain_xml		ข้อมูลรับ-จ่ายหลัก , ส่งคืนค่ากลับ
	as_slipdet_xml			รายละเอียดรับ-จ่าย , ส่งคืนค่ากลับ
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_init_postotherto_fin()
	
	Integer li_return
	String ls_memberno , ls_branch , ls_entry 
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_init_postotherto_fin( ls_memberno , ls_branch , ls_entry , ldtm_wdate )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 17/10/2010 by Phaiwaan
	Version 1.1 เพิ่มการดึงข้อมูลการจ่ายคืนค่าหุ้นและจ่ายเงินกู้ Modified Date 18/10/2010 by Phaiwaan
	Version 1.2 แก้ดึงข้อมูลรายการยกเิลิกจากต้นทาง Modified Date 6/11/2010 by Phaiwaan	
</usage>
************************************************/
n_ds		lds_data , lds_memb , lds_slip , lds_cancellist
integer	li_row, li_chk , li_index , li_found , li_rc , li_upper , li_recvpaystatus
string		ls_membno , ls_membname , ls_membsurname , ls_membgroup , ls_membgroupdesc	,	ls_cancelslip_all
string		ls_coopid , ls_entry_id , ls_machineid , ls_deptcancelslip , ls_lonlwdcancelslip , ls_shrswdcancelslip , ls_shrloncancelslip
string		ls_slipno[]	, ls_temp
datetime	ldtm_wdate

lds_memb	= create n_ds
lds_memb.dataobject	= "d_fin_slipspc_fromother"

ids_cancelslip	= create n_ds
ids_cancelslip.dataobject		= "d_cancel_othertotfin"
ids_cancelslip.settransobject( itr_sqlca )

if not isnull( as_memb_xml ) and trim( as_memb_xml ) <> "" then
	this.of_importstring_xml( lds_memb , as_memb_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลสมาชิก ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_slip 	= create n_ds
lds_slip.dataobject	= "d_fin_slipspc_otherlist"
lds_slip.settransobject( itr_sqlca )

lds_cancellist 	= create n_ds
lds_cancellist.dataobject	= "d_fin_slipspc_otherlistcancel"
lds_cancellist.settransobject( itr_sqlca )


ls_membno		= trim( lds_memb.object.member_no[1]  )
ls_coopid 		= trim( lds_memb.object.coop_id[1]  )
ls_entry_id		= trim( lds_memb.object.entry_id[1]  )
ldtm_wdate		= lds_memb.object.adtm_date[1]  
ls_machineid	= trim( lds_memb.object.machine_id[1]  )

select a.memb_name , a.memb_surname , a.membgroup_code , b.membgroup_desc
into	:ls_membname , :ls_membsurname , :ls_membgroup , :ls_membgroupdesc
from mbmembmaster a , mbucfmembgroup b
where a.membgroup_code = b.membgroup_code
and a.member_no =	:ls_membno
and a.coop_id = :is_coopcontrl
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then 
	ithw_exception.text	= "ไม่พบข้อมูลสมาชิก เลขที่ : " + ls_membno
	throw ithw_exception
end if

// ตรวจสอบข้อมูลการเปิดงานประจำวัน
li_rc	= this.of_is_open_day( is_coopcontrl , ldtm_wdate )
if ( li_rc < 1 ) then
	ithw_exception.text	= "ยังไม่ได้ทำการเปิดงานประจำวัน ไม่สามารถทำการเปิดได้"
	throw ithw_exception
end if

// ตรวจสอบข้อมูลการปิดงานประจำวัน
li_rc	= this.of_is_close_day( ls_coopid , as_appname ,  ldtm_wdate )
if ( li_rc = 1 ) then
	ithw_exception.text	= "ได้ทำการปิดสิ้นแล้ว ไม่สามารถทำรายการได้"
	throw ithw_exception
end if

lds_memb.object.member_name[1]  		= trim( ls_membname )
lds_memb.object.member_surname[1]  	= trim( ls_membsurname )
lds_memb.object.group_no[1]  			= trim( ls_membgroup )
lds_memb.object.member_group_no[1] 	= trim( ls_membgroup )
lds_memb.accepttext( )

// ดึงข้อมูลการทำรายการระบบเงินฝากเข้า ระบบการเงิน
li_recvpaystatus = integer( this.of_getattribconstant( "deptwait_atfin" , "INTEGER" ))
if isnull( li_recvpaystatus ) then li_recvpaystatus = 3

if( li_recvpaystatus = 2 ) then

	// ระบบเงินฝาก
	lds_data		= create n_ds
	lds_data.dataobject	= "d_fin_dp_slip_from_memb"
	lds_data.settransobject( itr_sqlca )
	
	li_row			= lds_data.retrieve(ls_coopid, ls_membno , ldtm_wdate )
	
	if li_row > 0 then
		this.of_postdeptto_fin( lds_data  , ls_coopid  , ls_entry_id , ldtm_wdate , ls_deptcancelslip )
	end if
end if

// ดึงข้อมูล หุ้นหนี้ รายการจ่าย เข้า ระบบการเงินหรือไม่ shrlonrecvsendfin 
li_recvpaystatus = integer( this.of_getattribconstant( "shrlonpaysendfin" , "INTEGER" ))
if isnull( li_recvpaystatus ) then li_recvpaystatus = 3

if( li_recvpaystatus = 2 ) then
	//รายละเอียดหักกลบ สัญญาเก่า	
	ids_payclr	= create n_ds
	ids_payclr.dataobject = "d_fin_sl_slipclr"
	ids_payclr.settransobject( itr_sqlca )
		
			
	// จ่ายเงินกู้
	lds_data		= create n_ds
	lds_data.dataobject	= "d_fin_lon_payout"
	lds_data.settransobject( itr_sqlca )
	
	li_row			= lds_data.retrieve(ls_coopid, ls_membno , ldtm_wdate  )
	if li_row > 0 then
		this.of_postlonlwdto_fin( lds_data  , ls_coopid  , ls_entry_id , ldtm_wdate , ls_machineid  , ls_lonlwdcancelslip)
	end if
	
end if	

// ดึงข้อมูล หุ้นหนี้ รายการรับ เข้า ระบบการเงินหรือไม่ shrlonrecvsendfin
li_recvpaystatus	= integer( this.of_getattribconstant( "shrlonrecvsendfin" , "INTEGER" ))
if isnull( li_recvpaystatus ) then li_recvpaystatus = 3

if( li_recvpaystatus = 2 ) then

	// รายละเอียดรับชำระ
	ids_payinslipdet	= create n_ds
	ids_payinslipdet.dataobject		= "d_fin_sl_slipdet"
	ids_payinslipdet.settransobject( itr_sqlca )

	// รับชำระ ระบบหุ้นหนี้
	lds_data		= create n_ds
	lds_data.dataobject	= "d_fin_sl_slip"
	lds_data.settransobject( itr_sqlca )
	
	li_row			= lds_data.retrieve(ls_coopid, ls_membno , ldtm_wdate  )
	
	if li_row > 0 then
		this.of_postshrlonto_fin( lds_data  , ls_coopid  , ls_entry_id , ldtm_wdate , ls_machineid ,ls_shrloncancelslip)
	end if
	

	//รายละเอียดหักกลบ สัญญาเก่า	
	ids_payclr	= create n_ds
	ids_payclr.dataobject = "d_fin_sl_slipclr"
	ids_payclr.settransobject( itr_sqlca )

	// ถอนหุ้นคืน
	lds_data		= create n_ds
	lds_data.dataobject	= "d_fin_shr_payout"
	lds_data.settransobject( itr_sqlca )
	
	li_row			= lds_data.retrieve(ls_coopid, ls_membno , ldtm_wdate  )
	if li_row > 0 then
		this.of_postshrswdto_fin( lds_data  , ls_coopid  , ls_entry_id , ldtm_wdate , ls_machineid  , ls_shrswdcancelslip)
	end if
	
	// จ่ายคืนเงินต้นและดอกเบี้ย
	lds_data		= create n_ds
	lds_data.dataobject	= "d_fin_lon_payout_lrt"
	lds_data.settransobject( itr_sqlca )
	
	li_row			= lds_data.retrieve(ls_coopid, ls_membno , ldtm_wdate  )
	if li_row > 0 then
		this.of_postlonlrtto_fin( lds_data  , ls_coopid  , ls_entry_id , ldtm_wdate , ls_machineid  , ls_lonlwdcancelslip)
	end if
	

	destroy( ids_payclr ) 
	destroy( ids_payinslipdet ) 
end if


// ดึงข้อมูลรับจ่ายการเงินของสมาชิก
lds_slip.retrieve(ls_coopid, ls_membno)

// รายการที่ถูกยกเลิกจากต้นทาง
ls_cancelslip_all	= ""

// เงินฝาก
if ls_deptcancelslip  <> "" then
	ls_cancelslip_all	+= ls_deptcancelslip 
end if

// จ่ายเงินกู้
if ls_lonlwdcancelslip  <> "" then
	if ls_cancelslip_all	<> "" then ls_cancelslip_all	+= ","
	ls_cancelslip_all	+= ls_lonlwdcancelslip
end if

// จ่ายคืนค่าหุ้น
if ls_shrswdcancelslip <> "" then
	if ls_cancelslip_all	<> "" then ls_cancelslip_all	+= ","
	ls_cancelslip_all	+= ls_shrswdcancelslip  
end if

// รับชำระหุ้นหนี้
if ls_shrloncancelslip   <> "" then
	if ls_cancelslip_all	<> "" then ls_cancelslip_all	+= ","
	ls_cancelslip_all	+= ls_shrloncancelslip  
end if

// convert to String Array
inv_string.of_parsetoarray( ls_cancelslip_all, ',', ls_slipno[] )

// ดึงข้อมูลรายการที่ถูกยกเลิกจากต้นทาง
lds_cancellist.retrieve( ls_coopid   , ls_slipno[] )

// filter ไม่เอารายการที่ถูกยกเลิกแล้ว  จากต้นทาง
li_upper	= upperbound( ls_slipno ) 

for li_index = 1 to li_upper
	if li_index > 1 then ls_temp += ","
	ls_temp	+=	"'" + ls_slipno[li_index] + "'"
next 

lds_slip.setfilter( "slip_no not in (" + ls_temp + ")" )
lds_slip.filter( )

as_memb_xml		= lds_memb.describe( "Datawindow.Data.Xml" )
as_slipmain_xml	= ""
if( lds_slip.rowcount( ) > 0 ) then
	as_slipmain_xml	= lds_slip.describe( "Datawindow.Data.Xml" )
end if

as_slipcancel_xml	= ""
if lds_cancellist.rowcount( ) > 0 then
	as_slipcancel_xml	= lds_cancellist.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_data ) 
destroy( lds_slip ) 
destroy( lds_cancellist ) 
destroy( lds_memb ) 
destroy( ids_cancelslip ) 
return success
end function

public function integer of_postpaylon (string as_slipmain_xml, string as_slipdet_xml) throws Exception;

return success
end function

public function integer of_postpayshr (string as_slipmain_xml, string as_slipdet_xml) throws Exception;

return success
end function

public function integer of_postcancelpayout (string as_payout_no, string as_branch_id, string as_entry_id, datetime adtm_entry_date) throws Exception;

return success
end function

public function integer of_postcancelpayin (string as_payin_no, string as_branch_id, string as_entry_id, datetime adtm_entry_date) throws Exception;
return		success
end function

public function integer of_postcanceldeptslip (string as_deptslip_no, string as_branch_id, string as_entry_id, datetime adtm_entry_date) throws Exception;

return		success
end function

private function string of_readnumber (string as_number, boolean ab_posname) throws Exception;// Determine READNUMBER Option of this application
string ls_digitname[ 1 to 12 ]  = { "หนึ่ง", "สอง", "สาม", "สี่", "ห้า", "หก", "เจ็ด", "แปด", "เก้า" , "ศูนย์", "เอ็ด" , "ยี่"}
string ls_posname [ 0 to 6 ]  = { "", "สิบ", "ร้อย", "พัน", "หมื่น", "แสน", "ล้าน" }
string ls_numberword
char	larrc_number[] , lc_t
int		li_digit_index, li_digit_max
int		li_block

//as_number = trim( as_number ) 

if len( as_number ) = 1 and as_number = "0" then
	return "ศูนย์"
end if

// determine how much loop(s) to be execute 6 character for each block
li_block = ( len( as_number ) / 6 ) 
if mod( len( as_number ), 6 ) <> 0 then li_block++

do while li_block > 0
	string ls_temp
	
	ls_temp			= reverse( mid( reverse( as_number ), ( ( li_block -1 ) * 6 ) + 1, 6 ) )
	larrc_number	= ls_temp
	li_digit_max		= len( ls_temp )

	for li_digit_index = 1 to li_digit_max
		lc_t = larrc_number[ li_digit_index ] 
		choose case lc_t
			case "0" 
				continue
			case "1"
				int li_adjust
				if ( li_digit_max > 1 ) and ( li_digit_index  = li_digit_max ) then
					if larrc_number[ li_digit_index - 1 ] <> "0" then li_adjust = 10 else li_adjust = 0
				else
					li_adjust = 1
				end if
				if ( li_digit_max - li_digit_index ) = 1 then 
					ls_numberword += ""
				else
					ls_numberword += ls_digitname[ long( larrc_number[ li_digit_index ] ) + li_adjust  ]
				end if
			case "2"
				if ( li_digit_max - li_digit_index ) = 1 then li_adjust = 10 else li_adjust = 0
				ls_numberword += ls_digitname[ long( larrc_number[ li_digit_index ] ) + li_adjust ]
			case else
				ls_numberword += ls_digitname[ long( larrc_number[ li_digit_index ] ) ]
		end choose
	
		// find out position name
		if ab_posname then
			ls_numberword += ls_posname[ li_digit_max - li_digit_index ]
		end if
	next
	
	li_block --
	
	if li_block > 0 then
		// each block that longer than 6 char mean that nermeric is more million
		if ab_posname then
			ls_numberword += "ล้าน"
		end if
	end if
loop 

return ls_numberword
end function

private function string of_readthaibaht (string as_money) throws Exception;string ls_return, ls_number
string ls_integer, ls_fraction

ls_number = as_money

if pos(ls_number, "." ) > 0 then
	ls_integer	= left( ls_number, pos(ls_number, "." ) -1 )
	ls_fraction	= left( mid( ls_number, pos(ls_number, "." ) +1 ) + "00", 2 )
	
	if ls_fraction = "00" then
		ls_fraction = ""
	end if
else
	ls_integer = ls_number
end if

if len( ls_integer ) > 0 then
	ls_return = this.of_readnumber( string( ls_integer ) ,true )
	
	if len( ls_fraction ) = 0 then
		ls_return	+= "บาทถ้วน"
	else
		if ls_return = "ศูนย์" then
			ls_return	= ""
		else
			ls_return	+= "บาท"
		end if
	end if
end if

if len( ls_fraction ) > 0 then 
	ls_return += this.of_readnumber( ls_fraction ,true  )
	ls_return += "สตางค์"
end if

return ls_return
end function

private function integer of_posttaxatpay (n_ds ads_main, n_ds ads_det, string as_taxdetail_xml) throws Exception;integer	li_taxflag, li_taxtype, li_row, li_index 
string		ls_taxkeepaddr, ls_taxkeepid, ls_taxpaydesc 
string		ls_DOC = "FNTAXATPAY", ls_docno, ls_year, ls_taxatpay_no, ls_dwobjectname
dec{5}	ldc_taxrate
dec{2}	ldc_taxamt, ldc_moneyamt, ldc_moneyaftax, ldc_vat
datetime	ldtm_date
string		ls_coopname, ls_taxpayid, ls_taxpayaddr, ls_taxrecvid, ls_taxpayname, ls_coopid
string		ls_cashtype, ls_bank, ls_account, ls_slipno,ls_branchbank
integer	li_recv_pay, li_chqstatus, li_cancelflag

// get Child Datawindow เพื่อดึง อัตราภาษี
datawindowchild	ldwc_taxtype

// ชื่อ Datawindow ที่ใช้
ls_dwobjectname 	= inv_print_srv.of_getdataobject( as_taxdetail_xml )

n_ds		lds_taxdet

lds_taxdet = create		n_ds
lds_taxdet.dataobject = ls_dwobjectname
lds_taxdet.settransobject( itr_sqlca )

if not isnull( as_taxdetail_xml ) and trim( as_taxdetail_xml ) <> "" then
	this.of_importstring_xml( lds_taxdet , as_taxdetail_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลรายละเอียดภาษี ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

li_recv_pay		= ads_main.object.pay_recv_status[1]
ls_coopid			= ads_main.object.coop_id[1]
li_cancelflag		= 0
ls_taxpayname	= ads_main.object.nonmember_detail[1]
ldtm_date		= ads_main.object.operate_date[1]
ls_slipno			= ads_main.object.slip_no[1]
//ldc_vat			= ads_main.object.vat_amt[1]
li_chqstatus		= ads_main.object.cheque_status[1]
ls_cashtype		= ads_main.object.cash_type[1]
ls_branchbank = ads_main.object.bank_branch[1]

ls_taxpayaddr	= trim( lds_taxdet.object.taxpay_addr[1] )
ls_taxpayid		= trim( lds_taxdet.object.taxpay_id[1] )
ls_taxpaydesc	= trim( lds_taxdet.object.taxpay_desc[1] )

if isnull( li_taxflag ) then li_taxflag = 0
if isnull( ldc_taxrate ) then ldc_taxrate = 0

li_taxflag				= ads_main.object.tax_flag[1]

if li_taxflag = 0 then return 1

li_row		= ads_det.rowcount()

for li_index = 1 to li_row
	
	// ตรวจสอบทำรายการภาษี ที่ รายละเอียด
	li_taxflag				= ads_det.object.tax_flag[li_index ]
	
	if isnull( li_taxflag ) then li_taxflag = 0 
	if li_taxflag = 0 then continue 
	
	ads_det.getchild( "tax_code", ldwc_taxtype )
	ldwc_taxtype.settransobject( itr_sqlca )
	ldwc_taxtype.retrieve(ls_coopid)
	
	
	
	
	ls_taxatpay_no 		= this.of_get_lastslip_docno( ls_DOC )

	ldc_taxamt			= ads_det.object.tax_amt[li_index ]
	ldc_moneyamt		= ads_det.object.itempay_amt[li_index]
	ldc_moneyaftax		= ads_det.object.itempayamt_net[li_index]
	li_taxtype			= ads_det.object.tax_code[li_index]	

	
	ldwc_taxtype.setfilter( "tax_code = " + string( li_taxtype ) )
	ldwc_taxtype.filter( )
	
	if  ldwc_taxtype.getrow() > 0 then
		ldc_taxrate			= ldwc_taxtype.getitemdecimal( ldwc_taxtype.getrow(), "tax_rate" )
	else
		ithw_exception.text	= "ไม่มีอัตราภาษีที่เลือก  กรุณาตรวจสอบ"
		rollback using itr_sqlca  ;
		throw ithw_exception
	end if
	
	if isnull( ls_taxpaydesc ) then ls_taxpaydesc = ""
	if isnull( ls_taxpayid ) then ls_taxpayid = ""
	if isnull( ls_taxpayaddr ) then ls_taxpayaddr = ""
	if isnull( li_chqstatus ) then li_chqstatus = 8
	
	if ls_taxpaydesc = "" or ls_taxpayid = "" or ls_taxpayaddr = "" or isnull( li_taxtype ) then
		ithw_exception.text	= "ป้อนข้อมูลรายละเอียดภาษีไม่ถูกต้อง กรุณาตรวจสอบ"
		rollback using itr_sqlca  ;
		throw ithw_exception
	end if
	
	// ถ้าเป็นเช็คค้างจ่ายหรือสำรอง ไม่ต้อง post
	if ( ls_cashtype = 'CHQ' ) and ( li_chqstatus <> 8 )  then
		ldtm_date		= ads_main.object.dateon_chq[1]
		li_cancelflag	= 8
	end if
	
	INSERT INTO FINTAX  
	(	TAXDOC_NO,				TAXPAY_NAME,			TAXPAY_ADDR,
		TAXPAY_ID,					TAXPAY_DATE,				TAXPAY_DESC,   
		MONEY_ALLAMT,			MONEY_AFTAX,			MONEY_TAXAMT,
		tax_rate,						tax_code,					tax_accno,
		tax_branch,					tax_bank,					slip_no,
		cancel_flag,					coop_id
	)  
	VALUES
	(	:ls_taxatpay_no,			:ls_taxpayname,		:ls_taxpayaddr,
		:ls_taxpayid,				:ldtm_date,				:ls_taxpaydesc,
		:ldc_moneyamt,			:ldc_moneyaftax,		:ldc_taxamt,
		:ldc_taxrate,				:li_taxtype,				:ls_account,
		:ls_branchbank,					:ls_bank,					:ls_slipno,
		:li_cancelflag,				:ls_coopid
	)  using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลการเสียภาษีได้ " + itr_sqlca.sqlerrtext 
		rollback using itr_sqlca  ;	
		throw ithw_exception
	end if
	
next 

return Success
end function

private function integer of_postpaychqstm_split (string as_branch, string as_entry, string as_machine, datetime adtm_wdate, string as_accno, string as_chqtype, integer ai_chequestatus, n_ds ads_chqcond, n_ds ads_chqlist, n_ds ads_chqspilt) throws Exception;/***********************************************
<description>
	บันทึกการทำรายการเคลื่อนไหวเช็คที่พิมพ์ออกจากการทำรายการ พิมพ์เช็คหลายใบจาก 1 สลิป 
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการพิมพ์เช็ค
	adtm_wdate				วันที่ทำการ
	as_machine				ชื่อเครื่องที่ทำรายการ
	astr_chqcond			Structure ข้อมูลเื่งื่อนไขการพิมพ์เช็ค
	as_accno					เลขที่บัญชีธนาคารที่ตัดออก
	as_chqtype				ประเภทเช็คที่จะพิมพ์
	ai_chequestatus		สถานะเช็คที่จะพิมพ์
	ads_chqlist				รายการที่เลือกพิมพ์เช็ค
	ads_chqspilt				รายการสั่งจ่ายเช็ค
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postpaychqstm_split()
	
	Integer li_return , li_chequestatus
	String ls_branch , ls_entry , ls_machine , ls_accno , ls_chqtype
	datetime	ldtm_wdate
	n_ds	lds_chqlist , lds_chqspilt
	str_chqinfo	lstr_chqcond
	
	li_return = lnv_finservice.of_postpaychqstm_split( ls_branch, ls_entry , ls_machine , ldtm_wdate , lstr_chqcond , ls_accno ,  ls_chqtype , li_chequestatus , lds_chqlist , lds_chqspilt )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
</usage>
************************************************/


integer	li_row, li_index, li_chqsize, li_selected, li_chk 
datetime	 ldtm_today , ldtm_chqdate
string	ls_bank, ls_bankbranch, ls_chqbookno, ls_chqno, ls_remark
string	ls_paywhom, ls_member, ls_referslip , ls_tofromaccid , ls_bridgeche_no
dec{2}	ldc_itemamt, ldc_sumitemamt
integer	li_used, li_remain, li_available,li_transec_no , li_seqno
string	ls_ref_slipno, ls_from_system, ls_deptaccount_no

dwItemStatus	l_status

ls_bank				= trim( ads_chqcond.object.as_bank[1] )
ls_bankbranch		= trim( ads_chqcond.object.as_bankbranch[1] )
ls_chqbookno		= trim( ads_chqcond.object.as_chqbookno[1] )
ls_chqno				= trim( ads_chqcond.object.as_chqstart_no[1])
ldtm_chqdate		= ads_chqcond.object.adtm_date[1]

ldtm_today			= datetime( date( adtm_wdate ) , now() )

li_row					= ads_chqspilt.rowcount( )
ldc_sumitemamt		= 0

if not isvalid( idc_printchq ) then
	idc_printchq		= create n_ds
	idc_printchq.dataobject	= "d_chequelist_forprint"
	idc_printchq.settransobject( itr_sqlca )
else
	idc_printchq.reset( )
end if

// ตรวจสอบการดึงข้อมูลสำหรับการพิมพ์เช็ค
li_chk			= idc_printchq.retrieve( ls_bank, ls_bankbranch, ls_chqbookno, ls_chqno, as_branch )

if li_chk < 1 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก finshqeuestatement เพื่อเตรียมพิมพ์เช็ค" + itr_sqlca.sqlerrtext
	throw ithw_exception

end if

ls_remark		= trim( ads_chqlist.object.payment_desc[1] )
ls_referslip	= trim( ads_chqlist.object.slip_no[1] )

if isnull( ls_referslip ) then ls_referslip = ""
if isnull( ls_remark ) then ls_remark = ""

li_chk			= 0

select	account_id
into		:ls_tofromaccid
from		FINBANKACCOUNT
WHERE		(	ACCOUNT_NO= :as_accno ) AND  
			(	BANK_CODE			= :ls_bank ) AND  
			( 	BANKBRANCH_CODE	= :ls_bankbranch  ) and
			( COOPBRANCH_ID		= :as_branch )
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT เพื่อปรับปรุงรหัสคู่บัญชี " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

for li_index = 1 to li_row
	
//	li_selected		= ads_chqlist.object.ai_selected[li_index]
//	
//	if li_selected = 0 then continue
	
	li_chk ++
	
	if li_chk > 1 then
		ls_chqno	= string( long( ls_chqno  ) + 1 , '0000000' )
	end if
	
	
	ls_paywhom	= trim( ads_chqspilt.object.as_towhom[li_index] )
	ldc_itemamt	= ads_chqspilt.object.adc_money[li_index]
	
	if isnull( ls_paywhom ) then ls_paywhom = ""
	if isnull( ldc_itemamt ) then ldc_itemamt = 0
	
	// ตรวจสอบการสั่งจ่าย
	if ls_paywhom = "" then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement ไม่ระบุการสั่งจ่าย" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	// ตรวจสอบการระบุจำนวนเงิน
	if ldc_itemamt <= 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement ไม่ระบุจำนวนเงิน" + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	ldc_sumitemamt	= ldc_sumitemamt + ldc_itemamt
	
	select	USE_STATUS , SEQ_NO
	into		:li_used , :li_seqno
	from		finchqeuestatement
	where		( CHEQUE_NO			= :ls_chqno ) and
				( CHEQUEBOOK_NO	= :ls_chqbookno ) and
				( BANK_CODE			= :ls_bank ) and 
				( BANK_BRANCH		= :ls_bankbranch ) and
				( COOPBRANCH_ID	= :as_branch ) and
				( chqeue_status	<> -9 ) 
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถดึงสถาระเช็คจาก finshqeuestatement เช็คเลขที่ " + ls_chqno + " "  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
if isnull(li_seqno) or li_seqno = 0 then	li_seqno = 1
	
	if ( li_used = 1 ) or ( li_used = -9 ) then
		destroy( idc_printchq )
		ithw_exception.text	= "เช็คเลขที่ " + ls_chqno + " ได้มีการใช้ไปแล้ว หรือ ถูกยกเลิก กรุณาตรวจสอบ"  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	// update account ID to where it's from
	
	ls_ref_slipno		= trim( ads_chqlist.object.ref_slipno[1] )
	ls_from_system	= trim( ads_chqlist.object.from_system[1] )
	
	this.of_updatetofrom_accid( as_branch, adtm_wdate , ldtm_chqdate , ls_ref_slipno , ls_tofromaccid , ls_from_system , li_index)

	// ทำการปรับปรุงลงฐานข้อมูล
	update		finchqeuestatement
	set			DATE_ONCHQ			= :ldtm_chqdate ,
					ENTRY_ID				= :as_entry,
					ENTRY_DATE			= :adtm_wdate,
					TO_WHOM				= :ls_paywhom,
					TYPECHQ_PAY			= 0,
					MONEY_AMT			= :ldc_itemamt,
					CHQEUE_STATUS		= :ai_chequestatus,
					ADVANCE_CHQ			= 0,
					COOPBRANCH_ID		= :as_branch,
					MACHINE_ID			= :as_machine,
					MEMBER_NO			= :ls_member,
					from_bankaccno		= :as_accno,
					refer_slipno		= :ls_referslip,
					cheque_type			= :as_chqtype ,
					printed_status		= 1,
					PRINTED_ID			= :as_entry,
					PRINTED_DATE		= :adtm_wdate,
					PRINTED_TERMINAL	= :as_machine,
					USE_STATUS			= 1,
					remark				= :ls_remark
	where		( CHEQUE_NO		= :ls_chqno ) and
					( CHEQUEBOOK_NO	= :ls_chqbookno ) and
					( BANK_CODE			= :ls_bank ) and 
					( BANK_BRANCH		= :ls_bankbranch ) and
					( USE_STATUS		= 0 ) and
					( COOPBRANCH_ID	= :as_branch ) and 
					( chqeue_status	<> -9 ) and
					( seq_no = :li_seqno )
	using itr_sqlca ;
					
	
	if itr_sqlca.sqlcode <> 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchqeuestatement เช็คเลขที่ " + ls_chqno + " "  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception				
	end if

	// insert finbridgechq  ----------------------------------------------- // by Phai 
	// บันทึกข้อมูล Table finbridgechq เป็น Table เชื่อมรายการ slip กับ Cheque
	//-----------------------------------------------------------------------
	
	this.of_postbridgechq( as_branch , ls_referslip ,ls_bank, ls_bankbranch, ls_chqbookno , ls_chqno , li_seqno )
	ls_ref_slipno	= trim( ads_chqlist.object.slip_no[1] )
	
	if idc_mainslip = idc_sumsplit then
		update finslip
		set		payment_status	= 1 ,
				receive_date		= :adtm_wdate ,
				receive_status		= 1	,
				recvpay_id			= :as_entry , 
				recvpay_time		= :ldtm_today
		where slip_no	 			= :ls_ref_slipno
		and coopbranch_id		= :as_branch 
		using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			destroy( idc_printchq )		
			ithw_exception.text	="ไม่สามารถปรับปรุง ข้อมูลได้ ลง finslip 1 "+ itr_sqlca.sqlerrtext
			rollback using itr_sqlca ;
			throw ithw_exception		
		end if
			
	end if
	
		
	// ทำการระบุค่าเพื่อทำการพิมพ์เช็คในลำดับถัดไป
	idc_printchq.object.printed_status[li_chk]	= 1
	
	choose case ai_chequestatus
		case 2,0			
			update	finslip
			set		receive_status		= 0
			where	slip_no				= :ls_ref_slipno and
					coopbranch_id		= :as_branch 
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				destroy( idc_printchq )		
				ithw_exception.text	="ไม่สามารถปรับปรุง ข้อมูลได้ ลง finslip 2 "+ itr_sqlca.sqlerrtext
				rollback using itr_sqlca ;
				throw ithw_exception		
			end if
			
		case else
			
	end choose
	
	// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
	this.of_posttobank( as_branch , as_entry , adtm_wdate , as_machine  , as_accno, ls_bank, ls_bankbranch, ldc_itemamt , -1)	

//	// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
////	if ( ls_from_system <> "FIN" ) then
//		dec{2}	ldc_scobal
//		string	ls_account_type, ls_slipbankno, ls_year, ls_account_name, ls_book_no
//		long		ll_laststm_seq
//		datetime	ldtm_open_date
//		n_cst_cm_doccontrol_service		lnv_docsrv
//		
//		ldc_scobal = 0	
//		ll_laststm_seq = 0		
//		
//		select	SCO_BALANCE, laststm_seq, account_type, open_date, account_name, book_no,
//					account_id
//		into		:ldc_scobal, :ll_laststm_seq, :ls_account_type, :ldtm_open_date, :ls_account_name, :ls_book_no,
//					:ls_tofromaccid
//		from		FINBANKACCOUNT
//		WHERE		(	ACCOUNT_NO			= :as_accno ) AND  
//					(	BANK_CODE			= :ls_bank ) AND  
//					( 	BANKBRANCH_CODE	= :ls_bankbranch  ) and
//					( COOPBRANCH_ID		= :as_branch );
//		
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
//		
//		if isnull( ldc_scobal )	then ldc_scobal = 0			
//		if isnull( ll_laststm_seq )	then ll_laststm_seq = 0		
//		
//		ldc_scobal		-= ldc_itemamt
//		ll_laststm_seq	+= 1
//		
//		
//		li_chk			= lnv_docsrv.of_new( "FNRECEIPTBANK", ls_slipbankno, ls_year )
//		ls_slipbankno	=  right( trim( ls_year ), 2 ) + as_branch +  ls_slipbankno
//		
//		
//		INSERT INTO FINSLIP_BANK  
//		(	SLIP_NO,					ENTRY_ID,				ENTRY_DATE,				OPERATE_DATE,
//			COOPBRANCH_ID,			MACHINE_ID,				ACCOUNT_NO,				BANK_CODE,
//			BANK_BRANCH,			ACCOUNT_NAME,			OPEN_DATE,				LAST_STM,
//			ITEM_AMT,				BALANCE,					WITHDRAW_AMT,			ITEM_CODE,
//			BOOK_NO,					ACCOUNT_TYPE 
//		)  
//		VALUES
//		(	:ls_slipbankno,		:as_entry,			:adtm_wdate,		:adtm_wdate,
//			:as_branch,		:as_machine,			:as_accno,				:ls_bank,
//			:ls_bankbranch,		:ls_account_name,		:ldtm_open_date,		:ll_laststm_seq,
//			:ldc_itemamt,		:ldc_scobal,			:ldc_scobal,			'WCA',
//			:ls_book_no,			:ls_account_type
//		)  ;
//		
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถบันทึกข้อมูลได้ ลง FINSLIP_BANK " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
//		
//		INSERT INTO	FINBANKSTATEMENT
//		(		SEQ_NO,					ACCOUNT_NO,						BANK_CODE,
//				BANKBRANCH_CODE,		DETAIL_DESC,					ENTRY_ID,
//				ENTRY_DATE,				OPERATE_DATE,					REF_SEQ,
//				ITEM_STATUS,			CANCEL_ID,						CANCEL_DATE,
//				BALANCE,					BALANCE_BEGIN,					MACHINE_ID,
//				COOPBRANCH_ID,			refer_slipno,					item_amt
//		)
//		VALUES
//		( 		:ll_laststm_seq,		:as_accno,						:ls_bank,
//				:ls_bankbranch,		'ถอนเงิน',						:as_entry,
//				:adtm_wdate,		:adtm_wdate,				null,
//				1,							null,								null,
//				:ldc_scobal,			0,									:as_machine,
//				:as_branch,		:ls_slipbankno,				:ldc_itemamt
//		) ;
//		
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKSTATEMENT " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
//		
//		UPDATE	FINBANKACCOUNT
//		SET		SCO_BALANCE				= :ldc_scobal,
//					laststm_seq				= :ll_laststm_seq
//		WHERE		( ACCOUNT_NO			= :as_accno ) AND  
//					( BANK_CODE				= :ls_bank ) AND  
//					( BANKBRANCH_CODE		= :ls_bankbranch  ) and
//					( COOPBRANCH_ID		= :as_branch );
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKACCOUNT " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
////	end if
	
next

select		chqslip_used, chqslip_remain
into		:li_used, :li_remain
from		finchequemas
where		chequebook_no	= :ls_chqbookno and
			bank_code		= :ls_bank and
			bank_branch		= :ls_bankbranch and
			COOPBRANCH_ID	= :as_branch 
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )		
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก finchequemas "  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception		
end if

if isnull( li_used ) then li_used= 0
if isnull( li_remain ) then li_remain= 0

li_used			= li_used + li_selected
li_remain		= li_remain - li_selected
li_available	= 1

if li_remain < 1 then
	li_available	= 0
	li_remain		= 0
end if


// ทำการปรัปรุงค่าเช็คที่ได้ใช้ไป
update	finchequemas
set			chqslip_used		= :li_used,
			chqslip_remain		= :li_remain,
			available_flag		= :li_available,
			last_chqno			= :ls_chqno
where	chequebook_no		= :ls_chqbookno and
			bank_code			= :ls_bank and
			bank_branch			= :ls_bankbranch and
			COOPBRANCH_ID		= :as_branch 
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )		
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchequemas " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception			
end if

idc_printchq.accepttext( )

return success
end function

private function integer of_importstring_xml (ref n_ds ads_data, string as_data_xml) throws Exception;integer	li_chk
string		ls_dwobjectname

n_cst_dwxmlieservice		lnv_imp

lnv_imp	= create n_cst_dwxmlieservice	

// ชื่อ Datawindow ที่ใช้
ls_dwobjectname 	= lnv_imp.of_getdataobject( as_data_xml )

li_chk = lnv_imp.of_xmlimport( ads_data , as_data_xml )
//li_chk = ads_data.importstring( XML!, as_data_xml )

if li_chk <  0 then
	ithw_exception.text	= "Import " + ls_dwobjectname + " ไม่สำเร็จ : " +  this.of_err_generate_import_xml( li_chk )
	rollback using itr_sqlca ;
	throw ithw_exception
end if

return success
end function

private function string of_err_generate_import_xml (integer ai_error) throws Exception;choose case ai_error
	case	-1   
		return "No rows or startrow value supplied is greater than the number of rows in the string"
	case	-3
		return "Invalid argument"
	case	-4
		return "Invalid input"
	case	-11
		return "XML Parsing Error; XML parser libraries not found or XML not well formed"
	case	-12
		return "XML Template does not exist or does not match the DataWindow"
	case	-13
		return "Unsupported DataWindow style for import"
	case	-14
		return "Error resolving DataWindow nesting"
	case else
		return "No Error Message"
end choose
end function

public function integer of_retrieveformatchq (string as_branch, string as_bankcode, integer ai_chqtype, integer ai_printtype, ref string as_format_xml) throws Exception;n_ds lds_data

// รายการพิมพ์เช็ค
lds_data	= create n_ds
lds_data.dataobject = "d_change_format_detail" 
lds_data.settransobject( itr_sqlca )

lds_data.retrieve( as_bankcode , ai_chqtype , as_branch ,ai_printtype )

as_format_xml = ""
if lds_data.rowcount( ) > 0 then
	as_format_xml	 = lds_data.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_data ) 

return success
end function

public function integer of_retrievelistformatchq (string as_branch, ref string as_formatlist_xml) throws Exception;n_ds lds_data , lds_list


// รายการรูปแบบเช็ค
lds_list	= create n_ds
lds_list.dataobject = "d_fin_chqformat_list" 
lds_list.settransobject( itr_sqlca )
lds_list.retrieve( as_branch ) 

as_formatlist_xml = lds_list.describe( "Datawindow.Data.Xml" )

return success
end function

public function integer of_postrecvshrlon (string as_slipmain_xml, string as_slipdet_xml, ref string as_receiveno) throws Exception;/***********************************************
<description>
	ดึงข้อมูลจากระบบหุ้นหนี้ ที่เป็นรายการรับชำระพิเศษ
</description>

<arguments>	
	as_memberno			รหัสสมาชิก
	ls_coopid				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการ
	adtm_wdate				วันที่ทำรายการ
	as_machine				ชื่อเครื่องที่ทำรายการ
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postshrlonto_fin()
	
	Integer li_return
	String ls_memberno , ls_coopid , ls_entry , ls_machine
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postshrlonto_fin( ls_memberno , ls_coopid , ls_entry , ldtm_wdate, ls_machine )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/10/2010 by Phaiwaan
	Version 1.1 แก้ดึงข้อมูลรายการที่ถูกยกเลิกต้นทางแล้ว Modified Date 6/11/2010 by Phaiwaan	
</usage>
************************************************/

integer	li_row, li_chk, li_itemstatus, li_itemstatus1, li_recev, li_update , li_index , li_found ,  li_index_i , li_rowmas
string	ls_fnrecvno, ls_docno, ls_year, ls_refslipno, ls_slipno, ls_receiptno, ls_stm_itemtype , ls_refsyst
string	ls_entryid, ls_fromsystem, ls_bankcode, ls_bankbranch, ls_memno, ls_nonmemberdetail , ls_loanno
string	ls_accid, ls_cashtype, ls_itemtypecode,  ls_chequeno, ls_paydesc, ls_accountno ,ls_coopid
string	ls_towhom,  ls_cancelid, ls_memname, ls_shrlontype, ls_slipitemtype , ls_accid_slipdet , ls_dwobjectname
datetime	ldtm_dateonchq, ldtm_canceldate, ldtm_entrydate, ldtm_opreatedate, ldtm_postdate
dec{2}	ldc_itemamt, ldc_bankfee, ldc_banksrv, ldc_sharespx , ldc_itemamtdet
dec{2}	ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_accuint, ldc_temp 
integer	li_member_flag, li_paymentstatus, li_payrec_status, li_chqadv, li_shlnuserecv, li_recvstatus 

n_ds	lds_main , lds_slipdet
str_slipinfo	lstr_slipinfo

// การดึงข้อมูลมาการเงิน
li_shlnuserecv	= integer( this.of_getattribconstant( "shrlon_usefinreceipt" , "INTEGER" ))
if isnull( li_shlnuserecv ) then li_shlnuserecv = 0

if li_shlnuserecv = 0 then return success

// ชื่อ Datawindow ที่ใช้
ls_dwobjectname 	= inv_print_srv.of_getdataobject( as_slipmain_xml )

lds_main	= create n_ds
lds_main.dataobject = ls_dwobjectname
lds_main.settransobject( itr_sqlca )

// Import String Xml
if not isnull( as_slipmain_xml ) and trim( as_slipmain_xml ) <> "" then
	this.of_importstring_xml( lds_main , as_slipmain_xml )
else
	ithw_exception.text	= "ไมมีข้อมูลหลัก กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ข้อมูลการรายละเอียด--------------------------------------------------------
ls_dwobjectname 	= inv_print_srv.of_getdataobject( as_slipdet_xml )

lds_slipdet	= create n_ds
lds_slipdet.dataobject		= ls_dwobjectname 	
lds_slipdet.settransobject( itr_sqlca )

// Import String Xml
if not isnull( as_slipdet_xml ) and trim( as_slipdet_xml ) <> "" then
	this.of_importstring_xml( lds_slipdet , as_slipdet_xml )
end if
//---------------------------------------------------------------------------------

// รับจ่ายเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่
li_recev	= integer( this.of_getattribconstant( "allpay_atfin" ,"INTEGER" ))
if isnull( li_recev ) then li_recev = 0

if li_recev = 1 then
	li_paymentstatus		= 8
	li_recvstatus			= 0
else
	// ต้องทำการตรวจสอบเงินสดด้วย
	li_paymentstatus		= 1
	li_recvstatus			= 1
end if

li_rowmas		= lds_main.rowcount()

for li_index = 1 to li_rowmas
	
		li_payrec_status	= lds_main.object.sliptypesign_flag[li_index]
		ls_fromsystem		= 'SHL' 
		li_itemstatus		= lds_main.object.slip_status[li_index]
		ls_coopid			= lds_main.object.coop_id[li_index]
		// หากน้อยกว่า 0 คือ การจ่าย
		if li_payrec_status < 1 then
			li_payrec_status		= 0
		end if
		
		ls_refslipno			= lds_main.object.payinslip_no[li_index]

		if ( li_itemstatus = -9 ) or ( li_itemstatus = -99 ) then	
			
//			 ตรวจสอบมีการทำรายการแล้วรึยัง
			
			select count( * )
			into 	:li_found
			from finslip			
			where ref_slipno = :ls_refslipno
			and from_system  = 'SHL'
			using itr_sqlca ;
			
			if isnull( li_found ) then li_found = 0
			
			if li_found = 0 then  continue 
				
			ls_cancelid			= lds_main.object.cancel_id[ li_index ]
			ldtm_canceldate	= lds_main.object.cancel_date[ li_index ]
			
			// ทำการปรับปรุงรายการยกเลิก
			update	FINSLIP
			set		PAYMENT_STATUS	= -9,
					cancel_id			= :ls_cancelid,
					cancel_date		= :ldtm_canceldate,
					receive_status		= 1,
					receive_date		= :ldtm_canceldate			
			where	SLIP_NO			= :ls_slipno and
					COOP_ID	= :ls_coopid 
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
//				rollback using itr_sqlca ; 
				throw ithw_exception
			end if
			
			// หากรับเงินที่หน้าเคาร์เตอร์เลย
			if ( ls_cashtype = 'CSH' ) and ( li_recev = 0 )  then
				
				select		SLIP_NO , pay_recv_status , member_no , item_amtnet , payment_desc , itempaytype_code
				into		:ls_slipno , :li_recvstatus , :ls_memno , :ldc_itemamt, :ls_paydesc , :ls_itemtypecode
				from		FINSLIP
				where	REF_SLIPNO		= :ls_refslipno and
							COOP_ID	= :ls_coopid and
							ENTRY_DATE	= :ldtm_entrydate and
							from_system	= :ls_fromsystem and
							entry_id			=:ls_entryid 
				using itr_sqlca ;
				
				if itr_sqlca.sqlcode <> 0 then
					ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถค้นหาข้อมูลการยกเลิกได้"+ itr_sqlca.sqlerrtext 
//					rollback using itr_sqlca ; 
					throw ithw_exception
				end if
				
				// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
				lstr_slipinfo.slip_no 			= ls_slipno
				lstr_slipinfo.coop_id 		= ls_coopid
				lstr_slipinfo.member_no 		= ls_memno
				lstr_slipinfo.description 		= ls_paydesc
				lstr_slipinfo.entry_date 		= ldtm_entrydate
				lstr_slipinfo.from_system 	= ls_fromsystem
				lstr_slipinfo.item_amt 		= ldc_itemamt
				lstr_slipinfo.item_status 		= -9
				lstr_slipinfo.sign_flag 			= li_recvstatus
				lstr_slipinfo.recpaytype_code = ls_itemtypecode
				
				try
					this.of_postcash( lstr_slipinfo  , 1 ,ls_cancelid )
				catch ( Exception th )
					throw ithw_exception
				end try
				
		//		if ( ls_cashtype = 'CSH' ) then
		//			if this.of_postcash( ls_slipno, "FIN"  ) = Failure then return FAILURE
		//		end if
		//	else	
		//		if li_itemstatus1 = 1 then
		//			messagebox( 'ผิดพลาด', "การเงินได้ทำการ รับ/จ่าย ไปแล้ว ~r~n" &
		//				+ "ต้องแจ้งการยกเลิกที่ระบบการเงินก่อน จึงทำรายการยกเลิกใหม่ " +  itr_sqlca.sqlerrtext , StopSign! )
		//			rollback;
		//			return Failure
		//		end if
			end if

			continue
		end if
		
		
		// ตรวจสอบมีการทำรายการแล้วรึยัง
		select count( * )
		into 	:li_found
		from finslip
		where ref_slipno = :ls_refslipno
		and	PAYMENT_STATUS <> -9
		and from_system  = 'SHL'
		using itr_sqlca ;
		
		if isnull( li_found ) then li_found = 0
		
		if li_found > 0 then  continue 
				
		
		ldc_itemamt			= lds_main.object.slip_amt[li_index]	
		ldtm_opreatedate	= lds_main.object.operate_date[li_index]
		ldtm_entrydate		= lds_main.object.slip_date[li_index]
		ls_entryid			= lds_main.object.entry_id[li_index]

		ls_bankcode			= lds_main.object.expense_bank[li_index]
		ls_bankbranch		= lds_main.object.expense_branch[li_index]
		ls_memno			= lds_main.object.member_no[li_index]
		ls_memname		= this.of_getmembername( ls_memno )
		ls_towhom			= trim( ls_memname )
		ls_cashtype			= lds_main.object.moneytype_code[li_index]
		ls_itemtypecode	= lds_main.object.sliptype_code[li_index]
		ls_accountno		= lds_main.object.expense_accid[li_index]
		
		ls_accid				= lds_main.object.tofrom_accid[li_index]
		if isnull( ls_accid	) then 	
			ls_accid	 = this.of_defaultaccid( ls_cashtype ) 
		end if
		
		ldc_banksrv			= 0.00 //lds_main.object.banksrv_amt[li_index]
		ldc_bankfee			= 0.00 //lds_main.object.bankfee_amt[li_index]

		ls_receiptno			= ""
		ldtm_postdate		= inv_calendar_srv.of_getpostingdate( year( date( ldtm_opreatedate ) ), month( date( ldtm_opreatedate ) ) )

		if isnull( ldc_itemamt ) then	ldc_itemamt = 0
		
//		if ldc_itemamt < 1 then
//			ithw_exception.text	= "ระบบหุ้นหนี้ : ยอดทำรายการน้อยกว่าหรือเท่ากับ 0 ไม่สามารถทำรายการได้"
//			rollback using itr_sqlca ; 
//			throw ithw_exception
//		end if
		
		// สอบถามว่าเป็นการจ่าปันผลหรือเปล่า
		if ( ls_itemtypecode = 'YDI' ) then
			li_payrec_status	= 0
		end if
		
		ls_fnrecvno		= this.of_get_lastslip_docno( "FNRECEIVENO" )
		
		this.of_getshrlon( ls_coopid   ,ls_memno  ,ldc_accuint ,  ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx )
		
		//ทำการหาข้อมูลเพิ่มเติมเกี่ยวกับ ดอกเบี้ยสะสม และ ทุนเรือนหุ้น
		// ดอกเบี้ยสะสม
		ldc_temp	= 0
		select	sum( interest_payamt )
		into		:ldc_temp
		from	slslippayindet
		where	payinslip_no			= :ls_refslipno and
				slipitemtype_code	= 'LON' 
		using itr_sqlca ;
					
		if isnull( ldc_temp ) or ldc_temp < 0 then ldc_temp = 0
		ldc_accuint		= ldc_accuint + ldc_temp
		
		//ทุนเรือนหุ้น
		ldc_temp				= 0
		ls_stm_itemtype	= ""
		
		select	item_payamt, stm_itemtype
		into		:ldc_temp, :ls_stm_itemtype
		from	slslippayindet
		where	payinslip_no				= :ls_refslipno and
				slipitemtype_code	= 'SHR' 
		using itr_sqlca ;
					
		if isnull( ldc_temp ) or ldc_temp < 0 then ldc_temp = 0
		if isnull( ldc_temp )  then ls_stm_itemtype = ""
		
		ldc_share	= ldc_share + ldc_temp
		
		// หุ้นพิเศษ
		if ls_stm_itemtype = "SPX" or  ls_stm_itemtype = "SPD" then
			ldc_sharespx	= ldc_sharespx + ldc_temp
		end if
		
		// คำอธิบาย
		if ( ls_stm_itemtype = 'SPD'  ) or ( ls_stm_itemtype = 'LPD' ) then
			ls_paydesc	= " โอนซื้อหุ้น/ชำระหนี้ " + ls_memno
		else
			ls_paydesc	= "ซื้อหุ้น/ชำระหนี้ " + ls_memno //lds_main.object.slipitem_desc[li_index] + " " + ls_memno
		end if
		
		if ( li_shlnuserecv = 1 ) then
			ls_receiptno		= this.of_get_lastslip_docno( "FNRECEIPTNO" )
		else
			ls_receiptno		= this.of_get_lastslip_docno( "SLRECEIPTNO" ) 
			//lds_main.object.document_no[li_index]
		end if
		as_receiveno = ls_receiptno
//		// หากเป็นรายการเช็คและเป็นรายการรับ
//		if ( ls_cashtype = "CHQ" ) and ( li_payrec_status = 1  ) then ls_cashtype = "CBT"
		
		if ls_cashtype = 'TRN' or ls_cashtype = 'TBK' or ls_cashtype = "CBT" then
//			li_paymentstatus	= 1
			li_recvstatus			= 1
			if ( ( ls_itemtypecode <> 'YDI' ) or ( ( ls_itemtypecode = 'YDI' ) and ( ( ls_stm_itemtype = "SPD" ) or ( ls_itemtypecode = 'LPD' )  ) )  ) or  &
						( ( date( ldtm_postdate ) <> date( ldtm_entrydate ) ) and ( ls_itemtypecode = "PMF" ) ) then
				
			
				li_payrec_status	= 1
		
				// by Phai ยังไม่รุว่าใช้ทำอะรัย
		//		// กรณีที่สร้างเลขที่ใบเสร็จต้องทำการปรับปรุงที่รายการเคลื่อนไหวของรายการที่เกี่ยวข้องได้
		//		// หนี้ , หุ้น
		//		for li_update = 1 to lds_main.rowcount()
		//			string	ls_loancontract_no, ls_slipitemtype_code, ls_lncoop_id, ls_REF_DOCNO
		//			string	ls_shrlontype_code
		//			integer	li_operate_flag
		//			
		//			ls_slipitemtype_code	= lds_main.object.slipitemtype_code[li_update]
		//			ls_loancontract_no	= lds_main.object.loancontract_no[li_update]
		//			li_operate_flag		= lds_main.object.operate_flag[li_update]
		//			ls_lncoop_id			= lds_main.object.lncoop_id[li_update]
		//			ls_REF_DOCNO			= lds_main.object.document_no[li_update]
		//			ls_shrlontype_code	= lds_main.object.shrlontype_code[li_update]
		//			
		//			if isnull( ls_REF_DOCNO ) then ls_REF_DOCNO = ""
		//			if isnull( ls_lncoop_id ) then ls_lncoop_id = ls_coopid
		//			if isnull( li_operate_flag ) then li_operate_flag = 0
		//			if isnull( ls_loancontract_no ) then ls_loancontract_no = ""
		//			if isnull( ls_slipitemtype_code ) then ls_slipitemtype_code = ""
		//			
		//			if ( li_operate_flag = 1 ) and ( li_shlnuserecv = 1 ) then
		//				choose case ls_slipitemtype_code
		//					case "SHR"
		////						UPDATE	SHSHARESTATEMENT  
		////						SET		REF_DOCNO			= :ls_receiptno
		////						WHERE	( MEMBER_NO			= :ls_memno ) AND  
		////									( SHARETYPE_CODE	= :ls_shrlontype_code ) AND  
		////									( coop_id			= :ls_mbbranch ) AND  
		////									( REF_DOCNO			= :ls_REF_DOCNO ) ;
		////									
		////						if itr_sqlca.sqlcode <> 0 then
		////							messagebox( "ผิดพลาด", "ไม่สามารถบันทึกข้อมูลลง UPDATE	SHSHARESTATEMENT   ได้ " + itr_sqlca.sqlerrtext, StopSign! )
		////							rollback;
		////							return Failure
		////						end if
		//
		//					case "LON"
		////						UPDATE	LNCONTSTATEMENT  
		////						SET		REF_DOCNO			= :ls_receiptno
		////						WHERE	( LOANCONTRACT_NO	= :ls_loancontract_no ) AND  
		////									( coop_id			= :ls_lncoop_id ) AND  
		////									( REF_DOCNO			= :ls_REF_DOCNO )  ;
		////
		////						if itr_sqlca.sqlcode <> 0 then
		////							messagebox( "ผิดพลาด", "ไม่สามารถบันทึกข้อมูลลง UPDATE	LNCONTSTATEMENT   ได้ " + itr_sqlca.sqlerrtext, StopSign! )
		////							rollback;
		////							return Failure
		////						end if
		//						
		//					case else
		//						
		//				end choose
		//			end if			
		//			
		//		next
				
			end if
		end if
		
		// บันทึกลง slip หลัก
		INSERT INTO	FINSLIP
		(	SLIP_NO,				ENTRY_ID,				ENTRY_DATE,				OPERATE_DATE,
			FROM_SYSTEM,		PAYMENT_STATUS,		CASH_TYPE,				PAYMENT_DESC,
			BANK_CODE,			BANK_BRANCH,			ITEMPAY_AMT,			PAY_TOWHOM,
			DATEON_CHQ,			MEMBER_NO,				ITEMPAYTYPE_CODE,		PAY_RECV_STATUS,
			MEMBER_FLAG,		NONMEMBER_DETAIL,		COOP_ID,			MACHINE_ID,
			CANCEL_ID,			CANCEL_DATE,			BANKFEE_AMT,			BANKSRV_AMT,
			TOFROM_ACCID,		ACCOUNT_NO,				CHEQUEBOOK_NO,			CHQ_ADVFLAG,
			ref_slipno,			remark,					SHARE_AMT,				emer_amt,
			norm_amt,			extra_amt,				sharespx_amt,			tax_flag,
			tax_amt,				tax_rate,				item_amtnet,			ref_system,
			receive_date,		receive_status,		accuint_amt,			FROM_BANKCODE,
			FROM_BRANCHCODE,		retail_flag,		receipt_no,			recvpay_id ,
			vat_amt
		)  
		VALUES
		(	:ls_fnrecvno,		:ls_entryid,			:ldtm_entrydate,		:ldtm_opreatedate,   
			:ls_fromsystem,	:li_paymentstatus,	:ls_cashtype,			:ls_paydesc,
			:ls_bankcode,		:ls_bankbranch,		:ldc_itemamt,			:ls_towhom,   
			null,					:ls_memno,				:ls_itemtypecode,		:li_payrec_status,   
			1,						:ls_memname,			:ls_coopid,		'',   
			:ls_cancelid,		:ldtm_canceldate,		:ldc_bankfee,			:ldc_banksrv,   
			:ls_accid,			:ls_accountno,			null,						null,
			:ls_refslipno,		null,						:ldc_share,				:ldc_emer,
			:ldc_norm,			:ldc_extra,				:ldc_sharespx,			0,
			0,						0,							:ldc_itemamt,			:ls_fromsystem,
			:ldtm_entrydate,	:li_recvstatus,			:ldc_accuint,			:ls_bankcode,
			:ls_bankbranch,	0,							:ls_receiptno,			:ls_entryid ,
			0
		) using itr_sqlca ; 
		
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถบันทึกข้อมูลลง Finslip ได้ "+ itr_sqlca.sqlerrtext 
//			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		li_row = lds_slipdet.retrieve( ls_refslipno )
		
		for li_index_i = 1 to li_row
		
			ls_refsyst			= trim( lds_slipdet.object.slipitemtype_code[li_index_i] )
			ls_shrlontype		= trim( lds_slipdet.object.shrlontype_code[li_index_i] )
			ldc_itemamtdet		= lds_slipdet.object.item_payamt[li_index_i]
			ls_paydesc			= trim( lds_slipdet.object.slipitem_desc[li_index_i] )
			ls_loanno			= trim( lds_slipdet.object.loancontract_no[li_index_i] )
			
			
			if ls_refsyst = 'LON' then
				ls_paydesc	= ls_paydesc + " " + ls_loanno
			else
				ls_paydesc	= ls_paydesc + " " + ls_memno
			end if
			
		// หาคู่บัญชี ของหุ้น หนี้ ----------------------
			select account_id 
			into 	:ls_accid_slipdet
			from vcmapaccid
			where  system_code = 'LON'
			and slipitemtype_code = :ls_refsyst
			and shrlontype_code = :ls_shrlontype
			and shrlontype_status = 1
			using itr_sqlca ;
			
			if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ""
		//----------------------------------------------------
			
		INSERT INTO FINSLIPDET  
			( 	SLIP_NO,              		COOP_ID,              		SEQ_NO,              		SLIPITEMTYPE_CODE,              	SLIPITEM_DESC,   
				SLIPITEM_STATUS,		CANCEL_ID,							CANCEL_DATE,				POSTTOVC_FLAG,						VOUCHER_NO,   
				CANCELTOVC_FLAG,		CANCELVC_NO,						DISPLAYONLY_STATUS,	ITEMPAY_AMT,							ACCOUNT_ID,   
				ITEMPAYAMT_NET,		TAX_FLAG,							VAT_FLAG,					TAX_CODE,								TAXWAY_KEEP,   
				TAX_AMT,					SECTION_ID,						MEMBGROUP_CODE,		OPERATE_FLAG
			)  
		VALUES
			(	:ls_fnrecvno ,				:ls_coopid , 						:li_index_i , 					'000' , 									:ls_paydesc ,
				1 , 							null ,									null ,							0 ,											null , 		
				0	,							null ,									0 ,								:ldc_itemamtdet , 							:ls_accid_slipdet ,
				:ldc_itemamtdet , 			0 , 									0	,							0 ,											0 ,
				0 ,								0	,									null ,							1 
			) using itr_sqlca ;
			
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
//			rollback using itr_sqlca ; 
			throw ithw_exception
		end if

	next
	
next 

if (ls_cashtype = "CSH" ) and (  li_recev = 0 ) then
		
		// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
		lstr_slipinfo.slip_no 			= ls_refslipno
		lstr_slipinfo.coop_id 		= ls_coopid
		lstr_slipinfo.member_no 		= ls_memno
		lstr_slipinfo.description 		= ls_paydesc
		lstr_slipinfo.entry_date 		= ldtm_entrydate
		lstr_slipinfo.from_system 	= ls_fromsystem
		lstr_slipinfo.item_amt 		= ldc_itemamt
		lstr_slipinfo.item_status 		= 1
		lstr_slipinfo.sign_flag 			= li_payrec_status
		lstr_slipinfo.recpaytype_code = ls_itemtypecode
	
		try
			this.of_postcash( lstr_slipinfo  , 1 ,ls_entryid )
		catch ( Exception thw )
			throw ithw_exception
		end try
	end if
	
return success
end function

public function string of_init_printfinstatus (string as_branch, datetime adtm_wdate) throws Exception;n_ds	lds_main

lds_main		= create n_ds
lds_main.dataobject = "d_finstatus_main"
lds_main.settransobject( itr_sqlca ) 

lds_main.retrieve( as_branch , adtm_wdate )

if lds_main.rowcount() > 0 then
	return lds_main.describe("Datawindow.Data.Xml")
end if

destroy lds_main 

return ""
end function

public function integer of_postfinstatusexport (string as_coopname, string as_mainxml, string as_path) throws Exception;n_ds lds_main , lds_report , lds_exp

DatawindowChild	ldwc_recv , ldwc_pay , ldwc_net , ldwc_sumshrlon , ldwc_cashbegin

string 		ls_branch  , ls_reportxml		,	ls_lntype		,ls_shrlntype
datetime		ldtm_operate
dec{2}		ldc_bankbegin , ldc_bankforward , ldc_bankforward_sav , ldc_cashbegin , ldc_sumrecv , ldc_sumpay , ldc_cashforward
dec{2}		ldc_loanspc	,	ldc_loannomr	,	ldc_loannomshr	,	ldc_loanemer	,	ldc_shrwtd	,	ldc_payoutamt
integer		li_recvcount , li_paycount , li_sumshrloncount	, li_loop , li_index , li_row
integer		li_lnspccount	,	li_lnnomrcount	,	li_lnnomshrcount	,li_lnemercount	, li_shrwtdcount

lds_main		= create n_ds
lds_main.dataobject = "d_finstatus_main"
lds_main.settransobject( itr_sqlca ) 

lds_exp		= create n_ds
lds_exp.dataobject = "d_recvpay_exportexcel"

lds_report		= create n_ds
lds_report.dataobject = "fnd00001_recvpay_day_main_finstatus"
lds_report.settransobject( itr_sqlca ) 

if not isnull( as_mainxml ) and trim( as_mainxml ) <> "" then
	this.of_importstring_xml( lds_main , as_mainxml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไข สถานะการเงิน ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

if lds_main.rowcount() < 1 then
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไข สถานะการเงิน ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ls_branch  					= trim( lds_main.object.coopbranch_id[ 1 ] )
ldtm_operate				= lds_main.object.operate_date[ 1 ]
ldc_bankbegin 				= lds_main.object.bankbegin[ 1 ] 
ldc_bankforward 			= lds_main.object.bankforward[ 1 ]
ldc_bankforward_sav		= lds_main.object.bankforward_sav[ 1 ]

if isnull( ldc_bankbegin ) then			ldc_bankbegin = 0 
if isnull( ldc_bankforward ) then		ldc_bankforward = 0 
if isnull( ldc_bankforward_sav ) then	ldc_bankforward_sav = 0 


lds_report.retrieve( ls_branch , as_coopname , ldtm_operate , ldc_bankbegin , ldc_bankforward , ldc_bankforward_sav )

lds_report.getchild( "dw_recv" , ldwc_recv   ) 
lds_report.getchild( "dw_pay"  , ldwc_pay ) 
lds_report.getchild( "dw_net"  , ldwc_net ) 
lds_report.getchild( "dw_sumshrlon" , ldwc_sumshrlon ) 
lds_report.getchild( "dw_cashbegin" , ldwc_cashbegin ) 

ldc_cashbegin = 0
if ldwc_cashbegin.rowcount() > 0 then
	ldc_cashbegin	=	ldwc_cashbegin.getitemdecimal(  1, "cash_begin")
end if

li_recvcount 			=	ldwc_recv.rowcount() 
li_paycount 				=	ldwc_pay.rowcount() 
li_sumshrloncount		=	ldwc_sumshrlon.rowcount() 

li_loop 	=	li_recvcount

if li_recvcount < li_paycount then li_loop 	= li_paycount

// หัวรายงาน
li_row = lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] = "สรุปสถานะการเงิน  สอ.กสท ประจำวันที่ " + string(  ldtm_operate , "dd/mm/" ) + string(year( date(ldtm_operate ))  + 543 ) 

// ยอดเงินสดยกมา
li_row = lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] 		= "เงินสดคงเหลือยกมา"
lds_exp.object.recv_amt[ li_row ] 		= ldc_cashbegin

// ยอดธนาคารยกมา
li_row		= lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] 		= "เงินฝากธนาคารคงเหลือยกมา"
lds_exp.object.recv_amt[ li_row ] 		= ldc_bankbegin

// รวมยอดเงินสดและธนาคารยกมา
li_row		= lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] 		= "รวมเงินสหกรณ์คงเหลือยกมา"
lds_exp.object.recv_amt[ li_row ] 		= ldc_cashbegin + ldc_bankbegin 

// เว้นบรรทัด
li_row	=	lds_exp.insertrow(0)

// หัวข้อรายละเอียด
li_row		=	lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] 		= "รายรับ"
lds_exp.object.pay_desc[ li_row ] 		= "รายจ่าย"


for	li_index	= 1 to li_loop

		li_row		=	lds_exp.insertrow(0)
		
		if	li_index	<= li_recvcount then
			lds_exp.object.recv_desc[ li_row ] 		= ldwc_recv.getitemstring(  li_index , "type_desc")
			lds_exp.object.recv_count[ li_row ] 		= ldwc_recv.getitemnumber(  li_index , "count_slip" )
			lds_exp.object.recv_amt[ li_row ] 		= ldwc_recv.getitemdecimal(  li_index , "slip_netamt" ) 
		end if
		
		if	li_index	<= li_paycount then
			lds_exp.object.pay_desc[ li_row ] 		= ldwc_pay.getitemstring(  li_index , "type_desc")
			lds_exp.object.pay_count[ li_row ] 		= ldwc_pay.getitemnumber(  li_index , "count_slip" )
			lds_exp.object.pay_amt[ li_row ] 		= ldwc_pay.getitemdecimal(  li_index , "slip_netamt" ) 
		end if
		
next

// เว้นบรรทัด
li_row	=	lds_exp.insertrow(0)

ldc_sumrecv 		= dec( ldwc_net.describe( "Evaluate(' sum(   recv_amt  for all ) ' , 0 ) " ) ) 
ldc_sumpay			= dec( ldwc_net.describe( "Evaluate(' sum(  pay_amt  for all ) ' , 0 ) " ) ) 
ldc_cashforward	= dec( ldwc_net.describe( "Evaluate('  cash_begin   +  c_cashrcv - c_cashpay  ' , 0 ) " ) ) 

// ยอดรวมรับ จ่าย
li_row		=	lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] 		= "รวมรายรับ"
lds_exp.object.recv_amt[ li_row ] 		= ldc_sumrecv

lds_exp.object.pay_desc[ li_row ] 		= "รวมรายจ่าย"
lds_exp.object.pay_amt[ li_row ] 		= ldc_sumpay

// ยอดเงินสดยกมา และ เงินสดยกไป
li_row		=	lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] 		= "เงินสดคงเหลือยกมา"
lds_exp.object.recv_amt[ li_row ] 		= ldc_cashbegin

lds_exp.object.pay_desc[ li_row ] 		= "เงินสดคงเหลือยกไป"
lds_exp.object.pay_amt[ li_row ] 		= ldc_cashforward

// ยอดรวมทั้งหมด
li_row		= lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] 		= "รวมทั้งสิ้น"
lds_exp.object.recv_amt[ li_row ] 		= ldc_cashbegin + ldc_sumrecv 

lds_exp.object.pay_desc[ li_row ] 		= "รวมทั้งสิ้น"
lds_exp.object.pay_amt[ li_row ] 		= ldc_cashforward	 + ldc_sumpay

// ยอดจ่ายสะสม ทั้งเืดือน
ldc_loanspc				= 0
ldc_loannomr			= 0
ldc_loannomshr		= 0
ldc_loanemer			= 0
ldc_shrwtd				= 0

// ยอดนับจำนวน
li_lnspccount			= 0
li_lnnomrcount			= 0
li_lnnomshrcount		= 0
li_lnemercount			= 0
li_shrwtdcount			= 0

// รวมยอดจ่าย
for	li_index	 = 1 to li_sumshrloncount	
	
	ls_lntype			=	ldwc_sumshrlon.getitemstring( li_index	,"loangroup_code")
	ls_shrlntype		=	ldwc_sumshrlon.getitemstring( li_index	,"shrlontype_code")
	ldc_payoutamt	=	ldwc_sumshrlon.getitemdecimal( li_index	,"payoutnet_amt")
	
	// เงินกู้พิเศษ
	if	ls_lntype = "03" then	
		li_lnspccount++
		ldc_loanspc				+= ldc_payoutamt
		continue
	end if
	
	// เงินสามัญ
	if	ls_lntype = "02" and ls_shrlntype <> "26" then	
		li_lnnomrcount++
		ldc_loannomr				+= ldc_payoutamt
		continue
	end if
	
	// เงินกู้สามัญหุ้น
	if	ls_lntype = "02" and ls_shrlntype = "26" then	
		li_lnnomshrcount++
		ldc_loannomshr				+= ldc_payoutamt
		continue
	end if
	
	// เงินกู้ฉุกเฉิน
	if	ls_lntype = "01" then	
		li_lnemercount++
		ldc_loanemer				+= ldc_payoutamt
		continue
	end if
	
	// เงินจ่ายหุ้นคืน
	if	ls_shrlntype = "01" then	
		li_shrwtdcount++
		ldc_shrwtd				+= ldc_payoutamt
		continue
	end if
	
next

// เว้นบรรทัด
li_row	=	lds_exp.insertrow(0)

// สรุปท้ายรายงาน-----------------------------------------------------------------------------
// บรรทัด 1
li_row = lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] 		= "เงินสดคงเหลือยกไป"
lds_exp.object.recv_amt[ li_row ] 		= ldc_cashforward

lds_exp.object.pay_desc[ li_row ] 		= "จ่ายพิเศษสะสม"
lds_exp.object.pay_count[ li_row ] 	= li_lnspccount
lds_exp.object.pay_amt[ li_row ] 		= ldc_loanspc

// บรรทัด 2
li_row = lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] 		= "เงินฝากธนาคาร สอ.กสท. คงเหลือยกไป"
lds_exp.object.recv_amt[ li_row ] 		= ldc_bankforward

lds_exp.object.pay_desc[ li_row ] 		= "จ่ายสามัญสะสม"
lds_exp.object.pay_count[ li_row ] 	= li_lnnomrcount
lds_exp.object.pay_amt[ li_row ] 		= ldc_loannomr

// บรรทัด 3
li_row = lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] 		= "เงินฝากธนาคารกองทุนฯ คงเหลือยกไป"
lds_exp.object.recv_amt[ li_row ] 		= ldc_bankforward_sav

lds_exp.object.pay_desc[ li_row ] 		= "จ่ายกู้หุ้นสะสม"
lds_exp.object.pay_count[ li_row ] 	= li_lnnomshrcount
lds_exp.object.pay_amt[ li_row ] 		= ldc_loannomshr

// บรรทัด 4
li_row = lds_exp.insertrow(0)
lds_exp.object.recv_desc[ li_row ] 	= "รวมเงินฝากสหกรณ์และกองทุนฯ คงเหลือยกไป"
lds_exp.object.recv_amt[ li_row ] 		= ldc_cashforward	+ ldc_bankforward + ldc_bankforward_sav

lds_exp.object.pay_desc[ li_row ] 		= "จ่ายฉุกเฉินสะสม"
lds_exp.object.pay_count[ li_row ] 	= li_lnemercount
lds_exp.object.pay_amt[ li_row ] 		= ldc_loanemer

// บรรทัด 5
li_row = lds_exp.insertrow(0)

lds_exp.object.pay_desc[ li_row ] 		= "จ่ายคืนค่าหุ้นสะสม"
lds_exp.object.pay_count[ li_row ] 	= li_shrwtdcount
lds_exp.object.pay_amt[ li_row ] 		= ldc_shrwtd

//---------------------------------------------------------------------------------------------------

lds_exp.SaveAs( as_path , Excel8! , false  ,EncodingUTF8! )

destroy lds_report

return 1
end function

private function integer of_postbridgechq_chqslipt (string as_branch, string as_referslip, string as_bank, string as_bankbranch, string as_chqbookno, string as_chqno, integer ai_seqno) throws Exception;// Error 3
string		ls_slip[], ls_referslipno  , ls_bridgeche_no 
integer		li_upper, li_index, li_row

//inv_string.of_parsetoarray( as_referslip, ',', ls_slip[] )

//li_upper		= upperbound( ls_slip ) 

select max( bridgechq_no ) 
into :ls_bridgeche_no
from finbridgechq
using itr_sqlca ;

if isnull(ls_bridgeche_no) then	
	ls_bridgeche_no = "" 
end if

if itr_sqlca.sqlcode <>  0 or ls_bridgeche_no = "" then
	ls_bridgeche_no = "0000000000" 	
end if


//for li_index = 1 to li_upper
//	ls_referslipno	= ls_slip[ li_index ]
	ls_referslipno	= as_referslip
	
	// insert finbridgechq  ----------------------------------------------- // by Phai 
	// บันทึกข้อมูล Table finbridgechq เป็น Table เชื่อมรายการ slip กับ Cheque
	//-----------------------------------------------------------------------
	
	ls_bridgeche_no = right( "0000000000"  + string( long(ls_bridgeche_no)+1 ) , 10 ) 
	
	INSERT INTO FINBRIDGECHQ  
         ( 			BRIDGECHQ_NO,              	SLIP_NO,              		CHEQUEBOOK_NO,              	BANK_CODE,   
           			BANK_BRANCH,              	CHEQUE_NO,              	SEQ_NO ,							COOPBRANCH_ID , 		BRIDGE_STATUS  )  
  	VALUES ( 	:ls_bridgeche_no		, 		:ls_referslipno	,			:as_chqbookno		,				:as_bank		,
	  			 	:as_bankbranch	,			:as_chqno	,				:ai_seqno ,							:as_branch					, 1)
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึก ข้อมูลได้ ลง finbridgechq  " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception	
	end if
	
	//-----------------------------------------------------------------------
	
	
//next

return Success
end function

private function integer of_postpaychqstm_split_n (string as_branch, string as_entry, string as_machine, datetime adtm_wdate, string as_accno, string as_chqtype, integer ai_chequestatus, n_ds ads_chqcond, n_ds ads_chqlist, n_ds ads_chqspilt) throws Exception;/***********************************************
<description>
	บันทึกการทำรายการเคลื่อนไหวเช็คที่พิมพ์ออกจากการทำรายการ พิมพ์เช็คหลายใบจาก 1 สลิป 
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการพิมพ์เช็ค
	adtm_wdate				วันที่ทำการ
	as_machine				ชื่อเครื่องที่ทำรายการ
	astr_chqcond			Structure ข้อมูลเื่งื่อนไขการพิมพ์เช็ค
	as_accno					เลขที่บัญชีธนาคารที่ตัดออก
	as_chqtype				ประเภทเช็คที่จะพิมพ์
	ai_chequestatus		สถานะเช็คที่จะพิมพ์
	ads_chqlist				รายการที่เลือกพิมพ์เช็ค
	ads_chqspilt				รายการสั่งจ่ายเช็ค
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postpaychqstm_split()
	
	Integer li_return , li_chequestatus
	String ls_branch , ls_entry , ls_machine , ls_accno , ls_chqtype
	datetime	ldtm_wdate
	n_ds	lds_chqlist , lds_chqspilt
	str_chqinfo	lstr_chqcond
	
	li_return = lnv_finservice.of_postpaychqstm_split( ls_branch, ls_entry , ls_machine , ldtm_wdate , lstr_chqcond , ls_accno ,  ls_chqtype , li_chequestatus , lds_chqlist , lds_chqspilt )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
</usage>
************************************************/


integer	li_row, li_index, li_chqsize, li_selected, li_chk 
datetime	 ldtm_today , ldtm_chqdate
string	ls_bank, ls_bankbranch, ls_chqbookno, ls_chqno, ls_remark
string	ls_paywhom, ls_member, ls_referslip , ls_tofromaccid , ls_bridgeche_no
dec{2}	ldc_itemamt, ldc_sumitemamt
integer	li_used, li_remain, li_available,li_transec_no , li_seqno
string	ls_ref_slipno, ls_from_system, ls_deptaccount_no

dwItemStatus	l_status

ls_bank				= trim( ads_chqcond.object.as_bank[1] )
ls_bankbranch		= trim( ads_chqcond.object.as_bankbranch[1] )
ls_chqbookno		= trim( ads_chqcond.object.as_chqbookno[1] )
ls_chqno				= trim( ads_chqcond.object.as_chqstart_no[1])
ldtm_chqdate		= ads_chqcond.object.adtm_date[1]

ldtm_today			= datetime( date( adtm_wdate ) , now() )

li_row					= ads_chqspilt.rowcount( )
ldc_sumitemamt		= 0

if not isvalid( idc_printchq ) then
	idc_printchq		= create n_ds
	idc_printchq.dataobject	= "d_chequelist_forprint"
	idc_printchq.settransobject( itr_sqlca )
else
	idc_printchq.reset( )
end if

// ตรวจสอบการดึงข้อมูลสำหรับการพิมพ์เช็ค
li_chk			= idc_printchq.retrieve( ls_bank, ls_bankbranch, ls_chqbookno, ls_chqno, as_branch )

if li_chk < 1 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก finshqeuestatement เพื่อเตรียมพิมพ์เช็ค" + itr_sqlca.sqlerrtext
	throw ithw_exception

end if

ls_remark		= trim( ads_chqlist.object.payment_desc[1] )
ls_referslip	= trim( ads_chqlist.object.slip_no[1] )

if isnull( ls_referslip ) then ls_referslip = ""
if isnull( ls_remark ) then ls_remark = ""

li_chk			= 0

select	account_id
into		:ls_tofromaccid
from		FINBANKACCOUNT
WHERE		(	ACCOUNT_NO= :as_accno ) AND  
			(	BANK_CODE			= :ls_bank ) AND  
			( 	BANKBRANCH_CODE	= :ls_bankbranch  ) and
			( COOPBRANCH_ID		= :as_branch )
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT เพื่อปรับปรุงรหัสคู่บัญชี " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

for li_index = 1 to li_row
	
//	li_selected		= ads_chqlist.object.ai_selected[li_index]
//	
//	if li_selected = 0 then continue
	
	li_chk ++
	
	if li_chk > 1 then
		ls_chqno	= string( long( ls_chqno  ) + 1 , '0000000' )
	end if
	
	
	ls_paywhom	= trim( ads_chqspilt.object.as_towhom[li_index] )
	ldc_itemamt	= ads_chqspilt.object.adc_money[li_index]
	
	if isnull( ls_paywhom ) then ls_paywhom = ""
	if isnull( ldc_itemamt ) then ldc_itemamt = 0
	
	// ตรวจสอบการสั่งจ่าย
	if ls_paywhom = "" then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement ไม่ระบุการสั่งจ่าย" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	// ตรวจสอบการระบุจำนวนเงิน
	if ldc_itemamt <= 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement ไม่ระบุจำนวนเงิน" + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	ldc_sumitemamt	= ldc_sumitemamt + ldc_itemamt
	
	select	USE_STATUS , SEQ_NO
	into		:li_used , :li_seqno
	from		finchqeuestatement
	where		( CHEQUE_NO			= :ls_chqno ) and
				( CHEQUEBOOK_NO	= :ls_chqbookno ) and
				( BANK_CODE			= :ls_bank ) and 
				( BANK_BRANCH		= :ls_bankbranch ) and
				( COOPBRANCH_ID	= :as_branch ) and
				( chqeue_status	<> -9 ) 
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถดึงสถาระเช็คจาก finshqeuestatement เช็คเลขที่ " + ls_chqno + " "  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
if isnull(li_seqno) or li_seqno = 0 then	li_seqno = 1
	
	if ( li_used = 1 ) or ( li_used = -9 ) then
		destroy( idc_printchq )
		ithw_exception.text	= "เช็คเลขที่ " + ls_chqno + " ได้มีการใช้ไปแล้ว หรือ ถูกยกเลิก กรุณาตรวจสอบ"  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	// update account ID to where it's from
	
	ls_ref_slipno		= trim( ads_chqlist.object.ref_slipno[1] )
	ls_from_system	= trim( ads_chqlist.object.from_system[1] )
	
//  Error แก้ไขฉุกเฉิน
//	this.of_updatetofrom_accid( as_branch, adtm_wdate , ldtm_chqdate , ls_ref_slipno , ls_tofromaccid , ls_from_system , li_index)
	this.of_updatetofrom_accid_chqslipt( as_branch, adtm_wdate , ldtm_chqdate , ls_ref_slipno , ls_tofromaccid , ls_from_system , li_index)
	// ทำการปรับปรุงลงฐานข้อมูล
	update		finchqeuestatement
	set			DATE_ONCHQ			= :ldtm_chqdate ,
					ENTRY_ID				= :as_entry,
					ENTRY_DATE			= :adtm_wdate,
					TO_WHOM				= :ls_paywhom,
					TYPECHQ_PAY			= 0,
					MONEY_AMT			= :ldc_itemamt,
					CHQEUE_STATUS		= :ai_chequestatus,
					ADVANCE_CHQ			= 0,
					COOPBRANCH_ID		= :as_branch,
					MACHINE_ID			= :as_machine,
					MEMBER_NO			= :ls_member,
					from_bankaccno		= :as_accno,
					refer_slipno		= :ls_referslip,
					cheque_type			= :as_chqtype ,
					printed_status		= 1,
					PRINTED_ID			= :as_entry,
					PRINTED_DATE		= :adtm_wdate,
					PRINTED_TERMINAL	= :as_machine,
					USE_STATUS			= 1,
					remark				= :ls_remark
	where		( CHEQUE_NO		= :ls_chqno ) and
					( CHEQUEBOOK_NO	= :ls_chqbookno ) and
					( BANK_CODE			= :ls_bank ) and 
					( BANK_BRANCH		= :ls_bankbranch ) and
					( USE_STATUS		= 0 ) and
					( COOPBRANCH_ID	= :as_branch ) and 
					( chqeue_status	<> -9 ) and
					( seq_no = :li_seqno )
	using itr_sqlca ;
					
	
	if itr_sqlca.sqlcode <> 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchqeuestatement เช็คเลขที่ " + ls_chqno + " "  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception				
	end if

	// insert finbridgechq  ----------------------------------------------- // by Phai 
	// บันทึกข้อมูล Table finbridgechq เป็น Table เชื่อมรายการ slip กับ Cheque
	//-----------------------------------------------------------------------
	
	// Error 2
//	this.of_postbridgechq( as_branch , ls_referslip ,ls_bank, ls_bankbranch, ls_chqbookno , ls_chqno , li_seqno )
	this.of_postbridgechq_chqslipt( as_branch , ls_referslip ,ls_bank, ls_bankbranch, ls_chqbookno , ls_chqno , li_seqno )
	ls_ref_slipno	= trim( ads_chqlist.object.slip_no[1] )
	
	if idc_mainslip = idc_sumsplit then
		update finslip
		set		payment_status	= 1 ,
				receive_date		= :adtm_wdate ,
				receive_status		= 1	,
				recvpay_id			= :as_entry , 
				recvpay_time		= :ldtm_today
		where slip_no	 			= :ls_ref_slipno
		and coopbranch_id		= :as_branch 
		using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			destroy( idc_printchq )		
			ithw_exception.text	="ไม่สามารถปรับปรุง ข้อมูลได้ ลง finslip 1 "+ itr_sqlca.sqlerrtext
			rollback using itr_sqlca ;
			throw ithw_exception		
		end if
			
	end if
	
		
	// ทำการระบุค่าเพื่อทำการพิมพ์เช็คในลำดับถัดไป
	idc_printchq.object.printed_status[li_chk]	= 1
	
	choose case ai_chequestatus
		case 2,0			
			update	finslip
			set		receive_status		= 0
			where	slip_no				= :ls_ref_slipno and
					coopbranch_id		= :as_branch 
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				destroy( idc_printchq )		
				ithw_exception.text	="ไม่สามารถปรับปรุง ข้อมูลได้ ลง finslip 2 "+ itr_sqlca.sqlerrtext
				rollback using itr_sqlca ;
				throw ithw_exception		
			end if
			
		case else
			
	end choose
	
	// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
	this.of_posttobank( as_branch , as_entry , adtm_wdate , as_machine  , as_accno, ls_bank, ls_bankbranch, ldc_itemamt , -1)	

//	// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
////	if ( ls_from_system <> "FIN" ) then
//		dec{2}	ldc_scobal
//		string	ls_account_type, ls_slipbankno, ls_year, ls_account_name, ls_book_no
//		long		ll_laststm_seq
//		datetime	ldtm_open_date
//		n_cst_cm_doccontrol_service		lnv_docsrv
//		
//		ldc_scobal = 0	
//		ll_laststm_seq = 0		
//		
//		select	SCO_BALANCE, laststm_seq, account_type, open_date, account_name, book_no,
//					account_id
//		into		:ldc_scobal, :ll_laststm_seq, :ls_account_type, :ldtm_open_date, :ls_account_name, :ls_book_no,
//					:ls_tofromaccid
//		from		FINBANKACCOUNT
//		WHERE		(	ACCOUNT_NO			= :as_accno ) AND  
//					(	BANK_CODE			= :ls_bank ) AND  
//					( 	BANKBRANCH_CODE	= :ls_bankbranch  ) and
//					( COOPBRANCH_ID		= :as_branch );
//		
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
//		
//		if isnull( ldc_scobal )	then ldc_scobal = 0			
//		if isnull( ll_laststm_seq )	then ll_laststm_seq = 0		
//		
//		ldc_scobal		-= ldc_itemamt
//		ll_laststm_seq	+= 1
//		
//		
//		li_chk			= lnv_docsrv.of_new( "FNRECEIPTBANK", ls_slipbankno, ls_year )
//		ls_slipbankno	=  right( trim( ls_year ), 2 ) + as_branch +  ls_slipbankno
//		
//		
//		INSERT INTO FINSLIP_BANK  
//		(	SLIP_NO,					ENTRY_ID,				ENTRY_DATE,				OPERATE_DATE,
//			COOPBRANCH_ID,			MACHINE_ID,				ACCOUNT_NO,				BANK_CODE,
//			BANK_BRANCH,			ACCOUNT_NAME,			OPEN_DATE,				LAST_STM,
//			ITEM_AMT,				BALANCE,					WITHDRAW_AMT,			ITEM_CODE,
//			BOOK_NO,					ACCOUNT_TYPE 
//		)  
//		VALUES
//		(	:ls_slipbankno,		:as_entry,			:adtm_wdate,		:adtm_wdate,
//			:as_branch,		:as_machine,			:as_accno,				:ls_bank,
//			:ls_bankbranch,		:ls_account_name,		:ldtm_open_date,		:ll_laststm_seq,
//			:ldc_itemamt,		:ldc_scobal,			:ldc_scobal,			'WCA',
//			:ls_book_no,			:ls_account_type
//		)  ;
//		
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถบันทึกข้อมูลได้ ลง FINSLIP_BANK " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
//		
//		INSERT INTO	FINBANKSTATEMENT
//		(		SEQ_NO,					ACCOUNT_NO,						BANK_CODE,
//				BANKBRANCH_CODE,		DETAIL_DESC,					ENTRY_ID,
//				ENTRY_DATE,				OPERATE_DATE,					REF_SEQ,
//				ITEM_STATUS,			CANCEL_ID,						CANCEL_DATE,
//				BALANCE,					BALANCE_BEGIN,					MACHINE_ID,
//				COOPBRANCH_ID,			refer_slipno,					item_amt
//		)
//		VALUES
//		( 		:ll_laststm_seq,		:as_accno,						:ls_bank,
//				:ls_bankbranch,		'ถอนเงิน',						:as_entry,
//				:adtm_wdate,		:adtm_wdate,				null,
//				1,							null,								null,
//				:ldc_scobal,			0,									:as_machine,
//				:as_branch,		:ls_slipbankno,				:ldc_itemamt
//		) ;
//		
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKSTATEMENT " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
//		
//		UPDATE	FINBANKACCOUNT
//		SET		SCO_BALANCE				= :ldc_scobal,
//					laststm_seq				= :ll_laststm_seq
//		WHERE		( ACCOUNT_NO			= :as_accno ) AND  
//					( BANK_CODE				= :ls_bank ) AND  
//					( BANKBRANCH_CODE		= :ls_bankbranch  ) and
//					( COOPBRANCH_ID		= :as_branch );
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKACCOUNT " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
////	end if
	
next

select		chqslip_used, chqslip_remain
into		:li_used, :li_remain
from		finchequemas
where		chequebook_no	= :ls_chqbookno and
			bank_code		= :ls_bank and
			bank_branch		= :ls_bankbranch and
			COOPBRANCH_ID	= :as_branch 
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )		
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก finchequemas "  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception		
end if

if isnull( li_used ) then li_used= 0
if isnull( li_remain ) then li_remain= 0

li_used			= li_used + li_selected
li_remain		= li_remain - li_selected
li_available	= 1

if li_remain < 1 then
	li_available	= 0
	li_remain		= 0
end if


// ทำการปรัปรุงค่าเช็คที่ได้ใช้ไป
update	finchequemas
set			chqslip_used		= :li_used,
			chqslip_remain		= :li_remain,
			available_flag		= :li_available,
			last_chqno			= :ls_chqno
where	chequebook_no		= :ls_chqbookno and
			bank_code			= :ls_bank and
			bank_branch			= :ls_bankbranch and
			COOPBRANCH_ID		= :as_branch 
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )		
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchequemas " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception			
end if

idc_printchq.accepttext( )

return success
end function

public function integer of_init_openday (string as_coop_id, string as_entry_id, datetime adtm_wdate, string as_machine_id, ref string as_startday_info, ref string as_errmessage) throws Exception;/***********************************************
<description>
	กำหนด XML Config ในการทำรายการเปิดงานประจำวันการเงิน
</description>

<arguments>	
  	as_coop_id		รหัสสาขาสหกรณ์
	as_entry_id			รหัสผู้ใช้
	adtm_wdate			วันที่ ที่ทำรายการ
	as_machine_id		ชื่อเครื่องที่ทำรายการ
	as_startday_info	ข้อมูลการเปิดประจำวัน ส่งค่ากลับคืนในรูปแบบ XML
	as_errmessage		ข้อความ Error หากทำรายการเปิดงานประจำวันแล้ว
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_init_openday()
	
	Integer li_return 
	String ls_branch , ls_entry , ls_machine , ls_startday_info , ls_errmessage
	datetime	ldtm_wdate
	
	li_return = lnv_finservice.of_init_openday( ls_branch, ls_entry , ldtm_wdate , ls_machine , ls_startday_info , ls_errmessage )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
</usage>
************************************************/

n_ds	lds_cashmas
integer		li_rc , li_openday

datetime		ldtm_today, ldtm_time, ldtm_wtoday
datetime		ldtm_lastwday
dec{2}		ldc_balbegin, ldc_chqinsaft_bfamt
string			ls_entryid, ls_coopid, ls_machineid


ls_entryid		= as_entry_id
ls_coopid			= as_coop_id
ls_machineid	= as_machine_id

//inv_db	=	create	n_cst_dbconnectservice
inv_calendar_srv = create n_cst_calendarservice
inv_calendar_srv.itr_sqlca = itr_sqlca 

lds_cashmas	=	 create	n_ds
lds_cashmas.dataobject = "d_start_day" 
lds_cashmas.settrans( itr_sqlca ) 

ldtm_wtoday	= adtm_wdate
ldtm_time		= datetime( date( adtm_wdate ), now() )
ldtm_today		= datetime( date(now() ) )

// is already open?
li_openday	= this.of_is_open_day( ls_coopid , ldtm_wtoday )
if ( li_openday > 0 ) then
	as_errmessage	= "ได้มีการเปิดงานประจำวันแล้ว ไม่สามารถทำการเปิดได้"
	
	lds_cashmas.retrieve( ls_coopid , ldtm_wtoday ) 
	as_startday_info		=	lds_cashmas.describe( "Datawindow.data.XML" )
	destroy lds_cashmas 
	return success
end if

ldc_chqinsaft_bfamt = 0
li_rc			= this.inv_calendar_srv.of_initservice( inv_db )
li_rc			= this.inv_calendar_srv.of_getprevworkday( ldtm_wtoday , ldtm_lastwday )
ldc_balbegin	= this.of_getbalbegin( ldtm_lastwday, ldc_chqinsaft_bfamt , as_coop_id )

lds_cashmas.insertrow( 0 )

lds_cashmas.object.operate_date[1] 			= ldtm_wtoday 
lds_cashmas.object.entry_time[1]  			= datetime(date( ldtm_today ), now())
lds_cashmas.object.entry_date[1] 			= ldtm_today 
lds_cashmas.object.entry_tdate[1] 			= string( ldtm_today , "ddmmyyyy" )
lds_cashmas.object.operate_tdate[1]			= string( ldtm_wtoday , "ddmmyyyy" )
lds_cashmas.object.cash_begin[1] 			= ldc_balbegin 
lds_cashmas.object.cash_sumamt[1] 		= ldc_balbegin 
lds_cashmas.object.entry_id[1]					= ls_entryid 
lds_cashmas.object.coop_id[1] 				= ls_coopid 
lds_cashmas.object.machine_id[1] 			= ls_machineid 
lds_cashmas.object.chqinsaft_bfamt[1] 		= ldc_chqinsaft_bfamt 
lds_cashmas.object.close_status[1] 				= 0 
lds_cashmas.object.lastseq_no[1] 				= 1 

lds_cashmas.accepttext( )
as_startday_info		=	lds_cashmas.describe( "Datawindow.data.XML" )
destroy lds_cashmas 
return success
end function

private function decimal of_getbalbegin (datetime adtm_date, ref decimal adc_chqbfamt, string as_coop_id) throws Exception;dec{2}	ldc_balbegin, ldc_chqinsaft_bfamt
string	ls_coopid

ls_coopid		= as_coop_id

select       cash_foward, chqinsafe_amt
into		:ldc_balbegin, :ldc_chqinsaft_bfamt
from		fincashflowmas
where	operate_date	= :adtm_date and
			coop_id	= :ls_coopid
using		itr_sqlca	;

if itr_sqlca.sqlcode <> 0 then
	ldc_balbegin				= 0.00
	ldc_chqinsaft_bfamt	= 0.00
end if

if isnull( ldc_balbegin ) then ldc_balbegin = 0.00
if isnull( ldc_chqinsaft_bfamt ) then ldc_chqinsaft_bfamt = 0.00

adc_chqbfamt		= ldc_chqinsaft_bfamt
return ldc_balbegin
end function

private function integer of_is_open_day (string as_coop_id, datetime adtm_wdate) throws Exception;integer	li_rc

// ตรวจสอบดูว่าวันนี้มีการเปิดงานไปแล้วหรือยัง
select	count( operate_date )
into		:li_rc
from		fincashflowmas
where		( operate_date		= :adtm_wdate ) and 
			( coop_id	= :as_coop_id ) 
using	itr_sqlca ;
if isnull( li_rc ) then 	li_rc = 0 


if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบสถานะการเปิดงานประจำวันได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if



return li_rc
end function

public function integer of_retrievebankaccount (string as_coopid, ref string as_bank_xml, ref string as_bankstm_xml) throws Exception;string ls_bankaccno , ls_bank , ls_bankbranch 

n_ds	lds_bank , lds_stm

lds_bank	= create n_ds
lds_bank.dataobject  = "d_fin_bankaccount2"
lds_bank.settransobject( itr_sqlca )

if not isnull( as_bank_xml ) and trim( as_bank_xml ) <> "" then
	this.of_importstring_xml( lds_bank , as_bank_xml )
else
	ithw_exception.text	= "ไม่มีข้อเลขที่บัญชีธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_stm	= create n_ds
lds_stm.dataobject  = "d_banklist_statement"
lds_stm.settransobject( itr_sqlca )

ls_bankaccno	= lds_bank.object.account_no[1]

lds_bank.retrieve( as_coopid ,ls_bankaccno  )

as_bankstm_xml	= ""
if lds_bank.rowcount( ) > 0 then
	ls_bank 			= lds_bank.object.bank_code[1]
	ls_bankbranch 	= lds_bank.object.bankbranch_code[1]
	
	lds_stm.retrieve(as_coopid, ls_bank , ls_bankbranch , ls_bankaccno )

	as_bank_xml		= lds_bank.describe( "Datawindow.Data.Xml" )
	as_bankstm_xml	= lds_stm.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_bank ) 
destroy( lds_stm ) 

return success
end function

public function integer of_open_day (string as_openday_xml) throws Exception;/***********************************************
<description>
	บันทึกการทำรายการเปิดงานประจำวันการเงิน
</description>

<arguments>	
	as_openday_xml	ข้อมูลการเปิดประจำวัน 
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_open_day()
	
	Integer li_return 
	String ls_openday_xml 
	
	li_return = lnv_finservice.of_open_day( ls_openday_xml )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
</usage>
************************************************/

dec{2}	ldc_itemamt, ldc_cashin, ldc_cashout, ldc_cashsum_amt
dec{2}	ldc_balforward, ldc_cashbegin
datetime	ldtm_operatedate, ldtm_entrydate
string		ls_coopid,ls_entry_id, ls_machineid, ls_approve, ls_item_desc
string		ls_type_code, ls_slipno, ls_DOC= "FINCASHSLIPNO"
integer	li_typeflag, li_lastseq_no, li_openday , li_banktracking
n_ds	lds_cashmas

lds_cashmas	=	 create	n_ds
lds_cashmas.dataobject = "d_start_day" 
lds_cashmas.settransobject( itr_sqlca )

if not isnull( as_openday_xml ) and trim( as_openday_xml ) <> "" then
	this.of_importstring_xml( lds_cashmas , as_openday_xml )
else
	destroy lds_cashmas
	ithw_exception.text	= "ไม่มีข้อมูลการเปิดวัน หรือ ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ls_coopid	= lds_cashmas.GetitemString( 1, "coop_id" )
ldtm_operatedate	= lds_cashmas.GetitemDateTime( 1, "operate_date" )

// is already open?
li_openday	= this.of_is_open_day( ls_coopid , ldtm_operatedate )
if ( li_openday > 0 ) then
	destroy lds_cashmas
	ithw_exception.text	= "ได้มีการเปิดงานประจำวันแล้ว ไม่สามารถทำการเปิดได้"
	throw ithw_exception
end if

// บันทึกรายการธนาคาร สร้างยอดยกมา
li_banktracking	= this.of_banktracking( ls_coopid , ldtm_operatedate )

ls_slipno		=this.of_get_lastslip_docno( ls_DOC )
//ls_slipno= inv_docservice.of_getnewdocno( ls_DOC ) 

if trim( ls_slipno ) = "" or isnull( ls_slipno ) then
	destroy lds_cashmas
	ithw_exception.text	= "ไม่สามารถสร้างเลขที่เอกสารได้"
	throw ithw_exception
end if

li_lastseq_no		= lds_cashmas.GetitemNumber( 1, "lastseq_no" )


ls_entry_id			= lds_cashmas.GetitemString( 1, "entry_id" )
ls_machineid		= lds_cashmas.GetitemString( 1, "machine_id" )
ls_approve			= ls_entry_id

ldc_itemamt		= lds_cashmas.GetitemDecimal( 1, "cash_amt" )
if isnull( ldc_itemamt ) then ldc_itemamt = 0


ldtm_entrydate		= lds_cashmas.GetitemDateTime( 1, "entry_date" )
ldc_cashbegin		= lds_cashmas.GetitemDecimal( 1, "cash_begin" )

if isnull( ldc_cashbegin ) then ldc_cashbegin = 0

ldc_cashsum_amt	= ldc_itemamt + ldc_cashbegin
ldc_cashin				= ldc_cashsum_amt
ldc_cashout			= 0
ls_type_code			= 'OPN'
ldc_balforward		= 0
li_typeflag				= 1

if li_lastseq_no = 0 then
	li_lastseq_no ++
end if
ls_item_desc	= "เปิดงานประจำวัน"

////lds_cashmas.accepttext( )
//
if lds_cashmas.update() <> 1 then	
	destroy lds_cashmas
	ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูลลง FINCASHFLOWMAS ได้ " + itr_sqlca.sqlerrtext 
	rollback using itr_sqlca;
	throw ithw_exception
end if

// เพิ่มข้อมูลลงรายการเคลื่อนไหว
INSERT INTO FINRQ_CASHFLOWSTAT
	(	OPERATE_DATE,			SEQ_NO,				FINSLIP_NO,
		ITEM_AMT,					BAL_FORWARD,		BALANCE_AMT,
		ENTRY_ID,					ENTRY_DATE,		APPROVE_DATE,
		APPROVE_ID,				ITEM_FLAG,			ITEM_TYPECODE,
		MACHINE_ID,					COOP_ID,	item_desc
	)  
VALUES
	(	:ldtm_operatedate,		:li_lastseq_no,		:ls_slipno,
		:ldc_cashsum_amt,			:ldc_balforward,		:ldc_cashsum_amt,
		:ls_entry_id,					:ldtm_entrydate,	:ldtm_entrydate,
		:ls_approve,					:li_typeflag,			:ls_type_code,
		:ls_machineid,				:ls_coopid,		:ls_item_desc
	)  
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then	
	destroy lds_cashmas
	ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูลลง FINRQ_CASHFLOWSTAT ได้ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

destroy lds_cashmas

commit using	itr_sqlca ;
return Success
end function

private function integer of_banktracking (string as_coop_id, datetime adtm_wdate) throws Exception;n_ds		lds_banklist
integer	li_row, li_index
string		ls_bankaccno, ls_bankcode, ls_branchcode
dec{2}	ldc_begin, ldc_end, ldc_incoming, ldc_outgoing
datetime	ldtm_date

lds_banklist	= create n_ds
lds_banklist.dataobject	= "d_fin_bankaccount_tracking"
lds_banklist.settransobject( itr_sqlca )

li_row				= lds_banklist.retrieve( as_coop_id )
ldtm_date		= adtm_wdate
ldc_end			= 0
ldc_incoming	= 0
ldc_outgoing	= 0
ldc_begin		= 0

for li_index = 1 to li_row
	
	ls_bankaccno		= lds_banklist.object.account_no[li_index]
	ls_bankcode			= lds_banklist.object.bank_code[li_index]
	ls_branchcode		= lds_banklist.object.bankbranch_code[li_index]
	ldc_begin			= lds_banklist.object.sco_balance[li_index]
	
	
	if isnull( ldc_begin ) then ldc_begin = 0
	
	INSERT INTO FINCLOSEBANKDAY  
	(	ACCOUNT_NO,						BANK_CODE,					BANKBRANCH_CODE,
   		COOP_ID,					CLOSE_DATE,					BALANCE_BEGIN,
		INCOMING_AMT,					OUTGOING_AMT,				BALANCE_END
	)  
	VALUES
	(	:ls_bankaccno,						:ls_bankcode,					:ls_branchcode,
		:as_coop_id,						:ldtm_date,						:ldc_begin,
		:ldc_incoming,						:ldc_outgoing,					:ldc_end
	)  using	itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูล รายการธนาคารได้~r~n" + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
next


return Success
end function

public function integer of_init_fincashcontrol (string as_coop_id, datetime adtm_wdate, string as_permis_id, ref string as_fincashctl_info) throws Exception;/***********************************************
<description>
	กำหนด XMLConfig ให้กับหน้าจอการควบคุมเงินสดประจำวัน สาขาสหกรณ์ที่ทำรายการ วันที่ทำรายการ ยอดเงินสดสหกรณ์คงเหลือ
</description>

<arguments>
  	as_coop_id		รหัสสาขาสหกรณ์
	adtm_wdate			วันที่ ที่ทำรายการ
	as_permis_id		รหัสผู้ใช้ ที่ทำรายการ
	as_fincashctl_info	ข้อมูลการควบคุมเงินสด , ส่งค่ากลับคืนในรูปแบบ XML
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_init_fincashcontrol()
	
	Integer li_return 
	String ls_coop_id , ls_permis_id , ls_fincashctl_info
	datetime	ldtm_wdate
	
	li_return = lnv_finservice.of_init_fincashcontrol( ls_coop_id , ldtm_wdate , ls_permis_id , ls_fincashctl_info  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/9/2010 by PhaiWaan

</usage>
************************************************/

dec{2}		ldc_balance

n_ds	lds_data

lds_data 		= create	n_ds
lds_data.dataobject	=	"d_controlcash"

lds_data.reset( )

lds_data.insertrow( 0 )

lds_data.object.operate_date[1] 	= adtm_wdate
lds_data.object.entry_date[1] 				= adtm_wdate
lds_data.object.entry_time[1] 				= datetime( date(adtm_wdate) , now())
lds_data.object.coop_id[1] 				= as_coop_id
lds_data.object.permis_id[1] 				= as_permis_id

SELECT	CASH_SUMAMT
INTO		:ldc_balance
FROM		FINCASHFLOWMAS
WHERE	( OPERATE_DATE		= :adtm_wdate ) and
			( coop_id		= :as_coop_id )
using		itr_sqlca	;

if itr_sqlca.sqlcode <> 0 then
	destroy lds_data
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลเงินสดในมือได้"
	throw ithw_exception
end if

if isnull( ldc_balance ) or ldc_balance < 0 then ldc_balance = 0

lds_data.object.cash_amt[1] 		= ldc_balance 

is_name			= ""
il_seq_no		= 0
ib_cansave		= true
is_mode			= 'new'
//cb_detail.enabled	= true
as_fincashctl_info		=	lds_data.describe( "Datawindow.data.XML" )

destroy lds_data

return		success
end function

private function integer of_is_close_day (string as_coop_id, string as_appname, datetime adtm_today) throws Exception;integer	li_closeday_status

//select	closeday_status
//into		:li_closeday_status
//from		amappstatus
//where	( application	= :as_appname ) and 
//			( coop_id		= :as_coop_id ) 
//using	itr_sqlca ; 

select	close_status
into		:li_closeday_status
from		fincashflowmas
where	( operate_date 	= :adtm_today ) and 
			( coop_id		= :as_coop_id ) 
using	itr_sqlca ; 

if isnull( li_closeday_status ) then li_closeday_status = 0

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบสถานะการปิดงานประจำวันได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return li_closeday_status
end function

public function integer of_retrievefinslipdet (string as_coopid, string as_slipno, ref string as_slipdet_xml) throws Exception;n_ds	lds_slipdet

lds_slipdet	= create n_ds
lds_slipdet.dataobject	= "d_fin_slipspc_other_det"
lds_slipdet.settransobject( itr_sqlca )
lds_slipdet.retrieve( as_coopid , as_slipno )

as_slipdet_xml	= ""
if lds_slipdet.rowcount( ) > 0 then
	as_slipdet_xml	= lds_slipdet.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_slipdet ) 

return success
end function

public function integer of_postcancelslip (string as_coopid, string as_entry_id, string as_head_xml, string as_cancle_xml) throws Exception;string		ls_slipno, ls_cashtype, ls_cancelid, ls_fnrecvno, ls_deptaccid
string		ls_docno, ls_year, ls_err, ls_coopid, ls_ref_system, ls_refslipno
datetime	ldtm_canceldate, ldtm_entry
dec{2}	ldc_amt
integer	li_rc, li_returnvalue, li_tax, li_paymentstatus, li_statuschk, li_slslipstatus
integer	li_payrecv, li_passslip
long		ll_row , ll_index , li_found

n_ds		lds_head , lds_data
str_slipinfo	lstr_slipinfo

lds_head	= create		n_ds
lds_head	.dataobject = "d_cancelslip_head"

if not isnull( as_head_xml ) and trim( as_head_xml ) <> "" then
	this.of_importstring_xml( lds_head , as_head_xml )
else
	destroy lds_head 
	
	ithw_exception.text	= "ไม่มีข้อมูลหลักการยกเิลิก slip ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

ldtm_canceldate	= lds_head.object.adtm_date[1]

lds_data	= create		n_ds
lds_data	.dataobject = "d_cancelslip_list"

if not isnull( as_cancle_xml ) and trim( as_cancle_xml ) <> "" then
	this.of_importstring_xml( lds_data , as_cancle_xml )
else
	destroy lds_data
	ithw_exception.text	= "ไม่มีข้อมูลการยกเลิก slip ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

li_returnvalue	= 1
ll_row		= lds_data.rowcount( )

li_found		= lds_data.find( "ai_select = 1 " , 1 , ll_row )

do while  (li_found > 0 )

			li_passslip			= 1
			ls_ref_system		= lds_data.object.ref_system[li_found]
			ls_refslipno			= lds_data.object.ref_slipno[li_found]
			li_payrecv			= lds_data.object.pay_recv_status[li_found]
			ls_cancelid			= as_entry_id
			ls_coopid			= as_coopid
			ls_slipno				= lds_data.object.slip_no[li_found]
			ls_cashtype			= lds_data.object.cash_type[li_found]
			ldc_amt				= lds_data.object.item_amtnet[li_found]
			li_tax					= lds_data.object.tax_flag[li_found]
			li_paymentstatus	= lds_data.object.payment_status[li_found]
			ls_deptaccid			= lds_data.object.from_accno[li_found]
			ldtm_entry			= lds_data.getitemdatetime( li_found, "entry_date" )
			
			// ทำการดึงข้อมูลจาก DB เพื่อตรวจดูว่าสถานะยังคงเดิมก่อนยกเลิก
			select	payment_status
			into		:li_statuschk
			from		finslip
			where		slip_no			= :ls_slipno and
						coop_id	= :ls_coopid
			using	itr_sqlca ;
						
			if itr_sqlca.sqlcode <> 0 then
				destroy lds_data
				destroy lds_head 
				ithw_exception.text	= "ไม่สามารถตรวจสอบสถานะรายการของข้อมูลเลขที่ " + ls_slipno + " ได้"
				rollback	using	itr_sqlca ;
				throw ithw_exception
			end if
			
			if ls_ref_system = 'SHL' and li_passslip =  8 then
				li_slslipstatus = 1
				select slip_status 
				into :li_slslipstatus
				from cmshrlonslip
				where slip_no = :ls_refslipno 
				using	itr_sqlca ;
				
				if isnull(li_slslipstatus) then li_slslipstatus = 1
				
//				if li_slslipstatus = 1 then
//					messagebox('ยกเลิกใบการเงิน','รายงานนี้เป็นรายการจากระบบหุ้นหนี้ ต้องไปยกเลิกชำระพิเศษที่ระบบหุ้นหนี้ครับ ',stopsign!)
					//return Failure
//				end if
				
			end if
			
//			if ls_ref_system = 'LON' and left(ls_refslipno,2) = 'RC'  then
//				li_slslipstatus = 1
			//	select loanreceive_status 
			//	into :li_slslipstatus
			//	from cmloanreceive
			//	where loanreceive_no = :ls_refslipno ;
			//	if isnull(li_slslipstatus) then li_slslipstatus = 1
			//	if li_slslipstatus = 1 then
			//		messagebox('ยกเลิกใบการเงิน','รายงานนี้เป็นรายการจากระบบหุ้นหนี้ ต้องไปยกเลิกการจ่ายเงินครับ ',stopsign!)
			//		return Failure
			//	end if
				
//			end if
			
//			if li_statuschk <> li_paymentstatus then
//				ithw_exception.text	= "ไม่สามารถทำการยกเลิกรายการเลขเอกสารที่ " + ls_slipno + " ได้ เนื่องจากสถานะก่อนทำรายการมีการเปลี่ยนแปลงค่าไปกก่อนหน้า"
//				rollback	using	itr_sqlca ;
//				throw ithw_exception
//			end if
			
			if isnull( li_tax ) then li_tax = 0
			
			// ทำการปรับปรุงการยกเลิกการเรียกเก็บภาษี
			update	finslip
			set		cancel_id		= :ls_cancelid,
					cancel_date		= :ldtm_canceldate,
					payment_status	= -9
			where		slip_no			= :ls_slipno and
						coop_id	= :ls_coopid
			using	itr_sqlca	;
			
			if itr_sqlca.sqlcode <> 0 then	
				destroy lds_data
				destroy lds_head 
				ithw_exception.text	= "ไม่สามารถทำการยกเลิกได้ " + itr_sqlca.sqlerrtext 
				rollback	using	itr_sqlca ;
				throw ithw_exception
			end if
			
			
			if li_tax = 1 then
				update	fintax
				set		cancel_flag		= 1
				where		slip_no			= :ls_slipno  and
							coop_id	= :ls_coopid
				using	itr_sqlca ;
				
				if itr_sqlca.sqlcode <> 0 then		
					destroy lds_data
					destroy lds_head 
					ithw_exception.text	= "ไม่สามารถทำการยกเลิกรายการภาษีได้" + itr_sqlca.sqlerrtext 
					rollback	using	itr_sqlca ;
					throw ithw_exception
				end if
			end if
			
			if ls_cashtype = "CSH" then
				li_rc	= this.of_processfinchk( ls_coopid , ls_cancelid , ldtm_canceldate, ls_err )
				if li_rc = Failure then		
					ithw_exception.text	= ls_err
					rollback	using	itr_sqlca ;
					throw ithw_exception
				end if
			end if
			
//			if ls_cashtype = "CHQ" then
//				messagebox( "สำคัญ","กรุณาทำการยกเลิกรายการเช็คด้วยครับ",Exclamation! )
//			end if
			
			// หากเป็นเงินสด และ ผ่านรายการไปก่อนหน้าแล้ว
			if ( ls_cashtype = "CSH" ) and ( li_paymentstatus = 1 )  then
					lstr_slipinfo.slip_no = ls_slipno
					lstr_slipinfo.coop_id = ls_coopid
					lstr_slipinfo.member_no = lds_data.object.member_no[ li_found ]
					lstr_slipinfo.description = lds_data.object.payment_desc[ li_found ]
					lstr_slipinfo.entry_date = ldtm_canceldate
					lstr_slipinfo.from_system = lds_data.object.from_system[ li_found ]
					lstr_slipinfo.item_amt = ldc_amt
					lstr_slipinfo.item_status = -9
					lstr_slipinfo.sign_flag =  li_payrecv
					lstr_slipinfo.recpaytype_code = lds_data.object.ITEMPAYTYPE_CODE[li_found]
					try
						this.of_postcash( lstr_slipinfo ,  li_found  , as_entry_id)
					catch ( Exception th )
						rollback using itr_sqlca ;
						throw ithw_exception
					end try
			end if
			
			if ( ls_cashtype = "TRN" )  and ( li_paymentstatus = 1 )   then
//					update dpdepttran 
//					set tran_status = -9
//					where tran_year = '1111'   
//					and deptaccount_no = :ls_deptaccid  
//					and tran_date = :ldtm_entry 
//					and ref_slipno =  :ls_slipno 
//					using	itr_sqlca	;
					
					if itr_sqlca.sqlcode <> 0 then
						destroy lds_data
						destroy lds_head 
						ithw_exception.text	= "ไม่สามารถยกเลิกรายการที่ระบบเงินฝากได้ เลขที่บัญชีเงินฝาก #"+ ls_deptaccid +"~r~n"+itr_sqlca.sqlerrtext
						rollback	using	itr_sqlca ;
						throw ithw_exception
				end if
			end if

	
	li_found++
	if li_found > ll_row then
		exit 
	end if
	
	li_found		= lds_data.find( "ai_select = 1 " , li_found , ll_row )
loop

destroy lds_data
destroy lds_head 
				
commit using	itr_sqlca ;
return Success
end function

private function integer of_postshrlonto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, ref string as_cancelslipno) throws Exception;/***********************************************
<description>
	ดึงข้อมูลจากระบบหุ้นหนี้ ที่เป็นรายการรับชำระพิเศษ
</description>

<arguments>	
	as_memberno			รหัสสมาชิก
	as_coopid				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการ
	adtm_wdate				วันที่ทำรายการ
	as_machine				ชื่อเครื่องที่ทำรายการ
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postshrlonto_fin()
	
	Integer li_return
	String ls_memberno , ls_branch , ls_entry , ls_machine
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postshrlonto_fin( ls_memberno , ls_branch , ls_entry , ldtm_wdate, ls_machine )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/10/2010 by Phaiwaan
	Version 1.1 แก้ดึงข้อมูลรายการที่ถูกยกเลิกต้นทางแล้ว Modified Date 6/11/2010 by Phaiwaan	
</usage>
************************************************/

integer	li_row, li_chk, li_itemstatus, li_itemstatus1, li_recev, li_update , li_index , li_found ,  li_index_i , li_rowmas
string	ls_fnrecvno, ls_docno, ls_year, ls_refslipno, ls_slipno, ls_receiptno, ls_stm_itemtype , ls_refsyst
string	ls_entryid, ls_fromsystem, ls_bankcode, ls_bankbranch, ls_memno, ls_nonmemberdetail , ls_loanno
string	ls_accid, ls_cashtype, ls_itemtypecode,  ls_chequeno, ls_paydesc, ls_accountno
string	ls_towhom,  ls_cancelid, ls_memname, ls_shrlontype, ls_slipitemtype , ls_accid_slipdet
datetime	ldtm_dateonchq, ldtm_canceldate, ldtm_entrydate, ldtm_opreatedate, ldtm_postdate
dec{2}	ldc_itemamt, ldc_bankfee, ldc_banksrv, ldc_sharespx , ldc_itemamtdet
dec{2}	ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_accuint, ldc_temp 
integer	li_member_flag, li_paymentstatus, li_payrec_status, li_chqadv, li_shlnuserecv, li_recvstatus , li_shrlonrecvsend_fin

str_slipinfo	lstr_slipinfo

// รับจ่ายเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่
li_recev	= integer( this.of_getattribconstant( "allpay_atfin" ,"INTEGER" ))
if isnull( li_recev ) then li_recev = 0

// ดึงข้อมูล หุ้นหนี้ รายการรับ เข้า ระบบการเงินหรือไม่ shrlonrecvsendfin
li_shrlonrecvsend_fin	= integer( this.of_getattribconstant( "shrlonrecvsendfin" , "INTEGER" ))
if isnull( li_shrlonrecvsend_fin ) then li_shrlonrecvsend_fin = 3


// การใช้เลขที่ใบเสร็จของหุ้นหนี้
li_shlnuserecv	= integer( this.of_getattribconstant( "shrlon_usefinreceipt" ,"INTEGER" ))
if isnull( li_shlnuserecv ) then li_shlnuserecv = 0

if li_shrlonrecvsend_fin = 2 then
	li_paymentstatus		= 8
	li_recvstatus			= 0
else
	// ต้องทำการตรวจสอบเงินสดด้วย
	li_paymentstatus		= 1
	li_recvstatus			= 1
end if

li_rowmas		= ads_data.rowcount()
as_cancelslipno		= ""


for li_index = 1 to li_rowmas
	
		
		
		li_payrec_status	= 1 //ads_data.object.sliptypesign_flag[li_index]
		ls_fromsystem		= 'SHL' 
		li_itemstatus		= ads_data.object.slip_status[li_index]
		
		// หากน้อยกว่า 0 คือ การจ่าย
		if li_payrec_status < 1 then
			li_payrec_status		= 0
		end if
		
		ls_refslipno			= ads_data.object.payinslip_no[li_index]

		if ( li_itemstatus = -9 ) or ( li_itemstatus = -99 ) then	
			
			// ตรวจสอบมีการทำรายการแล้วรึยัง
			li_found	=	ids_cancelslip.retrieve( as_coopid , ls_refslipno , ls_fromsystem  )
			
//			select count( * )
//			into 	:li_found
//			from finslip			
//			where ref_slipno = :ls_refslipno
//			and from_system  = 'SHL'
//			using itr_sqlca ;
//			
//			if isnull( li_found ) then li_found = 0
//			
			if li_found = 0 then  continue 
		
//			select	SLIP_NO, PAYMENT_STATUS
//			into		:ls_slipno, :li_itemstatus1
//			from	FINSLIP
//			where	ENTRY_DATE		= :ldtm_entrydate and
//					REF_SLIPNO		= :ls_refslipno and
//					coop_id	= :as_coopid 
//			using itr_sqlca ; 
//					
//			if itr_sqlca.sqlcode <> 0 then
//				ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
//				rollback using itr_sqlca ; 
//				throw ithw_exception
//			end if
			
				for	li_index_i = 1	to li_found
					if as_cancelslipno <> "" then as_cancelslipno += ","
					as_cancelslipno	 += ids_cancelslip.object.slip_no[ li_index_i ]
				next
				
//		// ถ้ารับจ่ายต้อง post เงินสดเลย
		if ( li_shrlonrecvsend_fin <> 2  )   then		
	
			ls_cancelid			= ads_data.object.cancel_id[ li_index ]
			ldtm_canceldate	= ads_data.object.cancel_date[ li_index ]
			ls_cashtype			= trim( ads_data.object.moneytype_code[ li_index ] ) 
			ldtm_canceldate	=	datetime( date(ldtm_canceldate ) ) 
			// ทำการปรับปรุงรายการยกเลิก
			update	FINSLIP
			set		PAYMENT_STATUS	= -9,
					cancel_id			= :ls_cancelid,
					cancel_date		= :ldtm_canceldate,
					receive_status		= 1,
					receive_date		= :ldtm_canceldate			
			where	REF_SLIPNO			= :ls_refslipno and
					coop_id	= :as_coopid  and
					PAYMENT_STATUS	in(1,8)
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
				rollback using itr_sqlca ; 
				throw ithw_exception
			end if
			
			// หากรับเงินที่หน้าเคาร์เตอร์เลย
			if ( ls_cashtype = 'CSH' ) then
				
				select		SLIP_NO , pay_recv_status , member_no , item_amtnet , payment_desc , itempaytype_code
				into		:ls_slipno , :li_recvstatus , :ls_memno , :ldc_itemamt, :ls_paydesc , :ls_itemtypecode
				from		FINSLIP
				where	REF_SLIPNO		= :ls_refslipno and
							coop_id	= :as_coopid and
							from_system	= :ls_fromsystem 

				using itr_sqlca ;
				
				if itr_sqlca.sqlcode <> 0 then
					ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถค้นหาข้อมูลการยกเลิกได้"+ itr_sqlca.sqlerrtext 
					rollback using itr_sqlca ; 
					throw ithw_exception
				end if
				
				// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
				lstr_slipinfo.slip_no 			= ls_slipno
				lstr_slipinfo.coop_id 		= as_coopid
				lstr_slipinfo.member_no 		= ls_memno
				lstr_slipinfo.description 		= ls_paydesc
				lstr_slipinfo.entry_date 		= ldtm_canceldate
				lstr_slipinfo.from_system 	= ls_fromsystem
				lstr_slipinfo.item_amt 		= ldc_itemamt
				lstr_slipinfo.item_status 		= -9
				lstr_slipinfo.sign_flag 			= li_recvstatus
				lstr_slipinfo.recpaytype_code = ls_itemtypecode
				try
					this.of_postcash( lstr_slipinfo  , 1 ,ls_cancelid )
				catch ( Exception th )
					rollback using itr_sqlca ;
					throw ithw_exception
				end try
		//		if ( ls_cashtype = 'CSH' ) then
		//			if this.of_postcash( ls_slipno, "FIN"  ) = Failure then return FAILURE
		//		end if
		//	else	
		//		if li_itemstatus1 = 1 then
		//			messagebox( 'ผิดพลาด', "การเงินได้ทำการ รับ/จ่าย ไปแล้ว ~r~n" &
		//				+ "ต้องแจ้งการยกเลิกที่ระบบการเงินก่อน จึงทำรายการยกเลิกใหม่ " +  itr_sqlca.sqlerrtext , StopSign! )
		//			rollback;
		//			return Failure
		//		end if
			end if
			commit using itr_sqlca ;
		end if 
			
//			return Success
			continue
		end if
		
		
		// ตรวจสอบมีการทำรายการแล้วรึยัง
		select count( * )
		into 	:li_found
		from finslip
		where ref_slipno = :ls_refslipno
		and	coop_id		= :as_coopid
		and	PAYMENT_STATUS <> -9
		and from_system  = 'SHL'
		using itr_sqlca ;
		
		if isnull( li_found ) then li_found = 0
		
		if li_found > 0 then  continue 
				
		
		ldc_itemamt			= ads_data.object.slip_amt[li_index]	
		ldtm_opreatedate	= ads_data.object.operate_date[li_index]
		ldtm_entrydate		= ads_data.object.slip_date[li_index]
		ls_entryid			= ads_data.object.entry_id[li_index]

		ls_bankcode			= ads_data.object.expense_bank[li_index]
		ls_bankbranch		= ads_data.object.expense_branch[li_index]
		ls_memno			= ads_data.object.member_no[li_index]
		ls_memname		= this.of_getmembername( ls_memno )
		ls_towhom			= trim( ls_memname )
		ls_cashtype			= ads_data.object.moneytype_code[li_index]
		ls_itemtypecode	= ads_data.object.sliptype_code[li_index]
		ls_accountno		= ads_data.object.expense_accid[li_index]
		ls_accid				= ads_data.object.tofrom_accid[li_index]
		ldc_banksrv			= 0.00 //ads_data.object.banksrv_amt[li_index]
		ldc_bankfee			= 0.00 //ads_data.object.bankfee_amt[li_index]
		ls_cancelid			= as_entry
		ldtm_canceldate	= adtm_wdate

		ls_receiptno			= ""
		ldtm_postdate		= inv_calendar_srv.of_getpostingdate( year( date( ldtm_opreatedate ) ), month( date( ldtm_opreatedate ) ) )

		if isnull( ldc_itemamt ) then	ldc_itemamt = 0
		
//		if ldc_itemamt < 1 then
//			ithw_exception.text	= "ระบบหุ้นหนี้ : ยอดทำรายการน้อยกว่าหรือเท่ากับ 0 ไม่สามารถทำรายการได้"
//			rollback using itr_sqlca ; 
//			throw ithw_exception
//		end if
		
		// สอบถามว่าเป็นการจ่าปันผลหรือเปล่า
		if ( ls_itemtypecode = 'YDI' ) then
			li_payrec_status	= 0
		end if
		
		ls_fnrecvno		= this.of_get_lastslip_docno( "FNRECEIVENO" )
		
		this.of_getshrlon( as_coopid   ,ls_memno  ,ldc_accuint ,  ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx )
		
		//ทำการหาข้อมูลเพิ่มเติมเกี่ยวกับ ดอกเบี้ยสะสม และ ทุนเรือนหุ้น
		// ดอกเบี้ยสะสม
		ldc_temp	= 0
		select	sum( interest_payamt )
		into		:ldc_temp
		from	slslippayindet
		where	payinslip_no			= :ls_refslipno and
				coop_id					= :as_coopid	and
				slipitemtype_code	= 'LON' 
		using itr_sqlca ;
					
		if isnull( ldc_temp ) or ldc_temp < 0 then ldc_temp = 0
		ldc_accuint		= ldc_accuint + ldc_temp
		
		//ทุนเรือนหุ้น
		ldc_temp				= 0
		ls_stm_itemtype	= ""
		
		select	item_payamt, stm_itemtype
		into		:ldc_temp, :ls_stm_itemtype
		from	slslippayindet
		where	payinslip_no				= :ls_refslipno and
				coop_id					= :as_coopid	and
				slipitemtype_code	= 'SHR' 
		using itr_sqlca ;
					
		if isnull( ldc_temp ) or ldc_temp < 0 then ldc_temp = 0
		if isnull( ldc_temp )  then ls_stm_itemtype = ""
		
		ldc_share	= ldc_share + ldc_temp
		
		// หุ้นพิเศษ
		if ls_stm_itemtype = "SPX" or  ls_stm_itemtype = "SPD" then
			ldc_sharespx	= ldc_sharespx + ldc_temp
		end if
		
		// คำอธิบาย
		if ( ls_stm_itemtype = 'SPD'  ) or ( ls_stm_itemtype = 'LPD' ) then
			ls_paydesc	= " โอนซื้อหุ้น/ชำระหนี้ " + ls_memno
		else
			ls_paydesc	= "ซื้อหุ้น/ชำระหนี้ " + ls_memno //ads_data.object.slipitem_desc[li_index] + " " + ls_memno
		end if
		
//		// หากเป็นรายการเช็คและเป็นรายการรับ
//		if ( ls_cashtype = "CHQ" ) and ( li_payrec_status = 1  ) then ls_cashtype = "CBT"
		
		if ls_cashtype = 'TRN' or ls_cashtype = 'TBK' or ls_cashtype = "CBT" then
//			li_paymentstatus	= 1
			li_recvstatus			= 1
			if ( ( ls_itemtypecode <> 'YDI' ) or ( ( ls_itemtypecode = 'YDI' ) and ( ( ls_stm_itemtype = "SPD" ) or ( ls_itemtypecode = 'LPD' )  ) )  ) or  &
						( ( date( ldtm_postdate ) <> date( ldtm_entrydate ) ) and ( ls_itemtypecode = "PMF" ) ) then
				
				if ( li_shlnuserecv = 1 ) then
					ls_receiptno		= this.of_get_lastslip_docno( "FNRECEIPTNO" )
				else
					ls_receiptno	= ads_data.object.document_no[li_index]
				end if
				
				li_payrec_status	= 1
		
				// by Phai ยังไม่รุว่าใช้ทำอะรัย
		//		// กรณีที่สร้างเลขที่ใบเสร็จต้องทำการปรับปรุงที่รายการเคลื่อนไหวของรายการที่เกี่ยวข้องได้
		//		// หนี้ , หุ้น
		//		for li_update = 1 to ads_data.rowcount()
		//			string	ls_loancontract_no, ls_slipitemtype_code, ls_lncoop_id, ls_REF_DOCNO
		//			string	ls_shrlontype_code
		//			integer	li_operate_flag
		//			
		//			ls_slipitemtype_code	= ads_data.object.slipitemtype_code[li_update]
		//			ls_loancontract_no	= ads_data.object.loancontract_no[li_update]
		//			li_operate_flag		= ads_data.object.operate_flag[li_update]
		//			ls_lncoop_id			= ads_data.object.lncoop_id[li_update]
		//			ls_REF_DOCNO			= ads_data.object.document_no[li_update]
		//			ls_shrlontype_code	= ads_data.object.shrlontype_code[li_update]
		//			
		//			if isnull( ls_REF_DOCNO ) then ls_REF_DOCNO = ""
		//			if isnull( ls_lncoop_id ) then ls_lncoop_id = as_coopid
		//			if isnull( li_operate_flag ) then li_operate_flag = 0
		//			if isnull( ls_loancontract_no ) then ls_loancontract_no = ""
		//			if isnull( ls_slipitemtype_code ) then ls_slipitemtype_code = ""
		//			
		//			if ( li_operate_flag = 1 ) and ( li_shlnuserecv = 1 ) then
		//				choose case ls_slipitemtype_code
		//					case "SHR"
		////						UPDATE	SHSHARESTATEMENT  
		////						SET		REF_DOCNO			= :ls_receiptno
		////						WHERE	( MEMBER_NO			= :ls_memno ) AND  
		////									( SHARETYPE_CODE	= :ls_shrlontype_code ) AND  
		////									( coop_id			= :ls_mbbranch ) AND  
		////									( REF_DOCNO			= :ls_REF_DOCNO ) ;
		////									
		////						if itr_sqlca.sqlcode <> 0 then
		////							messagebox( "ผิดพลาด", "ไม่สามารถบันทึกข้อมูลลง UPDATE	SHSHARESTATEMENT   ได้ " + itr_sqlca.sqlerrtext, StopSign! )
		////							rollback;
		////							return Failure
		////						end if
		//
		//					case "LON"
		////						UPDATE	LNCONTSTATEMENT  
		////						SET		REF_DOCNO			= :ls_receiptno
		////						WHERE	( LOANCONTRACT_NO	= :ls_loancontract_no ) AND  
		////									( coop_id			= :ls_lncoop_id ) AND  
		////									( REF_DOCNO			= :ls_REF_DOCNO )  ;
		////
		////						if itr_sqlca.sqlcode <> 0 then
		////							messagebox( "ผิดพลาด", "ไม่สามารถบันทึกข้อมูลลง UPDATE	LNCONTSTATEMENT   ได้ " + itr_sqlca.sqlerrtext, StopSign! )
		////							rollback;
		////							return Failure
		////						end if
		//						
		//					case else
		//						
		//				end choose
		//			end if			
		//			
		//		next
				
			end if
		end if
		
		// บันทึกลง slip หลัก
		INSERT INTO	FINSLIP
		(	SLIP_NO,				ENTRY_ID,				ENTRY_DATE,				OPERATE_DATE,
			FROM_SYSTEM,		PAYMENT_STATUS,		CASH_TYPE,				PAYMENT_DESC,
			BANK_CODE,			BANK_BRANCH,			ITEMPAY_AMT,			PAY_TOWHOM,
			DATEON_CHQ,			MEMBER_NO,				ITEMPAYTYPE_CODE,		PAY_RECV_STATUS,
			MEMBER_FLAG,		NONMEMBER_DETAIL,		coop_id,			MACHINE_ID,
			CANCEL_ID,			CANCEL_DATE,			BANKFEE_AMT,			BANKSRV_AMT,
			TOFROM_ACCID,		ACCOUNT_NO,				CHEQUEBOOK_NO,			CHQ_ADVFLAG,
			ref_slipno,			remark,					SHARE_AMT,				emer_amt,
			norm_amt,			extra_amt,				sharespx_amt,			tax_flag,
			tax_amt,				tax_rate,				item_amtnet,			ref_system,
			receive_date,		receive_status,		accuint_amt,			FROM_BANKCODE,
			FROM_BRANCHCODE,		retail_flag,		receipt_no,			recvpay_id ,
			vat_amt					,	print_status
		)  
		VALUES
		(	:ls_fnrecvno,		:ls_entryid,			:ldtm_entrydate,		:ldtm_opreatedate,   
			:ls_fromsystem,	:li_paymentstatus,	:ls_cashtype,			:ls_paydesc,
			:ls_bankcode,		:ls_bankbranch,		:ldc_itemamt,			:ls_towhom,   
			null,					:ls_memno,				:ls_itemtypecode,		:li_payrec_status,   
			1,						:ls_memname,			:as_coopid,		:as_machine,   
			:ls_cancelid,		:ldtm_canceldate,		:ldc_bankfee,			:ldc_banksrv,   
			:ls_accid,			:ls_accountno,			null,						null,
			:ls_refslipno,		null,						:ldc_share,				:ldc_emer,
			:ldc_norm,			:ldc_extra,				:ldc_sharespx,			0,
			0,						0,							:ldc_itemamt,			:ls_fromsystem,
			:ldtm_entrydate,	:li_recvstatus,			:ldc_accuint,			:ls_bankcode,
			:ls_bankbranch,	0,							:ls_receiptno,			:ls_entryid ,
			0	,					1
		) using itr_sqlca ; 
		
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถบันทึกข้อมูลลง Finslip ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		li_row = ids_payinslipdet.retrieve( as_coopid,  ls_refslipno )
		
		for li_index_i = 1 to li_row
		
			ls_refsyst			= trim( ids_payinslipdet.object.slipitemtype_code[li_index_i] )
			ls_shrlontype		= trim( ids_payinslipdet.object.shrlontype_code[li_index_i] )
			ldc_itemamtdet		= ids_payinslipdet.object.item_payamt[li_index_i]
			ls_paydesc			= trim( ids_payinslipdet.object.slipitem_desc[li_index_i] )
			ls_loanno			= trim( ids_payinslipdet.object.loancontract_no[li_index_i] )
			
			
			if ls_refsyst = 'LON' then
				ls_paydesc	= ls_paydesc + " " + ls_loanno
			else
				ls_paydesc	= ls_paydesc + " " + ls_memno
			end if
			
		// หาคู่บัญชี ของหุ้น หนี้ ----------------------
			select account_id 
			into 	:ls_accid_slipdet
			from vcmapaccid
			where  system_code = 'LON'
			and slipitemtype_code = :ls_refsyst
			and	coop_id					= :as_coopid	
			and shrlontype_code = :ls_shrlontype
			and shrlontype_status = 1
			using itr_sqlca ;
			
			if isnull( ls_accid_slipdet ) or ls_accid_slipdet = ''  then ls_accid_slipdet = "00000000"
		//----------------------------------------------------
			
		INSERT INTO FINSLIPDET  
			( 	SLIP_NO,              		coop_id,              		SEQ_NO,              		SLIPITEMTYPE_CODE,              	SLIPITEM_DESC,   
				SLIPITEM_STATUS,		CANCEL_ID,							CANCEL_DATE,				POSTTOVC_FLAG,						VOUCHER_NO,   
				CANCELTOVC_FLAG,		CANCELVC_NO,						DISPLAYONLY_STATUS,	ITEMPAY_AMT,							ACCOUNT_ID,   
				ITEMPAYAMT_NET,		TAX_FLAG,							VAT_FLAG,					TAX_CODE,								TAXWAY_KEEP,   
				TAX_AMT,					SECTION_ID,						MEMBGROUP_CODE,		OPERATE_FLAG
			)  
		VALUES
			(	:ls_fnrecvno ,				:as_coopid , 						:li_index_i , 					:ls_accid_slipdet , 									:ls_paydesc ,
				1 , 							null ,									null ,							0 ,											null , 		
				0	,							null ,									0 ,								:ldc_itemamtdet , 							:ls_accid_slipdet ,
				:ldc_itemamtdet , 			0 , 									0	,							0 ,											0 ,
				0 ,								0	,									null ,							1 
			) using itr_sqlca ;
			
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if

	next
	


//// หากรับเงินที่หน้าเคาร์เตอร์เลย
//if ( li_recev = 0 ) and ( ls_cashtype = 'CSH' ) then
//	if this.of_postcash( ls_fnrecvno , "FIN"  ) = Failure then return FAILURE
//end if

if (ls_cashtype = "CSH" ) and (  li_shrlonrecvsend_fin <> 2 ) then
		
		// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
		lstr_slipinfo.slip_no 			= ls_refslipno
		lstr_slipinfo.coop_id 		= as_coopid
		lstr_slipinfo.member_no 		= ls_memno
		lstr_slipinfo.description 		= ls_paydesc
		lstr_slipinfo.entry_date 		= ldtm_entrydate
		lstr_slipinfo.from_system 	= ls_fromsystem
		lstr_slipinfo.item_amt 		= ldc_itemamt
		lstr_slipinfo.item_status 		= 1
		lstr_slipinfo.sign_flag 			= li_payrec_status
		lstr_slipinfo.recpaytype_code = ls_itemtypecode
		
		try
			this.of_postcash( lstr_slipinfo  , 1 ,ls_entryid )
		catch ( Exception thw )
			rollback using itr_sqlca ;
			throw ithw_exception
		end try
end if

	// Update สถานะการผ่านรายการมาการเงิน
	update slslippayin
	set		post_tofin = 1
	where payinslip_no = :ls_refslipno	and
		coop_id		= :as_coopid
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบชำระหุ้นหนี้ : ไม่สามารถ Update สถานะผ่านรายการมาการเงิน ได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
next 

commit using itr_sqlca ;
return Success
end function

private function integer of_postshrswdto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, ref string as_cancelslipno) throws Exception;/***********************************************
<description>
	ดึงข้อมูลจากระบบหุ้น ที่เป็นรายการจ่ายคืนค่าหุ้น
</description>

<arguments>	
	as_memberno			รหัสสมาชิก
	as_coopid				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการ
	adtm_wdate				วันที่ทำรายการ
	as_machine				ชื่อเครื่องที่ทำรายการ
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postshrswdto_fin()
	
	Integer li_return
	String ls_memberno , ls_branch , ls_entry , ls_machine
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postshrswdto_fin( ls_memberno , ls_branch , ls_entry , ldtm_wdate, ls_machine )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/10/2010 by Phaiwaan
	Version 1.1 เพิ่มกรณีมีการหักกลบ Modified Date 20/10/2010 by Phaiwaan
	Version 1.2 แก้ให้สร้างเลขที่ใบเสร็จ/ใบสำคัญจ่าย Modified Date 27/10/2010 by Phaiwaan
	Version 1.3 แก้ดึงข้อมูลรายการที่ถูกยกเลิกต้นทางแล้ว Modified Date 6/11/2010 by Phaiwaan
</usage>
************************************************/
integer		li_row, li_payrec_status, li_paymentstatus, li_chk, li_itemstatus, li_status , li_index , li_seq_no	, li_index_i , li_shrlonpaysendfin
integer		li_itemstatus1, li_recev, li_shlnuserecv, li_recvstatus , li_printstatus , li_found
string		ls_cashtype, ls_slipno, ls_docno, ls_year,  ls_remark, ls_mbcoop_id
dec{2}		ldc_recvnet, ldc_sharespx,ldc_accuint , ldc_itempay_amt, ldc_itempay_amtnet
dec{2}		ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sumclr , ldc_payout_amt
dec{2}		ldc_bankfee_amt, ldc_banksrv_amt, ldc_loanapprove_amt, ldc_buyshare_amt
string		ls_tofrom_accid, ls_loancontract_no, ls_member_no, ls_expense_accid, ls_expense_branch
string		ls_expense_bank, ls_entry_id, ls_payoutslip_no, ls_fromsystem , ls_shrlontype_code , ls_cancelid , ls_itemtypecode
string		ls_memname, ls_towhom, ls_desc, ls_printslip[], ls_receiptno , ls_accid_slipdet , ls_slipclr , ls_refsyst
datetime		ldtm_entry_date, ldtm_operdate , ldtm_canceldate

str_slipinfo	lstr_slipinfo

li_row	= ads_data.rowcount( )

// รับจ่ยเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่
li_recev			= integer( this.of_getattribconstant( "allpay_atfin" ,"INTEGER" ))
if isnull( li_recev ) then li_recev = 0

// ผ่านรายการไปการเงิน
li_shlnuserecv	= integer( this.of_getattribconstant( "shrlon_usefinreceipt" ,"INTEGER"))
if isnull( li_shlnuserecv ) then li_shlnuserecv = 0

// สถานะผ่าน รายการที่การเงิน 
// 1 ผ่านรายการทันที 
// 2 รอยืนยันรายการ
// 3 ประมวลผ่านการเงิน
li_shrlonpaysendfin	= integer( this.of_getattribconstant( "shrlonpaysendfin" , "INTEGER" ))
if isnull( li_shrlonpaysendfin ) then li_shrlonpaysendfin = 2

li_recvstatus		= 0 
if li_shrlonpaysendfin = 2 then
	li_paymentstatus		= 8
	li_recvstatus			= 0
else
	li_printstatus = 1
	li_paymentstatus		= 1
end if

ldc_itempay_amt		= 0
ldc_itempay_amtnet 	= 0
li_seq_no = 0
as_cancelslipno		= ""
for li_index = 1 to li_row
	
		ls_receiptno		= ""
		li_payrec_status	= 0 // pay
		
		ls_shrlontype_code	= ads_data.object.shrlontype_code[1]
		ldc_recvnet				= 0.00 //ads_data.object.payoutnet_amt[li_index]
		ls_mbcoop_id		= ads_data.object.coop_id[li_index]
		ls_cashtype				= ads_data.object.moneytype_code[li_index]
		ldc_bankfee_amt		= 0.00 //ads_data.object.bankfee_amt[li_index]
		ldc_banksrv_amt		= 0.00 //ads_data.object.banksrv_amt[li_index]
		ls_tofrom_accid		= ads_data.object.tofrom_accid[li_index]
		if isnull( ls_tofrom_accid ) then ls_tofrom_accid = ""
		
		if ls_tofrom_accid = "" then
			ls_tofrom_accid		= this.of_defaultaccid( ls_cashtype ) 
		end if
		ls_member_no			= ads_data.object.member_no[li_index]
		ls_memname			= this.of_getmembername( ls_member_no )
		ls_towhom				= trim( ls_memname )
		ls_expense_accid		= ads_data.object.expense_accid[li_index]
		ls_expense_branch	= ads_data.object.expense_branch[li_index]
		ls_expense_bank		= ads_data.object.expense_bank[li_index]
		ldc_payout_amt		= ads_data.object.payout_amt[li_index]
		ldtm_entry_date		= adtm_wdate
		ls_entry_id				= ads_data.object.entry_id[li_index]
		ls_payoutslip_no		= ads_data.object.payoutslip_no[li_index]
		ldtm_operdate			= ads_data.object.entry_date[li_index]
		ls_fromsystem			= 'SHR'
		ldc_sumclr				= 0.00 //ads_data.object.payoutclr_amt[li_index] //dec( ads_data.describe( "evaluate( 'clearprin_amt + clearint_amt', 1 )" ) )
		li_itemstatus			= ads_data.object.slip_status[li_index]
		ls_desc					= 'จ่ายคืนเงินค่าหุ้นสมาชิกเลขที่ ' + ls_member_no + " ชื่อ " + ls_memname
		ls_slipclr					= trim( ads_data.object.slipclear_no[li_index] )

		if li_itemstatus = -9 or li_itemstatus = -99 then
			// ตรวจสอบมีการทำรายการแล้วรึยัง
			li_found	=	ids_cancelslip.retrieve( as_coopid,ls_payoutslip_no , ls_fromsystem )
			
		
			if li_found = 0 then  continue 
			
//			string	ls_cancelid
//			datetime	ldtm_canceldate
//			
//			select	SLIP_NO, PAYMENT_STATUS
//			into		:ls_slipno, :li_itemstatus1
//			from		FINSLIP
//			where		ENTRY_DATE		= :ldtm_entry_date and
//						REF_SLIPNO		= :ls_payoutslip_no  and
//						coopcoop_id	= :as_coopid
//			using itr_sqlca ;
//					
//			if itr_sqlca.sqlcode <> 0 then
//				ithw_exception.text	= "จ่ายคืนค่าหุ้น : ไม่สามารถยกเลิกที่ระบบการเงินได้ "+ itr_sqlca.sqlerrtext 
//				rollback using itr_sqlca ; 
//				throw ithw_exception
//			end if
//			
//			// หากเป็นการรับเงินที่ หน้าเคาร์เตอร์เลย
//			if li_recev = 0 then
//				update	FINSLIP
//				set		PAYMENT_STATUS	= -9
//				where		SLIP_NO			= :ls_slipno and
//							COOPcoop_id	= :as_coopid and
//							REF_SLIPNO		= :ls_payoutslip_no 
//				using itr_sqlca ;
//				
//				if itr_sqlca.sqlcode <> 0 then
//					ithw_exception.text	= "จ่ายคืนค่าหุ้น : ไม่สามารถยกเลิกที่ระบบการเงินได้ "+ itr_sqlca.sqlerrtext 
//					rollback using itr_sqlca ; 
//					throw ithw_exception
//				end if
				

//			else
//				if li_itemstatus1 = 1 then
//					messagebox( 'ผิดพลาด', "การเงินได้ทำการ รับ/จ่าย ไปแล้ว ~r~n" &
//						+ "ต้องแจ้งการยกเลิกที่ระบบการเงินก่อน จึงทำรายการยกเลิกใหม่ " +  itr_sqlca.sqlerrtext , StopSign! )
//					rollback;
//					return -1
//				end if
//			end if
			
//			for	li_index_i = 1	to li_found
//				if as_cancelslipno <> "" then as_cancelslipno += ","
//				as_cancelslipno		+= ids_cancelslip.object.slip_no[ li_index_i ]
//			next
			
	if ( li_shrlonpaysendfin <> 2 ) then			
			ls_cancelid			= ads_data.object.cancel_id[li_index]
			ldtm_canceldate	= ads_data.object.cancel_date[li_index]
			ls_cashtype			= trim( ads_data.object.moneytype_code[ li_index ] ) 
			ldtm_canceldate	=	datetime( date(ldtm_canceldate ) ) 
			
			update 	FINSLIP
			set		PAYMENT_STATUS		= -9,
						cancel_id			= :ls_cancelid,
						cancel_date			= :ldtm_canceldate,
						receive_status		= 1,
						receive_date		= :ldtm_canceldate	
			where	coop_id		= :as_coopid and
						REF_SLIPNO			= :ls_payoutslip_no and
						PAYMENT_STATUS in ( 1, 8)
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "จ่ายคืนค่าหุ้น : ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
				rollback using itr_sqlca ; 
				throw ithw_exception
//			else
//				
//				commit using itr_sqlca ;
//				return success
			end if
			
			if ( ls_cashtype = 'CSH' )   then
				
					select		SLIP_NO , pay_recv_status , member_no , item_amtnet , payment_desc , itempaytype_code
					into		:ls_slipno , :li_recvstatus , :ls_member_no , :ldc_payout_amt, :ls_desc , :ls_itemtypecode
					from		FINSLIP
					where	REF_SLIPNO		= :ls_payoutslip_no and
								coop_id	= :as_coopid and
								from_system	= :ls_fromsystem  
					using itr_sqlca ;
					
					if itr_sqlca.sqlcode <> 0 then
						ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถค้นหาข้อมูลการยกเลิกได้"+ itr_sqlca.sqlerrtext 
						rollback using itr_sqlca ; 
						throw ithw_exception
					end if
					
					// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
					lstr_slipinfo.slip_no 			= ls_slipno
					lstr_slipinfo.coop_id 		= as_coopid
					lstr_slipinfo.member_no 		= ls_member_no
					lstr_slipinfo.description 		= ls_desc
					lstr_slipinfo.entry_date 		= ldtm_canceldate
					lstr_slipinfo.from_system 	= ls_fromsystem
					lstr_slipinfo.item_amt 		= ldc_payout_amt
					lstr_slipinfo.item_status 		= -9
					lstr_slipinfo.sign_flag 			= li_recvstatus
					lstr_slipinfo.recpaytype_code = ls_itemtypecode
					try
						this.of_postcash( lstr_slipinfo  , 1 ,ls_cancelid )
					catch ( Exception th )
						rollback using itr_sqlca ;
						throw ithw_exception
					end try
			end if
		end if		
			commit using itr_sqlca ;
			continue
		
	end if	
		
		// ตรวจสอบมีการทำรายการแล้วรึยัง
		select count( * )
		into 	:li_found
		from finslip
		where ref_slipno = :ls_payoutslip_no
		and	coop_id		= :as_coopid
		and	PAYMENT_STATUS <> -9
		and from_system  = 'SHR'
		using itr_sqlca ;
		
		if isnull( li_found ) then li_found = 0
		
		if li_found > 0 then  continue 
	
		
		// สร้างเลขที่เอกสาร
		ls_slipno			= this.of_get_lastslip_docno( "FNRECEIVENO" )
		
		if ls_cashtype = 'CHQ' then
			li_paymentstatus	= 8
		end if
		
		ls_remark			= 'จ่ายเงินถอนหุ้น '
		ls_remark			= "~rNo. " + ls_member_no
		if isnull( li_itemstatus ) then li_itemstatus = 1
		
		ldc_recvnet		= ldc_payout_amt
//		ls_receiptno	= ads_data.object.slipclear_no[li_index]
		if isnull( ls_slipclr )  then ls_slipclr = ""
		if ls_slipclr <>  "" then
			
			li_chk = ids_payclr.retrieve( ls_slipclr ,as_coopid  )
			
			if li_chk < 1 then continue
			
			ldc_itempay_amt	= dec( ids_payclr.describe( "Evaluate(' sum( item_payamt for all ) ' , 0 ) " ) ) 
				
			ldc_recvnet		= ldc_payout_amt  - ldc_itempay_amt 

			
		end if
		if ( ldc_sumclr ) > 0 then
			if li_shlnuserecv = 1 then
				ls_receiptno			=  this.of_get_lastslip_docno( "FNRECEIPTNO" )
			else
				ls_receiptno	= ads_data.object.slipclear_no[li_index]
			end if
		end if
		
		
		this.of_getshrlon( as_coopid   ,ls_member_no  ,ldc_accuint ,  ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx )
		
		if isnull( ldc_buyshare_amt ) then ldc_buyshare_amt = 0
		
		INSERT INTO FINSLIP  
		(		SLIP_NO,					ENTRY_ID,				ENTRY_DATE,				OPERATE_DATE,   
				FROM_SYSTEM,		PAYMENT_STATUS,	CASH_TYPE,				PAYMENT_DESC,   
				BANK_CODE,			BANK_BRANCH,			ITEMPAY_AMT,				PAY_TOWHOM,   
				DATEON_CHQ,			MEMBER_NO,			ITEMPAYTYPE_CODE,		PAY_RECV_STATUS,   
				MEMBER_FLAG,			NONMEMBER_DETAIL,coop_id,			MACHINE_ID,   
				CANCEL_ID,				CANCEL_DATE,			BANKFEE_AMT,				BANKSRV_AMT,
				TOFROM_ACCID,		ACCOUNT_NO,			CHEQUEBOOK_NO,			CHQ_ADVFLAG,
				REF_SLIPNO,			REF_SYSTEM,			FROM_ACCNO,				RECEIPT_NO,
				REMARK,					FROM_BANKCODE,		FROM_BRANCHCODE,		SHARE_AMT,
				emer_amt,				norm_amt,				extra_amt,					sharespx_amt,
				tax_amt,					tax_flag,					tax_rate,						item_amtnet,
				receive_date,			receive_status,			accuint_amt,				retail_flag,
				recvpay_id			,	print_status
		)  
		VALUES
		( 		:ls_slipno,   				:ls_entry_id,				:ldtm_entry_date,			:ldtm_operdate,
				:ls_fromsystem,		:li_paymentstatus,		:ls_cashtype,				:ls_desc,
				:ls_expense_bank,		:ls_expense_branch,	:ldc_recvnet,				:ls_towhom,
				null,   					:ls_member_no,		'SWD',						:li_payrec_status,
				1,							:ls_memname,			:as_coopid,		:as_machine,   
				null,						null,						:ldc_bankfee_amt,			:ldc_banksrv_amt,
				:ls_tofrom_accid,		null,						null,							null,
				:ls_payoutslip_no,	:ls_fromsystem,		null,							:ls_receiptno,   
				:ls_remark,				:ls_expense_bank,		null,							:ldc_share,
				:ldc_emer,				:ldc_norm,				:ldc_extra,					:ldc_sharespx,
				0,							0,							0,								:ldc_recvnet,
				:ldtm_entry_date,		:li_recvstatus,			:ldc_accuint,				0,
				:ls_entry_id		,		:li_printstatus 
		)  using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "จ่ายคืนค่าหุ้น : ไม่สามารถบันทึกข้อมูลลง Finslip ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
			
		li_seq_no++
		// หาคู่บัญชี ของหุ้น ----------------------
		select account_id 
		into 	:ls_accid_slipdet
		from vcmapaccid
		where  system_code = 'LON'
		and coop_id		= :is_coopcontrl
		and slipitemtype_code = 'SHR'
		and shrlontype_code = :ls_shrlontype_code
		and shrlontype_status = 1
		using itr_sqlca ;
		
		if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ""
		//----------------------------------------------------
		
		INSERT INTO FINSLIPDET  
		( 	SLIP_NO,              		coop_id,              					SEQ_NO,              		SLIPITEMTYPE_CODE,              	SLIPITEM_DESC,   
			SLIPITEM_STATUS,		CANCEL_ID,							CANCEL_DATE,				POSTTOVC_FLAG,						VOUCHER_NO,   
			CANCELTOVC_FLAG,		CANCELVC_NO,						DISPLAYONLY_STATUS,	ITEMPAY_AMT,							ACCOUNT_ID,   
			ITEMPAYAMT_NET,		TAX_FLAG,							VAT_FLAG,					TAX_CODE,								TAXWAY_KEEP,   
			TAX_AMT,					SECTION_ID,						MEMBGROUP_CODE,		OPERATE_FLAG
		)  
		VALUES
		(	:ls_slipno ,					:as_coopid , 						:li_seq_no , 					:ls_accid_slipdet , 									:ls_desc ,
			1 , 							null ,									null ,							0 ,											null , 		
			0	,							null ,									0 ,								:ldc_recvnet , 							:ls_accid_slipdet ,
			:ldc_recvnet , 				0 , 									0	,							0 ,											0 ,
			0 ,								0	,									null ,							1 
		) using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหุ้น : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		// หากมีการหักกลบสัญญาเดิม
		li_chk = ids_payclr.rowcount( )
		if li_chk > 0 then 
			this.of_postpayoutto_finclr( ls_slipno , as_coopid , ids_payclr , li_seq_no)
		end if
		
		// หากเป็นการรับเงินที่ หน้าเคาร์เตอร์เลย
		if ( li_shrlonpaysendfin <> 2  ) and ( ls_cashtype = 'CSH' ) then
			
					// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
					lstr_slipinfo.slip_no 			= ls_payoutslip_no
					lstr_slipinfo.coop_id 		= as_coopid
					lstr_slipinfo.member_no 		= ls_member_no
					lstr_slipinfo.description 		= ls_desc
					lstr_slipinfo.entry_date 		= ldtm_entry_date
					lstr_slipinfo.from_system 	= ls_fromsystem
					lstr_slipinfo.item_amt 		= ldc_recvnet
					lstr_slipinfo.item_status 		= 1
					lstr_slipinfo.sign_flag 			= li_recvstatus
					lstr_slipinfo.recpaytype_code = ls_itemtypecode
					try
						this.of_postcash( lstr_slipinfo  , 1 ,ls_entry_id )
					catch ( Exception thw )
						rollback using itr_sqlca ;
						throw ithw_exception
					end try
		end if
		
	// Update สถานะการผ่านรายการมาการเงิน
	update slslippayout
	set		post_tofin = 1
	where payoutslip_no = :ls_payoutslip_no	and
		coop_id		= :as_coopid
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบเงินถอนหุ้น : ไม่สามารถ Update สถานะผ่านรายการมาการเงิน ได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
next

commit using itr_sqlca ;
return success
end function

private function integer of_postdeptto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, ref string as_cancelslipno) throws Exception;/***********************************************
<description>
	ดึงข้อมูลจากระบบเงินฝาก รายการฝาก / ถอน /ปิดบัญชี่/เปิดบัญชี บันทึกผ่านระบบการเงิน
</description>

<arguments>	
	as_memberno			รหัสสมาชิก
	as_coopid				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการ
	adtm_wdate				วันที่ทำรายการ
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postdeptto_fin()
	
	Integer li_return
	String ls_memberno , ls_branch , ls_entry 
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postdeptto_fin( ls_memberno , ls_branch , ls_entry , ldtm_wdate )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 14/10/2010 by Phaiwaan
	Version 1.1 แก้ดึงข้อมูลรายการที่ถูกยกเลิกต้นทางแล้ว Modified Date 6/11/2010 by Phaiwaan
</usage>
************************************************/



integer	li_row, li_chk , li_index , li_found	, li_index_i
string		ls_fnrecvno, ls_docno, ls_year, ls_refslipno , ls_accid_slipdet	 , ls_coopctrl , ls_deptcoopid
string		ls_entryid, ls_fromsystem, ls_bankcode, ls_bankbranch, ls_memno, ls_nonmemberdetail
string		ls_accid, ls_cashtype, ls_itemtypecode, ls_coopid, ls_chequeno, ls_paydesc, ls_accountno
string		ls_towhom, ls_machineid, ls_cancelid, ls_memname, ls_depttype
string		ls_itemgroup, ls_depttypedesc, ls_slipno, ls_remark
datetime	ldtm_dateonchq, ldtm_canceldate, ldtm_entrydate, ldtm_opreatedate
dec{2}	ldc_itemamt, ldtm_bankfee, ldc_banksrv, ldc_sharespx , ldc_feeamt
dec{2}	ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_accuint , ldc_itemnet_amt
integer	li_member_flag, li_paymentstatus, li_payrec_status, li_chqadv, li_itemstatus, li_itemstatus1
integer	li_recev, li_recvstatus , li_payfee_meth

ls_coopctrl 		= is_coopcontrl
//ls_coop_id		= is_coop_id

str_slipinfo	lstr_slipinfo


li_row			= ads_data.rowcount()
as_cancelslipno	= ""

// รับจ่ายเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่
li_recev	= integer( this.of_getattribconstant( "deptwait_atfin" , "INTEGER"))
if isnull( li_recev ) then li_recev = 0

if li_recev = 2 then
	li_paymentstatus	= 8
	li_recvstatus			= 0
else
	// ต้องทำการตรวจสอบเงินสดด้วย
	li_paymentstatus	= 1
	li_recvstatus			= 1
end if

for li_index = 1 to li_row
	ls_paydesc = ""
	ls_refslipno		= ads_data.object.deptslip_no[li_index]
	li_itemstatus		= ads_data.object.item_status[li_index]
	ls_fromsystem		= 'DEP'
	ls_entryid			= ads_data.object.entry_id[li_index]
	ldtm_entrydate		= ads_data.object.entry_date[li_index]
	
	if li_itemstatus = -9  then	
		// ตรวจสอบมีการทำรายการแล้วรึยัง
		
		li_found	=	ids_cancelslip.retrieve( as_coopid,ls_refslipno , ls_fromsystem  )

	
		for	li_index_i = 1	to li_found
			if  as_cancelslipno <> "" then as_cancelslipno += ","
			as_cancelslipno	 += ids_cancelslip.object.slip_no[ li_index_i ]
		next

	if li_found = 0 then continue 
	
		// ถ้ารับจ่ายต้อง post เงินสดเลย
	if li_recev <> 2 then		
		ls_cancelid			= ads_data.object.cancel_id[li_index]
		ldtm_canceldate	= ads_data.object.cancel_date[li_index]
		ls_cashtype			= trim( ads_data.object.cash_type[li_index] ) 
		ldtm_canceldate	= datetime( date( ldtm_canceldate )) 
		
		update	FINSLIP
		set			PAYMENT_STATUS	= -9,
					cancel_id			= :ls_cancelid,
					cancel_date			= :ldtm_canceldate,
					receive_status		= 1,
					receive_date		= :ldtm_canceldate		
		where	REF_SLIPNO				= :ls_refslipno and
					coop_id				= :as_coopid and
					ENTRY_DATE			= :ldtm_entrydate and
					from_system			= :ls_fromsystem and
					entry_id			=:ls_entryid 	and
					PAYMENT_STATUS in (1,8)
		using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		

		if ( ls_cashtype = 'CSH' )  /*and (  li_recev <> 2 ) */ then	
			
				select		SLIP_NO,		pay_recv_status,	member_no,		item_amtnet, 
							payment_desc,	itempaytype_code
				into		:ls_slipno,	:li_recvstatus,			:ls_memno,		:ldc_itemnet_amt, 
							:ls_paydesc,	:ls_itemtypecode
				from		FINSLIP
				where		REF_SLIPNO		= :ls_refslipno and
							coop_id	= :as_coopid and
							from_system	= :ls_fromsystem 
				using itr_sqlca ;
				
				if itr_sqlca.sqlcode <> 0 then
					ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถค้นหาข้อมูลการยกเลิกได้"+ itr_sqlca.sqlerrtext 
					rollback using itr_sqlca ; 
					throw ithw_exception
				end if
				
				
				// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
				lstr_slipinfo.slip_no 			= ls_slipno
				lstr_slipinfo.coop_id 		= as_coopid
				lstr_slipinfo.member_no 		= ls_memno
				lstr_slipinfo.description 		= ls_paydesc
				lstr_slipinfo.entry_date 		= ldtm_canceldate
				lstr_slipinfo.from_system 	= ls_fromsystem
				lstr_slipinfo.item_amt 		= ldc_itemnet_amt
				lstr_slipinfo.item_status 		= -9
				lstr_slipinfo.sign_flag 			= li_recvstatus
				lstr_slipinfo.recpaytype_code = ls_itemtypecode
	
				try
					this.of_postcash( lstr_slipinfo  , 1 ,ls_cancelid )
				catch ( Exception th )
					rollback using itr_sqlca ;
					throw ithw_exception
				end try
			//if this.of_postcash( ls_slipno , "FIN"  ) = Failure then 
			
			end if

		end if
		
		
//		return success
		continue 
	end if
	
	// ตรวจสอบมีการทำรายการแล้วรึยัง
	select	count( * )
	into 	:li_found
	from	finslip
	where	ref_slipno		= :ls_refslipno
	and		coop_id			= :as_coopid
	and		PAYMENT_STATUS	<> -9
	and		from_system		= 'DEP'
	using itr_sqlca ;
	
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then  continue 
	
	ls_depttype			= ads_data.object.depttype_code[ li_index ]
	ldc_itemamt			= ads_data.object.deptslip_netamt[ li_index ]
	ldc_feeamt			= ads_data.object.other_amt[ li_index ]
	li_payfee_meth		= ads_data.object.payfee_meth[ li_index ]
	ldtm_opreatedate	= ads_data.object.entry_date[ li_index ]
	

	ls_memno			= ads_data.object.member_no[ li_index ]
	ls_cashtype			= ads_data.object.cash_type[ li_index ]
	ls_itemtypecode		= ads_data.object.recppaytype_code[ li_index ]
	ls_coopid			= ads_data.object.coop_id[ li_index ]
	ls_accountno		= ads_data.object.deptaccount_no[ li_index ]
	ls_accid			= ads_data.object.tofrom_accid[ li_index ]
	ls_machineid		= ads_data.object.machine_id[ li_index ]
	ls_memname			= this.of_getmembername( ls_memno )
	ls_towhom			= trim( ls_memname )
	ls_remark			= "จ่าย"
	ls_remark			= "~r" + ls_accountno
	ls_deptcoopid		=	trim(  ads_data.object.deptcoop_id[ li_index ] ) 
	
	if isnull( ldc_feeamt ) then ldc_feeamt = 0 
	if isnull( li_payfee_meth ) then li_payfee_meth  = 0 
	
	if isnull( ls_memname ) or trim( ls_memname ) = "" then
		ls_memname	= trim( ads_data.object.deptaccount_name[ li_index ] )
		ls_towhom	= ls_memname
	end if
	
//	หากเป็นรายการยกเลิก
	if left( ls_itemtypecode ,1 )  = "E" then  continue
	
	// สร้างเลขที่เอกสาร
	ls_fnrecvno			= this.of_get_lastslip_docno( "FNRECEIVENO" )
	
	this.of_getshrlon( as_coopid, ls_memno, ldc_accuint,  ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx )
	

	SELECT		DEPTTYPE_DESC  
	INTO		:ls_depttypedesc  
	FROM		DPDEPTTYPE  
	WHERE		DEPTTYPE_CODE	= :ls_depttype   
	and			coop_id			= :ls_coopctrl
	using		itr_sqlca ;
	
	if isnull( ls_depttypedesc ) then ls_depttypedesc = ""
	
	if isnull( ls_towhom ) or ls_towhom = "" then
		
		SELECT		DEPTACCOUNT_NAME
		INTO		:ls_towhom
		FROM		DPDEPTMASTER
		WHERE		DEPTACCOUNT_NO	= :ls_accountno
		AND			COOP_ID			= :ls_deptcoopid   
		using		itr_sqlca  ;
					
		if isnull( ls_towhom ) then ls_towhom = ""
	
	end if
	
	SELECT		GROUP_ITEMTPE  
	INTO		:ls_itemgroup
	FROM		DPUCFRECPPAYTYPE  
	WHERE		RECPPAYTYPE_CODE	= :ls_itemtypecode  
	and			coop_id				= :ls_coopctrl
	using		itr_sqlca ;
	
	if isnull( ls_itemgroup ) then ls_itemgroup = ""
	
	choose case ls_itemgroup
		case "DEP"
			li_payrec_status		= 1
			ls_paydesc				= 'ฝาก' 
			
		case "OPN"
			li_payrec_status		= 1
			ls_paydesc				= 'เปิดบัญชี' 
			
		case "CLS"
			if ls_cashtype = 'CHQ' then
				li_paymentstatus	= 8
				li_recvstatus		= 0
			end if
			
			li_payrec_status		= 0
			ls_paydesc				= 'ปิดบัญชี' 
			
		case "WID"
			li_payrec_status		= 0
			
			if ls_cashtype = 'CHQ' then
				li_paymentstatus	= 8
				li_recvstatus		= 0
			end if
			ls_paydesc				= 'ถอน'
		case else
			// เป็นรายการ ด/บ , ภาษี จากรายการปิดบัญชี ไม่บันทึก

			continue 
			
	end choose
	
	ldc_itemnet_amt		= ldc_itemamt
	
	// รวมค่าธรรมเนียมถอนเกินกำหนด เข้าเป็นสลิปเดียว
	if li_payfee_meth = 2 then
		ldc_itemnet_amt = ldc_itemamt - ldc_feeamt
	end if
	
	ls_paydesc		= ls_paydesc + " " + ls_accountno
	
	INSERT INTO	FINSLIP
	(	SLIP_NO,			ENTRY_ID,				ENTRY_DATE,					OPERATE_DATE,
		FROM_SYSTEM,		PAYMENT_STATUS,			CASH_TYPE,					PAYMENT_DESC,
		BANK_CODE,			BANK_BRANCH,			ITEMPAY_AMT,				PAY_TOWHOM,
		DATEON_CHQ,			MEMBER_NO,				ITEMPAYTYPE_CODE,			PAY_RECV_STATUS,
		MEMBER_FLAG,		NONMEMBER_DETAIL,		COOP_ID,					MACHINE_ID,
		CANCEL_ID,			CANCEL_DATE,			BANKFEE_AMT,				BANKSRV_AMT,
		TOFROM_ACCID,		ACCOUNT_NO,				CHEQUEBOOK_NO,				CHQ_ADVFLAG,
		ref_slipno,			remark,					SHARE_AMT,					emer_amt,
		norm_amt,			extra_amt,				sharespx_amt,				tax_flag,
		tax_amt,			tax_rate,				receive_date,				receive_status,
		item_amtnet,		accuint_amt,			retail_flag,				recvpay_id,
		vat_amt
	)  
	VALUES
	(	:ls_fnrecvno,		:ls_entryid,			:ldtm_entrydate,			:ldtm_opreatedate,   
		:ls_fromsystem,		:li_paymentstatus,		:ls_cashtype,				:ls_paydesc,
		:ls_bankcode,		:ls_bankbranch,			:ldc_itemnet_amt,			:ls_towhom,   
		null,				:ls_memno,				:ls_itemtypecode,			:li_payrec_status,   
		1,					:ls_memname,			:ls_coopid,					:ls_machineid,   
		null,				null,					0,							0,   
		:ls_accid,			null,					null,						null, 
		:ls_refslipno,		:ls_remark,				:ldc_share,					:ldc_emer,
		:ldc_norm,			:ldc_extra,				:ldc_sharespx,				0,
		0,					0,						:ldtm_entrydate,			:li_recvstatus,
		:ldc_itemnet_amt,	:ldc_accuint,			0,							:ls_entryid ,
		0
	) using itr_sqlca   ;
	
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถบันทึกข้อมูลลง Finslip ได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
	// หาคู่บัญชี ของบัญชี่เงินฝาก ----------------------
	select	account_id 
	into 	:ls_accid_slipdet
	from 	vcmapaccid
	where	system_code			= 'DEP'
	and 	slipitemtype_code	= 'DEP'
	and		coop_id				= :is_coopcontrl
	and		shrlontype_code		= :ls_depttype
	and		shrlontype_status	= 1
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถหาคู่บัญชีได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
	
	if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ""
	//----------------------------------------------------
	
	INSERT INTO FINSLIPDET  
	( 	SLIP_NO,              	COOP_ID,              	SEQ_NO,              		SLIPITEMTYPE_CODE,              SLIPITEM_DESC,   
		SLIPITEM_STATUS,		CANCEL_ID,				CANCEL_DATE,				POSTTOVC_FLAG,					VOUCHER_NO,   
		CANCELTOVC_FLAG,		CANCELVC_NO,			DISPLAYONLY_STATUS,			ITEMPAY_AMT,					ACCOUNT_ID,   
		ITEMPAYAMT_NET,			TAX_FLAG,				VAT_FLAG,					TAX_CODE,						TAXWAY_KEEP,   
		TAX_AMT,				SECTION_ID,				MEMBGROUP_CODE,				OPERATE_FLAG,					vat_amt
	)  
	VALUES
	(	:ls_fnrecvno,			:as_coopid, 			1, 							:ls_accid_slipdet, 				:ls_paydesc ,
		1, 						null,					null,						0,								null , 		
		0,						null ,					0,							:ldc_itemamt, 					:ls_accid_slipdet,
		:ldc_itemamt, 			0, 						0,							0,								0,
		0,						0,						null,						1,								0
	) using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
	if ldc_feeamt > 0 then
		// รวมค่าธรรมเนียมถอนเกินกำหนด เข้าเป็นสลิปเดียว
		if li_payfee_meth = 2 and ldc_feeamt >  0 then
				ls_paydesc	= 'ค่าธรรมเนียมในการถอนเงินฝาก'
				
				select 		widoverlimit_accid
				into 		:ls_accid_slipdet
				from 		dpdepttype
				where 		depttype_code	= :ls_depttype
				and 		coop_id			= :is_coopcontrl
				using 		itr_sqlca ;
				
				if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ""
				
				INSERT INTO FINSLIPDET  
				( 	SLIP_NO,              	COOP_ID,			SEQ_NO,              	SLIPITEMTYPE_CODE,          SLIPITEM_DESC,   
					SLIPITEM_STATUS,		CANCEL_ID,			CANCEL_DATE,			POSTTOVC_FLAG,				VOUCHER_NO,   
					CANCELTOVC_FLAG,		CANCELVC_NO,		DISPLAYONLY_STATUS,		ITEMPAY_AMT,				ACCOUNT_ID,   
					ITEMPAYAMT_NET,			TAX_FLAG,			VAT_FLAG,				TAX_CODE,					TAXWAY_KEEP,   
					TAX_AMT,				SECTION_ID,			MEMBGROUP_CODE,			OPERATE_FLAG,				vat_amt
				)  
				VALUES
				(	:ls_fnrecvno,			:as_coopid, 		2, 						'000', 						:ls_paydesc ,
					1, 						null,				null,					0,							null, 		
					0,						null,				0,						:ldc_feeamt, 				:ls_accid_slipdet,
					:ldc_feeamt, 			0, 					0,						0,							0,
					0,						0,					null,					1,							0
				) using itr_sqlca ;
				
				if itr_sqlca.sqlcode <> 0 then
					ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
					rollback using itr_sqlca ; 
					throw ithw_exception
				end if
		
		else
			// แยกสลิป
			this.of_postdeptto_finfee( ls_refslipno, as_coopid , as_entry , adtm_wdate  )
		end if
	end if
	
	
	if (ls_cashtype = "CSH" ) and (  li_recev <> 2 )  then
		
		// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
		lstr_slipinfo.slip_no 			= ls_refslipno
		lstr_slipinfo.coop_id 			= ls_coopid
		lstr_slipinfo.member_no 		= ls_memno
		lstr_slipinfo.description 		= ls_paydesc
		lstr_slipinfo.entry_date 		= ldtm_entrydate
		lstr_slipinfo.from_system 	= ls_fromsystem
		lstr_slipinfo.item_amt 		= ldc_itemnet_amt
		lstr_slipinfo.item_status 		= 1
		lstr_slipinfo.sign_flag 			= li_payrec_status
		lstr_slipinfo.recpaytype_code = ls_itemtypecode
	
		try
			this.of_postcash( lstr_slipinfo  , 1 ,ls_entryid )
		catch (Exception thw)
			rollback using itr_sqlca ;
//			th.text = "ไม่สามารถดึงข้อมูลได้"
			throw ithw_exception
		end try
	end if

// Update สถานะการผ่านรายการมาการเงิน
update	dpdeptslip
set		post_tofin	= 1
where	deptslip_no = :ls_refslipno	and
		coop_id		= :ls_coopid
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถ Update สถานะผ่านรายการมาการเงิน ได้ "+ itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ; 
	throw ithw_exception
end if

next 


return Success
end function

private function integer of_postcancelotherto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate) throws Exception;integer	 li_rc , li_row , li_found , li_payment_status , li_recvpay_status , li_index
string		ls_slipno , ls_cashtype , ls_cancelslipno , ls_cancelid	, ls_entryid	, ls_fromsystem
datetime	ldtm_canceldate	, ldtm_entrydate

str_slipinfo	lstr_slipinfo

li_row		= ads_data.rowcount( )
li_found	=	ads_data.find( "select_flag = 1 " , 1 , li_row ) 

do while li_found	> 0	
	ls_cancelslipno		= ads_data.object.slip_no[  li_found	]
	ls_entryid			= ads_data.object.entry_id[ li_found ]
	ldtm_entrydate		= ads_data.object.entry_date[  li_found	]
	ls_fromsystem		= ads_data.object.from_system[  li_found	]
	li_payment_status	= ads_data.object.payment_status[  li_found	]
	ls_cashtype			= ads_data.object.cash_type[  li_found	]
	update	FINSLIP
	set			PAYMENT_STATUS	= -9,
				cancel_id			= :ls_cancelid,
				cancel_date		= :adtm_wdate,
				receive_status	= 1,
				receive_date	= :adtm_wdate		
	where	slip_no			= :ls_cancelslipno and
				coop_id	= :as_coopid and
				ENTRY_DATE	= :ldtm_entrydate and
				from_system	= :ls_fromsystem 
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= " ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
	if li_payment_status = 1 and ls_cashtype = "CSH" then
		lstr_slipinfo.slip_no = ls_cancelslipno
		lstr_slipinfo.coop_id = ads_data.object.coop_id[ 1 ]
		lstr_slipinfo.member_no = ads_data.object.member_no[ 1 ]
		lstr_slipinfo.description = ads_data.object.payment_desc[ 1 ]
		lstr_slipinfo.entry_date = ads_data.object.entry_date[ 1 ]
		lstr_slipinfo.from_system = ads_data.object.from_system[ 1 ]
		lstr_slipinfo.item_amt = ads_data.object.item_amtnet[ 1 ]
		lstr_slipinfo.item_status = -9
		lstr_slipinfo.sign_flag =  ads_data.object.pay_recv_status[ 1 ]
		lstr_slipinfo.recpaytype_code = ads_data.object.ITEMPAYTYPE_CODE[1]
		try
			this.of_postcash( lstr_slipinfo  , li_found , as_entry )
		catch ( Exception th )
			rollback using itr_sqlca ;
			throw ithw_exception
		end try
	end if
	
	li_found++
	if li_found > li_row then exit
	li_found	=	ads_data.find( "select_flag = 1 " , li_found , li_row ) 
	
loop

return		success
end function

public function string of_postotherto_fin (string as_coopid, string as_entry, datetime adtm_wdate, string as_appname, string as_main_xml, string as_itemdet_xml, string as_cancelslip_xml) throws Exception;integer	 li_rc , li_row , li_found , li_payment_status , li_recvpay_status , li_index , li_seqno , li_rowcancel
string		ls_slipno , ls_cashtype , ls_cancelslipno , ls_cancelid	, ls_entryid	, ls_fromsystem
string		ls_tofromaccid , ls_accid ,ls_refslip_no , ls_refsystem

str_slipinfo	lstr_slipinfo

n_ds 	lds_data , lds_itemdet  , lds_cancellist
lds_data	= create n_ds
lds_data.dataobject = "d_fin_slipspc_otherlist"
//lds_data.settransobject( itr_sqlca )

// Import String Xml
if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_data , as_main_xml )
//else
//	ithw_exception.text	= "ไมมีข้อมูลรับ-จ่าย กรุณาตรวจสอบ"
//	throw ithw_exception
end if

lds_itemdet	= create n_ds
lds_itemdet.dataobject = "d_fin_slipspc_other_det"

// Import String Xml
if not isnull( as_itemdet_xml ) and trim( as_itemdet_xml ) <> "" then
	this.of_importstring_xml( lds_itemdet , as_itemdet_xml )
//else
//	ithw_exception.text	= "ไมมีข้อมูลรายละเอียดรับ-จ่าย กรุณาตรวจสอบ"
//	throw ithw_exception
end if

//li_row = lds_data.retrieve( ls_slipno, as_coopid )

lds_cancellist 	= create n_ds
lds_cancellist.dataobject	= "d_fin_slipspc_otherlistcancel"

if not isnull( as_cancelslip_xml ) and trim( as_cancelslip_xml ) <> "" then
	this.of_importstring_xml( lds_cancellist , as_cancelslip_xml )
end if

li_row = lds_data.rowcount( )
li_rowcancel = lds_cancellist.rowcount( )

if li_row	< 1  and li_rowcancel < 1 then
	ithw_exception.text	= "ยังไม่ได้เลือกทำรายการ กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ตรวจสอบข้อมูลการเปิดงานประจำวัน
li_rc	= this.of_is_open_day( is_coopcontrl , adtm_wdate )
if ( li_rc < 1 ) then
	ithw_exception.text	= "ยังไม่ได้ทำการเปิดงานประจำวัน ไม่สามารถทำการเปิดได้"
	throw ithw_exception
end if

// ตรวจสอบข้อมูลการปิดงานประจำวัน
li_rc	= this.of_is_close_day( as_coopid , as_appname ,  adtm_wdate )
if ( li_rc = 1 ) then
	ithw_exception.text	= "ได้ทำการปิดสิ้นแล้ว ไม่สามารถทำรายการได้"
	throw ithw_exception
end if

// ตรวจสอบข้อมูลการเิปิดลิ้นชัก
this.of_is_open_teller( as_coopid, as_entry , adtm_wdate)

li_found	= lds_data.find( "select_flag = 1" , 1 , li_row )

if li_found > 0 then
	ls_slipno				= trim( lds_data.object.slip_no[li_found]  )
	ls_cashtype 			= trim( lds_data.object.cash_type[li_found]  )
	li_recvpay_status	= lds_data.object.pay_recv_status[li_found] 
	li_payment_status 	= 1
	ls_tofromaccid		= lds_data.object.tofrom_accid[li_found] 
	ls_refslip_no		= trim( lds_data.object.ref_slipno[li_found]  )
	ls_refsystem		= trim( lds_data.object.ref_system[li_found]  )
	
	// ถ้าเป็นรายการจ่ายเป็นเช็ค
	if ls_cashtype = "CHQ" and li_recvpay_status = 0 then
		li_payment_status = 8 
	end if
	
	// หากรับชำระเป็นเช็ค ให้ตรวจสอบข้อมูล รายละเอียดเช็ค
	if ls_cashtype = "CHQ" and li_recvpay_status = 1 then
		this.of_chkslip_completechq( lds_data )
	end if
	
	// ทำการบันทึกการผ่านรายการ
	update finslip
	set payment_status = :li_payment_status ,
		receive_status = 1 ,
		receive_date	= :adtm_wdate ,
		cash_type = :ls_cashtype ,
		tofrom_accid = :ls_tofromaccid , 
		entry_id		= :as_entry
	where  slip_no = :ls_slipno 
	and coop_id	= :as_coopid
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลรับ-จ่ายจากระบบอื่นได้"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
	// ปรับปรุงประเภทเงิน และคู่บัญชีต้นทาง
	choose case ls_refsystem
		case "SHL"
			update slslippayin
			set moneytype_code = :ls_cashtype ,
				tofrom_accid = :ls_tofromaccid 
			where  payinslip_no = :ls_refslip_no 
			and coop_id	= :as_coopid
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลประเภทเงินและคู่บัญชีจากต้นทางได้ "+ itr_sqlca.sqlerrtext 
				rollback using itr_sqlca ; 
				throw ithw_exception
			end if
			
		case	"SHR" , "LON"
			
			update slslippayout
			set moneytype_code = :ls_cashtype ,
				tofrom_accid = :ls_tofromaccid ,
				slip_status		 = 1
			where  payoutslip_no = :ls_refslip_no 
			and coop_id	= :as_coopid
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลประเภทเงินและคู่บัญชีจากต้นทางได้ "+ itr_sqlca.sqlerrtext 
				rollback using itr_sqlca ; 
				throw ithw_exception
			end if
			
//			try
//				n_cst_loansrv_lnfinance lnv_loansrv
//				lnv_loansrv	= create n_cst_loansrv_lnfinance 
//				lnv_loansrv.of_initservice( inv_db ) 
//				lnv_loansrv.of_saveslip_lnrcv( as_coopid , ls_refslip_no ) 
//			catch ( Exception thx )
//				rollback using itr_sqlca ;
//				throw ithw_exception
//			end try
			
		case	"DEP"
			update dpdeptslip
			set cash_type = :ls_cashtype ,
				tofrom_accid = :ls_tofromaccid 
			where  deptslip_no = :ls_refslip_no 
			and coop_id	= :as_coopid
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลประเภทเงินและคู่บัญชีจากต้นทางได้ "+ itr_sqlca.sqlerrtext 
				rollback using itr_sqlca ; 
				throw ithw_exception
			end if
			
	end choose
	
	// บันทึกรายละเอียด
	li_row		= lds_itemdet.rowcount( )
	for li_index = 1 to  li_row	
		ls_accid	= trim( lds_itemdet.object.account_id[ li_index ]  )
		li_seqno	= lds_itemdet.object.seq_no[ li_index ] 
		
		update finslipdet
		set		account_id = :ls_accid
		where slip_no = :ls_slipno
		and 	seq_no	= :li_seqno
		using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถบันทึกรายละเอียดข้อมูลรับ-จ่ายจากระบบอื่นได้"+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
	next 

	// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
	lds_data.object.PAYMENT_STATUS[li_found] = li_payment_status
	lds_data.accepttext( )
	
	if (ls_cashtype = "CSH" ) then

		lstr_slipinfo.slip_no 				= lds_data.object.slip_no[ li_found ]
		lstr_slipinfo.coop_id 				= lds_data.object.coop_id[ li_found ]
		lstr_slipinfo.member_no 			= lds_data.object.member_no[ li_found ]
		lstr_slipinfo.description 			= lds_data.object.payment_desc[ li_found ]
		lstr_slipinfo.entry_date 			= lds_data.object.entry_date[ li_found ]
		lstr_slipinfo.from_system 		= lds_data.object.from_system[ li_found ]
		lstr_slipinfo.item_amt 			= lds_data.object.item_amtnet[ li_found ]
		lstr_slipinfo.item_status 			= 1
		lstr_slipinfo.sign_flag 				=  lds_data.object.pay_recv_status[ li_found ]
		lstr_slipinfo.recpaytype_code 	= lds_data.object.ITEMPAYTYPE_CODE[li_found]

		try
			this.of_postcash( lstr_slipinfo  , li_found ,as_entry )
		catch ( Exception th )
			rollback using itr_sqlca ;
			throw ithw_exception
		end try
	end if
	
end if

// หากมีรายการยกเลิกจากต้นทาง
li_row		= lds_cancellist.rowcount( )
if li_row	> 0 then
	this.of_postcancelotherto_fin( lds_cancellist , as_coopid , as_entry , adtm_wdate )
end if

// ตัดยอด ฝั่งเงินกู้
if ls_refsystem = "LON" then
		
	try
		n_cst_loansrv_lnfinance lnv_loansrv
		lnv_loansrv	= create n_cst_loansrv_lnfinance 
		lnv_loansrv.of_initservice( inv_db ) 
		lnv_loansrv.of_saveslip_lnrcv( as_coopid , ls_refslip_no,is_coopcontrl ) 
		
	catch ( Exception thx )
		ithw_exception.text=thx.text;
		rollback using itr_sqlca ;
		throw ithw_exception
	end try
	
end if

commit using itr_sqlca ;

destroy( lnv_loansrv ) 
destroy( lds_cancellist ) 
destroy( lds_data ) 
destroy( lds_itemdet ) 

return ls_slipno
end function

private function integer of_postlonlrtto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, ref string as_cancelslipno) throws Exception;/***********************************************
<description>
	ดึงข้อมูลจากระบบหนี้ ที่เป็นรายการจ่ายคืนเงินต้นและดอกเบี้ย
</description>

<arguments>	
	as_memberno			รหัสสมาชิก
	as_coopid				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการ
	adtm_wdate				วันที่ทำรายการ
	as_machine				ชื่อเครื่องที่ทำรายการ
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postlonlwdto_fin()
	
	Integer li_return
	String ls_memberno , ls_branch , ls_entry , ls_machine
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postlonlwdto_fin( ls_memberno , ls_branch , ls_entry , ldtm_wdate, ls_machine )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/10/2010 by Phaiwaan
	Version 1.1 เพิ่มกรณีมีการหักกลบ Modified Date 20/10/2010 by Phaiwaan
	Version 1.2 แก้ให้สร้างเลขที่ใบเสร็จ/ใบสำคัญจ่าย Modified Date 27/10/2010 by Phaiwaan
	Version 1.3 แก้ดึงข้อมูลรายการยกเิลิกจากต้นทาง Modified Date 6/11/2010 by Phaiwaan	
</usage>
************************************************/
integer		li_row, li_payrec_status, li_paymentstatus, li_chk, li_itemstatus, li_recev , li_found , li_seq_no , li_index_i
integer		li_status, li_recvstatus, li_itemstatus1, li_update, li_shlnuserecv , li_index 
string		ls_cashtype, ls_slipno, ls_docno, ls_year, ls_desc,  ls_receiptno, ls_mbcoop_id
dec{2}		ldc_recvnet, ldc_sharespx, ldc_accuint, ldc_itempay_amt, ldc_itempay_amtnet, ldc_buyshare
dec{2}		ldc_share, ldc_emer, ldc_norm, ldc_extra 
dec{2}		ldc_bankfee_amt, ldc_banksrv_amt, ldc_payout_amt, ldc_buyshare_amt
string		ls_tofrom_accid, ls_loancontract_no, ls_member_no, ls_expense_accid, ls_expense_branch
string		ls_expense_bank, ls_entry_id,  ls_fromsystem , ls_accid_slipdet , ls_shrlontype_code
string		ls_machineid, ls_loantype, ls_memname, ls_loantypedesc, ls_towhom, ls_remark
datetime		ldtm_entry_date, ldtm_operdate
string		ls_cancelid, ls_printslip[], ls_payslip_no , ls_slipclr , ls_refsyst , ls_itemtypecode
datetime		ldtm_canceldate

str_slipinfo	lstr_slipinfo

li_row		= ads_data.rowcount(  )

// รับจ่ยเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่
li_recev	= integer( this.of_getattribconstant( "allpay_atfin" , "INTEGER" ))
if isnull( li_recev ) then li_recev = 0

// การใช้เลขที่ใบเสร็จของหุ้นหนี้
li_shlnuserecv	= integer( this.of_getattribconstant( "shrlon_usefinreceipt" , "INTEGER" ))
if isnull( li_shlnuserecv ) then li_shlnuserecv = 0

if li_shlnuserecv = 2 then
	li_paymentstatus	= 8
	li_recvstatus		= 0
else
	li_paymentstatus	= 1
	li_recvstatus		= 1
end if

ldc_itempay_amt		= 0
ldc_itempay_amtnet 	= 0
li_seq_no = 0
as_cancelslipno		= ""
for li_index = 1 to li_row

		ls_receiptno			= ""
		li_payrec_status		= 0 // pay
		ls_machineid			= as_machine
		ldc_recvnet				= 0.00 //ads_data.object.payoutnet_amt[li_index]
		ls_mbcoop_id		= ads_data.object.coop_id[li_index]
		ls_cashtype				= trim( ads_data.object.moneytype_code[li_index] )
		ls_fromsystem			= 'LON'
		li_itemstatus			= ads_data.object.slip_status[li_index]
		
		if li_itemstatus = -9 or li_itemstatus = -99 then
			
			li_found	=	ids_cancelslip.retrieve( ls_payslip_no , ls_fromsystem , as_coopid )
			
		
			if isnull( li_found ) then li_found = 0
//			
//			if li_found = 0 then  continue 
			
//			select	SLIP_NO, PAYMENT_STATUS
//			into		:ls_slipno, :li_itemstatus1
//			from		FINSLIP
//			where		ENTRY_DATE		= :ldtm_entry_date and
//						REF_SLIPNO		= :ls_payslip_no  and
//						coop_id	= :as_coopid 
//			using itr_sqlca ;
//					
//			if itr_sqlca.sqlcode <> 0 then
//				ithw_exception.text	= "ระบบหนี้ : ไม่สามารถยกเลิกที่ระบบการเงินได้ "+ itr_sqlca.sqlerrtext 
//				rollback using itr_sqlca ; 
//				throw ithw_exception			
//			end if

//				for	li_index_i = 1	to li_found
//					if as_cancelslipno <> "" then as_cancelslipno += ","
//					as_cancelslipno		+= ids_cancelslip.object.slip_no[ li_index_i ]
//				next

			// ถ้ารับจ่ายต้อง post เงินสดเลย
			if li_shlnuserecv <> 2 then		
				
				ls_cancelid			= ads_data.object.cancel_id[li_index]
				ldtm_canceldate	= ads_data.object.cancel_date[li_index]
				ls_cashtype			=	ads_data.object.cash_type[li_index]
				update	FINSLIP
				set		PAYMENT_STATUS	= -9,
							cancel_id		= :ls_cancelid,
							cancel_date		= :ldtm_canceldate,
							receive_status	= 1,
							receive_date	= :ldtm_canceldate			
				where		SLIP_NO			= :ls_slipno and
							coop_id	= :as_coopid
				using itr_sqlca ;
				
				if itr_sqlca.sqlcode <> 0 then
					ithw_exception.text	= "ระบบหนี้ : ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
					rollback using itr_sqlca ; 
					throw ithw_exception
				end if
				

		
				if ( ls_cashtype = 'CSH' ) and li_shlnuserecv <> 2 then
					
						select		SLIP_NO , pay_recv_status , member_no , item_amtnet , payment_desc , itempaytype_code
						into		:ls_slipno , :li_recvstatus , :ls_member_no , :ldc_payout_amt, :ls_desc , :ls_itemtypecode
						from		FINSLIP
						where	REF_SLIPNO		= :ls_payslip_no and
									coop_id	= :as_coopid and
									from_system	= :ls_fromsystem  
						using itr_sqlca ;
						
						if itr_sqlca.sqlcode <> 0 then
							ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถค้นหาข้อมูลการยกเลิกได้"+ itr_sqlca.sqlerrtext 
							rollback using itr_sqlca ; 
							throw ithw_exception
						end if
						
						// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
						lstr_slipinfo.slip_no 			= ls_slipno
						lstr_slipinfo.coop_id 		= as_coopid
						lstr_slipinfo.member_no 		= ls_member_no
						lstr_slipinfo.description 		= ls_desc
						lstr_slipinfo.entry_date 		= ldtm_entry_date
						lstr_slipinfo.from_system 	= ls_fromsystem
						lstr_slipinfo.item_amt 		= ldc_payout_amt
						lstr_slipinfo.item_status 		= -9
						lstr_slipinfo.sign_flag 			= li_recvstatus
						lstr_slipinfo.recpaytype_code = ls_itemtypecode
						
						try
							this.of_postcash( lstr_slipinfo  , 1 ,ls_cancelid )
						catch ( Exception th )
							rollback using itr_sqlca ;
							throw ithw_exception
						end try
			end if		
			
		end if		
				
			commit using itr_sqlca ;
			continue
		end if
		
		if ls_cashtype = 'CHQ' then
			li_paymentstatus	= 8
		else
//			if li_recev = 1 then
//				li_paymentstatus	= 8
//			else
//				li_paymentstatus	= 1
//			end if
		end if	
			
		//
		
		ls_shrlontype_code	= ads_data.object.shrlontype_code[li_index]
		ldc_bankfee_amt		= 0.00 //ads_data.object.bankfee_amt[li_index]
		ldc_banksrv_amt		= 0.00 //ads_data.object.banksrv_amt[li_index]
		ls_tofrom_accid		= this.of_defaultaccid( ls_cashtype ) //ads_data.object.tofrom_accid[li_index]
		ls_loancontract_no		= trim( ads_data.object.loancontract_no[li_index] )
		ls_payslip_no			= ads_data.object.payoutslip_no[li_index]
		ls_member_no			= ads_data.object.member_no[li_index]
		ls_memname			= this.of_getmembername( ls_member_no )
		ls_expense_accid		= ads_data.object.expense_accid[li_index]
		ls_expense_branch	= ads_data.object.expense_branch[li_index]
		ls_expense_bank		= ads_data.object.expense_bank[li_index]
		ldc_payout_amt		= ads_data.object.payout_amt[li_index]
		ldc_buyshare_amt		= 0.00 //ads_data.object.buyshare_amt[li_index]
		ldtm_entry_date		= adtm_wdate
		ls_entry_id				= ads_data.object.entry_id[li_index]
		ldtm_operdate			= datetime (date( ads_data.object.slip_date[li_index] ) )
		ls_towhom				= trim( ls_memname )
		ls_slipclr					= trim( ads_data.object.slipclear_no[li_index] )
		
		if isnull( ls_slipclr ) then ls_slipclr = ""
		
		// ตรวจสอบมีการทำรายการแล้วรึยัง
		select count( * )
		into 	:li_found
		from finslip
		where ref_slipno = :ls_payslip_no
		and	coop_id	= :as_coopid
		and entry_date = :ldtm_entry_date		
		and	PAYMENT_STATUS <> -9
		and from_system  = 'LON'
		using itr_sqlca ;
		
		if isnull( li_found ) then li_found = 0
		
		if li_found > 0 then  continue 
		
		if isnull( ldc_buyshare_amt ) then ldc_buyshare_amt = 0
		
		ls_receiptno	= ""
		
		ls_desc			= "จ่ายคืนเงินต้นและดอกเบี้ย  สมาชิก " + ls_member_no
		ls_remark		= " สมาชิก " + ls_member_no
		ls_remark		= "~r~n" + ls_remark + "อ. " + string( ldc_payout_amt , '#,##0.00' )
		if isnull( li_itemstatus ) then li_itemstatus = 1
		
		if ls_cashtype = 'TRN' or ls_cashtype = 'TBK' then
			li_paymentstatus	= 1
			li_recvstatus		= 1	
		end if
		
		
		// สร้างเลขที่เอกสาร
		ls_slipno			= this.of_get_lastslip_docno( "FNRECEIVENO" )
		
		ldc_recvnet		= ldc_payout_amt
//		ls_receiptno	= ads_data.object.slipclear_no[li_index]
		if isnull( ls_slipclr )  then ls_slipclr = ""
//		if  ls_slipclr <>  "" then
//			
//			li_chk = ids_payclr.retrieve( ls_slipclr )
//			
//			if li_chk < 1 then continue
//			
//			if li_shlnuserecv = 1 then
//				ls_receiptno			=  this.of_get_lastslip_docno( "FNRECEIPTNO" )
//			else
//				ls_receiptno	= ads_data.object.slipclear_no[li_index]
//			end if
//			
//			ldc_itempay_amt	= dec( ids_payclr.describe( "Evaluate(' sum( item_payamt for all ) ' , 0 ) " ) ) 
//			
//			ldc_recvnet		= ldc_payout_amt  - ldc_itempay_amt 
////				ls_remark		= "~r~n" + ls_remark + "หก. " + string( ldc_clcprnc + ldc_clcint + ldc_buyshare_amt , '#,##0.00'  )
////			// update เลขที่อ้างอิง
////			for li_update = 1 to ads_data.rowcount()
////				string	ls_loancontclr_no, ls_lncoop_id, ls_REF_DOCNO		
////				integer	li_operate_flag		
////				
////				ls_loancontclr_no		= ads_data.object.loancontclr_no[li_update]
////				li_operate_flag			= ads_data.object.clear_flag[li_update]
////				ls_lncoop_id			= ads_data.object.cmloanreceiveclr_lncoop_id[li_update]
////				ls_REF_DOCNO			= ads_data.object.receipt_no[li_update]		
////				
////				if isnull( ls_REF_DOCNO ) then ls_REF_DOCNO = ""
////				if isnull( ls_lncoop_id ) then ls_lncoop_id = as_coopid
////				if isnull( li_operate_flag ) then li_operate_flag = 0
////				if isnull( ls_loancontract_no ) then ls_loancontract_no = ""		
////				
////				if ( li_operate_flag = 1 ) and ( li_shlnuserecv = 1 ) then			
////					UPDATE	LNCONTSTATEMENT  
////					SET		REF_DOCNO			= :ls_receiptno
////					WHERE		( LOANCONTRACT_NO	= :ls_loancontclr_no ) AND  
////								( coop_id			= :ls_lncoop_id ) AND  
////								( REF_DOCNO			= :ls_REF_DOCNO )  
////					using itr_sqlca ;
////				end if
////				
////			next
//			
//			
//		end if
			

		this.of_getshrlon( as_coopid   ,ls_member_no  ,ldc_accuint ,  ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx )

		INSERT INTO FINSLIP  
		(		SLIP_NO,					ENTRY_ID,					ENTRY_DATE,					OPERATE_DATE,   
				FROM_SYSTEM,		PAYMENT_STATUS,		CASH_TYPE,					PAYMENT_DESC,   
				BANK_CODE,			BANK_BRANCH,				ITEMPAY_AMT,					PAY_TOWHOM,   
				DATEON_CHQ,			MEMBER_NO,				ITEMPAYTYPE_CODE,			PAY_RECV_STATUS,   
				MEMBER_FLAG,			NONMEMBER_DETAIL,	coop_id,				MACHINE_ID,   
				CANCEL_ID,				CANCEL_DATE,				BANKFEE_AMT,					BANKSRV_AMT,
				TOFROM_ACCID,		ACCOUNT_NO,				CHEQUEBOOK_NO,				CHQ_ADVFLAG,
				REF_SLIPNO,			REF_SYSTEM,				FROM_ACCNO,					RECEIPT_NO,
				REMARK,					FROM_BANKCODE,			FROM_BRANCHCODE,			loanappv_amt,
				SHARE_AMT,			emer_amt,					norm_amt,						extra_amt,
				sharespx_amt,			tax_amt,						tax_flag,							tax_rate,
				item_amtnet,			receive_date,				receive_status,					accuint_amt,
				retail_flag,				payslip_no,					recvpay_id ,						vat_amt
		)  
		VALUES
		( 		:ls_slipno,   				:ls_entry_id,					:ldtm_entry_date,				:ldtm_operdate,
				:ls_fromsystem,		:li_paymentstatus,			:ls_cashtype,					:ls_desc,
				:ls_expense_bank,		:ls_expense_branch,		:ldc_recvnet,					:ls_towhom,
				null,   					:ls_member_no,			'LWD',							:li_payrec_status,
				1,							:ls_memname,				:as_coopid,						:ls_machineid,   
				null,						null,							:ldc_bankfee_amt,				:ldc_banksrv_amt,
				:ls_tofrom_accid,		null,							null,								null,
				:ls_payslip_no,	:ls_fromsystem,			null,								:ls_receiptno,   
				:ls_remark,				:ls_expense_bank,			null,								:ldc_payout_amt,
				:ldc_share,				:ldc_emer,					:ldc_norm,						:ldc_extra,
				:ldc_sharespx,			0,								0,									0,
				:ldc_recvnet,			:ldtm_entry_date,			:li_recvstatus,					:ldc_accuint,
				0,							:ls_payslip_no,				:ls_entry_id , 					0
		)  using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหนี้ : ไม่สามารถบันทึกข้อมูลลง Finslip ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		li_seq_no++
		// หาคู่บัญชี ของหนี้ ----------------------
		select account_id 
		into 	:ls_accid_slipdet
		from vcmapaccid
		where  system_code = 'LON'
		and	coop_id					= :is_coopcontrl	
		and slipitemtype_code = 'LON'
		and shrlontype_code = :ls_shrlontype_code
		and shrlontype_status = 1
		using itr_sqlca ;
		
		if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ""
		//----------------------------------------------------
		
		INSERT INTO FINSLIPDET  
		( 	SLIP_NO,              		coop_id,              		SEQ_NO,              		SLIPITEMTYPE_CODE,              	SLIPITEM_DESC,   
			SLIPITEM_STATUS,		CANCEL_ID,							CANCEL_DATE,				POSTTOVC_FLAG,						VOUCHER_NO,   
			CANCELTOVC_FLAG,		CANCELVC_NO,						DISPLAYONLY_STATUS,	ITEMPAY_AMT,							ACCOUNT_ID,   
			ITEMPAYAMT_NET,		TAX_FLAG,							VAT_FLAG,					TAX_CODE,								TAXWAY_KEEP,   
			TAX_AMT,					SECTION_ID,						MEMBGROUP_CODE,		OPERATE_FLAG	,					vat_amt
		)  
		VALUES
		(	:ls_slipno ,					:as_coopid , 						:li_seq_no , 					:ls_accid_slipdet , 									:ls_desc ,
			1 , 							null ,									null ,							0 ,											null , 		
			0	,							null ,									0 ,								:ldc_payout_amt , 							:ls_accid_slipdet ,
			:ldc_payout_amt , 			0 , 									0	,							0 ,											0 ,
			0 ,								0	,									null ,							1 ,											0
		) using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหนี้ : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
//		// หากมีการหักกลบสัญญาเดิม
//		li_chk = ids_payclr.rowcount( )
//		if li_chk > 0 then 
//			this.of_postpayoutto_finclr( ls_slipno , as_coopid , ids_payclr , li_seq_no)
//		end if

		// รับเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่
		// ถ้ารับจ่ายต้อง post เงินสดเลย
		if ( li_recev = 0 ) and ( ls_cashtype = 'CSH' ) then
			// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
			lstr_slipinfo.slip_no 			= ls_payslip_no
			lstr_slipinfo.coop_id 		= as_coopid
			lstr_slipinfo.member_no 		= ls_member_no
			lstr_slipinfo.description 		= ls_desc
			lstr_slipinfo.entry_date 		= ldtm_entry_date
			lstr_slipinfo.from_system 	= ls_fromsystem
			lstr_slipinfo.item_amt 		= ldc_payout_amt
			lstr_slipinfo.item_status 		= 1
			lstr_slipinfo.sign_flag 			= li_payrec_status
			lstr_slipinfo.recpaytype_code = ls_itemtypecode
			try
				this.of_postcash( lstr_slipinfo  , 1 ,ls_entry_id )
			catch ( Exception thw )
				rollback using itr_sqlca ;
				throw ithw_exception
			end try
		end if
		
	// Update สถานะการผ่านรายการมาการเงิน
	update slslippayout
	set		post_tofin = 1
	where payoutslip_no = :ls_payslip_no	and
		coop_id		= :as_coopid
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบเงินกู้ : ไม่สามารถ Update สถานะผ่านรายการมาการเงิน ได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
next

commit using itr_sqlca ;
return Success
end function

public function integer of_itemcaltax (string as_coopid, integer ai_recv_pay, integer ai_calvat, integer ai_taxcode, decimal adc_itemamt, ref decimal adc_taxamt, ref decimal adc_itemamt_net, ref decimal adc_vatamt) throws Exception;//////////////////////////////////////////////////////////////////////////////
//  
//	Function Name:  		of_itemcaltax
//
//	Arguments:

//	Returns:  		integer
//						หากทำการ คำนวณภาษีถูกต้อง ค่าที่ส่งกลับคือ 1 ในทางกลับกัน
//						จะส่งค่า -1
//	referance:		String XML
//						หาก คำนวณภาษีและVAT เสร็จ จะกำหนดค่าในฟิลด์ ยอดรวม , ยอดภาษี  , และยอด VAT 
//
//	Description: 	เพื่อทำการคำนวณดอกเบี้ยเงินฝาก ในกรณีการทำรายการปิดบัญชี ถอนเงินฝากที่มีต้นเงิน
//
//////////////////////////////////////////////////////////////////////////////

dec{4}	ldc_taxrate , ldc_vatrate
dec{2}	ldc_tempamt , ldc_temptax
integer	li_includevat

n_ds		lds_data

lds_data		=	create n_ds
lds_data.dataobject = "dddw_fin_taxtype" 
lds_data.settrans( itr_sqlca )
lds_data.retrieve(as_coopid)

// หากเป็นรายการรับ ไม่คิดภาษี
//if ai_recv_pay = 1 then return success

lds_data.setfilter( "tax_code= " + string( ai_taxcode ) ) 
lds_data.filter( )

if lds_data.rowcount( ) > 0 then
	ldc_taxrate		= lds_data.getitemdecimal( 1, "tax_rate" )
end if 

ldc_vatrate		= dec( this.of_getattribconstant( "tax_rate" , "DECIMAL") )
li_includevat		= dec( this.of_getattribconstant( "includevat_flag" , "DECIMAL") )

if isnull( ldc_taxrate ) then ldc_taxrate = 0

ldc_tempamt	= adc_itemamt

	adc_vatamt = 0.00
	
	// รวม VAT แล้ว
	if li_includevat  = 1 then
		if ai_calvat = 1 then
			ldc_vatrate				= 100 + ( ldc_vatrate * 100 )
			adc_vatamt				= adc_itemamt - ( adc_itemamt * 100 / ldc_vatrate )
			adc_vatamt				= round( adc_vatamt  ,2)
		end if
		
		adc_taxamt				= ( adc_itemamt - adc_vatamt ) * ldc_taxrate
		adc_taxamt				= round( adc_taxamt  ,2)
		adc_itemamt_net		= (  adc_itemamt - adc_taxamt ) 
	else
	// ยังไม่รวม VAT
		if ai_calvat = 1 then
//			ldc_vatrate				= 100 + ( ldc_vatrate * 100 )
			adc_vatamt				= ( adc_itemamt * ldc_vatrate )
			adc_vatamt				= round( adc_vatamt  ,2)
		end if
		
		adc_taxamt				= ( adc_itemamt ) * ldc_taxrate
		adc_taxamt				= round( adc_taxamt  ,2)
		adc_itemamt_net		= (  adc_itemamt - adc_taxamt ) + adc_vatamt
	end if
	

return success
end function

public function integer of_getaddress (ref string as_taxaddr, ref string as_taxid, string as_coopid, string as_memberno, integer ai_memberflag);string	ls_address,ls_moo,ls_vilage,  ls_soi, ls_road, ls_district, ls_province, ls_postcode, ls_subdistrict
string	ls_taxid, ls_alladdress


choose case ai_memberflag
	case 1
		as_coopid	= as_coopid
		SELECT	MBMEMBMASTER.ADDR_NO,			MBMEMBMASTER.ADDR_MOO,			MBMEMBMASTER.ADDR_SOI,
					MBMEMBMASTER.ADDR_VILLAGE,					MBMEMBMASTER.ADDR_ROAD,						MBMEMBMASTER.TAMBOL_CODE,
					MBUCFDISTRICT.DISTRICT_DESC,		MBUCFPROVINCE.PROVINCE_DESC,		MBMEMBMASTER.ADDR_POSTCODE,
					MBMEMBMASTER.CARD_PERSON
		INTO		:ls_address,										:ls_moo,											:ls_soi,
					:ls_vilage,										:ls_road,											:ls_subdistrict,
					:ls_district,										:ls_province,									:ls_postcode,
					:ls_taxid
		FROM		MBMEMBMASTER,MBUCFDISTRICT,MBUCFPRENAME,MBUCFPROVINCE  
		WHERE	( MBMEMBMASTER.ADDR_POSTCODE = MBUCFDISTRICT.POSTCODE) and
					( MBMEMBMASTER.PROVINCE_CODE	= MBUCFDISTRICT.PROVINCE_CODE  ) and  
					( MBMEMBMASTER.PRENAME_CODE 	= MBUCFPRENAME.PRENAME_CODE ) and  
					( MBMEMBMASTER.PROVINCE_CODE 	= MBUCFPROVINCE.PROVINCE_CODE ) and  
					( MBMEMBMASTER.MEMBER_NO 		= :as_memberno )   and
					( MBMEMBMASTER.COOP_ID = :is_coopcontrl)
		using itr_sqlca ;
		
	case 0
		SELECT	FINCONTACKMASTER.TAX_ID,				FINCONTACKMASTER.ADDRESS_NO,
					FINCONTACKMASTER.SOI_NO,				FINCONTACKMASTER.ROAD_NAME,
					FINCONTACKMASTER.SUBDISTRICT,		MBUCFDISTRICT.DISTRICT_DESC,
					MBUCFPROVINCE.PROVINCE_DESC,		FINCONTACKMASTER.POSTCODE
		INTO		:ls_taxid,											:ls_address,
					:ls_soi,											:ls_road,
					:ls_subdistrict,									:ls_district,
					:ls_province,									:ls_postcode
		FROM		FINCONTACKMASTER, MBUCFDISTRICT,MBUCFPROVINCE  
		WHERE	( FINCONTACKMASTER.DISTRICT			= MBUCFDISTRICT.DISTRICT_CODE ) and  
					( FINCONTACKMASTER.PROVINCE			= MBUCFDISTRICT.PROVINCE_CODE ) and  
					( FINCONTACKMASTER.PROVINCE			= MBUCFPROVINCE.PROVINCE_CODE ) and  
					( FINCONTACKMASTER.CONTACK_NO	= :as_memberno )   AND
					( FINCONTACKMASTER.COOP_ID = :is_coopcontrl ) 
		using itr_sqlca ;
					 
	case else
		ls_taxid			= trim( as_taxid )
		ls_address		= trim( as_taxaddr )
		ls_alladdress	= ls_address
end choose

if isnull( ls_address ) then ls_address = ""
if isnull( ls_moo ) then ls_moo = ""
if isnull( ls_soi ) then ls_soi = ""
if isnull( ls_subdistrict ) then ls_subdistrict = ""
if isnull( ls_vilage ) then ls_vilage = ""
if isnull( ls_road ) then ls_road = ""
if isnull( ls_district ) then ls_district = ""
if isnull( ls_province ) then ls_province = ""
if isnull( ls_postcode ) then ls_postcode = ""
if isnull( ls_taxid ) then ls_taxid = ""

ls_taxid			= trim( ls_taxid )
ls_address		= trim( ls_address )
ls_moo			= trim( ls_moo )
ls_vilage			= trim( ls_vilage )
ls_soi				= trim( ls_soi )
ls_road			= trim( ls_road )
ls_subdistrict	= trim( ls_subdistrict )
ls_district		= trim( ls_district )
ls_province		= trim( ls_province )
ls_postcode		= trim( ls_postcode )

if ( ai_memberflag = 1 or ai_memberflag = 0 ) then
	if itr_sqlca.sqlcode <> 0 then
		ls_alladdress	= ""
		ls_taxid			= ""
	else
		ls_alladdress	= ""
		if trim( ls_address ) <> "" then
			ls_alladdress		+= ls_address
		end if
		
		if trim( ls_vilage ) <> "" then
			ls_alladdress		+= " หมู่บ้าน " + ls_vilage
		end if
		if trim( ls_moo ) <> "" then
			ls_alladdress		+= " ม. " + ls_moo
		end if
		if trim( ls_soi ) <> "" then
			ls_alladdress		+= " ซ. " +ls_soi
		end if
		if trim( ls_road ) <> "" then
			ls_alladdress		+= " ถ. " +ls_road
		end if
		if trim( ls_subdistrict ) <> "" then
			ls_alladdress		+= " ต. " +ls_subdistrict
		end if
		if trim( ls_district ) <> "" then
			ls_alladdress		+= " อ. " +ls_district
		end if
		if trim( ls_province ) <> "" then
			ls_alladdress		+= " จ. " +ls_province
		end if
		if trim( ls_postcode ) <> "" then
			ls_alladdress		+= " " +ls_postcode
		end if
		
	end if
end if

as_taxaddr	= ls_alladdress
as_taxid		= ls_taxid

return Success
end function

public function string of_payslip (string as_main_xml, string as_item_xml, string as_taxdetail_xml, string as_appname) throws Exception;string		ls_cashtype, ls_machineid, ls_chqno, ls_bankcode, ls_bankbranch, ls_paywhom, ls_dwobjectname
string		ls_coopid, ls_entryid, ls_chqbookno, ls_member , ls_slipno , ls_receipt , ls_payno, ls_membgroup
string		ls_fromacc, ls_frombank, ls_frombranch, ls_errtext, ls_refer, ls_tofromaccid, ls_chqno_next, ls_getslipno
string		ls_receiveid, ls_referfinslipno, ls_chequetype, ls_remark, ls_err, ls_receiptcode, ls_payslipcode, ls_slipdocno  

datetime	ldtm_onchq, ldtm_entrydate, ldtm_today ,ldtm_recvtime
dec{2}	ldc_itemamt, ldc_itemamtnet
dec{2}	ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx
dec{2}	ldc_scobal, ldc_accuint , ldc_taxamt

integer	li_seqno, li_chequestatus, li_finstatus, li_memflag, li_chk, li_payrecv, li_chkexist
integer	li_detailcount, li_row , li_index, li_taxflag, li_rc, li_countTax, li_paymentstatus

ls_receiptcode 	= 'FNRECEIPTNO'
ls_payslipcode	= 'FNPAYSLIPNO' 
ls_slipdocno  	= 'FNRECEIVENO'

n_ds		lds_main, lds_item
str_slipinfo	lstr_slipinfo
	
// ชื่อ Datawindow ที่ใช้
ls_dwobjectname 		= inv_print_srv.of_getdataobject( as_main_xml )	
lds_main					=	create n_ds
lds_main.dataobject 	= ls_dwobjectname
lds_main.settrans( itr_sqlca )

// ชื่อ Datawindow ที่ใช้
ls_dwobjectname 		= inv_print_srv.of_getdataobject( as_item_xml )	
lds_item					=	create n_ds
lds_item.dataobject 	= ls_dwobjectname
lds_item.settrans( itr_sqlca )

if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_main , as_main_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลรับ-จ่าย ไม่สามารถตรวจสอบข้อมูลได้"
	destroy( lds_main )
	destroy( lds_item )		
	throw ithw_exception
end if

if not isnull( as_item_xml ) and trim( as_item_xml ) <> "" then
	this.of_importstring_xml( lds_item , as_item_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลรายละเอียดรับ-จ่าย ไม่สามารถตรวจสอบข้อมูลได้"
	destroy( lds_main )
	destroy( lds_item )
	throw ithw_exception
end if
	
li_payrecv			= lds_main.object.pay_recv_status[ 1 ]	
ls_cashtype			= lds_main.GetitemString( 1, "cash_type" )
ls_machineid		= lds_main.GetitemString( 1 , "machine_id" )
ls_coopid			= lds_main.GetitemString( 1 , "coop_id" )
ls_member			= lds_main.GetitemString( 1 , "member_no" )
ls_entryid			= lds_main.GetitemString( 1 , "entry_id" )	
ldtm_entrydate		= lds_main.GetitemDateTime( 1 , "entry_date" )
ldc_itemamt			= lds_main.GetitemDecimal( 1 , "itempay_amt" )
ldc_itemamtnet		= lds_main.GetitemDecimal( 1 , "item_amtnet" )
ls_referfinslipno	= lds_main.object.slip_no[ 1 ]
ls_refer				= lds_main.object.ref_slipno[ 1 ]
ls_tofromaccid		= lds_main.object.tofrom_accid[ 1 ]
li_memflag			= lds_main.object.member_flag[ 1 ]
ls_chequetype		= lds_main.object.cheque_type[ 1 ]
ls_remark			= lds_main.object.payment_desc[ 1 ]
ls_paywhom			= trim( lds_main.object.nonmember_detail[ 1 ] )
ls_cashtype			= upper( ls_cashtype )
ldtm_recvtime		= datetime( date( ldtm_entrydate ) , now( ) )
li_taxflag				= lds_main.object.tax_flag[ 1 ]
ldc_taxamt			= lds_main.object.tax_amt[ 1 ]
ls_receiveid			= ls_entryid
ls_membgroup		= lds_main.object.membgroup_code[ 1 ]
li_paymentstatus	= lds_main.object.payment_status[ 1 ]
	
if isnull( ls_refer ) then ls_refer = "" 
if isnull( ls_chequetype ) then ls_chequetype = '00'

// ตรวจสอบข้อมูลการเปิดงานประจำวัน
li_rc	= this.of_is_open_day( ls_coopid , ldtm_entrydate )

if ( li_rc < 1 ) then
	ithw_exception.text	= "ยังไม่ได้ทำการเปิดงานประจำวัน ไม่สามารถทำการเปิดได้"
	destroy( lds_main )
	destroy( lds_item )		
	throw ithw_exception
end if

// ตรวจสอบข้อมูลการปิดงานประจำวัน
li_rc	= this.of_is_close_day( ls_coopid , as_appname ,  ldtm_entrydate )
if ( li_rc = 1 ) then
	ithw_exception.text	= "ได้ทำการปิดสิ้นแล้ว ไม่สามารถทำรายการได้"
	destroy( lds_main )
	destroy( lds_item )		
	throw ithw_exception
end if

// ตรวจสอบข้อมูลการเปิดลิ้นชัก
this.of_is_open_teller( ls_coopid, ls_entryid, ldtm_entrydate )

// ตรวจสอบการกรอกข้อมูล
this.of_chkslip_completefill( lds_main, lds_item )

// ตรวจสอบการป้อนข้อมูล

// ตรวจข้อมูลเกี่ยวกับเงินในลิ้นชัก
li_chk	=	this.of_processfinchk( ls_coopid , ls_entryid, ldtm_entrydate, ls_err )

if li_chk <> success then 
	ithw_exception.text	= ls_err
	destroy( lds_main )
	destroy( lds_item )		
	throw ithw_exception
end if

//ตรวจสอบ กรณีเป็นรายการที่รอ ยืนยันไม่ต้องสร้างเลขที่และรายการใหม่  
//li_chkexist	= 0 
//if li_paymentstatus = 8 then li_chkexist = 8

//if li_chkexist = 0 then		
	// สร้างเลขที่ทำรายการ
	ls_slipno = this.of_get_lastslip_docno( ls_slipdocno )
	lds_main.object.slip_no[1]  =  ls_slipno
			
	// สร้างเลขที่ใบเสร็จ / ใบสำคัญจ่าย
	if li_payrecv = 1 then
		ls_receipt 	= this.of_get_lastslip_docno( ls_receiptcode )//"FNRECEIPTNO"
		lds_main.object.receipt_no[1]	= ls_receipt
	else
		ls_payno		=	this.of_get_lastslip_docno( ls_payslipcode )//"FNPAYSLIPNO"
		lds_main.object.payslip_no[1]	= ls_payno
	end if
	
	if isnull( ls_member ) then ls_member = ' '
	if isnull( li_memflag ) then li_memflag = 0
	
	
	lds_main.object.recvpay_id[1]			= ls_receiveid
	lds_main.object.recvpay_time[1]		= ldtm_recvtime
	lds_main.object.pay_towhom[1]		= ls_paywhom
	
	// กำหนด seq_no 
	li_row = lds_item.rowcount()
	for li_index = 1 to li_row	
			lds_item.object.slip_no[li_index]			= ls_slipno
			lds_item.object.coop_id[li_index]			= ls_coopid
			lds_item.object.seq_no[li_index]			= li_index			
	next
	
	lds_main.Accepttext()
	lds_item.Accepttext()
	
	// กำหนดสถานะ datawindow Update ได้
	lds_main.setitemstatus( 1 , 0 , Primary! , NewModified!)
	lds_item.setitemstatus( 1 , 0 , Primary! , NewModified!)
	
	// prepare update data of lds_main
	if lds_main.update() <> 1 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง lds_main " + lds_main.of_geterrormessage()
		rollback using	itr_sqlca ;
		destroy( lds_main )
		destroy( lds_item )		
		throw ithw_exception
	end if
	
	// รายละเอียดการรับ-จ่าย
	if lds_item.update() <> 1 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง lds_item " + lds_item.of_geterrormessage()
		rollback using	itr_sqlca ;
		destroy( lds_main )
		destroy( lds_item )		
		throw ithw_exception
	end if				
		

//ผ่านไปเงินสด
if (ls_cashtype = "CSH" )  and ls_slipno  <> "" then
	
	lstr_slipinfo.slip_no  			= ls_slipno
	lstr_slipinfo.coop_id 			= ls_coopid
	lstr_slipinfo.member_no 		= ls_member
	lstr_slipinfo.description 		= lds_main.object.payment_desc[ 1 ]
	lstr_slipinfo.entry_date 		= ldtm_entrydate
	lstr_slipinfo.from_system 	= lds_main.object.from_system[ 1 ]
	lstr_slipinfo.item_amt 		= ldc_itemamtnet
	lstr_slipinfo.item_status 		= 1
	lstr_slipinfo.sign_flag 			=  li_payrecv
	lstr_slipinfo.recpaytype_code = lds_main.object.ITEMPAYTYPE_CODE[1]
	lstr_slipinfo.tax_amt			= ldc_taxamt

	try
		this.of_postcash( lstr_slipinfo, 1, ls_entryid )
		
	catch ( Exception thb )
		
		rollback using itr_sqlca ;
		destroy( lds_main )
		destroy( lds_item )
		throw thb
	end try		
end if
	
//// บันทึกข้อมูลหักภาษี 
//if (li_taxflag  = 1 and ldc_taxamt > 0 ) and ls_slipno <> '' then
//	try	
//		this.of_posttaxatpay( lds_main , lds_item , as_taxdetail_xml)	
//	catch (Exception thw)
//		rollback using itr_sqlca ;
//		destroy( lds_main )
//		destroy( lds_item )
//		throw thw
//	end try	
//end if 	

commit using itr_sqlca ;


destroy( lds_main )
destroy( lds_item )

return trim(ls_slipno)
end function

private function integer of_is_open_teller (string as_coop_id, string as_entry_id, datetime adtm_entry) throws Exception;integer	li_rc

SELECT	count(*)
INTO		:li_rc
FROM		FINTABLEUSERMASTER  
WHERE		( USER_NAME 		= :as_entry_id ) AND 
			( OPDATEWORK		= :adtm_entry )  and
			( status				= 11 ) and
			( coop_id	= :as_coop_id)
using		itr_sqlca ;

if isnull( li_rc ) then li_rc = 0


if li_rc < 1 then
	ithw_exception.text	= "ไม่่สามารถทำรายการได้ยังไม่ได้เปิดลิ้นชัก หรือได้ปิดไปแล้วของ " + as_entry_id + "  "  + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return success
end function

private function string of_get_lastslip_docno (string as_doccode) throws Exception;
string	ls_slipno 

// รูปแบบเลขที่เอกสาร yypprrrrrr
// yy ปี
// pp prefix
// rrrrrr  running

string ls_coopconctl 
// รหัสคุมสาขาสหกรณ์
ls_coopconctl = is_coopcontrl

if isnull(ls_coopconctl) or isnull(as_doccode) then
   ithw_exception.text	= ls_coopconctl +","+as_doccode
   throw ithw_exception
else
	ls_slipno = inv_docservice.of_getnewdocno( ls_coopconctl ,   as_doccode ) 
end if

return  ls_slipno
end function

private function integer of_processfinchk (string as_coopid, string as_entry_id, datetime adtm_wdate, ref string as_err) throws Exception;integer	li_status
decimal 	ldc_balance


SELECT	AMOUNT_BALANCE  , status
INTO		:ldc_balance , :li_status
FROM		FINTABLEUSERMASTER  
WHERE		( USER_NAME 	= :as_entry_id ) AND
			( OPDATEWORK 	= :adtm_wdate )  and
			( coop_id		= :as_coopid )
using	itr_sqlca ;
                 
if itr_sqlca.sqlcode = 100 then
	as_err	= "ยังไม่ได้เปิดลิ้นชักครับ ไม่สามารถทำรายการได้"   + itr_sqlca.sqlerrtext

elseif itr_sqlca.sqlcode = -1 then
	as_err	= "เกิดข้อผิดพลาดในการ ดึงข้อมูลยอดเงินในลิ้นชัก"   + itr_sqlca.sqlerrtext
end if 

if li_status = 14 then
	as_err	= "ได้ทำการปิดลิ้นชักของวันที่ " + string( adtm_wdate ,"dd/mm/") + string( year(date(adtm_wdate )) - 543 ) + " แล้ว"
end if

//// หากเป็นการจ่ายเงิน
//if ai_flag = -1 then  //ตรวจสอบการจ่ายเงินสดกับเงินคงเหลือในโต๊ะ					  
//	if  ( ldc_balance - adc_amount ) < 0 then
//			as_errtext="เงินในโต๊ะเหลือไม่พอจ่ายคงเหลือจำนวน "+string(ldc_balance,"#,##0.00")+ &
//			"บาท จะจ่ายจำนวน "+string(adc_amount,"#,##0.00")+" บาท"			
//			return 2
//	end if
//end if

return Success
end function

private function integer of_getshrlon (string as_coopid, string as_member, decimal adc_accuint, ref decimal adc_share, ref decimal adc_emer, ref decimal adc_norm, ref decimal adc_extra, ref decimal adc_sharespx) throws Exception;dec{2}	ldc_emer, ldc_norm, ldc_extra
dec{3}	ldc_share
dec{2}	ldc_sharecost, ldc_sharespx, ldc_accuint

//===== SHARE_VALUE เป็น UNITSHARE_VALUE
SELECT UNITSHARE_VALUE
INTO	:ldc_sharecost
FROM		SHSHARETYPE
WHERE SHARETYPE_CODE = '01' 
and 	coop_id = :is_coopcontrl
using		itr_sqlca ;

if isnull( ldc_sharecost ) then	ldc_sharecost = 1

// ทุนเรือนหุ้น
//, sharespx_amt , :ldc_sharespx
SELECT	SHARESTK_AMT
INTO		:ldc_share
FROM		SHSHAREMASTER
WHERE		MEMBER_NO	= :as_member and
			coop_id	= :is_coopcontrl
using		itr_sqlca ;

if isnull( ldc_share ) then ldc_share = 0.00
if isnull( ldc_sharespx ) then ldc_sharespx = 0.00

ldc_share		*=  ldc_sharecost
ldc_sharespx	*=  ldc_sharecost

// ดอกเบี้ยสะสม
SELECT	MBMEMBMASTER.ACCUM_INTEREST  
INTO		:ldc_accuint
FROM		MBMEMBMASTER  
WHERE		( MBMEMBMASTER.MEMBER_NO = :as_member ) AND  
			( MBMEMBMASTER.COOP_ID = :is_coopcontrl ) 
using		itr_sqlca ;


if isnull( ldc_accuint ) then ldc_accuint = 0.00

// ฉุกเฉิน
SELECT 	sum( LNCONTMASTER.PRINCIPAL_BALANCE )  
INTO		:ldc_emer
FROM		LNCONTMASTER, LNLOANTYPE  
WHERE		(	LNCONTMASTER.LOANTYPE_CODE = LNLOANTYPE.LOANTYPE_CODE ) and  
			(	LNCONTMASTER.COOP_ID = LNLOANTYPE.COOP_ID  ) AND
			(	LNCONTMASTER.MEMBER_NO = :as_member ) AND  
			(	LNCONTMASTER.PRINCIPAL_BALANCE > 0 ) AND  
			(	LNCONTMASTER.CONTRACT_STATUS > 0 ) AND  
			( 	LNLOANTYPE.LOANGROUP_CODE = '01' )  AND
			(	LNCONTMASTER.COOP_ID = :is_coopcontrl) 
using		itr_sqlca ;

if isnull( ldc_emer ) then ldc_emer = 0.00

// สามัญ
SELECT 	sum( LNCONTMASTER.PRINCIPAL_BALANCE )  
INTO		:ldc_norm
FROM		LNCONTMASTER, LNLOANTYPE  
WHERE		(	LNCONTMASTER.LOANTYPE_CODE = LNLOANTYPE.LOANTYPE_CODE ) and  
			(	LNCONTMASTER.COOP_ID = LNLOANTYPE.COOP_ID  ) AND
			(	LNCONTMASTER.MEMBER_NO = :as_member ) AND  
			(	LNCONTMASTER.PRINCIPAL_BALANCE > 0 ) AND  
			(	LNCONTMASTER.CONTRACT_STATUS > 0 ) AND  
			( 	LNLOANTYPE.LOANGROUP_CODE = '02' )  AND
			(	LNCONTMASTER.COOP_ID = :is_coopcontrl) 
using		itr_sqlca 	;

if isnull( ldc_norm ) then ldc_norm = 0.00

// พิเศษ
SELECT 	sum( LNCONTMASTER.PRINCIPAL_BALANCE )  
INTO		:ldc_extra
FROM		LNCONTMASTER, LNLOANTYPE  
WHERE		(	LNCONTMASTER.LOANTYPE_CODE = LNLOANTYPE.LOANTYPE_CODE ) and  
			(	LNCONTMASTER.COOP_ID = LNLOANTYPE.COOP_ID  ) AND
			(	LNCONTMASTER.MEMBER_NO = :as_member ) AND  
			(	LNCONTMASTER.PRINCIPAL_BALANCE > 0 ) AND  
			(	LNCONTMASTER.CONTRACT_STATUS > 0 ) AND    
			( 	LNLOANTYPE.LOANGROUP_CODE = '03' )  AND
			(	LNCONTMASTER.COOP_ID = :is_coopcontrl) 
using		itr_sqlca ;

if isnull( ldc_extra ) then ldc_extra = 0.00

adc_share		= ldc_share
adc_emer		= ldc_emer
adc_norm		= ldc_norm
adc_extra		= ldc_extra
adc_sharespx	= ldc_sharespx
adc_accuint		= ldc_accuint

return success
end function

public function integer of_init_chqlistfrom_slip (string as_coopid, datetime adtm_wdate, ref string as_chqcond_xml, ref string as_cutbank_xml, ref string as_chqtype_xml, ref string as_chqlist_xml) throws Exception;/***********************************************
<description>
	ขอ XMLConfig ที่เกี่ยวกับ การพิมพ์เช็คจากใบทำรายการ
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	adtm_wdate				วันที่ทำการ
	as_chqcond_xml		XMLConfig สำหรับเงื่อนไขการพิมพ์เช็ค, ส่งมาเพื่อรับค่ากลับไป.
	as_cutbank_xml		XMLConfig สำหรับตัดบัญชีธนาคาร, ส่งมาเพื่อรับค่ากลับไป.
	as_chqtype_xml		XMLConfig สำหรับประเภทเช็คที่จะพิมพ์, ส่งมาเพื่อรับค่ากลับไป.
	as_chqlist_xml			XMLConfig สำหรับรายการจ่ายเป็นเช็ค, ส่งมาเพื่อรับค่ากลับไป.
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_init_chqlistfrom_slip()
	
	Integer li_return
	String ls_cond_xml, ls_bankcut_xml, ls_chqtype_xml, ls_chqlist_xml , ls_branch
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_init_chqlistfrom_slip( ls_branch,  ldtm_wdate ,  ls_cond_xml, ls_bankcut_xml, ls_chqtype_xml, ls_chqlist_xml )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
</usage>
************************************************/

string		ls_chqdefault
// Impost String XML----------------------------------------------------
n_ds lds_chqlist , lds_cutbank , lds_chqtype , lds_cond

// เงื่อนไขการพิมพ์เช็ค
lds_cond = create n_ds
lds_cond.dataobject = "d_conditionprint_cheque" 
lds_cond.insertrow( 0 )


// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_chequelist_fromslip" 
lds_chqlist.settransobject( itr_sqlca )

lds_chqlist.retrieve( as_coopid,adtm_wdate)

// ตัดยอดบัญชีธนาคาร
lds_cutbank	= create n_ds
lds_cutbank.dataobject = "d_chqprint_cutfrom" 
lds_cutbank.insertrow( 0 )

// ประเภทเช็คทำรายการ
lds_chqtype	= create n_ds
lds_chqtype.dataobject = "d_chqprint_chqtype" 
lds_chqtype.insertrow( 0 )

//------------------------------------------------------------------------
SELECT	CHQTYPE_DEFAULT
INTO		:ls_chqdefault
FROM		FINCONSTANT  
using	itr_sqlca	;

// กำหนดค่า ประเภทเช็ค
if isnull( ls_chqdefault ) then ls_chqdefault = "01"
if ls_chqdefault <> "" then
	lds_chqtype.object.as_chqprint_chqtype[1]	= ls_chqdefault
end if

lds_chqtype.object.ai_chqstatus[1] 			= 8
lds_chqtype.object.ai_prndate[1] 				= 1

// กำหนดค่า เงื่อนไขพิมพ์เช็ค
lds_cond.object.adtm_date[1]					= adtm_wdate
lds_cond.object.as_printtype[1]				= "LAS"

// กำหนดค่า ตัดบัญชีธนาคาร
lds_cutbank.object.ai_chqsize[1]				=	1

lds_cond.accepttext( )
lds_chqtype.accepttext( )
lds_cutbank.accepttext( )
lds_chqlist.accepttext( )

as_chqcond_xml		=	lds_cond.describe( "Datawindow.Data.Xml" )
as_cutbank_xml		=	lds_chqtype.describe( "Datawindow.Data.Xml" )
as_chqtype_xml		=	lds_cutbank.describe( "Datawindow.Data.Xml" )
as_chqlist_xml = ""
if lds_chqlist.rowcount( ) > 0 then
	as_chqlist_xml			=	lds_chqlist.describe( "Datawindow.Data.Xml" )
end if

destroy lds_chqlist 
destroy lds_cutbank 
destroy lds_chqtype 
destroy lds_cond

return success
end function

public function integer of_retrievechqfromslip (string as_coopid, datetime adtm_wdate, ref string as_chqlist_xml) throws Exception;n_ds lds_chqlist

// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_chequelist_fromslip" 
lds_chqlist.settransobject( itr_sqlca )

lds_chqlist.retrieve( as_coopid,adtm_wdate)

as_chqlist_xml	 = ""
if lds_chqlist.rowcount( ) > 0 then
	as_chqlist_xml	 = lds_chqlist.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_chqlist ) 

return success
end function

public function integer of_init_chqnoandbank (string as_coopid, string as_bank, string as_bankbranch, string as_chqbookno, ref string as_accno, ref string as_startchqno) throws Exception;// ดึงข้อมูลเลขที่เช็คเริ่มต้นตาม ธนาคาร สาขา และ เล่มเช็ค
string		ls_chqno  , ls_accno
integer	li_chqcount

if ( as_bank <> "" ) and ( as_bankbranch <> "" ) then
	SELECT	ACCOUNT_NO  
	INTO		:ls_accno
	FROM		FINBANKACCOUNT  
	WHERE	( BANK_CODE				= :as_bank ) AND  
				( BANKBRANCH_CODE		= :as_bankbranch ) AND  
				( ACCOUNT_TYPE			= '01' )   and
				( coop_id			= :as_coopid )
	using itr_sqlca ;
	
	if isnull( ls_accno ) then ls_accno = ""
	
	if ls_accno <> "" then
		as_accno 	= ls_accno
	end if

end if

// หากไม่สามารถหาได้
if ( as_bank = "" ) or ( as_bankbranch = "" ) or ( as_chqbookno = "" ) then
	return success
end if


SELECT min( cheque_no)  , count( cheque_no )
INTO		:ls_chqno, :li_chqcount
FROM		FINCHQEUESTATEMENT
WHERE 	( CHEQUEBOOK_NO		= :as_chqbookno ) AND  
			( BANK_CODE 			= :as_bank ) AND  
			( BANK_BRANCH		= :as_bankbranch ) AND  
			( COOP_ID	= :as_coopid ) AND  
			( USE_STATUS 		= 0 )  
using itr_sqlca ;

if itr_sqlca.sqlcode = -1 then
	ithw_exception.text	= "ไม่สามารถหาลำดับเช็คเริ่มต้นได้"
	throw ithw_exception
end if

if isnull( li_chqcount ) then li_chqcount = 0
if isnull( ls_chqno ) then ls_chqno = ""
ls_chqno	= trim( ls_chqno )

as_startchqno	= ls_chqno

return success
end function

private function integer of_updatetofrom_accid (string as_coopid, datetime adtm_wdate, datetime adtm_chqdate, string as_refslipno, string as_tofromaccid, string as_fromsystem, integer ai_index) throws Exception;string	ls_deptaccount_no
integer	li_transec_no , li_upper , li_index
string	ls_slip[] , ls_refslip_no
inv_string.of_parsetoarray( as_refslipno, ',', ls_slip[] )


li_upper		= upperbound( ls_slip ) 

for li_index = 1 to li_upper
	ls_refslip_no = ls_slip[li_index]
	
	if isnull( as_fromsystem ) or as_fromsystem = "" then
		select from_system
		into :as_fromsystem
		from finslip
		where slip_no = :ls_refslip_no
		using itr_sqlca ;
		
		if	itr_sqlca.sqlcode <> 0 then
			destroy( idc_printchq )
			ithw_exception.text	= "ไม่สามารถหาชื่อระบบที่ทำรายการ "  
			rollback using itr_sqlca ;
			throw ithw_exception	
		end if

	end if
	
		choose case as_fromsystem		
				case "DEP"			
					li_transec_no	= 0
					select	transec_no, deptaccount_no
					into		:li_transec_no, :ls_deptaccount_no
					from		dpdeptslip
					where		deptslip_no		= :ls_refslip_no and
								coop_id	= :as_coopid 
					using itr_sqlca ;
					
					if isnull( li_transec_no ) then li_transec_no = 0
					if ( li_transec_no  > 0 ) then
						update	dpdeptslip
						set		tofrom_accid	= :as_tofromaccid
						where		transec_no		= :li_transec_no and
									cash_type		= 'CHQ' and
									deptaccount_no = :ls_deptaccount_no and
									entry_date		= :adtm_wdate and
									coop_id	= :as_coopid 
						using itr_sqlca ;
					end if
					
					update	dpdeptslip
					set		tofrom_accid	= :as_tofromaccid
					where		deptslip_no		= :ls_refslip_no and
								coop_id	= :as_coopid 
					using itr_sqlca ;
					
				case "LON"
					UPDATE	SLSLIPPAYOUT  
					SET		TOFROM_ACCID		= :as_tofromaccid  
					WHERE		( PAYOUTSLIP_NO	= :ls_refslip_no ) AND  
								( coop_id			= :as_coopid )   
					using itr_sqlca ;
					
//					select	sliplwd_no
//					into		:ls_refslip_no
//					from		cmloanreceive
//					WHERE		( LOANRECEIVE_NO	= :ls_refslip_no ) AND  
//								( BRANCH_ID			= :as_coopid )   
//					using itr_sqlca ;
					
//					UPDATE	cmshrlonslip  
//					SET		tofrom_accid		= :as_tofromaccid  
//					WHERE		( slip_no			= :ls_refslip_no ) AND  
//								( BRANCH_ID			= :as_branch )   
//					using itr_sqlca ;
					
				case "SHR"
					UPDATE	SLSLIPPAYOUT
					SET		TOFROM_ACCID		= :as_tofromaccid  
					WHERE		( PAYOUTSLIP_NO	= :ls_refslip_no ) AND  
								( COOP_ID			= :as_coopid )   
					using itr_sqlca ;
					
//					select	slipswd_no
//					into		:ls_refslip_no
//					from		CMSHRWITHDRAW
//					WHERE		( SHRWITHDRAW_NO	= :ls_refslip_no ) AND  
//								( BRANCH_ID			= :as_branch )   
//					using itr_sqlca ;
//					
//					UPDATE	cmshrlonslip  
//					SET		tofrom_accid		= :as_tofromaccid  
//					WHERE		( slip_no			= :ls_refslip_no ) AND  
//								( BRANCH_ID			= :as_branch )   
//					using itr_sqlca ;
					
//				case "SHL"
//					UPDATE	CMSHRLONSLIP
//					SET		TOFROM_ACCID	= :as_tofromaccid  
//					WHERE		( SLIP_NO		= :ls_refslip_no ) AND  
//								( BRANCH_ID		= :as_branch  )   
//					using itr_sqlca ;
		
				case "FIN", "AST"
		//			as_refslipno	= trim( ads_chqlist.object.slip_no[ai_index] )
					UPDATE	FINSLIP  
					SET		TOFROM_ACCID			= :as_tofromaccid,
								receive_status				= 1,
								receive_date				= :adtm_chqdate
					WHERE		( SLIP_NO				= :ls_refslip_no ) AND  
								( COOP_ID		= :as_coopid )
					using itr_sqlca ;
					
//				case "INV"
//					UPDATE	IVLOANRECEIVE  
//					SET		TOFROM_ACCID		= :as_tofromaccid  
//					WHERE		( LOANRECEIVE_NO	= :ls_refslip_no ) AND  
//								( BRANCH_ID			= :as_branch )   
//					using itr_sqlca ;
					
		//			select	slipswd_no
		//			into		:ls_refslip_no
		//			from		IVSHRWITHDRAW
		//			WHERE		( SHRWITHDRAW_NO	= :ls_refslip_no ) AND  
		//						( BRANCH_ID			= :as_branch )   
		//			;
					
//					UPDATE	ivshrlonslip  
//					SET		tofrom_accid		= :as_tofromaccid  
//					WHERE		( slip_no			= :ls_refslip_no ) AND  
//								( BRANCH_ID			= :as_branch )   
//					using itr_sqlca ;
					
//				case "PRM"
//					update	pmdeptslip
//					set		tofrom_accid	= :as_tofromaccid
//					where		deptslip_no		= :ls_refslip_no and
//								branch_origin	= :as_branch 
//					using itr_sqlca ;						
			end choose
	
			if itr_sqlca.sqlcode <> 0 then
				destroy( idc_printchq )
				ithw_exception.text	= "ไม่สามารถปรับปรุงรหัสคู่บัญชี ของรายการที่ออกเช็คได้ "  + itr_sqlca.sqlerrtext
				rollback using itr_sqlca ;
				throw ithw_exception		
			end if	
			
		as_fromsystem = ""
next 


	return success
end function

private function integer of_postbridgechq (string as_coopid, string as_referslip, string as_bank, string as_bankbranch, string as_chqbookno, string as_chqno, integer ai_seqno) throws Exception;string		ls_slip[], ls_referslipno  , ls_bridgeche_no 
integer		li_upper, li_index, li_row

inv_string.of_parsetoarray( as_referslip, ',', ls_slip[] )

li_upper		= upperbound( ls_slip ) 

select max( bridgechq_no ) 
into :ls_bridgeche_no
from finbridgechq
where	coop_id = :as_coopid
using itr_sqlca ;

if isnull(ls_bridgeche_no) then	
	ls_bridgeche_no = "" 
end if

if itr_sqlca.sqlcode <>  0 or ls_bridgeche_no = "" then
	ls_bridgeche_no = "0000000000" 	
end if


for li_index = 1 to li_upper
	ls_referslipno	= ls_slip[ li_index ]
	
	// insert finbridgechq  ----------------------------------------------- // by Phai 
	// บันทึกข้อมูล Table finbridgechq เป็น Table เชื่อมรายการ slip กับ Cheque
	//-----------------------------------------------------------------------
	
	ls_bridgeche_no = right( "0000000000"  + string( long(ls_bridgeche_no)+1 ) , 10 ) 
	
	INSERT INTO FINBRIDGECHQ  
         ( 			BRIDGECHQ_NO,              	SLIP_NO,              		CHEQUEBOOK_NO,              	BANK_CODE,   
           			BANK_BRANCH,              	CHEQUE_NO,              	SEQ_NO ,							COOP_ID , 		BRIDGE_STATUS  )  
  	VALUES ( 	:ls_bridgeche_no		, 		:ls_referslipno	,			:as_chqbookno		,				:as_bank		,
	  			 	:as_bankbranch	,			:as_chqno	,				:ai_seqno ,							:as_coopid					, 1)
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึก ข้อมูลได้ ลง finbridgechq  " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception	
	end if
	
	//-----------------------------------------------------------------------
	
	
next

return Success
end function

public function integer of_posttobank (string as_coopid, string as_entryid, datetime adtm_wdate, string as_machine, integer ai_seqno) throws Exception;n_ds	lds_data
long	ll_row 

dec{2}	ldc_itemamt
string		ls_bank,ls_bankbranch, ls_accid
long		ll_waycut 

lds_data = create n_ds
lds_data.dataobject = "d_fin_posttobank_list" 
lds_data.settransobject( itr_sqlca )

lds_data.retrieve( as_coopid,adtm_wdate )
lds_data.setfilter( "seq_no = "+ string( ai_seqno)  )
lds_data.filter( )


ll_row  = lds_data.rowcount()

if ll_row < 1 then return success 

ldc_itemamt  	= lds_data.object.item_amt[1] 
ls_accid			= lds_data.object.account_id[1] 
ll_waycut			= lds_data.object.item_flag[1] 

// ผ่านรายการธนาคาร
this.of_posttobank( as_coopid ,as_entryid , adtm_wdate , as_machine ,ls_accid , ldc_itemamt ,ll_waycut  )

update finitemposttobank
set		post_flag = 1
where entry_date = :adtm_wdate
and	coop_id = :as_coopid
and	seq_no = :ai_seqno
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูล Finitemposttobank " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;
return success
end function

private function integer of_posttobank (string as_coopid, string as_entry_id, datetime adtm_wdate, string as_machine, string as_bankaccno, string as_bank, string as_bankbranch, decimal adc_itemamt, integer ai_waycut) throws Exception;
// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
dec{2}	ldc_scobal
string	ls_account_type, ls_slipbankno, ls_year, ls_account_name, ls_book_no
string ls_item_code , ls_item_desc
long		ll_laststm_seq
datetime	ldtm_open_date
integer	li_chk

select	SCO_BALANCE, laststm_seq, account_type, open_date, account_name, book_no
into		:ldc_scobal, :ll_laststm_seq, :ls_account_type, :ldtm_open_date, :ls_account_name, :ls_book_no
from		FINBANKACCOUNT
WHERE		(	ACCOUNT_NO			= :as_bankaccno ) AND  
			(	BANK_CODE			= :as_bank ) AND  
			( 	BANKBRANCH_CODE	= :as_bankbranch  ) and
			( COOP_ID		= :as_coopid )
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	="ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT "+ itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception	
end if

if isnull( ldc_scobal )	then ldc_scobal = 0			
if isnull( ll_laststm_seq )	then ll_laststm_seq = 0		

if ai_waycut > 0 then
	ls_item_code	= "DCA"
	ls_item_desc	= "ฝากเงิน"
else
	ls_item_code	= "WCA"
	ls_item_desc	= "ถอนเงิน"
end if

ldc_scobal		= ldc_scobal + ( adc_itemamt * ai_waycut )
ll_laststm_seq	+= 1

ls_slipbankno 	= this.of_get_lastslip_docno( "FNRECEIPTBANK")

INSERT INTO FINSLIP_BANK  
(	SLIP_NO,					ENTRY_ID,					ENTRY_DATE,				OPERATE_DATE,
	COOP_ID,		MACHINE_ID,				ACCOUNT_NO,				BANK_CODE,
	BANK_BRANCH,			ACCOUNT_NAME,			OPEN_DATE,				LAST_STM,
	ITEM_AMT,				BALANCE,					WITHDRAW_AMT,			ITEM_CODE,
	BOOK_NO,				ACCOUNT_TYPE 
)  
VALUES
(	:ls_slipbankno,			:as_entry_id,				:adtm_wdate,				:adtm_wdate,
	:as_coopid,				:as_machine,				:as_bankaccno,				:as_bank,
	:as_bankbranch,		:ls_account_name,		:ldtm_open_date,			:ll_laststm_seq,
	:adc_itemamt,		:ldc_scobal,					:ldc_scobal,					:ls_item_code,
	:ls_book_no,			:ls_account_type
)  using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINSLIP_BANK "  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca  ;
	throw ithw_exception
end if

INSERT INTO	FINBANKSTATEMENT
(		SEQ_NO,						ACCOUNT_NO,						BANK_CODE,
		BANKBRANCH_CODE,		DETAIL_DESC,						ENTRY_ID,
		ENTRY_DATE,				OPERATE_DATE,					REF_SEQ,
		ITEM_STATUS,				CANCEL_ID,							CANCEL_DATE,
		BALANCE,					BALANCE_BEGIN,					MACHINE_ID,
		COOP_ID,			refer_slipno,						item_amt,
		sign_operate
)
VALUES
( 		:ll_laststm_seq,			:as_bankaccno,					:as_bank,
		:as_bankbranch,			:ls_item_desc,						:as_entry_id,
		:adtm_wdate,				:adtm_wdate,					null,
		1,								null,								null,
		:ldc_scobal,					0,									:as_machine,
		:as_coopid,					:ls_slipbankno,					:adc_itemamt ,
		:ai_waycut
) using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKSTATEMENT "  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca  ;
	throw ithw_exception
end if

UPDATE	FINBANKACCOUNT
SET		SCO_BALANCE			= :ldc_scobal,
			laststm_seq				= :ll_laststm_seq
WHERE	( ACCOUNT_NO		= :as_bankaccno ) AND  
			( BANK_CODE			= :as_bank ) AND  
			( BANKBRANCH_CODE	= :as_bankbranch  ) and
			( COOP_ID	= :as_coopid )
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKACCOUNT "+ itr_sqlca.sqlerrtext
	rollback using itr_sqlca  ;
	throw ithw_exception
end if


return Success
end function

public function integer of_postpaychq_split (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_cond_xml, string as_bankcut_xml, string as_chqtype_xml, string as_chqlist_xml, string as_chqsplit_xml, string as_formset) throws Exception;/***********************************************
<description>
	ทำรายการพิมพ์เช็คหลายใบจาก 1 สลิป และทำรายการบันทึกเช็ค 
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการพิมพ์เช็ค
	adtm_wdate				วันที่ทำการ
	as_machine				ชื่อเครื่องที่ทำรายการ
	as_cond_xml			เงื่อนไขการพิมพ์เช็ค
	as_bankcut_xml		เลขที่บัญชีธนาคารที่ตัดออก
	as_chqtype_xml		ประเภทเช็คที่จะพิมพ์
	as_chqlist_xml			รายการจ่ายเป็นเช็ค ที่เลือกทำการพิมพ์
	as_chqsplit_xml		รายการสั่งจ่ายเช็ค
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postpaychq_split()
	
	Integer li_return
	String ls_cond_xml, ls_bankcut_xml, ls_chqtype_xml, ls_chqlist_xml , ls_chqsplit_xml  , ls_branch , ls_entry , ls_machine
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postpaychq_split( ls_branch, ls_entry , ldtm_wdate , ls_machine , ls_cond_xml, ls_bankcut_xml, ls_chqtype_xml, ls_chqlist_xml , ls_chqsplit_xml)
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
</usage>
************************************************/


integer		li_rc, li_chqsize, li_chk, li_printdate
integer		li_row, li_index, li_print, li_seq  , li_chqstatus 
string		ls_bankbranch, ls_chqbookno, ls_bank, ls_chqno, ls_coopid, ls_printtype , ls_accno
string		ls_chqtype 

// Impost String XML----------------------------------------------------
n_ds lds_chqlist , lds_main , lds_chqsplit , lds_cond  , lds_chqtype , lds_bankcut , lds_printchq

// เงื่อนไขการพิมพ์เช็ค
lds_cond	= create n_ds
lds_cond.dataobject = "d_conditionprint_cheque"

if not isnull( as_cond_xml ) and trim( as_cond_xml ) <> "" then
	this.of_importstring_xml( lds_cond , as_cond_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

// บัญชีธนาคาร
lds_bankcut = create n_ds
lds_bankcut.dataobject = "d_chqprint_cutfrom"

if not isnull( as_bankcut_xml ) and trim( as_bankcut_xml ) <> "" then
	this.of_importstring_xml( lds_bankcut , as_bankcut_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเลือกทำรายการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

// ประเภทเช็ค
lds_chqtype = create n_ds
lds_chqtype.dataobject = "d_chqprint_chqtype"

if not isnull( as_chqtype_xml ) and trim( as_chqtype_xml ) <> "" then
	this.of_importstring_xml( lds_chqtype , as_chqtype_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเลือกทำรายการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

// รายการจ่ายเช็ค
lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_chequelist_fromslip_split" 
lds_chqlist.settransobject( itr_sqlca )

if not isnull( as_chqlist_xml ) and trim( as_chqlist_xml ) <> "" then
	this.of_importstring_xml( lds_chqlist , as_chqlist_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเลือกทำรายการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

// รายการพิมพ์เช็ค
lds_chqsplit = create n_ds
lds_chqsplit.dataobject = "d_change_splitchq"


if not isnull( as_chqsplit_xml ) and trim( as_chqsplit_xml ) <> "" then
	this.of_importstring_xml( lds_chqsplit , as_chqsplit_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเลือกทำรายการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_printchq = create n_ds
lds_printchq.dataobject = "d_cheque_printformat" 

//-------------------------------------------------------------------------

// ตรวจสอบการกรอกข้อมูลพิมพ์เช็ค
li_rc	= this.of_chkchqfullfill(as_coopid , lds_chqsplit , lds_chqlist  )

//li_rc	= this.of_preparechq( )
//if li_rc = -1 then return -1

li_row	=	lds_cond.rowcount()

ls_bankbranch	= trim( lds_cond.object.as_bankbranch[1] )
ls_chqbookno	= trim( lds_cond.object.as_chqbookno[1] )
ls_bank			= trim( lds_cond.object.as_bank[1] )
ls_printtype		= trim( lds_cond.object.as_printtype[1] )
li_chk				= 0

li_row	=	lds_bankcut.rowcount()
li_chqsize		= lds_bankcut.object.ai_chqsize[1]
ls_accno			= lds_bankcut.object.as_fromaccno[1]

li_row	=	lds_chqtype.rowcount()
ls_chqtype		= lds_chqtype.object.as_chqprint_chqtype[1]
li_chqstatus		= lds_chqtype.object.ai_chqstatus[1]
li_printdate		= lds_chqtype.object.ai_prndate[1] 
if isnull( li_printdate ) then li_printdate = 1

// บันทึกรายการพิมพas_branch์เช็ค
this.of_postpaychqstm_split(  as_coopid , as_entry , as_machine , adtm_wdate , ls_accno , ls_chqtype , li_chqstatus , lds_cond, lds_chqlist , lds_chqsplit )

//// ทำการระบุตำแหน่งเพื่อทำการพิมพ์
this.of_setchqposition( lds_printchq,as_coopid, ls_bank, li_chqsize , ls_printtype , li_printdate , 0 )

li_row	= idc_printchq.rowcount( )

for li_index = 1 to li_row
	li_print		= idc_printchq.object.printed_status[li_index]
	
	if isnull( li_print ) then li_print = 0
	
	if li_print = 0 then continue
	
	li_chk ++
	
	ls_chqno		= idc_printchq.object.CHEQUE_NO[li_index]
	li_seq			= idc_printchq.object.SEQ_NO[li_index]
	
	// ทำการระบุรายละเอียดลงบนเช็ค
 	this.of_settolebelchq( lds_printchq,ls_chqno, ls_chqbookno,  ls_bank, ls_bankbranch, li_seq, li_printdate , 0 , 0)

	// ทำการพิมพ์เช็คผ่าน PrintService
	inv_print_srv.of_print( lds_printchq , "PRINTCHQ" , as_formset )

	
//	// พิมพ์ใบเสร็จ
//	li_rc		= this.of_startprintreceipt( ii_selected )	
//	li_rc		= dw_list.update( )
//	
//	if li_rc <> 1 then
//		destroy idc_printchq
//		rollback;
//		return -1
//	end if
	
//	commit;
	
next

commit using itr_sqlca ;

destroy lds_chqlist 
destroy lds_main 
destroy lds_chqsplit 
destroy lds_cond  
destroy lds_chqtype 
destroy lds_bankcut 
destroy lds_printchq
 
return success
end function

public function integer of_postprintpreviewchq (string as_coopid, string as_bank, integer ai_chqsize, string as_prnttype, string as_formset) throws Exception;n_ds lds_printchq

lds_printchq = create n_ds
lds_printchq.dataobject = "d_cheque_printformat"

//// ทำการระบุตำแหน่งเพื่อทำการพิมพ์
this.of_setchqposition( lds_printchq,as_coopid, as_bank, ai_chqsize , as_prnttype , 1  , 0)

if lds_printchq.rowcount() < 1 then lds_printchq.insertrow(0)

lds_printchq.object.headdate[1]				= "DD MMMM YYYY"
lds_printchq.object.headname[1]			= "ชื่อต้นสมาชิก"
lds_printchq.object.headsname[1]			= "ชื่อสกุลสมาชิก"
//lds_printchq.object.headamt[1]				= right( "*****************" + "1,234,567,899.33" , 17)
lds_printchq.object.headamt[1]				= "***" + "1,234,567,899.33"  + "***" // by Phai
lds_printchq.object.remark[1]					= "หมายเหตุ"
lds_printchq.object.detaildate[1]			= "D D M M Y Y Y Y"
lds_printchq.object.payname[1]				= "จ่าหน้าเช็ค สั่งจ่าย"
lds_printchq.object.killer[1]					= "///////////////"
lds_printchq.object.moneythai[1]			= "*** หนึ่งพันสองร้อยสามสิบสี่ล้านห้าแสนหกหมื่นเจ็ดพันแปดร้อยเก้าสิบเก้าบาทสามสิบสามสตางค์ ***"
//lds_printchq.object.moneynumberic[1]	= right( "*****************" + "1,234,567,899.33" , 17)
lds_printchq.object.moneynumberic[1]	= "***" + "1,234,567,899.33" + "***" // by Phai


// ทำการพิมพ์เช็คผ่าน PrintService
inv_print_srv.of_print( lds_printchq , "PRINTCHQ" , as_formset )

return success
end function

public function integer of_postpaychq_apvloancbt (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_main_xml, string as_payoutslip, string as_formset) throws Exception;/***********************************************
<description>
	ทำการบันทึกข้อมูลการพิมพ์ 1 ใบ จากหลายสลิป และทำการพิมพ์เช็คจ่ายออก
</description>

<arguments>
	as_branch			รหัสสาขาสหกรณ์
	as_entry				รหัสผู้ใช้ ที่ทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_machine			ชื่อเครื่องทีทำรายการ
	as_main_xml		ข้อมูลเงื่อนไขการพิมพ์ 
	as_chqlist_xml		ข้อมูลรายการจ่ายเช็ค
	as_formset			ฟอร์มเซตในการพิมพ์เช็ค
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postpaychq()
	
	Integer li_return 
	String ls_branch , ls_entry , ls_machine , ls_main_xml , ls_chqllist_xml
	datetime		ldtm_wdate
	
	li_return = lnv_finservice.of_postpaychq( ls_branch , ls_entry , ldtm_wdate , ls_machine , ls_main_xml , ls_chqllist_xml  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 02/10/2010 by PhaiWaan
	Version 1.1 ส่งค่าให้ PrintService ทำการพิมพ์เช็ค Modified Date 17/10/2010 by PhaiWaan
</usage>
************************************************/


// กรณีจ่ายเป็นเช็ค
string	ls_chqno, ls_bankcode, ls_bankbranch, ls_paywhom, ls_chequetype , ls_tofromaccid
string	ls_chqbookno, ls_frombranch, ls_fromacc, ls_frombank , ls_referslip , ls_from_system
integer	li_chequestatus, li_chqsize
string	  ls_member, ls_cashtype, ls_err, ls_chqno_next, ls_remark
dec{2}	ldc_itemamt
datetime	ldtm_onchq
integer	li_used, li_remain, li_available, li_seqno, li_index, li_apv, li_row, li_rc
boolean	lb_adv
string	ls_printtype
string	 	ls_payoutslip_no[]

datawindowchild	ldwc_chequeno
// Impost String XML----------------------------------------------------
n_ds lds_chqlist , lds_main ,lds_printchq

// เงื่อนไขการพิมพ์เช็ค
lds_main = create n_ds
lds_main.dataobject = "d_pay_cheque" 

// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_chequelist_apvloan_cbt_service" 
lds_chqlist.settrans( itr_sqlca ) 

inv_string.of_parsetoarray( as_payoutslip, ',', ls_payoutslip_no[] )

li_row = lds_chqlist.retrieve( adtm_wdate , as_coopid , ls_payoutslip_no )
if( li_row  < 1 ) then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลทำรายการได้ ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_main , as_main_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

//if not isnull( as_chqlist_xml ) and trim( as_chqlist_xml ) <> "" then
//	this.of_importstring_xml( lds_chqlist , as_chqlist_xml )
//else
//	ithw_exception.text	= "ไม่มีข้อมูลเลือกทำรายการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
//	throw ithw_exception
//end if

lds_printchq = create n_ds
lds_printchq.dataobject = "d_cheque_printformat" 

//if not isvalid( idc_printchq ) then
	idc_printchq		= create n_ds
	idc_printchq.dataobject	= "d_chequelist_forprint"
	idc_printchq.settransobject( itr_sqlca )
//else
//	idc_printchq.reset( )
//end if


//-------------------------------------------------------------------------

//lds_main.getchild( "account_no" , ldwc_chequeno ) 
//ldwc_chequeno.settransobject( itr_sqlca )
//ldwc_chequeno.retrieve( )
//li_rc = ldwc_chequeno.rowcount( )

ldc_itemamt			= lds_main.object.cheque_amt[1]
ls_chqno				= trim( lds_main.object.account_no[1] )
ls_bankcode			= lds_main.object.bank_code[1]
ls_bankbranch		= trim(lds_main.object.bank_branch[1])
ls_chqbookno		= trim( lds_main.object.cheque_bookno[1] )
ldtm_onchq			= lds_main.object.cheque_date[1]
ls_paywhom			= trim( lds_main.object.pay_whom[1] )
li_chequestatus		= lds_main.object.cheque_status[1]
ls_remark			= trim( lds_main.object.remark[1] )
ls_fromacc			= trim( lds_main.object.fromaccount_no[1] )
ls_frombranch		= trim( lds_main.object.frombranch[1] )
ls_frombank			= trim( lds_main.object.frombank[1] )
ls_chequetype		= trim( lds_main.object.cheque_type[1] )
//ls_chqno_next		= f_increment_alfanumeric( ls_chqno, 1 )
ls_err				= ""
li_index				= 0

if isnull( ls_chequetype ) or ls_chequetype = "" then ls_chequetype = ""
if isnull( ls_chqno ) or ls_chqno = "" then ls_chqno = ""
if isnull( ls_bankcode ) or ls_bankcode = "" then ls_bankcode = ""
if isnull( ls_chqbookno ) or ls_chqbookno = "" then ls_chqbookno = ""
if isnull( ls_bankbranch ) or ls_bankbranch = "" then ls_bankbranch = ""
if isnull( ldc_itemamt ) or ldc_itemamt = 0 then ldc_itemamt = 0
if isnull( ls_paywhom ) or ls_paywhom ="" then ls_paywhom =""
if isnull( ls_remark ) or ls_remark ="" then ls_remark =""
if isnull( ldtm_onchq ) or string( ldtm_onchq , 'yyyy/mm/dd' ) = '1900/01/01' then setnull( ldtm_onchq )

if ls_chqno = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'เลขที่เช็ค~r~n'
end if

if ls_bankcode = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'ธนาคาร~r~n'
end if

if ls_bankbranch = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'สาขาธนาคาร~r~n'
end if

if ls_chqbookno = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'เลขที่เล่มเช็ค~r~n'
end if

if ls_paywhom =""  then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'สั่งจ่ายเช็ค~r~n'
end if

if isnull( ldtm_onchq ) then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'วันที่หน้าเช็ค~r~n'
end if

if ls_chequetype = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'ประเภทเช็ค~r~n'
end if

if ldc_itemamt = 0 then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'จำนวนเงินที่จ่าย~r~n'
end if


if len( ls_err ) > 0 then
	ithw_exception.text	= "ป้อนข้อมูลที่จะทำการจ่าย ไม่สมบูรณ์ กรุณาตรวจสอบ~r~n" + ls_err 
	throw ithw_exception	
end if


if isnull( ls_fromacc ) then ls_fromacc = ""
if isnull( ls_frombranch ) then ls_frombranch = ""
if isnull( ls_frombank ) then ls_frombank = ""
if isnull( li_chequestatus ) then li_chequestatus = 1// ถ้าค่าที่ได้เป็นค่า null ถือว่าเช็คฉบับนั้นตัดยอดแล้ว

li_index		= 0
ls_err			= ""

if ls_fromacc = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'เลขที่บัญชี~r~n'
end if

if ls_frombranch = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'สาขาธนาคาร~r~n'
end if

if ls_frombank = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'ธนาคาร~r~n'
end if

if len( ls_err ) > 0 then
	ithw_exception.text	= "ป้อนข้อมูลที่จะทำการตัดเงินออก ไม่สมบูรณ์ กรุณาตรวจสอบ~r~n" + ls_err 
	throw ithw_exception	
end if

select	account_id
into		:ls_tofromaccid
from		FINBANKACCOUNT
WHERE		(	ACCOUNT_NO= :ls_fromacc ) AND  
			(	BANK_CODE			= :ls_frombank ) AND  
			( 	BANKBRANCH_CODE	= :ls_frombranch  ) and
			( COOP_ID		= :as_coopid )
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT เพื่อปรับปรุงรหัสคู่บัญชี " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// กำหนดค่าให้กับ slip 
ls_referslip = this.of_setchqlistdetailslip_apvloancbt(as_coopid, as_entry , adtm_wdate  , as_machine ,  lds_main , lds_chqlist )


//// บันทึกข้อมูล คู่บัญชีให้กับ slip ของแต่ละ ระบบที่จ่ายเช็ค
//this.of_updatetofrom_accid( as_branch, adtm_wdate , ldtm_onchq , ls_referslip , ls_tofromaccid , ""  , li_index)
	
// ทำการตัดจ่ายยอดเงินในธนาคารที่ได้จ่ายเช็ค
// ต้องทำการตรวจเช็คก่อนว่ามียอดเงินพอที่จะทำการตัดจ่ายหรือไม่		
// หาลำดับสูงสุดของของเลขที่เช็คธนาคารสาขานั้นๆ
//ldwc_chequeno.setfilter("cheque_no='" +ls_chqno + "' and chequebook_no = '" +ls_chqbookno+  "' and bank_code = '" +ls_bankcode+ "' and bank_branch  = '" +ls_bankbranch+ "'" )
//ldwc_chequeno.filter( )

// ตรวจสอบการดึงข้อมูลสำหรับการพิมพ์เช็ค
li_row			= idc_printchq.retrieve(as_coopid, ls_bankcode, ls_bankbranch, ls_chqbookno, ls_chqno )

if li_row < 1 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก finshqeuestatement เพื่อเตรียมพิมพ์เช็ค" + itr_sqlca.sqlerrtext
	throw ithw_exception

end if

//li_row		= ldwc_chequeno.getrow( )
//if li_row	< 1 then
//	destroy( idc_printchq )
//	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จากเลขที่เช็ค กรุณาตรวจสอบ" + itr_sqlca.sqlerrtext
//	throw ithw_exception
//end if

li_seqno	= idc_printchq.getitemnumber( 1, "seq_no" )


update	finchqeuestatement
set		DATE_ONCHQ		= :ldtm_onchq ,
		ENTRY_ID			= :as_entry,
		ENTRY_DATE		= :adtm_wdate,
		TO_WHOM			= :ls_paywhom,
		TYPECHQ_PAY		= 0,
		MONEY_AMT		= :ldc_itemamt,
		CHQEUE_STATUS	= :li_chequestatus,
		ADVANCE_CHQ		= :li_apv,
		MACHINE_ID		= :as_machine,
		MEMBER_NO		= :ls_member,
		from_bankaccno	= :ls_fromacc,
		refer_slipno			= :ls_referslip,
		cheque_type		= :ls_chequetype ,
		printed_status		= 1,
		USE_STATUS		= 1,
		remark				= :ls_remark
where	( CHEQUE_NO		= :ls_chqno ) and
		( CHEQUEBOOK_NO	= :ls_chqbookno ) and
		( BANK_CODE			= :ls_bankcode ) and 
		( BANK_BRANCH		= :ls_bankbranch ) and
		( SEQ_NO				= :li_seqno ) and
		( coop_id		= :as_coopid ) and
		( chqeue_status		<> -9 )
using itr_sqlca ;
				

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception	
end if



select	chqslip_used, chqslip_remain
into		:li_used, :li_remain
from		finchequemas
where		( chequebook_no	= :ls_chqbookno ) and
			( bank_code		= :ls_bankcode ) and
			( bank_branch		= :ls_bankbranch ) and
			( coop_id	= :as_coopid )
using itr_sqlca ;

if isnull( li_used ) then li_used= 0
if isnull( li_remain ) then li_remain= 0

li_used ++
li_remain --
li_available	= 1

if li_remain < 1 then
	li_available		= 0
	li_remain		= 0
end if


// ทำการปรัปรุงค่าเช็คที่ได้ใช้ไป
update	finchequemas
set		chqslip_used		= :li_used,
		chqslip_remain		= :li_remain,
		available_flag		= :li_available,
		last_chqno			= :ls_chqno
where( chequebook_no	= :ls_chqbookno ) and
		( bank_code			= :ls_bankcode ) and
		( bank_branch		= :ls_bankbranch ) and
		( coop_id	= :as_coopid ) 
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchequemas "  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception	
end if


//if ( li_chequestatus = 0 ) or ( li_chequestatus = 2 ) then
//	return 1
//end if

// บันทึกข้อมูลลง bridgechq 
this.of_postbridgechq( as_coopid , ls_referslip ,ls_bankcode, ls_bankbranch, ls_chqbookno , ls_chqno , li_seqno )

// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
this.of_posttobank( as_coopid , as_entry , adtm_wdate , as_machine  , ls_fromacc, ls_bankcode, ls_bankbranch, ldc_itemamt , -1)	

// ทำการระบุตำแหน่งเพื่อทำการพิมพ์
li_chqsize	= lds_main.object.chq_size[1]
ls_printtype	= lds_main.object.print_type[1]

//// ทำการระบุตำแหน่งเพื่อทำการพิมพ์
this.of_setchqposition( lds_printchq,as_coopid, ls_bankcode, li_chqsize , ls_printtype , li_chqsize , 0  )

// ทำการระบุรายละเอียดลงบนเช็ค
this.of_settolebelchq( lds_printchq,ls_chqno, ls_chqbookno,  ls_bankcode, ls_bankbranch, li_seqno , 1 ,0 , 0)
	
// ทำการพิมพ์เช็คผ่าน PrintService
if( lds_printchq.rowcount() > 0 ) then
	if( ls_printtype = "DOT") then
		inv_print_srv.of_print( lds_printchq , "PRINTCHQ_DOT" , as_formset )
	else
		inv_print_srv.of_print( lds_printchq , "PRINTCHQ" , as_formset )
	end if
else
	ithw_exception.text	= "ไม่พบข้อมูลในการพิมพ์เช็ค"  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception	
end if

destroy lds_chqlist 
destroy lds_main 
destroy lds_printchq

commit using itr_sqlca ;
return success
end function

public function integer of_retrievecancelchq (string as_coopid, string as_cond_xml, ref string as_chqcancel_xml) throws Exception;n_ds 	lds_data , lds_cond
datetime		ldtm_end , ldtm_start 
string	ls_chq_no , ls_bankbranch , ls_bank , ls_filter
integer li_row

lds_cond  = create n_ds 	
lds_cond.dataobject = "d_search_cancel" 

if not isnull( as_cond_xml ) and trim( as_cond_xml ) <> "" then
	this.of_importstring_xml( lds_cond , as_cond_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการค้นหา ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_data = create n_ds
lds_data.dataobject = "d_cancel_chequelist" 
lds_data.settransobject( itr_sqlca )

ldtm_start 	= lds_cond.object.start_date[1]
ldtm_end 	= lds_cond.object.end_date[1]

li_row = lds_data.retrieve( as_coopid,ldtm_start , ldtm_end  )

ls_chq_no		= trim( lds_cond.object.chq_no[1] )
ls_bank			= trim( lds_cond.object.bank[1] )
ls_bankbranch	= trim( lds_cond.object.branch[1] )
ls_filter	= ""

if not isnull( ls_chq_no ) or ls_chq_no <>  "" then
	ls_filter += " cheque_no = '" + ls_chq_no + "' "
end if

if not isnull( ls_bank ) or ls_bank <>  "" then
	if not isnull(ls_filter) or ls_filter <> "" then  ls_filter += " and "
	ls_filter += " bank_code = '" + ls_bank + "' "
end if

if not isnull( ls_bankbranch ) or ls_bankbranch <>  "" then
	if not isnull(ls_filter) or ls_filter <> "" then  ls_filter += " and "
	ls_filter += " bank_branch = '" + ls_bankbranch + "' "
end if

lds_data.setfilter( ls_filter )
lds_data.filter( )

as_chqcancel_xml	= ""
if lds_data.rowcount( ) > 0 then
	as_chqcancel_xml	= lds_data.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_data ) 

return success
end function

public function integer of_postcancelchq (string as_coopid, datetime adtm_wdate, string as_cancleid, string as_machine, string as_cancellist_xml) throws Exception;string	ls_bank, ls_branch, ls_bankaccno
string	ls_slipno	, ls_docno, ls_year, ls_referslip
string	ls_bankchq, ls_bankbranchchq, ls_chqno, ls_chqbookno
string	ls_fromaccno, ls_frombank, ls_frombranch, ls_cancelid, ls_cancelreson
integer	li_rc, li_chqstatus , li_row , li_chqseqno , li_found , li_act , li_update
dec{2}	ldc_moneyamt

n_ds	lds_data

lds_data = create n_ds
lds_data.dataobject = "d_cancel_chequelist"
lds_data.settransobject( itr_sqlca )

if not isnull( as_cancellist_xml ) and trim( as_cancellist_xml ) <> "" then
	this.of_importstring_xml( lds_data , as_cancellist_xml )
else
	destroy lds_data
	ithw_exception.text	= "ไม่มีข้อมูลรายการยกเลิกเช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

//lds_data.setfilter( "cheque_no='"+as_chqno + "' and chequebook_no ='" + as_chqbookno + "' and bank_code = '" +   as_bank + "' and bank_branch = '" +as_bankbranch + "'" )
//lds_data.filter( )

li_row = lds_data.rowcount()

li_found	= lds_data.find( "ai_flag = 1" , 1 , li_row ) 

do while  li_found > 0

		ls_bank				= lds_data.object.bank_code[ li_found ]
		ls_branch			= lds_data.object.bank_branch[ li_found ]
		ls_bankaccno		= lds_data.object.from_bankaccno[ li_found ]
		ldc_moneyamt		= lds_data.object.money_amt[ li_found ]
		ls_referslip			= lds_data.object.refer_slipno[ li_found ]
		
		ls_bankchq			= lds_data.object.bank_code[ li_found ]
		ls_bankbranchchq	= lds_data.object.bank_branch[ li_found ]
		ls_chqno				= lds_data.object.cheque_no[ li_found ]
		ls_chqbookno		= lds_data.object.chequebook_no[ li_found ]
		ls_cancelreson		= trim( lds_data.object.cancel_reson[ li_found ] )
		li_chqstatus			= lds_data.object.CHQEUE_STATUS[ li_found ]
		li_chqseqno			= lds_data.object.seq_no[ li_found ]
		li_act					= lds_data.object.action_flag[ li_found ]
		
		if isnull( ls_referslip ) then ls_referslip = ""
		if isnull( ls_cancelreson ) then ls_cancelreson = ""
		
		if ls_referslip = "" then 
//			ithw_exception.text	= "ไม่พบเลขที่ Slip ที่ทำการยกเลิกเช็ค"
//			throw ithw_exception
		end if
		
		if trim( ls_cancelreson ) = "" then
			destroy lds_data
			ithw_exception.text	= "กรุณาระบุเหตุผลการยกเลิกเช็คทุกฉบับ ที่ทำการยกเลิกด้วยครับ"
			throw ithw_exception
		end if
		
		lds_data.object.cancel_id[ li_found ]		= as_cancleid
		lds_data.object.cancel_date[ li_found ]	= adtm_wdate
		lds_data.object.cancel_reson[li_found]	= ls_cancelreson
		// แบ่ง 3 กรณี 0 ไม่ทำอะไร 1 ยกเลิกทิ้ง 2 ยกเลิกเพื่อออกใหม่
		
		choose case li_act
			case 0	//ไม่ทำอะไร
				
			case 1	// ยกเลิกเช็คทิ้ง
//				lds_data.object.chqeue_status[ li_found ]	= -1
				li_update	= -1				
				
				if li_chqstatus = 2 or li_chqstatus = 0 then return Success
				this.of_posttobank( as_coopid , as_cancleid , adtm_wdate , as_machine  , ls_bankaccno, ls_bank, ls_branch, ldc_moneyamt , -1)
				 
				
			case 2	// ยกเลิกเพื่อออกเช็คใหม่	
		
//				lds_data.object.chqeue_status[ li_found ]	= -9
				li_update	= -9
				
				// ถอยหลัง ธนาคาร
				if li_chqstatus <> 2 and  li_chqstatus <> 0 then		
					this.of_posttobank( as_coopid , as_cancleid , adtm_wdate , as_machine  , ls_bankaccno, ls_bank, ls_branch, ldc_moneyamt , -1)
				end if
		
				// เพิ่มรายการเช็คใหม่
				this.of_postnewchq(as_coopid, ls_chqno, ls_chqbookno, ls_bankchq, ls_bankbranchchq )
				
		end choose
		
		// ย้อนรายการ slip ให้รอพิมพ์เช็คใหม่
		this.of_postreturnslip( as_coopid,ls_referslip)
		
		// บันทึกข้อมูลยกเลิก bridgechq 
		this.of_postbridgechqcancel( as_coopid , ls_referslip , ls_bankchq , ls_bankbranchchq , ls_chqbookno , ls_chqno , li_chqseqno )
		
		
		update finchqeuestatement
		set		cancel_id = :as_cancleid	,
				cancel_date = :adtm_wdate 	,
				cancel_reson = :ls_cancelreson	,
				chqeue_status	= :li_update ,
				USE_STATUS = 0
		where	chequebook_no		= :ls_chqbookno	and
				bank_code	=	:ls_bankchq		and
				bank_branch	=	:ls_bankbranchchq	and
				cheque_no		=	:ls_chqno	and
				seq_no			=	:li_chqseqno
		using itr_sqlca		;
		
		if itr_sqlca.sqlcode <> 0 then
			destroy lds_data
			ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูลลง FINCHQUEMAS ได้ " + itr_sqlca.sqlerrtext
			rollback using	itr_sqlca ;
			throw ithw_exception
		end if

		li_found++
		if li_found > li_row then exit
		li_found	= lds_data.find( "ai_flag = 1" , li_found , li_row ) 
		
		
loop


//lds_data.accepttext( )
//
////lds_data.setitemstatus( 1, 0 ,Primary! , DataModified!)
//this.of_setcolumndatamodified(lds_data)
//
//lds_data.accepttext( )
//
//if lds_data.update( ) <> 1 then
//	ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูลลง FINCHQUEMAS ได้ " + lds_data.of_geterrormessage()
//	rollback using	itr_sqlca ;
//	throw ithw_exception
//end if
destroy lds_data
commit using itr_sqlca ;
return Success
end function

private function integer of_postnewchq (string as_coopid, string as_chqno, string as_chqbookno, string as_bankchq, string as_bankbranchchq) throws Exception;integer		li_seqno, li_used, li_remain, li_available

SELECT	max(seq_no)  
INTO		:li_seqno
FROM		FINCHQEUESTATEMENT
WHERE		( CHEQUE_NO		= :as_chqno ) AND  
			( CHEQUEBOOK_NO	= :as_chqbookno ) AND  
			( BANK_CODE			= :as_bankchq ) AND  
			( BANK_BRANCH		= :as_bankbranchchq )  and
			( coop_id	= :as_coopid )
using	itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	=  "ไม่สามารถค้นหารายการลำดับเช็คสูงสุดได้ " + itr_sqlca.sqlerrtext
	rollback using	itr_sqlca ;
	throw ithw_exception
end if

li_seqno ++

INSERT INTO	FINCHQEUESTATEMENT
	(	CHEQUE_NO,				CHEQUEBOOK_NO,				DATE_ONCHQ,				SEQ_NO,
		BANK_CODE,				ENTRY_ID,					ENTRY_DATE,				BANK_BRANCH,
		TO_WHOM,					TYPECHQ_PAY,				MONEY_AMT,				CHQEUE_STATUS,
		ADVANCE_CHQ,			COOP_ID,				MACHINE_ID,				CANCEL_ID,
		CANCEL_DATE,			MEMBER_NO,					FROM_BANKACCNO,		REFER_SLIPNO,
		PRINTED_STATUS,		PRINTED_ID,					PRINTED_DATE,			PRINTED_TERMINAL,
		CHEQUE_TYPE,			USE_STATUS
	)  
	VALUES
	(	:as_chqno,				:as_chqbookno,				NULL,						:li_seqno,
		:as_bankchq,			NULL,							NULL,						:as_bankbranchchq,
		NULL,						NULL,							NULL,						1,
		NULL,						:as_coopid,					NULL,						NULL,
		NULL,						NULL,							NULL,						NULL,
		0,							NULL,							NULL,						NULL,
		'99',						0
	)  using	itr_sqlca ;
	
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	=  "ไม่สามารถเพิ่มรายการเช็คได้ " + itr_sqlca.sqlerrtext
	rollback using	itr_sqlca ;
	throw ithw_exception
end if

// ปรับปรุงจำนวนเช็คที่ใช้ไป
select	chqslip_used, chqslip_remain
into		:li_used, :li_remain
from		finchequemas
where	chequebook_no	= :as_chqbookno and
			bank_code		= :as_bankchq and
			bank_branch	= :as_bankbranchchq and
			coop_id	= :as_coopid 
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก finchequemas "+ itr_sqlca.sqlerrtext
	rollback using	itr_sqlca ;
	throw ithw_exception
end if

if isnull( li_used ) then li_used= 0
if isnull( li_remain ) then li_remain= 0

li_used			= li_used - 1
li_remain		= li_remain + 1
li_available	= 1

if li_remain < 1 then
	li_available	= 0
	li_remain		= 0
end if

// ทำการปรัปรุงค่าเช็คที่ได้ใช้ไป
update	finchequemas
set		chqslip_used		= :li_used,
			chqslip_remain		= :li_remain,
			available_flag		= :li_available
where		chequebook_no		= :as_chqbookno and
			bank_code			= :as_bankchq and
			bank_branch			= :as_bankbranchchq and
			COOP_ID		= :as_coopid 
using	itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchequemas " + itr_sqlca.sqlerrtext
	rollback using	itr_sqlca ;
	throw ithw_exception
end if

return Success
end function

private function integer of_postreturnslip (string as_coopid, string as_referslip) throws Exception;string		ls_slip[], ls_referslipno ,ls_coopid
integer		li_upper, li_index, li_row


inv_string.of_parsetoarray( as_referslip, ',', ls_slip[] )


li_upper		= upperbound( ls_slip ) 

for li_index = 1 to li_upper
	ls_referslipno	= ls_slip[ li_index ]
	
	// update สถานะ slip ให้กลับเป็นรอพิมพ์เช็ค
	update finslip
	set payment_status = 8
	where slip_no  = :ls_referslipno
	and coop_id = :as_coopid
	and payment_status = 1
	using itr_sqlca ;
	
	if itr_sqlca .sqlcode <> 0 then 
		ithw_exception.text	= "ไม่สามารถทำการยกเลิก Return Slip Cheque ได้ ~r~n" + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
next

return Success
end function

public function integer of_postbridgechqcancel (string as_coopid, string as_referslip, string as_bank, string as_bankbranch, string as_chqbookno, string as_chqno, integer ai_seqno) throws Exception;string		ls_slip[], ls_referslipno  , ls_bridgeche_no 
integer		li_upper, li_index, li_row

inv_string.of_parsetoarray( as_referslip, ',', ls_slip[] )

li_upper		= upperbound( ls_slip ) 

for li_index = 1 to li_upper
	ls_referslipno	= ls_slip[ li_index ]
	
	// insert finbridgechq  ----------------------------------------------- // by Phai 
	// บันทึกข้อมูล Table finbridgechq เป็น Table เชื่อมรายการ slip กับ Cheque
	//-----------------------------------------------------------------------
	
	UPDATE FINBRIDGECHQ  
 	SET			BRIDGE_STATUS	= -9
	WHERE		SLIP_NO = :ls_referslipno	and 
					CHEQUEBOOK_NO = :as_chqbookno		and 
					BANK_CODE =:as_bank		 and 
           			BANK_BRANCH = :as_bankbranch	and 
					CHEQUE_NO = :as_chqno	and
					seq_no		= :ai_seqno and 
					COOP_ID = :as_coopid
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึก ข้อมูลได้ ลง finbridgechq  " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception	
	end if
	
	//-----------------------------------------------------------------------
	
	
next

return Success
end function

protected function integer of_slipbank_open (n_ds ads_data) throws Exception;string	ls_accno, ls_bankcode, ls_bankbranch, ls_accname, ls_entryid, ls_bookno
string	ls_acctype, ls_machineid, ls_coopid, ls_slipno
dec{2}	ldc_beginbal, ldc_mbginbal, ldc_balance, ldc_withamt, ldc_deptamt, ldc_scobal
datetime	ldtm_opendate, ldtm_closedate, ldtm_entry_date, ldtm_booklastupdate
integer	li_seqno, li_sign_operate
string	ls_remark

ls_accno					= ads_data.object.account_no[1]
ls_bankcode				= ads_data.object.bank_code[1]
ls_acctype				= ads_data.object.account_type[1]
ls_bankbranch			= ads_data.object.bank_branch[1]
ls_accname				= ads_data.object.account_name[1]
ls_entryid				= ads_data.object.entry_id[1]
ls_bookno				= ads_data.object.book_no[1]
ls_remark				= ""
ls_coopid			= ads_data.object.coop_id[1]

ldc_balance				= ads_data.object.item_amt[1]
if isnull( ldc_balance ) then ldc_balance = 0

ldc_beginbal				= ldc_balance
ldc_mbginbal			= ldc_balance

ldc_deptamt				= ads_data.object.item_amt[1]
ldc_scobal				= ads_data.object.item_amt[1]
ldtm_opendate			= ads_data.object.open_date[1]

ldtm_entry_date		= ads_data.object.entry_date[1]
ldtm_booklastupdate	= ads_data.object.entry_date[1]
li_seqno					= 1
li_sign_operate			= 1
ldc_withamt				= 0
setnull( ldtm_closedate )

ls_machineid			= ads_data.object.machine_id[1]
ls_coopid			= ads_data.object.coop_id[1]
ls_slipno					= ads_data.object.slip_no[1]

INSERT INTO	FINBANKACCOUNT
(	ACCOUNT_NO,					BANK_CODE,					BANKBRANCH_CODE,
	ACCOUNT_NAME,				BEGINBAL,					MBEGINBAL,			
	BALANCE,						CLOSE_STATUS,				CLOSE_DATE,		
	OPEN_DATE,					LASTSTM_SEQ,				ENTRY_ID,	
	ENTRY_DATE,					ACCOUNT_TYPE,				DEPT_AMT,	
	WITH_AMT,					BOOK_LASTUPDATE,			BOOK_NO,
	LASTACCESS_DATE,			SCO_BALANCE,				coop_id,
	remark
)  
VALUES
(	:ls_accno,					:ls_bankcode,				:ls_bankbranch,
	:ls_accname,				:ldc_beginbal,				:ldc_mbginbal,
	:ldc_balance,				0,								:ldtm_closedate,
	:ldtm_opendate,			:li_seqno,					:ls_entryid,
	:ldtm_entry_date,			:ls_acctype,				:ldc_deptamt,
	:ldc_withamt,				:ldtm_booklastupdate,	:ls_bookno,
	:ldtm_opendate,			:ldc_scobal,				:ls_coopid,
	:ls_remark
)  using itr_sqlca ;


if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลลง FINBANKACCOUNT ~r~n" + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

INSERT INTO	FINBANKSTATEMENT
(	SEQ_NO,				ACCOUNT_NO,					BANK_CODE,
	BANKBRANCH_CODE,	DETAIL_DESC,				ENTRY_ID,
	ENTRY_DATE,			OPERATE_DATE,				REF_SEQ,
	ITEM_STATUS,		CANCEL_ID,					CANCEL_DATE,
	BALANCE,				BALANCE_BEGIN,				MACHINE_ID,
	COOP_ID,		refer_slipno,				item_amt,
	sign_operate
)
VALUES
( 	:li_seqno,			:ls_accno,					:ls_bankcode,
	:ls_bankbranch,	'เปิดบัญชี',				:ls_entryid,
	:ldtm_entry_date,	:ldtm_entry_date,			null,
	1,						null,							null,
	:ldc_balance,		0,								:ls_machineid,
	:ls_coopid,	:ls_slipno,					:ldc_deptamt,
	:li_sign_operate
) using itr_sqlca  ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลลง FINBANKSTATEMENT ~r~n" + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception	
end if

return Success
end function

public function integer of_retrieve_cancleslip (string as_coopid, string as_head_xml, ref string as_itemlist_xml) throws Exception;string	ls_err , ls_membno , ls_filter , ls_cashtype 
integer	li_memberflag , li_recvflag , li_fixcash , li_recvpay
long ll_row
datetime		ldtm_entry
n_ds		lds_head , lds_data

lds_head	= create n_ds
lds_head.dataobject = "d_cancelslip_head" 

if not isnull( as_head_xml ) and trim( as_head_xml ) <> "" then
	this.of_importstring_xml( lds_head , as_head_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลกำหนดเงื่อนยกเลิก slip ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if


lds_data	= create		n_ds
lds_data.dataobject = "d_cancelslip_list"
lds_data.settransobject( itr_sqlca )

ls_membno		= trim( lds_head.object.as_memberno[1] )
li_memberflag	= lds_head.object.ai_memberflag[1]
li_recvflag		= lds_head.object.ai_recvflag[1]
ldtm_entry		= lds_head.object.adtm_date[1]
li_fixcash			= lds_head.object.fixcash_type[1]
ls_cashtype		= trim( lds_head.object.cash_type[1] )
li_recvpay		= lds_head.object.pay_recv_status[1]

ll_row		=	 lds_data.retrieve( as_coopid, ldtm_entry  )

if ll_row	< 1 then
	ithw_exception.text	= "ไม่มีข้อมูลทำรายการรับ-จ่าย "
	throw ithw_exception
end if

// ต้องมีอยู่แล้ว member_flag และ payment_status
ls_filter = "member_flag = " + string( li_memberflag  ) + " and payment_status = " + string( li_recvflag ) 

if isnull( li_recvpay ) then li_recvpay = 9 // All
if isnull( li_fixcash ) then li_fixcash = 0
if isnull( ls_membno) then ls_membno	= ""

//if trim( ls_membno ) <> "" then
//	lds_data.setfilter("member_no = '" + ls_membno  + "' and member_flag = " &
//					+ string( li_memberflag  ) + " and payment_status = " + string( li_recvflag ) )
//	ls_err	= " เลขที่สมาชิก : "  + ls_membno + " "
//	
//else
//	lds_data.setfilter("member_flag = " + string( li_memberflag  ) + " and payment_status = " + string( li_recvflag ) )
//end if


if trim( ls_membno ) <> ""  and ( li_memberflag = 0 or li_memberflag = 1 )then
	ls_filter  += " and member_no = '" + ls_membno  + "' "
end if

if li_fixcash = 1 then
	ls_filter  += " and cash_type = '" + ls_cashtype  + "' "
end if

if li_recvpay <> 9 then
	ls_filter  += " and pay_recv_status = " + string( li_recvpay  ) + " "
	
end if

choose case li_memberflag 
	case 0
		
		ls_err	+=	" บุคคลภายนอก "		
		if ls_membno <> "" then
			ls_err	+=	 " : " + ls_membno
		end if
		
	case 1
		
		ls_err	+=	" ทะเบียนสมาชิก "		
		if ls_membno <> "" then
			ls_err	+=	 " : " + ls_membno
		end if
		
	case 2
		
		ls_err	+=	" สหกรณ์อื่น "		
	case 3
		ls_err	+=	" อื่น ๆ "
	case else
		ls_err	+=	""
end choose

if li_recvflag = 1 then
	ls_err += " ผ่านรายการ แล้ว"
else
	ls_err += " ยังไม่ผ่านรายการ"
end if
	
lds_data.setfilter( ls_filter )
lds_data.Filter( )

ll_row		=	 lds_data.rowcount( )

if ll_row	< 1 then
	ithw_exception.text	= "ไม่มีข้อมูลทำรายการรับ-จ่าย ตามเงื่อนไข ~r~n" + ls_err
	throw ithw_exception
end if

as_itemlist_xml		=	lds_data.describe( "Datawindow.Data.Xml" )

destroy( lds_data )
return success
end function

public function integer of_retrievechangchqdetail (string as_coopid, string as_chqno, string as_bookno, string as_bank, string as_bankbranch, integer ai_seqno, ref string as_chqdetail_xml);n_ds		lds_data

lds_data = create n_ds
lds_data.dataobject = "d_change_chqstatus_detail1"
lds_data.settransobject( itr_sqlca )

lds_data.retrieve( as_coopid,as_chqno , as_bookno , as_bank , as_bankbranch  , ai_seqno )
as_chqdetail_xml	=	""
if lds_data.rowcount( ) > 0 then
	as_chqdetail_xml	=	lds_data.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_data ) 

return success
end function

public function integer of_retrievechangechqstatus (string as_coopid, ref string as_chqlist_xml) throws Exception;n_ds		lds_data

lds_data = create n_ds
lds_data.dataobject = "d_change_chqstatus"
lds_data.settransobject( itr_sqlca )

lds_data.retrieve( as_coopid )
as_chqlist_xml	=	""
if lds_data.rowcount( ) > 0 then
	as_chqlist_xml	=	lds_data.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_data ) 

return success
end function

public function integer of_postchangedstatuschq (string as_coopid, string as_entry_id, datetime adtm_wdate, string as_machine, string as_chqno, string as_chqbookno, string as_bank, string as_bankbranch, integer as_chqseq_no, integer ai_chqstatus) throws Exception;integer	li_row , li_rc
dec{2}	ldc_money, ldc_bal
string	ls_bankacc, ls_bankcode, ls_bankbranch, ls_referslip
string	ls_referslipno[]
integer	li_rowslip, li_indexslip, li_taxstatus
integer	li_chqreceivestatus

dwItemStatus	l_status

n_ds		lds_data

lds_data = create n_ds
lds_data.dataobject = "d_change_chqstatus"
lds_data.settransobject( itr_sqlca )

li_row		= lds_data.retrieve( as_coopid )

if li_row < 1 then return success

lds_data.setfilter( "chequebook_no = '" + as_chqbookno + "' and  cheque_no = '" + as_chqno + "' and bank_code = '" + as_bank + "' and bank_branch = '" + as_bankbranch + "' and seq_no = " + string( as_chqseq_no ) )
lds_data.filter( )

li_row	 = lds_data.rowcount( )

if li_row < 1 then return success

ls_referslip	= trim( lds_data.object.refer_slipno[ 1 ] )
ldc_money		=  lds_data.object.money_amt[ 1 ]
ls_bankacc		=  lds_data.object.from_bankaccno[ 1 ]
ls_bankcode		=  lds_data.object.bank_code[ 1 ]
ls_bankbranch	=  lds_data.object.bank_branch[ 1 ]

if isnull( ai_chqstatus ) then ai_chqstatus = 1

choose case ai_chqstatus
	case 1 // ขึ้นเงิน

		inv_string.of_parsetoarray( ls_referslip,  ',' , ls_referslipno )
		li_rowslip	= upperbound( ls_referslipno )
		
		
		select	BALANCE
		into		:ldc_bal
		from		FINBANKACCOUNT
		where		ACCOUNT_NO			= :ls_bankacc and 
					BANK_CODE			= :ls_bankcode and 
					BANKBRANCH_CODE 	= :ls_bankbranch and
					coop_id		= :as_coopid
		using itr_sqlca ;
					
		if isnull( ldc_bal ) then ldc_bal = 0
		
		ldc_bal		= ldc_bal - ldc_money
		
		update	FINBANKACCOUNT
		set		BALANCE				= :ldc_bal
		where	ACCOUNT_NO			= :ls_bankacc and 
					BANK_CODE				= :ls_bankcode and 
					BANKBRANCH_CODE 	= :ls_bankbranch and
					coop_id			= :as_coopid
		using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			destroy lds_data
			ithw_exception.text	= "ไม่สามารถปรับยอดเงินในบัญชีเงินฝากธนาคารได้" + itr_sqlca.sqlerrtext
			rollback using	itr_sqlca ;
			throw ithw_exception
		end if
		
		inv_string.of_parsetoarray( ls_referslip,  ',' , ls_referslipno )
		li_rowslip	= upperbound( ls_referslipno )
				
		if li_rowslip > 0 then
			for li_indexslip = 1 to li_rowslip
				
				ls_referslip		= trim( ls_referslipno[ li_indexslip ] )
				
				SELECT	RECEIVE_STATUS, tax_flag
				INTO		:li_chqreceivestatus, :li_taxstatus
				FROM		FINSLIP  
				WHERE		SLIP_NO			= :ls_referslip and
							coop_id	= :as_coopid
				using itr_sqlca ;
							
				if isnull( li_chqreceivestatus ) then li_chqreceivestatus = 0
				if isnull( li_taxstatus ) then li_taxstatus = 0
				
				if li_chqreceivestatus = 0 then
					li_chqreceivestatus	= 1
					
					// ปรับปรุงภาษี
					if li_taxstatus = 1 then
						UPDATE	FINTAX
						SET		TAXPAY_DATE		= :adtm_wdate,
									cancel_flag		= 0
						WHERE		SLIP_NO			= :ls_referslip and
									coop_id	= :as_coopid
						using itr_sqlca  ;
						
						if itr_sqlca.sqlcode <> 0 then
							destroy lds_data
							ithw_exception.text	= "ไม่สามารถปรับ สถานะของ fintax ได้" + itr_sqlca.sqlerrtext
							rollback using	itr_sqlca ;
							throw ithw_exception
						end if
					
					end if
						
				end if
				
				
			next
		end if
							
	case 8 // ระหว่างทาง
		l_status	= lds_data.getitemstatus( 1, "chqeue_status" ,  Primary! )
		
		choose case l_status
			case DataModified!
				inv_string.of_parsetoarray( ls_referslip,  "," , ls_referslipno )
				
				li_rowslip	= upperbound( ls_referslipno )
				
				if li_rowslip > 0 then
					for li_indexslip = 1 to li_rowslip
						ls_referslip	= trim( ls_referslipno[ li_indexslip ] )
						
						SELECT	RECEIVE_STATUS  , tax_flag
						INTO		:li_chqreceivestatus, :li_taxstatus
						FROM		FINSLIP  
						WHERE	SLIP_NO			= :ls_referslip and
									coop_id	= :as_coopid
						using itr_sqlca ;
						
						if isnull( li_chqreceivestatus ) then li_chqreceivestatus = 0
						if isnull( li_taxstatus ) then li_taxstatus = 0
						
						if itr_sqlca.sqlcode <> 0 then
							destroy lds_data
							ithw_exception.text	= "ไม่สามารถดึงข้อมูล สถานะของ slip ได้" + itr_sqlca.sqlerrtext
							throw ithw_exception
						end if
						
						// ปรับปรุงภาษี
						if li_taxstatus = 1 then
							UPDATE	FINTAX
							SET		TAXPAY_DATE		= :adtm_wdate,
										cancel_flag		= 0
							WHERE	SLIP_NO			= :ls_referslip and
										coop_id	= :as_coopid
							using itr_sqlca  ;
							
							if itr_sqlca.sqlcode <> 0 then
								destroy lds_data
								ithw_exception.text	= "ไม่สามารถปรับ สถานะของ fintax ได้"+ itr_sqlca.sqlerrtext
								rollback using itr_sqlca ;
								throw ithw_exception
							end if
						
						end if
													
					next
				end if
				
//				// ปรับปรุงรายการธนาคาร
//				ldc_money		=  lds_data.object.money_amt[ 1 ]
//				ls_bankacc		=  lds_data.object.from_bankaccno[ 1 ]
//				ls_bankcode		=  lds_data.object.bank_code[ 1 ]
//				ls_bankbranch	=  lds_data.object.bank_branch[ 1 ]
				
				this.of_posttobank( as_coopid , as_entry_id , adtm_wdate , as_machine  , ls_bankacc, ls_bankcode, ls_bankbranch, ldc_money , -1)
				
			case else
				
		end choose
		
	case 2, 0
		
end choose

lds_data.object.chqeue_status[1] = ai_chqstatus	

lds_data.Accepttext( )
this.of_setcolumndatamodified(lds_data)
lds_data.setitemstatus( 1 , 0 ,Primary! , DataModified!)
if lds_data.update() <> 1 then
	
	ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูลลง FINCHQEUESTATEMENT ได้ " + lds_data.of_geterrormessage()
	destroy lds_data
	rollback using	itr_sqlca ;
	throw ithw_exception
end if

destroy lds_data

commit using itr_sqlca ;
return Success
end function

public function integer of_retrievepaychqlist (string as_coopid, datetime adtm_wdate, ref string as_chqlist_xml) throws Exception;n_ds lds_chqlist

// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_pay_cheque_detail" 
lds_chqlist.settransobject( itr_sqlca )

lds_chqlist.retrieve(as_coopid,adtm_wdate )

as_chqlist_xml = ""
if lds_chqlist.rowcount( ) > 0 then
	as_chqlist_xml	 = lds_chqlist.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_chqlist ) 

return success
end function

public function integer of_init_paychq (string as_coopid, datetime adtm_wdate, ref string as_main_xml, ref string as_chqlist_xml) throws Exception;//function Name : of_init_paychq
//
//argument	:
//
//as_branch		รหัสสาขาสหกรณ์
//adtm_wdate	วันที่ทำการ
//as_main_xml		xml เงื่อนไขการพิมพ์ ข้อมูลสำหรับพิมพ์เช็ค
//as_chqlist_xml	xml รายการให้เลือกเพื่อพิมพ์เช็ค
//
//return 	1 ถ้าสำเร็จ -1 เกิดข้อผิดพลาด 


string		ls_chqdefault
// Impost String XML----------------------------------------------------
n_ds lds_chqlist , lds_main 

// เงื่อนไขการพิมพ์เช็ค
lds_main = create n_ds
lds_main.dataobject = "d_pay_cheque" 
lds_main.insertrow( 0 )


// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_pay_cheque_detail" 
lds_chqlist.settransobject( itr_sqlca )

lds_chqlist.retrieve( as_coopid,adtm_wdate)

//------------------------------------------------------------------------
SELECT	CHQTYPE_DEFAULT
INTO		:ls_chqdefault
FROM		FINCONSTANT  
using	itr_sqlca	;

// กำหนดค่า ประเภทเช็ค
if isnull( ls_chqdefault ) then ls_chqdefault = "01"
if ls_chqdefault <> "" then
	lds_main.object.cheque_type[1]	= ls_chqdefault
end if

lds_main.object.cheque_status[1] 			= 8

// กำหนดค่า เงื่อนไขพิมพ์เช็ค
lds_main.object.cheque_date[1]			= adtm_wdate
lds_main.object.print_type[1]				= "LAS"

// กำหนดค่า ตัดบัญชีธนาคาร
lds_main.object.chq_size[1]					=	1

lds_main.accepttext( )
lds_chqlist.accepttext( )

as_main_xml		=	lds_main.describe( "Datawindow.Data.Xml" )
as_chqlist_xml = ""
if lds_chqlist.rowcount( ) > 0 then
	as_chqlist_xml		=	lds_chqlist.describe( "Datawindow.Data.Xml" )
end if

destroy lds_chqlist 
destroy lds_main 

return success
end function

private function string of_setchqlistdetailslip (string as_coopid, string as_entry, datetime adtm_wdate, string as_machince, n_ds ads_main, n_ds ads_chqlist) throws Exception;/***********************************************
<description>
	ปรับปรุงข้อมูลสลิปที่เลือกพิมพ์เช็ค 1 ใบจากหลายสลิป 
</description>

<arguments>
	as_branch			รหัสสาขาสหกรณ์
	as_entry				รหัสผู้ใช้ ที่ทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_machine			ชื่อเครื่องทีทำรายการ
	ads_main			ข้อมูลเงื่อนไขการพิมพ์ 
	ads_chqlist			ข้อมูลรายการจ่ายเช็ค
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_setchqlistdetailslip()
	
	Integer li_return 
	String ls_branch , ls_entry , ls_machine 
	datetime		ldtm_wdate
	n_ds 	lds_main , lds_chqlist 
	
	li_return = lnv_finservice.of_postpaychq( ls_branch , ls_entry , ldtm_wdate , ls_machine , lds_main , lds_chqlist  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by PhaiWaan
	Version 1.1 ตรวจสอบการเลือกรายการจ่ายเป็นเช็ค Modified Date 9/10/2010 by PhaiWaan
</usage>
************************************************/


long	ll_row , ll_index
string	ls_refslipno

ll_row = ads_chqlist.rowcount()

string	ls_chqno, ls_bankcode, ls_bankbranch, ls_paywhom
string	ls_chqbookno, ls_frombranch, ls_fromacc, ls_frombank, ls_entryid
integer	li_chequestatus
string	ls_coopid, ls_machineid, ls_member, ls_cashtype, ls_err, ls_slipno, ls_chequetype
dec{2}	ldc_itemamt
datetime	ldtm_onchq, ldtm_entrydate, ldtm_today
integer	li_used, li_remain, li_available, li_seqno

ldtm_today			= datetime( today(), now() )
ldtm_entrydate		= adtm_wdate
ldc_itemamt			= ads_main.object.cheque_amt[1]
ls_chqno				= trim( ads_main.object.account_no[1] )
ls_bankcode			= ads_main.object.bank_code[1]
ls_bankbranch		= trim(ads_main.object.bank_branch[1])
ls_chqbookno		= trim( ads_main.object.cheque_bookno[1] )
ldtm_onchq			= ads_main.object.cheque_date[1]
ls_paywhom			= trim( ads_main.object.pay_whom[1] )
li_chequestatus		= ads_main.object.cheque_status[1]
ls_chequetype		= trim( ads_main.object.cheque_type[1] )
ls_fromacc			= trim( ads_main.object.fromaccount_no[1] )
ls_frombranch		= trim( ads_main.object.frombranch[1] )
ls_frombank			= trim( ads_main.object.frombank[1] )

ll_row					= ads_chqlist.rowcount( )

//li_used	= ads_chqlist.find("ai_chqflag = 1" , 1 , ll_row	 )
if ll_row < 1 then
	destroy( idc_printchq )
	ithw_exception.text	= "ยังไม่ได้เลือกรายการที่ต้องการพิมพ์เช็ค" 
	throw ithw_exception
end if

	for li_used = 1 to  	 ll_row

		ls_slipno		= ads_chqlist.object.slip_no[li_used]
		
		update finslip
		set bank_code 		= :ls_bankcode ,
			bank_branch	= :ls_bankbranch ,
			chequebook_no		= :ls_chqbookno ,
			account_no	= :ls_chqno ,
			dateon_chq			= :ldtm_onchq ,
			cheque_status		= :li_chequestatus , 
			pay_towhom			= :ls_paywhom ,
			from_accno			= :ls_fromacc ,
			from_bankcode		= :ls_frombank ,
			from_branchcode	= :ls_frombranch ,
			cheque_type		= :ls_chequetype ,
			payment_status	= 1	,
			recvpay_id			= :ls_entryid , 
			recvpay_time			= :ldtm_today
		where slip_no = :ls_slipno
		and coop_id = :as_coopid 
		using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง Finsllip" + itr_sqlca.sqlerrtext
			rollback using itr_sqlca ;
			throw ithw_exception	
		end if
		
		// หากเป็นเช็คค้างจ่าย
		if li_chequestatus = 8 then
			update finslip
			set receive_date 		= :ldtm_entrydate ,
				receive_status		= 1
			where slip_no = :ls_slipno
			and coop_id = :as_coopid 
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง Finsllip" + itr_sqlca.sqlerrtext
				rollback using itr_sqlca ;
				throw ithw_exception	
			end if
		
		end if
		
		ls_refslipno	+= ls_slipno + ','
		
//		li_used++
//		if li_used > ll_row then
//			exit 
//		end  if
//		li_used	= ads_chqlist.find("ai_chqflag = 1" , li_used , ll_row	 )
		
	next


if len( ls_refslipno ) > 0 then
	ls_refslipno		= left( ls_refslipno, len( ls_refslipno ) - 1 )
end if

return ls_refslipno
end function

public function integer of_postcancelsendchq (string as_coopid, string as_chqno, string as_bank, string as_bankbranch, integer ai_seqno) throws Exception;long		ll_row, ll_seqno, ll_index
string	ls_chqno, ls_BANK_CODE, ls_BANKBRANCH_CODE
string	ls_coopid


UPDATE	FINCHECKRETRIEVE  
SET		POST_TOBANK		= -9
WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :as_chqno ) AND  
			( FINCHECKRETRIEVE.BANK_CODE			= :as_bank ) AND  
			( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :as_bankbranch ) AND  
			( FINCHECKRETRIEVE.SEQ_NO				= :ai_seqno ) and
			( FINCHECKRETRIEVE.coop_id			= :as_coopid ) 
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงการนำส่งเช็คได้ ครับ ~r~n" + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

commit using itr_sqlca ;

return success
end function

public function integer of_init_sendchq (string as_coopid, string as_entry, datetime adtm_wdate, ref string as_sendchq_xml) throws Exception;
integer	li_row, li_index, li_found, li_CHQ_STATUS, li_posttobank
dec{2}	ldc_amount
string		ls_chqno, ls_bank, ls_bank_branch
string		ls_refer_slip
datetime	ldtm_CHECKDUE_DATE, ldtm_entry_time, ldtm_MUSTCLEAR_DATE
string	 	ls_REFERDOC_NAME, ls_REFERTYPE_CODE, ls_REFER_DOCNO
dec{2}	ldc_CHEQUE_AMT
integer	li_FLOAT_DAY, li_CHQLATE_STATUS, li_normal_dept

n_ds	lds_data


ldtm_entry_time	= 	datetime( date(adtm_wdate), now( ) ) 

li_posttobank	= 8
// จากเงินฝาก
lds_data	= create n_ds
lds_data.dataobject	= "d_recv_chqlist_dep"
lds_data.settransobject( itr_sqlca )

li_row	= lds_data.retrieve( is_coopcontrl , as_coopid,adtm_wdate)

for li_index = 1 to li_row
	
	ls_chqno			= lds_data.object.check_no[li_index]
	ls_bank			= lds_data.object.bank_code[li_index]
	ls_bank_branch	= lds_data.object.bankbranch_code[li_index]
	
	if isnull( ls_chqno ) then ls_chqno = ""
	if isnull( ls_bank ) then ls_bank = ""
	if isnull( ls_bank_branch ) then ls_bank_branch = ""
	
	
	ls_refer_slip	= lds_data.object.deptslip_no[li_index]
	if isnull( ls_refer_slip ) then ls_refer_slip = ""
	
	if ( ls_refer_slip = "" ) or ( ls_chqno = "" ) or ( ls_bank = "" ) or ( ls_bank_branch = "" ) then continue
	
	li_found	= 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO   )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) and
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank) and
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch) and
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) AND  
				( FINCHECKRETRIEVE.SLIP_NO				= :ls_refer_slip ) 
	using itr_sqlca ;
				
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then continue
	
	li_found = 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch ) AND  
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid )   
	using itr_sqlca ;
	
	if isnull( li_found ) then li_found = 0
	li_found ++
	
	ldc_CHEQUE_AMT			= lds_data.object.cheque_amt[li_index]
	ls_REFERDOC_NAME		= lds_data.object.deptaccount_name[li_index]
	ldtm_CHECKDUE_DATE	= lds_data.object.checkdue_date[li_index]
	ls_REFER_DOCNO			= lds_data.object.deptaccount_no[li_index] ;if isnull( ls_REFER_DOCNO ) then ls_REFER_DOCNO = ""
	li_CHQLATE_STATUS		= lds_data.object.chqlate_status[li_index]
	li_FLOAT_DAY			= lds_data.object.float_day[li_index]
	ldtm_MUSTCLEAR_DATE	= lds_data.object.mustclear_date[li_index]
	li_CHQ_STATUS			= lds_data.object.checkclear_status[li_index]
	li_normal_dept			= lds_data.object.normal_dept[li_index] ;if isnull( li_normal_dept ) then li_normal_dept = 1
	ls_REFERTYPE_CODE		= ""
	
	// ทำการบันทึกข้อมูลลงฐานข้อมูล
	INSERT INTO FINCHECKRETRIEVE  
	(	CHECK_NO,				CHECKDUE_DATE,				BANK_CODE,					BANKBRANCH_CODE,   
		CHECKCLEAR_STATUS,	ENTRY_DATE,					ENTRY_ID,					ENTRY_TIME,   
		FLOAT_DAY,				CHEQUE_AMT,					REFER_DOCNO,				REFERDOC_NAME,   
		COOP_ID,				REFERTYPE_CODE,			SLIP_NO,						SEQ_NO,   
		MUSTCLEAR_DATE,						CHEUQE_TYPE,				CHQLATE_STATUS,   
		FEE_AMT,					REFER_APP,					TOBANK_CODE,				TOBANK_BRANCH,   
		TOBANK_ACCNO,			TOACC_ID,					POST_TOBANK,				normal_dept
	)  
	VALUES
	(	:ls_chqno,				:ldtm_CHECKDUE_DATE,		:ls_bank,					:ls_bank_branch,
		:li_CHQ_STATUS,		:adtm_wdate,					:as_entry,				:ldtm_entry_time,
		:li_FLOAT_DAY,			:ldc_CHEQUE_AMT,			:ls_REFER_DOCNO,			:ls_REFERDOC_NAME,
		:as_coopid,				:ls_REFERTYPE_CODE,		:ls_refer_slip,			:li_found,
		:ldtm_MUSTCLEAR_DATE,					null,							:li_CHQLATE_STATUS,
		0,							'DEP',						null,							null,
		null,						null,							:li_posttobank,			:li_normal_dept
	)  	using itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มรายการเช็คได้ DEP " + itr_sqlca.sqlerrtext
		rollback	using itr_sqlca ;
		throw ithw_exception		
	end if
	
next

// จากหุ้นหนี้
lds_data.dataobject	= "d_recv_chqlist_lon"
lds_data.settransobject( itr_sqlca )
li_row	= lds_data.retrieve( as_coopid,adtm_wdate)
for li_index = 1 to li_row
	ls_chqno			= trim( lds_data.object.expense_accid[li_index] )
	ls_bank			= trim( lds_data.object.expense_bank[li_index] )
	ls_bank_branch	= trim( lds_data.object.expense_branch[li_index] )
	
	if isnull( ls_chqno ) then ls_chqno = ""
	if isnull( ls_bank ) then ls_bank = ""
	if isnull( ls_bank_branch ) then ls_bank_branch = ""
	
	
	ls_refer_slip	= trim( lds_data.object.slip_no[li_index] )
	if isnull( ls_refer_slip ) then ls_refer_slip = ""
	
	if ( ls_refer_slip = "" ) or ( ls_chqno = "" ) or ( ls_bank = "" ) or ( ls_bank_branch = "" ) then continue
	
	li_found	= 0
	
	// ตรวจสอบรายการซ้ำ
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO   )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE	( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) and
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank) and
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch) and
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) AND  
				( FINCHECKRETRIEVE.SLIP_NO				= :ls_refer_slip ) 
	using itr_sqlca ;
				
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then continue
	
	li_found = 0
	
	// หาจำนวนล่าสุด
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE	( FINCHECKRETRIEVE.CHECK_NO = :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE = :ls_bank ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE = :ls_bank_branch ) AND  
				( FINCHECKRETRIEVE.COOP_ID = :as_coopid )   
	using itr_sqlca ;
	
	if isnull( li_found ) then li_found = 0
	li_found ++
	
	ldc_CHEQUE_AMT			= lds_data.object.slip_amt[li_index]
	ls_REFERDOC_NAME		= lds_data.object.member_no[li_index]
	ldtm_CHECKDUE_DATE		= lds_data.object.cheque_date[li_index]
	ls_REFER_DOCNO			= ls_refer_slip
	li_CHQLATE_STATUS		= 0
	li_FLOAT_DAY				= 1
	setnull( ldtm_MUSTCLEAR_DATE )
	ls_REFERTYPE_CODE		= ""
	
	// ทำการบันทึกข้อมูลลงฐานข้อมูล
	INSERT INTO FINCHECKRETRIEVE  
	(	CHECK_NO,				CHECKDUE_DATE,			BANK_CODE,					BANKBRANCH_CODE,   
		CHECKCLEAR_STATUS,	ENTRY_DATE,				ENTRY_ID,					ENTRY_TIME,   
		FLOAT_DAY,				CHEQUE_AMT,				REFER_DOCNO,				REFERDOC_NAME,   
		COOP_ID,				REFERTYPE_CODE,			SLIP_NO,						SEQ_NO,   
		MUSTCLEAR_DATE,				CHEUQE_TYPE,				CHQLATE_STATUS,   
		FEE_AMT,					REFER_APP,					TOBANK_CODE,				TOBANK_BRANCH,   
		TOBANK_ACCNO,		TOACC_ID,					POST_TOBANK,				normal_dept
	)  
	VALUES
	(	:ls_chqno,					:ldtm_CHECKDUE_DATE,		:ls_bank,						:ls_bank_branch,
		8,							:adtm_wdate,						:as_entry,					:ldtm_entry_time,
		:li_FLOAT_DAY,			:ldc_CHEQUE_AMT,			:ls_REFER_DOCNO,			:ls_REFERDOC_NAME,
		:as_coopid,					:ls_REFERTYPE_CODE,		:ls_refer_slip,					:li_found,
		:ldtm_MUSTCLEAR_DATE,				null,							:li_CHQLATE_STATUS,
		0,							'LON',							null,							null,
		null,						null,							:li_posttobank,					1
	)  	using itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มรายการเช็คได้ LON "  + itr_sqlca.sqlerrtext
		rollback	using itr_sqlca ;
		throw ithw_exception
	end if
	
next

// จากจัดเก็บ

// จากการลงทุน ตั๋ว
/*
lds_data.dataobject	= "d_recv_chqlist_prm"
lds_data.settransobject( itr_sqlca )
li_row	= lds_data.retrieve( adtm_wdate, as_branch )
for li_index = 1 to li_row
	ls_chqno			= lds_data.object.check_no[li_index]
	ls_bank			= lds_data.object.bank_code[li_index]
	ls_bank_branch	= lds_data.object.bankbranch_code[li_index]
	
	if isnull( ls_chqno ) then ls_chqno = ""
	if isnull( ls_bank ) then ls_bank = ""
	if isnull( ls_bank_branch ) then ls_bank_branch = ""
	
	
	ls_refer_slip	= lds_data.object.deptslip_no[li_index]
	if isnull( ls_refer_slip ) then ls_refer_slip = ""
	
	if ( ls_refer_slip = "" ) or ( ls_chqno = "" ) or ( ls_bank = "" ) or ( ls_bank_branch = "" ) then continue
	
	li_found	= 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO   )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) and
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank) and
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch) and
				( FINCHECKRETRIEVE.BRANCH_ORIGIN		= :as_branch ) AND  
				( FINCHECKRETRIEVE.SLIP_NO				= :ls_refer_slip ) ;
				
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then continue
	
	li_found = 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch ) AND  
				( FINCHECKRETRIEVE.BRANCH_ORIGIN		= :as_branch )   ;
	
	if isnull( li_found ) then li_found = 0
	li_found ++
	
	ldc_CHEQUE_AMT			= lds_data.object.cheque_amt[li_index]
	ls_REFERDOC_NAME		= lds_data.object.deptaccount_name[li_index]
	ldtm_CHECKDUE_DATE	= lds_data.object.checkdue_date[li_index]
	ls_REFER_DOCNO			= lds_data.object.deptaccount_no[li_index] ;if isnull( ls_REFER_DOCNO ) then ls_REFER_DOCNO = ""
	li_CHQLATE_STATUS		= lds_data.object.chqlate_status[li_index]
	li_FLOAT_DAY			= lds_data.object.float_day[li_index]
	ldtm_MUSTCLEAR_DATE	= lds_data.object.mustclear_date[li_index]
	li_CHQ_STATUS			= lds_data.object.checkclear_status[li_index]
	li_normal_dept			= lds_data.object.normal_dept[li_index] ;if isnull( li_normal_dept ) then li_normal_dept = 1
	ls_REFERTYPE_CODE		= ""
	
	// ทำการบันทึกข้อมูลลงฐานข้อมูล
	INSERT INTO FINCHECKRETRIEVE  
	(	CHECK_NO,				CHECKDUE_DATE,				BANK_CODE,					BANKBRANCH_CODE,   
		CHECKCLEAR_STATUS,	ENTRY_DATE,					ENTRY_ID,					ENTRY_TIME,   
		FLOAT_DAY,				CHEQUE_AMT,					REFER_DOCNO,				REFERDOC_NAME,   
		BRANCH_ID,				REFERTYPE_CODE,			SLIP_NO,						SEQ_NO,   
		MUSTCLEAR_DATE,		BRANCH_ORIGIN,				CHEUQE_TYPE,				CHQLATE_STATUS,   
		FEE_AMT,					REFER_APP,					TOBANK_CODE,				TOBANK_BRANCH,   
		TOBANK_ACCNO,			TOACC_ID,					POST_TOBANK,				normal_dept
	)  
	VALUES
	(	:ls_chqno,				:ldtm_CHECKDUE_DATE,		:ls_bank,					:ls_bank_branch,
		:li_CHQ_STATUS,		:adtm_wdate,					:as_entry,				:ldtm_entry_time,
		:li_FLOAT_DAY,			:ldc_CHEQUE_AMT,			:ls_REFER_DOCNO,			:ls_REFERDOC_NAME,
		:as_branch,				:ls_REFERTYPE_CODE,		:ls_refer_slip,			:li_found,
		:ldtm_MUSTCLEAR_DATE,:as_branch,					null,							:li_CHQLATE_STATUS,
		0,							'DEP',						null,							null,
		null,						null,							:li_posttobank,			:li_normal_dept
	)  ;

	if itr_sqlca.sqlcode <> 0 then
		messagebox( "ผิดพลาด","ไม่สามารถเพิ่มรายการเช็คได้ DEP " + itr_sqlca.sqlerrtext, stopSign! )
		rollback;
		return -1
	end if
	
next
*/

// จากการเงิน
lds_data.dataobject	= "d_recv_chqlist_fin"
lds_data.settransobject( itr_sqlca )
li_row	= lds_data.retrieve( as_coopid,adtm_wdate)
for li_index = 1 to li_row
	ls_chqno			= lds_data.object.account_no[li_index]
	ls_bank			= lds_data.object.bank_code[li_index]
	ls_bank_branch	= lds_data.object.bank_branch[li_index]
	
	if isnull( ls_chqno ) then ls_chqno = ""
	if isnull( ls_bank ) then ls_bank = ""
	if isnull( ls_bank_branch ) then ls_bank_branch = ""
	
	
	ls_refer_slip	= lds_data.object.slip_no[li_index]
	if isnull( ls_refer_slip ) then ls_refer_slip = ""
	
	if ( ls_refer_slip = "" ) or ( ls_chqno = "" ) or ( ls_bank = "" ) or ( ls_bank_branch = "" ) then continue
	
	li_found	= 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO   )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE	( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) and
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank) and
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch) and
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) AND  
				( FINCHECKRETRIEVE.SLIP_NO				= :ls_refer_slip ) 
	using itr_sqlca ;
				
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then continue
	
	li_found = 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE	( FINCHECKRETRIEVE.CHECK_NO = :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE = :ls_bank ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE = :ls_bank_branch ) AND  
				( FINCHECKRETRIEVE.COOP_ID = :as_coopid )   
	using itr_sqlca ;
	
	if isnull( li_found ) then li_found = 0
	li_found ++
	
	ldc_CHEQUE_AMT			= lds_data.object.item_amtnet[li_index]
	ls_REFERDOC_NAME		= lds_data.object.nonmember_detail[li_index]
	ldtm_CHECKDUE_DATE	= lds_data.object.dateon_chq[li_index]
	li_CHQLATE_STATUS		= 0
	li_FLOAT_DAY			= 0
	ldtm_MUSTCLEAR_DATE	= ldtm_CHECKDUE_DATE
	ls_REFERTYPE_CODE		= ""
	
	// ทำการบันทึกข้อมูลลงฐานข้อมูล
	INSERT INTO FINCHECKRETRIEVE  
	(	CHECK_NO,				CHECKDUE_DATE,				BANK_CODE,					BANKBRANCH_CODE,   
		CHECKCLEAR_STATUS,	ENTRY_DATE,					ENTRY_ID,					ENTRY_TIME,   
		FLOAT_DAY,				CHEQUE_AMT,					REFER_DOCNO,				REFERDOC_NAME,   
		COOP_ID,				REFERTYPE_CODE,			SLIP_NO,						SEQ_NO,   
		MUSTCLEAR_DATE,					CHEUQE_TYPE,				CHQLATE_STATUS,   
		FEE_AMT,					REFER_APP,					TOBANK_CODE,				TOBANK_BRANCH,   
		TOBANK_ACCNO,			TOACC_ID,					POST_TOBANK,				normal_dept
	)  
	VALUES
	(	:ls_chqno,				:ldtm_CHECKDUE_DATE,		:ls_bank,					:ls_bank_branch,
		8,							:adtm_wdate,					:as_entry,				:ldtm_entry_time,
		:li_FLOAT_DAY,			:ldc_CHEQUE_AMT,			:ls_refer_slip,			:ls_REFERDOC_NAME,
		:as_coopid,				:ls_REFERTYPE_CODE,		:ls_refer_slip,			:li_found,
		:ldtm_MUSTCLEAR_DATE,				null,							:li_CHQLATE_STATUS,
		0,							'FIN',						null,							null,
		null,						null,							:li_posttobank,			1
	)  	using itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มรายการเช็คได้ FIN " + itr_sqlca.sqlerrtext
		rollback	using itr_sqlca ;
		throw ithw_exception
	end if
next

commit using itr_sqlca ;

// ข้อมูลรอนำส่งเช็ค
lds_data.dataobject	= "d_senchq_list"
lds_data.settransobject( itr_sqlca )
li_row	= lds_data.retrieve( as_coopid , adtm_wdate )

as_sendchq_xml   = ""
if li_row > 0 then
	as_sendchq_xml = lds_data.describe( "Datawindow.data.Xml" )
end if
return		success
end function

public function integer of_postsavesendchq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_sendchq_xml, string as_waitchq_xml, string as_sendchqacc_xml, integer ai_accknow) throws Exception;long  ll_row 

n_ds		lds_chqsend	, lds_tobank , lds_chqwait

lds_chqsend	 = create		n_ds
lds_chqsend.dataobject = "d_senchq_list"

if not isnull( as_sendchq_xml ) and trim( as_sendchq_xml ) <> "" then
	this.of_importstring_xml( lds_chqsend , as_sendchq_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลรายการนำส่งเช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if


lds_tobank	= create n_ds
lds_tobank.dataobject = "d_senchq_acc_head"

if not isnull( as_sendchqacc_xml ) and trim( as_sendchqacc_xml ) <> "" then
	this.of_importstring_xml( lds_tobank , as_sendchqacc_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลธนาคารนำส่งเช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_chqwait	 = create		n_ds
lds_chqwait.dataobject = "d_senchq_list"

if not isnull( as_waitchq_xml ) and trim( as_waitchq_xml ) <> "" then
	this.of_importstring_xml( lds_chqwait , as_waitchq_xml )
end if

// เช็คนำส่ง
ll_row		= lds_chqsend.rowcount( )
if ll_row	> 0 then
	this.of_postsendchq( as_coopid , as_entry , adtm_wdate , as_machine , lds_chqsend , lds_tobank )
end if

// เช็ครอนำส่ง
ll_row		= lds_chqwait.rowcount( )
if ll_row	> 0 then
	this.of_postwaitchq( as_coopid , as_entry , adtm_wdate , as_machine , lds_chqwait , ai_accknow  )
end if

commit using itr_sqlca ;
return		success
end function

private function integer of_postsendchq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, n_ds ads_data, n_ds ads_bank) throws Exception;long		ll_row, ll_index, ll_seqno
string	ls_accid,ls_referslip, ls_referapp
string	ls_chqno, ls_bank, ls_bankbranch
string	ls_TOBANK_CODE, ls_TOBANK_BRANCH, ls_TOBANK_ACCNO
string	ls_BANK_CODE, ls_BANKBRANCH_CODE, ls_as_account
dec{2}	ldc_chqamt
datetime	ldtm_chqdate, ldtm_postdate
integer	li_normal_dept, li_post_tobank, li_chk
string	ls_docno, ls_year, ls_fnrecvno, ls_entryid
string	ls_paydesc, ls_bankcode, ls_memno, ls_itemtypecode, ls_machineid
string	ls_memname, ls_acciddes, ls_refslipno, ls_SLIPITEMTYPE_CODE , ls_waitsendchqaccid
integer	li_memflag
dec{2}	ldc_itemamt, ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx
dec{2}	ldc_accuint

ls_waitsendchqaccid	= this.of_getattribconstant( "waitchq_accid", "STRING")

Datawindowchild	ldwc_tobank
ads_bank.getchild( "as_account",ldwc_tobank )
ldwc_tobank.settransobject( itr_sqlca )
ldwc_tobank.retrieve(as_coopid)

ls_as_account		= ads_bank.object.as_account[1] ; if isnull( ls_as_account ) then ls_as_account = ""

if ls_as_account = "" or isnull( ls_as_account ) then
	ithw_exception.text	= "กรุณาเลือกบัญชีที่โอนเข้าครับ หรือ ตรวจสอบคู่บัญชีที่โอนเข้าครับ"
	rollback using itr_sqlca ;	
	throw ithw_exception
end if

ldwc_tobank.setfilter( "account_no = '" +ls_as_account+ "'")
ldwc_tobank.filter( )

ll_row = ldwc_tobank.getrow()
ls_accid				= trim( ldwc_tobank.getitemstring( ldwc_tobank.getrow(), "account_id" ) )
ls_TOBANK_CODE		= trim( ldwc_tobank.getitemstring( ldwc_tobank.getrow(), "bank_code" ) )
ls_TOBANK_BRANCH	= trim( ldwc_tobank.getitemstring( ldwc_tobank.getrow(), "bankbranch_code" ) )
ls_TOBANK_ACCNO	= trim( ldwc_tobank.getitemstring( ldwc_tobank.getrow(), "account_no" ) )

if isnull( ls_accid ) then ls_accid = ""

if ls_accid = "" or isnull( ls_accid ) then
	ithw_exception.text	= "กรุณาเลือกบัญชีที่โอนเข้าครับ หรือ ตรวจสอบคู่บัญชีที่โอนเข้าครับ"
	throw ithw_exception	
end if

ll_row	= ads_data.rowcount( )

// ทำการนำส่งเช็ค
for ll_index = 1 to ll_row
	ldc_chqamt		= ads_data.object.cheque_amt[ll_index]
	ls_referslip		= ads_data.object.slip_no[ll_index]
	ls_referapp		= ads_data.object.refer_app[ll_index]
	li_normal_dept	= ads_data.object.normal_dept[ll_index]
	ldtm_chqdate	= ads_data.object.entry_date[ll_index]
	li_post_tobank	= ads_data.object.post_tobank[ll_index]	
	
	if isnull( li_normal_dept ) then li_normal_dept = 1
	
	ls_chqno						= ads_data.object.check_no[ll_index]
	ls_BANK_CODE				= ads_data.object.bank_code[ll_index]
	ls_BANKBRANCH_CODE	= ads_data.object.bankbranch_code[ll_index]
	ll_seqno						= ads_data.object.seq_no[ll_index]
	
	UPDATE	FINCHECKRETRIEVE  
	SET		TOBANK_CODE		= :ls_TOBANK_CODE,   
				TOBANK_BRANCH	= :ls_TOBANK_BRANCH,   
				TOBANK_ACCNO	= :ls_TOBANK_ACCNO,   
				TOACC_ID			= :ls_accid,   
				POST_TOBANK		= 1,
				POST_DATE		= :adtm_wdate,
				old_posttobank	= :li_post_tobank
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_BANK_CODE ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_BANKBRANCH_CODE ) AND  
				( FINCHECKRETRIEVE.SEQ_NO				= :ll_seqno ) and
				( FINCHECKRETRIEVE.coop_id			= :as_coopid ) 
	using itr_sqlca	;
				
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถปรับปรุงการนำส่งเช็คได้ ครับ " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception		
	end if
	
	// ตรวจสอบว่าเป็นเช็คค้างหรือเช็ควันนี้
	choose case li_post_tobank
		case 0
			// เช็คที่ค้างส่งเป็น มานำส่ง			
			ls_fnrecvno				= this.of_get_lastslip_docno( "FNRECEIVENO" )
			ldc_accuint			= 0
			ldc_itemamt			= ads_data.object.cheque_amt[ll_index]
			ldc_share			= 0
			ldc_emer				= 0
			ldc_norm				= 0
			ldc_extra			= 0
			ldc_sharespx		= 0
			li_memflag			= 0
			ls_memname			= 'นำเช็คค้างฝากนำส่งธนาคาร'
			ls_acciddes			= ls_accid
			ls_itemtypecode	= 'DCA'
			ls_bankcode			= ls_BANK_CODE
			ls_bankbranch		= ls_BANKBRANCH_CODE			
			
			INSERT INTO	FINSLIP
			(	SLIP_NO,				ENTRY_ID,				ENTRY_DATE,				OPERATE_DATE,
				FROM_SYSTEM,		PAYMENT_STATUS,		CASH_TYPE,				PAYMENT_DESC,
				BANK_CODE,			BANK_BRANCH,			ITEMPAY_AMT,			PAY_TOWHOM,
				DATEON_CHQ,			MEMBER_NO,				ITEMPAYTYPE_CODE,		PAY_RECV_STATUS,
				MEMBER_FLAG,		NONMEMBER_DETAIL,		COOP_ID,			MACHINE_ID,
				CANCEL_ID,			CANCEL_DATE,			BANKFEE_AMT,			BANKSRV_AMT,
				TOFROM_ACCID,		ACCOUNT_NO,				CHEQUEBOOK_NO,			CHQ_ADVFLAG,
				ref_slipno,			remark,					SHARE_AMT,				emer_amt,
				norm_amt,			extra_amt, 				sharespx_amt,			tax_amt,
				tax_flag,			tax_rate,				item_amtnet,			foracc_flag,
				ref_system,			des_accid,				accuint_amt,			retail_flag,
				receive_date
			)  
			VALUES
			(	:ls_fnrecvno,		:ls_entryid,			:adtm_wdate,				:adtm_wdate,   
				'FIN',				1,							'CBT',					:ls_paydesc,
				:ls_bankcode,		:ls_bankbranch,		:ldc_itemamt,			null,   
				null,					:ls_memno,				:ls_itemtypecode,		1,   
				:li_memflag,		:ls_memname,			:as_coopid,				:ls_machineid,   
				null,					null,						0,							0,   
				:ls_acciddes,		null,						null,						null, 
				:ls_refslipno,		:ls_paydesc,			:ldc_share,				:ldc_emer,
				:ldc_norm,			:ldc_extra,				:ldc_sharespx,			0,
				0,						0,							:ldc_itemamt,			1,
				'DEP',				null,						:ldc_accuint,			0,
				:adtm_wdate
			)  	using itr_sqlca ;			
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลลง Finslip ได้ " + itr_sqlca.sqlerrtext
				rollback using itr_sqlca ;
				throw ithw_exception		
			end if
			
			ls_paydesc				= "นำเช็คค้างฝากนำส่งธนาคาร"
			ls_SLIPITEMTYPE_CODE	= "000"
			
			INSERT INTO FINSLIPDET 
			(	SLIP_NO,					COOP_ID,			SEQ_NO,						SLIPITEMTYPE_CODE,
				SLIPITEM_DESC,			SLIPITEM_STATUS,		CANCEL_ID,					CANCEL_DATE,
				POSTTOVC_FLAG,			VOUCHER_NO,				CANCELTOVC_FLAG,			CANCELVC_NO,
				DISPLAYONLY_STATUS,	ITEMPAY_AMT,			ACCOUNT_ID,					itempayamt_net
			)  
			VALUES
			(	:ls_fnrecvno,			:as_coopid,				1,								:ls_SLIPITEMTYPE_CODE,
				:ls_paydesc,			1,							null,				null,
				0,							null,						0,								null,
				0,							:ldc_itemamt,			:ls_waitsendchqaccid,	:ldc_itemamt
			)  	using itr_sqlca;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ " + itr_sqlca.sqlerrtext
				rollback using itr_sqlca ;
				throw ithw_exception						
			end if
			
			// update เพิ่มเติม
			UPDATE	FINCHECKRETRIEVE  
			SET		slip_no				= :ls_fnrecvno,   
						refer_app			= 'FIN',
						old_slip_no			= :ls_referslip,   
						old_refer_app		= :ls_referapp
			WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) AND  
						( FINCHECKRETRIEVE.BANK_CODE			= :ls_BANK_CODE ) AND  
						( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_BANKBRANCH_CODE ) AND  
						( FINCHECKRETRIEVE.SEQ_NO				= :ll_seqno ) and
						( FINCHECKRETRIEVE.coop_id			= :as_coopid ) 
			using itr_sqlca;
						
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถปรับปรุงการนำส่งเช็คได้ ครับ " + itr_sqlca.sqlerrtext
				rollback using itr_sqlca ;
				throw ithw_exception						
			end if
			
		case 8
			// ปรับปรุงคู่บัญชีที่มา
			choose case ls_referapp
				case "DEP"			
					choose case li_normal_dept
						case 1
							UPDATE	DPDEPTSLIP  
							SET		DPDEPTSLIP.TOFROM_ACCID		= :ls_accid
							WHERE	( DPDEPTSLIP.DEPTSLIP_NO	= :ls_referslip ) AND  
										( DPDEPTSLIP.coop_id		= :as_coopid ) 
							using itr_sqlca	;
							
							if itr_sqlca.sqlcode <> 0 then
								ithw_exception.text	= "ไม่สามารถปรับปรุงรหัสบัญชีที่เงินฝากได้ ครับ " + itr_sqlca.sqlerrtext
								rollback using itr_sqlca ;
								throw ithw_exception														
							end if
			
						case else
							UPDATE	DPDEPTSLIP  
							SET		DPDEPTSLIP.TOFROM_ACCID		= :ls_accid
							WHERE		( DPDEPTSLIP.refer_slipno	= :ls_referslip ) AND  
										( DPDEPTSLIP.COOP_ID	= :as_coopid )  and
										( DPDEPTSLIP.ENTRY_DATE		= :ldtm_chqdate ) 
							using itr_sqlca;
							
							if itr_sqlca.sqlcode <> 0 then
								ithw_exception.text	= "ไม่สามารถปรับปรุงรหัสบัญชีที่เงินฝากได้ ครับ " + itr_sqlca.sqlerrtext
								rollback using itr_sqlca ;
								throw ithw_exception														
							end if
			
					end choose
							
		
//				case "LON"
//					UPDATE	CMSHRLONSLIP  
//					SET		CMSHRLONSLIP.TOFROM_ACCID	= :ls_accid
//					WHERE		( CMSHRLONSLIP.SLIP_NO		= :ls_referslip ) AND  
//								( CMSHRLONSLIP.BRANCH_ID	= :as_branch ) 
//					using itr_sqlca	;
//								
//					if itr_sqlca.sqlcode <> 0 then
//						ithw_exception.text	= "ไม่สามารถปรับปรุงรหัสบัญชีที่สินเชื่อได้ ครับ "  + itr_sqlca.sqlerrtext
//						rollback using itr_sqlca ;
//						throw ithw_exception														
//					end if
					
				case "SHR"
					
				case "SHL"
					
				case "KEP"
					
				case "FIN"
					UPDATE	FINSLIP  
					SET		FINSLIP.TOFROM_ACCID		= :ls_accid
					WHERE		( FINSLIP.SLIP_NO			= :ls_referslip ) AND  
								( FINSLIP.COOP_ID	= :as_coopid )  
					using itr_sqlca ;

					if itr_sqlca.sqlcode <> 0 then
						ithw_exception.text	= "ไม่สามารถปรับปรุงรหัสบัญชีที่การเงินได้ ครับ " + itr_sqlca.sqlerrtext
						rollback using itr_sqlca ;
						throw ithw_exception														
					end if
			
				case "INV"
					
				case else
					
			end choose
			
			
			// update เพิ่มเติม
			UPDATE	FINCHECKRETRIEVE  
			SET		old_slip_no			= :ls_referslip,   
						old_refer_app		= :ls_referapp
			WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) AND  
						( FINCHECKRETRIEVE.BANK_CODE			= :ls_BANK_CODE ) AND  
						( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_BANKBRANCH_CODE ) AND  
						( FINCHECKRETRIEVE.SEQ_NO				= :ll_seqno ) and
						( FINCHECKRETRIEVE.coop_id			= :as_coopid ) 
			using itr_sqlca;
						
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถปรับปรุงการนำส่งเช็คได้ ครับ " + itr_sqlca.sqlerrtext
				rollback using itr_sqlca ;
				throw ithw_exception						
			end if
			
		case else
				
	end choose
	
	// ผ่านรายการไปยังธนาคาร
	this.of_posttobank( as_coopid, as_entry , adtm_wdate , as_machine , ls_accid , ldc_chqamt ,1 )

next

return success
end function

private function integer of_postwaitchq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, n_ds ads_data, integer ai_accknow) throws Exception;// ทำการรอนำส่งเช็ค
long		ll_row, ll_index, ll_seqno
string		ls_accid,ls_referslip, ls_referapp , ls_waitsendchqaccid
string		ls_chqno, ls_bank, ls_bankbranch
string		ls_BANK_CODE, ls_BANKBRANCH_CODE
dec{2}		ldc_chqamt
datetime		ldtm_chqdate
integer		li_normal_dept

ls_waitsendchqaccid	= this.of_getattribconstant( "waitchq_accid", "STRING")


ll_row			= ads_data.rowcount( )
for ll_index = 1 to ll_row
	ldc_chqamt		= ads_data.object.cheque_amt[ll_index]
	ls_referslip		= ads_data.object.slip_no[ll_index]
	ls_referapp		= ads_data.object.refer_app[ll_index]
	li_normal_dept	= ads_data.object.normal_dept[ll_index]
	ldtm_chqdate	= ads_data.object.entry_date[ll_index]
	
	if isnull( li_normal_dept ) then li_normal_dept = 1
	
	ls_chqno					= ads_data.object.check_no[ll_index]
	ls_BANK_CODE			= ads_data.object.bank_code[ll_index]
	ls_BANKBRANCH_CODE	= ads_data.object.bankbranch_code[ll_index]
	ll_seqno					= ads_data.object.seq_no[ll_index]
	
	UPDATE	FINCHECKRETRIEVE
	set			POST_TOBANK	= 0,
				TOACC_ID			= :ls_waitsendchqaccid
	WHERE	( FINCHECKRETRIEVE.CHECK_NO				= :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_BANK_CODE ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_BANKBRANCH_CODE ) AND  
				( FINCHECKRETRIEVE.SEQ_NO				= :ll_seqno ) and
				( FINCHECKRETRIEVE.coop_id				= :as_coopid )
	using itr_sqlca ;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถปรับปรุงการนำส่งเช็คได้ ครับ " + itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	// หากบัญชีไม่รับรู้ หรือ เป็นเช็คค้างมาก่อนวันนี้ 0 บัญชีรับรู้ 1 บัญชีไม่รับรู้
	if ( ai_accknow = 1 ) or ( date( ldtm_chqdate ) <> date( adtm_wdate ) ) then
		UPDATE	FINCHECKRETRIEVE
		set			ENTRY_DATE	= :adtm_wdate
		WHERE	( FINCHECKRETRIEVE.CHECK_NO				= :ls_chqno ) AND  
					( FINCHECKRETRIEVE.BANK_CODE			= :ls_BANK_CODE ) AND  
					( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_BANKBRANCH_CODE ) AND  
					( FINCHECKRETRIEVE.SEQ_NO				= :ll_seqno ) and
					( FINCHECKRETRIEVE.coop_id				= :as_coopid )
		using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถปรับปรุงการนำส่งเช็คได้ ครับ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ;
			throw ithw_exception			
		end if
	
		continue
	end if
	
	
	// ปรับปรุงคู่บัญชีที่มา
	choose case ls_referapp
		case "DEP"			
			choose case li_normal_dept
				case 1
					UPDATE	DPDEPTSLIP  
					SET		TOFROM_ACCID	= :ls_waitsendchqaccid
					WHERE	( DPDEPTSLIP.DEPTSLIP_NO	= :ls_referslip ) AND  
								( DPDEPTSLIP.COOP_ID	= :as_coopid )   
					using itr_sqlca ;
					
					if itr_sqlca.sqlcode <> 0 then
						ithw_exception.text	= "ไม่สามารถปรับปรุงรหัสบัญชีที่เงินฝากได้ ครับ "  + itr_sqlca.sqlerrtext 
						rollback using itr_sqlca ;
						throw ithw_exception									
					end if
	
				case else
					UPDATE	DPDEPTSLIP  
					SET		TOFROM_ACCID	= :ls_waitsendchqaccid
					WHERE	( DPDEPTSLIP.refer_slipno	= :ls_referslip ) AND  
								( DPDEPTSLIP.COOP_ID	= :as_coopid )  and
								( DPDEPTSLIP.ENTRY_DATE		= :ldtm_chqdate )
					using itr_sqlca 	;
					
					if itr_sqlca.sqlcode <> 0 then
						ithw_exception.text	= "ไม่สามารถปรับปรุงรหัสบัญชีที่เงินฝากได้ ครับ "  + itr_sqlca.sqlerrtext 
						rollback using itr_sqlca ;
						throw ithw_exception			
					end if
	
			end choose
					

//		case "LON"
//			UPDATE	CMSHRLONSLIP  
//			SET		TOFROM_ACCID	= :ls_waitsendchqaccid
//			WHERE	( CMSHRLONSLIP.SLIP_NO		= :ls_referslip ) AND  
//						( CMSHRLONSLIP.BRANCH_ID	= :as_branch )   
//			using itr_sqlca 	;
//			if itr_sqlca.sqlcode <> 0 then
//				ithw_exception.text	= "ไม่สามารถปรับปรุงรหัสบัญชีที่สินเชื่อได้ ครับ "  + itr_sqlca.sqlerrtext 
//				rollback using itr_sqlca ;
//				throw ithw_exception			
//			end if
			
		case "SHR"
			
		case "SHL"
			
		case "KEP"
			
		case "FIN"
			UPDATE	FINSLIP  
			SET		TOFROM_ACCID				= :ls_waitsendchqaccid
			WHERE	( FINSLIP.SLIP_NO			= :ls_referslip ) AND  
						( FINSLIP.COOP_ID	= :as_coopid )  
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถปรับปรุงรหัสบัญชีที่การเงินได้ ครับ "  + itr_sqlca.sqlerrtext 
				rollback using itr_sqlca ;
				throw ithw_exception			
			end if
	
		case "INV"
			
		case else
			
	end choose
next

return success
end function

private function integer of_posttobank (string as_coopid, string as_entry_id, datetime adtm_wdate, string as_machine, string as_accid, decimal adc_sumitemamt, integer ai_waycut) throws Exception;// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
dec{2}	ldc_scobal
string		ls_account_type, ls_slipbankno, ls_year, ls_account_name, ls_book_no
string		ls_bank,ls_bankbranch, ls_accno
long		ll_laststm_seq
integer	li_chk
string	ls_ITEM_CODE, ls_DETAIL_DESC
datetime	ldtm_open_date

if isnull( adc_sumitemamt  ) then adc_sumitemamt = 0
if isnull( ai_waycut ) then ai_waycut = 1

select	ACCOUNT_NO, BANK_CODE, BANKBRANCH_CODE
into		:ls_accno, :ls_bank, :ls_bankbranch
from		FINBANKACCOUNT
where		account_id		= :as_accid
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT 1 " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

select	SCO_BALANCE, laststm_seq, account_type, open_date, account_name, book_no
into		:ldc_scobal, :ll_laststm_seq, :ls_account_type, :ldtm_open_date, :ls_account_name, :ls_book_no
from		FINBANKACCOUNT
WHERE		(	ACCOUNT_NO			= :ls_accno ) AND  
			(	BANK_CODE			= :ls_bank ) AND  
			( 	BANKBRANCH_CODE	= :ls_bankbranch ) and
			(	COOP_ID		= :as_coopid )
using itr_sqlca ;

if itr_sqlca.sqlcode = -1 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT 2 " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

if isnull( ldc_scobal ) then ldc_scobal = 0			
if isnull( ll_laststm_seq ) then ll_laststm_seq = 0		

if ai_waycut > 0 then
	ls_ITEM_CODE	= "DCA"
	ls_DETAIL_DESC	= "ฝากเงิน"
else
	ls_ITEM_CODE	= "WCA"
	ls_DETAIL_DESC	= "ถอนเงิน"
end if

ldc_scobal		= ldc_scobal + ( adc_sumitemamt * ai_waycut )
ll_laststm_seq	+= 1
//li_chk			= lnv_docsrv.of_new( "FNRECEIPTBANK", ls_slipbankno, ls_year )
ls_slipbankno	= this.of_get_lastslip_docno( "FNRECEIPTBANK" )
//ls_slipbankno	=  right( trim( ls_year ), 2 ) + as_branch +  ls_slipbankno


INSERT INTO FINSLIP_BANK  
(	SLIP_NO,					ENTRY_ID,				ENTRY_DATE,				OPERATE_DATE,
	COOP_ID,			MACHINE_ID,				ACCOUNT_NO,				BANK_CODE,
	BANK_BRANCH,			ACCOUNT_NAME,			OPEN_DATE,				LAST_STM,
	ITEM_AMT,				BALANCE,					WITHDRAW_AMT,			ITEM_CODE,
	BOOK_NO,					ACCOUNT_TYPE,			sign_operate
)  
VALUES
(	:ls_slipbankno,		:as_entry_id,			:adtm_wdate,		:adtm_wdate,
	:as_coopid,				:as_machine,			:ls_accno,				:ls_bank,
	:ls_bankbranch,		:ls_account_name,		:ldtm_open_date,		:ll_laststm_seq,
	:adc_sumitemamt,		:ldc_scobal,			:ldc_scobal,			:ls_ITEM_CODE,
	:ls_book_no,			:ls_account_type,		:ai_waycut
)  using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINSLIP_BANK "  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca  ;
	throw ithw_exception
end if

INSERT INTO	FINBANKSTATEMENT
(		SEQ_NO,					ACCOUNT_NO,				BANK_CODE,
		BANKBRANCH_CODE,		DETAIL_DESC,			ENTRY_ID,
		ENTRY_DATE,				OPERATE_DATE,			REF_SEQ,
		ITEM_STATUS,			CANCEL_ID,				CANCEL_DATE,
		BALANCE,					BALANCE_BEGIN,			MACHINE_ID,
		COOP_ID,			refer_slipno,			item_amt,
		sign_operate
)
VALUES
( 		:ll_laststm_seq,		:ls_accno,				:ls_bank,
		:ls_bankbranch,		:ls_DETAIL_DESC,		:as_entry_id,
		:adtm_wdate,		:adtm_wdate,		null,
		1,							null,						null,
		:ldc_scobal,			0,							:as_machine,
		:as_coopid,				:ls_slipbankno,		:adc_sumitemamt,
		:ai_waycut
) using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKSTATEMENT " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

UPDATE	FINBANKACCOUNT
SET		SCO_BALANCE			= :ldc_scobal,
			laststm_seq			= :ll_laststm_seq
WHERE		( ACCOUNT_NO		= :ls_accno ) AND  
			( BANK_CODE			= :ls_bank ) AND  
			( BANKBRANCH_CODE	= :ls_bankbranch  ) and
			( COOP_ID	= :as_coopid )
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKACCOUNT "  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

return Success
end function

public function integer of_retrievecancel_sendchq (string as_coopid, datetime adtm_wdate, string as_bank_xml, ref string as_cancellist) throws Exception;/***********************************************
<description>
	กำหนด XMLConfig ดึงข้อมูลการนำส่งเช็คตามธนาคาร ที่นำส่งเช็คเพื่อรอทำรายการยกเลิกการนำส่ง
</description>

<arguments>
  	as_branch			รหัสสาขาสหกรณ์
	adtm_wdate			วันที่ ที่ทำรายการ
	as_bank_xml		ข้อมูลธนาคารที่นำส่งเช็ค
	as_cancellist		ข้อมูลการนำส่งเช็ค , ส่งค่ากลับคืนในรูปแบบ XML
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_retrievecancel_sendchq()
	
	Integer li_return 
	String ls_branch_id , ls_banklist_xml , ls_cancellist
	datetime	ldtm_wdate
	
	li_return = lnv_finservice.of_retrievecancel_sendchq( ls_branch_id , ldtm_wdate , ls_banklist_xml , ls_cancellist  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by PhaiWaan
	Version 1.1 แก้การ filter เลขที่บัญชีตัดยอดธนาคาร  Modified Date 18/10/2010 by PhaiWaan
</usage>
************************************************/

string	ls_bankaccno, ls_accid
n_ds	lds_data , lds_bank
datawindowchild	ldwc_tobank

lds_bank = create n_ds
lds_bank.dataobject = "d_senchq_acc_head"

if not isnull( as_bank_xml ) and trim( as_bank_xml ) <> "" then
	this.of_importstring_xml( lds_bank , as_bank_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if


lds_data = create n_ds
lds_data.dataobject = "d_cancel_senchq_list"
lds_data.settransobject( itr_sqlca )


ls_bankaccno	= trim( lds_bank.object.as_account[1] )
if isnull( ls_bankaccno ) then ls_bankaccno = ""

if ls_bankaccno = "" or isnull( ls_bankaccno ) then
	ithw_exception.text	= "กรุณาเลือกบัญชีธนาคารที่โอนออกครับ "
	throw ithw_exception
end if

lds_bank.getchild( "as_account" , ldwc_tobank )
ldwc_tobank.settransobject( itr_sqlca )
ldwc_tobank.retrieve(as_coopid)
ldwc_tobank.setfilter( "account_no='" + ls_bankaccno + "'" )
ldwc_tobank.filter( )

ls_accid			= trim( ldwc_tobank.getitemstring( 1 , "account_id" ) )

if isnull( ls_accid ) then ls_accid = ""

if ls_bankaccno = "" or isnull( ls_bankaccno ) then
	ithw_exception.text	= "กรุณาตรวจสอบคู่บัญชีที่โอนออกครับ"
	throw ithw_exception
end if

lds_data.retrieve( as_coopid ,adtm_wdate , ls_bankaccno, ls_accid )
as_cancellist	= ""
if lds_data.rowcount( ) > 0 then
	as_cancellist	= lds_data.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_data ) 
destroy( lds_bank ) 

return success
end function

public function integer of_postcancel_sendchq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_bank_xml, string as_cancellist_xml) throws Exception;/***********************************************
<description>
	ทำรายการยกเลิกการนำส่งเช็คตามที่ได้เลือกรายการ และทำรายการบันทึกถอนออกจากบัญชีธนาคารตามจำนวนยกเลิกนำส่ง
</description>

<arguments>
  	as_branch			รหัสสาขาสหกรณ์
	as_entry				รหัสผู้ทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_machine			ชื่อเครื่องที่ทำรายการ
	as_bank_xml		ข้อมูลธนาคารที่นำส่งเช็ค
	as_cancellist_xml	ข้อมูลการนำส่งเช็ค 
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postcancel_sendchq()
	
	Integer li_return 
	String ls_branch_id , ls_entry  , ls_machine ,ls_banklist_xml , as_cancellist_xml
	datetime	ldtm_wdate
	
	li_return = lnv_finservice.of_postcancel_sendchq( ls_branch_id , ls_entry , ldtm_wdate ,ls_machine ,  ls_banklist_xml , as_cancellist_xml  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by PhaiWaan
	Version 1.1 แก้การ Filter ดึงข้อมูลคู่บัญชี Modified Date 20/10/2010 by PhaiWaan
</usage>
************************************************/

long		ll_row, ll_index, ll_seqno
string	ls_accid,ls_referslip, ls_referapp
string	ls_chqno, ls_bank, ls_bankbranch
string	ls_BANK_CODE, ls_BANKBRANCH_CODE, ls_bankaccno, li_old_refer_app
dec{2}	ldc_chqamt
integer	li_post_tobank
string	ls_entryid, ls_refer_docno
string	ls_machineid
string	ls_refslipno, ls_old_slip_no
integer	li_select_flag

n_ds	lds_data , lds_bank
datawindowchild	ldwc_tobank

lds_bank = create n_ds
lds_bank.dataobject = "d_senchq_acc_head"

if not isnull( as_bank_xml ) and trim( as_bank_xml ) <> "" then
	this.of_importstring_xml( lds_bank , as_bank_xml )
else
	destroy lds_data 
	
	ithw_exception.text	= "ไม่มีข้อมูลธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_data = create n_ds
lds_data.dataobject = "d_cancel_senchq_list"

if not isnull( as_cancellist_xml ) and trim( as_cancellist_xml ) <> "" then
	this.of_importstring_xml( lds_data , as_cancellist_xml )
else
	destroy lds_bank
	ithw_exception.text	= "ไม่มีข้อมูลรายการเลือกยกเลิกนำส่งเช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if


ls_bankaccno	= trim( lds_bank.object.as_account[1]  )
if isnull( ls_bankaccno ) then ls_bankaccno = ""

if ls_bankaccno = "" or isnull( ls_bankaccno ) then
	destroy lds_bank
	destroy lds_data 
	ithw_exception.text	= "กรุณาเลือกบัญชีธนาคารที่โอนออกครับ "
	throw ithw_exception
end if

lds_bank.getchild( "as_account" , ldwc_tobank )
ldwc_tobank.settransobject( itr_sqlca )
ldwc_tobank.retrieve(as_coopid)
ldwc_tobank.setfilter( "account_no='" + ls_bankaccno + "'" )
ldwc_tobank.filter( )

ls_accid				= trim( ldwc_tobank.getitemstring( 1, "account_id" ) )

if ls_accid = "" or isnull( ls_accid ) then
	destroy lds_bank
	destroy lds_data 
	ithw_exception.text	= "กรุณาตรวจสอบคู่บัญชีที่โอนออกครับ"
	throw ithw_exception
end if

ll_row	= lds_data.rowcount( )

ll_index = lds_data.find( "select_flag=1" , 1 , ll_row )

if ll_index  < 1 then
	destroy lds_bank
	destroy lds_data 
	ithw_exception.text	= "กรุณาเลือกรายการนำ่ส่งเช็คที่ต้องการยกเิลิก"
	throw ithw_exception
end if

// ทำการนำส่งเช็ค
do while ll_index > 0
	ldc_chqamt		= lds_data.object.cheque_amt[ll_index]
	ls_referslip		= lds_data.object.slip_no[ll_index]
	ls_referapp		= lds_data.object.refer_app[ll_index]
	li_post_tobank	= lds_data.object.old_posttobank[ll_index]	
	ls_refer_docno	= lds_data.object.refer_docno[ll_index]
	
	ls_old_slip_no				= lds_data.object.old_slip_no[ll_index]
	li_old_refer_app			= lds_data.object.old_refer_app[ll_index]	
	ls_chqno						= lds_data.object.check_no[ll_index]
	ls_BANK_CODE				= lds_data.object.bank_code[ll_index]
	ls_BANKBRANCH_CODE	= lds_data.object.bankbranch_code[ll_index]
	ll_seqno						= lds_data.object.seq_no[ll_index]
						
	// ดึงข้มูลมาให้เหมือนเดิม
	UPDATE	FINCHECKRETRIEVE  
	SET		POST_TOBANK		= :li_post_tobank,
				refer_app		= :li_old_refer_app,
				slip_no			= :ls_old_slip_no
	WHERE	( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_BANK_CODE ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_BANKBRANCH_CODE ) AND  
				( FINCHECKRETRIEVE.SEQ_NO				= :ll_seqno ) and
				( FINCHECKRETRIEVE.coop_id			= :as_coopid ) 
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy lds_bank
		destroy lds_data 
		ithw_exception.text	= "ไม่สามารถปรับปรุงการยกเลิกนำส่งเช็คได้ ครับ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	// ผ่านรายการไปยังธนาคาร
	this.of_posttobank( as_coopid, as_entry , adtm_wdate , as_machine , ls_accid , ldc_chqamt ,-1 )


	choose case li_post_tobank
		case 0
			// กรณีที่เป็นเช็ครอนำฝากเดิมแล้วมานำฝาก แล้วทำการยกเลิก
			choose case ls_referapp
				case "FIN"
					UPDATE	FINSLIP
					SET		PAYMENT_STATUS		= -9  
					WHERE	( FINSLIP.SLIP_NO	= :ls_referslip ) AND  
								( FINSLIP.COOP_ID = :as_coopid )   
					using itr_sqlca ;
					
					if itr_sqlca.sqlcode <> 0 then
						destroy lds_bank
						destroy lds_data 
						ithw_exception.text	= "ไม่สามารถปรับปรุงการได้ ครับ UPDATE	FINSLIP " + itr_sqlca.sqlerrtext 
						rollback using itr_sqlca ;
						throw ithw_exception
					end if
					
				case else
					
			end choose
		case 8
			
	end choose
	
	ll_index++
	if ll_index > ll_row then
		exit
	end if
	
	ll_index = lds_data.find( "select_flag=1" , ll_index, ll_row )
	
loop

destroy lds_bank
destroy lds_data 
	
commit using itr_sqlca ;
return success
end function

public function integer of_retrievereprintreceipt (string as_coopid, string as_cond_xml, ref string as_list_xml) throws Exception;/***********************************************
<description>
	ดึงข้อมูลใบเสร็จ เพื่อทำการ Reprint 
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	as_cond_xml			ข้อมูลเงื่อนไขการดึงข้อมูล
	as_list_xml				ข้อมูลรายการใบเสร็จ
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_retrievereprintreceipt()
	
	Integer li_return
	String ls_branch , ls_cond_xml , ls_list_xml

	li_return = lnv_finservice.of_retrievereprintreceipt( ls_branch , ls_cond_xml , ls_list_xml )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 27/10/2010 by Phaiwaan
</usage>
************************************************/

integer		li_found, li_memflag
string		ls_memno, ls_receiptno, ls_sql, ls_fromsystem 
datetime	ldtm_date

n_ds 	lds_cond , lds_data

lds_cond 	= create n_ds
lds_cond.dataobject = "d_reprintreceipt_head"

if not isnull( as_cond_xml ) and trim( as_cond_xml ) <> "" then
	this.of_importstring_xml( lds_cond , as_cond_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการค้นหา ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_data		= create n_ds
lds_data.dataobject	= "d_reprintreceipt_list"
lds_data.settransobject( itr_sqlca )


ls_sql			= ""
ls_memno			= trim( lds_cond.object.as_memberno[1] )
ls_receiptno			= trim( lds_cond.object.as_receipt[1] )
li_memflag			= lds_cond.object.ai_memberflag[1]
ldtm_date			= lds_cond.object.adtm_date[1]
ls_fromsystem		= trim( lds_cond.object.from_system[1] )
//from_system

if isnull( ls_memno ) then ls_memno = ""
if isnull( ls_receiptno ) then ls_receiptno = ""

ls_sql			+= " and ( FINSLIP.COOP_ID = '" + as_coopid + "' ) "

if not isnull( ls_memno ) and trim( ls_memno ) <> ""  then
	ls_sql			+= " and ( finslip.member_no = '" + ls_memno + "' ) "
end if

if not isnull( ls_receiptno ) and trim( ls_receiptno ) <> "" then
	ls_sql			+= " and ( finslip.receipt_no = '" + ls_receiptno + "' ) "
end if

if not isnull( li_memflag ) then
	ls_sql			+= " and ( finslip.member_flag = " + string( li_memflag )  + " ) "
end if

if not isnull( ldtm_date ) then
	ls_sql			+= " and ( finslip.entry_date = to_date('" + string( ldtm_date , 'mm/dd/yyyy') + "','mm/dd/yyyy') )"
end if

if not isnull( ls_fromsystem ) and trim( ls_fromsystem ) <> ""  then
	ls_sql			+= " and ( finslip.from_system = '" + ls_fromsystem + "' ) "
end if

//ls_sql	+= " and ( finslip.pay_recv_status = 1 ) "

if trim( ls_sql ) <> "" then
	ls_sql		= lds_data.getsqlselect() + ls_sql
	lds_data.SetSQLselect( ls_sql )
	
	li_found		= lds_data.retrieve()
	
	if li_found < 1 then
		destroy( lds_data ) 
		ithw_exception.text	= "ไม่มีข้อมูลตามเงื่อนไข"
		throw ithw_exception
	end if
	
end if

as_list_xml	= lds_data.describe( "Datawindow.Data.Xml" )

destroy( lds_data ) 
destroy( lds_cond ) 

return Success
end function

public function integer of_postreprintreceipt (string as_coopid, datetime adtm_wdate, string as_list_xml, string as_formset, ref string as_message) throws Exception;/***********************************************
<description>
	ทำการ Reprint ใบสำเสร็จ
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	adtm_wdate				วันที่ทำรายการ
	as_list_xml				ข้อมูลรายการเลือกพิมพ์
	as_formset				ฟอร์ม Set การพิมพ์
	as_message				ข้อความแจ้งการพิมพ์
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postreprintreceipt()
	
	Integer li_return
	String ls_branch , ls_entry , ls_formset , ls_list_xml , ls_message
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postreprintreceipt( ls_branch , ldtm_wdate, ls_list_xml , ls_formset , ls_message )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 27/10/2010 by Phaiwaan
</usage>
************************************************/

string		ls_slipno , ls_thaibath
long		ll_index, ll_row, ll_find, ll_count
dec{2}	ldc_itemamt

datawindowchild	dwc_receiptslip

n_ds		lds_list , lds_printrecv

n_cst_thailibservice	lnv_thailib
lnv_thailib	 = create n_cst_thailibservice

lds_list	= create n_ds
lds_list.dataobject = "d_reprintreceipt_list" 

if not isnull( as_list_xml ) and trim( as_list_xml ) <> "" then
	this.of_importstring_xml( lds_list , as_list_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลทำรายการ Reprint slip ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_printrecv	= create n_ds
lds_printrecv.dataobject = "d_print_recv"
lds_printrecv.settransobject( itr_sqlca )

lds_printrecv.getchild( "dw_1" , dwc_receiptslip )
dwc_receiptslip.settransobject( itr_sqlca )

//// พิมพ์หรือไม่
//if cbx_printreceipt.checked = false then
//	return 1
//end if

ll_count	= lds_list.rowcount()

ll_find		= lds_list.find( "ai_select = 1", 1, ll_count )

do while ll_find > 0
	ls_slipno	= trim( lds_list.object.slip_no[ ll_find ] )
	
	// หากเลข slip ที่ส่งมาเป็นค่า NULL หรือ ไม่มีค่า
	if isnull( ls_slipno ) or trim( ls_slipno ) = "" then
		destroy lds_list 
		destroy lds_printrecv
		ithw_exception.text	= "ไม่มีเลขที่ใบทำรายการ"
		throw ithw_exception
	end if
	
	ii_reprint = 1
	this.of_postprintslip( as_coopid,ls_slipno , as_formset )	
	
	ll_find ++
	if ll_find > ll_count then
		exit
	end if
	ll_find		= lds_list.find( "ai_select = 1", ll_find, ll_count )
loop

as_message = ""
if ll_index > 0 then
	as_message =  "ส่งข้อมูลพิมพ์เรียบร้อยแล้ว" 
end if

destroy lds_list 
destroy lds_printrecv
		
return Success
end function

public function integer of_postprintslip (string as_coopid, string as_slipno, string as_formset) throws Exception;string		ls_slipno, ls_receiptno, ls_pay, ls_coopid , ls_refsystem , ls_refslipno 
string		ls_recv_dw, ls_pay_dw , ls_recvpayin_dw
dec{2}	ldc_itemamt
integer	li_pay ,li_row , li_wayprint_slip
datetime	ldtm_date

n_ds 	lds_printpay , lds_printrecv , lds_main , lds_printpayin

//datastore lds_printslip
//lds_printslip		= create datastore
//lds_printslip.dataobject = "d_print_pay"
//lds_printslip.Settransobject( sqlca )

lds_main		=	create n_ds
lds_main.dataobject = "d_fin_slipspc" 
lds_main.settrans( itr_sqlca )
lds_main.retrieve(as_coopid, as_slipno  )

li_row = lds_main.rowcount( )
if li_row < 1 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลเตรียมการพิมพ์ได้"
	throw ithw_exception
end if

// กำหนด Datawindow ในการพิมพ์
if ii_reprint = 1 then
	// ทำรายการ Reprint ใบทำรายการ
	ls_recv_dw			= "d_print_rcv_neted"
	ls_pay_dw 			= "d_print_pay_reprint"
	ls_recvpayin_dw	= "d_print_recvpayin_reprint"
else
	// พิมพ์ใบทำรายการปกติ
	ls_recv_dw			= "d_print_rcv_neted"
	ls_pay_dw 			= "d_print_pay"
	ls_recvpayin_dw	= "d_print_recvpayin"
end if

lds_printpay	= create n_ds
lds_printpay.dataobject = ls_pay_dw
lds_printpay.settransobject( itr_sqlca )

lds_printrecv	= create n_ds
lds_printrecv.dataobject = ls_recv_dw
lds_printrecv.settransobject( itr_sqlca )

lds_printpayin	= create n_ds
lds_printpayin.dataobject = ls_recvpayin_dw
lds_printpayin.settransobject( itr_sqlca )

li_pay					= lds_main.object.pay_recv_status[ 1 ]
ls_receiptno			= lds_main.object.receipt_no[1] ; if isnull( ls_receiptno ) then ls_receiptno = ""
ls_pay				= lds_main.object.payslip_no[1] ; if isnull( ls_pay ) then ls_pay = ""
ls_slipno				= lds_main.object.slip_no[1]
ls_coopid			= lds_main.object.coop_id[1]
ldtm_date			= lds_main.object.entry_date[1]
ls_refsystem		= trim( lds_main.object.from_system[1] ) 
ls_refslipno			= trim( lds_main.object.ref_slipno[1] ) 

if isnull( li_pay ) then li_pay = 0

//// พิมพ์หรือไม่
//if ( messagebox( "พิมพ์ใบเสร็จ / ใบสำคัญจ่าย ","ต้องการ พิมพ์ใบเสร็จ / ใบสำคัญจ่าย หรือไม่",Question!, YesNo!, 1 ) = 2 ) then
//	return 1
//end if
	
// ทำการพิมพ์ใบเสร็จ/ใบสำคัญจ่าย
if ( li_pay = 1 ) then 
//	1  พิมพ์ใบเสร็จ	
	choose case ls_refsystem
		case "FIN" 
//			lds_printrecv.Modify("DataWindow.Print.Paper.Size="+string( 255 )+"" )
//			lds_printrecv.Modify("DataWindow.Print.CustomPage.Length=" + string( 5500 ) )
//			lds_printrecv.Modify("DataWindow.Print.CustomPage.Width=" + string( 8500 ) )

		  	lds_printrecv.Object.DataWindow.Print.Paper.Size = 255 //ตั้งเป็น 256 ทุกครั้งไม่ต้องเปลี่ยน
			lds_printrecv.Object.DataWindow.Print.CustomPage.Length = 5500 //ตั้งความสูงกระดาษ (หน่วยเป็นมิลลิเมตร ไม่มีจุดทศนิยม)
			lds_printrecv.Object.DataWindow.Print.CustomPage.Width = 8500 //ความกว้างกระดาษ
			
			if lds_printrecv.retrieve( ls_coopid,ldtm_date , ls_slipno) > 0 then

//				openwithparm( print_preview, lds_printrecv)
				inv_print_srv.of_print( lds_printrecv , "FINRECEIPT" , as_formset  )
			else
				ithw_exception.text	= "ไม่มีข้อมูลสำหรับพิมพ์"
				throw ithw_exception
			end if
		case "SHL"
//			lds_printpayin.Modify("DataWindow.Print.Paper.Size="+string( 255 )+"" )
//			lds_printpayin.Modify("DataWindow.Print.CustomPage.Length=" + string( 8.50 ) )
//			lds_printpayin.Modify("DataWindow.Print.CustomPage.Width=" + string( 5.50 ) )

//			lds_printpayin.Object.DataWindow.Print.Paper.Size = 256 //ตั้งเป็น 256 ทุกครั้งไม่ต้องเปลี่ยน
//			lds_printpayin.Object.DataWindow.Print.CustomPage.Length = 155 //ตั้งความสูงกระดาษ (หน่วยเป็นมิลลิเมตร ไม่มีจุดทศนิยม)
//			lds_printpayin.Object.DataWindow.Print.CustomPage.Width = 210 //ความกว้างกระดาษ
			
			if lds_printpayin.retrieve( ls_coopid,ldtm_date , ls_refslipno  ) > 0 then
				inv_print_srv.of_print( lds_printpayin , "FINRECEIPT" , as_formset  )
			else
				destroy lds_printpay 
				destroy lds_printrecv 
				destroy lds_main 
				destroy lds_printpayin

				ithw_exception.text	= "ไม่มีข้อมูลสำหรับพิมพ์"
				throw ithw_exception
			end if
	end choose
else 
	//  0  ใบสำคัญจ่าย
	if lds_printpay.retrieve(ls_coopid, ldtm_date , ls_slipno ) > 0 then
		inv_print_srv.of_print( lds_printpay , "FINPAYOUT" , as_formset  )
	else
		destroy lds_printpay 
		destroy lds_printrecv 
		destroy lds_main 
		destroy lds_printpayin

		ithw_exception.text	= "ไม่มีข้อมูลสำหรับพิมพ์"
		throw ithw_exception
	end if
end if

destroy lds_printpay 
destroy lds_printrecv 
destroy lds_main 
destroy lds_printpayin

return success
end function

public function integer of_retrievereprintpayslip (string as_coopid, string as_cond_xml, ref string as_slip_xml) throws Exception;/***********************************************
<description>
	ดึงข้อมูลใบสำคัญจ่าย เพื่อทำการ Reprint 
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	as_cond_xml			ข้อมูลเงื่อนไขการดึงข้อมูล
	as_slip_xml				ข้อมูลรายการใบสำคัญจ่าย
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_retrievereprintpayslip()
	
	Integer li_return
	String ls_branch , ls_cond_xml , ls_slip_xml

	li_return = lnv_finservice.of_retrievereprintpayslip( ls_branch , ls_cond_xml , ls_slip_xml )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 27/10/2010 by Phaiwaan
</usage>
************************************************/

integer		li_found, li_memflag
string		ls_memno, ls_receiptno, ls_sql , ls_isql , ls_from_system
datetime	ldtm_date

n_ds 	lds_cond , lds_data

lds_cond 	= create n_ds
lds_cond.dataobject = "d_reprintreceipt_head"

if not isnull( as_cond_xml ) and trim( as_cond_xml ) <> "" then
	this.of_importstring_xml( lds_cond , as_cond_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการค้นหา ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_data		= create n_ds
lds_data.dataobject	= "d_reprintpay_list"
lds_data.settransobject( itr_sqlca )
ls_isql				= lds_data.getsqlselect( )

ls_sql				= ""
ls_memno		= trim( lds_cond.object.as_memberno[1] )
ls_receiptno		= trim( lds_cond.object.as_receipt[1] )
li_memflag		= lds_cond.object.ai_memberflag[1]
ldtm_date		= lds_cond.object.adtm_date[1]
ls_from_system	= trim( lds_cond.object.from_system[1] )

if isnull( ls_memno ) then ls_memno = ""
if isnull( ls_receiptno ) then ls_receiptno = ""

ls_sql			+= " and ( FINSLIP.COOP_ID = '" + as_coopid + "' ) "

if not isnull( ls_memno ) and trim( ls_memno ) <> ""  then
	ls_sql			+= " and ( finslip.member_no = '" + ls_memno + "' ) "
end if

if not isnull( ls_receiptno ) and trim( ls_receiptno ) <> "" then
	ls_sql			+= " and ( finslip.payslip_no = '" + ls_receiptno + "' ) "
end if

if not isnull( li_memflag ) then
	ls_sql			+= " and ( finslip.member_flag = " + string( li_memflag )  + " ) "
end if

if not isnull( ldtm_date ) then
	ls_sql			+= " and ( finslip.entry_date = to_date('" + string( ldtm_date , 'mm/dd/yyyy') + "','mm/dd/yyyy') )"
end if

if not isnull( ls_from_system ) then 
	ls_sql			+= " and ( finslip.from_system = '" + ls_from_system + "' )"
end if

if trim( ls_sql ) <> "" then
	ls_sql		= ls_isql + ls_sql
	lds_data.SetSQLselect( ls_sql )
	
	li_found		= lds_data.retrieve( )
	
	if li_found < 1 then
		destroy( lds_data ) 
		ithw_exception.text	= "ไม่มีข้อมูลตามเงื่อนไข"
		throw ithw_exception
	end if
	
end if

as_slip_xml	= lds_data.describe( "Datawindow.Data.Xml" )

destroy( lds_data ) 

return Success
end function

public function integer of_postreprintpayslip (string as_coopid, datetime adtm_wdate, string as_list_xml, string as_formset, ref string as_message) throws Exception;/***********************************************
<description>
	ทำการ Reprint ใบสำคัญจ่าย
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	adtm_wdate				วันที่ทำรายการ
	as_list_xml				ข้อมูลรายการเลือกพิมพ์
	as_formset				ฟอร์ม Set การพิมพ์
	as_message				ข้อความแจ้งการพิมพ์
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postreprintpayslip()
	
	Integer li_return
	String ls_branch , ls_entry , ls_formset , ls_list_xml , ls_message
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postreprintpayslip( ls_branch , ldtm_wdate, ls_list_xml , ls_formset , ls_message )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 27/10/2010 by Phaiwaan
</usage>
************************************************/

string		ls_slipno, ls_refer , ls_thaibath
long		ll_index, ll_row, ll_find, ll_count
dec{2}	ldc_itemamt
n_ds		lds_list , lds_printpay, lds_printpaysh, lds_printpayloan
datawindowchild	dwc_payslip
n_cst_thailibservice	lnv_thailib
lnv_thailib	 = create n_cst_thailibservice


lds_list	= create n_ds
lds_list.dataobject = "d_reprintpay_list" 

if not isnull( as_list_xml ) and trim( as_list_xml ) <> "" then
	this.of_importstring_xml( lds_list , as_list_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลทำรายการ Reprint slip ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_printpay	= create n_ds
lds_printpay.dataobject = "d_print_pay"
lds_printpay.settransobject( itr_sqlca )

lds_printpay.getchild( "dw_1" , dwc_payslip )
dwc_payslip.settransobject( itr_sqlca )

lds_printpayloan	= create n_ds
lds_printpayloan.dataobject = "d_print_pay_loan"
lds_printpayloan.settransobject( itr_sqlca )

lds_printpaysh	= create n_ds
lds_printpaysh.dataobject = "r_sl_share_widthdraw"
lds_printpaysh.settransobject( itr_sqlca )


//// พิมพ์หรือไม่
//if cbx_printreceipt.checked = false then
//	return 1
//end if

ll_count	= lds_list.rowcount()

ll_find		= lds_list.find( "ai_select = 1", 1, ll_count )

do while ll_find > 0
	ls_refer	= trim( lds_list.object.ref_system[ ll_find ] )
	
//	if 	 ls_refer = "SHR" then
//		ls_slipno	= trim( lds_list.object.ref_slipno[ ll_find ] )
//		
//		SELECT	SLIPSWD_NO
//		INTO		:ls_slipno
//		FROM		CMSHRWITHDRAW
//		WHERE	SHRWITHDRAW_NO	= :ls_slipno   ;
//
//	else 
//			ls_slipno	= trim( lds_list.object.slip_no[ ll_find ] )
//	end if
	
	ls_slipno	= trim( lds_list.object.slip_no[ ll_find ] )

	// หากเลข slip ที่ส่งมาเป็นค่า NULL หรือ ไม่มีค่า
	if isnull( ls_slipno ) or trim( ls_slipno ) = "" then
		ithw_exception.text	= "ไม่มีเลขที่ใบทำรายการ"
		throw ithw_exception
	end if
	
	choose case ls_refer
		case	"SHR"
			if lds_printpaysh.retrieve( adtm_wdate , ls_slipno , as_coopid ) > 0 then
				inv_print_srv.of_print( lds_printpaysh , "FINPAYOUT" , as_formset )
			else
				ithw_exception.text	= "ไม่มีข้อมูลสำหรับพิมพ์"
				throw ithw_exception
			end if
		case "LON"
			if lds_printpayloan.retrieve( adtm_wdate , ls_slipno , as_coopid ) > 0 then
				inv_print_srv.of_print( lds_printpayloan , "FINPAYOUT" , as_formset )
			else
				ithw_exception.text	= "ไม่มีข้อมูลสำหรับพิมพ์"
				throw ithw_exception
			end if
		case else
			
			ii_reprint = 1
			this.of_postprintslip( as_coopid,ls_slipno , as_formset )
//			if dwc_payslip.retrieve( adtm_wdate , ls_slipno , as_branch , "" ) > 0 then
//				ldc_itemamt		= dec( dwc_payslip.describe( "Evaluate(' sum( itempay_amt for all ) ' , 0 ) " ) )
//				ls_thaibath		= lnv_thailib.of_readthaibaht( ldc_itemamt )
//				lds_printpay.retrieve( adtm_wdate , ls_slipno , as_branch ,  ls_thaibath )
//				inv_print_srv.of_print( lds_printpay , "FINPAYOUT" , as_formset )
//			else
//				ithw_exception.text	= "ไม่มีข้อมูลสำหรับพิมพ์"
//				throw ithw_exception
//			end if
	end choose

	ll_find ++
	if ll_find > ll_count then
		exit
	end if
	ll_find		= lds_list.find( "ai_select = 1", ll_find, ll_count )
loop

as_message = ""
if ll_index > 0 then
	as_message =  "ส่งข้อมูลพิมพ์เรียบร้อยแล้ว" 
end if

destroy lds_list 
destroy lds_printpay
destroy lds_printpaysh
destroy lds_printpayloan

return Success
end function

public function integer of_retrievetaxpay (string as_coopid, string as_main_xml, ref string as_list_xml) throws Exception;integer	li_found, li_memflag
string	ls_memno, ls_slipno, ls_filter , ls_isql
datetime	ldtm_sdate , ldtm_edate

n_ds		lds_main , lds_item

lds_main		=	create n_ds
lds_main.dataobject = "d_reprinttax50_head" 

if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_main , as_main_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการค้นหา ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_item		=	create n_ds
lds_item.dataobject = "d_reprinttax50_list" 
lds_item.settrans( itr_sqlca )

ls_filter				= ""
ls_memno		= trim( lds_main.object.as_memberno[1] )
ls_slipno		= trim( lds_main.object.as_receipt[1] )
li_memflag		= lds_main.object.ai_memberflag[1]
ldtm_sdate		= lds_main.object.adtm_sdate[1]
ldtm_edate		= lds_main.object.adtm_edate[1]

li_found = lds_item.retrieve( as_coopid , ldtm_sdate , ldtm_edate )

if li_found < 1 then
	ithw_exception.text	= "ไม่เจอข้อมูลตามเงื่อนไข"
	throw ithw_exception
end if
	
if isnull( ls_memno ) then ls_memno = ""
if isnull( ls_slipno ) then ls_slipno = ""

if not isnull( ls_slipno ) and trim( ls_slipno ) <> "" then
	ls_filter			+= "  ( FINTAX.slip_no = '" + ls_slipno + "' ) "
end if

if not isnull( li_memflag ) then
	if ls_filter <> "" then	ls_filter += " and "
	ls_filter			+= "  ( FINSLIP.member_flag = " + string( li_memflag )  + " ) "
	
	if not isnull( ls_memno ) and trim( ls_memno ) <> ""  then
		if ls_filter <> "" then	ls_filter += " and "
		ls_filter			+= "  ( FINSLIP.member_no = '" + ls_memno + "' ) "
	end if

end if

if trim( ls_filter ) <> "" then
	lds_item.setfilter( ls_filter )
	lds_item.Filter( )
	
	li_found		= lds_item.rowcount( )
	as_list_xml = ""
	if li_found < 1 then
		ithw_exception.text	= "ไม่เจอข้อมูลตามเงื่อนไข"
		throw ithw_exception
	end if
	as_list_xml	=	lds_item.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_item ) 

return Success
end function

public function integer of_postreprinttaxpay (string as_coopid, datetime adtm_wdate, string as_slipno, integer ai_topay, integer ai_keep, integer ai_formcoop, string as_formset) throws Exception;string		ls_taxdoc_no , ls_thaibath
integer	li_index , li_row  
dec{2}	ldc_taxamt
// หากเลข slip ที่ส่งมาเป็นค่า NULL หรือ ไม่มีค่า
if isnull( as_slipno ) or trim( as_slipno ) = "" then return 1

n_cst_thailibservice	lnv_thailib
lnv_thailib	 = create n_cst_thailibservice

n_ds	lds_taxdata , lds_list

// พิมพ์ฟอร์มตามสหกรณ์
if ai_formcoop = 1 then
	this.of_postprinttaxpay( as_coopid , as_slipno , as_formset) 
end if

lds_list 	= create n_ds
lds_list.dataobject	= "d_taxpay_list"
lds_list.settransobject( itr_sqlca )
lds_list.retrieve( as_coopid , as_slipno)

li_row = lds_list.rowcount( )

for li_index = 1 to li_row 
		ls_taxdoc_no	= trim( lds_list.object.taxdoc_no[ li_index ] )
		ldc_taxamt		= lds_list.object.money_taxamt[ li_index ] 
		ls_thaibath		= lnv_thailib.of_readthaibaht(  ldc_taxamt  )
		
		// หนังสือสำหรับ ผู้ถูกหักภาษี ณ ที่จ่าย
		if ai_topay= 1 then	
			
			lds_taxdata	= create n_ds
			lds_taxdata.dataobject	= "fnd00013_tax50_master_head"
			lds_taxdata.settransobject( itr_sqlca )
			lds_taxdata.retrieve( as_coopid ,ls_taxdoc_no, ls_thaibath)
			lds_taxdata.accepttext( )
			if ( lds_taxdata.rowcount() > 0 )  then
				inv_print_srv.of_print( lds_taxdata , "FINTAXPAY" , as_formset  )
			end if
		
		end if
		
		// หนังสือสำหรับ ผู้หักภาษี ณ ที่จ่าย
		if ai_keep = 1 then
			
			lds_taxdata	= create n_ds
			lds_taxdata.dataobject	= "fnd00013_tax50_master_nohead"
			lds_taxdata.settransobject( itr_sqlca )
			lds_taxdata.retrieve( as_coopid ,ls_taxdoc_no ,ls_thaibath)
			lds_taxdata.accepttext( )			
			if ( lds_taxdata.rowcount() > 0 )  then
				inv_print_srv.of_print( lds_taxdata , "FINTAXPAY" , as_formset  )
			end if
			
		end if
next 

if isvalid( lds_taxdata ) then
	destroy( lds_taxdata )
end if

destroy lds_taxdata 
destroy lds_list

return success
end function

public function integer of_postprinttaxpay (string as_coopid, string as_slipno, string as_formset) throws Exception;n_ds	lds_taxdata 
dec{2}	ldc_money
string		ls_thaibath

n_cst_thailibservice	lnv_thailib
lnv_thailib	 = create n_cst_thailibservice


// พิมพ์ฟอร์มตามสหกรณ์
	lds_taxdata	= create n_ds
	lds_taxdata.dataobject	= "d_fin_fintax"
	lds_taxdata.settransobject( itr_sqlca )
	lds_taxdata.retrieve( as_coopid,as_slipno ,"")
	
	if ( lds_taxdata.rowcount() > 0 )  then
		ldc_money		= dec( lds_taxdata.describe( "Evaluate(' sum( money_taxamt  for all ) ' , 0 ) " ) )
		ls_thaibath		= lnv_thailib.of_readthaibaht(  ldc_money  )
		lds_taxdata.retrieve( as_coopid,as_slipno,ls_thaibath)
		
		inv_print_srv.of_print( lds_taxdata , "FINTAXPAYFORM" , as_formset  )
	end if
	
destroy lds_taxdata

return success
end function

public function integer of_init_close_day (string as_coopid, string as_entry_id, datetime adtm_wdate, string as_appname, ref string as_closeday_xml, ref string as_chqwait_xml) throws Exception;/**********************************************9*
<description>
	กำหนด XML Config ในการทำรายการปิดงานสิ้นวัน สรุปยอดเงินสดรับ ,ยอดเงินสดจ่าย ,ยอดเงินสดยกมา
	ยอดเงินสดยกไป และยอดเช็คค้างเซฟ เพื่อทำรายการปิดสิ้นวัน
</description>

<arguments>	
	as_branch_id		รหัสสาขาสหกรณ์
	as_entry_id			รหัสผู้ใช้ ที่ทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_appname		ชื่อระบบงานปัจจุบัน
	as_closeday_xml	ข้อมูลการปิดงานสิ้นวัน , ส่งค่ากลับคืนในรูปแบบ XML
	as_chqwait_xml	ข้อมูลเช็คค้างเซฟ , ส่งค่ากลับคืนในรูปแบบ XML
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_init_close_day()
	
	Integer li_return 
	String ls_branch , ls_entry , ls_machine , ls_appname , ls_closeday_xml , ls_chqwait_xml , ls_errmessage
	datetime 	ldtm_wdate
	
	li_return = lnv_finservice.of_init_close_day( ls_branch , ls_entry , ldtm_wdate , ls_machine , ls_appname , ls_closeday_xml , ls_chqwait_xml  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
	Version 1.1 แ้ก้หากไม่มีเช็คค้างจ่ายไม่ต้องคืนค่า XML  Modified Date 9/10/2010 by Phaiwaan
</usage>
************************************************/

datetime	ldtm_today, ldtm_closetime
dec{2}	ldc_balbegin, ldc_in, ldc_out, ldc_foward , ldc_chqamt
integer	li_rc , li_countchq , li_closestatus
string	ls_entryid

n_ds		lds_closeday , lds_chqwait

lds_closeday = create		n_ds
lds_closeday.dataobject = "d_close_day"
lds_closeday.settransobject( itr_sqlca )

lds_chqwait = create		n_ds
lds_chqwait.dataobject = "d_waitchq_list"
lds_chqwait.settransobject( itr_sqlca )

li_rc				= lds_closeday.retrieve( as_coopid,adtm_wdate )

if li_rc < 1 then
	destroy lds_closeday 
	destroy lds_chqwait
	ithw_exception.text	= "ยังไม่ได้เปิดงานประจำวัน ไม่สามารถทำรายการได้ " 
	throw ithw_exception
end if

// ตรวจสอบสถานะการปิดสิ้นวัน
li_closestatus = this.of_is_close_day( as_coopid , as_appname , adtm_wdate )
if li_closestatus = 1 then
	destroy lds_closeday 
	destroy lds_chqwait
	ithw_exception.text	= "ไม่สามารถทำรายการได้ เนื่องจากได้ปิดสิ้นวันแล้ว"
	throw ithw_exception
end if 

ldtm_closetime	= datetime( date( adtm_wdate ), now( ) )
ls_entryid		= as_entry_id

//lds_closeday.object.close_time[1] 		= ldtm_closetime
lds_closeday.object.close_time[1] 		= datetime( date( now() ) )
lds_closeday.object.close_date[1] 		= adtm_wdate 
//lds_closeday.object.close_tdate[1] 	= string( adtm_wdate ,'ddmmyyyy' )
lds_closeday.object.close_id[1] 		= ls_entryid 

ldc_balbegin		= lds_closeday.object.cash_begin[1]
ldc_in				= lds_closeday.object.cash_in[1]
ldc_out			= lds_closeday.object.cash_out[1]

if isnull( ldc_balbegin ) then ldc_balbegin = 0
if isnull( ldc_in ) then ldc_in = 0
if isnull( ldc_out ) then ldc_out = 0

ldc_foward		= lds_closeday.object.cash_sumamt[1]

//comment by cherry : กรณีที่ยอดยกไปติดลบ ก็ให้แสดงยอดติดลบตามจำนวนจริง
//if ldc_foward < 0 then ldc_foward = 0

lds_closeday.object.cash_foward[1] = ldc_foward 

// ดึงข้อมูลเช็คที่รอนำส่ง
li_countchq = lds_chqwait.retrieve( as_coopid )

if isnull ( li_countchq  ) then	li_countchq = 0
if li_countchq > 0 then
	
	ldc_chqamt	= lds_chqwait.object.compute_1[1]
	if isnull( ldc_chqamt ) then ldc_chqamt = 0.00

	lds_closeday.object.chqinsafe_amt[1]		= ldc_chqamt

end if

lds_closeday.object.chqinsafe_count[1]	= li_countchq

lds_closeday.accepttext( )
lds_chqwait.accepttext( )

as_closeday_xml 	= lds_closeday.describe( "Datawindow.data.XML" )
if lds_chqwait.rowcount( ) > 0 then
	as_chqwait_xml 	= lds_chqwait.describe( "Datawindow.data.XML" )
end if

destroy lds_closeday 
destroy lds_chqwait
	
return success
end function

public function integer of_retrievechq (string as_coopid, datetime adtm_wdate) throws Exception;n_ds	lds_data
integer	li_row, li_index, li_found, li_CHQ_STATUS
dec{2}	ldc_amount
string	ls_chqno, ls_bank, ls_bank_branch
string	ls_refer_slip
datetime	ldtm_CHECKDUE_DATE,ldtm_entry_time, ldtm_MUSTCLEAR_DATE
string	ls_entry_id, ls_REFERDOC_NAME, ls_REFERTYPE_CODE,ls_REFER_DOCNO
dec{2}	ldc_CHEQUE_AMT
integer	li_FLOAT_DAY, li_CHQLATE_STATUS, li_normal_dept

lds_data	= create n_ds

// จากเงินฝาก
lds_data.dataobject	= "d_recv_chqlist_dep"
lds_data.settransobject( itr_sqlca )
li_row	= lds_data.retrieve( as_coopid,adtm_wdate )
for li_index = 1 to li_row
	ls_chqno			= lds_data.object.check_no[li_index]
	ls_bank				= lds_data.object.bank_code[li_index]
	ls_bank_branch	= lds_data.object.bankbranch_code[li_index]
	
	if isnull( ls_chqno ) then ls_chqno = ""
	if isnull( ls_bank ) then ls_bank = ""
	if isnull( ls_bank_branch ) then ls_bank_branch = ""
	
	ls_refer_slip	= lds_data.object.deptslip_no[li_index]
	if isnull( ls_refer_slip ) then ls_refer_slip = ""
	
	if ( ls_refer_slip = "" ) or ( ls_chqno = "" ) or ( ls_bank = "" ) or ( ls_bank_branch = "" ) then continue
	
	li_found	= 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO   )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) and
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank) and
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch) and
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) AND  
				( FINCHECKRETRIEVE.SLIP_NO				= :ls_refer_slip )
	using	itr_sqlca 	;
				
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then continue
	
	li_found = 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch ) AND  
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) 
	using	itr_sqlca 	;
	
	if isnull( li_found ) then li_found = 0
	li_found ++
	
	ldc_CHEQUE_AMT			= lds_data.object.cheque_amt[li_index]
	ls_REFERDOC_NAME		= lds_data.object.deptaccount_name[li_index]
	ldtm_CHECKDUE_DATE	= lds_data.object.checkdue_date[li_index]
	ls_REFER_DOCNO			= lds_data.object.deptaccount_no[li_index] ;if isnull( ls_REFER_DOCNO ) then ls_REFER_DOCNO = ""
	li_CHQLATE_STATUS		= lds_data.object.chqlate_status[li_index]
	li_FLOAT_DAY			= lds_data.object.float_day[li_index]
	ldtm_MUSTCLEAR_DATE	= lds_data.object.mustclear_date[li_index]
	li_CHQ_STATUS			= lds_data.object.checkclear_status[li_index]
	li_normal_dept			= lds_data.object.normal_dept[li_index] ;if isnull( li_normal_dept ) then li_normal_dept = 1
	ls_REFERTYPE_CODE		= ""
	
	// ทำการบันทึกข้อมูลลงฐานข้อมูล
	INSERT INTO FINCHECKRETRIEVE  
	(	CHECK_NO,				CHECKDUE_DATE,				BANK_CODE,					BANKBRANCH_CODE,   
		CHECKCLEAR_STATUS,	ENTRY_DATE,					ENTRY_ID,					ENTRY_TIME,   
		FLOAT_DAY,				CHEQUE_AMT,					REFER_DOCNO,				REFERDOC_NAME,   
		COOP_ID,				REFERTYPE_CODE,			SLIP_NO,						SEQ_NO,   
		MUSTCLEAR_DATE,					CHEUQE_TYPE,				CHQLATE_STATUS,   
		FEE_AMT,					REFER_APP,					TOBANK_CODE,				TOBANK_BRANCH,   
		TOBANK_ACCNO,			TOACC_ID,					POST_TOBANK,				normal_dept
	)  
	VALUES
	(	:ls_chqno,				:ldtm_CHECKDUE_DATE,		:ls_bank,					:ls_bank_branch,
		:li_CHQ_STATUS,		:adtm_wdate,				:ls_entry_id,				:ldtm_entry_time,
		:li_FLOAT_DAY,			:ldc_CHEQUE_AMT,			:ls_REFER_DOCNO,			:ls_REFERDOC_NAME,
		:as_coopid,			:ls_REFERTYPE_CODE,		:ls_refer_slip,			:li_found,
		:ldtm_MUSTCLEAR_DATE,			null,							:li_CHQLATE_STATUS,
		0,							'DEP',						null,							null,
		null,						null,							0,								:li_normal_dept
	)  using	itr_sqlca 	;

	if itr_sqlca.sqlcode <> 0 then
		destroy( lds_data ) 
		ithw_exception.text	= "ไม่สามารถเพิ่มรายการเช็คได้ DEP "+ itr_sqlca.sqlerrtext
		rollback using	itr_sqlca;
		throw ithw_exception
	end if
	
next

// จากหุ้นหนี้
lds_data.dataobject	= "d_recv_chqlist_lon"
lds_data.settransobject( itr_sqlca )
li_row	= lds_data.retrieve(as_coopid, adtm_wdate )
for li_index = 1 to li_row
	ls_chqno			= trim( lds_data.object.expense_accid[li_index] )
	ls_bank			= trim( lds_data.object.expense_bank[li_index] )
	ls_bank_branch	= trim( lds_data.object.expense_branch[li_index] )
	
	if isnull( ls_chqno ) then ls_chqno = ""
	if isnull( ls_bank ) then ls_bank = ""
	if isnull( ls_bank_branch ) then ls_bank_branch = ""
	
	
	ls_refer_slip	= trim( lds_data.object.payoutslip_no[li_index] )
	if isnull( ls_refer_slip ) then ls_refer_slip = ""
	
	if ( ls_refer_slip = "" ) or ( ls_chqno = "" ) or ( ls_bank = "" ) or ( ls_bank_branch = "" ) then continue
	
	li_found	= 0
	
	// ตรวจสอบรายการซ้ำ
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO   )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) and
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank) and
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch) and
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) AND  
				( FINCHECKRETRIEVE.SLIP_NO				= :ls_refer_slip ) 
	using	itr_sqlca 	;
				
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then continue
	
	li_found = 0
	
	// หาจำนวนล่าสุด
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO = :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE = :ls_bank ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE = :ls_bank_branch ) AND  
				( FINCHECKRETRIEVE.COOP_ID = :as_coopid )   
	using	itr_sqlca 	;
	
	if isnull( li_found ) then li_found = 0
	li_found ++
	
	ldc_CHEQUE_AMT			= lds_data.object.payoutnet_amt[li_index]
	ls_REFERDOC_NAME		= lds_data.object.member_no[li_index]
	ldtm_CHECKDUE_DATE	= lds_data.object.dateon_chq[li_index]
	ls_REFER_DOCNO			= ls_refer_slip
	li_CHQLATE_STATUS		= 0
	li_FLOAT_DAY			= 1
	setnull( ldtm_MUSTCLEAR_DATE )
	ls_REFERTYPE_CODE		= ""
	
	// ทำการบันทึกข้อมูลลงฐานข้อมูล
	INSERT INTO FINCHECKRETRIEVE  
	(	CHECK_NO,				CHECKDUE_DATE,				BANK_CODE,					BANKBRANCH_CODE,   
		CHECKCLEAR_STATUS,	ENTRY_DATE,					ENTRY_ID,					ENTRY_TIME,   
		FLOAT_DAY,				CHEQUE_AMT,					REFER_DOCNO,				REFERDOC_NAME,   
		COOP_ID,				REFERTYPE_CODE,			SLIP_NO,						SEQ_NO,   
		MUSTCLEAR_DATE,					CHEUQE_TYPE,				CHQLATE_STATUS,   
		FEE_AMT,					REFER_APP,					TOBANK_CODE,				TOBANK_BRANCH,   
		TOBANK_ACCNO,			TOACC_ID,					POST_TOBANK,				normal_dept
	)  
	VALUES
	(	:ls_chqno,				:ldtm_CHECKDUE_DATE,		:ls_bank,					:ls_bank_branch,
		8,							:adtm_wdate,				:ls_entry_id,				:ldtm_entry_time,
		:li_FLOAT_DAY,			:ldc_CHEQUE_AMT,			:ls_REFER_DOCNO,			:ls_REFERDOC_NAME,
		:as_coopid,			:ls_REFERTYPE_CODE,		:ls_refer_slip,			:li_found,
		:ldtm_MUSTCLEAR_DATE,				null,							:li_CHQLATE_STATUS,
		0,							'LON',						null,							null,
		null,						null,							0,								1
	)  using	itr_sqlca 	;

	if itr_sqlca.sqlcode <> 0 then
		destroy( lds_data ) 
		ithw_exception.text	= "ไม่สามารถเพิ่มรายการเช็คได้ SHRLON "  + itr_sqlca.sqlerrtext
		rollback using	itr_sqlca;
		throw ithw_exception
	end if
	
next

// จากจัดเก็บ

// จากการลงทุน

// จากการเงิน
lds_data.dataobject	= "d_recv_chqlist_fin"
lds_data.settransobject( itr_sqlca )
li_row	= lds_data.retrieve( as_coopid,adtm_wdate )
for li_index = 1 to li_row
	ls_chqno			= lds_data.object.account_no[li_index]
	ls_bank			= lds_data.object.bank_code[li_index]
	ls_bank_branch	= lds_data.object.bank_branch[li_index]
	
	if isnull( ls_chqno ) then ls_chqno = ""
	if isnull( ls_bank ) then ls_bank = ""
	if isnull( ls_bank_branch ) then ls_bank_branch = ""
	
	
	ls_refer_slip	= lds_data.object.slip_no[li_index]
	if isnull( ls_refer_slip ) then ls_refer_slip = ""
	
	if ( ls_refer_slip = "" ) or ( ls_chqno = "" ) or ( ls_bank = "" ) or ( ls_bank_branch = "" ) then continue
	
	li_found	= 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO   )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO	= :ls_chqno ) and
				( FINCHECKRETRIEVE.BANK_CODE	= :ls_bank) and
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch) and
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) AND  
				( FINCHECKRETRIEVE.SLIP_NO		= :ls_refer_slip ) 
	using	itr_sqlca 	;
				
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then continue
	
	li_found = 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO	= :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE	= :ls_bank ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch ) AND  
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) 
	using	itr_sqlca 	;
	
	if isnull( li_found ) then li_found = 0
	li_found ++
	
	ldc_CHEQUE_AMT			= lds_data.object.item_amtnet[li_index]
	ls_REFERDOC_NAME		= lds_data.object.nonmember_detail[li_index]
	ldtm_CHECKDUE_DATE	= lds_data.object.dateon_chq[li_index]
	li_CHQLATE_STATUS		= 0
	li_FLOAT_DAY			= 0
	ldtm_MUSTCLEAR_DATE	= ldtm_CHECKDUE_DATE
	ls_REFERTYPE_CODE		= ""
	
	// ทำการบันทึกข้อมูลลงฐานข้อมูล
	INSERT INTO FINCHECKRETRIEVE  
	(	CHECK_NO,				CHECKDUE_DATE,				BANK_CODE,					BANKBRANCH_CODE,   
		CHECKCLEAR_STATUS,	ENTRY_DATE,					ENTRY_ID,					ENTRY_TIME,   
		FLOAT_DAY,				CHEQUE_AMT,					REFER_DOCNO,				REFERDOC_NAME,   
		COOP_ID,				REFERTYPE_CODE,			SLIP_NO,						SEQ_NO,   
		MUSTCLEAR_DATE,					CHEUQE_TYPE,				CHQLATE_STATUS,   
		FEE_AMT,					REFER_APP,					TOBANK_CODE,				TOBANK_BRANCH,   
		TOBANK_ACCNO,			TOACC_ID,					POST_TOBANK,				normal_dept
	)  
	VALUES
	(	:ls_chqno,				:ldtm_CHECKDUE_DATE,		:ls_bank,					:ls_bank_branch,
		8,							:adtm_wdate,				:ls_entry_id,				:ldtm_entry_time,
		:li_FLOAT_DAY,			:ldc_CHEQUE_AMT,			:ls_refer_slip,			:ls_REFERDOC_NAME,
		:as_coopid,			:ls_REFERTYPE_CODE,		:ls_refer_slip,			:li_found,
		:ldtm_MUSTCLEAR_DATE,				null,							:li_CHQLATE_STATUS,
		0,							'FIN',						null,							null,
		null,						null,							0,								1
	)  using	itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		destroy( lds_data ) 
		ithw_exception.text	= "ไม่สามารถเพิ่มรายการเช็คได้ FIN " + itr_sqlca.sqlerrtext
		rollback using	itr_sqlca;
		throw ithw_exception
	end if
next

destroy( lds_data ) 

return success
end function

private function integer of_is_posttobank (string as_coopid, datetime adtm_wdate) throws Exception;long	li_rc

select	count( ACCOUNT_ID )
into		:li_rc
from		FINITEMPOSTTOBANK
where		( POST_FLAG		= 0 ) and
			( ENTRY_DATE 	= :adtm_wdate ) and 
			( COOP_ID		= :as_coopid ) 
using		itr_sqlca ;
			
if isnull( li_rc ) then li_rc = 0

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	= "ไม่สามารถดึกข้อมูล การผ่านรายการธนาคารได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return li_rc
end function

private function integer of_is_open_allteller (string as_coopid, datetime adtm_wdate) throws Exception;integer	li_rc, li_status

li_status	= 11 // เปิดลิ้นชัก

select	count( user_name )
into		:li_rc
from		FINTABLEUSERMASTER
where		status		= :li_status and
			OPDATEWORK	=:adtm_wdate and
			coop_id	= :as_coopid 
using		itr_sqlca ;


if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบข้อมูลการปิดลิ้นชักได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return li_rc
end function

private function integer of_sendchqall (string as_coopid, datetime adtm_wdate) throws Exception;n_ds	lds_data
integer	li_row, li_index, li_found, li_CHQ_STATUS, li_posttobank
dec{2}	ldc_amount
string	ls_chqno, ls_bank, ls_bank_branch
string	ls_refer_slip
datetime	ldtm_CHECKDUE_DATE,ldtm_entry_time, ldtm_MUSTCLEAR_DATE
string	ls_entry_id, ls_REFERDOC_NAME, ls_REFERTYPE_CODE,ls_REFER_DOCNO
dec{2}	ldc_CHEQUE_AMT
integer	li_FLOAT_DAY, li_CHQLATE_STATUS, li_normal_dept
	

lds_data	= create n_ds
li_posttobank	= 8
// จากเงินฝาก
lds_data.dataobject	= "d_recv_chqlist_dep"
lds_data.settransobject( itr_sqlca )
li_row	= lds_data.retrieve( as_coopid,adtm_wdate )
for li_index = 1 to li_row
	ls_chqno			= lds_data.object.check_no[li_index]
	ls_bank			= lds_data.object.bank_code[li_index]
	ls_bank_branch	= lds_data.object.bankbranch_code[li_index]
	
	if isnull( ls_chqno ) then ls_chqno = ""
	if isnull( ls_bank ) then ls_bank = ""
	if isnull( ls_bank_branch ) then ls_bank_branch = ""
	
	
	ls_refer_slip	= lds_data.object.deptslip_no[li_index]
	if isnull( ls_refer_slip ) then ls_refer_slip = ""
	
	if ( ls_refer_slip = "" ) or ( ls_chqno = "" ) or ( ls_bank = "" ) or ( ls_bank_branch = "" ) then continue
	
	li_found	= 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO   )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) and
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank) and
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch) and
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) AND  
				( FINCHECKRETRIEVE.SLIP_NO				= :ls_refer_slip ) 
	using	itr_sqlca ;
				
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then continue
	
	li_found = 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch ) AND  
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) 
	using	itr_sqlca	;
	
	if isnull( li_found ) then li_found = 0
	li_found ++
	
	ldc_CHEQUE_AMT			= lds_data.object.cheque_amt[li_index]
	ls_REFERDOC_NAME		= lds_data.object.deptaccount_name[li_index]
	ldtm_CHECKDUE_DATE	= lds_data.object.checkdue_date[li_index]
	ls_REFER_DOCNO			= lds_data.object.deptaccount_no[li_index] ;if isnull( ls_REFER_DOCNO ) then ls_REFER_DOCNO = ""
	li_CHQLATE_STATUS		= lds_data.object.chqlate_status[li_index]
	li_FLOAT_DAY			= lds_data.object.float_day[li_index]
	ldtm_MUSTCLEAR_DATE	= lds_data.object.mustclear_date[li_index]
	li_CHQ_STATUS			= lds_data.object.checkclear_status[li_index]
	li_normal_dept			= lds_data.object.normal_dept[li_index] ;if isnull( li_normal_dept ) then li_normal_dept = 1
	ls_REFERTYPE_CODE		= ""
	
	// ทำการบันทึกข้อมูลลงฐานข้อมูล
	INSERT INTO FINCHECKRETRIEVE  
	(	CHECK_NO,				CHECKDUE_DATE,				BANK_CODE,					BANKBRANCH_CODE,   
		CHECKCLEAR_STATUS,	ENTRY_DATE,					ENTRY_ID,					ENTRY_TIME,   
		FLOAT_DAY,				CHEQUE_AMT,					REFER_DOCNO,				REFERDOC_NAME,   
		COOP_ID,				REFERTYPE_CODE,			SLIP_NO,						SEQ_NO,   
		MUSTCLEAR_DATE,						CHEUQE_TYPE,				CHQLATE_STATUS,   
		FEE_AMT,					REFER_APP,					TOBANK_CODE,				TOBANK_BRANCH,   
		TOBANK_ACCNO,			TOACC_ID,					POST_TOBANK,				normal_dept
	)  
	VALUES
	(	:ls_chqno,				:ldtm_CHECKDUE_DATE,		:ls_bank,					:ls_bank_branch,
		:li_CHQ_STATUS,		:adtm_wdate,					:ls_entry_id,				:ldtm_entry_time,
		:li_FLOAT_DAY,			:ldc_CHEQUE_AMT,			:ls_REFER_DOCNO,			:ls_REFERDOC_NAME,
		:as_coopid,				:ls_REFERTYPE_CODE,		:ls_refer_slip,			:li_found,
		:ldtm_MUSTCLEAR_DATE,					null,							:li_CHQLATE_STATUS,
		0,							'DEP',						null,							null,
		null,						null,							:li_posttobank,			:li_normal_dept
	) using	itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มรายการเช็คได้ DEP "  + itr_sqlca.sqlerrtext
		rollback using	itr_sqlca;
		throw ithw_exception
	end if
	
next

// จากหุ้นหนี้
lds_data.dataobject	= "d_recv_chqlist_lon"
lds_data.settransobject( itr_sqlca )
li_row	= lds_data.retrieve( as_coopid,adtm_wdate )
for li_index = 1 to li_row
	ls_chqno			= trim( lds_data.object.expense_accid[li_index] )
	ls_bank			= trim( lds_data.object.expense_bank[li_index] )
	ls_bank_branch	= trim( lds_data.object.expense_branch[li_index] )
	
	if isnull( ls_chqno ) then ls_chqno = ""
	if isnull( ls_bank ) then ls_bank = ""
	if isnull( ls_bank_branch ) then ls_bank_branch = ""
	
	
	ls_refer_slip	= trim( lds_data.object.slip_no[li_index] )
	if isnull( ls_refer_slip ) then ls_refer_slip = ""
	
	if ( ls_refer_slip = "" ) or ( ls_chqno = "" ) or ( ls_bank = "" ) or ( ls_bank_branch = "" ) then continue
	
	li_found	= 0
	
	// ตรวจสอบรายการซ้ำ
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO   )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE	( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) and
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank) and
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch) and
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) AND  
				( FINCHECKRETRIEVE.SLIP_NO				= :ls_refer_slip )
	using	itr_sqlca	;
				
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then continue
	
	li_found = 0
	
	// หาจำนวนล่าสุด
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE	( FINCHECKRETRIEVE.CHECK_NO = :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE = :ls_bank ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE = :ls_bank_branch ) AND  
				( FINCHECKRETRIEVE.COOP_ID = :as_coopid )  
	using	itr_sqlca	;
	
	if isnull( li_found ) then li_found = 0
	li_found ++
	
	ldc_CHEQUE_AMT			= lds_data.object.slip_amt[li_index]
	ls_REFERDOC_NAME		= lds_data.object.member_no[li_index]
	ldtm_CHECKDUE_DATE		= lds_data.object.cheque_date[li_index]
	ls_REFER_DOCNO			= ls_refer_slip
	li_CHQLATE_STATUS		= 0
	li_FLOAT_DAY				= 1
	setnull( ldtm_MUSTCLEAR_DATE )
	ls_REFERTYPE_CODE		= ""
	
	// ทำการบันทึกข้อมูลลงฐานข้อมูล
	INSERT INTO FINCHECKRETRIEVE  
	(	CHECK_NO,				CHECKDUE_DATE,			BANK_CODE,					BANKBRANCH_CODE,   
		CHECKCLEAR_STATUS,	ENTRY_DATE,				ENTRY_ID,					ENTRY_TIME,   
		FLOAT_DAY,				CHEQUE_AMT,				REFER_DOCNO,				REFERDOC_NAME,   
		COOP_ID,				REFERTYPE_CODE,			SLIP_NO,						SEQ_NO,   
		MUSTCLEAR_DATE,					CHEUQE_TYPE,				CHQLATE_STATUS,   
		FEE_AMT,					REFER_APP,					TOBANK_CODE,				TOBANK_BRANCH,   
		TOBANK_ACCNO,		TOACC_ID,					POST_TOBANK,				normal_dept
	)  
	VALUES
	(	:ls_chqno,					:ldtm_CHECKDUE_DATE,		:ls_bank,						:ls_bank_branch,
		8,							:adtm_wdate,						:ls_entry_id,					:ldtm_entry_time,
		:li_FLOAT_DAY,			:ldc_CHEQUE_AMT,			:ls_REFER_DOCNO,			:ls_REFERDOC_NAME,
		:as_coopid,					:ls_REFERTYPE_CODE,		:ls_refer_slip,					:li_found,
		:ldtm_MUSTCLEAR_DATE,					null,							:li_CHQLATE_STATUS,
		0,							'LON',							null,							null,
		null,						null,							:li_posttobank,					1
	) using	itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มรายการเช็คได้ LON "  + itr_sqlca.sqlerrtext
		rollback using	itr_sqlca;
		throw ithw_exception
	end if
	
next

// จากจัดเก็บ

// จากการลงทุน ตั๋ว
/*
lds_data.dataobject	= "d_recv_chqlist_prm"
lds_data.settransobject( itr_sqlca )
li_row	= lds_data.retrieve( adtm_wdate, as_branch_id )
for li_index = 1 to li_row
	ls_chqno			= lds_data.object.check_no[li_index]
	ls_bank			= lds_data.object.bank_code[li_index]
	ls_bank_branch	= lds_data.object.bankbranch_code[li_index]
	
	if isnull( ls_chqno ) then ls_chqno = ""
	if isnull( ls_bank ) then ls_bank = ""
	if isnull( ls_bank_branch ) then ls_bank_branch = ""
	
	
	ls_refer_slip	= lds_data.object.deptslip_no[li_index]
	if isnull( ls_refer_slip ) then ls_refer_slip = ""
	
	if ( ls_refer_slip = "" ) or ( ls_chqno = "" ) or ( ls_bank = "" ) or ( ls_bank_branch = "" ) then continue
	
	li_found	= 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO   )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) and
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank) and
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch) and
				( FINCHECKRETRIEVE.BRANCH_ORIGIN		= :as_branch_id ) AND  
				( FINCHECKRETRIEVE.SLIP_NO				= :ls_refer_slip ) ;
				
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then continue
	
	li_found = 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE		( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch ) AND  
				( FINCHECKRETRIEVE.BRANCH_ORIGIN		= :as_branch_id )   ;
	
	if isnull( li_found ) then li_found = 0
	li_found ++
	
	ldc_CHEQUE_AMT			= lds_data.object.cheque_amt[li_index]
	ls_REFERDOC_NAME		= lds_data.object.deptaccount_name[li_index]
	ldtm_CHECKDUE_DATE	= lds_data.object.checkdue_date[li_index]
	ls_REFER_DOCNO			= lds_data.object.deptaccount_no[li_index] ;if isnull( ls_REFER_DOCNO ) then ls_REFER_DOCNO = ""
	li_CHQLATE_STATUS		= lds_data.object.chqlate_status[li_index]
	li_FLOAT_DAY			= lds_data.object.float_day[li_index]
	ldtm_MUSTCLEAR_DATE	= lds_data.object.mustclear_date[li_index]
	li_CHQ_STATUS			= lds_data.object.checkclear_status[li_index]
	li_normal_dept			= lds_data.object.normal_dept[li_index] ;if isnull( li_normal_dept ) then li_normal_dept = 1
	ls_REFERTYPE_CODE		= ""
	
	// ทำการบันทึกข้อมูลลงฐานข้อมูล
	INSERT INTO FINCHECKRETRIEVE  
	(	CHECK_NO,				CHECKDUE_DATE,				BANK_CODE,					BANKBRANCH_CODE,   
		CHECKCLEAR_STATUS,	ENTRY_DATE,					ENTRY_ID,					ENTRY_TIME,   
		FLOAT_DAY,				CHEQUE_AMT,					REFER_DOCNO,				REFERDOC_NAME,   
		BRANCH_ID,				REFERTYPE_CODE,			SLIP_NO,						SEQ_NO,   
		MUSTCLEAR_DATE,		BRANCH_ORIGIN,				CHEUQE_TYPE,				CHQLATE_STATUS,   
		FEE_AMT,					REFER_APP,					TOBANK_CODE,				TOBANK_BRANCH,   
		TOBANK_ACCNO,			TOACC_ID,					POST_TOBANK,				normal_dept
	)  
	VALUES
	(	:ls_chqno,				:ldtm_CHECKDUE_DATE,		:ls_bank,					:ls_bank_branch,
		:li_CHQ_STATUS,		:adtm_wdate,					:ls_entry_id,				:ldtm_entry_time,
		:li_FLOAT_DAY,			:ldc_CHEQUE_AMT,			:ls_REFER_DOCNO,			:ls_REFERDOC_NAME,
		:as_branch_id,				:ls_REFERTYPE_CODE,		:ls_refer_slip,			:li_found,
		:ldtm_MUSTCLEAR_DATE,:as_branch_id,					null,							:li_CHQLATE_STATUS,
		0,							'DEP',						null,							null,
		null,						null,							:li_posttobank,			:li_normal_dept
	)  ;

	if itr_sqlca.sqlcode <> 0 then
		rollback  using	itr_sqlca;
		return -1
	end if
	
next
*/

// จากการเงิน
lds_data.dataobject	= "d_recv_chqlist_fin"
lds_data.settransobject( itr_sqlca )
li_row	= lds_data.retrieve( as_coopid,adtm_wdate )
for li_index = 1 to li_row
	ls_chqno			= lds_data.object.account_no[li_index]
	ls_bank			= lds_data.object.bank_code[li_index]
	ls_bank_branch	= lds_data.object.bank_branch[li_index]
	
	if isnull( ls_chqno ) then ls_chqno = ""
	if isnull( ls_bank ) then ls_bank = ""
	if isnull( ls_bank_branch ) then ls_bank_branch = ""
	
	
	ls_refer_slip	= lds_data.object.slip_no[li_index]
	if isnull( ls_refer_slip ) then ls_refer_slip = ""
	
	if ( ls_refer_slip = "" ) or ( ls_chqno = "" ) or ( ls_bank = "" ) or ( ls_bank_branch = "" ) then continue
	
	li_found	= 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO   )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE	( FINCHECKRETRIEVE.CHECK_NO			= :ls_chqno ) and
				( FINCHECKRETRIEVE.BANK_CODE			= :ls_bank) and
				( FINCHECKRETRIEVE.BANKBRANCH_CODE	= :ls_bank_branch) and
				( FINCHECKRETRIEVE.COOP_ID		= :as_coopid ) AND  
				( FINCHECKRETRIEVE.SLIP_NO				= :ls_refer_slip )
	using	itr_sqlca	;
				
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then continue
	
	li_found = 0
	
	SELECT	count( FINCHECKRETRIEVE.CHECK_NO )
	INTO		:li_found
	FROM		FINCHECKRETRIEVE  
	WHERE	( FINCHECKRETRIEVE.CHECK_NO = :ls_chqno ) AND  
				( FINCHECKRETRIEVE.BANK_CODE = :ls_bank ) AND  
				( FINCHECKRETRIEVE.BANKBRANCH_CODE = :ls_bank_branch ) AND  
				( FINCHECKRETRIEVE.COOP_ID = :as_coopid )  
	using	itr_sqlca	;
	
	if isnull( li_found ) then li_found = 0
	li_found ++
	
	ldc_CHEQUE_AMT			= lds_data.object.item_amtnet[li_index]
	ls_REFERDOC_NAME		= lds_data.object.nonmember_detail[li_index]
	ldtm_CHECKDUE_DATE	= lds_data.object.dateon_chq[li_index]
	li_CHQLATE_STATUS		= 0
	li_FLOAT_DAY			= 0
	ldtm_MUSTCLEAR_DATE	= ldtm_CHECKDUE_DATE
	ls_REFERTYPE_CODE		= ""
	
	// ทำการบันทึกข้อมูลลงฐานข้อมูล
	INSERT INTO FINCHECKRETRIEVE  
	(	CHECK_NO,				CHECKDUE_DATE,				BANK_CODE,					BANKBRANCH_CODE,   
		CHECKCLEAR_STATUS,	ENTRY_DATE,					ENTRY_ID,					ENTRY_TIME,   
		FLOAT_DAY,				CHEQUE_AMT,					REFER_DOCNO,				REFERDOC_NAME,   
		COOP_ID,				REFERTYPE_CODE,			SLIP_NO,						SEQ_NO,   
		MUSTCLEAR_DATE,						CHEUQE_TYPE,				CHQLATE_STATUS,   
		FEE_AMT,					REFER_APP,					TOBANK_CODE,				TOBANK_BRANCH,   
		TOBANK_ACCNO,			TOACC_ID,					POST_TOBANK,				normal_dept
	)  
	VALUES
	(	:ls_chqno,				:ldtm_CHECKDUE_DATE,		:ls_bank,					:ls_bank_branch,
		8,							:adtm_wdate,					:ls_entry_id,				:ldtm_entry_time,
		:li_FLOAT_DAY,			:ldc_CHEQUE_AMT,			:ls_refer_slip,			:ls_REFERDOC_NAME,
		:as_coopid,				:ls_REFERTYPE_CODE,		:ls_refer_slip,			:li_found,
		:ldtm_MUSTCLEAR_DATE,					null,							:li_CHQLATE_STATUS,
		0,							'FIN',						null,							null,
		null,						null,							:li_posttobank,			1
	)  using	itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มรายการเช็คได้ FIN "  + itr_sqlca.sqlerrtext
		rollback using	itr_sqlca;
		throw ithw_exception
	end if
next

li_row	= 0

// จากเดิม from  FINTABLEUSERMASTER
select	count( FINCHECKRETRIEVE.CHECK_NO )
into		:li_row
from		FINCHECKRETRIEVE
where		( FINCHECKRETRIEVE.POST_TOBANK = 8 ) and
			( FINCHECKRETRIEVE.COOP_ID = :as_coopid )
using	itr_sqlca	;
			
if li_row > 0 then
	ithw_exception.text	= "ไม่สามารถปิดงานสิ้นวันได้ เนื่องจากยังมีเช็ครอนำส่ง " + itr_sqlca.sqlerrtext
	rollback using	itr_sqlca;
	throw ithw_exception
end if


return SUCCESS
end function

private function integer of_trackingbank (string as_coopid, datetime adtm_wdate) throws Exception;//================================== 
// Function :of_trackingbank 
// เป็น function สรุปยอดคงเหลือธนาคาร
// ยอดยกมาจากวันก่อน , ยอดจ่ายออก , ยอดรับเข้า , ยอดคงเหลือ หลังสิ้นวัน
//==================================


n_ds 	lds_banklist
integer		li_row, li_index, li_found
string		ls_bankaccno, ls_bankcode, ls_branchcode
dec{2}		ldc_begin, ldc_end, ldc_incoming, ldc_outgoing

lds_banklist	= create n_ds
lds_banklist.dataobject	= "d_fin_bankaccount_tracking"
lds_banklist.settransobject( itr_sqlca )

li_row			= lds_banklist.retrieve( as_coopid )

ldc_end			= 0
ldc_incoming	= 0
ldc_outgoing	= 0
ldc_begin		= 0

for li_index = 1 to li_row
	
	ls_bankaccno		= lds_banklist.object.account_no[li_index]
	ls_bankcode			= lds_banklist.object.bank_code[li_index]
	ls_branchcode		= lds_banklist.object.bankbranch_code[li_index]
	ldc_end				= lds_banklist.object.sco_balance[li_index]
	
	if isnull( ldc_end ) then ldc_end = 0
	
	select	count( ACCOUNT_NO )
	into		:li_found
	from		FINCLOSEBANKDAY
	where	ACCOUNT_NO				= :ls_bankaccno and
				BANK_CODE					= :ls_bankcode and
				BANKBRANCH_CODE		= :ls_branchcode and
				COOP_ID			= :as_coopid and
				CLOSE_DATE				= :adtm_wdate
	using itr_sqlca	;
	
	if isnull( li_found ) then li_found = 0
	
	
	SELECT	sum( item_amt )  
	INTO		:ldc_incoming
	FROM	FINSLIP_BANK  
	WHERE ( operate_date			= :adtm_wdate ) AND  
				( COOP_ID	= :as_coopid ) AND  
				( ACCOUNT_NO		= :ls_bankaccno ) AND  
				( BANK_CODE			= :ls_bankcode ) AND  
				( BANK_BRANCH		= :ls_branchcode ) AND  
				( ITEM_CODE in ( 'DCA','OCA' ) )  
	using itr_sqlca	;
				
	if isnull( ldc_incoming ) then ldc_incoming = 0
	
	SELECT	sum( item_amt )  
	INTO		:ldc_outgoing
	FROM	FINSLIP_BANK  
	WHERE ( operate_date			= :adtm_wdate ) AND  
				( COOP_ID	= :as_coopid ) AND  
				( ACCOUNT_NO		= :ls_bankaccno ) AND  
				( BANK_CODE			= :ls_bankcode ) AND  
				( BANK_BRANCH		= :ls_branchcode ) AND  
				( ITEM_CODE in ( 'WCA','CCA' ) ) 
	using itr_sqlca	;
				
	if isnull( ldc_outgoing ) then ldc_outgoing = 0
	
	
	if li_found < 1 then
		ldc_begin		= 0
	
		INSERT INTO FINCLOSEBANKDAY  
		(	ACCOUNT_NO,						BANK_CODE,					BANKBRANCH_CODE,
			COOP_ID,					CLOSE_DATE,					BALANCE_BEGIN,
			INCOMING_AMT,					OUTGOING_AMT,				BALANCE_END
		)  
		VALUES
		(	:ls_bankaccno,						:ls_bankcode,					:ls_branchcode,
			:as_coopid,						:adtm_wdate,					:ldc_begin,
			:ldc_incoming,						:ldc_outgoing,					:ldc_end
		) using itr_sqlca  ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูล รายการธนาคารได้~r~n"  + itr_sqlca.sqlerrtext
			rollback using itr_sqlca ;
			throw ithw_exception		
		end if
		
	else
		update		FINCLOSEBANKDAY
		set			INCOMING_AMT			= :ldc_incoming,
						OUTGOING_AMT		= :ldc_outgoing,
						BALANCE_END			= :ldc_end
		where		ACCOUNT_NO			= :ls_bankaccno and
						BANK_CODE				= :ls_bankcode and
						BANKBRANCH_CODE	= :ls_branchcode and
						COOP_ID		= :as_coopid and
						CLOSE_DATE			= :adtm_wdate 
		using itr_sqlca ;
						
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถทำการปรับปรุงข้อมูล รายการธนาคารได้~r~n"  + itr_sqlca.sqlerrtext
			rollback using itr_sqlca ;
			throw ithw_exception		
		end if
		
	end if
	
next


return Success
end function

private function integer of_updatechqin_safe (string as_coopid, datetime adtm_wdate, n_ds ads_data) throws Exception;long		ll_index, ll_row, ll_seq
long		ll_insafedeq
string	ls_CHECK_NO, ls_BANK_CODE, ls_BANKBRANCH_CODE


ll_row			= ads_data.rowcount( )
ll_insafedeq	= 0

for ll_index = 1 to ll_row
	ll_insafedeq ++
	
	ll_seq							= ads_data.object.seq_no[ll_index]
	
	if isnull( ll_seq ) then return success
	
	
	ls_CHECK_NO				= ads_data.object.check_no[ll_index]
	ls_BANK_CODE				= ads_data.object.bank_code[ll_index]
	ls_BANKBRANCH_CODE	= ads_data.object.bankbranch_code[ll_index]
	
	INSERT INTO FINCHEQUE_INSAFE
	(	OPERATE_DATE,				CHECK_NO,				BANK_CODE,   
		BANKBRANCH_CODE,			SEQ_NO ,					COOP_ID,
		insafe_seq
	)  
	VALUES
	(	:adtm_wdate,				:ls_CHECK_NO,			:ls_BANK_CODE,
		:ls_BANKBRANCH_CODE,		:ll_seq,					:as_coopid,
		:ll_insafedeq
	)	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถทำการบันทึกข้อมูลลง FINCHEQUE_INSAFE ได้ " + itr_sqlca.sqlerrtext 
		rollback using	itr_sqlca	;
		throw ithw_exception
	end if
	
next

return success
end function

private function integer of_updateclosestatus (string as_coopid, string as_entry_id, string as_appname, datetime adtm_wdate) throws Exception;integer		li_rc, li_closeday_status, li_row
string			ls_year, ls_docno
date			ldte_lastmonth, ldte_lastyear , ldte_date 

n_ds	lds_data

lds_data	= create n_ds
lds_data.dataobject = "d_fin_cancelshl_remain"
lds_data.settransobject( itr_sqlca )

ldte_date		=	date( adtm_wdate )

li_closeday_status		= 1

//	เปลี่ยนสถานะของการปิดงานเป็น ปิดงาน
update	amappstatus
set		closeday_status	= :li_closeday_status,
			closeday_id			= :as_entry_id,
			closeday_date		= :adtm_wdate
where		application		= :as_appname and
			coop_id			= :as_coopid
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0  then	
	ithw_exception.text	= "ไม่สามารถเปลี่ยนสถานะวันทำการได้ " + itr_sqlca.sqlerrtext
	rollback	using	itr_sqlca	;
	throw ithw_exception
end if


// ตรวจสอบวันสิ้นเดือน
ldte_lastmonth		= inv_datetime.of_lastdayofmonth( ldte_date)
if date( ldte_lastmonth ) = date( adtm_wdate ) then
	update	amappstatus
	set		closemonth_status	= :li_closeday_status,
				closemonth_id		= :as_entry_id,
				closemonth_date	= :adtm_wdate
	where		application			= :as_appname and
				coop_id			= :as_coopid 
	using		itr_sqlca	;
	
	if itr_sqlca.sqlcode <> 0  then	
		ithw_exception.text	= "ไม่สามารถเปลี่ยนสถานะวันทำการสิ้นเดือนได้ "+ itr_sqlca.sqlerrtext
		rollback	using	itr_sqlca	;
		throw ithw_exception
	end if
end if

// รอ common วันสุดท้ายของปี by Phai ไ้ด้แล้วอย่าลืมลบ ด้วยนะ
//// ตรวจสอบสิ้นปี
//ldte_lastyear		= inv_datetime.of_getlastdayofyear( ldte_date )
//if date( ldte_lastyear ) = date( adtm_wdate ) then
//	update	amappstatus
//	set		closeyear_status	= :li_closeday_status,
//				closeyear_id		= :as_entry_id,
//				closeyear_date		= :adtm_wdate
//	where		application			= :as_appname and
//				branch_id			= :as_branch_id 
//	using		itr_sqlca	;
//	
//	if itr_sqlca.sqlcode <> 0  then	
//		ithw_exception.text	= "ไม่สามารถเปลี่ยนสถานะวันทำการสิ้นปีได้ "+ itr_sqlca.sqlerrtext
//		rollback	using	itr_sqlca	;
//		throw ithw_exception
//	end if
//	
//	li_rc	=	this.of_clear_docno( as_branch_id )
//	if li_rc <> success then
//		return		failure
//	end if
//	
//end if

return 1
end function

private function integer of_is_recvpay_pending (string as_coopid, datetime adtm_wdate) throws Exception;integer		li_rc

select count(*)
into	:li_rc
from 	finslip
where	entry_date	=	:adtm_wdate
and	payment_status = 8 
and	retail_flag	<> 3
and	coop_id	=	:as_coopid
using	itr_sqlca	;

if isnull( li_rc ) then	li_rc = 0 

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบข้อมูลการรายรับ-จ่ายประจำัวันได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return		li_rc
end function

public function integer of_retrievereprintchq (string as_coopid, string as_retreive_xml, ref string as_chqlist_xml) throws Exception;/***********************************************
<description>
	ดึงข้อมูล Cheque เพื่อทำการ Reprint 
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	as_retreive_xml		ข้อมูลเงื่อนไขการดึงข้อมูล
	as_chqlist_xml			ข้อมูลรายการ Cheque
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_retrievereprintchq()
	
	Integer li_return
	String ls_branch , ls_retreive_xml , ls_chqlist_xml 

	li_return = lnv_finservice.of_retrievereprintchq( ls_branch , ls_retreive_xml , ls_chqlist_xml  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 27/10/2010 by Phaiwaan
</usage>
************************************************/

datetime		ldtm_date
string			ls_chqno, ls_bank, ls_bankbranch, ls_sql , ls_isql
integer		li_printflag, li_chk

n_ds 	lds_retrieve , lds_data

lds_retrieve  = create n_ds
lds_retrieve.dataobject = "d_conditionprint_chequefromchq"

if not isnull( as_retreive_xml ) and trim( as_retreive_xml ) <> "" then
	this.of_importstring_xml( lds_retrieve , as_retreive_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการค้นหา ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_data   = create n_ds
lds_data.dataobject = "d_chequelist_fromcheque"
lds_data.settransobject( itr_sqlca )

ls_isql		= lds_data.getsqlselect(  )

ls_sql			= ""
li_chk			= 0
ldtm_date		= lds_retrieve.object.adtm_date[1]
ls_chqno			= trim( lds_retrieve.object.as_chqstart_no[1] )
ls_bank			= trim( lds_retrieve.object.as_bank[1] )
ls_bankbranch	= trim( lds_retrieve.object.as_bankbranch[1] )
li_printflag		= lds_retrieve.object.ai_printflag[1]

if isnull( ls_chqno ) then ls_chqno = ""
if isnull( ls_bankbranch ) then ls_bankbranch = ""
if isnull( ls_bank ) then ls_bank = ""


// วันที่
if not isnull( ldtm_date ) then
	li_chk ++
	ls_sql		= " and ( FINCHQEUESTATEMENT.DATE_ONCHQ = to_date('" + string( ldtm_date , 'mm/dd/yyyy') + "','mm/dd/yyyy') ) "
end if

// สถานะ
if not isnull( li_printflag ) then
	li_chk ++
	if li_chk = 1 then
		ls_sql		= " and ( FINCHQEUESTATEMENT.printed_status = " + string( li_printflag ) + " ) "
	else
		ls_sql		+= " and ( FINCHQEUESTATEMENT.printed_status = " + string( li_printflag ) + " ) "
	end if
	
end if

// ธนาคาร
if not isnull( ls_bank ) and ls_bank <> "" then
	li_chk ++
	if li_chk = 1 then
		ls_sql		= " abd ( FINCHQEUESTATEMENT.BANK_CODE = '" + ls_bank + "' ) "
	else
		ls_sql		+= " and ( FINCHQEUESTATEMENT.BANK_CODE = '" + ls_bank + "' ) "
	end if
	
end if

// สาขาธนาคาร
if not isnull( ls_bankbranch ) and ls_bankbranch <> "" then
	li_chk ++
	if li_chk = 1 then
		ls_sql		= " and ( FINCHQEUESTATEMENT.BANK_BRANCH = '" + ls_bankbranch + "' ) "
	else
		ls_sql		+= " and ( FINCHQEUESTATEMENT.BANK_BRANCH = '" + ls_bankbranch + "' ) "
	end if
end if

//เลขที่เช็ค
if not isnull( ls_chqno ) and ls_chqno <> "" then
	li_chk ++
	if li_chk = 1 then
		ls_sql		= " and ( FINCHQEUESTATEMENT.CHEQUE_NO like '%" + ls_chqno + "' ) "
	else
		ls_sql		+= " and ( FINCHQEUESTATEMENT.CHEQUE_NO like '%" + ls_chqno + "' ) "
	end if
end if

if trim( ls_sql ) <> "" then
	ls_sql		+= " and ( FINCHQEUESTATEMENT.coop_id = '" + as_coopid + "' ) "
	ls_sql		+= " and ( FINCHQEUESTATEMENT.chqeue_status <> -9  ) "
	ls_sql		+= " ORDER BY FINCHQEUESTATEMENT.CHEQUEBOOK_NO ASC,   FINCHQEUESTATEMENT.CHEQUE_NO ASC   "
	ls_sql		= ls_isql + ls_sql
	lds_data.SetSqlSelect( ls_sql )
//	lds_data.Settransobject( itr_sqlca )
	lds_data.retrieve( )
	li_chk	=	lds_data.rowcount( )
	
	if li_chk < 1 then
		ithw_exception.text	= "ไม่มีข้อมูลตามเงื่อนไข"
		throw ithw_exception
	end if
	
end if

as_chqlist_xml	= lds_data.describe( "Datawindow.Data.Xml" )

destroy( lds_data ) 

return success
end function

private function integer of_updatetofrom_accid_chqslipt (string as_coopid, datetime adtm_wdate, datetime adtm_chqdate, string as_refslipno, string as_tofromaccid, string as_fromsystem, integer ai_index) throws Exception;// Error จำเป็นต้องเพิ่ม

string	ls_deptaccount_no
integer	li_transec_no , li_upper , li_index
string	ls_slip[] , ls_refslip_no
//inv_string.of_parsetoarray( as_refslipno, ',', ls_slip[] )


//li_upper		= upperbound( ls_slip ) 

//for li_index = 1 to li_upper
	ls_refslip_no = as_refslipno
	
	if isnull( as_fromsystem ) or as_fromsystem = "" then
		select from_system
		into :as_fromsystem
		from finslip
		where slip_no = :ls_refslip_no
		and 	coop_id	= :as_coopid
		using itr_sqlca ;
		
		if	itr_sqlca.sqlcode <> 0 then
			destroy( idc_printchq )
			ithw_exception.text	= "ไม่สามารถหาชื่อระบบที่ทำรายการ "  
			rollback using itr_sqlca ;
			throw ithw_exception	
		end if

	end if
	
		choose case as_fromsystem		
				case "DEP"			
					li_transec_no	= 0
					select	transec_no, deptaccount_no
					into		:li_transec_no, :ls_deptaccount_no
					from		dpdeptslip
					where		deptslip_no		= :ls_refslip_no and
								coop_id	= :as_coopid 
					using itr_sqlca ;
					
					if isnull( li_transec_no ) then li_transec_no = 0
					if ( li_transec_no  > 0 ) then
						update	dpdeptslip
						set		tofrom_accid	= :as_tofromaccid
						where		transec_no		= :li_transec_no and
									cash_type		= 'CHQ' and
									deptaccount_no = :ls_deptaccount_no and
									entry_date		= :adtm_wdate and
									coop_id	= :as_coopid 
						using itr_sqlca ;
					end if
					
					update	dpdeptslip
					set		tofrom_accid	= :as_tofromaccid
					where		deptslip_no		= :ls_refslip_no and
								coop_id	= :as_coopid 
					using itr_sqlca ;
					
				case "LON"
					UPDATE	SLSLIPPAYOUT  
					SET		TOFROM_ACCID		= :as_tofromaccid  
					WHERE		( PAYOUTSLIP_NO	= :ls_refslip_no ) AND  
								( COOP_ID			= :as_coopid )   
					using itr_sqlca ;
					
//					select	sliplwd_no
//					into		:ls_refslip_no
//					from		cmloanreceive
//					WHERE		( LOANRECEIVE_NO	= :ls_refslip_no ) AND  
//								( COOP_ID			= :as_coopid )   
//					using itr_sqlca ;
//					
//					UPDATE	cmshrlonslip  
//					SET		tofrom_accid		= :as_tofromaccid  
//					WHERE		( slip_no			= :ls_refslip_no ) AND  
//								( COOP_ID			= :as_coopid )   
//					using itr_sqlca ;
					
				case "SHR"
					UPDATE	SLSLIPPAYOUT
					SET		TOFROM_ACCID		= :as_tofromaccid  
					WHERE		( PAYOUTSLIP_NO	= :ls_refslip_no ) AND  
								( COOP_ID			= :as_coopid )   
					using itr_sqlca ;
					
//					select	slipswd_no
//					into		:ls_refslip_no
//					from		CMSHRWITHDRAW
//					WHERE		( SHRWITHDRAW_NO	= :ls_refslip_no ) AND  
//								( COOP_ID			= :as_coopid )   
//					using itr_sqlca ;
					
//					UPDATE	cmshrlonslip  
//					SET		tofrom_accid		= :as_tofromaccid  
//					WHERE		( slip_no			= :ls_refslip_no ) AND  
//								( COOP_ID			= :as_coopid )   
//					using itr_sqlca ;
					
				case "SHL"
//					UPDATE	CMSHRLONSLIP
//					SET		TOFROM_ACCID	= :as_tofromaccid  
//					WHERE		( SLIP_NO		= :ls_refslip_no ) AND  
//								( COOP_ID		= :as_coopid  )   
//					using itr_sqlca ;
		
				case "FIN", "AST"
		//			as_refslipno	= trim( ads_chqlist.object.slip_no[ai_index] )
					UPDATE	FINSLIP  
					SET		TOFROM_ACCID			= :as_tofromaccid,
								receive_status				= 1,
								receive_date				= :adtm_chqdate
					WHERE		( SLIP_NO				= :ls_refslip_no ) AND  
								( COOP_ID		= :as_coopid )
					using itr_sqlca ;
					
				case "INV"
//					UPDATE	IVLOANRECEIVE  
//					SET		TOFROM_ACCID		= :as_tofromaccid  
//					WHERE		( LOANRECEIVE_NO	= :ls_refslip_no ) AND  
//								( BRANCH_ID			= :as_coopid )   
//					using itr_sqlca ;
					
		//			select	slipswd_no
		//			into		:ls_refslip_no
		//			from		IVSHRWITHDRAW
		//			WHERE		( SHRWITHDRAW_NO	= :ls_refslip_no ) AND  
		//						( BRANCH_ID			= :as_coopid )   
		//			;
					
//					UPDATE	ivshrlonslip  
//					SET		tofrom_accid		= :as_tofromaccid  
//					WHERE		( slip_no			= :ls_refslip_no ) AND  
//								( BRANCH_ID			= :as_coopid )   
//					using itr_sqlca ;
					
				case "PRM"
//					update	pmdeptslip
//					set		tofrom_accid	= :as_tofromaccid
//					where		deptslip_no		= :ls_refslip_no and
//								branch_origin	= :as_coopid 
//					using itr_sqlca ;						
			end choose
	
			if itr_sqlca.sqlcode <> 0 then
				destroy( idc_printchq )
				ithw_exception.text	= "ไม่สามารถปรับปรุงรหัสคู่บัญชี ของรายการที่ออกเช็คได้ "  + itr_sqlca.sqlerrtext
				rollback using itr_sqlca ;
				throw ithw_exception		
			end if	
			
		as_fromsystem = ""
//next 


	return success
end function

public function integer of_postprintslipcashctrl (string as_coopid, string as_coopname, string as_apprv_id, string as_username, datetime adtm_workdate, integer ai_slipcastseq_no, string as_formset) throws Exception;n_ds 	lds_data , lds_userfintable

string ls_coopname , ls_data_xml , ls_app
long	ll_row 

ls_coopname = trim( as_coopname ) 

// หาว่า มี user ขอผู้อนุมัติ ในระบบหรือไม่ -----------------------------------------
lds_userfintable = create n_ds
lds_userfintable.dataobject ="ds_userfintable"
lds_userfintable.settransobject( itr_sqlca )
lds_userfintable.retrieve( as_apprv_id, as_coopid )

ll_row			= lds_userfintable.rowcount( )

if isnull( ll_row	 ) then 	ll_row	 = 0 

if ll_row = 0 then
	ithw_exception.text	= "ไม่มีข้อมูลผู้อนุมัติ กรุณาตรวจสอบข้อมูล "
	throw ithw_exception
end if

ls_app		= lds_userfintable.object.tablefin_code[1]
//----------------------------------------------------------------------------


lds_data = create n_ds
lds_data.dataobject ="dw_rpt_slipcontrol_new"
lds_data.settransobject( itr_sqlca )
lds_data.retrieve( as_username, ls_app , adtm_workdate , ai_slipcastseq_no , as_coopid , ls_coopname )

if lds_data.rowcount( ) > 0 then
	ls_data_xml		= lds_data.describe( "Datawindow.Data.Xml" )
	
//	inv_print_srv.of_print( ls_data_xml , "FINCASHCTRL" , as_formset )
	inv_print_srv.of_print( lds_data , "FINCASHCTRL" , as_formset )
else
	destroy lds_userfintable
	ithw_exception.text	= "ไม่มีข้อมูลสำหรับพิมพ์"
	throw ithw_exception
end if

destroy lds_userfintable

return success
end function

private function integer of_setchqposition (ref n_ds ads_data, string as_coopid, string as_bank, integer an_chqsize, string as_prntype, integer ai_printdate, integer ai_payee_flag) throws Exception;datastore	lds_data
integer	li_row
integer	li_x, li_y


lds_data	= create datastore
lds_data.dataobject	= "d_fn_chq_format_detail"
lds_data.settransobject( itr_sqlca )

li_row	= lds_data.retrieve( as_coopid , as_bank, an_chqsize,  as_prntype )

if li_row < 1 then
	destroy( lds_data )
	ithw_exception.text	= "ไม่สามารถดึงรูปแบบเช็คได้ " + as_bank + " " + as_coopid 
	rollback using itr_sqlca;
	throw ithw_exception
end if



// กำหนด DW ให้เป็นแนวนอน  // landscape
//ads_data.Object.DataWindow.Print.Orientation = 1
if as_prntype = "DOT" then
	// แนวตั้ง //portrait
	ads_data.dataobject = "d_cheque_printformat_portrait" 
	ads_data.Object.DataWindow.Print.Orientation = 2
//	ads_data.Object.DataWindow.Print.Paper.Size = 39
end if

ads_data.accepttext( )

li_x	= lds_data.object.headdate_x[1]
li_y	= lds_data.object.headdate_y[1]

if isnull( li_x  ) then li_x = 0
if isnull( li_y  ) then li_y = 0
ads_data.modify( "headdate.x = " + string( li_x ) )
ads_data.modify( "headdate.y = " + string( li_y ) )
if ( ai_printdate = 1 ) then
	ads_data.modify( "headdate.visible = '1' " )
else
	ads_data.modify( "headdate.visible = '0' " )
end if

li_x	= lds_data.getitemnumber( 1, 'headname_x')
li_y	= lds_data.getitemnumber( 1, 'headname_y')
if isnull( li_x  ) then li_x = 0
if isnull( li_y  ) then li_y = 0
ads_data.modify( "headname.x = " + string( li_x ) )
ads_data.modify( "headname.y = " + string( li_y ) )

li_x	= lds_data.getitemnumber( 1, 'headsname_x' )
li_y	= lds_data.getitemnumber( 1, 'headsname_y' )
if isnull( li_x  ) then li_x = 0
if isnull( li_y  ) then li_y = 0
ads_data.modify( "headsname.x = " + string( li_x ) )
ads_data.modify( "headsname.y = " + string( li_y ) )

li_x	= lds_data.getitemnumber( 1, 'headamt_x' )
li_y	= lds_data.getitemnumber( 1, 'headamt_y' )
if isnull( li_x  ) then li_x = 0
if isnull( li_y  ) then li_y = 0
ads_data.modify( "headamt.x = " + string( li_x ) )
ads_data.modify( "headamt.y = " + string( li_y ) )

li_x	= lds_data.getitemnumber( 1, 'remark_x' )
li_y	= lds_data.getitemnumber( 1, 'remark_y' )
if isnull( li_x  ) then li_x = 0
if isnull( li_y  ) then li_y = 0
ads_data.modify( "remark.x = " + string( li_x ) )
ads_data.modify( "remark.y = " + string( li_y ) )

li_x			= lds_data.getitemnumber( 1, 'detaildate_x' )
li_y			= lds_data.getitemnumber(1, 'detaildate_y' )
if isnull( li_x  ) then li_x = 0
if isnull( li_y  ) then li_y = 0
ads_data.modify( "detaildate.x = " + string( li_x ) )
ads_data.modify( "detaildate.y = " + string( li_y ) )

if ( ai_printdate = 1 ) then
	ads_data.modify( "detaildate.visible = '1' " )
else
	ads_data.modify( "detaildate.visible = '0' " )
end if

li_x	= lds_data.getitemnumber( 1, 'payname_x' )
li_y	= lds_data.getitemnumber( 1, 'payname_y' )
if isnull( li_x  ) then li_x = 0
if isnull( li_y  ) then li_y = 0
ads_data.modify( "payname.x = " + string( li_x ) )
ads_data.modify( "payname.y = " + string( li_y ) )

li_x	= lds_data.getitemnumber( 1, 'killer_x' )
li_y	= lds_data.getitemnumber( 1, 'killer_y' )
if isnull( li_x  ) then li_x = 0
if isnull( li_y  ) then li_y = 0
ads_data.modify( "killer.x = " + string( li_x ) )
ads_data.modify( "killer.y = " + string( li_y ) )

li_x	= lds_data.getitemnumber( 1, 'moneynumberic_x' )
li_y	= lds_data.getitemnumber( 1, 'moneynumberic_y' )
if isnull( li_x  ) then li_x = 0
if isnull( li_y  ) then li_y = 0
ads_data.modify( "moneynumberic.x = " + string( li_x ) )
ads_data.modify( "moneynumberic.y = " + string( li_y ) )

li_x	= lds_data.object.moneythai_x[1]
li_y	= lds_data.object.moneythai_y[1]
if isnull( li_x  ) then li_x = 0
if isnull( li_y  ) then li_y = 0
ads_data.modify( "moneythai.x = " + string( li_x ) )
ads_data.modify( "moneythai.y = " + string( li_y ) )

li_x	= lds_data.getitemnumber( 1, 'payee_x' )
li_y	= lds_data.getitemnumber( 1, 'payee_y' )
if isnull( li_x  ) then li_x = 0
if isnull( li_y  ) then li_y = 0
ads_data.modify( "payee.x = " + string( li_x ) )
ads_data.modify( "payee.y = " + string( li_y ) )

if( ai_payee_flag = 1 ) then 
	ads_data.modify( "payee.visible = '1' " )
else
	ads_data.modify( "payee.visible = '0' " )
end if

destroy( lds_data )
return 1
end function

public function integer of_init_payrecv_slip (string as_coop_id, string as_entry_id, string as_machine, datetime adtm_wdate, integer as_recvpay_status, ref string as_slipmain_xml) throws Exception;/***********************************************
<description>
	กำหนด XML Config ทำรายการรับ-จ่ายการเงินให้กับข้อมูลหลัก และรายละเอียดการรับ-จ่าย	
</description>

<arguments>	
	as_coop_id		รหัสสาขาสหกรณ์
	as_entry_id			รหัสผู้ใช้ ที่ทำรายการ
	as_machine			ชื่อเครื่องทีทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_slipmain_xml	ข้อมูลหลักในการรับ-จ่ายการเงิน , ส่งค่ากลับคืนในรูปแบบ XML
	as_slipitem_xml	ข้อมูลรายละเอียดการรับ-จ่ายการเงิน , ส่งค่ากลับคืนในรูปแบบ XML
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_init_payrecv_slip()
	
	Integer li_return 
	String ls_branch , ls_entry , ls_machine , ls_slipmain_xml , ls_slipitem_xml
	datetime 	ldtm_wdate
	
	li_return = lnv_finservice.of_init_payrecv_slip( ls_branch , ls_entry ,  ls_machine , ldtm_wdate , ls_slipmain_xml , ls_slipitem_xml  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by Phaiwaan
	Version 1.1 (แก้กาำรกำหนดค่าเริ่มต้นในการคำนวณภาษีในรายละเอียดการจ่าย ) Modified Date 5/10/2010 by Phaiwaan
	Version 1.2 (แก้ไข ตัดกาำรกำหนดค่าเริ่มต้นในการคำนวณภาษีในรายละเอียดการจ่าย ) Modified Date 8/10/2010 by Phaiwaan
	Version 1.3 (แก้ไม่ต้องกำหนดค่าเริ่มต้น รายละเอียด)  Modified Date 21/10/2010 by Phaiwaan
</usage>
************************************************/

string		ls_tofromacc
datetime	ldtm_entry, ldtm_time

n_ds		lds_main , lds_item


ii_pay_recv			= 0
as_coop_id			= as_coop_id
ldtm_entry			= adtm_wdate
ldtm_time			= datetime( date(  ldtm_entry ), now( ) )

lds_main		= create		n_ds
lds_main.dataobject	= "d_fin_slipspc"

lds_main.insertrow( 0 )

//lds_main.object.operate_date[1] 		= adtm_wdate 
lds_main.setitem(1,"operate_date",adtm_wdate)
lds_main.object.entry_date[1] 			= ldtm_entry 

lds_main.object.pay_recv_status[1]	= as_recvpay_status
lds_main.object.recvpay_time[1]		= ldtm_time
lds_main.object.coop_id[1]				= as_coop_id
lds_main.object.machine_id[1]			= as_machine
lds_main.object.entry_id[1]				= as_entry_id
lds_main.object.from_system[1]		= "FIN"
		

//lds_item.getchild( "slipitemtype_code",idwc_itemtype )
//idwc_itemtype.settransobject( itr_sqlca )
//idwc_itemtype.retrieve( ) 

//lds_main.modify( "nonmember_detail.protect = 1 " )
//lds_main.modify( "retail_flag.protect = 1 " )
//lds_main.modify( "pay_recv_status.protect = 0 " )
//lds_main.modify( "member_flag.protect = 0 " )

ls_tofromacc	=	this.of_defaultaccid( "CSH" )
lds_main.object.retail_flag[1]  			= 0 
lds_main.object.member_flag[1] 		= 1 
lds_main.object.tofrom_accid[1] 		= ls_tofromacc
lds_main.object.taxwaykeep[1] 		= 1

as_slipmain_xml		=	lds_main.describe( "Datawindow.data.XML" )

destroy lds_main 
	
return Success
end function

public function integer of_init_paychq_apvloancbt (string as_coopid, datetime adtm_wdate, ref string as_main_xml, ref string as_chqlist_xml, string as_cashtype) throws Exception;//function Name : of_init_paychq
//
//argument	:
//
//as_coopid		รหัสสาขาสหกรณ์
//adtm_wdate	วันที่ทำการ
//as_main_xml		xml เงื่อนไขการพิมพ์ ข้อมูลสำหรับพิมพ์เช็ค
//as_chqlist_xml	xml รายการให้เลือกเพื่อพิมพ์เช็ค
//
//return 	1 ถ้าสำเร็จ -1 เกิดข้อผิดพลาด 


string		ls_chqdefault
// Impost String XML----------------------------------------------------
n_ds lds_chqlist , lds_main 

// เงื่อนไขการพิมพ์เช็ค
lds_main = create n_ds
lds_main.dataobject = "d_pay_cheque" 
lds_main.insertrow( 0 )


// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_chequelist_apvloan_cbt" 
lds_chqlist.settransobject( itr_sqlca )

lds_chqlist.retrieve( adtm_wdate , as_coopid , as_cashtype )

//------------------------------------------------------------------------
//SELECT	CHQTYPE_DEFAULT
//INTO		:ls_chqdefault
//FROM		FINCONSTANT  
//using	itr_sqlca	;

ls_chqdefault = trim( this.of_getattribconstant( "chqtype_default" , "STRING" ))
if isnull( ls_chqdefault ) then ls_chqdefault = "01"


// กำหนดค่า ประเภทเช็ค
if isnull( ls_chqdefault ) then ls_chqdefault = "01"
if ls_chqdefault <> "" then
	lds_main.object.cheque_type[1]	= ls_chqdefault
end if

lds_main.object.cheque_status[1] 			= 8

// กำหนดค่า เงื่อนไขพิมพ์เช็ค
lds_main.object.cheque_date[1]			= adtm_wdate
lds_main.object.print_type[1]				= "LAS"

// กำหนดค่า ตัดบัญชีธนาคาร
lds_main.object.chq_size[1]					=	1

lds_main.accepttext( )
lds_chqlist.accepttext( )

as_main_xml		=	lds_main.describe( "Datawindow.Data.Xml" )
as_chqlist_xml = ""
if lds_chqlist.rowcount( ) > 0 then
	as_chqlist_xml		=	lds_chqlist.describe( "Datawindow.Data.Xml" )
end if

destroy lds_main
destroy lds_chqlist

return success
end function

public function integer of_retrievechqfrom_apvloancbt (string as_coopid, datetime adtm_wdate, string as_bankcode, string as_lngroupcode, ref string as_chqlist_xml, string as_cashtype) throws Exception;n_ds lds_chqlist
string		ls_temp
// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_chequelist_apvloan_cbt" 
lds_chqlist.settransobject( itr_sqlca )

lds_chqlist.retrieve( adtm_wdate , as_coopid , as_cashtype )

if isnull( as_bankcode )  then as_bankcode = "" 
if	isnull( as_lngroupcode ) then as_lngroupcode = ""
as_chqlist_xml	 = ""
ls_temp			= ""
if lds_chqlist.rowcount( ) > 0 then
	
	if trim( as_bankcode ) <> ""  then 
		ls_temp = " moneytype_code = '" + trim( as_bankcode ) + "'" 
	end if
	
	if trim( as_lngroupcode ) <> ""  then 
		if  ls_temp <> "" then ls_temp += " and "
		ls_temp += " loangroup_code = '" + trim( as_lngroupcode ) + "'" 
	end if
		
	lds_chqlist.setfilter( ls_temp  )
	lds_chqlist.filter( )
	
	if lds_chqlist.rowcount() > 0 then
		as_chqlist_xml	 = lds_chqlist.describe( "Datawindow.Data.Xml" )
	end if
	
end if

destroy( lds_chqlist ) 

return success
end function

public function integer of_init_paychq_manual (string as_coopid, datetime adtm_wdate, ref string as_main_xml) throws Exception;//function Name : of_init_paychq
//
//argument	:
//
//as_coopid		รหัสสาขาสหกรณ์
//adtm_wdate	วันที่ทำการ
//as_main_xml		xml เงื่อนไขการพิมพ์ ข้อมูลสำหรับพิมพ์เช็ค
//as_chqlist_xml	xml รายการให้เลือกเพื่อพิมพ์เช็ค
//
//return 	1 ถ้าสำเร็จ -1 เกิดข้อผิดพลาด 


string		ls_chqdefault
// Impost String XML----------------------------------------------------
n_ds lds_main 

// เงื่อนไขการพิมพ์เช็ค
lds_main = create n_ds
lds_main.dataobject = "d_pay_cheque" 
lds_main.insertrow( 0 )

ls_chqdefault = trim( this.of_getattribconstant( "chqtype_default" , "STRING" ))

// กำหนดค่า ประเภทเช็ค
if isnull( ls_chqdefault ) then ls_chqdefault = "01"
if ls_chqdefault <> "" then
	lds_main.object.cheque_type[1]	= ls_chqdefault
end if

lds_main.object.cheque_status[1] 			= 8

// กำหนดค่า เงื่อนไขพิมพ์เช็ค
lds_main.object.cheque_date[1]			= adtm_wdate
lds_main.object.print_type[1]				= "LAS"

// กำหนดค่า ตัดบัญชีธนาคาร
lds_main.object.chq_size[1]					=	1

lds_main.accepttext( )
as_main_xml		=	lds_main.describe( "Datawindow.Data.Xml" )

destroy lds_main

return success
end function

public function integer of_postdeptslip_tofin (string as_coopid, string as_member_no, string as_deptslip_no, datetime adtm_operate, string as_entryid) throws Exception;/***********************************************
<description>
	ข้อมูลจากระบบเงินฝาก รายการฝาก / ถอน /ปิดบัญชี่/เปิดบัญชี บันทึกผ่านระบบการเงิน
</description>

<arguments>	
	as_deptslip_xml			ข้อมูลการทำรายการเงินฝาก
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postdeptslip()
	
	Integer li_return
	String ls_deptslip_xml 

	li_return = lnv_finservice.of_postdeptslip( ls_deptslip_xml  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 17/11/2010 by Phaiwaan
	
</usage>
************************************************/



integer	li_row, li_chk , li_index , li_found	, li_index_i , li_recvpaystatus
string		ls_fnrecvno, ls_docno, ls_year, ls_refslipno , ls_accid_slipdet	 , ls_dwobjectname
string		ls_entryid, ls_fromsystem, ls_bankcode, ls_bankbranch, ls_memno, ls_nonmemberdetail
string		ls_accid, ls_cashtype, ls_itemtypecode, ls_coopid, ls_chequeno, ls_paydesc, ls_accountno
string		ls_towhom, ls_machineid, ls_cancelid, ls_memname, ls_depttype
string		ls_itemgroup, ls_depttypedesc, ls_slipno, ls_remark  , ls_deptcancelslip
datetime	ldtm_dateonchq, ldtm_canceldate, ldtm_entrydate, ldtm_opreatedate
dec{2}	ldc_itemamt, ldtm_bankfee, ldc_banksrv, ldc_sharespx , ldc_feeamt
dec{2}	ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_accuint , ldc_itemnet_amt
integer	li_member_flag, li_paymentstatus, li_payrec_status, li_chqadv, li_itemstatus, li_itemstatus1
integer	li_recev, li_recvstatus , li_payfee_meth

n_ds lds_data 

// ดึงข้อมูลการทำรายการระบบเงินฝากเข้า ระบบการเงิน
li_recvpaystatus = integer( this.of_getattribconstant( "deptwait_atfin" , "INTEGER" ))
if isnull( li_recvpaystatus ) then li_recvpaystatus = 3

// ทันที
if( li_recvpaystatus = 1 ) then

	// ระบบเงินฝาก
	lds_data		= create n_ds
	lds_data.dataobject	= "d_fin_dp_slip_from_memb"
	lds_data.settransobject( itr_sqlca )
	
	li_row			= lds_data.retrieve( as_coopid , as_member_no , adtm_operate )
	
	if li_row > 0 then
		lds_data.setfilter( "deptslip_no = '" + trim( as_deptslip_no ) + "'"  ) 
		lds_data.filter()
		
		this.of_postdeptto_fin( lds_data  , as_coopid  , as_entryid , adtm_operate , ls_deptcancelslip )
	end if
end if

return 1
end function

private function integer of_postpaychqstm_apvloan (string as_coopid, string as_entry, string as_machine, datetime adtm_wdate, n_ds ads_chqcond, string as_accno, string as_chqtype, integer ai_chequestatus, n_ds ads_chqlist) throws Exception;/***********************************************
<description>
	ทำการบันทึกข้อมูลการพิมพ์จากใบทำรายการ อนุมัติใบคำขอกู้เป็นเช็ค
</description>

<arguments>
	as_coopid			รหัสสาขาสหกรณ์
	as_entry				รหัสผู้ใช้ ที่ทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_machine			ชื่อเครื่องทีทำรายการ
	ads_chqcond		ข้อมูลเงื่อนไขการพิมพ์ 
	as_accno				เลขที่บัญชี่ตัดยอดธนาคาร 
	as_chqtype			ประเภทเช็ค
	ai_chequestatus	สถานะเช็ค
	ads_chqlist			ข้อมูลรายการจ่ายเช็ค
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postpaychqstm()
	
	Integer li_return  , li_chequestatus
	String ls_branch , ls_entry , ls_machine , ls_accno , ls_chqtype 
	datetime		ldtm_wdate
	n_ds	lds_chqcond , lds_chqlist
	
	li_return = lnv_finservice.of_postpaychqstm( ls_branch , ls_entry , ls_machine , ldtm_wdate , lds_chqcond  , ls_accno , ls_chqtype  , li_chequestatus , lds_chqlist )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 02/10/2010 by PhaiWaan
	Version 1.1 เปลี่ยน Loop For  เป็น Loop Do While , ตรวจสอบการเลือกรายการจ่ายเป็นเช็ค Modified Date 9/10/2010 by PhaiWaan
	Version 1.2 ให้ Commit ข้อมูลก่อนทำการพิมพ์เช็ค Modified Date /จ/10/2010 by PhaiWaan
</usage>
************************************************/

integer	li_row, li_index, li_chqsize, li_selected, li_chk 
datetime	 ldtm_today , ldtm_chqdate
string	ls_bank, ls_bankbranch, ls_chqbookno, ls_chqno, ls_remark , ls_coopid
string	ls_paywhom, ls_member, ls_referslip , ls_tofromaccid , ls_bridgeche_no
dec{2}	ldc_itemamt, ldc_sumitemamt
integer	li_used, li_remain, li_available,li_transec_no , li_seqno
string	ls_ref_slipno, ls_from_system, ls_deptaccount_no

ls_chqno				= trim( ads_chqcond.object.as_chqstart_no[1])
ldtm_chqdate		= ads_chqcond.object.adtm_date[1]
ls_bankbranch	= trim( ads_chqcond.object.as_bankbranch[1] )
ls_chqbookno	= trim( ads_chqcond.object.as_chqbookno[1] )
ls_bank			= trim( ads_chqcond.object.as_bank[1] )

ldtm_today			= datetime( date( adtm_wdate ) , now() )

li_row				= ads_chqlist.rowcount( )
ldc_sumitemamt		= 0

if not isvalid( idc_printchq ) then
	idc_printchq		= create n_ds
	idc_printchq.dataobject	= "d_chequelist_forprint"
	idc_printchq.settransobject( itr_sqlca )
else
	idc_printchq.reset( )
end if

// ตรวจสอบการดึงข้อมูลสำหรับการพิมพ์เช็ค
li_chk			= idc_printchq.retrieve( is_coopcontrl  , ls_bank, ls_bankbranch, ls_chqbookno, ls_chqno) 

if li_chk < 1 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก finshqeuestatement เพื่อเตรียมพิมพ์เช็ค" + itr_sqlca.sqlerrtext
	throw ithw_exception

end if
	
li_chk			= 0

select	account_id
into		:ls_tofromaccid
from		FINBANKACCOUNT
WHERE		(	ACCOUNT_NO= :as_accno ) AND  
			(	BANK_CODE			= :ls_bank ) AND  
			( 	BANKBRANCH_CODE	= :ls_bankbranch  ) and
			( COOP_ID		= :is_coopcontrl )
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT เพื่อปรับปรุงรหัสคู่บัญชี " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if


if li_row < 1 then
	destroy( idc_printchq )
	ithw_exception.text	= "ยังไม่ได้เลือกรายการที่ต้องการพิมพ์เช็ค" 
	throw ithw_exception
end if

for li_index = 1 to li_row
		
	li_chk ++
	
	if li_chk > 1 then
				
		// หากเลือกจำนวนรายการมากกว่าจำนวนเลขที่เช็คที่เหลือปัจจุบันจาก เล่มเช็คนั้น ไม่ให้บันทึกข้อมูล
		if li_chk > idc_printchq.rowcount() then 
			li_chk --
			exit 
		end if
		
		ls_chqno = idc_printchq.getitemstring( li_chk , "cheque_no"  ) 
//		ls_chqno	= string( long( ls_chqno  ) + 1 , '0000000' )
	end if
	
	ls_paywhom		= trim( ads_chqlist.object.pay_towhom[li_index] )
	ls_remark		= "จ่ายเงินกู้ให้แก่สมาชิก : " + trim( ads_chqlist.object.member_no[li_index] ) // trim( ads_chqlist.object.loancontract_no[li_index] )
	ldc_itemamt		= ads_chqlist.object.payoutnet_amt[li_index]
	ls_referslip		= trim( ads_chqlist.object.payoutslip_no[li_index] )
	ls_coopid			= trim( ads_chqlist.object.slslippayout_coop_id[li_index] )
	
	if isnull( ls_paywhom ) then ls_paywhom = ""
	if isnull( ldc_itemamt ) then ldc_itemamt = 0
	if isnull( ls_referslip ) then ls_referslip = ""
	if isnull( ls_remark ) then ls_remark = ""
	
	// ตรวจสอบการสั่งจ่าย
	if ls_paywhom = "" then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement ไม่ระบุการสั่งจ่าย "  
		throw ithw_exception
	end if
	
	// ตรวจสอบการระบุจำนวนเงิน
	if ldc_itemamt <= 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement ไม่ระบุจำนวนเงิน" 
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	ldc_sumitemamt	= ldc_sumitemamt + ldc_itemamt
	
	select	USE_STATUS , SEQ_NO
	into		:li_used , :li_seqno
	from		finchqeuestatement
	where		( CHEQUE_NO			= :ls_chqno ) and
				( CHEQUEBOOK_NO	= :ls_chqbookno ) and
				( BANK_CODE			= :ls_bank ) and 
				( BANK_BRANCH		= :ls_bankbranch ) and
				( COOP_ID	= :is_coopcontrl ) and
				( chqeue_status	<> -9 ) 
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถดึงสถาระเช็คจาก finshqeuestatement เช็คเลขที่ " + ls_chqno + " "  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	if isnull(li_seqno) or li_seqno = 0 then	li_seqno = 1
	
	if ( li_used = 1 ) or ( li_used = -9 ) then
		destroy( idc_printchq )
		ithw_exception.text	= "เช็คเลขที่ " + ls_chqno + " ได้มีการใช้ไปแล้ว หรือ ถูกยกเลิก กรุณาตรวจสอบ"  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	// update account ID to where it's from
	
//	ls_ref_slipno	= trim( ads_chqlist.object.ref_slipno[li_index] )
	ls_from_system	= "LON" //trim( ads_chqlist.object.from_system[li_index] ) 
	
//	this.of_updatetofrom_accid( as_coopid, adtm_wdate , ldtm_chqdate , ls_referslip , ls_tofromaccid , ls_from_system , li_index)
	
	// ทำการปรับปรุงลงฐานข้อมูล
	update		finchqeuestatement
	set			DATE_ONCHQ			= :ldtm_chqdate ,
					ENTRY_ID				= :as_entry,
					ENTRY_DATE			= :adtm_wdate,
					TO_WHOM				= :ls_paywhom,
					TYPECHQ_PAY			= 0,
					MONEY_AMT			= :ldc_itemamt,
					CHQEUE_STATUS		= :ai_chequestatus,
					ADVANCE_CHQ			= 0,
					COOP_ID		= :as_coopid,
					MACHINE_ID			= :as_machine,
					MEMBER_NO			= :ls_member,
					from_bankaccno		= :as_accno,
					refer_slipno		= :ls_referslip,
					cheque_type			= :as_chqtype ,
					printed_status		= 1,
					PRINTED_ID			= :as_entry,
					PRINTED_DATE		= :adtm_wdate,
					PRINTED_TERMINAL	= :as_machine,
					USE_STATUS			= 1,
					remark				= :ls_remark ,
					receive_status		=	0
	where		( CHEQUE_NO		= :ls_chqno ) and
					( CHEQUEBOOK_NO	= :ls_chqbookno ) and
					( BANK_CODE			= :ls_bank ) and 
					( BANK_BRANCH		= :ls_bankbranch ) and
					( USE_STATUS		= 0 ) and
					( COOP_ID	= :is_coopcontrl ) and 
					( chqeue_status	<> -9 ) and
					( seq_no = :li_seqno )
	using itr_sqlca ;
					
	
	if itr_sqlca.sqlcode <> 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchqeuestatement เช็คเลขที่ " + ls_chqno + " "  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception				
	end if
	
//ไม่ได้ใช้
//	ls_ref_slipno	= trim( ads_chqlist.object.slip_no[li_index] )
//	
	update	finslip
	set		tofrom_accid		=	:ls_tofromaccid
	where	slip_no				= :ls_ref_slipno and
			COOP_ID		= :ls_coopid 
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy( idc_printchq )		
		ithw_exception.text	= "ไม่สามารถปรับปรุง ข้อมูลได้ ลง finslip 1 " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception		
	end if

if ls_from_system  = "LON" then
	
// update table ต้นทาง จ่ายเงินกู้
	update	slslippayout
	set		tofrom_accid 	 = :ls_tofromaccid	,	
			printchq_status	=	1
	where	payoutslip_no = :ls_referslip	and
				coop_id		=	:ls_coopid
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy( idc_printchq )		
		ithw_exception.text	= "ไม่สามารถปรับปรุง ข้อมูลได้ ลง slslippayout " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception		
	end if

end if

	// insert finbridgechq  ----------------------------------------------- // by Phai 
	// บันทึกข้อมูล Table finbridgechq เป็น Table เชื่อมรายการ slip กับ Cheque
	//-----------------------------------------------------------------------
	
	this.of_postbridgechq( as_coopid , ls_referslip ,ls_bank, ls_bankbranch, ls_chqbookno , ls_chqno , li_seqno )
		
		
	// ทำการระบุค่าเพื่อทำการพิมพ์เช็คในลำดับถัดไป
	idc_printchq.object.printed_status[li_chk]	= 1

	// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
	this.of_posttobank( as_coopid , as_entry , adtm_wdate , as_machine  , as_accno, ls_bank, ls_bankbranch, ldc_itemamt , -1)	
next

li_selected = li_chk

select		chqslip_used, chqslip_remain
into		:li_used, :li_remain
from		finchequemas
where		chequebook_no	= :ls_chqbookno and
			bank_code		= :ls_bank and
			bank_branch		= :ls_bankbranch and
			COOP_ID	= :is_coopcontrl 
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )		
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก finchequemas "  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception		
end if

if isnull( li_used ) then li_used= 0
if isnull( li_remain ) then li_remain= 0

li_used			= li_used + li_selected
li_remain		= li_remain - li_selected
li_available	= 1

if li_remain < 1 then
	li_available	= 0
	li_remain		= 0
end if


// ทำการปรัปรุงค่าเช็คที่ได้ใช้ไป
update	finchequemas
set		chqslip_used		= :li_used,
			chqslip_remain		= :li_remain,
			available_flag		= :li_available,
			last_chqno			= :ls_chqno
where	chequebook_no		= :ls_chqbookno and
			bank_code			= :ls_bank and
			bank_branch			= :ls_bankbranch and
			COOP_ID		= :is_coopcontrl 
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )		
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchequemas " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception			
end if

if ai_chequestatus = 0 or ai_chequestatus = 2 then
	return success
end if

idc_printchq.accepttext( )

return success
end function

private function string of_setchqlistdetailslip_apvloancbt (string as_coopid, string as_entry, datetime adtm_wdate, string as_machince, n_ds ads_main, n_ds ads_chqlist) throws Exception;/***********************************************
<description>
	ปรับปรุงข้อมูลสลิปที่เลือกพิมพ์เช็ค 1 ใบจากหลายสลิป 
</description>

<arguments>
	as_coopid			รหัสสาขาสหกรณ์
	as_entry				รหัสผู้ใช้ ที่ทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_machine			ชื่อเครื่องทีทำรายการ
	ads_main			ข้อมูลเงื่อนไขการพิมพ์ 
	ads_chqlist			ข้อมูลรายการจ่ายเช็ค
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_setchqlistdetailslip()
	
	Integer li_return 
	String ls_branch , ls_entry , ls_machine 
	datetime		ldtm_wdate
	n_ds 	lds_main , lds_chqlist 
	
	li_return = lnv_finservice.of_postpaychq( ls_branch , ls_entry , ldtm_wdate , ls_machine , lds_main , lds_chqlist  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 2/10/2010 by PhaiWaan
	Version 1.1 ตรวจสอบการเลือกรายการจ่ายเป็นเช็ค Modified Date 9/10/2010 by PhaiWaan
</usage>
************************************************/


long	ll_row , ll_index
string	ls_refslipno

ll_row = ads_chqlist.rowcount()

string	ls_chqno, ls_bankcode, ls_bankbranch, ls_paywhom
string	ls_chqbookno, ls_frombranch, ls_fromacc, ls_frombank, ls_entryid
integer	li_chequestatus
string	ls_coopbranch, ls_machineid, ls_member, ls_cashtype, ls_err, ls_slipno, ls_chequetype
dec{2}	ldc_itemamt
datetime	ldtm_onchq, ldtm_entrydate, ldtm_today
integer	li_used, li_remain, li_available, li_seqno

ldtm_today			= datetime( today(), now() )
ldtm_entrydate		= adtm_wdate
ldc_itemamt			= ads_main.object.cheque_amt[1]
ls_chqno				= trim( ads_main.object.account_no[1] )
ls_bankcode			= ads_main.object.bank_code[1]
ls_bankbranch		= trim(ads_main.object.bank_branch[1])
ls_chqbookno		= trim( ads_main.object.cheque_bookno[1] )
ldtm_onchq			= ads_main.object.cheque_date[1]
ls_paywhom			= trim( ads_main.object.pay_whom[1] )
li_chequestatus		= ads_main.object.cheque_status[1]
ls_chequetype		= trim( ads_main.object.cheque_type[1] )
ls_fromacc			= trim( ads_main.object.fromaccount_no[1] )
ls_frombranch		= trim( ads_main.object.frombranch[1] )
ls_frombank			= trim( ads_main.object.frombank[1] )

ll_row					= ads_chqlist.rowcount( )

//li_used	= ads_chqlist.find("ai_chqflag = 1" , 1 , ll_row	 )
//if li_used < 1 then
//	destroy( idc_printchq )
//	ithw_exception.text	= "ยังไม่ได้เลือกรายการที่ต้องการพิมพ์เช็ค" 
//	throw ithw_exception
//end if

	for li_used = 1 to  ll_row 	 

		ls_slipno		= ads_chqlist.object.payoutslip_no[li_used]
		
//		update finslip
//		set bank_code 		= :ls_bankcode ,
//			bank_branch	= :ls_bankbranch ,
//			chequebook_no		= :ls_chqbookno ,
//			account_no	= :ls_chqno ,
//			dateon_chq			= :ldtm_onchq ,
//			cheque_status		= :li_chequestatus , 
//			pay_towhom			= :ls_paywhom ,
//			from_accno			= :ls_fromacc ,
//			from_bankcode		= :ls_frombank ,
//			from_branchcode	= :ls_frombranch ,
//			cheque_type		= :ls_chequetype ,
//			payment_status	= 1	,
//			recvpay_id			= :ls_entryid , 
//			recvpay_time			= :ldtm_today
//		where slip_no = :ls_slipno
//		and coop_id = :as_coopid 
//		using itr_sqlca ;
//		
//		if itr_sqlca.sqlcode <> 0 then
//			ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง Finsllip" + itr_sqlca.sqlerrtext
//			rollback using itr_sqlca ;
//			throw ithw_exception	
//		end if
		
//		update	slslippayout
//		set		cheque_bankcode	=	:ls_bankcode	,
//					cheque_bankbranch	 =	:ls_bankbranch	,
////					expense_accid		=	:ls_fromacc ,
//					printchq_status	= 1 ,
//					dateon_chq			= :ldtm_onchq	,
//					chequebook_no	= :ls_chqbookno	,
//					cheque_no			= :ls_chqno
//		where	loanrequest_docno	=	:ls_slipno		and
//					coop_id	=	:as_coopid
//		using		itr_sqlca	;
//	
//		if itr_sqlca.sqlcode <> 0 then
//			ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง Lnreqloan" + itr_sqlca.sqlerrtext
//			rollback using itr_sqlca ;
//			throw ithw_exception	 
//		end if

//		// หากเป็นเช็คค้างจ่าย
//		if li_chequestatus = 8 then
//			update finslip
//			set receive_date 		= :ldtm_entrydate ,
//				receive_status		= 1
//			where slip_no = :ls_slipno
//			and coop_id = :as_coopid 
//			using itr_sqlca ;
//			
//			if itr_sqlca.sqlcode <> 0 then
//				ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง Finsllip" + itr_sqlca.sqlerrtext
//				rollback using itr_sqlca ;
//				throw ithw_exception	
//			end if
//		
//		end if
//		
		ls_refslipno	+= ls_slipno + ','
		
//		li_used++
//		if li_used > ll_row then
//			exit 
//		end  if
//		li_used	= ads_chqlist.find("ai_chqflag = 1" , li_used , ll_row	 )
//		
next


if len( ls_refslipno ) > 0 then
	ls_refslipno		= left( ls_refslipno, len( ls_refslipno ) - 1 )
end if

return ls_refslipno
end function

public function integer of_postprocessotherto_fin (string as_coopid, string as_entryid, datetime adtm_wdate, string as_machineid, string as_procxml) throws Exception;long 		ll_count, ll_index, ll_rc, ll_procstatus, ll_proclwd, ll_procshr, ll_proclrt
string 	ls_membno  , ls_shrloncancelslip , ls_lonlwdcancelslip , ls_deptcancelslip , ls_shrswdcancelslip , ls_cashget
string		ls_cashtypearray[] = {"CSH","CBT","CHQ","BILL","TRN","TRS", "DRF"}
integer 	li_row , li_shrlonpaysend_fin , li_dpsend_fin , li_shrlonrecvsend_fin , li_allwait_fin , li_upper , li_step

n_ds lds_payin_list , lds_data , lds_payout_list , lds_dpslip_list , lds_datalwd , lds_dataswd , lds_datalrt , lds_proc, lds_dataetc



// รายการเลือกประมวลข้อมูล
lds_proc = create n_ds
lds_proc.dataobject		= "d_listchooseproc"

if not isnull( as_procxml ) and trim( as_procxml ) <> "" then
	this.of_importstring_xml( lds_proc , as_procxml )
end if

ids_cancelslip	= create n_ds
ids_cancelslip.dataobject		= "d_cancel_othertotfin"
ids_cancelslip.settransobject( itr_sqlca )

li_allwait_fin = integer( this.of_getattribconstant( "allpay_atfin" , "INTEGER" ))
if isnull( li_allwait_fin ) then li_allwait_fin = 0

// ประเภทเงินทำรายการ
li_upper = upperbound( ls_cashtypearray[] ) 

for li_step = 1 to li_upper
	
		// ประเภทเงินทำรายการ ตาม Array เป็นเงื่อนไขไปดึงข้อมูล
		ls_cashget	= ls_cashtypearray[ li_step ]
		
		// สถานะการประมวลรับชำระหุ้นหนี้
		ll_procstatus = lds_proc.object.process_shl[ 1 ] 
		
		if isnull( ll_procstatus )  then ll_procstatus = 0 
		
		if( ll_procstatus = 1) then 
			// ดึงข้อมูล หุ้นหนี้ รายการรับ เข้า ระบบการเงินหรือไม่ shrlonrecvsendfin
			li_shrlonrecvsend_fin	= integer( this.of_getattribconstant( "shrlonrecvsendfin" , "INTEGER" ))
			if isnull( li_shrlonrecvsend_fin ) then li_shrlonrecvsend_fin = 3
			
			
			if li_shrlonrecvsend_fin = 3 then 
				
					// รายละเอียดรับชำระ
					ids_payinslipdet	= create n_ds
					ids_payinslipdet.dataobject		= "d_fin_sl_slipdet"
					ids_payinslipdet.settransobject( itr_sqlca )
			
					// รับชำระ ระบบหุ้นหนี้
					lds_data		= create n_ds
					lds_data.dataobject	= "d_fin_sl_slip"
					lds_data.settransobject( itr_sqlca )
					
					li_row			= lds_data.retrieve( as_coopid , ls_cashget , adtm_wdate   )
						
					if li_row > 0 then
						this.of_postshrlonto_fin( lds_data  , as_coopid  , as_entryid , adtm_wdate , as_machineid ,ls_shrloncancelslip)
					end if
	
				destroy( lds_payin_list  ) 
				destroy( lds_data ) 
			end if
			
		end if
		
		 
		// สถานะการประมวล รายการจ่ายเงินกู้
		ll_proclwd = lds_proc.object.process_lon[ 1 ] 
		
		// สถานะการประมวล รายการจ่ายถอนคืนหุ้น
		ll_procshr = lds_proc.object.process_shr[ 1 ] 
		
		// สถานะการประมวล รายการจ่ายคืนต้นดอก
		ll_proclrt = lds_proc.object.process_lrt[ 1 ] 
		
		if isnull( ll_proclwd ) then ll_proclwd = 0
		if isnull( ll_procshr ) then ll_procshr = 0
		if isnull( ll_proclrt ) then ll_proclrt = 0
		
		if( ll_proclwd  = 1 ) or (ll_procshr = 1 ) or ( ll_proclrt = 1 ) then 
		
		
			// ดึงข้อมูล หุ้นหนี้ รายการจ่าย เข้า ระบบการเงินหรือไม่ shrlonrecvsendfin 
			li_shrlonpaysend_fin = integer( this.of_getattribconstant( "shrlonpaysendfin" , "INTEGER" ))
			if isnull( li_shrlonpaysend_fin ) then li_shrlonpaysend_fin = 3
			
			if li_shrlonpaysend_fin = 3 or li_shrlonpaysend_fin = 2 then
					
					//รายละเอียดหักกลบ สัญญาเก่า	
					ids_payclr	= create n_ds
					ids_payclr.dataobject = "d_fin_sl_slipclr"
					ids_payclr.settransobject( itr_sqlca )

					// จ่ายเงินกู้
					lds_datalwd  = create n_ds
					lds_datalwd.dataobject	= "d_fin_lon_payout"
					lds_datalwd.settransobject( itr_sqlca )
					
					
					//จ่ายคืนกองทุน
					lds_dataetc  = create n_ds
					lds_dataetc.dataobject	= "d_fin_lon_payout_etc"
					lds_dataetc.settransobject( itr_sqlca )
					
					// ถอนหุ้นคืน
					lds_dataswd 		= create n_ds
					lds_dataswd.dataobject	= "d_fin_shr_payout"
					lds_dataswd.settransobject( itr_sqlca )
					
					// จ่ายคืนเงินต้นและดอกเบี้ย
					lds_datalrt		= create n_ds
					lds_datalrt.dataobject	= "d_fin_lon_payout_lrt"
					lds_datalrt.settransobject( itr_sqlca )
					
						// by Phai เอาเฉพาะรายการจ่ายเงินกู้
					if( li_shrlonpaysend_fin = 3 ) then
						
						if( ll_proclwd  = 1 ) then 
							// จ่ายเงินกู้
							li_row			= lds_datalwd.retrieve( as_coopid , ls_cashget , adtm_wdate  )		//by num เอาmember_no ออก	
							if li_row > 0 then
								this.of_postlonlwdto_fin( lds_datalwd  , as_coopid  , as_entryid , adtm_wdate , as_machineid , ls_lonlwdcancelslip)
							end if
								
							//จ่ายคืนกองทุน
							li_row			= lds_dataetc.retrieve( as_coopid , ls_cashget , adtm_wdate  )//by num เอาmember_no ออก
							if li_row > 0 then
								this.of_postetcto_fin( lds_dataetc  ,as_coopid  , as_entryid , adtm_wdate , as_machineid , ls_lonlwdcancelslip)
							end if
//								
						end if
					end if
						
						if (ll_procshr = 1 ) then 
							// ถอนหุ้นคืน
							li_row			= lds_dataswd.retrieve( as_coopid  , adtm_wdate )			//by num เอาmember_no ออก
							if li_row > 0 then
								this.of_postshrswdto_fin( lds_dataswd  , as_coopid  , as_entryid , adtm_wdate , as_machineid  , ls_shrswdcancelslip)
							end if
						end if
						
						if ( ll_proclrt = 1 ) then 
							// จ่ายเงินต้นและดอกเบี้ยคืน
							li_row			= lds_datalrt.retrieve( as_coopid  , adtm_wdate )//by num เอาmember_no ออก
							if li_row > 0 then
								this.of_postlonlrtto_fin( lds_datalrt, as_coopid  , as_entryid , adtm_wdate , as_machineid   , ls_lonlwdcancelslip )
							end if
						end if
				
			//		next
			
				destroy( lds_data ) 
				destroy( lds_payout_list ) 
				destroy( lds_datalwd ) 
				destroy( lds_dataswd ) 
				destroy( lds_datalrt ) 	
				destroy( ids_payclr  )
			end if 
		end if
		
		// สถานะการประมวล รายการเงินฝาก
		ll_procstatus = lds_proc.object.process_dep[ 1 ] 
		
		if isnull( ll_procstatus ) then ll_procstatus = 0
		
		if( ll_procstatus  = 1 ) then 
			// ดึงข้อมูลการทำรายการระบบเงินฝากเข้า ระบบการเงิน
			li_dpsend_fin = integer( this.of_getattribconstant( "deptwait_atfin" , "INTEGER" ))
			if isnull( li_dpsend_fin ) then li_dpsend_fin = 3
			
			if li_dpsend_fin = 3 then
				

					 //ระบบเงินฝาก
				lds_data		= create n_ds
				lds_data.dataobject	= "d_fin_dp_slip_from_memb"
				lds_data.settransobject( itr_sqlca )
					
			
				li_row			= lds_data.retrieve( as_coopid ,ls_cashget , adtm_wdate)
			
				if li_row > 0 then
					this.of_postdeptto_fin( lds_data  , as_coopid  , as_entryid , adtm_wdate ,  ls_deptcancelslip )
				end if

				destroy( lds_dpslip_list )
				destroy( lds_data )
					
			end if
		end if
		
		// ดึงปันผล by num 15/09/2014
		ll_procstatus = lds_proc.object.process_div[ 1 ]
		if ll_procstatus = 1 then
			this.of_postdivto_fin( adtm_wdate, as_coopid )

		end if 
		
next 
destroy( ids_cancelslip ) 

return success
end function

public function string of_postpaychq_fromslip (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_cond_xml, string as_cutbank_xml, string as_chqtype_xml, string as_chqllist_xml, string as_formset) throws Exception;/***********************************************
<description>
	ทำการบันทึกข้อมูลการพิมพ์จากใบทำรายการ และทำการพิมพ์เช็คออก
</description>

<arguments>
	as_branch			รหัสสาขาสหกรณ์
	as_entry				รหัสผู้ใช้ ที่ทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_machine			ชื่อเครื่องทีทำรายการ
	as_cond_xml		ข้อมูลเงื่อนไขการพิมพ์ 
	as_cutbank_xml	ข้อมูลตัดบัญชีธนาคาร 
	as_chqtype_xml	ข้อมูลประเภทเช็ค
	as_chqllist_xml		ข้อมูลรายการจ่ายเป็นเช็ค
	as_printset			ชื่อเครื่องพิมพ์
	as_formset			ชื่อฟอร์มการพิมพ์
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postpaychq_fromslip()
	
	Integer li_return 
	String ls_branch , ls_entry , ls_machine , ls_cond_xml , ls_cutbank_xml , ls_chqtype_xml , ls_chqllist_xml , ls_printset , ls_formset
	datetime		ldtm_wdate
	
	li_return = lnv_finservice.of_postpaychq_fromslip( ls_branch , ls_entry , ldtm_wdate , ls_machine , ls_cond_xml , ls_cutbank_xml , ls_chqtype_xml , ls_chqllist_xml  , ls_printset , ls_formset )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 02/10/2010 by PhaiWaan
	Version 1.1 แก้ไขยกเลิกใช้ Structure ข้อมูลเงื่อนไขการพิมพ์ Modified Date 8/10/2010 by PhaiWaan
	Version 1.2 แก้การกำหนดตำแหน่งการพิมพ์เช็ค Modified Date 12/10/2010 by PhaiWaan
	Version 1.3 ส่งค่าให้ PrintService ทำการพิมพ์เช็ค Modified Date 17/10/2010 by PhaiWaan
</usage>
************************************************/

integer		li_rc, li_chqsize, li_chk, li_prndate , li_payee_flag
integer		li_row, li_index, li_print, li_seq , li_chqstatus , li_killer
string		ls_bankbranch, ls_chqbookno, ls_bank, ls_chqno, ls_coopid, ls_printtype
string		ls_ref_slipno, ls_from_system , ls_accno , ls_chqtype , ls_chqxml
datetime ldtm_chqdate
//li_rc	= this.of_preparechq( )
//if li_rc = -1 then return -1

// Impost String XML----------------------------------------------------
n_ds lds_chqlist , lds_cutbank , lds_chqtype , lds_cond , lds_printchq

// เงื่อนไขการพิมพ์เช็ค
lds_cond	= create n_ds
lds_cond.dataobject = "d_conditionprint_cheque"

if not isnull( as_cond_xml ) and trim( as_cond_xml ) <> "" then
	inv_dwxmliesrv.of_xmlimport( lds_cond, as_cond_xml )
	//this.of_importstring_xml( lds_cond , as_cond_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds 
lds_chqlist.dataobject = "d_chequelist_fromslip" 
lds_chqlist.settransobject( itr_sqlca )

if not isnull( as_chqllist_xml ) and trim( as_chqllist_xml ) <> "" then
	inv_dwxmliesrv.of_xmlimport( lds_chqlist, as_chqllist_xml )
	//this.of_importstring_xml( lds_chqlist , as_chqllist_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเช็ครอพิมพ์ ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

// ตัดยอดบัญชีธนาคาร
lds_cutbank	= create n_ds
lds_cutbank.dataobject = "d_chqprint_cutfrom" 

if not isnull( as_cutbank_xml ) and trim( as_cutbank_xml ) <> "" then
	inv_dwxmliesrv.of_xmlimport( lds_cutbank, as_cutbank_xml )
	//this.of_importstring_xml( lds_cutbank , as_cutbank_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลบัญชีธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

// ประเภทเช็คทำรายการ
lds_chqtype	= create n_ds
lds_chqtype.dataobject = "d_chqprint_chqtype" 

if not isnull( as_chqtype_xml ) and trim( as_chqtype_xml ) <> "" then
	inv_dwxmliesrv.of_xmlimport( lds_chqtype, as_chqtype_xml )
	//this.of_importstring_xml( lds_chqtype , as_chqtype_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลประเภทเช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_printchq = create n_ds
lds_printchq.dataobject = "d_cheque_printformat" 
//------------------------------------------------------------------------

ls_chqxml = ""

ls_printtype		= trim( lds_cond.getitemstring( 1, 'as_printtype' ) ) 
ls_bank				= trim( lds_cond.getitemstring( 1, 'as_bank' ) )
ls_bankbranch		= trim( lds_cond.getitemstring( 1, 'as_bankbranch' ) )
ls_chqbookno		= trim( lds_cond.getitemstring( 1, 'as_chqbookno' ) )
ls_accno			= trim( lds_cutbank.getitemstring( 1, 'as_fromaccno' ) ) 
li_chqsize			= lds_cutbank.getitemnumber( 1, 'ai_chqsize' )
li_chk				= 0
ls_chqtype			= trim( lds_chqtype.getitemstring( 1, 'as_chqprint_chqtype' ) )
li_prndate			= lds_chqtype.getitemnumber( 1, 'ai_prndate') 
li_chqstatus		= lds_chqtype.getitemnumber( 1, 'ai_chqstatus')
li_payee_flag		= lds_chqtype.getitemnumber( 1, 'payee_flag' )
li_killer			= lds_chqtype.getitemnumber( 1, 'killer' )

if isnull( li_prndate ) then li_prndate = 1

// บันทึกรายการพิมพ์เช็ค
this.of_postpaychqstm(  as_coopid , as_entry , as_machine , adtm_wdate , lds_cond  , ls_accno , ls_chqtype , li_chqstatus , lds_chqlist )
 
//// ทำการระบุตำแหน่งเพื่อทำการพิมพ์
this.of_setchqposition( lds_printchq,as_coopid, ls_bank, li_chqsize , ls_printtype , li_prndate , li_payee_flag  )

li_row	= idc_printchq.rowcount( )

for li_index = 1 to li_row
	li_print			= idc_printchq.object.printed_status[li_index]
	
	if isnull( li_print ) then li_print = 0
	
	if li_print = 0 then continue
	
	li_chk ++
	
	ls_chqno	= idc_printchq.object.CHEQUE_NO[li_index]
	li_seq		= idc_printchq.object.SEQ_NO[li_index]
	
	// ทำการระบุรายละเอียดลงบนเช็ค
 	this.of_settolebelchq( lds_printchq,ls_chqno, ls_chqbookno,  ls_bank, ls_bankbranch, li_seq, li_prndate, li_payee_flag , li_killer)
	

//	// ทำการพิมพ์เช็ค
	if li_chk = 1 then
//		PrintSetup()
//		dw_printchq.print( )
//		inv_print_srv.of_print( lds_printchq , "PRINTCHQ" , as_formset )
//	else
//		if ls_printtype = 'DOT' then
//			dw_printchq.event pfc_print( )
//		else
//			dw_printchq.print( )
//		end if
//		
	end if
//	
//	
//	// พิมพ์ใบเสร็จ
//	li_rc		= this.of_startprintreceipt( li_index )
//	
//	commit;
//	

ls_chqxml = ""
if( lds_printchq.rowcount() > 0  ) then
	ls_chqxml = lds_printchq.describe("Datawindow.Data.Xml")
end if

next

commit using itr_sqlca ;

destroy lds_chqlist 
destroy lds_cutbank 
destroy lds_chqtype 
destroy lds_cond 
destroy lds_printchq

return ls_chqxml //success
end function

public function string of_postreprintchq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_formset, string as_cond_xml, string as_retreive_xml, string as_chqlist_xml) throws Exception;/***********************************************
<description>
	ทำการ Reprint Cheque
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการ
	adtm_wdate				วันที่ทำรายการ
	as_machine				ชื่อเครื่องที่ทำรายการ
	as_formset				ฟอร์ม Set การพิมพ์
	as_cond_xml			ข้อมูลเงื่อนไขการพิมพ์
	as_retreive_xml		ข้อมูลเงื่อนการดึงข้อมูล
	as_chqlist_xml			ข้อมูลรายการเลือกพิมพ์
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postreprintchq()
	
	Integer li_return
	String ls_branch , ls_entry , ls_machine , ls_formset , ls_cond_xml , ls_retreive_xml , ls_chqlist_xml
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postreprintchq( ls_branch , ls_entry , ldtm_wdate, ls_machine , ls_formset , ls_cond_xml , ls_retreive_xml , ls_chqlist_xml)
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 27/10/2010 by Phaiwaan
</usage>
************************************************/
integer	li_rc, li_chqsize
integer	li_row, li_index, li_print, li_seq, li_prndate
string	ls_bankbranch, ls_chqbookno, ls_bank, ls_chqno, ls_tempbank, ls_printtype, ls_coopid
string	ls_towhom , ls_chqxml

n_ds  lds_cond , lds_chqlist , lds_printchq , lds_retrieve

lds_cond  = create n_ds
lds_cond.dataobject = "d_chqprint_chqsize"

if not isnull( as_cond_xml ) and trim( as_cond_xml ) <> "" then
	this.of_importstring_xml( lds_cond , as_cond_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_retrieve  = create n_ds
lds_retrieve.dataobject = "d_conditionprint_chequefromchq"

if not isnull( as_retreive_xml ) and trim( as_retreive_xml ) <> "" then
	this.of_importstring_xml( lds_retrieve , as_retreive_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการค้นหา ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_chequelist_fromcheque"


if not isnull( as_chqlist_xml ) and trim( as_chqlist_xml ) <> "" then
	this.of_importstring_xml( lds_chqlist , as_chqlist_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_printchq = create n_ds
lds_printchq.dataobject = "d_cheque_printformat" 
//-------------------------------------------------------------------------

li_chqsize		= lds_cond.object.ai_chqsize[1]
ls_printtype		= lds_cond.object.as_printtype[1]
ls_tempbank	= ""
li_row				= lds_chqlist.rowcount( )
ls_coopid	= as_coopid
li_prndate		= lds_retrieve.object.ai_prndate[1] ; if isnull( li_prndate ) then li_prndate = 1

for li_index = 1 to li_row
	li_print		= lds_chqlist.object.ai_check[li_index]
	
	if isnull( li_print ) then li_print = 0
	
	if li_print = 0 then continue
	
	ls_chqno			= lds_chqlist.object.CHEQUE_NO[li_index]
	li_seq				= lds_chqlist.object.SEQ_NO[li_index]
	ls_bankbranch	= lds_chqlist.object.BANK_BRANCH[li_index]
	ls_chqbookno	= lds_chqlist.object.CHEQUEBOOK_NO[li_index]
	ls_bank			= lds_chqlist.object.BANK_CODE[li_index]
	ls_towhom		= lds_chqlist.object.to_whom[li_index]
	
	update	finchqeuestatement
	set			printed_status		= 1,
				PRINTED_ID			= :as_entry,
				PRINTED_DATE		= :adtm_wdate,
				PRINTED_TERMINAL	= :as_machine,
				to_whom				= :ls_towhom
	where		( CHEQUE_NO			= :ls_chqno ) and
				( CHEQUEBOOK_NO	= :ls_chqbookno ) and
				( BANK_CODE			= :ls_bank ) and 
				( BANK_BRANCH		= :ls_bankbranch ) and
				( COOP_ID	= :as_coopid )
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		messagebox( "ผิดพลาด" ,"ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement เช็คเลขที่ " + ls_chqno + " " + itr_sqlca.sqlerrtext,StopSign! )
		destroy( lds_cond )
		destroy( lds_chqlist )
		destroy( lds_printchq )
		destroy( lds_retrieve )
		rollback using itr_sqlca ;
		return ""
	end if
	
	// ทำการระบุตำแหน่งเพื่อทำการพิมพ์
	if ls_tempbank <> ls_bank then
		this.of_setchqposition( lds_printchq,as_coopid, ls_bank, li_chqsize , ls_printtype , li_chqsize , 0 )
	end if
	
	// ทำการระบุรายละเอียดลงบนเช็ค
	this.of_settolebelchq( lds_printchq,ls_chqno, ls_chqbookno,  ls_bank, ls_bankbranch, li_seq ,1,0,0 )	
	
	// ทำการพิมพ์เช็คผ่าน PrintService
//	inv_print_srv.of_print( lds_printchq , "PRINTCHQ" , as_formset )
	ls_chqxml = ""
	
	if( lds_printchq.rowcount() > 0 ) then
		ls_chqxml = lds_printchq.describe("Datawindow.Data.Xml")
	end if
	
	ls_tempbank	= ls_bank
	
next

commit using itr_sqlca ;

destroy( lds_cond )
destroy( lds_chqlist )
destroy( lds_printchq )
destroy( lds_retrieve )


return ls_chqxml
end function

private function integer of_settolebelchq (ref n_ds adw_data, string as_cheque_no, string as_chequebook_no, string as_bank_code, string as_bank_branch, integer ai_seq_no, integer ai_printdate, integer ai_printpayee, integer ai_printkiller) throws Exception;string		ls_label, ls_towhom, ls_remark,ls_label_detail , ls_money
datetime	ldtm_date
long		ll_row
dec{2}		ldc_money


if( isnull( ai_printdate ) ) then ai_printdate = 1 
if( isnull( ai_printpayee )) then ai_printpayee = 0
if( isnull( ai_printkiller )) then ai_printkiller = 0

n_cst_thailibservice	lnv_thailib
lnv_thailib	 = create n_cst_thailibservice

SELECT	DATE_ONCHQ,			TO_WHOM,			MONEY_AMT,		remark
INTO		:ldtm_date,				:ls_towhom,			:ldc_money,			:ls_remark
FROM	FINCHQEUESTATEMENT  
WHERE	( CHEQUE_NO			= :as_CHEQUE_NO ) AND  
			( CHEQUEBOOK_NO	= :as_CHEQUEBOOK_NO ) AND  
			( BANK_CODE			= :as_BANK_CODE ) AND  
			( BANK_BRANCH		= :as_BANK_BRANCH ) AND  
			( SEQ_NO				= :ai_SEQ_NO )   
using itr_sqlca ;


if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถหารายละเอียดเช็คเลขที่ " + as_CHEQUE_NO + " ได้"
	rollback using itr_sqlca;
	throw ithw_exception
end if

if isnull( ls_remark ) then ls_remark = ""

ll_row 	=	adw_data.insertrow(0)


ls_label										= this.of_cnv_totmsdate( ldtm_date )
ls_label_detail								= this.of_cnv_totdate_cheque( ldtm_date ) //D D M M Y Y Y Y
adw_data.object.headdate[ll_row]			= ls_label

if( ai_printdate  = 0 ) then ls_label_detail = ""




adw_data.object.detaildate[ll_row]			= ls_label_detail

adw_data.object.headname[ll_row]			= ls_towhom
adw_data.object.headsname[ll_row]		= ""
adw_data.object.payname[ll_row]			= ls_towhom

ls_label										= string( ldc_money, "#,##0.00" )
//ls_label										= right( "*****************" + ls_label , 17)
ls_label										= "***" + ls_label + "***" 
adw_data.object.headamt[ll_row]			= ls_label
adw_data.object.moneynumberic[ll_row]	= ls_label

if( ai_printkiller = 1 ) then
	adw_data.object.killer[ll_row]					= "///////"
else
	adw_data.object.killer[ll_row]					= ""
end if
adw_data.object.remark[ll_row]				= ls_remark

ls_label										= lnv_thailib.of_readthaibaht( ldc_money )
adw_data.object.moneythai[ll_row]			= "*** "+ls_label+" ***"

if(  ai_printpayee = 1 ) then
	adw_data.object.payee[ll_row]				= "A/C  PAYEE"
else 
	adw_data.object.payee[ll_row]				= ""
end if
adw_data.accepttext( )

return 1
end function

public function string of_postpaychq_manual (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_main_xml, string as_formset) throws Exception;/***********************************************
<description>
	ทำการบันทึกข้อมูลการพิมพ์ 1 ใบ จากหลายสลิป และทำการพิมพ์เช็คจ่ายออก
</description>

<arguments>
	as_coopid			รหัสสาขาสหกรณ์
	as_entry				รหัสผู้ใช้ ที่ทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_machine			ชื่อเครื่องทีทำรายการ
	as_main_xml		ข้อมูลเงื่อนไขการพิมพ์ 
	as_chqlist_xml		ข้อมูลรายการจ่ายเช็ค
	as_formset			ฟอร์มเซตในการพิมพ์เช็ค
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postpaychq()
	
	Integer li_return 
	String ls_branch , ls_entry , ls_machine , ls_main_xml , ls_chqllist_xml
	datetime		ldtm_wdate
	
	li_return = lnv_finservice.of_postpaychq( ls_branch , ls_entry , ldtm_wdate , ls_machine , ls_main_xml , ls_chqllist_xml  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 02/10/2010 by PhaiWaan
	Version 1.1 ส่งค่าให้ PrintService ทำการพิมพ์เช็ค Modified Date 17/10/2010 by PhaiWaan
</usage>
************************************************/


// กรณีจ่ายเป็นเช็ค
string	ls_chqno, ls_bankcode, ls_bankbranch, ls_paywhom, ls_chequetype , ls_tofromaccid
string	ls_chqbookno, ls_frombranch, ls_fromacc, ls_frombank , ls_referslip , ls_from_system
integer	li_chequestatus, li_chqsize , li_payee , li_killer
string	  ls_member, ls_cashtype, ls_err, ls_chqno_next, ls_remark
dec{2}	ldc_itemamt
datetime	ldtm_onchq
integer	li_used, li_remain, li_available, li_seqno, li_index, li_apv, li_row, li_rc
boolean	lb_adv
string	ls_printtype , ls_slipno[] , ls_chqlist_xml , ls_chqxml

datawindowchild	ldwc_chequeno
// Impost String XML----------------------------------------------------
n_ds lds_chqlist , lds_main ,lds_printchq

// เงื่อนไขการพิมพ์เช็ค
lds_main = create n_ds
lds_main.dataobject = "d_pay_cheque" 

//// รายการพิมพ์เช็ค
//lds_chqlist	= create n_ds
//lds_chqlist.dataobject = "d_pay_cheque_detail_service" 
//lds_chqlist.settransobject( itr_sqlca )


if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_main , as_main_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

//inv_string.of_parsetoarray( as_slipno, ',', ls_slipno[] )
//
//lds_chqlist.retrieve( as_coopid,ls_slipno ) 
//
//ls_chqlist_xml = lds_chqlist.describe( "Datawindow.Data.Xml" )
//
//lds_chqlist.reset()
//if not isnull( ls_chqlist_xml ) and trim( ls_chqlist_xml ) <> "" then
//	this.of_importstring_xml( lds_chqlist , ls_chqlist_xml )
//else
//	ithw_exception.text	= "ไม่มีข้อมูลเลือกทำรายการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
//	throw ithw_exception
//end if

lds_printchq = create n_ds
lds_printchq.dataobject = "d_cheque_printformat" 
//-------------------------------------------------------------------------

lds_main.getchild( "account_no" , ldwc_chequeno ) 
ldwc_chequeno.settransobject( itr_sqlca )
ldwc_chequeno.retrieve(as_coopid )
//li_rc = ldwc_chequeno.rowcount( )

ldc_itemamt			= lds_main.object.cheque_amt[1]
ls_chqno				= trim( lds_main.object.account_no[1] )
ls_bankcode			= trim( lds_main.object.bank_code[1] )
ls_bankbranch		= trim(lds_main.object.bank_branch[1])
ls_chqbookno		= trim( lds_main.object.cheque_bookno[1] )
ldtm_onchq			= lds_main.object.cheque_date[1]
ls_paywhom			= trim( lds_main.object.pay_whom[1] )
li_chequestatus		= lds_main.object.cheque_status[1]
ls_remark			= trim( lds_main.object.remark[1] )
ls_fromacc			= trim( lds_main.object.fromaccount_no[1] )
ls_frombranch		= trim( lds_main.object.frombranch[1] )
ls_frombank			= trim( lds_main.object.frombank[1] )
ls_chequetype		= trim( lds_main.object.cheque_type[1] )
//ls_chqno_next		= f_increment_alfanumeric( ls_chqno, 1 )
li_payee				= lds_main.object.payee_flag[1]   // แก้ทีหลัง
ls_err				= ""
li_index				= 0
li_killer				= lds_main.object.killer[1]

if isnull( ls_chequetype ) or ls_chequetype = "" then ls_chequetype = ""
if isnull( ls_chqno ) or ls_chqno = "" then ls_chqno = ""
if isnull( ls_bankcode ) or ls_bankcode = "" then ls_bankcode = ""
if isnull( ls_chqbookno ) or ls_chqbookno = "" then ls_chqbookno = ""
if isnull( ls_bankbranch ) or ls_bankbranch = "" then ls_bankbranch = ""
if isnull( ldc_itemamt ) or ldc_itemamt = 0 then ldc_itemamt = 0
if isnull( ls_paywhom ) or ls_paywhom ="" then ls_paywhom =""
if isnull( ls_remark ) or ls_remark ="" then ls_remark =""
if isnull( ldtm_onchq ) or string( ldtm_onchq , 'yyyy/mm/dd' ) = '1900/01/01' then setnull( ldtm_onchq )

if ls_chqno = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'เลขที่เช็ค~r~n'
end if

if ls_bankcode = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'ธนาคาร~r~n'
end if

if ls_bankbranch = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'สาขาธนาคาร~r~n'
end if

if ls_chqbookno = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'เลขที่เล่มเช็ค~r~n'
end if

if ls_paywhom =""  then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'สั่งจ่ายเช็ค~r~n'
end if

if isnull( ldtm_onchq ) then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'วันที่หน้าเช็ค~r~n'
end if

if ls_chequetype = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'ประเภทเช็ค~r~n'
end if

if ldc_itemamt = 0 then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'จำนวนเงินที่จ่าย~r~n'
end if


if len( ls_err ) > 0 then
	ithw_exception.text	= "ป้อนข้อมูลที่จะทำการจ่าย ไม่สมบูรณ์ กรุณาตรวจสอบ~r~n" + ls_err 
	throw ithw_exception	
end if


if isnull( ls_fromacc ) then ls_fromacc = ""
if isnull( ls_frombranch ) then ls_frombranch = ""
if isnull( ls_frombank ) then ls_frombank = ""
if isnull( li_chequestatus ) then li_chequestatus = 1// ถ้าค่าที่ได้เป็นค่า null ถือว่าเช็คฉบับนั้นตัดยอดแล้ว

li_index		= 0
ls_err			= ""

if ls_fromacc = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'เลขที่บัญชี~r~n'
end if

if ls_frombranch = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'สาขาธนาคาร~r~n'
end if

if ls_frombank = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'ธนาคาร~r~n'
end if

if len( ls_err ) > 0 then
	ithw_exception.text	= "ป้อนข้อมูลที่จะทำการตัดเงินออก ไม่สมบูรณ์ กรุณาตรวจสอบ~r~n" + ls_err 
	throw ithw_exception	
end if

select	account_id
into		:ls_tofromaccid
from		FINBANKACCOUNT
WHERE		(	ACCOUNT_NO= :ls_fromacc ) AND  
			(	BANK_CODE			= :ls_frombank ) AND  
			( 	BANKBRANCH_CODE	= :ls_frombranch  ) and
			( COOP_ID		= :as_coopid )
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT เพื่อปรับปรุงรหัสคู่บัญชี " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

//// กำหนดค่าให้กับ slip 
//ls_referslip = this.of_setchqlistdetailslip(as_coopid, as_entry , adtm_wdate  , as_machine ,  lds_main , lds_chqlist )


//// บันทึกข้อมูล คู่บัญชีให้กับ slip ของแต่ละ ระบบที่จ่ายเช็ค
//this.of_updatetofrom_accid( as_coopid, adtm_wdate , ldtm_onchq , ls_referslip , ls_tofromaccid , ""  , li_index)
	
// ทำการตัดจ่ายยอดเงินในธนาคารที่ได้จ่ายเช็ค
// ต้องทำการตรวจเช็คก่อนว่ามียอดเงินพอที่จะทำการตัดจ่ายหรือไม่		
// หาลำดับสูงสุดของของเลขที่เช็คธนาคารสาขานั้นๆ
ldwc_chequeno.setfilter("cheque_no='" +ls_chqno + "' and chequebook_no = '" +ls_chqbookno+  "' and bank_code = '" +ls_bankcode+ "' and bank_branch  = '" +ls_bankbranch+ "'" )
ldwc_chequeno.filter( )
li_row		= ldwc_chequeno.getrow( )
if li_row	< 1 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จากเลขที่เช็ค กรุณาตรวจสอบ" + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

li_seqno	= ldwc_chequeno.getitemnumber( li_row, "seq_no" )


update	finchqeuestatement
set		DATE_ONCHQ		= :ldtm_onchq ,
		ENTRY_ID			= :as_entry,
		ENTRY_DATE		= :adtm_wdate,
		TO_WHOM			= :ls_paywhom,
		TYPECHQ_PAY		= 0,
		MONEY_AMT		= :ldc_itemamt,
		CHQEUE_STATUS	= :li_chequestatus,
		ADVANCE_CHQ		= :li_apv,
		COOP_ID	= :as_coopid,
		MACHINE_ID		= :as_machine,
		MEMBER_NO		= :ls_member,
		from_bankaccno	= :ls_fromacc,
		refer_slipno			= :ls_referslip,
		cheque_type		= :ls_chequetype ,
		printed_status		= 1,
		USE_STATUS		= 1,
		remark				= :ls_remark 
where	( CHEQUE_NO		= :ls_chqno ) and
		( CHEQUEBOOK_NO	= :ls_chqbookno ) and
		( BANK_CODE			= :ls_bankcode ) and 
		( BANK_BRANCH		= :ls_bankbranch ) and
		( SEQ_NO				= :li_seqno ) and
		( coop_id		= :as_coopid ) and
		( chqeue_status		<> -9 )
using itr_sqlca ;
				

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception	
end if



select	chqslip_used, chqslip_remain
into		:li_used, :li_remain
from		finchequemas
where		( chequebook_no	= :ls_chqbookno ) and
			( bank_code		= :ls_bankcode ) and
			( bank_branch		= :ls_bankbranch ) and
			( coop_id	= :as_coopid )
using itr_sqlca ;

if isnull( li_used ) then li_used= 0
if isnull( li_remain ) then li_remain= 0

li_used ++
li_remain --
li_available	= 1

if li_remain < 1 then
	li_available		= 0
	li_remain		= 0
end if


// ทำการปรัปรุงค่าเช็คที่ได้ใช้ไป
update	finchequemas
set		chqslip_used		= :li_used,
		chqslip_remain		= :li_remain,
		available_flag		= :li_available,
		last_chqno			= :ls_chqno
where( chequebook_no	= :ls_chqbookno ) and
		( bank_code			= :ls_bankcode ) and
		( bank_branch		= :ls_bankbranch ) and
		( coop_id	= :as_coopid ) 
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchequemas "  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception	
end if

//// บันทึกข้อมูลลง bridgechq 
//this.of_postbridgechq( as_coopid , ls_referslip ,ls_bankcode, ls_bankbranch, ls_chqbookno , ls_chqno , li_seqno )

// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
this.of_posttobank( as_coopid , as_entry , adtm_wdate , as_machine  , ls_fromacc, ls_bankcode, ls_bankbranch, ldc_itemamt , -1)	

// ทำการระบุตำแหน่งเพื่อทำการพิมพ์
li_chqsize	= lds_main.object.chq_size[1]
ls_printtype	= lds_main.object.print_type[1]

//// ทำการระบุตำแหน่งเพื่อทำการพิมพ์
this.of_setchqposition( lds_printchq,as_coopid, ls_bankcode, li_chqsize , ls_printtype , li_chqsize , 0 )

// ทำการระบุรายละเอียดลงบนเช็ค
this.of_settolebelchq( lds_printchq,ls_chqno, ls_chqbookno,  ls_bankcode, ls_bankbranch, li_seqno,1,li_payee, li_killer )

//try
	// ทำการพิมพ์เช็คผ่าน PrintService
//	inv_print_srv.of_print( lds_printchq , "PRINTCHQ" , as_formset )
//catch (Exception th  )
//	ithw_exception.text	= "ไม่สามารถทำรายการพิมพ์เช็คได้ "  + th.text
//	rollback using itr_sqlca ;
//	throw ithw_exception	
//end try

ls_chqxml = ""
if( lds_printchq.rowcount() > 0 ) then
	ls_chqxml	= lds_printchq.describe("Datawindow.Data.Xml")
end if

commit using itr_sqlca ;
return ls_chqxml
end function

public function string of_postpaychq (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_main_xml, string as_slipno, string as_formset) throws Exception;/***********************************************
<description>
	ทำการบันทึกข้อมูลการพิมพ์ 1 ใบ จากหลายสลิป และทำการพิมพ์เช็คจ่ายออก
</description>

<arguments>
	as_coopid			รหัสสาขาสหกรณ์
	as_entry				รหัสผู้ใช้ ที่ทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_machine			ชื่อเครื่องทีทำรายการ
	as_main_xml		ข้อมูลเงื่อนไขการพิมพ์ 
	as_chqlist_xml		ข้อมูลรายการจ่ายเช็ค
	as_formset			ฟอร์มเซตในการพิมพ์เช็ค
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postpaychq()
	
	Integer li_return 
	String ls_branch , ls_entry , ls_machine , ls_main_xml , ls_chqllist_xml
	datetime		ldtm_wdate
	
	li_return = lnv_finservice.of_postpaychq( ls_branch , ls_entry , ldtm_wdate , ls_machine , ls_main_xml , ls_chqllist_xml  )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 02/10/2010 by PhaiWaan
	Version 1.1 ส่งค่าให้ PrintService ทำการพิมพ์เช็ค Modified Date 17/10/2010 by PhaiWaan
</usage>
************************************************/


// กรณีจ่ายเป็นเช็ค
string	ls_chqno, ls_bankcode, ls_bankbranch, ls_paywhom, ls_chequetype , ls_tofromaccid
string	ls_chqbookno, ls_frombranch, ls_fromacc, ls_frombank , ls_referslip , ls_from_system
integer	li_chequestatus, li_chqsize , li_payee	, li_killer
string	  ls_member, ls_cashtype, ls_err, ls_chqno_next, ls_remark , ls_chqxml
dec{2}	ldc_itemamt
datetime	ldtm_onchq
integer	li_used, li_remain, li_available, li_seqno, li_index, li_apv, li_row, li_rc
boolean	lb_adv
string	ls_printtype , ls_slipno[] , ls_chqlist_xml

datawindowchild	ldwc_chequeno
// Impost String XML----------------------------------------------------
n_ds lds_chqlist , lds_main ,lds_printchq

// เงื่อนไขการพิมพ์เช็ค
lds_main = create n_ds
lds_main.dataobject = "d_pay_cheque" 

// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_pay_cheque_detail_service" 
lds_chqlist.settransobject( itr_sqlca )


if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_main , as_main_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

inv_string.of_parsetoarray( as_slipno, ',', ls_slipno[] )

lds_chqlist.retrieve( as_coopid,ls_slipno ) 

ls_chqlist_xml = lds_chqlist.describe( "Datawindow.Data.Xml" )

lds_chqlist.reset()
if not isnull( ls_chqlist_xml ) and trim( ls_chqlist_xml ) <> "" then
	this.of_importstring_xml( lds_chqlist , ls_chqlist_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเลือกทำรายการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_printchq = create n_ds
lds_printchq.dataobject = "d_cheque_printformat" 
//-------------------------------------------------------------------------
ls_chqxml = ""

lds_main.getchild( "account_no" , ldwc_chequeno ) 
ldwc_chequeno.settransobject( itr_sqlca )
ldwc_chequeno.retrieve(as_coopid )
//li_rc = ldwc_chequeno.rowcount( )

ldc_itemamt			= lds_main.object.cheque_amt[1]
ls_chqno				= trim( lds_main.object.account_no[1] )
ls_bankcode			= lds_main.object.bank_code[1]
ls_bankbranch		= trim(lds_main.object.bank_branch[1])
ls_chqbookno		= trim( lds_main.object.cheque_bookno[1] )
ldtm_onchq			= lds_main.object.cheque_date[1]
ls_paywhom			= trim( lds_main.object.pay_whom[1] )
li_chequestatus		= lds_main.object.cheque_status[1]
ls_remark			= trim( lds_main.object.remark[1] )
ls_fromacc			= trim( lds_main.object.fromaccount_no[1] )
ls_frombranch		= trim( lds_main.object.frombranch[1] )
ls_frombank			= trim( lds_main.object.frombank[1] )
ls_chequetype		= trim( lds_main.object.cheque_type[1] )
//ls_chqno_next		= f_increment_alfanumeric( ls_chqno, 1 )
li_payee				= lds_main.object.payee_flag[1]   
li_killer				= lds_main.object.killer[1]   
ls_err				= ""
li_index				= 0

if isnull( ls_chequetype ) or ls_chequetype = "" then ls_chequetype = ""
if isnull( ls_chqno ) or ls_chqno = "" then ls_chqno = ""
if isnull( ls_bankcode ) or ls_bankcode = "" then ls_bankcode = ""
if isnull( ls_chqbookno ) or ls_chqbookno = "" then ls_chqbookno = ""
if isnull( ls_bankbranch ) or ls_bankbranch = "" then ls_bankbranch = ""
if isnull( ldc_itemamt ) or ldc_itemamt = 0 then ldc_itemamt = 0
if isnull( ls_paywhom ) or ls_paywhom ="" then ls_paywhom =""
if isnull( ls_remark ) or ls_remark ="" then ls_remark =""
if isnull( ldtm_onchq ) or string( ldtm_onchq , 'yyyy/mm/dd' ) = '1900/01/01' then setnull( ldtm_onchq )

if ls_chqno = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'เลขที่เช็ค~r~n'
end if

if ls_bankcode = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'ธนาคาร~r~n'
end if

if ls_bankbranch = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'สาขาธนาคาร~r~n'
end if

if ls_chqbookno = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'เลขที่เล่มเช็ค~r~n'
end if

if ls_paywhom =""  then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'สั่งจ่ายเช็ค~r~n'
end if

if isnull( ldtm_onchq ) then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'วันที่หน้าเช็ค~r~n'
end if

if ls_chequetype = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'ประเภทเช็ค~r~n'
end if

if ldc_itemamt = 0 then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'จำนวนเงินที่จ่าย~r~n'
end if


if len( ls_err ) > 0 then
	ithw_exception.text	= "ป้อนข้อมูลที่จะทำการจ่าย ไม่สมบูรณ์ กรุณาตรวจสอบ~r~n" + ls_err 
	throw ithw_exception	
end if


if isnull( ls_fromacc ) then ls_fromacc = ""
if isnull( ls_frombranch ) then ls_frombranch = ""
if isnull( ls_frombank ) then ls_frombank = ""
if isnull( li_chequestatus ) then li_chequestatus = 1// ถ้าค่าที่ได้เป็นค่า null ถือว่าเช็คฉบับนั้นตัดยอดแล้ว

li_index		= 0
ls_err			= ""

if ls_fromacc = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'เลขที่บัญชี~r~n'
end if

if ls_frombranch = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'สาขาธนาคาร~r~n'
end if

if ls_frombank = "" then
	li_index ++
	ls_err		+= string( li_index ) + '. ' + 'ธนาคาร~r~n'
end if

if len( ls_err ) > 0 then
	ithw_exception.text	= "ป้อนข้อมูลที่จะทำการตัดเงินออก ไม่สมบูรณ์ กรุณาตรวจสอบ~r~n" + ls_err 
	throw ithw_exception	
end if

select	account_id
into		:ls_tofromaccid
from		FINBANKACCOUNT
WHERE		(	ACCOUNT_NO= :ls_fromacc ) AND  
			(	BANK_CODE			= :ls_frombank ) AND  
			( 	BANKBRANCH_CODE	= :ls_frombranch  ) and
			( COOP_ID		= :as_coopid )
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT เพื่อปรับปรุงรหัสคู่บัญชี " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// กำหนดค่าให้กับ slip 
ls_referslip = this.of_setchqlistdetailslip(as_coopid, as_entry , adtm_wdate  , as_machine ,  lds_main , lds_chqlist )


// บันทึกข้อมูล คู่บัญชีให้กับ slip ของแต่ละ ระบบที่จ่ายเช็ค
this.of_updatetofrom_accid( as_coopid, adtm_wdate , ldtm_onchq , ls_referslip , ls_tofromaccid , ""  , li_index)
	
// ทำการตัดจ่ายยอดเงินในธนาคารที่ได้จ่ายเช็ค
// ต้องทำการตรวจเช็คก่อนว่ามียอดเงินพอที่จะทำการตัดจ่ายหรือไม่		
// หาลำดับสูงสุดของของเลขที่เช็คธนาคารสาขานั้นๆ
ldwc_chequeno.setfilter("cheque_no='" +ls_chqno + "' and chequebook_no = '" +ls_chqbookno+  "' and bank_code = '" +ls_bankcode+ "' and bank_branch  = '" +ls_bankbranch+ "'" )
ldwc_chequeno.filter( )
li_row		= ldwc_chequeno.getrow( )
if li_row	< 1 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จากเลขที่เช็ค กรุณาตรวจสอบ" + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

li_seqno	= ldwc_chequeno.getitemnumber( li_row, "seq_no" )


update	finchqeuestatement
set		DATE_ONCHQ		= :ldtm_onchq ,
		ENTRY_ID			= :as_entry,
		ENTRY_DATE		= :adtm_wdate,
		TO_WHOM			= :ls_paywhom,
		TYPECHQ_PAY		= 0,
		MONEY_AMT		= :ldc_itemamt,
		CHQEUE_STATUS	= :li_chequestatus,
		ADVANCE_CHQ		= :li_apv,
		COOP_ID	= :as_coopid,
		MACHINE_ID		= :as_machine,
		MEMBER_NO		= :ls_member,
		from_bankaccno	= :ls_fromacc,
		refer_slipno			= :ls_referslip,
		cheque_type		= :ls_chequetype ,
		printed_status		= 0,
		USE_STATUS		= 1,
		remark				= :ls_remark 
where	( CHEQUE_NO		= :ls_chqno ) and
		( CHEQUEBOOK_NO	= :ls_chqbookno ) and
		( BANK_CODE			= :ls_bankcode ) and 
		( BANK_BRANCH		= :ls_bankbranch ) and
		( SEQ_NO				= :li_seqno ) and
		( coop_id		= :as_coopid ) and
		( chqeue_status		<> -9 )
using itr_sqlca ;
				

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception	
end if



select	chqslip_used, chqslip_remain
into		:li_used, :li_remain
from		finchequemas
where		( chequebook_no	= :ls_chqbookno ) and
			( bank_code		= :ls_bankcode ) and
			( bank_branch		= :ls_bankbranch ) and
			( coop_id	= :as_coopid )
using itr_sqlca ;

if isnull( li_used ) then li_used= 0
if isnull( li_remain ) then li_remain= 0

li_used ++
li_remain --
li_available	= 1

if li_remain < 1 then
	li_available		= 0
	li_remain		= 0
end if


// ทำการปรัปรุงค่าเช็คที่ได้ใช้ไป
update	finchequemas
set		chqslip_used		= :li_used,
		chqslip_remain		= :li_remain,
		available_flag		= :li_available,
		last_chqno			= :ls_chqno
where( chequebook_no	= :ls_chqbookno ) and
		( bank_code			= :ls_bankcode ) and
		( bank_branch		= :ls_bankbranch ) and
		( coop_id	= :as_coopid ) 
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchequemas "  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception	
end if


//if ( li_chequestatus = 0 ) or ( li_chequestatus = 2 ) then
//	return 1
//end if

// บันทึกข้อมูลลง bridgechq 
this.of_postbridgechq( as_coopid , ls_referslip ,ls_bankcode, ls_bankbranch, ls_chqbookno , ls_chqno , li_seqno )

// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
this.of_posttobank( as_coopid , as_entry , adtm_wdate , as_machine  , ls_fromacc, ls_bankcode, ls_bankbranch, ldc_itemamt , -1)	

// ทำการระบุตำแหน่งเพื่อทำการพิมพ์
li_chqsize	= lds_main.object.chq_size[1]
ls_printtype	= lds_main.object.print_type[1]

//// ทำการระบุตำแหน่งเพื่อทำการพิมพ์
this.of_setchqposition( lds_printchq,as_coopid, ls_bankcode, li_chqsize , ls_printtype , li_chqsize , 0 )

// ทำการระบุรายละเอียดลงบนเช็ค
this.of_settolebelchq( lds_printchq,ls_chqno, ls_chqbookno,  ls_bankcode, ls_bankbranch, li_seqno,1,li_payee , li_killer)

////try
//if( ls_printtype = "DOT") then
//	inv_print_srv.of_print( lds_printchq , "PRINTCHQ_DOT" , as_formset )
//else
//	// ทำการพิมพ์เช็คผ่าน PrintService
//	inv_print_srv.of_print( lds_printchq , "PRINTCHQ" , as_formset )
//end if
//catch (Exception th  )
//	ithw_exception.text	= "ไม่สามารถทำรายการพิมพ์เช็คได้ "  + th.text
//	rollback using itr_sqlca ;
//	throw ithw_exception	
//end try

ls_chqxml = ""
if( lds_printchq.rowcount() > 0  ) then
	ls_chqxml = lds_printchq.describe("Datawindow.Data.Xml")
end if

destroy lds_chqlist 
destroy lds_main 
destroy lds_printchq

commit using itr_sqlca ;
return ls_chqxml
end function

public function integer of_retrievechqfromapvloan (string as_coopcltr, datetime adtm_wdate, string as_cashtype, ref string as_chqlist_xml, string as_bankcode, string as_bankbranch) throws Exception;n_ds lds_chqlist
string		ls_strfilter

// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds
lds_chqlist.dataobject = "d_chequelist_apvloan_cbt" 
lds_chqlist.settransobject( itr_sqlca )

lds_chqlist.retrieve( adtm_wdate , as_coopcltr , as_cashtype)

as_bankcode 		= trim( as_bankcode )
as_bankbranch 	= trim( as_bankbranch ) 

ls_strfilter = ""
if( as_bankcode <> "%" ) then
	ls_strfilter = "expense_bank = '" + as_bankcode + "'"
end if

if( as_bankbranch <> "%") then
	
	if( ls_strfilter <> "" ) then
		ls_strfilter += " and " 
	end if
	
	ls_strfilter +=  " expense_branch =  '" + as_bankbranch + "'" 

end if
lds_chqlist.setfilter( ls_strfilter ) 
lds_chqlist.filter()
	
//lds_chqlist.rowsdiscard( 1, lds_chqlist.filteredcount() , filter!) 
as_chqlist_xml	 = ""
if lds_chqlist.rowcount( ) > 0 then
	as_chqlist_xml	 = lds_chqlist.describe( "Datawindow.Data.Xml" )
end if

destroy( lds_chqlist ) 

return success
end function

public function string of_postpaychq_fromapvloan (string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_cond_xml, string as_cutbank_xml, string as_chqtype_xml, string as_payoutslip, string as_formset) throws Exception;/***********************************************
<description>
	ทำการบันทึกข้อมูลการพิมพ์จากใบทำรายการ และทำการพิมพ์เช็คออก
</description>

<arguments>
	as_coopid			รหัสสาขาสหกรณ์
	as_entry				รหัสผู้ใช้ ที่ทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_machine			ชื่อเครื่องทีทำรายการ
	as_cond_xml		ข้อมูลเงื่อนไขการพิมพ์ 
	as_cutbank_xml	ข้อมูลตัดบัญชีธนาคาร 
	as_chqtype_xml	ข้อมูลประเภทเช็ค
	as_chqllist_xml		ข้อมูลรายการจ่ายเป็นเช็ค
	as_formset			ชื่อฟอร์มการพิมพ์
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postpaychq_fromslip()
	
	Integer li_return 
	String ls_branch , ls_entry , ls_machine , ls_cond_xml , ls_cutbank_xml , ls_chqtype_xml , ls_chqllist_xml , ls_printset , ls_formset
	datetime		ldtm_wdate
	
	li_return = lnv_finservice.of_postpaychq_fromslip( ls_branch , ls_entry , ldtm_wdate , ls_machine , ls_cond_xml , ls_cutbank_xml , ls_chqtype_xml , ls_chqllist_xml  , ls_printset , ls_formset )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 02/10/2010 by PhaiWaan
	Version 1.1 แก้ไขยกเลิกใช้ Structure ข้อมูลเงื่อนไขการพิมพ์ Modified Date 8/10/2010 by PhaiWaan
	Version 1.2 แก้การกำหนดตำแหน่งการพิมพ์เช็ค Modified Date 12/10/2010 by PhaiWaan
	Version 1.3 ส่งค่าให้ PrintService ทำการพิมพ์เช็ค Modified Date 17/10/2010 by PhaiWaan
</usage>
************************************************/

integer		li_rc, li_chqsize, li_chk, li_prndate , li_payee_flag
integer		li_row, li_index, li_print, li_seq , li_chqstatus	, li_killer
string		ls_bankbranch, ls_chqbookno, ls_bank, ls_chqno, ls_coopbranch, ls_printtype
string		ls_ref_slipno, ls_from_system , ls_accno , ls_chqtype , ls_payoutslip_no[] , ls_chqxml
datetime ldtm_chqdate
//li_rc	= this.of_preparechq( )
//if li_rc = -1 then return -1

// Impost String XML----------------------------------------------------
n_ds lds_chqlist , lds_cutbank , lds_chqtype , lds_cond , lds_printchq

// เงื่อนไขการพิมพ์เช็ค
lds_cond	= create n_ds
lds_cond.dataobject = "d_conditionprint_cheque"

if not isnull( as_cond_xml ) and trim( as_cond_xml ) <> "" then
	this.of_importstring_xml( lds_cond , as_cond_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการพิมพ์เช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

// รายการพิมพ์เช็ค
lds_chqlist	= create n_ds 
lds_chqlist.dataobject = "d_chequelist_apvloan_cbt_service" 
lds_chqlist.settransobject( itr_sqlca )

inv_string.of_parsetoarray( as_payoutslip, ',', ls_payoutslip_no[] )

li_row = lds_chqlist.retrieve( adtm_wdate , is_coopcontrl , ls_payoutslip_no )
if( li_row  < 1 ) then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลทำรายการได้ ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

//if not isnull( as_chqllist_xml ) and trim( as_chqllist_xml ) <> "" then
//	this.of_importstring_xml( lds_chqlist , as_chqllist_xml )
//else
//	ithw_exception.text	= "ไม่มีข้อมูลเช็ครอพิมพ์ ไม่สามารถตรวจสอบข้อมูลได้"
//	throw ithw_exception
//end if

// ตัดยอดบัญชีธนาคาร
lds_cutbank	= create n_ds
lds_cutbank.dataobject = "d_chqprint_cutfrom" 

if not isnull( as_cutbank_xml ) and trim( as_cutbank_xml ) <> "" then
	this.of_importstring_xml( lds_cutbank , as_cutbank_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลบัญชีธนาคาร ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

// ประเภทเช็คทำรายการ
lds_chqtype	= create n_ds
lds_chqtype.dataobject = "d_chqprint_chqtype" 

if not isnull( as_chqtype_xml ) and trim( as_chqtype_xml ) <> "" then
	this.of_importstring_xml( lds_chqtype , as_chqtype_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลประเภทเช็ค ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_printchq = create n_ds
lds_printchq.dataobject = "d_cheque_printformat" 
//------------------------------------------------------------------------

ls_printtype			= trim( lds_cond.object.as_printtype[1] ) 
ls_bank				= trim( lds_cond.object.as_bank[1] )
ls_bankbranch		= trim( lds_cond.object.as_bankbranch[1] )
ls_chqbookno		= trim( lds_cond.object.as_chqbookno[1] )

ls_accno				= trim( lds_cutbank.object.as_fromaccno[1] ) 
li_chqsize			= lds_cutbank.object.ai_chqsize[1]

ls_chqtype			= trim( lds_chqtype.object.as_chqprint_chqtype[1] )
li_prndate			= lds_chqtype.object.ai_prndate[1] 
li_chqstatus			= lds_chqtype.object.ai_chqstatus[1]
li_payee_flag		= lds_chqtype.object.payee_flag[1]
li_killer				= lds_chqtype.object.killer[1]

if isnull( li_prndate ) then li_prndate = 1

// บันทึกรายการพิมพ์เช็ค
this.of_postpaychqstm_apvloan(  as_coopid , as_entry , as_machine , adtm_wdate , lds_cond  , ls_accno , ls_chqtype , li_chqstatus , lds_chqlist )
 
//// ทำการระบุตำแหน่งเพื่อทำการพิมพ์
this.of_setchqposition( lds_printchq, as_coopid , ls_bank, li_chqsize , ls_printtype , li_prndate , li_payee_flag  )

idc_printchq.setfilter( "printed_status = 1 " )
idc_printchq.filter()
li_row	= idc_printchq.rowcount( )

for li_index = 1 to li_row
	li_print			= idc_printchq.object.printed_status[li_index]
	
	if isnull( li_print ) then li_print = 0
	
	if li_print = 0 then continue
	

	ls_chqno	= idc_printchq.object.CHEQUE_NO[li_index]
	li_seq		= idc_printchq.object.SEQ_NO[li_index]
	
	// ทำการระบุรายละเอียดลงบนเช็ค
 	this.of_settolebelchq( lds_printchq,ls_chqno, ls_chqbookno,  ls_bank, ls_bankbranch, li_seq, li_prndate, li_payee_flag, li_killer )
	
//	// ทำการพิมพ์เช็ค
//	if li_print = 1 then
//		if( ls_printtype = "DOT" ) then
//			inv_print_srv.of_print( lds_printchq , "PRINTCHQ_DOT" , as_formset )
//		else
//			inv_print_srv.of_print( lds_printchq , "PRINTCHQ" , as_formset )
//		end if
//	end if

next

ls_chqxml = ""
if( lds_printchq.rowcount() > 0 ) then
	ls_chqxml 	= lds_printchq.describe("Datawindow.Data.Xml")
end if

commit using itr_sqlca ;

destroy lds_chqlist 
destroy lds_cutbank 
destroy lds_chqtype 
destroy lds_cond 
destroy lds_printchq

return ls_chqxml
end function

public function string of_init_payrcv_listslipcmf (datetime adtm_workdate, string as_coopid, string as_refsys, integer ai_payrecv);/*  list รายการเพื่อรอ Init ลง  finslip 
return  xml_list 
*/
string  ls_xmllistpayrcv 
long    ll_rows 
 
n_ds	lds_data 

lds_data 		= create	n_ds
lds_data.dataobject	=	"d_fin_sliplist_cfm"
lds_data.settransobject( itr_sqlca )

ll_rows = lds_data.retrieve(adtm_workdate, as_coopid ,as_refsys,ai_payrecv)

 if ll_rows > 0 then 
		ls_xmllistpayrcv		=	lds_data.describe( "Datawindow.data.XML" )
else
		ls_xmllistpayrcv	=""
end if 

if isnull(ls_xmllistpayrcv)  then  ls_xmllistpayrcv = "" 

destroy (lds_data)

return ls_xmllistpayrcv
end function

public function integer of_postshrlonto_fincfm (string as_slipno, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, ref string as_cancelslipno, integer ai_status) throws Exception;/***********************************************
<description>
	ดึงข้อมูลจากระบบหุ้นหนี้ ที่เป็นรายการรับชำระพิเศษ
</description>

<arguments>	
	as_slipno			รหัสสมาชิก
	as_coopid				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการ
	adtm_wdate				วันที่ทำรายการ
	as_machine				ชื่อเครื่องที่ทำรายการ
	as_cancelslipno			เลขที่รายการที่ยกเลิก
	ai_status					สถานะที่ต้องการบันที่กที่  finslip  8=รอ  ยืนยัน  1  บันทึกเรียบร้อย
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postshrlonto_fin()
	
	Integer li_return
	String ls_memberno , ls_branch , ls_entry , ls_machine
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postshrlonto_fin( ls_memberno , ls_branch , ls_entry , ldtm_wdate, ls_machine )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/10/2010 by Phaiwaan
	Version 1.1 แก้ดึงข้อมูลรายการที่ถูกยกเลิกต้นทางแล้ว Modified Date 6/11/2010 by Phaiwaan	
</usage>
************************************************/

integer	li_row, li_chk, li_itemstatus, li_itemstatus1, li_recev, li_update , li_index , li_found ,  li_index_i , li_rowmas
string	ls_fnrecvno, ls_docno, ls_year, ls_refslipno, ls_slipno, ls_receiptno, ls_stm_itemtype , ls_refsyst , ls_itemdesc
string	ls_entryid, ls_fromsystem, ls_bankcode, ls_bankbranch, ls_memno, ls_nonmemberdetail , ls_loanno
string	ls_accid, ls_cashtype, ls_itemtypecode,  ls_chequeno, ls_paydesc, ls_accountno
string	ls_towhom,  ls_cancelid, ls_memname, ls_shrlontype, ls_slipitemtype , ls_accid_slipdet
datetime	ldtm_dateonchq, ldtm_canceldate, ldtm_entrydate, ldtm_opreatedate, ldtm_postdate
dec{2}	ldc_itemamt, ldc_bankfee, ldc_banksrv, ldc_sharespx , ldc_itemamtdet
dec{2}	ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_accuint, ldc_temp , ldc_prncbal , ldc_int
integer	li_member_flag, li_paymentstatus, li_payrec_status, li_chqadv, li_shlnuserecv, li_recvstatus , li_shrlonrecvsend_fin , li_rowdet
integer	li_finpaystatus

str_slipinfo	lstr_slipinfo
n_ds  lds_cancelslip ,lds_data , lds_datadet



lds_cancelslip	= create n_ds
lds_cancelslip.dataobject		= "d_cancel_othertotfin"
lds_cancelslip.settransobject( itr_sqlca )

lds_data		= create n_ds
lds_data.dataobject	= "d_fin_sl_slip_slslippayin" //"d_fin_sl_slip"
lds_data.settransobject( itr_sqlca )

lds_datadet		= create n_ds
lds_datadet.dataobject	= "d_fin_sl_slipdet_sliippayindet" //"d_fin_sl_slip"
lds_datadet.settransobject( itr_sqlca )


// รับจ่ายเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่
li_recev	= integer( this.of_getattribconstant( "allpay_atfin" ,"INTEGER" ))
if isnull( li_recev ) then li_recev = 0

// ดึงข้อมูล หุ้นหนี้ รายการรับ เข้า ระบบการเงินหรือไม่ shrlonrecvsendfin
li_shrlonrecvsend_fin	= integer( this.of_getattribconstant( "shrlonrecvsendfin" , "INTEGER" ))
if isnull( li_shrlonrecvsend_fin ) then li_shrlonrecvsend_fin = 3 

//ตรวจสอบ กับ  Agument  ที่ส่งเข้ามา  ว่าเป็นการ
choose case    ai_status  
	case  8    
		li_shrlonrecvsend_fin = 2
	case 	1
		li_shrlonrecvsend_fin = 3 
end choose 


// การใช้เลขที่ใบเสร็จของหุ้นหนี้
li_shlnuserecv	= integer( this.of_getattribconstant( "shrlon_usefinreceipt" ,"INTEGER" ))
if isnull( li_shlnuserecv ) then li_shlnuserecv = 0

if li_shrlonrecvsend_fin = 2   then
	li_paymentstatus		= 8
	li_recvstatus				= 0
else
	// ต้องทำการตรวจสอบเงินสดด้วย
	li_paymentstatus		= 1
	li_recvstatus				= 1
end if

li_rowmas		= lds_data.retrieve(as_coopid,  as_slipno)
as_cancelslipno		= ""

// Hard Code POM 
li_paymentstatus		= 8  //รอ Confirm

for li_index = 1 to li_rowmas  
		
		li_payrec_status	= 1   //lds_data.object.sliptypesign_flag[li_index]
		ls_fromsystem		= 'SHL'
		li_itemstatus		= lds_data.object.slip_status[li_index]
				
		// หากน้อยกว่า 0 คือ การจ่าย  1 คือรายการรับ
		if li_payrec_status 	< 1 then
			li_payrec_status	= 0
		end if
		
		ls_refslipno			= lds_data.object.payinslip_no[li_index]
		
		//กรณีเป็นรายการยกเลิก
		if ( li_itemstatus = -9 ) or ( li_itemstatus = -99 ) then				
			// ตรวจสอบมีการทำรายการแล้วรึยัง
			li_found	=	lds_cancelslip.retrieve( as_coopid , ls_refslipno , ls_fromsystem  ) 						
			if li_found = 0 then  continue 
			for	li_index_i = 1	to li_found
					if as_cancelslipno <> "" then as_cancelslipno += ","
					as_cancelslipno	 += lds_cancelslip.object.slip_no[ li_index_i ]
			next
		
		
			// ถ้ารับจ่ายต้อง post เงินสดเลย
			if ( li_shrlonrecvsend_fin <> 2  )  then 
		
				ls_cancelid			= lds_data.object.entry_id[ li_index ]
				ldtm_canceldate	= lds_data.object.cancel_date[ li_index ]
				ls_cashtype			= trim( lds_data.object.moneytype_code[ li_index ] ) 
				ldtm_canceldate	=	datetime( date(ldtm_canceldate ) ) 
				// ทำการปรับปรุงรายการยกเลิก
				update	FINSLIP
				set		PAYMENT_STATUS	= -9,
						cancel_id					= :ls_cancelid,
						cancel_date				= :ldtm_canceldate,
						receive_status			= 1,
						receive_date			= :ldtm_canceldate
				where	REF_SLIPNO			= :ls_refslipno and
						coop_id	= :as_coopid  and
						PAYMENT_STATUS	in(1,8)
				using itr_sqlca ;
				
				if itr_sqlca.sqlcode <> 0 then
					ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
					rollback using itr_sqlca ;
					throw ithw_exception
				end if
				
				// หากรับเงินที่หน้าเคาร์เตอร์เลย
				if ( ls_cashtype = 'CSH' ) then
					
					select		SLIP_NO , 			pay_recv_status , 		member_no, 		item_amtnet , 
								payment_desc , 	itempaytype_code ,	payment_status
					into		:ls_slipno , 			:li_recvstatus , 			:ls_memno , 		:ldc_itemamt, 
								:ls_paydesc , 		:ls_itemtypecode,		:li_paymentstatus
					from		FINSLIP
					where	REF_SLIPNO		= :ls_refslipno and
								coop_id	= 			:as_coopid and
								from_system	= :ls_fromsystem
					using itr_sqlca ;
					 
					if itr_sqlca.sqlcode <> 0 then
						ithw_exception.text	= " ระบบเงินฝาก : ไม่สามารถค้นหาข้อมูลการยกเลิกได้ "+ itr_sqlca.sqlerrtext
						rollback using itr_sqlca ; 
						throw ithw_exception
					end if
//			         //========================================================
//					//ท่อนนี้ เอาไว้ยิงตอนบันทึก conf  หน้ารับอื่นๆ
//					// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
//					lstr_slipinfo.slip_no 			= ls_slipno
//					lstr_slipinfo.coop_id 			= as_coopid
//					lstr_slipinfo.member_no 		= ls_memno
//					lstr_slipinfo.description 		= ls_paydesc
//					lstr_slipinfo.entry_date 		= ldtm_canceldate
//					lstr_slipinfo.from_system 	= ls_fromsystem
//					lstr_slipinfo.item_amt 		= ldc_itemamt
//					lstr_slipinfo.item_status 		= -9
//					lstr_slipinfo.sign_flag 			= li_recvstatus
//					lstr_slipinfo.recpaytype_code = ls_itemtypecode
//					try
//						this.of_postcash( lstr_slipinfo  , 1 ,ls_cancelid )  //ยิงรายการยกเลิก ลง Cash
//					catch ( Exception th )
//						rollback using itr_sqlca ;
//						throw ithw_exception
//					end try 
//			         //========================================================
				end if
				commit using itr_sqlca ;
			end if 
 
			continue
		end if
		 
		// ตรวจสอบมีการทำรายการแล้วรึยัง
		select count( * )
		into 	:li_found
		from finslip
		where ref_slipno = :ls_refslipno
		and	coop_id		= :as_coopid
		and	PAYMENT_STATUS <> -9
		and from_system  = 'SHL'
		using itr_sqlca ;
		
		if isnull( li_found ) then li_found = 0
		
		if li_found > 0 then  continue 				
		
		ldc_itemamt			= lds_data.object.slip_amt[li_index]	
		ldtm_opreatedate	= lds_data.object.operate_date[li_index]
		ldtm_entrydate		= lds_data.object.slip_date[li_index]
		ls_entryid			= lds_data.object.entry_id[li_index]

		ls_bankcode			= lds_data.object.expense_bank[li_index]
		ls_bankbranch		= lds_data.object.expense_branch[li_index]
		ls_memno			= lds_data.object.member_no[li_index]
		ls_memname		= this.of_getmembername( ls_memno )
		ls_towhom			= trim( ls_memname )
		ls_cashtype			= lds_data.object.moneytype_code[li_index]
		ls_itemtypecode	= lds_data.object.sliptype_code[li_index]
		ls_accountno		= lds_data.object.expense_accid[li_index]
		ls_accid				= lds_data.object.tofrom_accid[li_index]
		ldc_banksrv			= 0.00 //lds_data.object.banksrv_amt[li_index]
		ldc_bankfee			= 0.00 //lds_data.object.bankfee_amt[li_index]
		ls_cancelid			= as_entry
		ldtm_canceldate	= adtm_wdate

		ls_receiptno			= ""
		ldtm_postdate		= inv_calendar_srv.of_getpostingdate( year( date( ldtm_opreatedate ) ), month( date( ldtm_opreatedate ) ) )

		if isnull( ldc_itemamt ) then	ldc_itemamt = 0
		
//		if ldc_itemamt < 1 then
//			ithw_exception.text	= "ระบบหุ้นหนี้ : ยอดทำรายการน้อยกว่าหรือเท่ากับ 0 ไม่สามารถทำรายการได้"
//			rollback using itr_sqlca ; 
//			throw ithw_exception
//		end if
		
		// สอบถามว่าเป็นการจ่าปันผลหรือเปล่า
		if ( ls_itemtypecode = 'YDI' ) then
			li_payrec_status	= 0
		end if
		
		ls_fnrecvno		= this.of_get_lastslip_docno( "FNRECEIVENO" )
		
		this.of_getshrlon( as_coopid   ,ls_memno  ,ldc_accuint ,  ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx )
		
		//ทำการหาข้อมูลเพิ่มเติมเกี่ยวกับ ดอกเบี้ยสะสม และ ทุนเรือนหุ้น
		// ดอกเบี้ยสะสม
		ldc_temp	= 0
		select		sum( interest_payamt )
		into		:ldc_temp
		from		slslippayindet
		where	payinslip_no			= :ls_refslipno and
					coop_id					= :as_coopid	and
					slipitemtype_code	= 'LON' 
		using itr_sqlca ;
					
		if isnull( ldc_temp ) or ldc_temp < 0 then ldc_temp = 0
		ldc_accuint		= ldc_accuint + ldc_temp
		
		//ทุนเรือนหุ้น
		ldc_temp				= 0
		ls_stm_itemtype	= ""
		
		select		item_payamt, 	stm_itemtype
		into		:ldc_temp, 		:ls_stm_itemtype
		from		slslippayindet
		where	payinslip_no				= :ls_refslipno and
					coop_id					= :as_coopid	and
					slipitemtype_code		= 'SHR' 
		using itr_sqlca ;
					
		if isnull( ldc_temp ) or ldc_temp < 0 then ldc_temp = 0
		if isnull( ldc_temp )  then ls_stm_itemtype = ""
		
		ldc_share	= ldc_share + ldc_temp
		
		// หุ้นพิเศษ
		if ls_stm_itemtype = "SPX" or  ls_stm_itemtype = "SPD" then
			ldc_sharespx	= ldc_sharespx + ldc_temp
		end if
		
		// คำอธิบาย
		if ( ls_stm_itemtype = 'SPD'  ) or ( ls_stm_itemtype = 'LPD' ) then
			ls_paydesc	= " โอนซื้อหุ้น/ชำระหนี้ " + ls_memno
		else
			ls_paydesc	= "ซื้อหุ้น/ชำระหนี้ " + ls_memno //lds_data.object.slipitem_desc[li_index] + " " + ls_memno
		end if
	 	
		if ls_cashtype = 'TRN' or ls_cashtype = 'TBK' or ls_cashtype = "CBT" then
//			li_paymentstatus	= 1
			li_recvstatus			= 1
			if ( ( ls_itemtypecode <> 'YDI' ) or ( ( ls_itemtypecode = 'YDI' ) and ( ( ls_stm_itemtype = "SPD" ) or ( ls_itemtypecode = 'LPD' )  ) )  ) or  &
						( ( date( ldtm_postdate ) <> date( ldtm_entrydate ) ) and ( ls_itemtypecode = "PMF" ) ) then
				
				if ( li_shlnuserecv = 1 ) then
					ls_receiptno		= this.of_get_lastslip_docno( "FNRECEIPTNO" )
				else
					ls_receiptno	= lds_data.object.document_no[li_index]
				end if
				
				li_payrec_status	= 1
		
				// by Phai ยังไม่รุว่าใช้ทำอะรัย
		//		// กรณีที่สร้างเลขที่ใบเสร็จต้องทำการปรับปรุงที่รายการเคลื่อนไหวของรายการที่เกี่ยวข้องได้
		//		// หนี้ , หุ้น
		//		for li_update = 1 to lds_data.rowcount()
		//			string	ls_loancontract_no, ls_slipitemtype_code, ls_lncoop_id, ls_REF_DOCNO
		//			string	ls_shrlontype_code
		//			integer	li_operate_flag
		//			
		//			ls_slipitemtype_code	= lds_data.object.slipitemtype_code[li_update]
		//			ls_loancontract_no	= lds_data.object.loancontract_no[li_update]
		//			li_operate_flag		= lds_data.object.operate_flag[li_update]
		//			ls_lncoop_id			= lds_data.object.lncoop_id[li_update]
		//			ls_REF_DOCNO			= lds_data.object.document_no[li_update]
		//			ls_shrlontype_code	= lds_data.object.shrlontype_code[li_update]
		//			
		//			if isnull( ls_REF_DOCNO ) then ls_REF_DOCNO = ""
		//			if isnull( ls_lncoop_id ) then ls_lncoop_id = as_coopid
		//			if isnull( li_operate_flag ) then li_operate_flag = 0
		//			if isnull( ls_loancontract_no ) then ls_loancontract_no = ""
		//			if isnull( ls_slipitemtype_code ) then ls_slipitemtype_code = ""
		//			
		//			if ( li_operate_flag = 1 ) and ( li_shlnuserecv = 1 ) then
		//				choose case ls_slipitemtype_code
		//					case "SHR"
		////						UPDATE	SHSHARESTATEMENT  
		////						SET		REF_DOCNO			= :ls_receiptno
		////						WHERE	( MEMBER_NO			= :ls_memno ) AND  
		////									( SHARETYPE_CODE	= :ls_shrlontype_code ) AND  
		////									( coop_id			= :ls_mbbranch ) AND  
		////									( REF_DOCNO			= :ls_REF_DOCNO ) ;
		////									
		////						if itr_sqlca.sqlcode <> 0 then
		////							messagebox( "ผิดพลาด", "ไม่สามารถบันทึกข้อมูลลง UPDATE	SHSHARESTATEMENT   ได้ " + itr_sqlca.sqlerrtext, StopSign! )
		////							rollback;
		////							return Failure
		////						end if
		//
		//					case "LON"
		////						UPDATE	LNCONTSTATEMENT  
		////						SET		REF_DOCNO			= :ls_receiptno
		////						WHERE	( LOANCONTRACT_NO	= :ls_loancontract_no ) AND  
		////									( coop_id			= :ls_lncoop_id ) AND  
		////									( REF_DOCNO			= :ls_REF_DOCNO )  ;
		////
		////						if itr_sqlca.sqlcode <> 0 then
		////							messagebox( "ผิดพลาด", "ไม่สามารถบันทึกข้อมูลลง UPDATE	LNCONTSTATEMENT   ได้ " + itr_sqlca.sqlerrtext, StopSign! )
		////							rollback;
		////							return Failure
		////						end if
		//						
		//					case else
		//						
		//				end choose
		//			end if			
		//			
		//		next
				
			end if
		end if
		
		// บันทึกลง slip หลัก
		INSERT INTO	FINSLIP
		(	SLIP_NO,					ENTRY_ID,					ENTRY_DATE,				OPERATE_DATE,
			FROM_SYSTEM,		PAYMENT_STATUS,		CASH_TYPE,				PAYMENT_DESC,
			BANK_CODE,			BANK_BRANCH,				ITEMPAY_AMT,				PAY_TOWHOM,
			DATEON_CHQ,			MEMBER_NO,				ITEMPAYTYPE_CODE,		PAY_RECV_STATUS,
			MEMBER_FLAG,			NONMEMBER_DETAIL,	coop_id,						MACHINE_ID,
			CANCEL_ID,				CANCEL_DATE,				BANKFEE_AMT,				BANKSRV_AMT,
			TOFROM_ACCID,		ACCOUNT_NO,				CHEQUEBOOK_NO,			CHQ_ADVFLAG,
			ref_slipno,				remark,						SHARE_AMT,				emer_amt,
			norm_amt,				extra_amt,					sharespx_amt,				tax_flag,
			tax_amt,					tax_rate,						item_amtnet,				ref_system,
			receive_date,			receive_status,				accuint_amt,				FROM_BANKCODE,
			FROM_BRANCHCODE,	retail_flag,					receipt_no,					recvpay_id ,
			vat_amt					,print_status
		)  
		VALUES
		(	:ls_fnrecvno,			:ls_entryid,				:ldtm_entrydate,				:ldtm_opreatedate,   
			:ls_fromsystem,		:li_paymentstatus,		:ls_cashtype,					:ls_paydesc,
			:ls_bankcode,			:ls_bankbranch,		:ldc_itemamt,					:ls_towhom,   
			null,						:ls_memno,				:ls_itemtypecode,				:li_payrec_status,   
			1,							:ls_memname,			:as_coopid,						:as_machine,   
			:ls_cancelid,				:ldtm_canceldate,		:ldc_bankfee,					:ldc_banksrv,   
			:ls_accid,				:ls_accountno,			null,								null,
			:ls_refslipno,			null,						:ldc_share,						:ldc_emer,
			:ldc_norm,				:ldc_extra,				:ldc_sharespx,					0,
			0,							0,							:ldc_itemamt,					:ls_fromsystem,
			:ldtm_entrydate,		:li_recvstatus,			:ldc_accuint,					:ls_bankcode,
			:ls_bankbranch,		0,							:ls_receiptno,					:ls_entryid ,
			0	,						1
		) using itr_sqlca ; 
		
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถบันทึกข้อมูลลง Finslip ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		li_row = lds_datadet.retrieve( as_coopid,  as_slipno )
		
		li_rowdet = 0 
		for li_index_i = 1 to li_row
			
			li_rowdet++
			
			ls_refsyst			= trim( lds_datadet.object.slipitemtype_code[li_index_i] )
			ls_shrlontype		= trim( lds_datadet.object.shrlontype_code[li_index_i] )
			ldc_itemamtdet		= lds_datadet.object.item_payamt[li_index_i]
			ls_itemdesc			= trim( lds_datadet.object.slipitem_desc[li_index_i] )
			ls_loanno			= trim( lds_datadet.object.loancontract_no[li_index_i] )
			ldc_prncbal 			= lds_datadet.object.principal_payamt[li_index_i]
			ldc_int				= lds_datadet.object.interest_payamt[li_index_i]
			
			if isnull( ldc_prncbal  )  then	ldc_prncbal  = 0 
			if isnull( ldc_int  )  then	ldc_int  = 0 
			if isnull( ls_shrlontype  )  then	ls_shrlontype  = '00' 
			//ต้นเงินกู้
			if( ldc_prncbal > 0 )  then
			// ชำระต้นเงิน
				if ls_refsyst = 'LON' then
					ls_paydesc	= ls_itemdesc + "  (ต้นเงิน) " + ls_loanno
				else
					ls_paydesc	= ls_itemdesc + "  (ต้นเงิน) " + ls_memno
				end if
				
			// หาคู่บัญชี ของหุ้น หนี้ ----------------------
				select account_id 
				into 	:ls_accid_slipdet
				from vcmapaccid
				where  system_code = 'LON'
				and slipitemtype_code = :ls_refsyst
				and	coop_id			= :as_coopid	
				and shrlontype_code = :ls_shrlontype
				and shrlontype_status = 1
				using itr_sqlca ;
				
				if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ls_refsyst
			//----------------------------------------------------
				
			INSERT INTO FINSLIPDET  
				( 	SLIP_NO,              		coop_id,              					SEQ_NO,              		SLIPITEMTYPE_CODE,              	SLIPITEM_DESC,   
					SLIPITEM_STATUS,		CANCEL_ID,							CANCEL_DATE,				POSTTOVC_FLAG,						VOUCHER_NO,   
					CANCELTOVC_FLAG,		CANCELVC_NO,						DISPLAYONLY_STATUS,	ITEMPAY_AMT,							ACCOUNT_ID,   
					ITEMPAYAMT_NET,		TAX_FLAG,							VAT_FLAG,					TAX_CODE,								TAXWAY_KEEP,   
					TAX_AMT,					SECTION_ID,						MEMBGROUP_CODE,		OPERATE_FLAG
				)  
			VALUES
				(	:ls_fnrecvno ,				:as_coopid , 						:li_rowdet , 					:ls_accid_slipdet , 						:ls_paydesc ,
					1 , 							null ,									null ,							0 ,											null , 		
					0	,							null ,									0 ,								:ldc_prncbal , 							:ls_accid_slipdet ,
					:ldc_prncbal , 				0 , 									0	,							0 ,											0 ,
					0 ,								0	,									null ,							1 
				) using itr_sqlca ;
				
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถบันทึกข้อมูลต้นเงินลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext  + "   LON " +  " -" +ls_refsyst + " - " + ls_shrlontype
				rollback using itr_sqlca ; 
				throw ithw_exception
			end if
		end if
		
		//ดอกเบี้ย
		if( ldc_int > 0 ) then
		ls_paydesc = ""
		// ชำระดอกเบี้ย
			li_rowdet++
			if ls_refsyst = 'LON' then
					ls_paydesc	= ls_itemdesc + " (ดอกเบี้ย) " + ls_loanno
				else
					ls_paydesc	= ls_itemdesc + " (ดอกเบี้ย) " + ls_memno
				end if
				
			// หาคู่บัญชี ของหุ้น หนี้ ----------------------
				select accint_id 
				into 	:ls_accid_slipdet
				from vcmapaccid
				where  system_code = 'LON'
				and slipitemtype_code = :ls_refsyst
				and	coop_id			= :as_coopid	
				and shrlontype_code = :ls_shrlontype
				and shrlontype_status = 1
				using itr_sqlca ;
				
				if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ls_refsyst
			//----------------------------------------------------
				
			INSERT INTO FINSLIPDET  
				( 	SLIP_NO,              		coop_id,              		SEQ_NO,              		SLIPITEMTYPE_CODE,              	SLIPITEM_DESC,   
					SLIPITEM_STATUS,		CANCEL_ID,							CANCEL_DATE,				POSTTOVC_FLAG,						VOUCHER_NO,   
					CANCELTOVC_FLAG,		CANCELVC_NO,						DISPLAYONLY_STATUS,	ITEMPAY_AMT,							ACCOUNT_ID,   
					ITEMPAYAMT_NET,		TAX_FLAG,							VAT_FLAG,					TAX_CODE,								TAXWAY_KEEP,   
					TAX_AMT,					SECTION_ID,						MEMBGROUP_CODE,		OPERATE_FLAG
				)  
			VALUES
				(	:ls_fnrecvno ,				:as_coopid , 						:li_rowdet , 					:ls_accid_slipdet , 						:ls_paydesc ,
					1 , 							null ,									null ,							0 ,											null , 		
					0	,							null ,									0 ,								:ldc_int , 							:ls_accid_slipdet ,
					:ldc_int , 			0 , 									0	,							0 ,											0 ,
					0 ,								0	,									null ,							1 
				) using itr_sqlca ;
				
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถบันทึกข้อมูลดอกเบี้ยลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext  + "  LON "  + " -" +ls_refsyst + " - " + ls_shrlontype
				rollback using itr_sqlca ; 
				throw ithw_exception
			end if
			
		end if
		
			//หุ้น   รายการอื่น
			if( ldc_itemamtdet > 0  and ldc_prncbal = 0  and ldc_int = 0 )  then
				ls_paydesc			= ls_itemdesc 
				ls_refsyst 			= 'SHR'
				
			// หาคู่บัญชี ของหุ้น หนี้ ----------------------
				select account_id 
				into 	:ls_accid_slipdet
				from 	 vcmapaccid
				where  system_code = 'SHR'
						and slipitemtype_code 	= :ls_refsyst
						and	coop_id				= :as_coopid	
						and shrlontype_code 		= :ls_shrlontype
						and shrlontype_status 	= 1
				using itr_sqlca ;
				
				if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ls_refsyst
				
				
				
			//----------------------------------------------------
				
			INSERT INTO FINSLIPDET  
				( 	SLIP_NO,              		coop_id,              						SEQ_NO,              				SLIPITEMTYPE_CODE,            		SLIPITEM_DESC,   
					SLIPITEM_STATUS,		CANCEL_ID,								CANCEL_DATE,						POSTTOVC_FLAG,						VOUCHER_NO,   
					CANCELTOVC_FLAG,		CANCELVC_NO,							DISPLAYONLY_STATUS,			ITEMPAY_AMT,							ACCOUNT_ID,   
					ITEMPAYAMT_NET,		TAX_FLAG,								VAT_FLAG,							TAX_CODE,								TAXWAY_KEEP,   
					TAX_AMT,					SECTION_ID,							MEMBGROUP_CODE,				OPERATE_FLAG
				)  
			VALUES
				(	:ls_fnrecvno ,				:as_coopid , 						:li_rowdet , 					:ls_accid_slipdet , 								    		:ls_paydesc ,
					1 , 							null ,									null ,							0 ,											    	null , 		
					0	,							null ,									0 ,								:ldc_itemamtdet, 							:ls_accid_slipdet ,
					:ldc_itemamtdet , 				0 , 									0	,							0 ,												0 ,
					0 ,								0	,									null ,							1 
				) using itr_sqlca ;
				
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถบันทึกข้อมูลหุ้นลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext  + "   SHR " + " -" +ls_refsyst + " - " + ls_shrlontype
				rollback using itr_sqlca ; 
				throw ithw_exception
			end if
		end if	
						
	next
	
//// หากรับเงินที่หน้าเคาร์เตอร์เลย
//if ( li_recev = 0 ) and ( ls_cashtype = 'CSH' ) then
//	 if this.of_postcash( ls_fnrecvno , "FIN"  ) = Failure then return FAILURE
//end if

//if (ls_cashtype = "CSH" ) and (  li_shrlonrecvsend_fin <> 2 ) then pom remark

if (ls_cashtype = "CSH" ) and  ls_itemtypecode = "LWD"  then		
		// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
		lstr_slipinfo.slip_no 			= ls_refslipno
		lstr_slipinfo.coop_id 			= as_coopid
		lstr_slipinfo.member_no 		= ls_memno
		lstr_slipinfo.description 		= ls_paydesc
		lstr_slipinfo.entry_date 		= ldtm_entrydate
		lstr_slipinfo.from_system 	= ls_fromsystem
		lstr_slipinfo.item_amt 		= ldc_itemamt
		lstr_slipinfo.item_status 		= 1
		lstr_slipinfo.sign_flag 			= li_payrec_status
		lstr_slipinfo.recpaytype_code = ls_itemtypecode
		
		try
			this.of_postcash( lstr_slipinfo  , 1 ,ls_entryid )
		catch ( Exception thw )
			rollback using itr_sqlca ;
			throw ithw_exception
		end try
end if

	// Update สถานะการผ่านรายการมาการเงิน
	update slslippayin
	set		post_tofin = 1
	where payinslip_no = :ls_refslipno	and
		coop_id		= :as_coopid
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบชำระหุ้นหนี้ : ไม่สามารถ Update สถานะผ่านรายการมาการเงิน ได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
next 
destroy lds_datadet;
destroy lds_data;
commit using itr_sqlca ;
return Success
end function

public function integer of_isexistfinslip (string as_slipno, string as_coop_id);integer  li_return ,li_count 
n_ds   lds_finslip

lds_finslip	= create n_ds
lds_finslip.dataobject	= "d_fin_slipspc"
lds_finslip.settransobject( itr_sqlca )

li_count  = lds_finslip.Retrieve(as_coop_id,as_slipno) 
if li_count  > 0 then 
 		 li_return = 1  
else 		 
		 li_return = 0  
 end if 	 
 if isnull(li_return ) then   li_return = 0
//
return   li_return
end function

public function integer of_init_payrecv_slipcfm (string as_coopid, string as_slipno, string as_entryid, string as_machine, datetime adtm_wdate, ref string as_xmlfinslip, ref string as_xmlfinslipdet) throws Exception;//string		ls_tofromacc
datetime	ldtm_entry, ldtm_time
long        ll_count ,ll_rows
string      ls_fnslipno
n_ds		lds_finslip  , lds_finslipdet,lds_data  

lds_data 		= create	n_ds
lds_data.dataobject	=	"d_fin_sliplist_memcfm"
lds_data.settransobject( itr_sqlca )

ll_rows = lds_data.retrieve(as_slipno,as_coopid) 
if ll_rows <= 0 then  
		ithw_exception.text	= "ไม่พบรายการชำระหนี้  เพื่อยืนยันการรับเงิน ของสมาชิก  ( " + as_slipno + " )  finslip "  		
		destroy(lds_finslip)
		destroy(lds_finslipdet)
		destroy(lds_data)
		return  -1  //ไม่พบรายการชำระรอยืนยัน
		//throw ithw_exception   
end if

 // ให้อ่านรายการแรกเสมอ
ls_fnslipno  =  trim(lds_data.object.slip_no[1])
if isnull(ls_fnslipno)  then  ls_fnslipno= "" 
 
lds_finslip		= create		n_ds
lds_finslip.dataobject	= "d_fin_slipspc"   
lds_finslip.settransobject( itr_sqlca )
ll_count = lds_finslip.retrieve(as_coopid,ls_fnslipno)  
if ll_count <= 0 then  
		ithw_exception.text	= "ไม่พบรายการรอ ยืนยันรายการ  ( " + ls_fnslipno + " )  finslip " 
		destroy(lds_finslip)
		destroy(lds_finslipdet)
		destroy(lds_data)
		return -2
		//throw ithw_exception 
end if

 
 
lds_finslipdet		= create		n_ds
lds_finslipdet.dataobject	= "d_fin_slipspc_det_itemtype"  
lds_finslipdet.settransobject( itr_sqlca )
ll_count = lds_finslipdet.retrieve(as_coopid,ls_fnslipno)  
if ll_count <= 0 then  
		ithw_exception.text	= "ไม่พบรายการรายละเอียด  (" + ls_fnslipno + " ) ในตาราง finslipdet "  		
		destroy(lds_finslip)
		destroy(lds_finslipdet)
		destroy(lds_data)
		throw ithw_exception   
		return -3
end if
// set ค่าให้ใหม่ เมื่อจัดเตรียมขึ้นมา  
lds_finslip.setitem(1,"operate_date",adtm_wdate)
lds_finslip.object.entry_date[1] 			= adtm_wdate   
lds_finslip.object.recvpay_time[1]			= ldtm_time
lds_finslip.object.coop_id[1]					= as_coopid
lds_finslip.object.machine_id[1]			= as_machine
lds_finslip.object.entry_id[1]				= as_entryid

as_xmlfinslip		=	lds_finslip.describe( "Datawindow.data.XML" )
as_xmlfinslipdet		=	lds_finslipdet.describe( "Datawindow.data.XML" )

return 1
end function

public function integer of_postlonlwdto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, ref string as_cancelslipno) throws Exception;/***********************************************
<description>
	ดึงข้อมูลจากระบบหนี้ ที่เป็นรายการจ่ายเงินกู้
</description>

<arguments>	
	as_memberno			รหัสสมาชิก
	as_coopid				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการ
	adtm_wdate				วันที่ทำรายการ
	as_machine				ชื่อเครื่องที่ทำรายการ
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postlonlwdto_fin()
	
	Integer li_return
	String ls_memberno , ls_branch , ls_entry , ls_machine
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postlonlwdto_fin( ls_memberno , ls_branch , ls_entry , ldtm_wdate, ls_machine )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/10/2010 by Phaiwaan
	Version 1.1 เพิ่มกรณีมีการหักกลบ Modified Date 20/10/2010 by Phaiwaan
	Version 1.2 แก้ให้สร้างเลขที่ใบเสร็จ/ใบสำคัญจ่าย Modified Date 27/10/2010 by Phaiwaan
	Version 1.3 แก้ดึงข้อมูลรายการยกเิลิกจากต้นทาง Modified Date 6/11/2010 by Phaiwaan	
</usage>
************************************************/
integer		li_row, li_payrec_status, li_paymentstatus, li_chk, li_itemstatus, li_recev , li_found , li_seq_no , li_index_i , li_brigde
integer		li_status, li_recvstatus, li_itemstatus1, li_update, li_shlnuserecv , li_index ,li_shrlonsend_fin , li_printstatus , li_shrlonpaysendfin
string			ls_cashtype, ls_slipno, ls_docno, ls_year, ls_desc,  ls_receiptno, ls_mbcoop_id
dec{2}		ldc_recvnet, ldc_sharespx, ldc_accuint, ldc_itempay_amt, ldc_itempay_amtnet, ldc_buyshare
dec{2}		ldc_share, ldc_emer, ldc_norm, ldc_extra 
dec{2}		ldc_bankfee_amt, ldc_banksrv_amt, ldc_payout_amt, ldc_buyshare_amt
string			ls_tofrom_accid, ls_loancontract_no, ls_member_no, ls_expense_accid, ls_expense_branch
string			ls_expense_bank, ls_entry_id,  ls_fromsystem , ls_accid_slipdet , ls_shrlontype_code
string			ls_machineid, ls_loantype, ls_memname, ls_loantypedesc, ls_towhom, ls_remark ,ls_itemtypecode
datetime		ldtm_entry_date, ldtm_operdate
string			ls_cancelid, ls_printslip[], ls_payslip_no , ls_slipclr , ls_refsyst
datetime		ldtm_canceldate

str_slipinfo	lstr_slipinfo

li_row		= ads_data.rowcount(  )

select confirmcshlnrcv_flag, shrlon_usefinreceipt, 	shrlonpaysendfin
into 	:li_recev, 				:li_shlnuserecv, 		:li_shrlonpaysendfin
from 	finconstant 
where coop_id = :as_coopid 
using itr_sqlca;

// รับจ่ยเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่
//li_recev	=  integer( this.of_getattribconstant( "confirmcshlnrcv_flag" , "INTEGER" ))
if isnull( li_recev ) then li_recev = 0

// การใช้เลขที่ใบเสร็จของหุ้นหนี้
//li_shlnuserecv	=  integer( this.of_getattribconstant( "shrlon_usefinreceipt" , "INTEGER" ))
//if isnull( li_shlnuserecv ) then li_shlnuserecv = 0

// สถานะผ่าน รายการที่การเงิน 
// 1 ผ่านรายการทันที 
// 2 รอยืนยันรายการ
// 3 ประมวลผ่านการเงิน
//li_shrlonpaysendfin	= integer( this.of_getattribconstant( "shrlonpaysendfin" , "INTEGER" ))
//if isnull( li_shrlonpaysendfin ) then li_shrlonpaysendfin = 2

if li_shrlonpaysendfin = 2 then
	li_paymentstatus	= 8
	li_recvstatus		= 0
	li_printstatus	= 0 
else
	li_paymentstatus	= 1
	li_recvstatus		= 1
	li_printstatus	= 1
end if

ldc_itempay_amt		= 0
ldc_itempay_amtnet 	= 0
li_seq_no = 0
as_cancelslipno		= ""

for li_index = 1 to li_row

		ls_receiptno				= ""
		li_payrec_status		= 0 // pay
		ls_machineid			= as_machine
		ldc_recvnet				= ads_data.object.payoutnet_amt[li_index]
		ls_mbcoop_id			= ads_data.object.coop_id[li_index]
		ls_cashtype				= trim( ads_data.object.moneytype_code[li_index] )
		ls_fromsystem			= 'LON'
		li_itemstatus			= ads_data.object.slip_status[li_index]
		ls_payslip_no			= ads_data.object.payoutslip_no[li_index]
		ls_entry_id				= ads_data.object.entry_id[li_index]
		ldtm_entry_date		=	ads_data.object.slip_date[li_index]
		
		if li_itemstatus = -9 or li_itemstatus = -99 then
			//by num ไม่ได้ใช่
			li_found	=	ids_cancelslip.retrieve( as_coopid  , ls_payslip_no , ls_fromsystem ) //หารายการยกเลิก pay out  by kowit
			if li_found = 0 then  continue 
//			
//
//			
//				for	li_index_i = 1	to li_found
//					if as_cancelslipno <> "" then as_cancelslipno += ","
//					as_cancelslipno		+= ids_cancelslip.object.slip_no[ li_index_i ]
//				next
			
						// ถ้ารับจ่ายต้อง post เงินสดเลย
			if ( li_shrlonpaysendfin <> 2 ) then
				
				ls_cancelid			= ads_data.object.cancel_id[li_index]
				ldtm_canceldate	= ads_data.object.cancel_date[li_index]
				
				update	FINSLIP
				set			PAYMENT_STATUS	= -9,
							cancel_id				= :ls_cancelid,
							cancel_date			= :ldtm_canceldate,
							receive_status		= 1,
							receive_date		= :ldtm_canceldate			
				where	coop_id				= :as_coopid and
							REF_SLIPNO			= :ls_payslip_no and
							PAYMENT_STATUS in ( 1, 8)
				using itr_sqlca ;
				
				if itr_sqlca.sqlcode <> 0 then
					ithw_exception.text	= "ระบบหนี้ : ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
					rollback using itr_sqlca ; 
					throw ithw_exception

				end if
				
				if   ( ls_cashtype = 'CSH' ) then
						//หารายการยกเลิก finslip by kowit
						select		SLIP_NO, 	pay_recv_status, 	member_no, 		item_amtnet, 		payment_desc, 
									itempaytype_code
						into		:ls_slipno , 	:li_recvstatus, 		:ls_member_no, 	:ldc_payout_amt, 	:ls_desc , 
									:ls_itemtypecode
						from		FINSLIP
						where	REF_SLIPNO		= :ls_payslip_no and
									coop_id			= :as_coopid and
									from_system	= :ls_fromsystem 
						using itr_sqlca ;
						
						if itr_sqlca.sqlcode <> 0 then
							ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถค้นหาข้อมูลการยกเลิกได้"+ itr_sqlca.sqlerrtext 
							rollback using itr_sqlca ; 
							throw ithw_exception
						end if
						
						// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
						lstr_slipinfo.slip_no 			= ls_slipno
						lstr_slipinfo.coop_id 			= as_coopid
						lstr_slipinfo.member_no 		= ls_member_no
						lstr_slipinfo.description 		= ls_desc
						lstr_slipinfo.entry_date 		= ldtm_entry_date
						lstr_slipinfo.from_system 	= ls_fromsystem
						lstr_slipinfo.item_amt 		= ldc_payout_amt
						lstr_slipinfo.item_status 		= -9
						lstr_slipinfo.sign_flag 			= li_recvstatus
						lstr_slipinfo.recpaytype_code = ls_itemtypecode
						
						try
							this.of_postcash( lstr_slipinfo  , 1 ,ls_cancelid )//ผ่านรายการไปลิ้นชัก  by kowit
						catch ( Exception th )
							rollback using itr_sqlca ;
							throw ithw_exception
						end try
				
					end if

				end if		
			
			commit using itr_sqlca ;
			continue
		end if
		
		if ls_cashtype = 'CHQ' then
			li_paymentstatus	= 8
			
//			ตรวจสอบว่าได้มีการพิมพ์เช็คแล้วรึไม่
			select count(*) 
			into	:li_brigde
			from finbridgechq
			where coop_id = :as_coopid and
					slip_no 	= :ls_payslip_no 	and
					bridge_status	<> -9
			using itr_sqlca ;
			
			if (itr_sqlca.sqlcode <> 0 ) then
				li_brigde = 0
			end if
			
			
			if li_brigde > 0 and li_shrlonpaysendfin <> 2 then
				li_paymentstatus = 1
			end if

		end if	
			
		
		ls_shrlontype_code	= ads_data.object.shrlontype_code[li_index]
		ldc_bankfee_amt		= ads_data.object.bankfee_amt[li_index]
		ldc_banksrv_amt		= ads_data.object.banksrv_amt[li_index]
		ls_tofrom_accid		= ads_data.object.tofrom_accid[li_index]
		
		if isnull( ls_tofrom_accid ) then ls_tofrom_accid = ""
		if( ls_tofrom_accid = "" ) then
			ls_tofrom_accid		= this.of_defaultaccid( ls_cashtype ) 
		end if		
		
		ls_loancontract_no		= trim( ads_data.object.loancontract_no[li_index] )
		
		ls_member_no			= ads_data.object.member_no[li_index]
		ls_memname			= this.of_getmembername( ls_member_no )
		ls_expense_accid		= ads_data.object.expense_accid[li_index]
		ls_expense_branch	= ads_data.object.expense_branch[li_index]
		ls_expense_bank		= ads_data.object.expense_bank[li_index]
		ldc_payout_amt		= ads_data.object.payout_amt[li_index]
		ldc_buyshare_amt		= 0.00 //ads_data.object.buyshare_amt[li_index]
		ldtm_entry_date		= adtm_wdate
		
		ldtm_operdate			= datetime (date( ads_data.object.slip_date[li_index] ) )
		ls_towhom				= trim( ls_memname )
		ls_slipclr					= trim( ads_data.object.slipclear_no[li_index] )
		
		if isnull( ls_slipclr ) then ls_slipclr = ""
		
		// ตรวจสอบมีการทำรายการแล้วรึยัง
		select count( * )
		into 	:li_found
		from finslip
		where ref_slipno = :ls_payslip_no
		and entry_date = :ldtm_entry_date
		and	coop_id	= :as_coopid
		and	PAYMENT_STATUS <> -9
		and from_system  = 'LON'
		using itr_sqlca ;
		
		if isnull( li_found ) then li_found = 0
		
		if li_found > 0 then  continue 
		
		if isnull( ldc_buyshare_amt ) then ldc_buyshare_amt = 0
		
		ls_receiptno	= ""
		
		ls_desc			= 'จ่ายเงินกู้สัญญา ' + ls_loancontract_no + " สมาชิก " + ls_member_no
		ls_remark		= "จ่าย " + ls_loancontract_no + " สมาชิก " + ls_member_no
		ls_remark		= "~r~n" + ls_remark + "อ. " + string( ldc_payout_amt , '#,##0.00' )
		if isnull( li_itemstatus ) then li_itemstatus = 1

		
		// สร้างเลขที่เอกสาร
		ls_slipno			= this.of_get_lastslip_docno( "FNRECEIVENO" )
		
		ldc_recvnet		= ldc_payout_amt

		if isnull( ls_slipclr )  then ls_slipclr = ""
		if  ls_slipclr <>  "" then
			
			ids_payclr = create n_ds
			ids_payclr.dataobject = "d_loansrv_lnpayin_slipdet"
			ids_payclr.settransobject( itr_sqlca)
			
			li_chk = ids_payclr.retrieve( as_coopid, ls_slipclr )
			
			if li_chk >= 1 then 
				
				if li_shlnuserecv = 1 then
					ls_receiptno			=  this.of_get_lastslip_docno( "FNRECEIPTNO" )
				else
					ls_receiptno	= ads_data.object.slipclear_no[ li_index ]
				end if
				
				ldc_itempay_amt	= dec( ids_payclr.describe( "Evaluate(' sum( item_payamt for all ) ' , 0 ) " ) ) 
				
				ldc_recvnet		= ldc_payout_amt  - ldc_itempay_amt 
			end if

		end if
			

		this.of_getshrlon( as_coopid   ,ls_member_no  ,ldc_accuint ,  ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx )

		INSERT INTO FINSLIP  
		(		SLIP_NO,					ENTRY_ID,					ENTRY_DATE,					OPERATE_DATE,   
				FROM_SYSTEM,		PAYMENT_STATUS,		CASH_TYPE,					PAYMENT_DESC,   
				BANK_CODE,			BANK_BRANCH,				ITEMPAY_AMT,					PAY_TOWHOM,   
				DATEON_CHQ,			MEMBER_NO,				ITEMPAYTYPE_CODE,			PAY_RECV_STATUS,   
				MEMBER_FLAG,			NONMEMBER_DETAIL,	coop_id,							MACHINE_ID,   
				CANCEL_ID,				CANCEL_DATE,				BANKFEE_AMT,					BANKSRV_AMT,
				TOFROM_ACCID,		ACCOUNT_NO,				CHEQUEBOOK_NO,				CHQ_ADVFLAG,
				REF_SLIPNO,			REF_SYSTEM,				FROM_ACCNO,					RECEIPT_NO,
				REMARK,					FROM_BANKCODE,			FROM_BRANCHCODE,			loanappv_amt,
				SHARE_AMT,			emer_amt,					norm_amt,						extra_amt,
				sharespx_amt,			tax_amt,						tax_flag,							tax_rate,
				item_amtnet,			receive_date,				receive_status,					accuint_amt,
				retail_flag,				payslip_no,					recvpay_id	,					vat_amt ,
				print_status
		)  
		VALUES
		( 		:ls_slipno,   				:ls_entry_id,					:ldtm_entry_date,				:ldtm_operdate,
				:ls_fromsystem,		:li_paymentstatus,			:ls_cashtype,					:ls_desc,
				:ls_expense_bank,		:ls_expense_branch,		:ldc_recvnet,					:ls_towhom,
				null,   					:ls_member_no,			'LWD',							:li_payrec_status,
				1,							:ls_memname,				:as_coopid,						:ls_machineid,   
				null,						null,							:ldc_bankfee_amt,				:ldc_banksrv_amt,
				:ls_tofrom_accid,		null,							null,								null,
				:ls_payslip_no,			:ls_fromsystem,			null,								:ls_receiptno,   
				:ls_remark,				:ls_expense_bank,			null,								:ldc_payout_amt,
				:ldc_share,				:ldc_emer,					:ldc_norm,						:ldc_extra,
				:ldc_sharespx,			0,								0,									0,
				:ldc_recvnet,			:ldtm_entry_date,			:li_recvstatus,					:ldc_accuint,
				0,							:ls_payslip_no,				:ls_entry_id	,					0 ,
				:li_printstatus
		)  using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหนี้ : ไม่สามารถบันทึกข้อมูลลง Finslip ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		li_seq_no++
		
		// หาคู่บัญชี ของหนี้ ----------------------
		select 	account_id 
		into 		:ls_accid_slipdet
		from 		vcmapaccid
		where  	system_code = 'LON'
		and 		slipitemtype_code = 'LON'
		and		coop_id					= :is_coopcontrl	
		and 		shrlontype_code = :ls_shrlontype_code
		and 		shrlontype_status = 1
		using itr_sqlca ;
		
		if isnull( ls_accid_slipdet ) then 
			ithw_exception.text	= "ระบบหนี้ : ไม่พบคู่บัญชี ประเภท " +ls_shrlontype_code + " ในตาราง vcmapaccid "
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if 
		//----------------------------------------------------
		
		INSERT INTO FINSLIPDET  
		( 	SLIP_NO,              		coop_id,              					SEQ_NO,              		SLIPITEMTYPE_CODE,              	SLIPITEM_DESC,   
			SLIPITEM_STATUS,		CANCEL_ID,							CANCEL_DATE,				POSTTOVC_FLAG,						VOUCHER_NO,   
			CANCELTOVC_FLAG,		CANCELVC_NO,						DISPLAYONLY_STATUS,	ITEMPAY_AMT,							ACCOUNT_ID,   
			ITEMPAYAMT_NET,		TAX_FLAG,							VAT_FLAG,					TAX_CODE,								TAXWAY_KEEP,   
			TAX_AMT,					SECTION_ID,						MEMBGROUP_CODE,		OPERATE_FLAG,						vat_amt
		)  
		VALUES
		(	:ls_slipno ,					:as_coopid , 						:li_seq_no , 					:ls_accid_slipdet , 						:ls_desc ,
			1 , 							null ,									null ,							0 ,											null , 		
			0	,							null ,									0 ,								:ldc_payout_amt , 						:ls_accid_slipdet ,
			:ldc_payout_amt , 			0 , 									0	,							0 ,											0 ,
			0 ,								0	,									null ,							1 ,											0
		) using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหนี้ : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		// หากมีการหักกลบสัญญาเดิม
		li_chk = ids_payclr.rowcount( )
		if li_chk > 0 then 
			this.of_postpayoutto_finclr( ls_slipno , as_coopid , ids_payclr , li_seq_no)
		end if

		// รับเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่
		// ถ้ารับจ่ายต้อง post เงินสดเลย
		// ถ้าไม่ใช่ รอยืนยัน
		if ( li_shrlonpaysendfin <> 2 ) and ( ls_cashtype = 'CSH' ) then
			
			// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
			lstr_slipinfo.slip_no 			= ls_payslip_no
			lstr_slipinfo.coop_id 			= as_coopid
			lstr_slipinfo.member_no 		= ls_member_no
			lstr_slipinfo.description 		= ls_desc
			lstr_slipinfo.entry_date 		= ldtm_entry_date
			lstr_slipinfo.from_system 	= ls_fromsystem
			lstr_slipinfo.item_amt 		= ldc_recvnet
			lstr_slipinfo.item_status 		= 1
			lstr_slipinfo.sign_flag 			= li_payrec_status
			lstr_slipinfo.recpaytype_code = ls_itemtypecode
	
			try
				this.of_postcash( lstr_slipinfo  , 1 ,ls_entry_id )
			catch ( Exception thw )
				rollback using itr_sqlca ;
				throw ithw_exception
			end try
		
		end if
			// Update สถานะการผ่านรายการมาการเงิน
	update slslippayout
	set		post_tofin = 1
	where payoutslip_no = :ls_payslip_no	and
		coop_id		= :as_coopid
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบเงินกู้ : ไม่สามารถ Update สถานะผ่านรายการมาการเงิน ได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if

next

commit using itr_sqlca ;
return Success
end function

public function integer of_postcash (str_slipinfo astr_slipinfo, integer as_row, string as_entryid) throws Exception;//n_ds	ads_data
string		ls_error_text, as_approve
integer	li_row, li_itemstatus
datetime	ldtm_operatedate, ldtm_entrydate, ldtm_slipdate
string		ls_account_no, ls_coopid, ls_slipno, ls_app
string		ls_itemgroup, ls_recppaytype_code, ls_moneysupport
string		ls_itemtype_group, ls_depttype, ls_desc, ls_memno
integer	li_seq, li_sign_flag, li_status, li_index
dec{2}	ldc_amount, ldc_balance, ldc_vatamt, ldc_taxamt

ls_slipno					= astr_slipinfo.slip_no 
ls_app					= astr_slipinfo.from_system 
ls_recppaytype_code 	= trim( astr_slipinfo.recpaytype_code  )
ls_desc					= astr_slipinfo.description 
ls_account_no			= astr_slipinfo.slip_no 
ldtm_entrydate			= astr_slipinfo.entry_date 
ldtm_operatedate		= datetime( date( ldtm_entrydate ) , now() )
ls_memno				= astr_slipinfo.member_no 
ldc_amount				= astr_slipinfo.item_amt 
li_sign_flag				= astr_slipinfo.sign_flag 
li_itemstatus			= astr_slipinfo.item_status 
li_status					= as_row
li_index					= 0
ls_coopid					= astr_slipinfo.coop_id 
ldc_taxamt				= astr_slipinfo.tax_amt


SELECT	AMOUNT_BALANCE,	laststm_no
INTO		:ldc_balance,	:li_seq
FROM		FINTABLEUSERMASTER  
WHERE		( USER_NAME 		= :as_entryid ) AND 
			( OPDATEWORK		= :ldtm_entrydate )  and
			( status				= 11 )	and
			coop_id				= :ls_coopid
using itr_sqlca	;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถทำรายการได้ยังไม่ได้เปิดลิ้นชัก หรือได้ปิดไปแล้วของ  " + as_entryid + itr_sqlca.sqlerrtext
//	rollback using itr_sqlca;
	throw ithw_exception
end if

choose case li_itemstatus
	case 1
		choose case li_sign_flag
			case 1	// ฝาก
				li_status			= 22
				ldc_balance	+= ldc_amount
				
			case 0	// ถอน
				li_status			= 21
				ldc_balance	-= ldc_amount
		end choose
	case -9 
		ls_desc	= 'ยกเลิก' + ls_desc		
		choose case li_sign_flag
			case 1	// ฝาก
				li_status			= 21
				ldc_balance	-= ldc_amount
				
			case 0	// ถอน
				li_status			= 22
				ldc_balance	+= ldc_amount
		end choose
	case else

		ithw_exception.text	= "ไม่สามารถทำรายการเคลื่อนไหวเงินสดได้ status = 8  ~r~n" + itr_sqlca.sqlerrtext
//		rollback using itr_sqlca;
		throw ithw_exception
end choose

if isnull( li_seq ) then li_seq = 0

if ls_coopid = '012001' then // ทำแค่กรมที่ดิน
	if ldc_taxamt > 0 then 
		
		li_seq ++
		ldc_balance += ldc_taxamt
		INSERT INTO	FINTABLEUSERDETAIL
		(	USER_NAME,				APPLICATION,			OPDATEWORK,				SEQNO,
			OPDATE,						STATUS,					AMOUNT,					ITEMTYPE_CODE,
			ITEMTYPE_DESC,			DOC_NO,					MEMBER_NO,				AMOUNT_BALANCE,
			MONEYTYPE_CODE,		MONEYTYPE_DESC,	NAMEAPPORVE,			NAMETABLE,
			group_type,					ref_docno,				ref_status,					coop_id
		)  
		VALUES
		(	:as_entryid,					:ls_app,					:ldtm_entrydate,			:li_seq,
			:ldtm_operatedate,		22,						:ldc_taxamt,					'TAX',
			'ภาษี',							:ls_account_no,		:ls_memno,					:ldc_balance,
			'CSH',							:ls_desc,					:as_entryid,					:as_entryid,
			null,							:ls_slipno,				22,							:ls_coopid
		)  using itr_sqlca	;
		
		if itr_sqlca.sqlcode <> 0 then
	
			li_index ++
			ls_error_text	= "~r~n" + string ( li_index ) + '.'+ itr_sqlca.sqlerrtext
			ithw_exception.text	=  " FINTABLEUSERDETAIL Tax " +  ls_error_text  +"~r~n" + itr_sqlca.sqlerrtext
			rollback using itr_sqlca;
			throw ithw_exception
	
		end if
			
		ldc_amount = ldc_amount + ldc_taxamt
	end if 
	
end if 

li_seq ++

INSERT INTO	FINTABLEUSERDETAIL
	(	USER_NAME,				APPLICATION,			OPDATEWORK,				SEQNO,
		OPDATE,						STATUS,					AMOUNT,					ITEMTYPE_CODE,
		ITEMTYPE_DESC,			DOC_NO,					MEMBER_NO,				AMOUNT_BALANCE,
		MONEYTYPE_CODE,		MONEYTYPE_DESC,	NAMEAPPORVE,			NAMETABLE,
		group_type,					ref_docno,				ref_status,					coop_id
	)  
	VALUES
	(	:as_entryid,					:ls_app,					:ldtm_entrydate,			:li_seq,
		:ldtm_operatedate,		:li_status,				:ldc_amount,				:ls_recppaytype_code,
		:ls_desc,						:ls_account_no,		:ls_memno,					:ldc_balance,
		'CSH',							:ls_desc,					:as_entryid,					:as_entryid,
		null,							:ls_slipno,				:li_status,					:ls_coopid
	)  using itr_sqlca	;
	
if itr_sqlca.sqlcode <> 0 then
	
	li_index ++
	ls_error_text	= "~r~n" + string ( li_index ) + '.'+ itr_sqlca.sqlerrtext
	ithw_exception.text	=  " FINTABLEUSERDETAIL " +  ls_error_text  +"~r~n" + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
	
end if

update	FINTABLEUSERMASTER
set			AMOUNT_BALANCE	= :ldc_balance,
			laststm_no				= :li_seq
WHERE	USER_NAME 			= :as_entryid
AND		OPDATEWORK 			= :ldtm_entrydate
and		coop_id					= :ls_coopid
using	itr_sqlca	;

if itr_sqlca.sqlcode <> 0 then
	li_index ++
	ls_error_text	= "~r~n" + string ( li_index ) + '.'+ itr_sqlca.sqlerrtext
	ithw_exception.text	=   "FINTABLEUSERMASTER "  +  ls_error_text  +"~r~n" + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

return Success
end function

private function integer of_postdeptto_finfee (string as_slipno, string as_coopid, string as_entry, datetime adtm_wdate) throws Exception;/***********************************************
<description>
	ดึงข้อมูลจากระบบเงินฝาก ค่าธรรมการถอนเกินกำหนด บันทึกผ่านระบบการเงิน
</description>

<arguments>	
	as_memberno			รหัสสมาชิก
	as_branch				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการ
	adtm_wdate				วันที่ทำรายการ
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postdeptto_finfee()
	
	Integer li_return
	String ls_memberno , ls_branch , ls_entry 
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postdeptto_finfee( ls_memberno , ls_branch , ls_entry , ldtm_wdate )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 14/10/2010 by Phaiwaan
</usage>
************************************************/


n_ds		lds_slip
integer		li_row, li_chk, li_memflag, li_payfee_meth , li_index
string		ls_fnrecvno, ls_docno, ls_year, ls_refslipno
string		ls_entryid, ls_fromsystem, ls_bankcode, ls_bankbranch, ls_memno, ls_nonmemberdetail
string		ls_accid, ls_cashtype, ls_itemtypecode, ls_coopbranch, ls_chequeno, ls_paydesc, ls_accountno
string		ls_towhom, ls_machineid, ls_cancelid, ls_depttype
datetime	ldtm_dateonchq, ldtm_canceldate, ldtm_entrydate, ldtm_opreatedate
dec{2}		ldc_itemamt, ldtm_bankfee, ldc_banksrv
dec{2}		ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx, ldc_accuint
integer		li_member_flag, li_paymentstatus, li_payrec_status, li_chqadv, li_itemstatus
string		ls_memname, ls_slipno, ls_acciddes,  ls_tofromaccid
string		ls_SLIPITEMTYPE_CODE, ls_coop_id, ls_deptaccount
INTEGER		li_posttovc_flag

ls_coop_id 		= is_coopcontrl

lds_slip			= create n_ds
lds_slip.dataobject	= "d_fin_dp_slip"
lds_slip.settransobject( itr_sqlca )

ls_SLIPITEMTYPE_CODE	= trim( string( this.of_getattribconstant( "itemwithfee_code" ,"STRING" ) ) )

ls_acciddes	= trim( this.of_getattribconstant( "cash_accid" ,"STRING"  ) )// เงินสด
li_row		= lds_slip.retrieve( as_slipno, as_coopid )

if li_row < 1 then
	ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถผ่านรายการไปยัง ระบบการเงินได้ ส่วนของการเรียกเก็บค่าธรรมเนียม"
	rollback using itr_sqlca ;
	throw ithw_exception
end if

for li_index = 1 to li_row
		
	li_posttovc_flag		= 1
	li_payfee_meth			= lds_slip.object.payfee_meth[li_index]
	
	ls_fnrecvno				= this.of_get_lastslip_docno( "FNRECEIVENO" )
	
	li_payrec_status		= 1// take 0 is pay
	li_paymentstatus		= 8
	ls_refslipno				= lds_slip.object.deptslip_no[li_index]
	ldc_itemamt				= lds_slip.object.other_amt[li_index]
	ldtm_opreatedate		= lds_slip.object.entry_date[li_index]
	
	//ls_coop_id				= lds_slip.object.coop_id[li_index]
	ldtm_entrydate			= lds_slip.object.entry_date[li_index]
	ls_entryid				= lds_slip.object.entry_id[li_index]
	ls_fromsystem			= 'DEP'
	ls_memno				= lds_slip.object.member_no[li_index]
	ls_memname				= this.of_getmembername( ls_memno )
	ls_deptaccount			= trim( lds_slip.object.deptaccount_no[li_index] )
	
	
	if isnull( ls_memname ) then
		ls_memname = ""
		li_memflag		= 0
	else
		li_memflag		= 1
	end if
	
	ls_memname			= trim( ls_memname )
	
	if li_payfee_meth = 1 then
		ls_cashtype			= 'CSH'
		li_posttovc_flag		= 0
	else
		ls_cashtype			= 'TRN'
		li_paymentstatus	= 1
		li_posttovc_flag		= 1
	end if
	
	ls_itemtypecode		= lds_slip.object.recppaytype_code[li_index]
	ls_coopbranch		= ls_coop_id
	ls_paydesc			= lds_slip.object.recppaytype_desc[li_index]
	ls_accountno		= lds_slip.object.deptaccount_no[li_index]
	ls_machineid		= lds_slip.object.machine_id[li_index]
	li_itemstatus		= lds_slip.object.item_status[li_index]
	
	// ถ้าเป็นรายการยกเลิกการถอน
	if li_itemstatus = -9  then
		select		SLIP_NO
		into		:ls_slipno
		from		FINSLIP
		where	ENTRY_DATE			= :ldtm_entrydate and
					REF_SLIPNO		= :ls_refslipno and 
					item_amtnet		= :ldc_itemamt and 
					PAYMENT_STATUS 	<> 1 
		using itr_sqlca ;
					
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		ls_cancelid			= as_entry
		ldtm_canceldate		= adtm_wdate	
		
		update		FINSLIP
		set			PAYMENT_STATUS		= -9,
					cancel_id			= :ls_cancelid,
					cancel_date			= :ldtm_canceldate,
					receive_status		= 1,
					receive_date		= :ldtm_canceldate		
		where		SLIP_NO				= :ls_slipno
		and			coop_id				= :as_coopid
		using itr_sqlca ; 
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		return Success
		
	end if
	
	this.of_getshrlon( as_coopid   ,ls_memno  ,ldc_accuint ,  ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx )
	ls_paydesc			= 'ค่าธรรมเนียมในการถอนเงินฝาก'
	
	select 		deptslip_no
	into		:ls_refslipno
	from	 	dpdeptslip
	where 		deptaccount_no		= :ls_deptaccount
	and 		deptslip_date		= :ldtm_opreatedate
	and 		recppaytype_code	= 'FEE'
	using 		itr_sqlca ;
	
	INSERT INTO	FINSLIP
	(	SLIP_NO,				ENTRY_ID,			ENTRY_DATE,				OPERATE_DATE,
		FROM_SYSTEM,			PAYMENT_STATUS,		CASH_TYPE,				PAYMENT_DESC,
		BANK_CODE,				BANK_BRANCH,		ITEMPAY_AMT,			PAY_TOWHOM,
		DATEON_CHQ,				MEMBER_NO,			ITEMPAYTYPE_CODE,		PAY_RECV_STATUS,
		MEMBER_FLAG,			NONMEMBER_DETAIL,	COOP_ID,				MACHINE_ID,
		CANCEL_ID,				CANCEL_DATE,		BANKFEE_AMT,			BANKSRV_AMT,
		TOFROM_ACCID,			ACCOUNT_NO,			CHEQUEBOOK_NO,			CHQ_ADVFLAG,
		ref_slipno,				remark,				SHARE_AMT,				emer_amt,
		norm_amt,				extra_amt, 			sharespx_amt,			tax_amt,
		tax_flag,				tax_rate,			item_amtnet,			foracc_flag,
		ref_system,				des_accid,			accuint_amt,			retail_flag,
		posttovc_flag,			print_status,		receive_status, 		vat_amt
	)  
	VALUES
	(	:ls_fnrecvno,			:ls_entryid,		:ldtm_entrydate,		:ldtm_opreatedate,   
		:ls_fromsystem,			:li_paymentstatus,	:ls_cashtype,			:ls_paydesc,
		:ls_bankcode,			:ls_bankbranch,		:ldc_itemamt,			:ls_memname,   
		null,					:ls_memno,			:ls_itemtypecode,		:li_payrec_status,   
		:li_memflag,			:ls_memname,		:as_coopid,				:ls_machineid,   
		null,					null,				0,						0,   
		:ls_acciddes,			null,				null,					null, 
		:ls_refslipno,			:ls_paydesc,		:ldc_share,				:ldc_emer,
		:ldc_norm,				:ldc_extra,			:ldc_sharespx,			0,
		0,						0,					:ldc_itemamt,			0,
		'DEP',					null,				:ldc_accuint,			0,
		:li_posttovc_flag,		0, 					0,						0
	)  using itr_sqlca ;
	
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถบันทึกข้อมูลลง Finslip ได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
	// คู่บัญชี รายได้เบ็ดเตล็ด
	ls_paydesc	= 'ค่าธรรมเนียมในการถอนเงินฝาก'
	
	select		depttype_code
	into		:ls_depttype
	from		dpdeptmaster
	where		deptaccount_no = :ls_accountno
	using		itr_sqlca ;
	
	select		widoverlimit_accid
	into		:ls_tofromaccid
	from		dpdepttype
	where		depttype_code = :ls_depttype
	using		itr_sqlca ;
	
	if isnull( ls_tofromaccid ) then ls_tofromaccid = ""
	
	INSERT INTO FINSLIPDET 
	(	SLIP_NO,				COOP_ID,				SEQ_NO,				SLIPITEMTYPE_CODE,
		SLIPITEM_DESC,			SLIPITEM_STATUS,		CANCEL_ID,			CANCEL_DATE,
		POSTTOVC_FLAG,			VOUCHER_NO,				CANCELTOVC_FLAG,	CANCELVC_NO,
		DISPLAYONLY_STATUS,		ITEMPAY_AMT,			ACCOUNT_ID ,		OPERATE_FLAG,
		vat_amt
	)  
	VALUES
	(	:ls_fnrecvno,			:as_coopid,				1,					:ls_SLIPITEMTYPE_CODE,
		:ls_paydesc,			1,						null,				null,
		:li_posttovc_flag,		null,					0,					null,
		1,						:ldc_itemamt,			:ls_tofromaccid , 	1,
		0
	) using itr_sqlca  ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
next 

return Success
end function

public function integer of_init_payrecv_slipdlg (string as_coopid, string as_slipno, string as_entryid, string as_machine, datetime adtm_wdate, ref string as_xmlfinslip, ref string as_xmlfinslipdet) throws Exception;//string		ls_tofromacc
datetime	ldtm_entry, ldtm_time
long        ll_count, ll_rows
string      ls_fnslipno, ls_refsystem, ls_remark
decimal 	ldc_itemnet
n_ds		lds_finslip, lds_finslipdet,lds_data  

ls_fnslipno		=	as_slipno
 
lds_finslip		= create		n_ds
lds_finslip.dataobject	= "d_fin_slipspc"   
lds_finslip.settransobject( itr_sqlca )
ll_count = lds_finslip.retrieve( as_coopid, ls_fnslipno )

if ll_count <= 0 then  
	ithw_exception.text	= "ไม่พบรายการรอ ยืนยันรายการ  ( " + ls_fnslipno + " )  finslip " 
	destroy(lds_finslip)
	destroy(lds_finslipdet)
	destroy(lds_data)
	return -2
	//throw ithw_exception 
end if

ls_refsystem	=  trim( lds_finslip.object.from_system[ 1 ] ) 

choose case ls_refsystem
	case "DEP" // รายการฝากถอน ไม่มี  finslipdet 
		
	lds_finslipdet		= create		n_ds
	lds_finslipdet.dataobject	= "d_fin_slipspc_det_itemtype"  
	lds_finslipdet.settransobject( itr_sqlca )
	
	ll_count = lds_finslipdet.retrieve( as_coopid, ls_fnslipno )
	
	if ll_count <= 0 then  
		
		lds_finslipdet.insertrow( 0 )
		ls_remark = lds_finslip.getitemstring( 1, "remark" )
		ldc_itemnet = lds_finslip.getitemdecimal( 1, "item_amtnet" )
		lds_finslipdet.setitem( 1, "slipitemtype_code", "42003000" )
		lds_finslipdet.setitem( 1, "account_id", "42003000" )
		lds_finslipdet.setitem( 1, "slip_no", ls_fnslipno )
		lds_finslipdet.setitem( 1, "coop_id", as_coopid ) 
		lds_finslipdet.setitem( 1, "slipitem_desc", "รายได้ค่าธรรมเนียมจากการถอนเงิน - " + ls_remark ) 
		lds_finslipdet.setitem( 1, "itempay_amt", ldc_itemnet ) 
		lds_finslipdet.setitem( 1 ,"posttovc_flag", 0 ) 
		
	end if
	as_xmlfinslipdet		=	lds_finslipdet.describe( "Datawindow.data.XML" )
	
	case else
		
	lds_finslipdet		= create		n_ds
	lds_finslipdet.dataobject	= "d_fin_slipspc_det_itemtype"  
	lds_finslipdet.settransobject( itr_sqlca )
	
	ll_count = lds_finslipdet.retrieve( as_coopid, ls_fnslipno )
	
	if ll_count <= 0 then  
		
		lds_finslipdet.insertrow( 0 )
		
		ls_remark = lds_finslip.getitemstring( 1, "remark" )
		ldc_itemnet = lds_finslip.getitemdecimal( 1, "item_amtnet" )
		
		lds_finslipdet.setitem( 1, "slipitemtype_code", "42003000" )
		lds_finslipdet.setitem( 1, "account_id", "42003000" )
		lds_finslipdet.setitem( 1, "slip_no", ls_fnslipno )
		lds_finslipdet.setitem( 1, "coop_id", as_coopid ) 
		lds_finslipdet.setitem( 1, "slipitem_desc", "รายได้ค่าธรรมเนียมจากการถอนเงิน - " + ls_remark ) 
		lds_finslipdet.setitem( 1, "itempay_amt", ldc_itemnet ) 
		lds_finslipdet.setitem( 1 ,"posttovc_flag", 0 ) 
		
	end if
	
	as_xmlfinslipdet		=	lds_finslipdet.describe( "Datawindow.data.XML" )


end choose
	
// set ค่าให้ใหม่ เมื่อจัดเตรียมขึ้นมา  
lds_finslip.setitem(1,"operate_date",adtm_wdate)
lds_finslip.object.entry_date[1] 			= adtm_wdate   
lds_finslip.object.recvpay_time[1]			= ldtm_time
lds_finslip.object.coop_id[1]					= as_coopid
lds_finslip.object.machine_id[1]			= as_machine
lds_finslip.object.entry_id[1]				= as_entryid

as_xmlfinslip		=	lds_finslip.describe( "Datawindow.data.XML" )

return 1
end function

public function string of_payslip_pea (string as_main_xml, string as_item_xml, string as_taxdetail_xml, string as_appname) throws Exception;string	ls_cashtype, ls_machineid, ls_chqno, ls_bankcode, ls_bankbranch, ls_paywhom  , ls_dwobjectname
string	ls_coopid, ls_entryid, ls_chqbookno, ls_member , ls_slipno , ls_receipt , ls_payno , ls_membgroup
string	ls_fromacc, ls_frombank, ls_frombranch, ls_errtext, ls_refer, ls_tofromaccid, ls_chqno_next, ls_getslipno
string	ls_receiveid, ls_referfinslipno, ls_chequetype, ls_paydesc  , ls_docno = "FNRECEIVENO" , ls_err , ls_refsystem
string	ls_itempaytype ,ls_sliptype,ls_slippayinno,ls_refslipno

datetime	ldtm_onchq, ldtm_entrydate, ldtm_today ,ldtm_recvtime
dec{2}	ldc_itemamt,ldc_itemamtnet
dec{2}	ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx
dec{2}	ldc_scobal, ldc_accuint , ldc_taxamt

integer	li_seqno, li_chequestatus, li_finstatus, li_memflag, li_chk, li_payrecv,li_chkexist,li_moneyposttofinstatus
integer	li_detailcount , li_row , li_index , li_taxflag , li_rc , li_countTax , li_paymentstatus,li_sliptypeposttofintype

n_ds		lds_main , lds_item
str_slipinfo	lstr_slipinfo
	
// ชื่อ Datawindow ที่ใช้
ls_dwobjectname 	= inv_print_srv.of_getdataobject( as_main_xml )	
lds_main		=	create n_ds
lds_main.dataobject = ls_dwobjectname
lds_main.settrans( itr_sqlca )

// ชื่อ Datawindow ที่ใช้
ls_dwobjectname 	= inv_print_srv.of_getdataobject( as_item_xml )	
lds_item		=	create n_ds
lds_item.dataobject = ls_dwobjectname
lds_item.settrans( itr_sqlca )

if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_main , as_main_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลรับ-จ่าย ไม่สามารถตรวจสอบข้อมูลได้"
	destroy( lds_main )
	destroy( lds_item )		
	throw ithw_exception
end if

if not isnull( as_item_xml ) and trim( as_item_xml ) <> "" then
	this.of_importstring_xml( lds_item , as_item_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลรายละเอียดรับ-จ่าย ไม่สามารถตรวจสอบข้อมูลได้"
	destroy( lds_main )
	destroy( lds_item )
	throw ithw_exception
end if
	
li_payrecv			= lds_main.Getitemnumber( 1, "pay_recv_status" ) 
ls_cashtype			= lds_main.GetitemString( 1, "cash_type" )
ls_machineid		= lds_main.GetitemString( 1 , "machine_id" )
ls_coopid			= lds_main.GetitemString( 1 , "coop_id" )
ls_member			= lds_main.GetitemString( 1 , "member_no" )
ls_entryid			= lds_main.GetitemString( 1 , "entry_id" )	
ldtm_entrydate		= lds_main.GetitemDateTime( 1 , "entry_date" )
ldc_itemamt			= lds_main.GetitemDecimal( 1 , "itempay_amt" )
ldc_itemamtnet		= lds_main.GetitemDecimal( 1 , "item_amtnet" )
ls_refsystem		= trim(lds_main.GetitemString( 1 , "from_system" ) )
ls_itempaytype		= trim(lds_main.GetitemString( 1 , "itempaytype_code" ) )
ls_paydesc			= trim(lds_main.GetitemString( 1 , "payment_desc" ) )  
ls_referfinslipno	= trim(lds_main.GetitemString( 1 , "slip_no" ) )     
ls_refslipno		= trim(lds_main.GetitemString( 1 , "ref_slipno" ) )
li_memflag			= lds_main.object.member_flag[1]
ls_paywhom			= trim(lds_main.object.nonmember_detail[1])
ls_cashtype			= upper( ls_cashtype )
ldtm_recvtime		= datetime( date(ldtm_entrydate) , now() )
li_taxflag			= lds_main.object.tax_flag[1]
ldc_taxamt			= lds_main.object.tax_amt[1]
ls_chequetype		= lds_main.object.cheque_type[1]
ls_receiveid			= ls_entryid
li_paymentstatus	= lds_main.object.payment_status[1]
	
if isnull( ls_chequetype ) then ls_chequetype = '00'
if isnull( ls_paydesc ) then ls_paydesc = ""

//if ls_paydesc = "" then
//	ithw_exception.text	= "รายการเป็นว่าง"
//	destroy( lds_main )
//	destroy( lds_item )		
//	throw ithw_exception
//end if 	

// ตรวจสอบข้อมูลการเปิดงานประจำวัน
li_rc	= this.of_is_open_day( ls_coopid , ldtm_entrydate )
if ( li_rc < 1 ) then
	ithw_exception.text	= "ยังไม่ได้ทำการเปิดงานประจำวัน ไม่สามารถทำการเปิดได้"
	destroy( lds_main )
	destroy( lds_item )		
	throw ithw_exception
end if

// ตรวจสอบข้อมูลการปิดงานประจำวัน
li_rc	= this.of_is_close_day( ls_coopid , as_appname ,  ldtm_entrydate )
if ( li_rc = 1 ) then
	ithw_exception.text	= "ได้ทำการปิดสิ้นแล้ว ไม่สามารถทำรายการได้"
	destroy( lds_main )
	destroy( lds_item )		
	throw ithw_exception
end if

// ตรวจสอบข้อมูลการเปิดลิ้นชัก
this.of_is_open_teller( ls_coopid,ls_entryid , ldtm_entrydate)

// ตรวจสอบการกรอกข้อมูล
// wa this.of_chkslip_completefill( lds_main , lds_item )
//เปลี่ยนไปให้ UI ทำแทน

// ตรวจสอบการป้อนข้อมูล

// ตรวจข้อมูลเกี่ยวกับเงินในลิ้นชัก
li_chk	=	this.of_processfinchk( ls_coopid , ls_entryid, ldtm_entrydate , ls_err )
if li_chk <> success then 
	ithw_exception.text	= ls_err
	destroy( lds_main )
	destroy( lds_item )		
	throw ithw_exception
end if

//ตรวจสอบ กรณีเป็นรายการที่รอ ยืนยันไม่ต้องสร้างเลขที่และรายการใหม่  
li_chkexist	= 0 
if li_paymentstatus = 8 then li_chkexist = 8
	
choose case	 li_chkexist
	case 0	//รายการที่เกิดจากระบบการเงิน
	// สร้างเลขที่ทำรายการ
	ls_slipno = this.of_get_lastslip_docno( ls_docno )
	lds_main.object.slip_no[1]  =  ls_slipno
			
	// สร้างเลขที่ใบเสร็จ / ใบสำคัญจ่าย
	if li_payrecv = 1 then
		ls_receipt 	= this.of_get_lastslip_docno( is_receiptcode )//"FNRECEIPTNO"
		lds_main.object.receipt_no[1]	= ls_receipt
	else
		ls_payno		=	this.of_get_lastslip_docno( is_payslipcode )//"FNPAYSLIPNO"
		lds_main.object.payslip_no[1]	= ls_payno
	end if
	
	if isnull( ls_member ) then ls_member = ' '
	if isnull( li_memflag ) then li_memflag = 0
	
	if ( li_memflag = 1) and ( ii_slipmode = 0 )  then
		this.of_getshrlon( ls_coopid  ,ls_member,ldc_accuint , ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx )
	else
		ldc_share		= 0
		ldc_emer			= 0
		ldc_norm			= 0
		ldc_extra			= 0	
		ldc_sharespx	= 0
		ldc_accuint		= 0
	end if
	
	if  li_payrecv = 0 and ls_cashtype = "CHQ" then
		// กรณีจ่ายเป็นเช็ค
	//	this.of_postchq( lds_main ) 
		lds_main.object.dateon_chq[1]			= ldtm_entrydate
	else
		lds_main.object.receive_date[1]		= ldtm_entrydate
		lds_main.object.receive_status[1]		= 1
		lds_main.object.payment_status[1]	= 1
	end if
			
	if ( li_memflag = 1) and ( ii_slipmode = 0 )  then
		lds_main.object.norm_amt[1]		= ldc_norm
		lds_main.object.emer_amt[1]		= ldc_emer
		lds_main.object.extra_amt[1]		= ldc_extra
		lds_main.object.share_amt[1]		= ldc_share
		lds_main.object.sharespx_amt[1]	= ldc_sharespx
		lds_main.object.accuint_amt[1]	= ldc_accuint
	end if
	
	lds_main.object.recvpay_id[1]			= ls_receiveid
	lds_main.object.recvpay_time[1]		= ldtm_recvtime
	lds_main.object.pay_towhom[1]		= ls_paywhom
	
	// กำหนด seq_no 
	li_row = lds_item.rowcount()
	for li_index = 1 to li_row	
			lds_item.object.slip_no[li_index]			= ls_slipno
			lds_item.object.coop_id[li_index]			= ls_coopid
			lds_item.object.seq_no[li_index]			= li_index			
	next
	
	lds_main.Accepttext()
	lds_item.Accepttext()
	
	// กำหนดสถานะ datawindow Update ได้
	lds_main.setitemstatus( 1 , 0 , Primary! , NewModified!)
	lds_item.setitemstatus( 1 , 0 , Primary! , NewModified!)
	
	// prepare update data of lds_main
	if lds_main.update() <> 1 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง lds_main " + lds_main.of_geterrormessage()
		rollback using	itr_sqlca ;
		destroy( lds_main )
		destroy( lds_item )		
		throw ithw_exception
	end if
	
	// รายละเอียดการรับ-จ่าย
	if lds_item.update() <> 1 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง lds_item " + lds_item.of_geterrormessage()
		rollback using	itr_sqlca ;
		destroy( lds_main )
		destroy( lds_item )		
		throw ithw_exception
	end if				
		
case  8   //pom เพิ่ม รายการที่มาจากระบบอื่น ๆๆ เพื่อ รอยืนยัน
	ls_slipno = trim (ls_referfinslipno)		
	// สร้างเลขที่ใบเสร็จ / ใบสำคัญจ่าย
	if li_payrecv = 1 then
		ls_receipt 	= this.of_get_lastslip_docno( is_receiptcode )//"FNRECEIPTNO"
	else
		ls_receipt	=	this.of_get_lastslip_docno( is_payslipcode )//"FNPAYSLIPNO"
	end if
	//bee
	update	finslip
	set			payment_status  	= 1 ,
				entry_id			= :ls_entryid ,
				receive_status		= 1 ,
				recvpay_id			= :ls_entryid ,
				recvpay_time		= :ldtm_recvtime,
				receipt_no			= :ls_receipt,
				cash_type			= :ls_cashtype
	where	trim (slip_no)		=  :ls_slipno
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <>  0  then 
		ithw_exception.text	= "  ไม่สามารถ Update สถานะ Finslip  ได้ "  
		rollback using	itr_sqlca ;
		destroy( lds_main )
		destroy( lds_item )		
		throw ithw_exception
	end if 					

end choose 		
//wa สุรินทร์ ชำระพิเศษ ผ่านรายการที่การเงิน
//ตรวจสอบการผ่านรายการที่ระบบหุ้นหนี้
if ls_refsystem = "SHL" or ls_refsystem = "SHR" then
/*
	select posttofin_type
	into :li_sliptypeposttofintype
	from slucfsliptype 
	where sliptype_code = :ls_sliptype  using itr_sqlca ;
	
	//li_posttofintype = 1 ส่งรายการไปงานเงิน   0 ไม่ส่งรายการไปการเงิน
	select posttofin_status
	into :li_moneyposttofinstatus
	from cmucfmoneytype
	where moneytype_code = :ls_cashtype   using itr_sqlca ;

	if li_sliptypeposttofintype = 8 or li_moneyposttofinstatus = 8 then
	// เรียก LnOperate
		this.of_setsrvlnoperate( true )
		
		try
			inv_lnoperatesrv.of_postslip(ls_itempaytype, ls_coopid, ls_refslipno,ls_coopid )
			
			this.of_setsrvlnoperate( false )
		catch( Exception lthw_error )
			rollback using itr_sqlca ;
			throw lthw_error
		end try
	end if
	*/
end if


//ผ่านไปเงินสด
if (ls_cashtype = "CSH" )  and ls_slipno  <> '' then
	lstr_slipinfo.slip_no  				= ls_slipno
	lstr_slipinfo.coop_id 				= ls_coopid
	lstr_slipinfo.member_no 			= ls_member
	lstr_slipinfo.description			= ls_paydesc
	lstr_slipinfo.entry_date 			= ldtm_entrydate
	lstr_slipinfo.from_system 		= ls_refsystem
	lstr_slipinfo.item_amt 			= ldc_itemamtnet
	lstr_slipinfo.item_status 			= 1
	lstr_slipinfo.sign_flag 				= li_payrecv
	lstr_slipinfo.recpaytype_code 	= ls_itempaytype

	try
		this.of_postcash( lstr_slipinfo , 1 ,ls_entryid )
	catch ( Exception thb )
		rollback using itr_sqlca ;
		destroy( lds_main )
		destroy( lds_item )
		throw thb
	end try		
end if
	
// บันทึกข้อมูลหักภาษี 
if (li_taxflag  = 1 and ldc_taxamt > 0 ) and ls_slipno <> '' then
	try	
		this.of_posttaxatpay( lds_main , lds_item , as_taxdetail_xml)	
	catch (Exception thw)
		rollback using itr_sqlca ;
		destroy( lds_main )
		destroy( lds_item )
		throw thw
	end try	
end if 	

commit using itr_sqlca ;

destroy( lds_main )
destroy( lds_item )

return trim(ls_slipno)
end function

public function integer of_postetcto_fin (n_ds ads_data, string as_coopid, string as_entry, datetime adtm_wdate, string as_machine, string as_cancelslipno) throws Exception;/***********************************************
<description>
	ดึงข้อมูลจากระบบหนี้ ที่เป็นรายการจ่ายเงินกู้
</description>

<arguments>	
	as_memberno			รหัสสมาชิก
	as_coopid				รหัสสาขาสหกรณ์
	as_entry					รหัสผู้ทำรายการ
	adtm_wdate				วันที่ทำรายการ
	as_machine				ชื่อเครื่องที่ทำรายการ
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postetcto_fin()
	
	Integer li_return
	String ls_memberno , ls_branch , ls_entry , ls_machine
	datetime	ldtm_wdate
	li_return = lnv_finservice.of_postlonlwdto_fin( ls_memberno , ls_branch , ls_entry , ldtm_wdate, ls_machine )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/10/2010 by Phaiwaan
	Version 1.1 เพิ่มกรณีมีการหักกลบ Modified Date 20/10/2010 by Phaiwaan
	Version 1.2 แก้ให้สร้างเลขที่ใบเสร็จ/ใบสำคัญจ่าย Modified Date 27/10/2010 by Phaiwaan
	Version 1.3 แก้ดึงข้อมูลรายการยกเิลิกจากต้นทาง Modified Date 6/11/2010 by Phaiwaan	
</usage>
************************************************/
integer		li_row, li_payrec_status, li_paymentstatus, li_chk, li_itemstatus, li_recev , li_found , li_seq_no , li_index_i , li_brigde
integer		li_status, li_recvstatus, li_itemstatus1, li_update, li_shlnuserecv , li_index ,li_shrlonsend_fin , li_printstatus , li_shrlonpaysendfin
string			ls_cashtype, ls_slipno, ls_docno, ls_year, ls_desc,  ls_receiptno, ls_mbcoop_id
dec{2}		ldc_recvnet, ldc_sharespx, ldc_accuint, ldc_itempay_amt, ldc_itempay_amtnet, ldc_buyshare
dec{2}		ldc_share, ldc_emer, ldc_norm, ldc_extra 
dec{2}		ldc_bankfee_amt, ldc_banksrv_amt, ldc_payout_amt, ldc_buyshare_amt
string			ls_tofrom_accid, ls_loancontract_no, ls_member_no, ls_expense_accid, ls_expense_branch
string			ls_expense_bank, ls_entry_id,  ls_fromsystem , ls_accid_slipdet , ls_shrlontype_code
string			ls_machineid, ls_loantype, ls_memname, ls_loantypedesc, ls_towhom, ls_remark ,ls_itemtypecode
datetime		ldtm_entry_date, ldtm_operdate
string			ls_cancelid, ls_printslip[], ls_payslip_no , ls_slipclr , ls_refsyst
datetime		ldtm_canceldate

str_slipinfo	lstr_slipinfo

li_row		= ads_data.rowcount(  )

select confirmcshlnrcv_flag, shrlon_usefinreceipt, 	shrlonpaysendfin
into 	:li_recev, 				:li_shlnuserecv, 		:li_shrlonpaysendfin
from 	finconstant 
where coop_id = :as_coopid 
using itr_sqlca;

// รับจ่ยเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่
//li_recev	=  integer( this.of_getattribconstant( "confirmcshlnrcv_flag" , "INTEGER" ))
if isnull( li_recev ) then li_recev = 0

// การใช้เลขที่ใบเสร็จของหุ้นหนี้
//li_shlnuserecv	=  integer( this.of_getattribconstant( "shrlon_usefinreceipt" , "INTEGER" ))
//if isnull( li_shlnuserecv ) then li_shlnuserecv = 0

// สถานะผ่าน รายการที่การเงิน 
// 1 ผ่านรายการทันที 
// 2 รอยืนยันรายการ
// 3 ประมวลผ่านการเงิน
//li_shrlonpaysendfin	= integer( this.of_getattribconstant( "shrlonpaysendfin" , "INTEGER" ))
//if isnull( li_shrlonpaysendfin ) then li_shrlonpaysendfin = 2

if li_shrlonpaysendfin = 2 then
	li_paymentstatus	= 8
	li_recvstatus		= 0
	li_printstatus	= 0 
else
	li_paymentstatus	= 1
	li_recvstatus		= 1
	li_printstatus	= 1
end if

ldc_itempay_amt		= 0
ldc_itempay_amtnet 	= 0
li_seq_no = 0
as_cancelslipno		= ""

for li_index = 1 to li_row

		ls_receiptno				= ""
		li_payrec_status		= 0 // pay
		ls_machineid			= as_machine
		ldc_recvnet				= ads_data.object.payoutnet_amt[li_index]
		ls_mbcoop_id			= ads_data.object.coop_id[li_index]
		ls_cashtype				= trim( ads_data.object.moneytype_code[li_index] )
		ls_fromsystem			= 'LON'
		li_itemstatus			= ads_data.object.slip_status[li_index]
		ls_payslip_no			= ads_data.object.payoutslip_no[li_index]
		ls_entry_id				= ads_data.object.entry_id[li_index]
		ldtm_entry_date		=	ads_data.object.slip_date[li_index]
		
		if li_itemstatus = -9 or li_itemstatus = -99 then
			
			li_found	=	ids_cancelslip.retrieve( as_coopid  , ls_payslip_no , ls_fromsystem )
			if li_found = 0 then  continue 
			
//
//			
//				for	li_index_i = 1	to li_found
//					if as_cancelslipno <> "" then as_cancelslipno += ","
//					as_cancelslipno		+= ids_cancelslip.object.slip_no[ li_index_i ]
//				next
//			
						// ถ้ารับจ่ายต้อง post เงินสดเลย
			if ( li_shrlonpaysendfin <> 2 ) then
				
				ls_cancelid			= ads_data.object.cancel_id[li_index]
				ldtm_canceldate	= ads_data.object.cancel_date[li_index]
				
				update	FINSLIP
				set			PAYMENT_STATUS	= -9,
							cancel_id		= :ls_cancelid,
							cancel_date		= :ldtm_canceldate,
							receive_status	= 1,
							receive_date	= :ldtm_canceldate			
				where	coop_id	= :as_coopid and
							REF_SLIPNO			= :ls_payslip_no and
							PAYMENT_STATUS in ( 1, 8)
				using itr_sqlca ;
				
				if itr_sqlca.sqlcode <> 0 then
					ithw_exception.text	= "ระบบหนี้ : ไม่สามารถยกเลิกที่ระบบการเงินได้"+ itr_sqlca.sqlerrtext 
					rollback using itr_sqlca ; 
					throw ithw_exception

				end if
				
				if   ( ls_cashtype = 'CSH' ) then
						
						select		SLIP_NO, 	pay_recv_status, 	member_no, 		item_amtnet, 		payment_desc, 
									itempaytype_code
						into		:ls_slipno , 	:li_recvstatus, 		:ls_member_no, 	:ldc_payout_amt, 	:ls_desc , 
									:ls_itemtypecode
						from		FINSLIP
						where	REF_SLIPNO		= :ls_payslip_no and
									coop_id			= :as_coopid and
									from_system	= :ls_fromsystem 
						using itr_sqlca ;
						
						if itr_sqlca.sqlcode <> 0 then
							ithw_exception.text	= "ระบบหุ้นหนี้ : ไม่สามารถค้นหาข้อมูลการยกเลิกได้"+ itr_sqlca.sqlerrtext 
							rollback using itr_sqlca ; 
							throw ithw_exception
						end if
						
						// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
						lstr_slipinfo.slip_no 			= ls_slipno
						lstr_slipinfo.coop_id 			= as_coopid
						lstr_slipinfo.member_no 		= ls_member_no
						lstr_slipinfo.description 		= ls_desc
						lstr_slipinfo.entry_date 		= ldtm_entry_date
						lstr_slipinfo.from_system 	= ls_fromsystem
						lstr_slipinfo.item_amt 		= ldc_payout_amt
						lstr_slipinfo.item_status 		= -9
						lstr_slipinfo.sign_flag 			= li_recvstatus
						lstr_slipinfo.recpaytype_code = ls_itemtypecode
						
						try
							this.of_postcash( lstr_slipinfo  , 1 ,ls_cancelid )
						catch ( Exception th )
							rollback using itr_sqlca ;
							throw ithw_exception
						end try
				
					end if

				end if		
			
			commit using itr_sqlca ;
			continue
		end if
		
		if ls_cashtype = 'CHQ' then
			li_paymentstatus	= 8
			
//			ตรวจสอบว่าได้มีการพิมพ์เช็คแล้วรึไม่
			select count(*) 
			into	:li_brigde
			from finbridgechq
			where coop_id = :as_coopid and
					slip_no 	= :ls_payslip_no 	and
					bridge_status	<> -9
			using itr_sqlca ;
			
			if (itr_sqlca.sqlcode <> 0 ) then
				li_brigde = 0
			end if
			
			
			if li_brigde > 0 and li_shrlonpaysendfin <> 2 then
				li_paymentstatus = 1
			end if

		end if	
			
		
		ls_shrlontype_code	= ads_data.object.shrlontype_code[li_index]
		ldc_bankfee_amt		= ads_data.object.bankfee_amt[li_index]
		ldc_banksrv_amt		= ads_data.object.banksrv_amt[li_index]
		ls_tofrom_accid		= ads_data.object.tofrom_accid[li_index]
		
		if isnull( ls_tofrom_accid ) then ls_tofrom_accid = ""
		if( ls_tofrom_accid = "" ) then
			ls_tofrom_accid		= this.of_defaultaccid( ls_cashtype ) 
		end if		
		
		ls_loancontract_no		= trim( ads_data.object.loancontract_no[li_index] )
		
		ls_member_no			= ads_data.object.member_no[li_index]
		ls_memname			= this.of_getmembername( ls_member_no )
		ls_expense_accid		= ads_data.object.expense_accid[li_index]
		ls_expense_branch	= ads_data.object.expense_branch[li_index]
		ls_expense_bank		= ads_data.object.expense_bank[li_index]
		//ldc_payout_amt		= ads_data.object.payout_amt[li_index]
		ldc_payout_amt		= ads_data.object.payoutnet_amt[li_index]
		ldc_buyshare_amt		= 0.00 //ads_data.object.buyshare_amt[li_index]
		ldtm_entry_date		= adtm_wdate
		
		ldtm_operdate			= datetime (date( ads_data.object.slip_date[li_index] ) )
		ls_towhom				= trim( ls_memname )
		ls_slipclr					= trim( ads_data.object.slipclear_no[li_index] )
		
		if isnull( ls_slipclr ) then ls_slipclr = ""
		
		// ตรวจสอบมีการทำรายการแล้วรึยัง
		select count( * )
		into 	:li_found
		from finslip
		where ref_slipno = :ls_payslip_no
		and entry_date = :ldtm_entry_date
		and	coop_id	= :as_coopid
		and	PAYMENT_STATUS <> -9
		and from_system  = 'LON'
		using itr_sqlca ;
		
		if isnull( li_found ) then li_found = 0
		
		if li_found > 0 then  continue 
		
		if isnull( ldc_buyshare_amt ) then ldc_buyshare_amt = 0
		
		ls_receiptno	= ""
		
		ls_desc			= 'จ่ายคืนกองทุนกสส. ' + ls_loancontract_no + " สมาชิก " + ls_member_no
		ls_remark		= "จ่ายคืนกองทุนกสส " + ls_loancontract_no + " สมาชิก " + ls_member_no
		ls_remark		= "~r~n" + ls_remark + "อ. " + string( ldc_payout_amt , '#,##0.00' )
		if isnull( li_itemstatus ) then li_itemstatus = 1

		
		// สร้างเลขที่เอกสาร
		ls_slipno			= this.of_get_lastslip_docno( "FNRECEIVENO" )
		
		ldc_recvnet		= ldc_payout_amt

		if isnull( ls_slipclr )  then ls_slipclr = ""
		if  ls_slipclr <>  "" then
			
			ids_payclr = create n_ds
			ids_payclr.dataobject = "d_loansrv_lnpayin_slipdet"
			ids_payclr.settransobject( itr_sqlca)
			
			li_chk = ids_payclr.retrieve( as_coopid, ls_slipclr )
			
			if li_chk >= 1 then 
				
				if li_shlnuserecv = 1 then
					ls_receiptno			=  this.of_get_lastslip_docno( "FNRECEIPTNO" )
				else
					ls_receiptno	= ads_data.object.slipclear_no[ li_index ]
				end if
				
				ldc_itempay_amt	= dec( ids_payclr.describe( "Evaluate(' sum( item_payamt for all ) ' , 0 ) " ) ) 
				
				ldc_recvnet		= ldc_payout_amt  - ldc_itempay_amt 
			end if

		end if
			

		this.of_getshrlon( as_coopid   ,ls_member_no  ,ldc_accuint ,  ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx )

		INSERT INTO FINSLIP  
		(		SLIP_NO,					ENTRY_ID,					ENTRY_DATE,					OPERATE_DATE,   
				FROM_SYSTEM,		PAYMENT_STATUS,		CASH_TYPE,					PAYMENT_DESC,   
				BANK_CODE,			BANK_BRANCH,				ITEMPAY_AMT,					PAY_TOWHOM,   
				DATEON_CHQ,			MEMBER_NO,				ITEMPAYTYPE_CODE,			PAY_RECV_STATUS,   
				MEMBER_FLAG,			NONMEMBER_DETAIL,	coop_id,							MACHINE_ID,   
				CANCEL_ID,				CANCEL_DATE,				BANKFEE_AMT,					BANKSRV_AMT,
				TOFROM_ACCID,		ACCOUNT_NO,				CHEQUEBOOK_NO,				CHQ_ADVFLAG,
				REF_SLIPNO,			REF_SYSTEM,				FROM_ACCNO,					RECEIPT_NO,
				REMARK,					FROM_BANKCODE,			FROM_BRANCHCODE,			loanappv_amt,
				SHARE_AMT,			emer_amt,					norm_amt,						extra_amt,
				sharespx_amt,			tax_amt,						tax_flag,							tax_rate,
				item_amtnet,			receive_date,				receive_status,					accuint_amt,
				retail_flag,				payslip_no,					recvpay_id	,					vat_amt ,
				print_status
		)  
		VALUES
		( 		:ls_slipno,   				:ls_entry_id,					:ldtm_entry_date,				:ldtm_operdate,
				:ls_fromsystem,		:li_paymentstatus,			:ls_cashtype,					:ls_desc,
				:ls_expense_bank,		:ls_expense_branch,		:ldc_recvnet,					:ls_towhom,
				null,   					:ls_member_no,			'WRT',							:li_payrec_status,
				1,							:ls_memname,				:as_coopid,						:ls_machineid,   
				null,						null,							:ldc_bankfee_amt,				:ldc_banksrv_amt,
				:ls_tofrom_accid,		null,							null,								null,
				:ls_payslip_no,			:ls_fromsystem,			null,								:ls_receiptno,   
				:ls_remark,				:ls_expense_bank,			null,								:ldc_payout_amt,
				:ldc_share,				:ldc_emer,					:ldc_norm,						:ldc_extra,
				:ldc_sharespx,			0,								0,									0,
				:ldc_recvnet,			:ldtm_entry_date,			:li_recvstatus,					:ldc_accuint,
				0,							:ls_payslip_no,				:ls_entry_id	,					0 ,
				:li_printstatus
		)  using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหนี้ : ไม่สามารถบันทึกข้อมูลลง Finslip ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		li_seq_no++
		
		// หาคู่บัญชี ของหนี้ ----------------------
		select 	account_id 
		into 		:ls_accid_slipdet
		from 		vcmapaccid
		where  	system_code = 'LON'
		and 		slipitemtype_code = 'LON'
		and		coop_id					= :is_coopcontrl	
		and 		shrlontype_code = :ls_shrlontype_code
		and 		shrlontype_status = 1
		using itr_sqlca ;
		
		if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ""
		//----------------------------------------------------
		
		INSERT INTO FINSLIPDET  
		( 	SLIP_NO,              		coop_id,              					SEQ_NO,              		SLIPITEMTYPE_CODE,              	SLIPITEM_DESC,   
			SLIPITEM_STATUS,		CANCEL_ID,							CANCEL_DATE,				POSTTOVC_FLAG,						VOUCHER_NO,   
			CANCELTOVC_FLAG,		CANCELVC_NO,						DISPLAYONLY_STATUS,	ITEMPAY_AMT,							ACCOUNT_ID,   
			ITEMPAYAMT_NET,		TAX_FLAG,							VAT_FLAG,					TAX_CODE,								TAXWAY_KEEP,   
			TAX_AMT,					SECTION_ID,						MEMBGROUP_CODE,		OPERATE_FLAG,						vat_amt
		)  
		VALUES
		(	:ls_slipno ,					:as_coopid , 						:li_seq_no , 					'000' , 									:ls_desc ,
			1 , 							null ,									null ,							0 ,											null , 		
			0	,							null ,									0 ,								:ldc_payout_amt , 						:ls_accid_slipdet ,
			:ldc_payout_amt , 			0 , 									0	,							0 ,											0 ,
			0 ,								0	,									null ,							1 ,											0
		) using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบหนี้ : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		// หากมีการหักกลบสัญญาเดิม
		//li_chk = ids_payclr.rowcount( )
		//if li_chk > 0 then 
			//this.of_postpayoutto_finclr( ls_slipno , as_coopid , ids_payclr , li_seq_no)
		//end if

		// รับเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่
		// ถ้ารับจ่ายต้อง post เงินสดเลย
		// ถ้าไม่ใช่ รอยืนยัน
		if ( li_shrlonpaysendfin <> 2 ) and ( ls_cashtype = 'CSH' ) then
			
			// กำหนดค่าก่อนทำรายการ ผ่านเงินสด
			lstr_slipinfo.slip_no 			= ls_payslip_no
			lstr_slipinfo.coop_id 			= as_coopid
			lstr_slipinfo.member_no 		= ls_member_no
			lstr_slipinfo.description 		= ls_desc
			lstr_slipinfo.entry_date 		= ldtm_entry_date
			lstr_slipinfo.from_system 	= ls_fromsystem
			lstr_slipinfo.item_amt 		= ldc_recvnet
			lstr_slipinfo.item_status 		= 1
			lstr_slipinfo.sign_flag 			= li_payrec_status
			lstr_slipinfo.recpaytype_code = ls_itemtypecode
	
			try
				this.of_postcash( lstr_slipinfo  , 1 ,ls_entry_id )
			catch ( Exception thw )
				rollback using itr_sqlca ;
				throw ithw_exception
			end try
		
		end if
			// Update สถานะการผ่านรายการมาการเงิน
	update slslippayout
	set		post_tofin = 1
	where payoutslip_no = :ls_payslip_no	and
		coop_id		= :as_coopid
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ระบบเงินกู้ : ไม่สามารถ Update สถานะผ่านรายการมาการเงิน ได้ "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if

next

commit using itr_sqlca ;
return Success
end function

public function string of_payslip_pia (string as_main_xml, string as_item_xml, string as_taxdetail_xml, string as_appname) throws Exception;string	ls_cashtype, ls_machineid, ls_chqno, ls_bankcode, ls_bankbranch, ls_paywhom  , ls_dwobjectname
string	ls_coopid, ls_entryid, ls_chqbookno, ls_member , ls_slipno , ls_receipt , ls_payno , ls_membgroup
string	ls_fromacc, ls_frombank, ls_frombranch, ls_errtext, ls_refer, ls_tofromaccid, ls_chqno_next, ls_getslipno
string	ls_receiveid, ls_referfinslipno, ls_chequetype, ls_remark , ls_err ,ls_receiptcode ,ls_payslipcode,ls_slipdocno  

datetime	ldtm_onchq, ldtm_entrydate, ldtm_today ,ldtm_recvtime
dec{2}	ldc_itemamt,ldc_itemamtnet
dec{2}	ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx
dec{2}	ldc_scobal, ldc_accuint , ldc_taxamt

integer	li_seqno, li_chequestatus, li_finstatus, li_memflag, li_chk, li_payrecv,li_chkexist
integer	li_detailcount , li_row , li_index , li_taxflag , li_rc , li_countTax , li_paymentstatus
ls_receiptcode ='FNRECEIPTNO'
ls_payslipcode='FNPAYSLIPNO' 
ls_slipdocno  = "FNRECEIVENO" 

n_ds		lds_main , lds_item
str_slipinfo	lstr_slipinfo
	
// ชื่อ Datawindow ที่ใช้
ls_dwobjectname 	= inv_print_srv.of_getdataobject( as_main_xml )	
lds_main		=	create n_ds
lds_main.dataobject = ls_dwobjectname
lds_main.settrans( itr_sqlca )

// ชื่อ Datawindow ที่ใช้
ls_dwobjectname 	= inv_print_srv.of_getdataobject( as_item_xml )	
lds_item		=	create n_ds
lds_item.dataobject = ls_dwobjectname
lds_item.settrans( itr_sqlca )

if not isnull( as_main_xml ) and trim( as_main_xml ) <> "" then
	this.of_importstring_xml( lds_main , as_main_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลรับ-จ่าย ไม่สามารถตรวจสอบข้อมูลได้"
	destroy( lds_main )
	destroy( lds_item )		
	throw ithw_exception
end if

if not isnull( as_item_xml ) and trim( as_item_xml ) <> "" then
	this.of_importstring_xml( lds_item , as_item_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลรายละเอียดรับ-จ่าย ไม่สามารถตรวจสอบข้อมูลได้"
	destroy( lds_main )
	destroy( lds_item )
	throw ithw_exception
end if
	
li_payrecv			= lds_main.object.pay_recv_status[1]	
ls_cashtype			= lds_main.GetitemString( 1, "cash_type" )
ls_machineid		= lds_main.GetitemString( 1 , "machine_id" )
ls_coopid				= lds_main.GetitemString( 1 , "coop_id" )
ls_member			= lds_main.GetitemString( 1 , "member_no" )
ls_entryid			= lds_main.GetitemString( 1 , "entry_id" )	
ldtm_entrydate		= lds_main.GetitemDateTime( 1 , "entry_date" )
ldc_itemamt			= lds_main.GetitemDecimal( 1 , "itempay_amt" )
ldc_itemamtnet		= lds_main.GetitemDecimal( 1 , "item_amtnet" )
ls_referfinslipno	= lds_main.object.slip_no[1]
ls_refer				= lds_main.object.ref_slipno[1]
ls_tofromaccid		= lds_main.object.tofrom_accid[1]
li_memflag			= lds_main.object.member_flag[1]
ls_chequetype		= lds_main.object.cheque_type[1]
if isnull( ls_chequetype ) then ls_chequetype = '00'
ls_remark			= lds_main.object.payment_desc[1]
ls_paywhom			= trim(lds_main.object.nonmember_detail[1])
ls_cashtype			= upper( ls_cashtype )
ldtm_recvtime		= datetime( date(ldtm_entrydate) , now() )
li_taxflag				= lds_main.object.tax_flag[1]
ldc_taxamt			= lds_main.object.tax_amt[1]
ls_receiveid			= ls_entryid
ls_membgroup		= lds_main.object.membgroup_code[1]
li_paymentstatus	= lds_main.object.payment_status[1]
	
if isnull( ls_refer ) then ls_refer = "" 
	
//// ตรวจสอบข้อมูลการเปิดงานประจำวัน
//li_rc	= this.of_is_open_day( ls_coopid , ldtm_entrydate )
//if ( li_rc < 1 ) then
//	ithw_exception.text	= "ยังไม่ได้ทำการเปิดงานประจำวัน ไม่สามารถทำการเปิดได้"
//	destroy( lds_main )
//	destroy( lds_item )		
//	throw ithw_exception
//end if
//
//// ตรวจสอบข้อมูลการปิดงานประจำวัน
//li_rc	= this.of_is_close_day( ls_coopid , as_appname ,  ldtm_entrydate )
//if ( li_rc = 1 ) then
//	ithw_exception.text	= "ได้ทำการปิดสิ้นแล้ว ไม่สามารถทำรายการได้"
//	destroy( lds_main )
//	destroy( lds_item )		
//	throw ithw_exception
//end if

//// ตรวจสอบข้อมูลการเปิดลิ้นชัก
//this.of_is_open_teller( ls_coopid,ls_entryid , ldtm_entrydate)

// ตรวจสอบการกรอกข้อมูล
this.of_chkslip_completefill( lds_main , lds_item )

// ตรวจสอบการป้อนข้อมูล

//// ตรวจข้อมูลเกี่ยวกับเงินในลิ้นชัก
//li_chk	=	this.of_processfinchk( ls_coopid , ls_entryid, ldtm_entrydate , ls_err )
//if li_chk <> success then 
//	ithw_exception.text	= ls_err
//	destroy( lds_main )
//	destroy( lds_item )		
//	throw ithw_exception
//end if

//ตรวจสอบ กรณีเป็นรายการที่รอ ยืนยันไม่ต้องสร้างเลขที่และรายการใหม่  
//li_chkexist	= 0 
//if li_paymentstatus = 8 then li_chkexist = 8

//if li_chkexist = 0 then		
	// สร้างเลขที่ทำรายการ
	ls_slipno = this.of_get_lastslip_docno( ls_slipdocno )
	lds_main.object.slip_no[1]  =  ls_slipno
			
	// สร้างเลขที่ใบเสร็จ / ใบสำคัญจ่าย
	if li_payrecv = 1 then
		ls_receipt 	= this.of_get_lastslip_docno( ls_receiptcode )//"FNRECEIPTNO"
		lds_main.object.receipt_no[1]	= ls_receipt
	else
		ls_payno		=	this.of_get_lastslip_docno( ls_payslipcode )//"FNPAYSLIPNO"
		lds_main.object.payslip_no[1]	= ls_payno
	end if
	
	if isnull( ls_member ) then ls_member = ' '
	if isnull( li_memflag ) then li_memflag = 0
	
	lds_main.object.recvpay_id[1]			= ls_receiveid
	lds_main.object.recvpay_time[1]		= ldtm_recvtime
	lds_main.object.pay_towhom[1]		= ls_paywhom
	
	// กำหนด seq_no 
	li_row = lds_item.rowcount()
	for li_index = 1 to li_row	
			lds_item.object.slip_no[li_index]			= ls_slipno
			lds_item.object.coop_id[li_index]			= ls_coopid
			lds_item.object.seq_no[li_index]			= li_index			
	next
	
	lds_main.Accepttext()
	lds_item.Accepttext()
	
	// กำหนดสถานะ datawindow Update ได้
	lds_main.setitemstatus( 1 , 0 , Primary! , NewModified!)
	lds_item.setitemstatus( 1 , 0 , Primary! , NewModified!)
	
	// prepare update data of lds_main
	if lds_main.update() <> 1 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง lds_main " + lds_main.of_geterrormessage()
		rollback using	itr_sqlca ;
		destroy( lds_main )
		destroy( lds_item )		
		throw ithw_exception
	end if
	
	// รายละเอียดการรับ-จ่าย
	if lds_item.update() <> 1 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง lds_item " + lds_item.of_geterrormessage()
		rollback using	itr_sqlca ;
		destroy( lds_main )
		destroy( lds_item )		
		throw ithw_exception
	end if					

//ผ่านไปเงินสด
if (ls_cashtype = "CSH" )  and ls_slipno  <> "" then
	lstr_slipinfo.slip_no  = ls_slipno
	lstr_slipinfo.coop_id = ls_coopid
	lstr_slipinfo.member_no = ls_member
	lstr_slipinfo.description = lds_main.object.payment_desc[ 1 ]
	lstr_slipinfo.entry_date = ldtm_entrydate
	lstr_slipinfo.from_system = lds_main.object.from_system[ 1 ]
	lstr_slipinfo.item_amt = ldc_itemamtnet
	lstr_slipinfo.item_status = 1
	lstr_slipinfo.sign_flag =  li_payrecv
	lstr_slipinfo.recpaytype_code = lds_main.object.ITEMPAYTYPE_CODE[1]

	try
		//this.of_postcash( lstr_slipinfo  , 1 ,ls_entryid )
	catch ( Exception thb )
		rollback using itr_sqlca ;
		destroy( lds_main )
		destroy( lds_item )
		throw thb
	end try		
end if

commit using itr_sqlca ;


destroy( lds_main )
destroy( lds_item )

return trim(ls_slipno)
end function

private function integer of_postpaychqstm (string as_coopid, string as_entry, string as_machine, datetime adtm_wdate, n_ds ads_chqcond, string as_accno, string as_chqtype, integer ai_chequestatus, n_ds ads_chqlist) throws Exception;/***********************************************
<description>
	ทำการบันทึกข้อมูลการพิมพ์จากใบทำรายการ 
</description>

<arguments>
	as_coopid			รหัสสาขาสหกรณ์
	as_entry				รหัสผู้ใช้ ที่ทำรายการ
	adtm_wdate			วันที่ ที่ทำรายการ
	as_machine			ชื่อเครื่องทีทำรายการ
	ads_chqcond		ข้อมูลเงื่อนไขการพิมพ์ 
	as_accno				เลขที่บัญชี่ตัดยอดธนาคาร 
	as_chqtype			ประเภทเช็ค
	ai_chequestatus	สถานะเช็ค
	ads_chqlist			ข้อมูลรายการจ่ายเช็ค
</arguments>

<return>
	integer	คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_postpaychqstm()
	
	Integer li_return  , li_chequestatus
	String ls_branch , ls_entry , ls_machine , ls_accno , ls_chqtype 
	datetime		ldtm_wdate
	n_ds	lds_chqcond , lds_chqlist
	
	li_return = lnv_finservice.of_postpaychqstm( ls_branch , ls_entry , ls_machine , ldtm_wdate , lds_chqcond  , ls_accno , ls_chqtype  , li_chequestatus , lds_chqlist )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 02/10/2010 by PhaiWaan
	Version 1.1 เปลี่ยน Loop For  เป็น Loop Do While , ตรวจสอบการเลือกรายการจ่ายเป็นเช็ค Modified Date 9/10/2010 by PhaiWaan
	Version 1.2 ให้ Commit ข้อมูลก่อนทำการพิมพ์เช็ค Modified Date /จ/10/2010 by PhaiWaan
</usage>
************************************************/

integer	li_row, li_index, li_chqsize, li_selected, li_chk, li_payment_status, li_receive_status, li_retail_flag
datetime	 ldtm_today , ldtm_chqdate
string	ls_bank, ls_bankbranch, ls_chqbookno, ls_chqno, ls_remark
string	ls_paywhom, ls_member, ls_referslip , ls_tofromaccid , ls_bridgeche_no
dec{2}	ldc_itemamt, ldc_sumitemamt
integer	li_used, li_remain, li_available,li_transec_no , li_seqno
string	ls_ref_slipno, ls_from_system, ls_deptaccount_no

ls_chqno				= trim( ads_chqcond.object.as_chqstart_no[1])
ldtm_chqdate		= ads_chqcond.object.adtm_date[1]
ls_bankbranch	= trim( ads_chqcond.object.as_bankbranch[1] )
ls_chqbookno	= trim( ads_chqcond.object.as_chqbookno[1] )
ls_bank			= trim( ads_chqcond.object.as_bank[1] )

ldtm_today			= datetime( date( adtm_wdate ) , now() )

li_row				= ads_chqlist.rowcount( )
ldc_sumitemamt		= 0

if not isvalid( idc_printchq ) then
	idc_printchq		= create n_ds
	idc_printchq.dataobject	= "d_chequelist_forprint"
	idc_printchq.settransobject( itr_sqlca )
else
	idc_printchq.reset( )
end if

// ตรวจสอบการดึงข้อมูลสำหรับการพิมพ์เช็ค
li_chk			= idc_printchq.retrieve(as_coopid, ls_bank, ls_bankbranch, ls_chqbookno, ls_chqno )

if li_chk < 1 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก finshqeuestatement เพื่อเตรียมพิมพ์เช็ค" + itr_sqlca.sqlerrtext
	throw ithw_exception

end if
	
li_chk			= 0

select	account_id
into		:ls_tofromaccid
from		FINBANKACCOUNT
WHERE		(	ACCOUNT_NO= :as_accno ) AND  
			(	BANK_CODE			= :ls_bank ) AND  
			( 	BANKBRANCH_CODE	= :ls_bankbranch  ) and
			( COOP_ID		= :as_coopid )
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT เพื่อปรับปรุงรหัสคู่บัญชี " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

li_index	= ads_chqlist.find("ai_selected = 1" , 1 , li_row	 )
if li_index < 1 then
	destroy( idc_printchq )
	ithw_exception.text	= "ยังไม่ได้เลือกรายการที่ต้องการพิมพ์เช็ค" 
	throw ithw_exception
end if

do while li_index > 0 
		
	li_chk ++
	
	if li_chk > 1 then
		if as_coopid ="018001" then
			ls_chqno	= string( long( ls_chqno  ) + 1 , '00000000' )
	    else
			ls_chqno	= string( long( ls_chqno  ) + 1 , '0000000' )
		end if
	end if
	
	ls_paywhom		= trim( ads_chqlist.object.pay_towhom[li_index] )
	ls_remark		= trim( ads_chqlist.object.payment_desc[li_index] )
	ldc_itemamt		= ads_chqlist.object.item_amtnet[li_index]
	ls_referslip		= trim( ads_chqlist.object.slip_no[li_index] )
	
	if isnull( ls_paywhom ) then ls_paywhom = ""
	if isnull( ldc_itemamt ) then ldc_itemamt = 0
	if isnull( ls_referslip ) then ls_referslip = ""
	if isnull( ls_remark ) then ls_remark = ""
	
	// ตรวจสอบการสั่งจ่าย
	if ls_paywhom = "" then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement ไม่ระบุการสั่งจ่าย "  
		throw ithw_exception
	end if
	
	// ตรวจสอบการระบุจำนวนเงิน
	if ldc_itemamt <= 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finshqeuestatement ไม่ระบุจำนวนเงิน" 
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	ldc_sumitemamt	= ldc_sumitemamt + ldc_itemamt
	
	select	USE_STATUS , SEQ_NO
	into		:li_used , :li_seqno
	from		finchqeuestatement
	where		( CHEQUE_NO			= :ls_chqno ) and
				( CHEQUEBOOK_NO	= :ls_chqbookno ) and
				( BANK_CODE			= :ls_bank ) and 
				( BANK_BRANCH		= :ls_bankbranch ) and
				( COOP_ID	= :as_coopid ) and
				( chqeue_status	<> -9 ) 
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถดึงสถาระเช็คจาก finshqeuestatement เช็คเลขที่ " + ls_chqno + " "  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
if isnull(li_seqno) or li_seqno = 0 then	li_seqno = 1
	
	if ( li_used = 1 ) or ( li_used = -9 ) then
		destroy( idc_printchq )
		ithw_exception.text	= "เช็คเลขที่ " + ls_chqno + " ได้มีการใช้ไปแล้ว หรือ ถูกยกเลิก กรุณาตรวจสอบ"  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	// update account ID to where it's from
	
	ls_ref_slipno	= trim( ads_chqlist.object.ref_slipno[li_index] )
	ls_from_system	= trim( ads_chqlist.object.from_system[li_index] )
	
	this.of_updatetofrom_accid( as_coopid, adtm_wdate , ldtm_chqdate , ls_ref_slipno , ls_tofromaccid , ls_from_system , li_index)
	
	// ทำการปรับปรุงลงฐานข้อมูล
	update		finchqeuestatement
	set			DATE_ONCHQ			= :ldtm_chqdate ,
					ENTRY_ID				= :as_entry,
					ENTRY_DATE			= :adtm_wdate,
					TO_WHOM				= :ls_paywhom,
					TYPECHQ_PAY			= 0,
					MONEY_AMT			= :ldc_itemamt,
					CHQEUE_STATUS		= :ai_chequestatus,
					ADVANCE_CHQ			= 0,
					COOP_ID		= :as_coopid,
					MACHINE_ID			= :as_machine,
					MEMBER_NO			= :ls_member,
					from_bankaccno		= :as_accno,
					refer_slipno		= :ls_referslip,
					cheque_type			= :as_chqtype ,
					printed_status		= 1,
					PRINTED_ID			= :as_entry,
					PRINTED_DATE		= :adtm_wdate,
					PRINTED_TERMINAL	= :as_machine,
					USE_STATUS			= 1,
					remark				= :ls_remark
	where		( CHEQUE_NO		= :ls_chqno ) and
					( CHEQUEBOOK_NO	= :ls_chqbookno ) and
					( BANK_CODE			= :ls_bank ) and 
					( BANK_BRANCH		= :ls_bankbranch ) and
					( USE_STATUS		= 0 ) and
					( COOP_ID	= :as_coopid ) and 
					( chqeue_status	<> -9 ) and
					( seq_no = :li_seqno )
	using itr_sqlca ;
					
	
	if itr_sqlca.sqlcode <> 0 then
		destroy( idc_printchq )
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchqeuestatement เช็คเลขที่ " + ls_chqno + " "  + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception				
	end if

	ls_ref_slipno	= trim( ads_chqlist.object.slip_no[li_index] )
	
    li_payment_status    = 1
    li_receive_status    = 1
    li_retail_flag        = ads_chqlist.object.retail_flag[li_index]
	 
    if ( li_retail_flag = 3 ) then
        li_payment_status    = 8
        li_receive_status    = 0
    end if
	
	update	finslip
	set		bank_code		= :ls_bank,
			bank_branch		= :ls_bankbranch,
			chequebook_no	= :ls_chqbookno,
			account_no		= :ls_chqno,
			dateon_chq		= :ldtm_chqdate,
			cheque_status		= :ai_chequestatus,
			from_accno		= :as_accno,
			from_bankcode	= :ls_bank,
			from_branchcode	= :ls_bankbranch,
			cheque_type		= :as_chqtype,
			payment_status	= :li_payment_status,
			receive_date		= :ldtm_chqdate,
			receive_status		= :li_receive_status,
			recvpay_id			= :as_entry,
			recvpay_time		= :ldtm_today,
			pay_towhom		= :ls_paywhom
	where	slip_no				= :ls_ref_slipno and
			COOP_ID		= :as_coopid 
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy( idc_printchq )		
		ithw_exception.text	= "ไม่สามารถปรับปรุง ข้อมูลได้ ลง finslip 1 " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception		
	end if


	// insert finbridgechq  ----------------------------------------------- // by Phai 
	// บันทึกข้อมูล Table finbridgechq เป็น Table เชื่อมรายการ slip กับ Cheque
	//-----------------------------------------------------------------------
	
	this.of_postbridgechq( as_coopid , ls_referslip ,ls_bank, ls_bankbranch, ls_chqbookno , ls_chqno , li_seqno )
		
		
	// ทำการระบุค่าเพื่อทำการพิมพ์เช็คในลำดับถัดไป
	idc_printchq.object.printed_status[li_chk]	= 1
	
	choose case ai_chequestatus
		case 2,0			
			update	finslip
			set		receive_status		= 0
			where	slip_no				= :ls_ref_slipno and
					COOP_ID		= :as_coopid 
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				destroy( idc_printchq )		
				ithw_exception.text	="ไม่สามารถปรับปรุง ข้อมูลได้ ลง finslip 2 "+ itr_sqlca.sqlerrtext
				rollback using itr_sqlca ;
				throw ithw_exception		
			end if
			
		case else
			
	end choose
	
	// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
	this.of_posttobank( as_coopid , as_entry , adtm_wdate , as_machine  , as_accno, ls_bank, ls_bankbranch, ldc_itemamt , -1)	
//( as_coopid , as_entry , adtm_wdate , as_machine  , as_accno, ls_bank, ls_bankbranch, ldc_itemamt , -1)	
//	// ทำการ update ยอดเงินในธนาคารสหกรณ์ เฉพาะยอดเงินในกระเป๋าสหกรณ์เท่านั้น
////	if ( ls_from_system <> "FIN" ) then
//		dec{2}	ldc_scobal
//		string	ls_account_type, ls_slipbankno, ls_year, ls_account_name, ls_book_no
//		long		ll_laststm_seq
//		datetime	ldtm_open_date
//		n_cst_cm_doccontrol_service		lnv_docsrv
//		
//		ldc_scobal = 0	
//		ll_laststm_seq = 0		
//		
//		select	SCO_BALANCE, laststm_seq, account_type, open_date, account_name, book_no,
//					account_id
//		into		:ldc_scobal, :ll_laststm_seq, :ls_account_type, :ldtm_open_date, :ls_account_name, :ls_book_no,
//					:ls_tofromaccid
//		from		FINBANKACCOUNT
//		WHERE		(	ACCOUNT_NO			= :as_accno ) AND  
//					(	BANK_CODE			= :ls_bank ) AND  
//					( 	BANKBRANCH_CODE	= :ls_bankbranch  ) and
//					( COOP_ID		= :as_coopid );
//		
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถดึงข้อมูลได้ จาก FINBANKACCOUNT " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
//		
//		if isnull( ldc_scobal )	then ldc_scobal = 0			
//		if isnull( ll_laststm_seq )	then ll_laststm_seq = 0		
//		
//		ldc_scobal		-= ldc_itemamt
//		ll_laststm_seq	+= 1
//		
//		
//		li_chk			= lnv_docsrv.of_new( "FNRECEIPTBANK", ls_slipbankno, ls_year )
//		ls_slipbankno	=  right( trim( ls_year ), 2 ) + as_coopid +  ls_slipbankno
//		
//		
//		INSERT INTO FINSLIP_BANK  
//		(	SLIP_NO,					ENTRY_ID,				ENTRY_DATE,				OPERATE_DATE,
//			COOP_ID,			MACHINE_ID,				ACCOUNT_NO,				BANK_CODE,
//			BANK_BRANCH,			ACCOUNT_NAME,			OPEN_DATE,				LAST_STM,
//			ITEM_AMT,				BALANCE,					WITHDRAW_AMT,			ITEM_CODE,
//			BOOK_NO,					ACCOUNT_TYPE 
//		)  
//		VALUES
//		(	:ls_slipbankno,		:as_entry,			:adtm_wdate,		:adtm_wdate,
//			:as_coopid,		:as_machine,			:as_accno,				:ls_bank,
//			:ls_bankbranch,		:ls_account_name,		:ldtm_open_date,		:ll_laststm_seq,
//			:ldc_itemamt,		:ldc_scobal,			:ldc_scobal,			'WCA',
//			:ls_book_no,			:ls_account_type
//		)  ;
//		
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถบันทึกข้อมูลได้ ลง FINSLIP_BANK " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
//		
//		INSERT INTO	FINBANKSTATEMENT
//		(		SEQ_NO,					ACCOUNT_NO,						BANK_CODE,
//				BANKBRANCH_CODE,		DETAIL_DESC,					ENTRY_ID,
//				ENTRY_DATE,				OPERATE_DATE,					REF_SEQ,
//				ITEM_STATUS,			CANCEL_ID,						CANCEL_DATE,
//				BALANCE,					BALANCE_BEGIN,					MACHINE_ID,
//				COOP_ID,			refer_slipno,					item_amt
//		)
//		VALUES
//		( 		:ll_laststm_seq,		:as_accno,						:ls_bank,
//				:ls_bankbranch,		'ถอนเงิน',						:as_entry,
//				:adtm_wdate,		:adtm_wdate,				null,
//				1,							null,								null,
//				:ldc_scobal,			0,									:as_machine,
//				:as_coopid,		:ls_slipbankno,				:ldc_itemamt
//		) ;
//		
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKSTATEMENT " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
//		
//		UPDATE	FINBANKACCOUNT
//		SET		SCO_BALANCE				= :ldc_scobal,
//					laststm_seq				= :ll_laststm_seq
//		WHERE		( ACCOUNT_NO			= :as_accno ) AND  
//					( BANK_CODE				= :ls_bank ) AND  
//					( BANKBRANCH_CODE		= :ls_bankbranch  ) and
//					( COOP_ID		= :as_coopid );
//		if itr_sqlca.sqlcode <> 0 then
//			messagebox( "ผิดพลาด" ,"ไม่สามารถบันทึกข้อมูลได้ ลง FINBANKACCOUNT " + itr_sqlca.sqlerrtext,StopSign! )
//			rollback;
//			destroy( idc_printchq )
//			return -1
//		end if
////	end if
		li_index++
		if li_index > li_row then
			exit 
		end  if
		li_index	= ads_chqlist.find("ai_chqflag = 1" , li_index , li_row	 )
		
		
loop

select		chqslip_used, chqslip_remain
into		:li_used, :li_remain
from		finchequemas
where		chequebook_no	= :ls_chqbookno and
			bank_code		= :ls_bank and
			bank_branch		= :ls_bankbranch and
			COOP_ID	= :as_coopid 
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )		
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้ จาก finchequemas "  + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception		
end if

if isnull( li_used ) then li_used= 0
if isnull( li_remain ) then li_remain= 0

li_used			= li_used + li_selected
li_remain		= li_remain - li_selected
li_available	= 1

if li_remain < 1 then
	li_available	= 0
	li_remain		= 0
end if


// ทำการปรัปรุงค่าเช็คที่ได้ใช้ไป
update	finchequemas
set			chqslip_used		= :li_used,
			chqslip_remain		= :li_remain,
			available_flag		= :li_available,
			last_chqno			= :ls_chqno
where	chequebook_no		= :ls_chqbookno and
			bank_code			= :ls_bank and
			bank_branch			= :ls_bankbranch and
			COOP_ID		= :as_coopid 
using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	destroy( idc_printchq )		
	ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ ลง finchequemas " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception			
end if

if ai_chequestatus = 0 or ai_chequestatus = 2 then
	return success
end if

idc_printchq.accepttext( )

return success
end function

public function integer of_postyrto_fin (n_ds ads_data);string 	ls_coopctrl, ls_paydesc, ls_refslipno, ls_fromsystem, ls_entryid, ldtm_entrydate
integer	li_paymentstatus, li_recvstatus, li_index, li_itemstatus
ls_coopctrl 		= is_coopcontrl

//as_cancelslipno	= ""

// รับจ่ายเงินที่หน้าการเงินหรือไม่ 1 ใช่ 0 ไม่ใช่


// ต้องทำการตรวจสอบเงินสดด้วย
li_paymentstatus	= 1
li_recvstatus			= 1

ls_paydesc = ""
ls_refslipno			= ads_data.object.deptslip_no[li_index]
li_itemstatus		= ads_data.object.item_status[li_index]
ls_fromsystem		= 'DIV'
ls_entryid			= ads_data.object.entry_id[li_index]
ldtm_entrydate		= ads_data.object.entry_date[li_index]


//INSERT INTO	FINSLIP
//	(	SLIP_NO,					ENTRY_ID,					ENTRY_DATE,					OPERATE_DATE,
//		FROM_SYSTEM,		PAYMENT_STATUS,		CASH_TYPE,					PAYMENT_DESC,
//		BANK_CODE,			BANK_BRANCH,				ITEMPAY_AMT,					PAY_TOWHOM,
//		DATEON_CHQ,			MEMBER_NO,				ITEMPAYTYPE_CODE,			PAY_RECV_STATUS,
//		MEMBER_FLAG,			NONMEMBER_DETAIL,	COOP_ID,				MACHINE_ID,
//		CANCEL_ID,				CANCEL_DATE,				BANKFEE_AMT,					BANKSRV_AMT,
//		TOFROM_ACCID,		ACCOUNT_NO,				CHEQUEBOOK_NO,				CHQ_ADVFLAG,
//		ref_slipno,				remark,						SHARE_AMT,					emer_amt,
//		norm_amt,				extra_amt,					sharespx_amt,					tax_flag,
//		tax_amt,					tax_rate,						receive_date,					receive_status,
//		item_amtnet,			accuint_amt,				retail_flag,						recvpay_id ,
//		vat_amt
//	)  
//	VALUES
//	(	:ls_fnrecvno,			:ls_entryid,					:ldtm_entrydate,				:ldtm_opreatedate,   
//		:ls_fromsystem,		:li_paymentstatus,			:ls_cashtype,					:ls_paydesc,
//		:ls_bankcode,			:ls_bankbranch,			:ldc_itemnet_amt,					:ls_towhom,   
//		null,						:ls_memno,					:ls_itemtypecode,				:li_payrec_status,   
//		1,							:ls_memname,				:ls_coopid,					:ls_machineid,   
//		null,						null,							0,									0,   
//		:ls_accid,				null,							null,								null, 
//		:ls_refslipno,			:ls_remark,					:ldc_share,						:ldc_emer,
//		:ldc_norm,				:ldc_extra,					:ldc_sharespx,					0,
//		0,							0,								:ldtm_entrydate,				:li_recvstatus,
//		:ldc_itemnet_amt,			:ldc_accuint,				0,									:ls_entryid ,
//		0
//	) using itr_sqlca   ;
//	
//	
//	if itr_sqlca.sqlcode <> 0 then
//		ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถบันทึกข้อมูลลง Finslip ได้ "+ itr_sqlca.sqlerrtext 
//		rollback using itr_sqlca ; 
//		throw ithw_exception
//	end if

return 1
end function

public function integer of_postdivto_fin (datetime adtm_date, string as_coopid) throws Exception;string		ls_refslipno,ls_fnrecvno, ls_entryid, ls_memno, ls_paydesc, ls_memname, ls_towhom, ls_accid, ls_remark
integer	li_paymentstatus, li_recvstatus, li_found
datetime	ldtm_entrydate, ldtm_opreatedate
dec{2}	ldc_itemnet_amt, ldc_accuint, ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx
long		ll_count, ll_row
n_ds lds_data

lds_data		= create n_ds
lds_data.dataobject	= "d_fin_yr_pay_out_list"
lds_data.settransobject( itr_sqlca )
ll_count = lds_data.retrieve( adtm_date, as_coopid )

li_paymentstatus	= 8
li_recvstatus			= 0
	
for ll_row = 1 to ll_count
	
	ls_refslipno 			= lds_data.getitemstring( ll_row, "payoutslip_no" )
	ls_entryid			= lds_data.getitemstring( ll_row, "entry_id" )
	ldtm_entrydate		= adtm_date
	ldtm_opreatedate 	= adtm_date
	ls_memno			= lds_data.getitemstring( ll_row, "member_no" )
	ls_paydesc 			= 'จ่ายเงินปันผล - เฉลี่ยนคืน ' + ls_memno
	ldc_itemnet_amt	= lds_data.getitemdecimal( ll_row , "payout_payment" )
	
	ls_memname		= this.of_getmembername( ls_memno )
	ls_towhom			= trim( ls_memname )
	
	this.of_getshrlon( as_coopid   ,ls_memno  ,ldc_accuint ,  ldc_share, ldc_emer, ldc_norm, ldc_extra, ldc_sharespx )
	// ตรวจสอบมีการทำรายการแล้วรึยัง
	select 	count( 1 )
	into 		:li_found
	from 		finslip
	where 	ref_slipno = :ls_refslipno
	and		coop_id		= :as_coopid
	and		PAYMENT_STATUS <> -9
	and 		from_system  = 'DEP'
	using 		itr_sqlca ;
	
	if isnull( li_found ) then li_found = 0
	
	if li_found > 0 then  continue

	ls_fnrecvno			= this.of_get_lastslip_docno( "FNRECEIVENO" )

		INSERT INTO	FINSLIP
		(	SLIP_NO,					ENTRY_ID,					ENTRY_DATE,					OPERATE_DATE,
			FROM_SYSTEM,		PAYMENT_STATUS,		CASH_TYPE,					PAYMENT_DESC,
			BANK_CODE,			BANK_BRANCH,				ITEMPAY_AMT,					PAY_TOWHOM,
			DATEON_CHQ,			MEMBER_NO,				ITEMPAYTYPE_CODE,			PAY_RECV_STATUS,
			MEMBER_FLAG,			NONMEMBER_DETAIL,	COOP_ID,						MACHINE_ID,
			CANCEL_ID,				CANCEL_DATE,				BANKFEE_AMT,					BANKSRV_AMT,
			TOFROM_ACCID,		ACCOUNT_NO,				CHEQUEBOOK_NO,				CHQ_ADVFLAG,
			ref_slipno,				remark,						SHARE_AMT,					emer_amt,
			norm_amt,				extra_amt,					sharespx_amt,					tax_flag,
			tax_amt,					tax_rate,						receive_date,					receive_status,
			item_amtnet,			accuint_amt,				retail_flag,						recvpay_id ,
			vat_amt
		)  
		VALUES
		(	:ls_fnrecvno,			:ls_entryid,					:ldtm_entrydate,				:ldtm_opreatedate,   
			'DIV',						:li_paymentstatus,			'CSH',								:ls_paydesc,
			'',							'',								:ldc_itemnet_amt,				:ls_towhom,   
			null,						:ls_memno,					'DIV',								0,   
			1,							:ls_memname,				:as_coopid,						'',   
			null,						null,							0,									0,   
			'11010100',				null,							null,								null, 
			:ls_refslipno,			:ls_remark,					:ldc_share,						:ldc_emer,
			:ldc_norm,				:ldc_extra,					:ldc_sharespx,					0,
			0,							0,								:ldtm_entrydate,				0,
			:ldc_itemnet_amt,		:ldc_accuint,				0,									:ls_entryid ,
			0
		) using itr_sqlca   ;
		
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถบันทึกข้อมูลลง Finslip ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
	//	
	//	// หาคู่บัญชี ของบัญชี่เงินฝาก ----------------------
	//	select account_id 
	//	into 	:ls_accid_slipdet
	//	from 	vcmapaccid
	//	where  system_code = 'DEP'
	//	and 		slipitemtype_code = 'DEP'
	//	and	coop_id		= :is_coopcontrl
	//	and shrlontype_code = :ls_depttype
	//	and shrlontype_status = 1
	//	using itr_sqlca ;
	//	
	//	if itr_sqlca.sqlcode <> 0 then
	//		ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถหาคู่บัญชีได้ "+ itr_sqlca.sqlerrtext 
	//		rollback using itr_sqlca ; 
	//		throw ithw_exception
	//	end if
	//	
	//	
	//	if isnull( ls_accid_slipdet ) then ls_accid_slipdet = ""
	//	//----------------------------------------------------
	//	
		INSERT INTO FINSLIPDET  
		( 	SLIP_NO,              		COOP_ID,              				SEQ_NO,              		SLIPITEMTYPE_CODE,              	SLIPITEM_DESC,   
			SLIPITEM_STATUS,		CANCEL_ID,							CANCEL_DATE,				POSTTOVC_FLAG,						VOUCHER_NO,   
			CANCELTOVC_FLAG,		CANCELVC_NO,						DISPLAYONLY_STATUS,	ITEMPAY_AMT,							ACCOUNT_ID,   
			ITEMPAYAMT_NET,		TAX_FLAG,							VAT_FLAG,					TAX_CODE,								TAXWAY_KEEP,   
			TAX_AMT,					SECTION_ID,						MEMBGROUP_CODE,		OPERATE_FLAG ,						vat_amt
		)  
		VALUES
		(	:ls_fnrecvno ,				:as_coopid , 						1 , 							 '11010100', 							:ls_paydesc ,
			1 , 							null ,									null ,							0 ,											null , 		
			0	,							null ,									0 ,								:ldc_itemnet_amt , 					'11010100' ,
			:ldc_itemnet_amt , 		0 , 									0	,							0 ,											0 ,
			0 ,								0	,									null ,							1 ,											0
		) using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถบันทึกข้อมูลลง Finslipdet ได้ "+ itr_sqlca.sqlerrtext 
			rollback using itr_sqlca ; 
			throw ithw_exception
		end if
		
		update 	yrslippayout
		set			finpost_status = 1 
		where 	payoutslip_no = :ls_refslipno
		and		coop_id		= :as_coopid
		using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ระบบเงินฝาก : ไม่สามารถ Update สถานะผ่านรายการมาการเงิน ได้ "+ itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ; 
	throw ithw_exception
end if

next 

	
return 1
end function

public function integer of_retrievereprintpayslip_ir (string as_coopid, string as_cond_xml, ref string as_slip_xml) throws Exception;/***********************************************
<description>
	ดึงข้อมูลใบสำคัญจ่าย เพื่อทำการ Reprint 
</description>

<arguments>	
	as_branch				รหัสสาขาสหกรณ์
	as_cond_xml			ข้อมูลเงื่อนไขการดึงข้อมูล
	as_slip_xml				ข้อมูลรายการใบสำคัญจ่าย
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
	lnv_finservice.of_retrievereprintpayslip()
	
	Integer li_return
	String ls_branch , ls_cond_xml , ls_slip_xml

	li_return = lnv_finservice.of_retrievereprintpayslip( ls_branch , ls_cond_xml , ls_slip_xml )
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 27/10/2010 by Phaiwaan
</usage>
************************************************/

integer		li_found, li_memflag
string		ls_memno, ls_receiptno, ls_sql , ls_isql , ls_from_system
datetime	ldtm_date

n_ds 	lds_cond , lds_data

lds_cond 	= create n_ds
lds_cond.dataobject = "d_reprintreceipt_head"

if not isnull( as_cond_xml ) and trim( as_cond_xml ) <> "" then
	this.of_importstring_xml( lds_cond , as_cond_xml )
else
	ithw_exception.text	= "ไม่มีข้อมูลเงื่อนไขการค้นหา ไม่สามารถตรวจสอบข้อมูลได้"
	throw ithw_exception
end if

lds_data		= create n_ds
lds_data.dataobject	= "d_reprintpay_list_ir"
lds_data.settransobject( itr_sqlca )
ls_isql				= lds_data.getsqlselect( )

ls_sql				= ""
ls_memno		= trim( lds_cond.object.as_memberno[1] )
ls_receiptno		= trim( lds_cond.object.as_receipt[1] )
li_memflag		= lds_cond.object.ai_memberflag[1]
ldtm_date		= lds_cond.object.adtm_date[1]
ls_from_system	= trim( lds_cond.object.from_system[1] )

if isnull( ls_memno ) then ls_memno = ""
if isnull( ls_receiptno ) then ls_receiptno = ""

ls_sql			+= " and ( FINSLIP.COOP_ID = '" + as_coopid + "' ) "

if not isnull( ls_memno ) and trim( ls_memno ) <> ""  then
	ls_sql			+= " and ( finslip.member_no = '" + ls_memno + "' ) "
end if

if not isnull( ls_receiptno ) and trim( ls_receiptno ) <> "" then
	ls_sql			+= " and ( finslip.slip_no = '" + ls_receiptno + "' ) "
end if

if not isnull( li_memflag ) then
	ls_sql			+= " and ( finslip.member_flag = " + string( li_memflag )  + " ) "
end if

if not isnull( ldtm_date ) then
	ls_sql			+= " and ( finslip.entry_date = to_date('" + string( ldtm_date , 'mm/dd/yyyy') + "','mm/dd/yyyy') )"
end if

if not isnull( ls_from_system ) then 
	ls_sql			+= " and ( finslip.from_system = '" + ls_from_system + "' )"
end if

if trim( ls_sql ) <> "" then
	ls_sql		= ls_isql + ls_sql
	lds_data.SetSQLselect( ls_sql )
	
	li_found		= lds_data.retrieve( )
	
	if li_found < 1 then
		destroy( lds_data ) 
		ithw_exception.text	= "ไม่มีข้อมูลตามเงื่อนไข"
		throw ithw_exception
	end if
	
end if

as_slip_xml	= lds_data.describe( "Datawindow.Data.Xml" )

destroy( lds_data ) 

return Success
end function

on n_cst_finance_service.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_finance_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_exception	= create Exception
end event

event destructor;if isvalid( inv_docservice) then destroy( inv_docservice )
if isvalid(ids_constant) then destroy(ids_constant)
if isvalid(inv_datetime) then destroy(inv_datetime)
if isvalid(inv_print_srv) then destroy(inv_print_srv)
if isvalid(inv_calendar_srv) then destroy(inv_calendar_srv)

if isvalid(ithw_exception) then destroy(ithw_exception)

if isvalid( inv_db) then destroy( inv_db )
end event
