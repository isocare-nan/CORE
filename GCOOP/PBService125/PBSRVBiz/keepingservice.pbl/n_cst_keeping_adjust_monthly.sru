$PBExportHeader$n_cst_keeping_adjust_monthly.sru
$PBExportComments$ปรับปรุงยอดเก็บรายเดือน
forward
global type n_cst_keeping_adjust_monthly from NonVisualObject
end type
end forward

/// <summary> ปรับปรุงยอดเก็บรายเดือน
/// </summary>
global type n_cst_keeping_adjust_monthly from NonVisualObject
end type
global n_cst_keeping_adjust_monthly n_cst_keeping_adjust_monthly

type variables
n_ds	ids_loandata, ids_contintspc, ids_inttable

string		is_recvperiod, is_arg[], is_userid, is_branchid
string		is_coopcontrol , is_coopid
integer	ii_adjmthlonflag
datetime	idtm_oper

n_cst_progresscontrol		inv_progress
n_cst_stringservice			inv_stringsrv
n_cst_loansrv_interest		inv_intsrv
n_cst_dbconnectservice		inv_transection
n_cst_keeping_service		inv_kpsrv
n_cst_datawindowsservice	inv_dwsrv
n_cst_dwxmlieservice			inv_dwxmliesrv
n_cst_doccontrolservice		inv_docsrv
n_cst_procservice				inv_procsrv

transaction	itr_sqlca
Exception	ithw_exception

constant integer	STATUS_CLOSE = -1
end variables

forward prototypes
public function integer of_setprogress (ref n_cst_progresscontrol anv_progress) throws Exception
public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans) throws Exception
public function integer of_init_adjust_monthly_main (n_ds ads_info_mem, n_ds ads_info_kpmas, ref n_ds ads_adj_mth_main) throws Exception
public function integer of_init_adjust_monthly_detail (n_ds ads_info_lncont, n_ds ads_info_kpmasdet, ref n_ds ads_adj_mth_det) throws Exception
public function integer of_save_adjust_monthly (str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_save_adjust_monthly_prc_option (str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_init_ccl_keep (ref str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_init_adjust_monthly_prc_option (ref str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_init_kptp_ccl (ref str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_save_kptp_ccl (ref str_keep_adjust astr_keep_adjust) throws Exception
protected function integer of_check_overadj (ref n_ds ads_adj_mth_main, ref n_ds ads_adj_mth_det) throws Exception
public function integer of_init_adjust_monthly (ref str_keep_adjust astr_keep_adjust) throws Exception
protected function integer of_init_adjust_monthly_detail_lon (n_ds ads_info_lncont, n_ds ads_info_kpmasdet, ref n_ds ads_adj_mth_det, long al_row, long al_insrow) throws Exception
protected function integer of_init_adjust_monthly_detail_shr (n_ds ads_info_kpmasdet, ref n_ds ads_adj_mth_det, long al_row, long al_insrow) throws Exception
protected function integer of_post_adjust_monthly_prc_postadjust (n_ds ads_xmloption) throws Exception
protected function integer of_postslip_adjmth (n_ds ads_adj_mth_main, n_ds ads_adj_mth_det) throws Exception
protected function integer of_postslip_adjmth_lon (n_ds ads_adj_mth_main, n_ds ads_adj_mth_det, long al_index_det) throws Exception
protected function integer of_postslip_adjmth_shr (n_ds ads_adj_mth_main, n_ds ads_adj_mth_det, long al_index_det) throws Exception
protected function integer of_poststm_contract (str_poststmloan astr_lnstatement) throws Exception
protected function integer of_poststm_share (str_poststmshare astr_infoshrstm) throws Exception
protected function integer of_set_adj (ref n_ds ads_adj_mth_det) throws Exception
protected function integer of_setsrvdoccontrol (boolean ab_switch) throws Exception
protected function integer of_setsrvdw (boolean ab_switch) throws Exception
protected function integer of_setsrvdwxmlie (boolean ab_switch) throws Exception
protected function integer of_setsrvlninterest (boolean ab_switch)
protected function integer of_setsrvproc (boolean ab_switch)
public function integer of_postslip_adjmth_ccl (n_ds ads_adj_main, n_ds ads_adj_det) throws Exception
protected function integer of_postslip_adjmth_ccl_shr (n_ds ads_adj_mth_main, n_ds ads_adj_mth_det, long al_index_det) throws Exception
protected function integer of_postslip_adjmth_ccl_lon (n_ds ads_adj_mth_main, n_ds ads_adj_mth_det, long al_index_det) throws Exception
public function integer of_init_adjmth_ccl (ref str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_save_adjmth_ccl (ref str_keep_adjust astr_keep_adjust) throws Exception
end prototypes

public function integer of_setprogress (ref n_cst_progresscontrol anv_progress) throws Exception;/***********************************************************
<description>
	กำหนด progress bar ที่ใช้แสดงผล
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
anv_progress = inv_progress

return 1
end function

public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans) throws Exception;/***********************************************************
<description>
	ใช้สำหรับ Intial service
</description>

<arguments>  
	atr_dbtrans			n_cst_dbconnectservice	รายละเอียดการเชื่อมต่อฐานข้อมูล
</arguments> 

<return> 
	Integer				1 = success
</return> 

<usage> 
	เรียกใช้ครั้งเดียว และต้องเรียกใช้เป็นฟังก์ชั่นแรกหลังจาก create instance
	ก่อนที่จะเรียกใช้ฟังก์ชั่นอื่น ๆ
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

itr_sqlca = atr_dbtrans.itr_dbconnection
is_coopcontrol	= atr_dbtrans.is_coopcontrol
is_coopid = atr_dbtrans.is_coopid

// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
	inv_transection	= atr_dbtrans
end if

// สร้าง Progress สำหรับแสดงสถานะการประมวลผล
inv_progress	= create n_cst_progresscontrol

itr_sqlca 		= inv_transection.itr_dbconnection

return 1
end function

public function integer of_init_adjust_monthly_main (n_ds ads_info_mem, n_ds ads_info_kpmas, ref n_ds ads_adj_mth_main) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายการปรับปรุงใบเสร็จประจำเดือน( main )
</description>

<arguments>  
	ads_info_mem					n_ds		n_ds ข้อมูลสมาชิก
	ads_info_kpmas				n_ds		n_ds ข้อมูลใบเสร็จประจำเดือน
	ads_adj_mth_main{Ref}		n_ds		n_ds รายการปรับปรุงหัวใบทำรายการ
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO
	Version 2.0 (Initial version) Modified Date 25/05/2012 by Godji
</usage> 
***********************************************************/
string ls_kpslipno , ls_tofromaccid
string ls_sliptype , ls_memno , ls_memcoopid , ls_recvperiod
integer li_row
dec{2} ldc_receive
datetime ldtm_receipt

li_row				= ads_adj_mth_main.rowcount()

select account_id
into :ls_tofromaccid
from cmucftofromaccid
where coop_id = :is_coopcontrol
and applgroup_code = 'KEP'
and sliptype_code = 'ADJ'
and default_flag = 1
using itr_sqlca ;

if isnull( ls_tofromaccid ) then ls_tofromaccid = ""

ls_memno		= ads_adj_mth_main.object.member_no[ li_row ]
ls_sliptype		= ads_adj_mth_main.object.adjtype_code[ li_row ]

if isnull( ls_sliptype ) or len( trim( ls_sliptype ) ) = 0 then
	ithw_exception.text = "ไม่พบข้อมูลการทำรายการปรับปรุงใบเสร็จ"
	ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	return -1
end if

ads_adj_mth_main.object.memb_name[ li_row ]				= ads_info_mem.object.memb_name[ 1 ]
ads_adj_mth_main.object.memb_surname[ li_row ]			= ads_info_mem.object.memb_surname[ 1 ]
ads_adj_mth_main.object.membgroup_code[ li_row ]		= ads_info_mem.object.membgroup_code[ 1 ]
ads_adj_mth_main.object.prename_desc[ li_row ]			= ads_info_mem.object.prename_desc[ 1 ]
ads_adj_mth_main.object.tofrom_accid[ li_row ]				= ls_tofromaccid

choose case ls_sliptype
	case "MTH"
		ls_kpslipno			= ads_info_kpmas.object.kpslip_no[1]
		ls_recvperiod		= ads_info_kpmas.object.recv_period[1]
		ldc_receive			= ads_info_kpmas.object.receive_amt[1]
		ldtm_receipt			= ads_info_kpmas.object.receipt_date[1]
		
		ads_adj_mth_main.setitem( li_row, "slipretall_flag", 1 )
		ads_adj_mth_main.setitem( li_row, "ref_recvperiod", ls_recvperiod )
		ads_adj_mth_main.setitem( li_row, "ref_slipno", ls_kpslipno )
		ads_adj_mth_main.setitem( li_row, "ref_slipamt", ldc_receive )
		ads_adj_mth_main.setitem( li_row, "ref_slipdate", ldtm_receipt )		
end choose

return 1
end function

public function integer of_init_adjust_monthly_detail (n_ds ads_info_lncont, n_ds ads_info_kpmasdet, ref n_ds ads_adj_mth_det) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายการปรับปรุงใบเสร็จประจำเดือน( main )
</description>

<arguments>  
	ads_adj_mth_main{n_ds}		n_ds		n_ds รายการปรับปรุงหัวใบทำรายการ
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO
	Version 2.0 (Initial version) Modified Date 25/05/2012 by Godji
</usage> 
***********************************************************/
string ls_recvperiod , ls_memno , ls_memcoopid
string ls_keeptype
integer li_keepstatus
long ll_index , ll_count , ll_insrow
dec{2} ldc_itempay , ldc_itemadj

ls_memno		= ads_info_kpmasdet.object.member_no[1]
ls_recvperiod	= ads_info_kpmasdet.object.recv_period[1]

ll_count	= ads_info_kpmasdet.rowcount()

li_keepstatus	= ads_info_kpmasdet.getitemnumber( 1, "keeping_status" )
if li_keepstatus < 0 then
	ithw_exception.text	+= "การเรียกเก็บเงินประจำเดือนของทะเบียนสมาชิก : "+ ls_memno 
	ithw_exception.text	+= "~r~nงวดประจำเดือน : " + string( ls_recvperiod , "@@@@/@@" )
	ithw_exception.text	+= "~r~nได้มีการยกเลิกใบเสร็จไปแล้ว ไม่สามารถปรับปรุงรายการได้อีก"
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"
	return -1
end if

for ll_index = 1 to ll_count
	
	ll_insrow		= ads_adj_mth_det.insertrow( 0 )

	ads_adj_mth_det.object.concoop_id[ ll_insrow ]				= ads_info_kpmasdet.object.bizzcoop_id[ ll_index ]
	ads_adj_mth_det.object.shrlontype_code[ ll_insrow ]			= ads_info_kpmasdet.object.shrlontype_code[ ll_index ]
	ads_adj_mth_det.object.loancontract_no[ ll_insrow ]			= ads_info_kpmasdet.object.loancontract_no[ ll_index ]
	ads_adj_mth_det.object.slipitem_desc[ ll_insrow ]			= ads_info_kpmasdet.object.description[ ll_index ]
	ads_adj_mth_det.object.bfmthpay_refmembno[ ll_insrow ]	= ads_info_kpmasdet.object.ref_membno[ ll_index ]
	ads_adj_mth_det.object.bfmthpay_seqno[ ll_insrow ]			= ads_info_kpmasdet.object.seq_no[ ll_index ]
//	ads_adj_mth_det.object.bfcontstatus_desc[ ll_insrow ]		= ads_info_kpmasdet.object.status_desc[ ll_index ]
	ads_adj_mth_det.object.bfshrcont_status[ ll_insrow ]			= ads_info_kpmasdet.object.bfcontract_status[ ll_index ]
//	ads_adj_mth_det.object.slipsign_flag[ ll_insrow ]				= ads_info_kpmasdet.object.sign_flag[ ll_index ]
	
	ads_adj_mth_det.object.seq_no[ll_insrow]						= ll_insrow

	ls_keeptype		= ads_info_kpmasdet.getitemstring( ll_index, "keepitemtype_code" )
	
	choose case ls_keeptype
		case "S01"
			if this.of_init_adjust_monthly_detail_shr( ads_info_kpmasdet , ads_adj_mth_det , ll_index , ll_insrow ) <> 1 then return -1
			
		case "L01", "L02", "L03", "IAR", "MRT"
			if this.of_init_adjust_monthly_detail_lon( ads_info_lncont , ads_info_kpmasdet , ads_adj_mth_det , ll_index , ll_insrow ) <> 1 then return -1
			
		case else
			ldc_itempay		= ads_info_kpmasdet.getitemdecimal( ll_index, "item_payment" )
			ldc_itemadj		= ads_info_kpmasdet.getitemdecimal( ll_index, "adjust_itemamt" )
			
			if isnull( ldc_itempay ) then ldc_itempay = 0
			if isnull( ldc_itemadj ) then ldc_itemadj = 0
			
			ads_adj_mth_det.object.item_adjamt[ ll_insrow ]		= ldc_itempay - ldc_itemadj
			ads_adj_mth_det.setitem( ll_insrow, "operate_flag", 0 )
			ads_adj_mth_det.setitem( ll_insrow, "slipitemtype_code", ls_keeptype )
			ads_adj_mth_det.setitem( ll_insrow, "bfmthpay_kpitemtyp", ls_keeptype )
			ads_adj_mth_det.setitem( ll_insrow, "bfmthpay_itemamt", ldc_itempay )
			ads_adj_mth_det.setitem( ll_insrow, "bfmthadj_itemamt", ldc_itemadj )
			ads_adj_mth_det.setitem( ll_insrow, "sign_flag", 1 )
	end choose

next


//string		ls_xmladjdet, ls_keeptype, ls_contno, ls_slipitemtype
//string		ls_memno, ls_memcoopid
//long		ll_index, ll_count, ll_nwrow, ll_chkrow
//integer	li_shrstatus, li_keepstatus
//dec{2}	ldc_shrstkbal, ldc_prnpay, ldc_intpay, ldc_intarrpay, ldc_itempay
//dec{2}	ldc_prnadj, ldc_intadj, ldc_intarradj, ldc_itemadj
//n_ds		lds_mthpay, lds_slipadjdet
//
//lds_mthpay		= create n_ds
//lds_mthpay.dataobject	= "d_loansrv_info_mthpay"
//lds_mthpay.settransobject( itr_sqlca )
//
//lds_slipadjdet	= create n_ds
//lds_slipadjdet.dataobject	= "d_loansrv_lnadjust_slipdet"
//
//ll_count		= lds_mthpay.retrieve( as_refslipno, as_refslipcoopid )
//
////if ll_count <= 0 then
//////	ithw_exception.text	= "ไม่พบข้อมูลการเรียกเก็บเงินประจำเดือนของสมาชิกเลขที่ "+as_memno+" งวดประจำเดือน "+string( as_refslipno, "@@@@/@@" )
////	throw ithw_exception
////end if
//
//li_keepstatus	= lds_mthpay.getitemnumber( 1, "keeping_status" )
//if li_keepstatus < 0 then
////	ithw_exception.text	= "การเรียกเก็บเงินประจำเดือนของสมาชิกเลขที่ "+as_memno+" งวดประจำเดือน "+string( as_refslipno, "@@@@/@@" )+" ได้มีการยกเลิกใบเสร็จไปแล้ว ไม่สามารถปรับปรุงรายการได้อีก"
//	throw ithw_exception
//end if
//
//for ll_index = 1 to ll_count
//	ll_nwrow		= lds_slipadjdet.insertrow( 0 )
//	
//	ls_memno			= lds_mthpay.getitemstring( ll_index, "member_no" )
//	ls_memcoopid		= lds_mthpay.getitemstring( ll_index, "memcoop_id" )
//	
//	lds_slipadjdet.object.shrlontype_code[ ll_nwrow ]			= lds_mthpay.object.shrlontype_code[ ll_index ]
//	lds_slipadjdet.object.loancontract_no[ ll_nwrow ]			= lds_mthpay.object.loancontract_no[ ll_index ]
//	lds_slipadjdet.object.slipitem_desc[ ll_nwrow ]				= lds_mthpay.object.description[ ll_index ]
//	lds_slipadjdet.object.bfmthpay_refmembno[ ll_nwrow ]	= lds_mthpay.object.ref_membno[ ll_index ]
//	lds_slipadjdet.object.bfmthpay_seqno[ ll_nwrow ]			= lds_mthpay.object.seq_no[ ll_index ]
//	lds_slipadjdet.object.bfcontstatus_desc[ ll_nwrow ]		= lds_mthpay.object.status_desc[ ll_index ]
//	lds_slipadjdet.object.bfshrcont_status[ ll_nwrow ]			= lds_mthpay.object.bfcontract_status[ ll_index ]
//	lds_slipadjdet.object.slipsign_flag[ ll_nwrow ]				= lds_mthpay.object.sign_flag[ ll_index ]
//
//	lds_slipadjdet.setitem( ll_nwrow, "seq_no", ll_nwrow )
//
//	ls_keeptype		= lds_mthpay.getitemstring( ll_index, "keepitemtype_code" )
//	
//	choose case ls_keeptype
//		case "S01"
//			ldc_itempay		= lds_mthpay.getitemdecimal( ll_index, "item_payment" )
//			ldc_itemadj		= lds_mthpay.getitemdecimal( ll_index, "adjust_itemamt" )
//			
//			if isnull( ldc_itempay ) then ldc_itempay = 0
//			if isnull( ldc_itemadj ) then ldc_itemadj = 0
//			
//			select		shsharemaster.sharestk_amt * shsharetype.unitshare_value,
//						shsharemaster.sharemaster_status
//			into		:ldc_shrstkbal, :li_shrstatus
//			from		shsharemaster, shsharetype
//			where	( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
//						( shsharemaster.coop_id				= shsharetype.coop_id ) and
//						( shsharemaster.member_no		= :ls_memno ) and
//						( shsharemaster.coop_id				= :ls_memcoopid )
//			using		itr_sqlca ;
//			
//			lds_slipadjdet.setitem( ll_nwrow, "slipitemtype_code", "SHR" )
//			lds_slipadjdet.setitem( ll_nwrow, "item_balance", ldc_shrstkbal )
//			lds_slipadjdet.setitem( ll_nwrow, "bfshrcont_balamt", ldc_shrstkbal )
//			lds_slipadjdet.setitem( ll_nwrow, "bfshrcont_status", li_shrstatus )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_itemamt", ldc_itempay )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_itemamt", ldc_itemadj )
//			lds_slipadjdet.setitem( ll_nwrow, "sign_flag", -1 )
//			
//		case "L01", "L02", "L03", "IAR", "MRT"
//			ls_contno		= lds_mthpay.getitemstring( ll_index, "loancontract_no" )
//			ldc_prnpay		= lds_mthpay.getitemdecimal( ll_index, "principal_payment" )
//			ldc_intpay		= lds_mthpay.getitemdecimal( ll_index, "interest_payment" )
//			ldc_intarrpay	= lds_mthpay.getitemdecimal( ll_index, "intarrear_payment" )
//			ldc_itempay		= lds_mthpay.getitemdecimal( ll_index, "item_payment" )
//			
//			ldc_prnadj		= lds_mthpay.getitemdecimal( ll_index, "adjust_prnamt" )
//			ldc_intadj		= lds_mthpay.getitemdecimal( ll_index, "adjust_intamt" )
//			ldc_intarradj	= lds_mthpay.getitemdecimal( ll_index, "adjust_intarramt" )
//			ldc_itemadj		= lds_mthpay.getitemdecimal( ll_index, "adjust_itemamt" )
//			
//			if isnull( ldc_prnpay ) then ldc_prnpay = 0
//			if isnull( ldc_intpay ) then ldc_intpay = 0
//			if isnull( ldc_intarrpay ) then ldc_intarrpay = 0
//			if isnull( ldc_itempay ) then ldc_itempay = 0
//			
//			if isnull( ldc_prnadj ) then ldc_prnadj = 0
//			if isnull( ldc_intadj ) then ldc_intadj = 0
//			if isnull( ldc_intarradj ) then ldc_intarradj = 0
//			if isnull( ldc_itemadj ) then ldc_itemadj = 0
//			
//			ll_chkrow	= ids_infocont.retrieve( ls_contno )
//			
//			if ll_chkrow <= 0 then
//				ithw_exception.text	= "ไม่พบข้อมูลสัญญาเลขที่ "+ls_contno+" กรุณาตรวจสอบ"
//				throw ithw_exception
//			end if
//			
//			if ls_keeptype = "L01" or ls_keeptype = "L02" or ls_keeptype = "L03" then
//				ls_slipitemtype		= "LON"
//			else
//				ls_slipitemtype		= ls_keeptype
//			end if
//			
//			lds_slipadjdet.object.item_balance[ ll_nwrow ]				= ids_infocont.object.principal_balance[ ll_chkrow ]
//			lds_slipadjdet.object.bfintarr_amt[ ll_nwrow ]				= ids_infocont.object.interest_arrear[ ll_chkrow ]
//			lds_slipadjdet.object.bfintarrset_amt[ ll_nwrow ]			= ids_infocont.object.intyear_arrear[ ll_chkrow ]
//			lds_slipadjdet.object.bflastcalint_date[ ll_nwrow ]			= ids_infocont.object.lastcalint_date[ ll_chkrow ]
//			lds_slipadjdet.object.bflastproc_date[ ll_nwrow ]			= ids_infocont.object.lastprocess_date[ ll_chkrow ]
//			lds_slipadjdet.object.bflastpay_date[ ll_nwrow ]			= ids_infocont.object.lastpayment_date[ ll_chkrow ]
//			lds_slipadjdet.object.bfshrcont_balamt[ ll_nwrow ]		= ids_infocont.object.principal_balance[ ll_chkrow ]
//			lds_slipadjdet.object.bfshrcont_status[ ll_nwrow ]			= ids_infocont.object.contract_status[ ll_chkrow ]
//			lds_slipadjdet.object.bfcontlaw_status[ ll_nwrow ]			= ids_infocont.object.contlaw_status[ ll_chkrow ]
//			
//			lds_slipadjdet.setitem( ll_nwrow, "slipitemtype_code", ls_slipitemtype )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_prnamt", ldc_prnpay )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_intamt", ldc_intpay )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_intarramt", ldc_intarrpay )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_itemamt", ldc_itempay )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_prnamt", ldc_prnadj )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_intamt", ldc_intadj )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_intarramt", ldc_intarradj )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_itemamt", ldc_itemadj )
//			lds_slipadjdet.setitem( ll_nwrow, "sign_flag", 1 )
//			
//		case else
//			ldc_itempay		= lds_mthpay.getitemdecimal( ll_index, "item_payment" )
//			ldc_itemadj		= lds_mthpay.getitemdecimal( ll_index, "adjust_itemamt" )
//			
//			if isnull( ldc_itempay ) then ldc_itempay = 0
//			if isnull( ldc_itemadj ) then ldc_itemadj = 0
//			
//			lds_slipadjdet.setitem( ll_nwrow, "slipitemtype_code", ls_keeptype )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_itemamt", ldc_itempay )
//			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_itemamt", ldc_itemadj )
//			lds_slipadjdet.setitem( ll_nwrow, "sign_flag", 1 )
//	end choose
//
//next
//
//if lds_slipadjdet.rowcount() > 0 then
//	ls_xmladjdet	= lds_slipadjdet.describe( "Datawindow.Data.XML" )
//else
//	ls_xmladjdet	= ""
//end if
//	
//return ls_xmladjdet

return 1
end function

public function integer of_save_adjust_monthly (str_keep_adjust astr_keep_adjust) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกรายการรับปรับปรุงเงินต่างๆ เช่นรายการรับปรับปรุงหุ้น รับปรับปรุงหนี้ etc.
</description>

<arguments>  
	astr_keep_adjust.xml_main				String			xml ข้อมุลใบทำรายการปรับปรุงส่วน main
	astr_keep_adjust.xml_detail				String			xml ข้อมุลใบทำรายการปรับปรุงส่วน detail
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO
	Version 2.0 (Initial version) Modified Date 20/9/2010 by Godji
</usage> 
***********************************************************/
string ls_xmlmain , ls_xmldet , ls_adjtype
string ls_adjslipno , ls_slipitemtype , ls_slipitemprior
long ll_index , ll_count , ll_seqno
dec{2} ldc_refslipamt , ldc_sumpayamt
datetime ldtm_entry 

n_ds lds_adj_mth_main , lds_adj_mth_det

ls_xmlmain		= astr_keep_adjust.xml_main
ls_xmldet		= astr_keep_adjust.xml_detail

is_userid			= astr_keep_adjust.cancel_id
idtm_oper		= astr_keep_adjust.operate_date

ldtm_entry		= datetime( today() , now() )

this.of_setsrvdwxmlie( true )

// ดึงข้อมูลค่าคงที่ระบบจัดเก็บ
select		adj_mth_lon_flag
into		:ii_adjmthlonflag
from		kpconstant
where	coop_id		= :is_coopid
using itr_sqlca;
if itr_sqlca.sqlcode <> 0 or isnull( ii_adjmthlonflag ) then ii_adjmthlonflag = 1	// adj_mth_flag สถานะการคืนเงินกู้ 1 แบบตั้งค้างดอกเบี้ยเรียกเก็บ 2 แบบถอดวันที่คิดดอกเบี้ยไม่ตั้งค้าง

lds_adj_mth_main = create n_ds
lds_adj_mth_main.dataobject = "d_kp_adjust_monthly_main"
lds_adj_mth_main.settransobject( itr_sqlca )

lds_adj_mth_det = create n_ds
lds_adj_mth_det.dataobject = "d_kp_adjust_monthly_detail"
lds_adj_mth_det.settransobject( itr_sqlca )

if inv_dwxmliesrv.of_xmlimport( lds_adj_mth_main , ls_xmlmain ) < 1 then
	ithw_exception.text += "~r~nพบขอผิดพลาดในการนำเข้าข้อมูลปรับปรุงใบเสร็จประจำเดือน ( Main )"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

if inv_dwxmliesrv.of_xmlimport( lds_adj_mth_det , ls_xmldet ) < 1 then
	ithw_exception.text += "~r~nพบขอผิดพลาดในการนำเข้าข้อมูลปรับปรุงใบเสร็จประจำเดือน ( Detail )"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
lds_adj_mth_det.setfilter( "operate_flag > 0" )
lds_adj_mth_det.filter()

// ลบพวกไม่ทำรายการทิ้งไป
lds_adj_mth_det.rowsdiscard( 1, lds_adj_mth_det.filteredcount(), filter! )

// ตรวจเช็คจำนวนแถวอีกที
ll_count	= lds_adj_mth_det.rowcount()
if ll_count <= 0 then
	ithw_exception.text += "~r~nไม่พบข้อมุลการทำรายการ"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

ldc_refslipamt	= lds_adj_mth_main.getitemdecimal( 1, "ref_slipamt" )

// ใส่ข้อมูลการปรับปรุงให้ครบถ้วน
this.of_set_adj( lds_adj_mth_det )

// ยอดปรับปรุงทั้งหมด
//ldc_sumpayamt		= dec( lds_adj_mth_det.describe( "evaluate( 'sum( if( operate_flag = 1, item_adjamt * sign_flag, 0 ) for all )', "+string( ll_count )+" )" ) )
ldc_sumpayamt		= dec( lds_adj_mth_det.describe( "evaluate( 'sum( if( operate_flag = 1, item_adjamt , 0 ) for all )', "+string( ll_count )+" )" ) )

// ตรวจสอบการปรับปรุงยอดเกิน
this.of_check_overadj( lds_adj_mth_main , lds_adj_mth_det )

// เรียงตามประเภทรายการ
lds_adj_mth_det.setsort( "slipitemtype_code asc" )
lds_adj_mth_det.sort()

// ขอเลขที่ Slip
this.of_setsrvdoccontrol( true )
ls_adjslipno	= inv_docsrv.of_getnewdocno( is_coopid, "SLSLIPADJUST" )
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ Slip ใน Header
lds_adj_mth_main.setitem( 1, "adjslip_no", ls_adjslipno )
lds_adj_mth_main.setitem( 1, "slip_amt", ldc_sumpayamt )
lds_adj_mth_main.setitem( 1, "entry_date", ldtm_entry )
lds_adj_mth_main.setitem( 1, "coop_id", is_coopid )
lds_adj_mth_main.setitem( 1, "entry_bycoopid", is_coopid )

// ใส่เลขที่ Slip และลำดับที่ใน detail
for ll_index = 1 to ll_count
	ls_slipitemtype		= lds_adj_mth_det.getitemstring( ll_index, "slipitemtype_code" )
	
	if ls_slipitemtype <> ls_slipitemprior then
		ll_seqno			= 0
		ls_slipitemprior	= ls_slipitemtype
	end if

	ll_seqno ++

	lds_adj_mth_det.setitem( ll_index, "adjslip_no", ls_adjslipno )
	lds_adj_mth_det.setitem( ll_index, "seq_no", ll_seqno )
	lds_adj_mth_det.setitem( ll_index, "coop_id", is_coopid )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// ------------------------------------------
// บันทึก Slip
if lds_adj_mth_main.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip Adjust ไม่ได้"
	ithw_exception.text	+= lds_adj_mth_main.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Slip Detail
if lds_adj_mth_det.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip Adjust Detail ไม่ได้"
	ithw_exception.text	+= lds_adj_mth_det.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

ls_adjtype		= lds_adj_mth_main.getitemstring( 1, "adjtype_code" )

// ทำการผ่านรายการ
try
	choose case ls_adjtype
		case "MTH"
			this.of_postslip_adjmth( lds_adj_mth_main, lds_adj_mth_det )
//		case "CPL", "CMN", "INS"
//			this.of_postslip_adjcontract( lds_slipadj, lds_slipadjdet )
//		case "SPL", "SMN"
//			this.of_postslip_adjshare( lds_slipadj, lds_slipadjdet )
	end choose
catch ( Exception lthw_posterr )
	rollback using itr_sqlca ;
	throw lthw_posterr
end try

commit using itr_sqlca ;
//
//astr_lnslip.xml_sliphead	= ls_xmlhead
//astr_lnslip.xml_slipdet	= ls_xmldetail

this.of_setsrvdwxmlie( false )

//string		ls_xmlhead, ls_xmldetail, ls_adjtype, ls_validtext, ls_contno
//string		ls_adjslipno, ls_slipitemtype, ls_slipitemprior, ls_slipitemcode, ls_slipitemdesc
//string		ls_entryid, ls_coopid
//long		ll_index, ll_count, ll_seqno, ll_rowimp, ll_find
//integer	li_signflag
//dec{2}	ldc_sumpayamt, ldc_prnpay, ldc_intpay, ldc_bfprnbal
//dec{2}	ldc_maxprn, ldc_maxint, ldc_adjprn, ldc_adjint, ldc_refslipamt
//datetime	ldtm_entrydate, ldtm_opedate
//n_ds		lds_slipadj, lds_slipadjdet
//
//ls_xmlhead		= astr_lnslip.xml_sliphead
//ls_xmldetail		= astr_lnslip.xml_slipdet
//ls_entryid		= astr_lnslip.entry_id
//ls_coopid		= astr_lnslip.coop_id
//ldtm_entrydate	= datetime( today(), now() )
//
//// Create Datastore
//lds_slipadj		= create n_ds
//lds_slipadj.dataobject		= "d_loansrv_lnadjust_slip"
//lds_slipadj.settransobject( itr_sqlca )
//
//lds_slipadjdet	= create n_ds
//lds_slipadjdet.dataobject		= "d_loansrv_lnadjust_slipdet"
//lds_slipadjdet.settransobject( itr_sqlca )
//
//// Import หัว slip
//ll_rowimp	= inv_dwxmliesrv.of_xmlimport( lds_slipadj, ls_xmlhead )
//if ll_rowimp = 0 then
//	ithw_exception.text	= "ไม่มีข้อมูลการปรับปรุง ( SlipAdjust Head ) สำหรับทำรายการ"
//	throw ithw_exception
//end if
//	
//// Import รายละเอียดการปรับปรุง
//ll_rowimp	= inv_dwxmliesrv.of_xmlimport( lds_slipadjdet, ls_xmldetail )
//if ll_rowimp = 0 then
//	ithw_exception.text	= "ไม่มีข้อมูลรายละเอียดการปรับปรุง ( SlipAdjust Detail ) สำหรับทำรายการ"
//	throw ithw_exception
//end if
//
//// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
//lds_slipadjdet.setfilter( "operate_flag > 0" )
//lds_slipadjdet.filter()
//
//// ลบพวกไม่ทำรายการทิ้งไป
//lds_slipadjdet.rowsdiscard( 1, lds_slipadjdet.filteredcount(), filter! )
//
//// ตรวจเช็คจำนวนแถวอีกที
//ll_count	= lds_slipadjdet.rowcount()
//if ll_count <= 0 then
//	return 0
//end if
//
//ls_adjtype		= lds_slipadj.getitemstring( 1, "adjtype_code" )
//ldc_refslipamt	= lds_slipadj.getitemdecimal( 1, "ref_slipamt" )
//
//// ใส่ข้อมูลการปรับปรุงให้ครบถ้วน
//for ll_index = 1 to ll_count
//	ls_slipitemcode		= lds_slipadjdet.getitemstring( ll_index, "slipitemtype_code" )
//	li_signflag			= lds_slipadjdet.getitemnumber( ll_index, "sign_flag" )
//	
//	choose case ls_slipitemcode
//		case "LON", "INF"
//			ldc_prnpay	= lds_slipadjdet.getitemdecimal( ll_index, "principal_adjamt" )
//			ldc_intpay	= lds_slipadjdet.getitemdecimal( ll_index, "interest_adjamt" )
//			ldc_bfprnbal	= lds_slipadjdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
//			
//			if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
//			if isnull( ldc_intpay ) then ldc_intpay = 0
//			
//			lds_slipadjdet.setitem( ll_index, "item_adjamt", ldc_prnpay + ldc_intpay )
//			lds_slipadjdet.setitem( ll_index, "item_balance", ldc_bfprnbal + ( ldc_prnpay * li_signflag ) )
//			
//		case "SHR"
//			ldc_prnpay	= lds_slipadjdet.getitemdecimal( ll_index, "principal_adjamt" )
//			lds_slipadjdet.setitem( ll_index, "item_adjamt", ldc_prnpay )
//			
//			ldc_bfprnbal	= lds_slipadjdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
//			
//			lds_slipadjdet.setitem( ll_index, "item_balance", ldc_bfprnbal + ( ldc_prnpay * li_signflag ) )
//	end choose
//next
//
//// ยอดปรับปรุงทั้งหมด
//ldc_sumpayamt		= dec( lds_slipadjdet.describe( "evaluate( 'sum( if( operate_flag = 1, item_adjamt * slipsign_flag, 0 ) for all )', "+string( ll_count )+" )" ) )
//
//// Validate การปรับปรุง
//ls_adjtype		= lds_slipadj.getitemstring( 1, "adjtype_code" )
//
//choose case ls_adjtype
//	case "MTH"
//		// ค้นหาการปรับยอดเกินยอดของหนี้
//		ls_validtext	= "( ( principal_adjamt > ( bfmthpay_prnamt - bfmthadj_prnamt ) ) or ( interest_adjamt > ( bfmthpay_intamt - bfmthadj_intamt ) ) or "
//		ls_validtext	+= "( intarrear_adjamt > ( bfmthpay_intarramt - bfmthadj_intarramt ) ) ) and ( slipitemtype_code = 'LON' )"
//		
//		ll_find		= lds_slipadjdet.find( ls_validtext, 1, ll_count )
//		if ll_find > 0 then
//			ls_contno	= lds_slipadjdet.getitemstring( ll_find, "loancontract_no" )
//			ldc_maxprn	= lds_slipadjdet.getitemdecimal( ll_find, "bfmthpay_prnamt" )
//			ldc_maxint	= lds_slipadjdet.getitemdecimal( ll_find, "bfmthpay_intamt" )
//			ldc_adjprn	= lds_slipadjdet.getitemdecimal( ll_find, "bfmthadj_prnamt" )
//			ldc_adjint	= lds_slipadjdet.getitemdecimal( ll_find, "bfmthadj_intamt" )
//			
//			ldc_maxprn	= ldc_maxprn - ldc_adjprn
//			ldc_maxint	= ldc_maxint - ldc_adjint
//			
//			if ldc_maxprn < 0 then ldc_maxprn = 0
//			if ldc_maxint < 0 then ldc_maxint = 0
//			
//			ithw_exception.text	= "มีการปรับปรุงเกินยอดที่จะปรับปรุงได้ สัญญา "+ls_contno+&
//											"~nต้นเงินที่ปรับปรุงได้ = "+string( ldc_maxprn, "#,##0.00" )+&
//											"~nดอกเบี้ยที่ปรับปรุงได้ = "+string( ldc_maxint, "#,##0.00" )+&
//											"~nกรุณาตรวจสอบ"
//			throw ithw_exception
//		end if
//		
//		// ค้นหาการปรับยอดเกินยอดของรายการทั่วๆไป
//		ls_validtext	= "( item_adjamt > ( bfmthpay_itemamt - bfmthadj_itemamt ) ) and ( slipitemtype_code <> 'LON' )"
//		
//		ll_find		= lds_slipadjdet.find( ls_validtext, 1, ll_count )
//		if ll_find > 0 then
//			ls_slipitemtype	= lds_slipadjdet.getitemstring( ll_find, "slipitemtype_code" )
//			ls_slipitemdesc	= lds_slipadjdet.getitemstring( ll_find, "slipitem_desc" )
//			ldc_maxprn		= lds_slipadjdet.getitemdecimal( ll_find, "bfmthpay_itemamt" )
//			ldc_adjprn		= lds_slipadjdet.getitemdecimal( ll_find, "bfmthadj_itemamt" )
//			
//			ldc_maxprn	= ldc_maxprn - ldc_adjprn
//			if ldc_maxprn < 0 then ldc_maxprn = 0
//			
//			ithw_exception.text	= "มีการปรับปรุงเกินยอดที่จะปรับปรุงได้ รหัสรายการ "+ls_slipitemtype+&
//											"~nยอดเงินที่ปรับปรุงได้ = "+string( ldc_maxprn, "#,##0.00" )+&
//											"~nกรุณาตรวจสอบ"
//			throw ithw_exception
//		end if
//
//		// ถ้ายอดปรับปรุงเป็นยอดทั้งหมดของรายเดือน
//		if ldc_refslipamt = ldc_sumpayamt then
//			lds_slipadj.setitem( 1, "slipretall_flag", 1 )
//		elseif ldc_refslipamt > ldc_sumpayamt then
//			lds_slipadj.setitem( 1, "slipretall_flag", 0 )
//		else
//			ithw_exception.text	= "ยอดคืนใบเสร็จมียอดมากกว่ายอดเงินในใบเสร็จ กรุณาตรวจสอบ"
//			throw ithw_exception
//		end if
//	
//end choose
//
//// เรียงตามประเภทรายการ
//lds_slipadjdet.setsort( "slipitemtype_code asc" )
//lds_slipadjdet.sort()
//
//// ขอเลขที่ Slip
//this.of_setsrvdoccontrol( true )
//ls_adjslipno	= inv_docsrv.of_getnewdocno( ls_coopid, "SLSLIPADJUST" )
//this.of_setsrvdoccontrol( false )
//
//// ใส่เลขที่ Slip ใน Header
//lds_slipadj.setitem( 1, "adjslip_no", ls_adjslipno )
//lds_slipadj.setitem( 1, "slip_amt", ldc_sumpayamt )
//lds_slipadj.setitem( 1, "entry_id", ls_entryid )
//lds_slipadj.setitem( 1, "entry_date", ldtm_entrydate )
//lds_slipadj.setitem( 1, "coop_id", ls_coopid )
//
//// ใส่เลขที่ Slip และลำดับที่ใน detail
//for ll_index = 1 to ll_count
//	ls_slipitemtype		= lds_slipadjdet.getitemstring( ll_index, "slipitemtype_code" )
//	
//	if ls_slipitemtype <> ls_slipitemprior then
//		ll_seqno			= 0
//		ls_slipitemprior	= ls_slipitemtype
//	end if
//	
//	ll_seqno ++
//	
//	lds_slipadjdet.setitem( ll_index, "adjslip_no", ls_adjslipno )
//	lds_slipadjdet.setitem( ll_index, "seq_no", ll_seqno )
//next
//
//// ------------------------------------------
//// เริ่มกระบวนการบันทึกและผ่านรายการ
//// ------------------------------------------
//// บันทึก Slip
//if lds_slipadj.update() <> 1 then
//	ithw_exception.text	= "บันทึกข้อมูล Slip Adjust ไม่ได้"
//	ithw_exception.text	+= lds_slipadj.of_geterrormessage()
//	rollback using itr_sqlca ;
//	throw ithw_exception
//end if
//
//// บันทึก Slip Detail
//if lds_slipadjdet.update() <> 1 then
//	ithw_exception.text	= "บันทึกข้อมูล Slip Adjust Detail ไม่ได้"
//	ithw_exception.text	+= lds_slipadjdet.of_geterrormessage()
//	rollback using itr_sqlca ;
//	throw ithw_exception
//end if
//
//// มีการปรับปรุงข้อมูลเลยต้อง export เป็น xml อีกทีเพื่อส่งไปเป็นรายละเอียดประกอบการตัดยอดหุ้นหนี้
//ls_xmlhead		= inv_dwxmliesrv.of_xmlexport( lds_slipadj )
//ls_xmldetail		= inv_dwxmliesrv.of_xmlexport( lds_slipadjdet )
//
//// ทำการผ่านรายการ
//try
//	choose case ls_adjtype
//		case "MTH"
//			this.of_postslip_adjmth( lds_slipadj, lds_slipadjdet )
//		case "CPL", "CMN", "INS"
//			this.of_postslip_adjcontract( lds_slipadj, lds_slipadjdet )
//		case "SPL", "SMN"
//			this.of_postslip_adjshare( lds_slipadj, lds_slipadjdet )
//	end choose
//catch ( Exception lthw_posterr )
//	rollback using itr_sqlca ;
//	throw lthw_posterr
//end try
//
//commit using itr_sqlca ;
//
//astr_lnslip.xml_sliphead	= ls_xmlhead
//astr_lnslip.xml_slipdet	= ls_xmldetail

return 1
end function

public function integer of_save_adjust_monthly_prc_option (str_keep_adjust astr_keep_adjust) throws Exception;string ls_xmloption , ls_proctext
string ls_sqlext , ls_sql
integer li_proctype
boolean lb_err = false
n_ds lds_xmloption

inv_progress.istr_progress.progress_text = "ประมวลผลยกเลิกใบเสร็จประจำเดือน"
inv_progress.istr_progress.progress_index = 0
inv_progress.istr_progress.progress_max = 1
inv_progress.istr_progress.subprogress_text = "เตรียมข้อมูล"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 1
inv_progress.istr_progress.status = 8

this.of_setsrvdoccontrol( true )
this.of_setsrvdwxmlie( true )
this.of_setsrvproc( true )

lds_xmloption = create n_ds
lds_xmloption.dataobject = "d_kp_adjust_monthly_prc_option"
lds_xmloption.settransobject( itr_sqlca )

ls_xmloption		= astr_keep_adjust.xml_option

is_userid			= astr_keep_adjust.cancel_id
idtm_oper		= astr_keep_adjust.operate_date

//select coop_id , kpslip_no
//from kpreceiveexpense
//where memcoop_id = '001001'
//and member_no = '00000054'
//and recv_period = '255602'
//group by coop_id , kpslip_no
//;

////** เฉพาะกิจทำไปก่อน
//lds_xmloption.importstring( XML!, ls_xmloption )
if inv_dwxmliesrv.of_xmlimport( lds_xmloption , ls_xmloption ) < 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการนำเข้าข้อมูล(0.1)"
	ithw_exception.text += "~r~nเงื่อนไขประมวลยกเลิกใบเสร็จประจำเดือน"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ls_proctext	= lds_xmloption.object.proc_text[1]
li_proctype	= lds_xmloption.object.proc_type[1]

// กำหนดค่าที่เตรียมประมวล
try
	inv_procsrv.of_set_proctype( li_proctype ) // กำหนดวิธีดึงข้อมูล 60 ดึงข้อมูลตามทะเบียนสมาชิก
	inv_procsrv.of_set_txtproc( ls_proctext ) // ใส่ค่าที่ดึงข้อมูล
	inv_procsrv.of_set_analyze() // gen ข้อมูลในการดึง
//	inv_procsrv.of_set_sqlselect( "kptempreceivedet") // set ค่าที่ gen ลงในตารางที่เลือก
//	inv_procsrv.of_get_sqlselect( ls_sqlselectkd )
//	inv_procsrv.of_set_sqlselect( "kpmastreceivedet") // set ค่าที่ gen ลงในตารางที่เลือก
//	inv_procsrv.of_get_sqlselect( ls_sqlselectkm )
catch( Exception lthw_chklock )
	ithw_exception.text	= "~r~nพบขอผิดพลาด (0.2)"
	ithw_exception.text	+= lthw_chklock.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	lb_err = true
end try
if lb_err then Goto objdestroy

//ผ่านรายการยกเลิกตัดยอด
inv_progress.istr_progress.subprogress_text = "ประมวลผลปรับปรุงชำระประจำเดือน"
inv_progress.istr_progress.subprogress_index = 1
try
	this.of_post_adjust_monthly_prc_postadjust( lds_xmloption )
catch( Exception lthw_postadjust )
	ithw_exception.text	= "~r~nพบขอผิดพลาด (30.1)" + lthw_postadjust.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	lb_err = true
end try
if lb_err then Goto objdestroy

objdestroy:
if isvalid(lds_xmloption) then destroy lds_xmloption

this.of_setsrvdoccontrol( false )
this.of_setsrvdwxmlie( false )
this.of_setsrvproc( false )

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_keeping_adjust_monthly.of_save_adjust_monthly_prc_option()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

inv_progress.istr_progress.status = 1

return 1
end function

public function integer of_init_ccl_keep (ref str_keep_adjust astr_keep_adjust) throws Exception;boolean	lb_err = false

n_ds lds_cclmain , lds_ccldetail

this.of_setsrvdwxmlie( true )

lds_cclmain = create n_ds
lds_cclmain.dataobject = "d_kp_adjust_ccl_kptp_main"
lds_cclmain.settransobject( itr_sqlca )

lds_ccldetail = create n_ds
lds_ccldetail.dataobject = "d_kp_adjust_ccl_kptp_detail"
lds_ccldetail.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( false )

astr_keep_adjust.xml_main	= inv_dwxmliesrv.of_xmlexport( lds_cclmain )
astr_keep_adjust.xml_detail	= inv_dwxmliesrv.of_xmlexport( lds_ccldetail )

//objdestroy:
this.of_setsrvdwxmlie( false )

if isvalid(lds_cclmain) then destroy lds_cclmain
if isvalid(lds_ccldetail) then destroy lds_ccldetail

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_keeping_adjust_monthly.of_init_ccl_keep()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

public function integer of_init_adjust_monthly_prc_option (ref str_keep_adjust astr_keep_adjust) throws Exception;string ls_xmloption , ls_proctext
//string ls_column , ls_tag , ls_columntyp , ls_value
string ls_coop , ls_recv , ls_sqlselect
string ls_sqlext , ls_sql
integer li_num_cols , li_index
integer li_proctype
integer li_year , li_mth
datetime ldtm_date
boolean lb_err = false
n_ds lds_xmloption , lds_xmlrpt

this.of_setsrvdwxmlie( true )
this.of_setsrvproc( true )

lds_xmloption = create n_ds
lds_xmloption.dataobject = "d_kp_adjust_monthly_prc_option"
lds_xmloption.settransobject( itr_sqlca )

lds_xmlrpt = create n_ds
lds_xmlrpt.dataobject = "d_kp_adjust_monthly_prc_rpt_sum"
lds_xmlrpt.settransobject( itr_sqlca )

ls_xmloption		= astr_keep_adjust.xml_option

////** เฉพาะกิจทำไปก่อน
//lds_xmloption.importstring( XML!, ls_xmloption )
if inv_dwxmliesrv.of_xmlimport( lds_xmloption , ls_xmloption ) < 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการนำเข้าข้อมูล(0.1)"
	ithw_exception.text += "~r~nเงื่อนไขประมวลยกเลิกใบเสร็จประจำเดือน"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

//li_num_cols 	= Integer (lds_xmloption.Describe ( "DataWindow.Column.Count" )) 
//
//for li_index = 1 to li_num_cols
//	ls_column 		= trim(lds_xmloption.Describe ( "#" + String(li_index) + ".Name" ))
//	ls_tag				= trim(lds_xmloption.Describe ( "#" + String(li_index) + ".Tag" ))
//	ls_columntyp	= upper( left( lds_xmloption.Describe ( "#" + String(li_index) + ".ColType" ) , 4 ) )
//	choose case ls_columntyp
//		case "CHAR"
//			if lower( right( ls_column , 4 ) ) = "date" or lower( trim( ls_column ) ) = "ordertype_code" then continue ;// หมายเหตุ เป็นวันที่ให้ข้ามไป ให้ใช้จาก Type DateTime
//			ls_value		= lds_xmloption.getitemstring( 1 , ls_column )
//			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
//			ls_value		= "'"+ ls_value + "'"
//		case "DECI"
//			ls_value		= string( lds_xmloption.getitemdecimal( 1 , ls_column ) )
//			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
//			ls_value		= "'"+ ls_value + "'"
//		case "DATE"
//			ldtm_date	= lds_xmloption.getitemdatetime( 1 , ls_column )
//			if isnull( ldtm_date ) then continue ;
//			ls_value		= string( ldtm_date , "dd/mm/yyyy" )
//			ls_value		= "to_date( '" + ls_value + "' , 'dd/mm/yyyy' ) "
//	end choose
//	
//	if (not IsNull(ls_value)) and trim(ls_value) <> "" then ls_sqlext += " and " + ls_tag + " '" + ls_value + "' "
//	
//next

ls_coop		= lds_xmloption.object.coop_id[1]
ls_proctext	= lds_xmloption.object.proc_text[1]
li_proctype	= lds_xmloption.object.proc_type[1]
li_year 		= lds_xmloption.object.receive_year[1]
li_mth			= lds_xmloption.object.receive_month[1]
ls_recv		= string( li_year ) + string( li_mth , "00" )

// กำหนดค่าที่เตรียมประมวล
try
	inv_procsrv.of_set_proctype( li_proctype ) // กำหนดวิธีดึงข้อมูล 60 ดึงข้อมูลตามทะเบียนสมาชิก
	inv_procsrv.of_set_txtproc( ls_proctext ) // ใส่ค่าที่ดึงข้อมูล
	inv_procsrv.of_set_analyze() // gen ข้อมูลในการดึง
	inv_procsrv.of_set_sqlselect( "kpmastreceive") // set ค่าที่ gen ลงในตารางที่เลือก
	inv_procsrv.of_get_sqlselect( ls_sqlselect )
//	inv_procsrv.of_set_sqlselect( "kpmastreceivedet") // set ค่าที่ gen ลงในตารางที่เลือก
//	inv_procsrv.of_get_sqlselect( ls_sqlselectkm )
catch( Exception lthw_chklock )
	ithw_exception.text	= "~r~nพบขอผิดพลาด (0.3)"
	ithw_exception.text	+= lthw_chklock.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	lb_err = true
end try
if lb_err then Goto objdestroy

//ls_sql		= " select sum( item_payment ) as item_payment "
//ls_sql		+= " from ( "
//ls_sql		+= " 	select item_payment "
//ls_sql		+= " 	from kptempreceivedet "
//ls_sql		+= " 	where coop_id = '" + ls_coop + "'"
//ls_sql		+= "  and recv_period = '" + ls_recv + "'"
//ls_sql		+= "  and posting_status = 0 "
//ls_sql		+= ls_sqlselectkd
//ls_sql		+= " 	union "
//ls_sql		+= " 	select item_payment "
//ls_sql		+= " 	from kpmastreceivedet "
//ls_sql		+= " 	where coop_id = '" + ls_coop + "'"
//ls_sql		+= "  and recv_period = '" + ls_recv + "'"
//ls_sql		+= " 	and keepitem_status = 1 "
//ls_sql		+= ls_sqlselectkm
//ls_sql		+= " ) "

ls_sql		+= " select kpreceiveexpense.item_payment "
ls_sql		+= " from kpreceiveexpense , kpmastreceive "
ls_sql		+= " where kpreceiveexpense.coop_id = kpmastreceive.coop_id "
ls_sql		+= " and kpreceiveexpense.kpslip_no = kpmastreceive.kpslip_no "
ls_sql		+= " and kpmastreceive.coop_id = '" + ls_coop + "'"
ls_sql		+= " and kpmastreceive.recv_period = '" + ls_recv + "'"
ls_sql		+= " and kpmastreceive.keeping_status > 0 "
ls_sql		+= " and kpreceiveexpense.post_status < 0 "
ls_sql		+= " and kpreceiveexpense.moneyenough_flag = 1 "
ls_sql		+= ls_sqlselect

if lds_xmlrpt.setsqlselect( ls_sql ) <> 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการนำเข้าข้อมูล(0.1)"
	ithw_exception.text += "~r~nเงื่อนไขการดึงข้อมูลรายงานสรุปยอดยกเลิกใบเสร็จประจำเดือน"
	ithw_exception.text += "~r~n" + lds_xmlrpt.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

if lds_xmlrpt.retrieve() < 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการดึงข้อมูล(0.2)"
	ithw_exception.text += "~r~nไม่พบข้อมูลรายงานสรุปยอดยกเลิกใบเสร็จประจำเดือน"
	ithw_exception.text += "~r~n" + lds_xmlrpt.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

astr_keep_adjust.xml_option				= inv_dwxmliesrv.of_xmlexport( lds_xmloption )
astr_keep_adjust.xml_report_summary	= inv_dwxmliesrv.of_xmlexport( lds_xmlrpt )

objdestroy:
if isvalid(lds_xmloption) then destroy lds_xmloption
if isvalid(lds_xmlrpt) then destroy lds_xmlrpt

this.of_setsrvdwxmlie( false )
this.of_setsrvproc( false )

if lb_err then
	astr_keep_adjust.xml_option				= ""
	astr_keep_adjust.xml_report_summary	= ""
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_keeping_adjust_monthly.of_init_adjust_monthly_prc_option()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

public function integer of_init_kptp_ccl (ref str_keep_adjust astr_keep_adjust) throws Exception;string ls_memcoop , ls_memno
boolean	lb_err = false

n_ds lds_kp_main , lds_kp_list , lds_kp_det_main , lds_kp_det_detail

this.of_setsrvdwxmlie( true )
this.of_setsrvproc( true )

lds_kp_main = create n_ds
lds_kp_main.dataobject = "d_kp_adjust_ccl_kptp_main"
lds_kp_main.settransobject( itr_sqlca )

lds_kp_list = create n_ds
lds_kp_list.dataobject = "d_kp_adjust_ccl_kptp_list"
lds_kp_list.settransobject( itr_sqlca )

lds_kp_det_main = create n_ds
lds_kp_det_main.dataobject = "d_kp_adjust_ccl_kptp_det_main"
lds_kp_det_main.settransobject( itr_sqlca )

lds_kp_det_detail = create n_ds
lds_kp_det_detail.dataobject = "d_kp_adjust_ccl_kptp_det_detail"
lds_kp_det_detail.settransobject( itr_sqlca )

if inv_dwxmliesrv.of_xmlimport( lds_kp_main , astr_keep_adjust.xml_main ) < 1 then
	ithw_exception.text += "~r~nพบขอผิดพลาดในการนำเข้าข้อมูลยกเลิกกระดาษทำการ(0.1)"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ls_memcoop 	= lds_kp_main.object.coop_id[1]
ls_memno		= lds_kp_main.object.member_no[1]

// กำหนดค่าที่เตรียมประมวล
try
	inv_procsrv.of_set_sqldw_column( lds_kp_main , " and mbmembmaster.coop_id = '" + ls_memcoop + "'" )
	inv_procsrv.of_set_sqldw_column( lds_kp_main , " and mbmembmaster.member_no = '" + ls_memno + "'" )
	inv_procsrv.of_set_sqldw_column( lds_kp_list , " where kptempreceive.memcoop_id = '" + ls_memcoop + "'" )
	inv_procsrv.of_set_sqldw_column( lds_kp_list , " and kptempreceive.member_no = '" + ls_memno + "'" )
	inv_procsrv.of_set_sqldw_column( lds_kp_det_main , " and kptempreceive.memcoop_id = '" + ls_memcoop + "'" )
	inv_procsrv.of_set_sqldw_column( lds_kp_det_main , " and kptempreceive.member_no = '" + ls_memno + "'" )
	inv_procsrv.of_set_sqldw_column( lds_kp_det_detail , " and exists( select 1 from kptempreceive kr where kr.coop_id = kptempreceivedet.coop_id and kr.kpslip_no = kptempreceivedet.kpslip_no and kr.memcoop_id = '"+ ls_memcoop +"' and kr.member_no = '" + ls_memno + "' ) " )
catch( Exception lthw_chklock )
	ithw_exception.text	= "~r~nพบขอผิดพลาด (0.2)"
	ithw_exception.text	+= lthw_chklock.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	lb_err = true
end try
if lb_err then Goto objdestroy

lds_kp_main.retrieve()
lds_kp_list.retrieve()
lds_kp_det_main.retrieve()
lds_kp_det_detail.retrieve()

astr_keep_adjust.xml_main			= inv_dwxmliesrv.of_xmlexport( lds_kp_main )
astr_keep_adjust.xml_list			= inv_dwxmliesrv.of_xmlexport( lds_kp_list )
astr_keep_adjust.xml_det_main	= inv_dwxmliesrv.of_xmlexport( lds_kp_det_main )
astr_keep_adjust.xml_det_detail	= inv_dwxmliesrv.of_xmlexport( lds_kp_det_detail )

objdestroy:
this.of_setsrvdwxmlie( false )
this.of_setsrvproc( false )

if isvalid(lds_kp_main) then destroy lds_kp_main
if isvalid(lds_kp_list) then destroy lds_kp_list
if isvalid(lds_kp_det_main) then destroy lds_kp_det_main
if isvalid(lds_kp_det_detail) then destroy lds_kp_det_detail

if lb_err then
	ithw_exception.text = "n_cst_keeping_adjust_monthly.of_init_kptp_ccl()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

public function integer of_save_kptp_ccl (ref str_keep_adjust astr_keep_adjust) throws Exception;string ls_coopid , ls_kpslip , ls_memcoop , ls_memno
string ls_kpitemgrp , ls_bizzcoop , ls_contno , ls_cancelid
integer li_seqno , li_kpstatus , li_bfkpstatus
integer li_index , li_count
dec{2} ldc_prin , ldc_int , ldc_item
datetime ldtm_cancel
boolean	lb_err = false

n_ds lds_kp_main , lds_kp_det_main , lds_kp_det_detail

this.of_setsrvdwxmlie( true )

idtm_oper	= astr_keep_adjust.operate_date

lds_kp_main = create n_ds
lds_kp_main.dataobject = "d_kp_adjust_ccl_kptp_main"
lds_kp_main.settransobject( itr_sqlca )

lds_kp_det_main = create n_ds
lds_kp_det_main.dataobject = "d_kp_adjust_ccl_kptp_det_main"
lds_kp_det_main.settransobject( itr_sqlca )

lds_kp_det_detail = create n_ds
lds_kp_det_detail.dataobject = "d_kp_adjust_ccl_kptp_det_detail"
lds_kp_det_detail.settransobject( itr_sqlca )

if inv_dwxmliesrv.of_xmlimport( lds_kp_main , astr_keep_adjust.xml_main ) < 1 then
	ithw_exception.text += "~r~nพบขอผิดพลาดในการนำเข้าข้อมูลยกเลิกกระดาษทำการ(0.1)"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

if inv_dwxmliesrv.of_xmlimport( lds_kp_det_main , astr_keep_adjust.xml_det_main ) < 1 then
	ithw_exception.text += "~r~nพบขอผิดพลาดในการนำเข้าข้อมูลยกเลิกกระดาษทำการ(0.2)"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

if inv_dwxmliesrv.of_xmlimport( lds_kp_det_detail , astr_keep_adjust.xml_det_detail ) < 1 then
	ithw_exception.text += "~r~nพบขอผิดพลาดในการนำเข้าข้อมูลยกเลิกกระดาษทำการ(0.2)"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ls_memcoop	= lds_kp_main.object.coop_id[1]
ls_memno		= lds_kp_main.object.member_no[1]

// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
lds_kp_det_detail.setfilter( "keeping_status <> bfkeeping_status" )
lds_kp_det_detail.filter()

// ลบพวกไม่ทำรายการทิ้งไป
lds_kp_det_detail.rowsdiscard( 1, lds_kp_det_detail.filteredcount(), filter! )

li_count = lds_kp_det_detail.rowcount()

for li_index = 1 to li_count
	ls_coopid 		= lds_kp_det_detail.object.coop_id[ li_index ]
	ls_kpslip			= lds_kp_det_detail.object.kpslip_no[ li_index ]
	ls_kpitemgrp	= lds_kp_det_detail.object.keepitemtype_grp[ li_index ]
	ls_bizzcoop		= lds_kp_det_detail.object.bizzcoop_id[ li_index ]
	ls_contno		= lds_kp_det_detail.object.loancontract_no[li_index]
	ls_cancelid		= lds_kp_det_detail.object.cancel_id[li_index]
	li_seqno			= lds_kp_det_detail.object.seq_no[ li_index ]
	li_kpstatus		= lds_kp_det_detail.object.keepitem_status[ li_index ]
	li_bfkpstatus		= lds_kp_det_detail.object.bfkeepitem_status[ li_index ]
	ldc_prin 			= lds_kp_det_detail.object.principal_payment[ li_index ]	;if isnull( ldc_prin ) then ldc_prin = 0
	ldc_int 			= lds_kp_det_detail.object.interest_payment[ li_index ]	;if isnull( ldc_int ) then ldc_int = 0
	ldc_item			= lds_kp_det_detail.object.item_payment[ li_index ]		;if isnull( ldc_item ) then ldc_item = 0
	
	if li_kpstatus = -9 then 
		ldc_prin		= 0
		ldc_int		= 0
		ldc_item 		= 0
		ldtm_cancel	= datetime( today() , now() )
	else
		ls_cancelid 	= ""
		setnull( ldtm_cancel )
	end if
	
	choose case ls_kpitemgrp
		case "SHR"
			
			update shsharemaster
			set rkeep_sharevalue		= :ldc_item
			where coop_id				= :ls_memcoop
			and member_no			= :ls_memno
			using itr_sqlca ;
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text += "~r~nพบขอผิดพลาดในการอัพเดทข้อมูลยกเลิกกระดาษทำการ(70.01)"
				ithw_exception.text += "~r~nเลขที่ใบทำรายการ : " + ls_kpslip
				ithw_exception.text += "~r~nเลขสมาชิก : " + ls_memno
				ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode ) + " / " + itr_sqlca.sqlerrtext
				ithw_exception.text += "~r~nกรุณาตรวจสอบ"
				lb_err = true ; Goto objdestroy
			end if
		case "LON"

			update lncontmaster
			set rkeep_principal		= :ldc_prin,
				rkeep_interest		= :ldc_int,
				lastprocess_date	= lastcalint_date
			where coop_id			= :ls_bizzcoop
			and loancontract_no		= :ls_contno
			using itr_sqlca;
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text += "~r~nพบขอผิดพลาดในการอัพเดทข้อมูลยกเลิกกระดาษทำการ(70.02)"
				ithw_exception.text += "~r~nเลขที่ใบทำรายการ : " + ls_kpslip
				ithw_exception.text += "~r~nเลขสมาชิก : " + ls_memno
				ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode ) + " / " + itr_sqlca.sqlerrtext
				ithw_exception.text += "~r~nกรุณาตรวจสอบ"
				lb_err = true ; Goto objdestroy
			end if
	end choose
	
	update kptempreceivedet
	set keepitem_status 	= :li_kpstatus ,
	cancel_id					= :ls_cancelid ,
	cancel_date				= :idtm_oper
	where coop_id			= :ls_coopid
	and kpslip_no			= :ls_kpslip
	and seq_no				= :li_seqno
	and keepitem_status	= :li_bfkpstatus
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "~r~nพบขอผิดพลาดในการอัพเดทข้อมูลยกเลิกกระดาษทำการ(70.1)"
		ithw_exception.text += "~r~nเลขที่ใบทำรายการ : " + ls_kpslip
		ithw_exception.text += "~r~nเลขสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode ) + " / " + itr_sqlca.sqlerrtext
		ithw_exception.text += "~r~nกรุณาตรวจสอบ"
		lb_err = true ; Goto objdestroy
	end if
	
next

// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
lds_kp_det_main.setfilter( "keeping_status <> bfkeeping_status" )
lds_kp_det_main.filter()

// ลบพวกไม่ทำรายการทิ้งไป
lds_kp_det_main.rowsdiscard( 1, lds_kp_det_main.filteredcount(), filter! )

li_count = lds_kp_det_main.rowcount()

for li_index = 1 to li_count
	ls_coopid 	= lds_kp_det_main.object.coop_id[ li_index ]
	ls_kpslip		= lds_kp_det_main.object.kpslip_no[ li_index ]
	li_kpstatus	= lds_kp_det_main.object.keeping_status[ li_index ]
	li_bfkpstatus	= lds_kp_det_main.object.bfkeeping_status[ li_index ]
	
	update kptempreceive
	set keeping_status 	= :li_kpstatus
	where coop_id			= :ls_coopid
	and kpslip_no			= :ls_kpslip
	and keeping_status	= :li_bfkpstatus
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "~r~nพบขอผิดพลาดในการอัพเดทข้อมูลยกเลิกกระดาษทำการ(70.2)"
		ithw_exception.text += "~r~nเลขที่ใบทำรายการ : " + ls_kpslip
		ithw_exception.text += "~r~nเลขสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode ) + " / " + itr_sqlca.sqlerrtext
		ithw_exception.text += "~r~nกรุณาตรวจสอบ"
		lb_err = true ; Goto objdestroy
	end if
	
next

objdestroy:
this.of_setsrvdwxmlie( false )

if isvalid(lds_kp_main) then destroy lds_kp_main
if isvalid(lds_kp_det_detail) then destroy lds_kp_det_detail

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_keeping_adjust_monthly.of_save_kptp_ccl()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

protected function integer of_check_overadj (ref n_ds ads_adj_mth_main, ref n_ds ads_adj_mth_det) throws Exception;string	ls_adjtype , ls_validtext
string ls_contno , ls_slipitemtype , ls_slipitemdesc
long ll_find , ll_count
dec{2} ldc_maxprn , ldc_maxint , ldc_adjprn , ldc_adjint
dec{2} ldc_refslipamt , ldc_sumpayamt

// Validate การปรับปรุง
ls_adjtype		= ads_adj_mth_main.getitemstring( 1, "adjtype_code" )
ll_count			= ads_adj_mth_det.rowcount()

//ตรวจสอบการปรับปรุงยอดเกิน
choose case ls_adjtype
	case "MTH"
		// ค้นหาการปรับยอดเกินยอดของหนี้
		ls_validtext	= "( ( principal_adjamt > ( bfmthpay_prnamt - bfmthadj_prnamt ) ) or ( interest_adjamt > ( bfmthpay_intamt - bfmthadj_intamt ) ) or "
		ls_validtext	+= "( intarrear_adjamt > ( bfmthpay_intarramt - bfmthadj_intarramt ) ) ) and ( slipitemtype_code = 'LON' )"
		
		ll_find		= ads_adj_mth_det.find( ls_validtext, 1, ll_count )
		if ll_find > 0 then
			ls_contno	= ads_adj_mth_det.getitemstring( ll_find, "loancontract_no" )
			ldc_maxprn	= ads_adj_mth_det.getitemdecimal( ll_find, "bfmthpay_prnamt" )
			ldc_maxint	= ads_adj_mth_det.getitemdecimal( ll_find, "bfmthpay_intamt" )
			ldc_adjprn	= ads_adj_mth_det.getitemdecimal( ll_find, "bfmthadj_prnamt" )
			ldc_adjint	= ads_adj_mth_det.getitemdecimal( ll_find, "bfmthadj_intamt" )
			
			ldc_maxprn	= ldc_maxprn - ldc_adjprn
			ldc_maxint	= ldc_maxint - ldc_adjint
			
			if ldc_maxprn < 0 then ldc_maxprn = 0
			if ldc_maxint < 0 then ldc_maxint = 0
			
			ithw_exception.text	= "มีการปรับปรุงเกินยอดที่จะปรับปรุงได้ สัญญา "+ls_contno+&
											"~n~rต้นเงินที่ปรับปรุงได้ = "+string( ldc_maxprn, "#,##0.00" )+&
											"~n~rดอกเบี้ยที่ปรับปรุงได้ = "+string( ldc_maxint, "#,##0.00" )+&
											"~n~rกรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		// ค้นหาการปรับยอดเกินยอดของรายการทั่วๆไป
		ls_validtext	= "( item_adjamt > ( bfmthpay_itemamt - bfmthadj_itemamt ) ) and ( slipitemtype_code <> 'LON' )"
		
		ll_find		= ads_adj_mth_det.find( ls_validtext, 1, ll_count )
		if ll_find > 0 then
			ls_slipitemtype	= ads_adj_mth_det.getitemstring( ll_find, "slipitemtype_code" )
			ls_slipitemdesc	= ads_adj_mth_det.getitemstring( ll_find, "slipitem_desc" )
			ldc_maxprn		= ads_adj_mth_det.getitemdecimal( ll_find, "bfmthpay_itemamt" )
			ldc_adjprn		= ads_adj_mth_det.getitemdecimal( ll_find, "bfmthadj_itemamt" )
			
			ldc_maxprn	= ldc_maxprn - ldc_adjprn
			if ldc_maxprn < 0 then ldc_maxprn = 0
			
			ithw_exception.text	= "มีการปรับปรุงเกินยอดที่จะปรับปรุงได้ รหัสรายการ "+ls_slipitemtype+&
											"~n~rยอดเงินที่ปรับปรุงได้ = "+string( ldc_maxprn, "#,##0.00" )+&
											"~n~rกรุณาตรวจสอบ"
			throw ithw_exception
		end if
		//tomy เอาออกก่อน ไม่มียอดให้เช็ค
		// ถ้ายอดปรับปรุงเป็นยอดทั้งหมดของรายเดือน
		//if ldc_refslipamt = ldc_sumpayamt then
			//ads_adj_mth_main.setitem( 1, "slipretall_flag", 1 )
		//elseif ldc_refslipamt > ldc_sumpayamt then
			//ads_adj_mth_main.setitem( 1, "slipretall_flag", 0 )
		//else
			//ithw_exception.text	= "ยอดคืนใบเสร็จมียอดมากกว่ายอดเงินในใบเสร็จ กรุณาตรวจสอบ"
			//throw ithw_exception
		//end if
	
end choose

return 1
end function

public function integer of_init_adjust_monthly (ref str_keep_adjust astr_keep_adjust) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายการปรับปรุงใบเสร็จประจำเดือน
</description>

<arguments>  
	str_keep_adjust.xml_main{Ref}	String		xml หัวใบทำรายการปรับปรุงใบเสร็จประจำเดือน
	str_keep_adjust.xml_detail{Ref}	String		xml รายละเอียดรายการปรับปรุงใบเสร็จประจำเดือน
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO
	Version 2.0 (Initial version) Modified Date 25/05/2012 by Godji
</usage> 
***********************************************************/
string		ls_xmlmain , ls_xmldetail
string		ls_memno, ls_memcoopid, ls_contno, ls_sliptype, ls_refslipno, ls_itemcode, ls_desc, ls_dataxml
long		ll_chkrow , ll_count
dec{2}	ldc_prinbalance , ldc_sumpayamt
datetime	ldtm_opedate, ldtm_slipdate
boolean	lb_err = false

n_ds lds_info_mem , lds_info_lncont
n_ds lds_info_kpmas , lds_info_kpmasdet
n_ds lds_adj_mth_main , lds_adj_mth_det

this.of_setsrvdwxmlie( true )

lds_info_mem = create n_ds
lds_info_mem.dataobject = "d_kp_info_memdetail"
lds_info_mem.settransobject( itr_sqlca )

lds_info_lncont = create n_ds
lds_info_lncont.dataobject = "d_kp_info_loan_contract"
lds_info_lncont.settransobject( itr_sqlca )

lds_info_kpmas = create n_ds
lds_info_kpmas.dataobject = "d_kp_info_kpmast"
lds_info_kpmas.settransobject( itr_sqlca )

lds_info_kpmasdet = create n_ds
lds_info_kpmasdet.dataobject = "d_kp_info_kpmastdet"
lds_info_kpmasdet.settransobject( itr_sqlca )

lds_adj_mth_main = create n_ds
lds_adj_mth_main.dataobject = "d_kp_adjust_monthly_main"
lds_adj_mth_main.settransobject( itr_sqlca )

lds_adj_mth_det = create n_ds
lds_adj_mth_det.dataobject = "d_kp_adjust_monthly_detail"
lds_adj_mth_det.settransobject( itr_sqlca )

ls_xmlmain		= astr_keep_adjust.xml_main

if inv_dwxmliesrv.of_xmlimport( lds_adj_mth_main , ls_xmlmain ) < 1 then
	ithw_exception.text += "~r~nพบขอผิดพลาดในการนำเข้าข้อมูลปรับปรุงใบเสร็จประจำเดือน"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ls_memno		= lds_adj_mth_main.object.member_no[1]
ls_memcoopid	= lds_adj_mth_main.object.memcoop_id[1]
ls_refslipno		= lds_adj_mth_main.object.ref_slipno[1]

ll_chkrow	= lds_info_mem.retrieve( ls_memcoopid , ls_memno )
if ll_chkrow < 1 then
	ithw_exception.text = "ไม่พบข้อมูลทะเบียนสมาชิก : " + ls_memno
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

lds_info_lncont.retrieve( ls_memcoopid , ls_memno )
//ll_chkrow	= lds_info_lncont.retrieve( ls_memcoopid , ls_memno )
//if ll_chkrow < 1 then
//	ithw_exception.text = "ไม่พบข้อมูลทะเบียนสมาชิก : " + ls_memno
//	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
//	throw ithw_exception
//end if

ll_chkrow	= lds_info_kpmas.retrieve( is_coopid , ls_refslipno )
if ll_chkrow < 1 then
	ithw_exception.text = "ไม่พบข้อมูลใบเสร็จประจำเดือน( Main ) : " + ls_refslipno
	ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ll_chkrow	= lds_info_kpmasdet.retrieve( is_coopid , ls_refslipno )
if ll_chkrow < 1 then
	ithw_exception.text = "ไม่พบข้อมูลใบเสร็จประจำเดือน( Detail ) : " + ls_refslipno
	ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

//init main
if this.of_init_adjust_monthly_main( lds_info_mem , lds_info_kpmas , lds_adj_mth_main ) <> 1 then
	lb_err = true ; Goto objdestroy
end if

//init detail
if this.of_init_adjust_monthly_detail( lds_info_lncont , lds_info_kpmasdet , lds_adj_mth_det ) <> 1 then
	lb_err = true ; Goto objdestroy
end if

ll_count				= lds_adj_mth_det.rowcount()
// ยอดปรับปรุงทั้งหมด
//ldc_sumpayamt		= dec( lds_adj_mth_det.describe( "evaluate( 'sum( if( operate_flag = 1, item_adjamt * slipsign_flag, 0 ) for all )', "+string( ll_count )+" )" ) )
ldc_sumpayamt		= dec( lds_adj_mth_det.describe( "evaluate( 'sum( if( operate_flag = 1, item_adjamt , 0 ) for all )', "+string( ll_count )+" )" ) )
lds_adj_mth_main.setitem( 1, "slip_amt", ldc_sumpayamt )

astr_keep_adjust.xml_main	= inv_dwxmliesrv.of_xmlexport( lds_adj_mth_main )
astr_keep_adjust.xml_detail	= inv_dwxmliesrv.of_xmlexport( lds_adj_mth_det )

objdestroy:
this.of_setsrvdwxmlie( false )

if isvalid(lds_info_mem) then destroy lds_info_mem
if isvalid(lds_info_lncont) then destroy lds_info_lncont
if isvalid(lds_info_kpmas) then destroy lds_info_kpmas
if isvalid(lds_info_kpmasdet) then destroy lds_info_kpmasdet
if isvalid(lds_adj_mth_main) then destroy lds_adj_mth_main
if isvalid(lds_adj_mth_det) then destroy lds_adj_mth_det

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_keeping_adjust_monthly.of_init_adjust_monthly()" + ithw_exception.text
	throw ithw_exception
end if

//// ข้อมูลการ init ค่า
//ls_memno		= astr_initadjust.member_no
//ls_memcoopid	= astr_initadjust.memcoop_id
//ls_sliptype		= astr_initadjust.adjtype_code
//ls_refslipno		= astr_initadjust.ref_slipno
//ldtm_slipdate	= astr_initadjust.adjslip_date
//ldtm_opedate	= astr_initadjust.operate_date
//
//// init head
//astr_initadjust.xml_sliphead		= this.of_initslipadjust_head( ls_memcoopid, ls_memno, ls_sliptype, ls_refslipno, ldtm_slipdate, ldtm_opedate )
//
//// init detail
//choose case ls_sliptype
//	case "MTH"
//		astr_initadjust.xml_slipdet	= this.of_initslipadjust_mthpay( ls_refslipno, ls_memcoopid )
//	case "CPL", "CMN", "INS"
//		astr_initadjust.xml_slipdet	= this.of_initslipadjust_loanadj( ls_refslipno, ls_memcoopid, ls_sliptype  )
//	case "SPL", "SMN"
//		astr_initadjust.xml_slipdet	= this.of_initslipadjust_shareadj( ls_memcoopid, ls_memno, ls_sliptype )
//end choose

return 1
end function

protected function integer of_init_adjust_monthly_detail_lon (n_ds ads_info_lncont, n_ds ads_info_kpmasdet, ref n_ds ads_adj_mth_det, long al_row, long al_insrow) throws Exception;string ls_contno , ls_find , ls_bizzcoopid , ls_keeptype , ls_slipitemtype , ls_kpitmtyp
integer li_period
long ll_find , ll_lncont_count
dec{2} ldc_prnpay , ldc_intpay , ldc_intarrpay , ldc_itempay
dec{2} ldc_prnadj , ldc_intadj , ldc_intarradj , ldc_itemadj

ls_contno		= ads_info_kpmasdet.getitemstring( al_row, "loancontract_no" )
ls_bizzcoopid	= ads_info_kpmasdet.getitemstring( al_row, "bizzcoop_id" )
ls_keeptype		= ads_info_kpmasdet.getitemstring( al_row, "keepitemtype_code" )

li_period			= ads_info_kpmasdet.getitemnumber( al_row, "period" )

ldc_prnpay		= ads_info_kpmasdet.getitemdecimal( al_row, "principal_payment" )
ldc_intpay		= ads_info_kpmasdet.getitemdecimal( al_row, "interest_payment" )
ldc_intarrpay	= ads_info_kpmasdet.getitemdecimal( al_row, "intarrear_payment" )
ldc_itempay		= ads_info_kpmasdet.getitemdecimal( al_row, "item_payment" )

ldc_prnadj		= ads_info_kpmasdet.getitemdecimal( al_row, "adjust_prnamt" )
ldc_intadj		= ads_info_kpmasdet.getitemdecimal( al_row, "adjust_intamt" )
ldc_intarradj	= ads_info_kpmasdet.getitemdecimal( al_row, "adjust_intarramt" )
ldc_itemadj		= ads_info_kpmasdet.getitemdecimal( al_row, "adjust_itemamt" )

if isnull( ldc_prnpay ) then ldc_prnpay = 0
if isnull( ldc_intpay ) then ldc_intpay = 0
if isnull( ldc_intarrpay ) then ldc_intarrpay = 0
if isnull( ldc_itempay ) then ldc_itempay = 0

if isnull( ldc_prnadj ) then ldc_prnadj = 0
if isnull( ldc_intadj ) then ldc_intadj = 0
if isnull( ldc_intarradj ) then ldc_intarradj = 0
if isnull( ldc_itemadj ) then ldc_itemadj = 0

ll_lncont_count	= ads_info_lncont.rowcount()

ls_find = " coop_id = '" + ls_bizzcoopid + "' and loancontract_no = '" + ls_contno + "' "
ll_find = ads_info_lncont.find( ls_find , 0 , ll_lncont_count )

if ll_find <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลสัญญาเลขที่ : "+ls_contno
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"
	return -1
end if

if ls_keeptype = "L01" or ls_keeptype = "L02" or ls_keeptype = "L03" then
	ls_slipitemtype		= "LON"
else
	ls_slipitemtype		= ls_keeptype
end if

ads_adj_mth_det.object.principal_adjamt[ al_insrow ]			= ldc_prnpay - ldc_prnadj
ads_adj_mth_det.object.interest_adjamt[ al_insrow ]				= ( ldc_intpay + ldc_intarrpay ) - ( ldc_intadj + ldc_intarrpay )
ads_adj_mth_det.object.item_adjamt[ al_insrow ]					= ldc_itempay - ldc_itemadj
ads_adj_mth_det.object.item_balance[ al_insrow ]				= ads_info_lncont.object.principal_balance[ ll_find ]
//ads_adj_mth_det.object.bfintarr_amt[ al_insrow ]					= ads_info_lncont.object.interest_arrear[ ll_find ]
ads_adj_mth_det.object.bfintarr_amt[ al_insrow ]					= ads_info_kpmasdet.getitemdecimal( al_row, "bfinterest_arrear" )
//ads_adj_mth_det.object.bfintarrset_amt[ al_insrow ]				= ads_info_lncont.object.intyear_arrear[ ll_find ]
ads_adj_mth_det.object.bfintarrset_amt[ al_insrow ]				= ads_info_kpmasdet.getitemdecimal( al_row, "bfintyear_arrear" )
ads_adj_mth_det.object.bflastcalint_date[ al_insrow ]			= ads_info_lncont.object.lastcalint_date[ ll_find ]
ads_adj_mth_det.object.bflastproc_date[ al_insrow ]				= ads_info_lncont.object.lastprocess_date[ ll_find ]
ads_adj_mth_det.object.bflastpay_date[ al_insrow ]				= ads_info_lncont.object.lastpayment_date[ ll_find ]
ads_adj_mth_det.object.bfshrcont_balamt[ al_insrow ]			= ads_info_lncont.object.principal_balance[ ll_find ]
ads_adj_mth_det.object.bfshrcont_status[ al_insrow ]			= ads_info_lncont.object.contract_status[ ll_find ]
ads_adj_mth_det.object.bfcontlaw_status[ al_insrow ]			= ads_info_lncont.object.contlaw_status[ ll_find ]

ads_adj_mth_det.setitem( al_insrow, "operate_flag", 0 )
ads_adj_mth_det.setitem( al_insrow, "slipitemtype_code", ls_slipitemtype )
ads_adj_mth_det.setitem( al_insrow, "periodadj_amt" , li_period )
ads_adj_mth_det.setitem( al_insrow, "bfmthpay_kpitemtyp", ls_keeptype )
ads_adj_mth_det.setitem( al_insrow, "bfmthpay_prnamt", ldc_prnpay )
ads_adj_mth_det.setitem( al_insrow, "bfmthpay_intamt", ldc_intpay )
ads_adj_mth_det.setitem( al_insrow, "bfmthpay_intarramt", ldc_intarrpay )
ads_adj_mth_det.setitem( al_insrow, "bfmthpay_itemamt", ldc_itempay )
ads_adj_mth_det.setitem( al_insrow, "bfmthadj_prnamt", ldc_prnadj )
ads_adj_mth_det.setitem( al_insrow, "bfmthadj_intamt", ldc_intadj )
ads_adj_mth_det.setitem( al_insrow, "bfmthadj_intarramt", ldc_intarradj )
ads_adj_mth_det.setitem( al_insrow, "bfmthadj_itemamt", ldc_itemadj )
ads_adj_mth_det.setitem( al_insrow, "sign_flag", 1 )

return 1
end function

protected function integer of_init_adjust_monthly_detail_shr (n_ds ads_info_kpmasdet, ref n_ds ads_adj_mth_det, long al_row, long al_insrow) throws Exception;string ls_memno , ls_memcoopid , ls_recvperiod , ls_kpitmtyp
integer li_shrstatus , li_period
dec{2} ldc_itempay , ldc_itemadj , ldc_shrstkbal

ls_memno		= ads_info_kpmasdet.getitemstring( al_row, "member_no" )
ls_memcoopid	= ads_info_kpmasdet.getitemstring( al_row, "memcoop_id" )
ls_recvperiod	= ads_info_kpmasdet.getitemstring( al_row, "recv_period" )
ls_kpitmtyp		= ads_info_kpmasdet.getitemstring( al_row, "keepitemtype_code" )

li_period			= ads_info_kpmasdet.getitemnumber( al_row, "period" )

ldc_itempay		= ads_info_kpmasdet.getitemdecimal( al_row, "item_payment" )
ldc_itemadj		= ads_info_kpmasdet.getitemdecimal( al_row, "adjust_itemamt" )

if isnull( ldc_itempay ) then ldc_itempay = 0
if isnull( ldc_itemadj ) then ldc_itemadj = 0

// ต้องดึงค่าใหม่เพราะอาจมีการเปลี่ยนแปลง
select		shsharemaster.sharestk_amt * shsharetype.unitshare_value,
			shsharemaster.sharemaster_status
into		:ldc_shrstkbal, :li_shrstatus
from		shsharemaster, shsharetype
where	( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
			( shsharemaster.coop_id				= shsharetype.coop_id ) and
			( shsharemaster.member_no		= :ls_memno ) and
			( shsharemaster.coop_id				= :is_coopcontrol )
using		itr_sqlca ;

if li_shrstatus < 0 then
	ithw_exception.text	+= "การเรียกเก็บเงินประจำเดือนของทะเบียนสมาชิก : "+ ls_memno 
	ithw_exception.text	+= "~r~nงวดประจำเดือน : " + string( ls_recvperiod , "@@@@/@@" )
	ithw_exception.text	+= "~r~nไม่พบข้อมูลหุ้น"
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"
	return -1
end if

ads_adj_mth_det.object.principal_adjamt[ al_insrow ]			= ldc_itempay - ldc_itemadj
ads_adj_mth_det.object.item_adjamt[ al_insrow ]					= ldc_itempay - ldc_itemadj
ads_adj_mth_det.setitem( al_insrow, "operate_flag", 0 )
ads_adj_mth_det.setitem( al_insrow, "slipitemtype_code", "SHR" )
ads_adj_mth_det.setitem( al_insrow, "bfmthpay_kpitemtyp", ls_kpitmtyp )
ads_adj_mth_det.setitem( al_insrow, "periodadj_amt" , li_period )
ads_adj_mth_det.setitem( al_insrow, "item_balance", ldc_shrstkbal )
ads_adj_mth_det.setitem( al_insrow, "bfshrcont_balamt", ldc_shrstkbal )
ads_adj_mth_det.setitem( al_insrow, "bfshrcont_status", li_shrstatus )
ads_adj_mth_det.setitem( al_insrow, "bfmthpay_itemamt", ldc_itempay )
ads_adj_mth_det.setitem( al_insrow, "bfmthadj_itemamt", ldc_itemadj )
ads_adj_mth_det.setitem( al_insrow, "sign_flag", -1 )

return 1
end function

protected function integer of_post_adjust_monthly_prc_postadjust (n_ds ads_xmloption) throws Exception;string ls_coopid , ls_memcoop , ls_memno
string ls_kpcoop , ls_kpslipno
string ls_xmlmain , ls_xmldet , ls_adjtype , ls_recvperiod
string ls_adjslipno , ls_slipitemtype , ls_slipitemprior , ls_entry
integer li_year , li_mth
long ll_index , ll_count , ll_seqno
long ll_mnindex , ll_mncount
dec{2} ldc_refslipamt , ldc_sumpayamt
datetime ldtm_entry , ldtm_operate
boolean lb_err
n_ds lds_info_mem , lds_info_lncont , lds_info_kpmas , lds_info_kpmasdet
n_ds lds_adj_mth_main , lds_adj_mth_det , lds_adj_mth_info

inv_progress.istr_progress.progress_text		= "ประมวลยกเลิกคืนใบเสร็จประจำเดือน"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 1

// ดึงข้อมูลค่าคงที่ระบบจัดเก็บ
select		adj_mth_lon_flag
into		:ii_adjmthlonflag
from		kpconstant
where	coop_id		= :is_coopid
using itr_sqlca;
if itr_sqlca.sqlcode <> 0 or isnull( ii_adjmthlonflag ) then ii_adjmthlonflag = 1	// adj_mth_flag สถานะการคืนเงินกู้ 1 แบบตั้งค้างดอกเบี้ยเรียกเก็บ 2 แบบถอดวันที่คิดดอกเบี้ยไม่ตั้งค้าง

lds_info_mem = create n_ds
lds_info_mem.dataobject = "d_kp_info_memdetail"
lds_info_mem.settransobject( itr_sqlca )

lds_info_lncont = create n_ds
lds_info_lncont.dataobject = "d_kp_info_loan_contract"
lds_info_lncont.settransobject( itr_sqlca )

lds_info_kpmas = create n_ds
lds_info_kpmas.dataobject = "d_kp_info_kpmast"
lds_info_kpmas.settransobject( itr_sqlca )

lds_info_kpmasdet = create n_ds
lds_info_kpmasdet.dataobject = "d_kp_info_kpmastdet"
lds_info_kpmasdet.settransobject( itr_sqlca )

lds_adj_mth_main = create n_ds
lds_adj_mth_main.dataobject = "d_kp_adjust_monthly_main"
lds_adj_mth_main.settransobject( itr_sqlca )

lds_adj_mth_det = create n_ds
lds_adj_mth_det.dataobject = "d_kp_adjust_monthly_detail"
lds_adj_mth_det.settransobject( itr_sqlca )

lds_adj_mth_info = create n_ds
lds_adj_mth_info.dataobject = "d_kp_adjust_monthly_prc_info"
lds_adj_mth_info.settransobject( itr_sqlca )

//ldc_refslipamt	= lds_adj_mth_main.getitemdecimal( 1, "ref_slipamt" )

ls_coopid			= ads_xmloption.object.coop_id[1]
ls_entry			= ads_xmloption.object.entry_id[1]
li_year			= ads_xmloption.object.receive_year[1]
li_mth				= ads_xmloption.object.receive_month[1]
ldtm_operate	= ads_xmloption.object.operate_date[1]

ls_recvperiod	= string( li_year , "0000" ) + string( li_mth , "00" )

// กำหนดค่าที่เตรียมประมวล
try
	inv_procsrv.of_set_sqlselect( "kpmastreceive" )
	inv_procsrv.of_set_sqldw( lds_adj_mth_info )
	inv_procsrv.of_set_sqldw_column( lds_adj_mth_info , " and kpmastreceive.coop_id = '" + ls_coopid + "'" )
	inv_procsrv.of_set_sqldw_column( lds_adj_mth_info , " and kpmastreceive.recv_period = '" + ls_recvperiod + "'" )
	inv_procsrv.of_set_sqldw_column( lds_adj_mth_info , " and kpmastreceive.keeping_status > 0 " )
	inv_procsrv.of_set_sqldw_column( lds_adj_mth_info , " and kpreceiveexpense.post_status < 0 " )
	inv_procsrv.of_set_sqldw_column( lds_adj_mth_info , " and kpreceiveexpense.moneyenough_flag = 0 " )
catch( Exception lthw_prcadj )
	ithw_exception.text	+= "~r~nพบขอผิดพลาด (0.2)"
	ithw_exception.text	+= lthw_prcadj.text
	lb_err = true
end try
if lb_err then Goto objdestroy

ll_mncount		= lds_adj_mth_info.retrieve()

if ll_mncount < 1 then
	ithw_exception.text	+= "~r~nพบขอผิดพลาด (0.3) "
	ithw_exception.text	+= "~r~nไม่มีข้อมูลการยกเลิก"
	lb_err = true ; Goto objdestroy
end if

inv_progress.istr_progress.subprogress_max	= ll_mncount

for ll_mnindex = 1 to ll_mncount
	
	inv_progress.istr_progress.subprogress_index	= ll_mnindex

	yield()
	if inv_progress.of_is_stop() then
		ithw_exception.text	= "ยกเลิกโดยผู้ใช้"
		lb_err = true ; if lb_err then Goto objdestroy
	end if
	
	ls_kpcoop			= lds_adj_mth_info.object.coop_id[ll_mnindex]
	ls_kpslipno			= lds_adj_mth_info.object.kpslip_no[ll_mnindex]
	ls_memcoop		= lds_adj_mth_info.object.memcoop_id[ll_mnindex]
	ls_memno			= lds_adj_mth_info.object.member_no[ll_mnindex]
	
	lds_info_mem.retrieve( ls_memcoop , ls_memno )
	lds_info_lncont.retrieve( ls_memcoop , ls_memno )
	lds_info_kpmas.retrieve( ls_kpcoop , ls_kpslipno )
	lds_info_kpmasdet.retrieve( ls_kpcoop , ls_kpslipno )
	
	lds_adj_mth_main.reset()
	lds_adj_mth_det.reset()
	lds_adj_mth_main.insertrow(0)
	
	lds_adj_mth_main.object.coop_id[1]				= ls_coopid
	lds_adj_mth_main.object.memcoop_id[1]		= ls_memcoop
	lds_adj_mth_main.object.member_no[1]		= ls_memno
	lds_adj_mth_main.object.adjtype_code[1]		= "MTH"
	lds_adj_mth_main.object.entry_id[1]				= ls_entry
	lds_adj_mth_main.object.slipretcause_code[1]	= "K01"
	lds_adj_mth_main.object.adjust_cause[1]		= "Auto Adjust"
	lds_adj_mth_main.object.operate_date[1]		= ldtm_operate
	lds_adj_mth_main.object.adjslip_date[1]		= ldtm_operate
	
	//init main
	if this.of_init_adjust_monthly_main( lds_info_mem , lds_info_kpmas , lds_adj_mth_main ) <> 1 then
		lb_err = true ; Goto objdestroy
	end if
	
	//init detail
	if this.of_init_adjust_monthly_detail( lds_info_lncont , lds_info_kpmasdet , lds_adj_mth_det ) <> 1 then
		lb_err = true ; Goto objdestroy
	end if
	
	ll_count				= lds_adj_mth_det.rowcount()
	ldc_sumpayamt		= dec( lds_adj_mth_det.describe( "evaluate( 'sum( if( operate_flag = 1, item_adjamt , 0 ) for all )', "+string( ll_count )+" )" ) )
	lds_adj_mth_main.setitem( 1, "slip_amt", ldc_sumpayamt )
	
	// ใส่ข้อมูลการปรับปรุงให้ครบถ้วน
	this.of_set_adj( lds_adj_mth_det )

	// ตรวจสอบการปรับปรุงยอดเกิน
	this.of_check_overadj( lds_adj_mth_main , lds_adj_mth_det )
	
	// เรียงตามประเภทรายการ
	lds_adj_mth_det.setsort( "slipitemtype_code asc" )
	lds_adj_mth_det.sort()
	
	// ขอเลขที่ Slip
	ls_adjslipno	= inv_docsrv.of_getnewdocno( is_coopid, "SLSLIPADJUST" )
	
	// ใส่เลขที่ Slip ใน Header
	lds_adj_mth_main.setitem( 1, "adjslip_no", ls_adjslipno )
	lds_adj_mth_main.setitem( 1, "slip_amt", ldc_sumpayamt )
	lds_adj_mth_main.setitem( 1, "entry_date", datetime( today() , now() ) )
	lds_adj_mth_main.setitem( 1, "coop_id", is_coopid )
	
	// ใส่เลขที่ Slip และลำดับที่ใน detail
	for ll_index = 1 to ll_count
		ls_slipitemtype		= lds_adj_mth_det.getitemstring( ll_index, "slipitemtype_code" )
		
		if ls_slipitemtype <> ls_slipitemprior then
			ll_seqno			= 0
			ls_slipitemprior	= ls_slipitemtype
		end if
	
		ll_seqno ++
	
		lds_adj_mth_det.setitem( ll_index, "adjslip_no", ls_adjslipno )
		lds_adj_mth_det.setitem( ll_index, "seq_no", ll_seqno )
		lds_adj_mth_det.setitem( ll_index, "coop_id", is_coopid )
	next
	
	// ------------------------------------------
	// เริ่มกระบวนการบันทึกและผ่านรายการ
	// ------------------------------------------
	// บันทึก Slip
	if lds_adj_mth_main.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูล Slip Adjust ไม่ได้"
		ithw_exception.text	+= lds_adj_mth_main.of_geterrormessage()
		lb_err = true ; if lb_err then Goto objdestroy
	end if
	
	// บันทึก Slip Detail
	if lds_adj_mth_det.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูล Slip Adjust Detail ไม่ได้"
		ithw_exception.text	+= lds_adj_mth_det.of_geterrormessage()
		lb_err = true ; if lb_err then Goto objdestroy
	end if
	
	ls_adjtype		= lds_adj_mth_main.getitemstring( 1, "adjtype_code" )
	
	// ทำการผ่านรายการ
	try
		choose case ls_adjtype
			case "MTH"
				this.of_postslip_adjmth( lds_adj_mth_main, lds_adj_mth_det )
	//		case "CPL", "CMN", "INS"
	//			this.of_postslip_adjcontract( lds_slipadj, lds_slipadjdet )
	//		case "SPL", "SMN"
	//			this.of_postslip_adjshare( lds_slipadj, lds_slipadjdet )
		end choose
	catch ( Exception lthw_posterr )
		ithw_exception.text	+= lthw_posterr.text
		lb_err = true
	end try
	
	inv_progress.istr_progress.subprogress_text	= string( ll_mnindex , "#,##0" ) + "/" + string( ll_mncount , "#,##0" ) +". เลขสมาชิก "+ls_memno
	
next

objdestroy:
if isvalid(lds_info_mem) then destroy lds_info_mem
if isvalid(lds_info_lncont) then destroy lds_info_lncont
if isvalid(lds_info_kpmas) then destroy lds_info_kpmas
if isvalid(lds_info_kpmasdet) then destroy lds_info_kpmasdet
if isvalid(lds_adj_mth_main) then destroy lds_adj_mth_main
if isvalid(lds_adj_mth_det) then destroy lds_adj_mth_det

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_keeping_adjust_monthly.of_post_adjust_monthly_prc_postadjust()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

protected function integer of_postslip_adjmth (n_ds ads_adj_mth_main, n_ds ads_adj_mth_det) throws Exception;string		ls_memno, ls_refmemno, ls_adjslipno, ls_slipitemcode, ls_adjcause, ls_contno
string		ls_entryid, ls_coopid, ls_refrcvperiod, ls_refdocno , ls_memcoop , ls_concoop
long		ll_index, ll_count, ll_seqno, ll_rowchk
integer	li_mthseqno, li_odflag, li_lastperiod, li_bflastperiod, li_contstatus, li_retallflag, li_signflag
integer	li_keepitemsts
dec{2}	ldc_prnpay, ldc_intpay, ldc_itempay, ldc_intperiod
dec{2}	ldc_bfmthprn, ldc_bfmthint, ldc_bfmthitem, ldc_intretbal
datetime	ldtm_entrydate, ldtm_adjdate, ldtm_refslipdate

// Import รายละเอียดการปรับปรุง
li_retallflag	= 0
ll_count		= ads_adj_mth_det.rowcount()

ls_memcoop		= ads_adj_mth_main.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_adj_mth_main.getitemstring( 1, "member_no" )
ls_adjslipno			= ads_adj_mth_main.getitemstring( 1, "adjslip_no" )
ls_refrcvperiod		= ads_adj_mth_main.getitemstring( 1, "ref_recvperiod" )
ls_refdocno			= ads_adj_mth_main.getitemstring( 1, "ref_slipno" )
ls_adjcause			= ads_adj_mth_main.getitemstring( 1, "adjust_cause" )
li_retallflag			= ads_adj_mth_main.getitemnumber( 1, "slipretall_flag" )
ldtm_refslipdate	= ads_adj_mth_main.getitemdatetime( 1, "ref_slipdate" )
ldtm_adjdate		= ads_adj_mth_main.getitemdatetime( 1, "adjslip_date" )

ls_entryid			= ads_adj_mth_main.getitemstring( 1, "entry_id" )
ls_coopid				= ads_adj_mth_main.getitemstring( 1, "coop_id" )
ldtm_entrydate		= datetime( today(), now() )

// เริ่มการปรับปรุงรายการ
for ll_index = 1 to ll_count
	ls_slipitemcode		= ads_adj_mth_det.getitemstring( ll_index, "slipitemtype_code" )
	ls_concoop			= ads_adj_mth_det.getitemstring( ll_index, "concoop_id" )
	ls_refmemno		= ads_adj_mth_det.getitemstring( ll_index, "bfmthpay_refmembno" )
	li_mthseqno			= ads_adj_mth_det.getitemnumber( ll_index, "bfmthpay_seqno" )
	ldc_prnpay			= ads_adj_mth_det.getitemdecimal( ll_index, "principal_adjamt" )
	ldc_intpay			= ads_adj_mth_det.getitemdecimal( ll_index, "interest_adjamt" )
	ldc_itempay			= ads_adj_mth_det.getitemdecimal( ll_index, "item_adjamt" )
	ldc_bfmthprn		= ads_adj_mth_det.getitemdecimal( ll_index, "bfmthpay_prnamt" )
	ldc_bfmthint			= ads_adj_mth_det.getitemdecimal( ll_index, "bfmthpay_intamt" )
	ldc_bfmthitem		= ads_adj_mth_det.getitemdecimal( ll_index, "bfmthpay_itemamt" )
	
	if isnull( ldc_prnpay ) then ldc_prnpay = 0
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_itempay ) then ldc_itempay = 0
	if isnull( ldc_bfmthprn ) then ldc_bfmthprn = 0
	if isnull( ldc_bfmthint ) then ldc_bfmthint = 0
	if isnull( ldc_bfmthitem ) then ldc_bfmthitem = 0
	
	choose case ls_slipitemcode
		case "SHR"
			// ผ่านรายการหุ้น
			this.of_postslip_adjmth_shr( ads_adj_mth_main , ads_adj_mth_det , ll_index )
			
		case "LON", "IAR"
			this.of_postslip_adjmth_lon( ads_adj_mth_main , ads_adj_mth_det , ll_index )
			
			// ด/บ สะสมสมาชิก
//			this.of_postupd_memintaccum( ls_memno, ldtm_refslipdate, ldc_intpay * -1 )
//			
//		case "MRT"	// คืนใบเสร็จส่วนเงินคืน
//			ls_contno	= ads_adj_mth_det.getitemstring( ll_index, "loancontract_no" )
//			
//			ll_rowchk	= ids_infocont.retrieve( ls_contno )
//			if ll_rowchk <= 0 then
//				ithw_exception.text	= "ไม่พบข้อมูลสัญญาเงินกู้เลขที่ "+ls_contno
//				throw ithw_exception
//			end if
//			
//			ldc_bfprnbal		= ids_infocont.getitemdecimal( 1, "principal_balance" )
//			ldc_bfintarr		= ids_infocont.getitemdecimal( 1, "interest_arrear" )
//			ldc_bfintreturn	= ids_infocont.getitemdecimal( 1, "interest_return" )
//			
//			ldc_prnbal		= ldc_bfprnbal - ldc_prnpay
//			ldc_intretbal		= ldc_bfintreturn + ldc_intpay
//			
//			ldc_intperiod	= 0
//			
//			// บันทึกลง Statement
//			lstr_lnstm.loancontract_no			= ls_contno
//			lstr_lnstm.slip_date					= ldtm_refslipdate
//			lstr_lnstm.operate_date				= ldtm_adjdate
//			lstr_lnstm.account_date				= ldtm_adjdate
//			lstr_lnstm.intaccum_date				= ldtm_refslipdate
//			lstr_lnstm.ref_slipno					= ls_adjslipno
//			lstr_lnstm.ref_docno					= ls_refdocno
//			lstr_lnstm.loanitemtype_code		= "RRT"
//			lstr_lnstm.period						= 0
//			lstr_lnstm.principal_payment		= ldc_prnpay
//			lstr_lnstm.interest_payment			= ldc_intpay
//			lstr_lnstm.principal_balance			= ldc_prnbal
//			lstr_lnstm.prncalint_amt				= ldc_prnpay
//			lstr_lnstm.calint_from					= ldtm_adjdate
//			lstr_lnstm.calint_to					= ldtm_adjdate
//			lstr_lnstm.bfinterest_arrear			= ldc_bfintarr
//			lstr_lnstm.bfinterest_return			= ldc_bfintreturn
//			lstr_lnstm.interest_period			= ldc_intperiod
//			lstr_lnstm.interest_arrear			= ldc_bfintarr
//			lstr_lnstm.interest_return			= ldc_intretbal
//			lstr_lnstm.moneytype_code			= "TRN"
//			lstr_lnstm.remark						= ls_adjcause
//			lstr_lnstm.item_status				= 1
//			lstr_lnstm.entry_id						= ls_entryid
//			lstr_lnstm.entry_bycoopid					= ls_coopid
//		
//			this.of_poststm_contract( lstr_lnstm )
//			
//			update	lncontmaster
//			set			principal_balance	= :ldc_prnbal,
//						prnpayment_amt	= prnpayment_amt + :ldc_prnpay,
//						intpayment_amt	= intpayment_amt + :ldc_intpay,
//						interest_accum		= interest_accum + :ldc_intpay
//			where	( loancontract_no	= :ls_contno )
//			using		itr_sqlca ;
//			
//			if itr_sqlca.sqlcode <> 0 then
//				ithw_exception.text	+= "ไม่สามารถปรับปรุงสัญญาสำหรับการปรับปรุงรายการรายเดือนได้ เลขสัญญา #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
//				throw ithw_exception
//			end if
//			
//			// ด/บ สะสมสมาชิก
////			this.of_postupd_memintaccum( ls_memno, ldtm_refslipdate, ldc_intpay )
//		case "UIA", "UIR"
//			if ls_slipitemcode = "UIA" then
//				li_signflag	= -1
//			else
//				li_signflag	= 1
//			end if
//						
//			// ด/บ สะสมสมาชิก
////			this.of_postupd_memintaccum( ls_memno, ldtm_refslipdate, ldc_itempay * li_signflag )
//			
	end choose

	if ldc_itempay = ldc_bfmthitem then
		li_keepitemsts	= -99
	else
		li_keepitemsts	= 1
	end if

	// Update กลับไปที่ตัว slip รายเดือน
	update	kpmastreceivedet
	set			adjust_prnamt				= adjust_prnamt + :ldc_prnpay,
				adjust_intamt				= adjust_intamt + :ldc_intpay,
				adjust_itemamt				= adjust_itemamt + :ldc_itempay,
				cancel_id						= :is_userid ,
				cancel_date					= :idtm_oper ,
				keepitem_status			= :li_keepitemsts ,
				money_return_status 		= -9 
	where	( coop_id				= :ls_coopid ) and
				( kpslip_no			= :ls_refdocno ) and
				( seq_no				= :li_mthseqno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุง Slip รายการรายเดือนได้~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
next

if li_retallflag = 1 then
	update	kpmastreceive
	set			keeping_status	= -99
	where	( coop_id				= :ls_coopid ) and
				( kpslip_no			= :ls_refdocno ) 
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุง Slip รายการรายเดือนได้~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

return 1
end function

protected function integer of_postslip_adjmth_lon (n_ds ads_adj_mth_main, n_ds ads_adj_mth_det, long al_index_det) throws Exception;string ls_coopid, ls_concoop, ls_contno
string ls_adjslipno, ls_refdocno, ls_adjcause
string ls_entryid
integer li_contstatus, li_odflag, li_lastperiod
integer li_bflastperiod, li_kpseq
dec{2}ldc_prnbal, ldc_prnpay, ldc_intpay, ldc_intarrbal, ldc_intperiod
dec{2}ldc_bfprnbal, ldc_wtdbal, ldc_bfintreturn, ldc_bfmthprn, ldc_bfmthint
dec{2}ldc_bfintarr, ldc_bfintmth, ldc_bfintyr, ldc_intarrmthbal, ldc_intarryrbal, ldc_prnarrbal, ldc_bfprnarr
datetime ldtm_bflastcalint, ldtm_lastcalint, ldtm_refslipdate, ldtm_adjdate
datetime ldtm_null
str_poststmloan lstr_lnstm
//mikekong edit for moneyreturn
dec{2}ldc_bfprnadj, ldc_bfintadj, ldc_prnadj, ldc_intadj, ldc_bfprnret, ldc_bfintret, ldc_prnret, ldc_intret
//

setnull(ldtm_null)

ls_coopid = ads_adj_mth_main.getitemstring(1, "coop_id")
ls_adjslipno = ads_adj_mth_main.getitemstring(1, "adjslip_no")
ls_refdocno = ads_adj_mth_main.getitemstring(1, "ref_slipno")
ls_adjcause = ads_adj_mth_main.getitemstring(1, "adjust_cause")
ls_entryid = ads_adj_mth_main.getitemstring(1, "entry_id")
ldtm_refslipdate = ads_adj_mth_main.getitemdatetime(1, "ref_slipdate")
ldtm_adjdate = ads_adj_mth_main.getitemdatetime(1, "adjslip_date")

ls_concoop = ads_adj_mth_det.getitemstring(al_index_det, "concoop_id")
ls_contno = ads_adj_mth_det.getitemstring(al_index_det, "loancontract_no")

li_kpseq = ads_adj_mth_det.object.bfmthpay_seqno[al_index_det]

ldc_prnpay = ads_adj_mth_det.getitemdecimal(al_index_det, "principal_adjamt")
ldc_intpay = ads_adj_mth_det.getitemdecimal(al_index_det, "interest_adjamt")
ldc_bfmthprn = ads_adj_mth_det.getitemdecimal(al_index_det, "bfmthpay_prnamt")
ldc_bfmthint = ads_adj_mth_det.getitemdecimal(al_index_det, "bfmthpay_intamt")

li_contstatus = 1

select principal_balance, interest_arrear, intmonth_arrear, intyear_arrear,
withdrawable_amt, interest_return, od_flag, last_periodpay, lastcalint_date,
principal_arrear, principal_return
into :ldc_bfprnbal, :ldc_bfintarr, :ldc_bfintmth, :ldc_bfintyr,
:ldc_wtdbal, :ldc_bfintreturn, :li_odflag, :li_bflastperiod, :ldtm_lastcalint,
:ldc_bfprnarr, :ldc_bfprnret
from lncontmaster
where loancontract_no = :ls_contno
and coop_id = :ls_concoop
using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "ไม่พบข้อมูลสัญญาเงินกู้เลขที่ : " + ls_contno
	throw ithw_exception
end if

//mikekong edit for moneyreturn
//ldc_bfintret = ldc_bfintreturn
ldc_bfintret = 0 //nan
ldc_bfprnret = 0 //nan
ldc_bfprnadj = ldc_prnpay
ldc_bfintadj = ldc_intpay
if IsNull(ldc_bfprnadj) then
	ldc_bfprnadj = 0
end if
if IsNull(ldc_bfintadj) then
	ldc_bfintadj = 0
end if
if IsNull(ldc_bfprnret) then
	ldc_bfprnret = 0
end if
if IsNull(ldc_bfintret) then
	ldc_bfintret = 0
end if
	

if ldc_bfprnadj > ldc_bfprnret then
	ldc_prnadj = ldc_bfprnadj - ldc_bfprnret
	ldc_prnret = 0
else
	ldc_prnret = ldc_bfprnret - ldc_bfprnadj
	ldc_prnadj = 0
end if

if ldc_bfintadj > ldc_bfintret then
	ldc_intadj = ldc_bfintadj - ldc_bfintret
	ldc_intret = 0
else
	ldc_intret = ldc_bfintret - ldc_bfintadj
	ldc_intadj = 0
end if

update slslipadjustdet
set principal_adjamt = :ldc_prnadj,
interest_adjamt = :ldc_intadj
where(loancontract_no = :ls_contno)
and coop_id = :ls_concoop
and adjslip_no = :ls_adjslipno
using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text += "ไม่สามารถปรับปรุงยอดค้างชำระของสัญญา  #" + ls_contno
	ithw_exception.text += "<br>~r~n" + itr_sqlca.sqlerrtext
	throw ithw_exception
end if
//

li_lastperiod = li_bflastperiod

ldc_prnbal = ldc_bfprnbal + ldc_prnpay
ldc_intarrbal = ldc_bfintarr + ldc_intpay
ldc_prnarrbal = ldc_bfprnarr + ldc_prnpay

ldc_intarrmthbal = ldc_bfintmth
ldc_intarryrbal = ldc_bfintyr

ldc_intperiod = 0

if li_odflag = 1 then
	ldc_wtdbal = ldc_wtdbal - ldc_prnpay
else
	// ถ้าหนี้คงเหลือเป็น 0
	if ldc_prnbal = 0 then li_contstatus = -1
end if

// ถ้ายอดปรับปรุงเป็นการปรับปรุงทั้งหมด ต้องถอยงวด
if ldc_prnpay = ldc_bfmthprn then
	li_lastperiod = li_lastperiod - 1
end if

choose case ii_adjmthlonflag
	case 1 // แบบตั้งค้างดอกเบี้ยเรียกเก็บ
		
	case 2 // แบบถอยวันที่คิดดอกเบี้ยไม่ตั้งค้าง จาก kpmastreceivedet
		
		/*ดึงข้อมูล Kpmastreceivedet*/
		select bflastcalint_date, bfinterest_arrear, bfintmonth_arrear, bfintyear_arrear
		into :ldtm_bflastcalint, :ldc_bfintarr, :ldc_bfintmth, :ldc_bfintyr
		from kpmastreceivedet
		where coop_id = :is_coopcontrol
		and kpslip_no = :ls_refdocno
		and seq_no = :li_kpseq
		using itr_sqlca;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text += "ไม่สามารถดึงข้อมูลวันที่ก่อนวันที่คิดดอกเบี้ยล่าสุด(10.0) เลขสัญญา #" + ls_contno
			ithw_exception.text += "<br>~r~n" + itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
		
		ldc_intarrbal = ldc_bfintarr
		ldc_intarrmthbal = ldc_bfintmth
		ldc_intarryrbal = ldc_bfintyr
		
		ldtm_lastcalint = ldtm_bflastcalint
		
	case 3 // แบบถอยวันที่คิดดอกเบี้ยไม่ตั้งค้าง จาก lncontstatement
		// หาวันที่คิดดอกเบี้ยล่าสุดก่อนตัดยอด
		//		select 	max( operate_date )
		//		into		:ldtm_bflastcalint
		//		from 		lncontstatement
		//		where 	coop_id				= :ls_concoop
		//		and		loancontract_no 	= :ls_contno
		//		and		item_status			= 1
		//		and		operate_date		< :ldtm_lastcalint		// ต้องเอาวันที่ก่อนวันที่คิดดอกเบี้ยล่าสุด
		select max(stm.operate_date)
		into :ldtm_bflastcalint
		from (
		select coop_id, loancontract_no, operate_date, trim(ref_slipno)
		from lncontstatement
		where coop_id = :ls_concoop
		and loancontract_no = :ls_contno
		and item_status = 1
		and loanitemtype_code <> 'RPM'
		minus
		select coop_id, loancontract_no, slip_date, trim(ref_docno)
		from lncontstatement
		where coop_id = :ls_concoop
		and loancontract_no = :ls_contno
		and item_status = 1
		and loanitemtype_code = 'RPM'
		)stm
		using itr_sqlca;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text += "ไม่สามารถดึงข้อมูลวันที่ก่อนวันที่คิดดอกเบี้ยล่าสุด(10.1) เลขสัญญา #" + ls_contno
			ithw_exception.text += "<br>~r~n" + itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
		
		ldc_intarrbal = 0
		ldtm_lastcalint = ldtm_bflastcalint
	case else
		// ให้คิดแบบตั้งค้างดอกเบี้ยเรียกเก็บ
end choose

// บันทึกลง Statement
lstr_lnstm.contcoop_id = ls_concoop
lstr_lnstm.loancontract_no = ls_contno
lstr_lnstm.slip_date = ldtm_refslipdate
lstr_lnstm.operate_date = ldtm_adjdate
lstr_lnstm.account_date = ldtm_adjdate
lstr_lnstm.intaccum_date = ldtm_refslipdate
lstr_lnstm.ref_slipno = ls_adjslipno
lstr_lnstm.ref_docno = ls_refdocno
lstr_lnstm.loanitemtype_code = "RPM"
lstr_lnstm.period = li_lastperiod
lstr_lnstm.principal_payment = ldc_prnpay
lstr_lnstm.interest_payment = ldc_intpay
lstr_lnstm.principal_balance = ldc_prnbal
lstr_lnstm.prncalint_amt = ldc_prnbal
lstr_lnstm.calint_from = ldtm_null
lstr_lnstm.calint_to = ldtm_null
lstr_lnstm.bfinterest_arrear = ldc_bfintarr
lstr_lnstm.bfinterest_return = ldc_bfintreturn
lstr_lnstm.interest_period = ldc_intperiod
lstr_lnstm.interest_arrear = ldc_intarrbal
lstr_lnstm.interest_return = ldc_bfintreturn
lstr_lnstm.moneytype_code = "TRN"
lstr_lnstm.remark = ls_adjcause
lstr_lnstm.item_status = 1
lstr_lnstm.entry_id = ls_entryid
lstr_lnstm.entry_bycoopid = ls_coopid

this.of_poststm_contract(lstr_lnstm)

update lncontmaster
set withdrawable_amt = :ldc_wtdbal,
principal_balance = :ldc_prnbal,
interest_arrear = :ldc_intarrbal,
intmonth_arrear = :ldc_intarrmthbal,
intyear_arrear = :ldc_intarryrbal,
last_periodpay = :li_lastperiod,
prnpayment_amt = prnpayment_amt - :ldc_prnpay,
intpayment_amt = intpayment_amt - :ldc_intpay,
interest_accum = interest_accum - :ldc_intpay,
contract_status = :li_contstatus,
lastcalint_date = :ldtm_lastcalint,
//interest_return = :ldc_intret, //mikekong  //nan
//principal_return = :ldc_prnret, //mikekong  //nan
principal_arrear = :ldc_prnarrbal
where(loancontract_no = :ls_contno)
and coop_id = :ls_concoop
using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text += "ไม่สามารถปรับปรุงสัญญาสำหรับการปรับปรุงรายการรายเดือนได้ เลขสัญญา #" + ls_contno + "<br>~r~n" + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ไปปรับปรุงยอด adjust kpmastreceivedet เพื่อดูว่ามีการค้างชำระเท่าไหร่
update kpmastreceivedet
set adjust_prnamt = nvl(adjust_prnamt, 0)+:ldc_prnpay,
	adjust_intamt = nvl(adjust_intamt, 0)+:ldc_intpay,
	adjust_itemamt = nvl(adjust_itemamt, 0)+:ldc_prnpay + :ldc_intpay
where coop_id = :is_coopcontrol
and kpslip_no = :ls_refdocno
and loancontract_no = :ls_contno
and keepitemtype_code in('L01', 'L02', 'L03')
using itr_sqlca;

return 1
end function

protected function integer of_postslip_adjmth_shr (n_ds ads_adj_mth_main, n_ds ads_adj_mth_det, long al_index_det) throws Exception;string		ls_coopid , ls_memcoop , ls_memno , ls_refdocno
string		ls_adjslipno , ls_adjcause
string		ls_entryid
integer	li_bflastperiod , li_lastperiod
integer	li_itemsts
dec{2}	ldc_unitshare
dec{2}	ldc_itempay , ldc_bfmthitem
dec{3}	ldc_sharestk , ldc_shareamt
datetime	ldtm_refslipdate , ldtm_adjdate

str_poststmshare	lstr_shstm

ls_coopid				= ads_adj_mth_main.getitemstring( 1, "coop_id" )
ls_memcoop			= ads_adj_mth_main.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_adj_mth_main.getitemstring( 1, "member_no" )
ls_adjslipno			= ads_adj_mth_main.getitemstring( 1, "adjslip_no" )
ls_adjcause			= ads_adj_mth_main.getitemstring( 1, "adjust_cause" )
ls_refdocno			= ads_adj_mth_main.getitemstring( 1, "ref_slipno" )
ls_entryid			= ads_adj_mth_main.getitemstring( 1, "entry_id" )
ldtm_refslipdate	= ads_adj_mth_main.getitemdatetime( 1, "ref_slipdate" )
ldtm_adjdate		= ads_adj_mth_main.getitemdatetime( 1, "adjslip_date" )

ldc_itempay			= ads_adj_mth_det.getitemdecimal( al_index_det, "item_adjamt" )
ldc_bfmthitem		= ads_adj_mth_det.getitemdecimal( al_index_det , "bfmthpay_itemamt" )

li_itemsts = 1
if ldtm_adjdate = ldtm_refslipdate then li_itemsts = -9

select shsharemaster.sharestk_amt, shsharemaster.last_period, shsharetype.unitshare_value
into	:ldc_sharestk, :li_bflastperiod, :ldc_unitshare
from	shsharemaster, shsharetype
where( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
		( shsharemaster.coop_id = shsharetype.coop_id ) and
		( shsharemaster.member_no = :ls_memno ) and
		( shsharemaster.coop_id = :ls_memcoop )
using itr_sqlca ;

if isnull( li_bflastperiod ) then li_bflastperiod = 0
if isnull( ldc_sharestk ) then ldc_sharestk = 0

ldc_sharestk		= ldc_sharestk * ldc_unitshare
li_lastperiod		= li_bflastperiod

// ถ้ายกเลิกทั้งยอด ลดงวดลงด้วย
if ( ldc_bfmthitem = ldc_itempay ) then
	li_lastperiod = li_lastperiod - 1
	if ( li_lastperiod < 0 ) then li_lastperiod = 0
end if

ldc_sharestk = ldc_sharestk - ldc_itempay
ldc_sharestk = ldc_sharestk / ldc_unitshare
ldc_shareamt = ldc_itempay / ldc_unitshare

lstr_shstm.memcoop_id		= ls_memcoop
lstr_shstm.member_no		= ls_memno
lstr_shstm.sharetype_code	= "01"
lstr_shstm.slip_date			= ldtm_refslipdate
lstr_shstm.operate_date		= ldtm_adjdate
lstr_shstm.account_date		= ldtm_adjdate
lstr_shstm.sharetime_date	= ldtm_refslipdate
lstr_shstm.document_no		= ls_refdocno
lstr_shstm.stmitem_code		= "RPM"
lstr_shstm.period				= li_lastperiod
lstr_shstm.sharepay_amt	= ldc_shareamt
lstr_shstm.sharebal_amt		= ldc_sharestk
lstr_shstm.entry_id			= ls_entryid
lstr_shstm.entry_bycoopid	= ls_coopid
lstr_shstm.moneytype			= "TRN"
lstr_shstm.bfsharearr_amt	= 0
lstr_shstm.sharearr_amt		= 0
lstr_shstm.item_status		= li_itemsts
lstr_shstm.ref_slipno			= ls_adjslipno
lstr_shstm.remark				= ls_adjcause

// เพิ่ม statement
this.of_poststm_share( lstr_shstm )

// ลดยอดหุ้น
update shsharemaster
set		sharestk_amt	= :ldc_sharestk,
		last_period		= :li_lastperiod
where ( member_no = :ls_memno ) and 
		( coop_id = :ls_memcoop ) and
		 ( sharetype_code = '01' )
using itr_sqlca;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text = "ไม่สามารถปรับปรุงทะเบียนหุ้นได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if
			
return 1
end function

protected function integer of_poststm_contract (str_poststmloan astr_lnstatement) throws Exception;string		ls_contno, ls_contcoopid, ls_itemcode, ls_refdocno, ls_refslipno, ls_statusdesc
string		ls_moneytype, ls_entryid, ls_entrycoopid, ls_remark
integer	li_seqno, li_period, li_itemstatus, li_lastseqno
dec{2}	ldc_prnpay, ldc_intpay, ldc_prnbal, ldc_prncalint, ldc_intperiod
dec{2}	ldc_bfintarr, ldc_bfintret, ldc_intarrbal, ldc_intretbal
datetime	ldtm_slipdate, ldtm_opedate, ldtm_accdate, ldtm_intaccdate, ldtm_entrydate
datetime	ldtm_calintfrom, ldtm_calintto

ls_contno		= astr_lnstatement.loancontract_no
ls_contcoopid	= astr_lnstatement.contcoop_id
ldtm_slipdate	= astr_lnstatement.slip_date
ldtm_opedate	= astr_lnstatement.operate_date
ldtm_accdate	= astr_lnstatement.account_date
ldtm_intaccdate= astr_lnstatement.intaccum_date
ls_refslipno		= astr_lnstatement.ref_slipno
ls_refdocno		= astr_lnstatement.ref_docno
ls_itemcode		= astr_lnstatement.loanitemtype_code
li_period			= astr_lnstatement.period
ldc_prnpay		= astr_lnstatement.principal_payment
ldc_intpay		= astr_lnstatement.interest_payment
ldc_prnbal		= astr_lnstatement.principal_balance
ldc_prncalint	= astr_lnstatement.prncalint_amt
ldtm_calintfrom	= astr_lnstatement.calint_from
ldtm_calintto	= astr_lnstatement.calint_to
ldc_bfintarr		= astr_lnstatement.bfinterest_arrear
ldc_bfintret		= astr_lnstatement.bfinterest_return
ldc_intperiod	= astr_lnstatement.interest_period
ldc_intarrbal		= astr_lnstatement.interest_arrear
ldc_intretbal		= astr_lnstatement.interest_return
ls_moneytype	= astr_lnstatement.moneytype_code
li_itemstatus	= astr_lnstatement.item_status
ls_entryid		= astr_lnstatement.entry_id
ls_entrycoopid	= astr_lnstatement.entry_bycoopid
ls_remark		= astr_lnstatement.remark

ldtm_entrydate	= datetime( today(), now() )

select		last_stm_no, status_desc
into		:li_lastseqno, :ls_statusdesc
from		lncontmaster
where	( loancontract_no	= :ls_contno ) and
			( coop_id				= :ls_contcoopid )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "of_poststm_contract ไม่พบเลขที่สัญญาที่ระบุ "+ls_contno+" กรุณาตรวจสอบ ~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

if isnull( li_lastseqno ) then li_lastseqno = 0

li_lastseqno ++

// เพิ่มรายการเคลื่อนไหวการชำระหนี้
insert into lncontstatement
			( loancontract_no,		coop_id,					seq_no,					slip_date,				operate_date,			account_date,			intaccum_date,
			  ref_slipno,				ref_docno,				loanitemtype_code,	
			  period,		 			principal_payment,	interest_payment,		principal_balance,		
			  prncalint_amt,		calint_from,				calint_to,					bfintarrear_amt,		bfintreturn_amt,		interest_period,
			  interest_arrear,		interest_return,			moneytype_code,		item_status,				entry_id,					entry_date,				entry_bycoopid,
			  remark,					bfcontstatus_desc )
values	( :ls_contno,			:ls_contcoopid,			:li_lastseqno,			:ldtm_slipdate,			:ldtm_opedate,			:ldtm_accdate,			:ldtm_intaccdate,
			  :ls_refslipno,			:ls_refdocno,			:ls_itemcode,			
			  :li_period,				:ldc_prnpay,				:ldc_intpay,				:ldc_prnbal,
			  :ldc_prncalint,			:ldtm_calintfrom,		:ldtm_calintto,			:ldc_bfintarr,			:ldc_bfintret,			:ldc_intperiod,
			  :ldc_intarrbal,			:ldc_intretbal,			:ls_moneytype,			:li_itemstatus,			:ls_entryid,				:ldtm_entrydate,		:ls_entrycoopid,
			  :ls_remark,			:ls_statusdesc )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "of_poststm_contract  ไม่สามารถเพิ่มรายการ Statement หนี้ "+ls_contno+" ได้ กรุณาตรวจสอบ ~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

update	lncontmaster
set			last_stm_no			= :li_lastseqno
where	loancontract_no	= :ls_contno
and		coop_id				= :ls_contcoopid
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "of_poststm_contract  ไม่สามารถปรับปรุงลำดับที่ล่าสุดได้ เลขที่สัญญา "+ls_contno+" กรุณาตรวจสอบ ~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ตรวจสอบว่าถ้าเป็นรายการยกเลิกให้ไปปรับรายการคู่กันให้ยกเลิกด้วย
if li_itemstatus <> 1 then
	update	lncontstatement
	set			item_status			= :li_itemstatus
	where	( loancontract_no	= :ls_contno ) 
	and		( ref_slipno			= :ls_refslipno )
	and		coop_id				= :ls_contcoopid
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "of_poststm_contract  ไม่สามารถปรับปรุงสถานะ Statement รายการคู่กันได้ เลขที่สัญญา "+ls_contno+" เลขที่ Slip "+ls_refslipno+" กรุณาตรวจสอบ ~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

return 1
end function

protected function integer of_poststm_share (str_poststmshare astr_infoshrstm) throws Exception;/***********************************************************
<description>
	ผ่านรายการ statement หุ้น
</description>

<arguments>  
	astr_infoshrstm		str_postshrstm		โครงสร้าง structure statement หุ้น
</arguments> 

<return> 
	ลำดับที่			Integer	ลำดับที่ล่าสุดของ statement หุ้น
</return> 

<usage>

	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
integer	li_stmno, li_period, li_itemstatus
string		ls_memno, ls_memcoopid, ls_xmlshare, ls_entryid, ls_entrycoopid
string		ls_docno, ls_sharetype, ls_itemtype, ls_moneytype, ls_refslipno
datetime	ldtm_opedate, ldtm_slipdate, ldtm_entrydate, ldtm_accdate, ldtm_shrtime
decimal	ldc_shrpayamt, ldc_shrstkamt, ldc_bfshrarramt, ldc_shrarramt

ldtm_entrydate		= datetime( today(), now() )

ls_memno 			= astr_infoshrstm.member_no
ls_memcoopid		= astr_infoshrstm.memcoop_id
ls_sharetype		= astr_infoshrstm.sharetype_code
ldtm_slipdate		= astr_infoshrstm.slip_date
ldtm_opedate		= astr_infoshrstm.operate_date
ldtm_accdate		= astr_infoshrstm.account_date
ldtm_shrtime		= astr_infoshrstm.sharetime_date
ls_docno				= astr_infoshrstm.document_no
ls_itemtype			= astr_infoshrstm.stmitem_code
li_period				= astr_infoshrstm.period
ldc_shrpayamt		= astr_infoshrstm.sharepay_amt
ldc_shrstkamt		= astr_infoshrstm.sharebal_amt
ls_entryid			= astr_infoshrstm.entry_id
ls_entrycoopid		= astr_infoshrstm.entry_bycoopid
ls_moneytype		= astr_infoshrstm.moneytype
ldc_bfshrarramt	= astr_infoshrstm.bfsharearr_amt
ldc_shrarramt		= astr_infoshrstm.sharearr_amt
li_itemstatus		= astr_infoshrstm.item_status
ls_refslipno			= astr_infoshrstm.ref_slipno

select	max( seq_no )
into	:li_stmno
from	shsharestatement
where( member_no		= :ls_memno ) and
		( coop_id				= :ls_memcoopid ) and
		( sharetype_code	= :ls_sharetype )
using	itr_sqlca ;

if isnull( li_stmno ) then li_stmno = 0

li_stmno	++
	
// บันทึกรายการเคลื่อนไหว
insert into shsharestatement
		( member_no,			coop_id,					sharetype_code,		seq_no,					ref_slipno,			ref_docno,
		  slip_date,				operate_date,			account_date,			share_date,
		  shritemtype_code,	period,					share_amount,			sharestk_amt,
		  moneytype_code,	shrarrearbf_amt,		shrarrear_amt,			item_status,
		  entry_id,				entry_date,				entry_bycoopid )
		  
values( :ls_memno,			:ls_memcoopid,		:ls_sharetype,			:li_stmno,				:ls_refslipno,		:ls_docno,
		  :ldtm_slipdate,		:ldtm_opedate,			:ldtm_accdate,			:ldtm_shrtime,
		  :ls_itemtype,			:li_period,				:ldc_shrpayamt,		:ldc_shrstkamt,
		  :ls_moneytype,		:ldc_bfshrarramt,		:ldc_shrarramt,		  	:li_itemstatus,
		  :ls_entryid,			:ldtm_entrydate,		:ls_entrycoopid )
using itr_sqlca;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text += "<br>~nไม่สามารถเพิ่ม statement หุ้นได้ "
	ithw_exception.text += "<br>~n" + string( itr_sqlca.sqlcode ) 
	ithw_exception.text += "<br>~n" + itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ;
	return -1
end if

update	shsharemaster
set		last_stm_no 		= :li_stmno
where	member_no 			= :ls_memno
and		coop_id				= :ls_memcoopid
and		sharetype_code 	= :ls_sharetype
using	itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text += "<br>~nไม่สามารถปรับปรุงลำดับที่ล่าสุดหุ้นได้ "
	ithw_exception.text += "<br>~n" + string( itr_sqlca.sqlcode ) 
	ithw_exception.text += "<br>~n" + itr_sqlca.sqlerrtext 	
	rollback using itr_sqlca;
	return -1
end if

// ตรวจสอบว่าเป็นรายการยกเลิกให้ไปปรับรายการคู่กันให้ยกเลิกด้วย
if ( li_itemstatus <> 1 ) then
	update	shsharestatement
	set			item_status = :li_itemstatus
	where ( coop_id = :is_coopcontrol ) and
			 ( member_no = :ls_memno ) and 	
			 ( sharetype_code = :ls_sharetype ) and
			 ( ref_slipno = :ls_refslipno )
	using	itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text += "<br>~nไม่สามารถปรับปรุงสถานะ Statement หุ้นได้ "
		ithw_exception.text += "<br>~n" + string( itr_sqlca.sqlcode ) 
		ithw_exception.text += "<br>~n" + itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ;		
		return -1
	end if	
end if

return li_stmno
end function

protected function integer of_set_adj (ref n_ds ads_adj_mth_det) throws Exception;string ls_slipitemcode
integer li_signflag
long ll_index , ll_count
dec{2} ldc_prnpay , ldc_intpay , ldc_bfprnbal

ll_count	= ads_adj_mth_det.rowcount()

for ll_index = 1 to ll_count
	ls_slipitemcode		= ads_adj_mth_det.getitemstring( ll_index, "slipitemtype_code" )
	li_signflag			= ads_adj_mth_det.getitemnumber( ll_index, "sign_flag" )
	
	choose case ls_slipitemcode
		case "LON", "INF"
			ldc_prnpay	= ads_adj_mth_det.getitemdecimal( ll_index, "principal_adjamt" )
			ldc_intpay	= ads_adj_mth_det.getitemdecimal( ll_index, "interest_adjamt" )
			ldc_bfprnbal	= ads_adj_mth_det.getitemdecimal( ll_index, "bfshrcont_balamt" )
			
			if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
			if isnull( ldc_intpay ) then ldc_intpay = 0
			
			ads_adj_mth_det.setitem( ll_index, "item_adjamt", ldc_prnpay + ldc_intpay )
			ads_adj_mth_det.setitem( ll_index, "item_balance", ldc_bfprnbal + ( ldc_prnpay * li_signflag ) )
			
		case "SHR"
			ldc_prnpay	= ads_adj_mth_det.getitemdecimal( ll_index, "principal_adjamt" )
			ads_adj_mth_det.setitem( ll_index, "item_adjamt", ldc_prnpay )
			
			ldc_bfprnbal	= ads_adj_mth_det.getitemdecimal( ll_index, "bfshrcont_balamt" )
			
			ads_adj_mth_det.setitem( ll_index, "item_balance", ldc_bfprnbal + ( ldc_prnpay * li_signflag ) )
	end choose
next

return 1
end function

protected function integer of_setsrvdoccontrol (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_docsrv ) or not isvalid( inv_docsrv ) then
		inv_docsrv	= create n_cst_doccontrolservice
		inv_docsrv.of_settrans( inv_transection )
		return 1
	end if
else
	if isvalid( inv_docsrv ) then
		destroy inv_docsrv
		return 1
	end if
end if

return 0
end function

protected function integer of_setsrvdw (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_dwsrv ) or not isvalid( inv_dwsrv ) then
		inv_dwsrv	= create n_cst_datawindowsservice
		inv_dwsrv.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_dwsrv ) then
		destroy inv_dwsrv
		return 1
	end if
end if

return 0
end function

protected function integer of_setsrvdwxmlie (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_dwxmliesrv ) or not isvalid( inv_dwxmliesrv ) then
		inv_dwxmliesrv	= create n_cst_dwxmlieservice
		return 1
	end if
else
	if isvalid( inv_dwxmliesrv ) then
		destroy inv_dwxmliesrv
		return 1
	end if
end if

return 0
end function

protected function integer of_setsrvlninterest (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_intsrv ) or not isvalid( inv_intsrv ) then
		inv_intsrv	= create n_cst_loansrv_interest
		inv_intsrv.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_intsrv ) then
		destroy inv_intsrv
		return 1
	end if
end if

return 0
end function

protected function integer of_setsrvproc (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_procsrv ) or not isvalid( inv_procsrv ) then
		inv_procsrv	= create n_cst_procservice
		inv_procsrv.of_initservice()
		return 1
	end if
else
	if isvalid( inv_procsrv ) then
		destroy inv_procsrv
		return 1
	end if
end if

return 0
end function

public function integer of_postslip_adjmth_ccl (n_ds ads_adj_main, n_ds ads_adj_det) throws Exception;string ls_slipitemcode , ls_refdocno
integer li_retallflag , li_mthseqno
integer li_index , li_count 
dec{2} ldc_prnpay, ldc_intpay, ldc_itempay

ls_refdocno			= ads_adj_main.getitemstring( 1, "ref_slipno" )
li_retallflag			= ads_adj_main.getitemnumber( 1, "slipretall_flag" )

li_count	= ads_adj_det.rowcount()

for li_index = 1 to li_count
	
	ls_slipitemcode		= ads_adj_det.getitemstring( li_index, "slipitemtype_code" )
	li_mthseqno			= ads_adj_det.getitemnumber( li_index, "bfmthpay_seqno" )
	ldc_prnpay			= ads_adj_det.getitemdecimal( li_index, "principal_adjamt" )
	ldc_intpay			= ads_adj_det.getitemdecimal( li_index, "interest_adjamt" )
	ldc_itempay			= ads_adj_det.getitemdecimal( li_index, "item_adjamt" )
	
	choose case ls_slipitemcode
		case "SHR"
			this.of_postslip_adjmth_ccl_shr( ads_adj_main , ads_adj_det , li_index )
		case "LON" , "IAR"
			this.of_postslip_adjmth_ccl_lon( ads_adj_main , ads_adj_det , li_index )
	end choose
	
	// Update กลับไปที่ตัว slip รายเดือน
	update	kpmastreceivedet
	set		adjust_prnamt				= adjust_prnamt - :ldc_prnpay,
				adjust_intamt				= adjust_intamt - :ldc_intpay,
				adjust_itemamt				= adjust_itemamt - :ldc_itempay,
				cancel_id						= '' , 
				cancel_date					= null ,
				keepitem_status			= 1 ,
				money_return_status 	= 1 
	where	( coop_id				= :is_coopcontrol ) and
				( kpslip_no			= :ls_refdocno ) and
				( seq_no				= :li_mthseqno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุง Slip รายการรายเดือนได้~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
next

if li_retallflag = 1 then
	update	kpmastreceive
	set		keeping_status	= 1
	where	( coop_id				= :is_coopcontrol ) and
				( kpslip_no			= :ls_refdocno ) 
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุง Slip รายการรายเดือนได้~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

return 1
end function

protected function integer of_postslip_adjmth_ccl_shr (n_ds ads_adj_mth_main, n_ds ads_adj_mth_det, long al_index_det) throws Exception;string		ls_coopid , ls_memcoop , ls_memno , ls_refdocno
string		ls_adjslipno , ls_adjcause
string		ls_entryid
integer	li_bflastperiod , li_lastperiod
integer	li_itemsts
dec{2}	ldc_unitshare
dec{2}	ldc_itempay , ldc_bfmthitem
dec{3}	ldc_sharestk , ldc_shareamt
datetime	ldtm_refslipdate , ldtm_adjdate

str_poststmshare	lstr_shstm

ls_coopid				= ads_adj_mth_main.getitemstring( 1, "coop_id" )
ls_memcoop			= ads_adj_mth_main.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_adj_mth_main.getitemstring( 1, "member_no" )
ls_adjslipno			= ads_adj_mth_main.getitemstring( 1, "adjslip_no" )
ls_adjcause			= ads_adj_mth_main.getitemstring( 1, "adjust_cause" )
ls_refdocno			= ads_adj_mth_main.getitemstring( 1, "ref_slipno" )
ls_entryid			= ads_adj_mth_main.getitemstring( 1, "cancel_id" )
ldtm_refslipdate	= ads_adj_mth_main.getitemdatetime( 1, "ref_slipdate" )
ldtm_adjdate		= ads_adj_mth_main.getitemdatetime( 1, "adjslip_date" )

ldc_itempay			= ads_adj_mth_det.getitemdecimal( al_index_det, "item_adjamt" )
ldc_bfmthitem		= ads_adj_mth_det.getitemdecimal( al_index_det , "bfmthpay_itemamt" )

li_itemsts = 1
if ldtm_adjdate = ldtm_refslipdate then li_itemsts = -9

select shsharemaster.sharestk_amt, shsharemaster.last_period, shsharetype.unitshare_value
into	:ldc_sharestk, :li_bflastperiod, :ldc_unitshare
from	shsharemaster, shsharetype
where( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
		( shsharemaster.coop_id = shsharetype.coop_id ) and
		( shsharemaster.member_no = :ls_memno ) and
		( shsharemaster.coop_id = :ls_memcoop )
using itr_sqlca ;

if isnull( li_bflastperiod ) then li_bflastperiod = 0
if isnull( ldc_sharestk ) then ldc_sharestk = 0

ldc_sharestk	= ldc_sharestk * ldc_unitshare
li_lastperiod		= li_bflastperiod

if ( ldc_bfmthitem = ldc_itempay ) then
	li_lastperiod = li_lastperiod + 1
end if

ldc_sharestk = ldc_sharestk + ldc_itempay
ldc_sharestk = ldc_sharestk / ldc_unitshare
ldc_shareamt = ldc_itempay / ldc_unitshare

lstr_shstm.memcoop_id		= ls_memcoop
lstr_shstm.member_no		= ls_memno
lstr_shstm.sharetype_code	= "01"
lstr_shstm.slip_date			= ldtm_refslipdate
lstr_shstm.operate_date		= ldtm_adjdate
lstr_shstm.account_date		= ldtm_adjdate
lstr_shstm.sharetime_date	= ldtm_refslipdate
lstr_shstm.document_no		= ls_refdocno
lstr_shstm.stmitem_code		= "SPM"
lstr_shstm.period				= li_lastperiod
lstr_shstm.sharepay_amt	= ldc_shareamt
lstr_shstm.sharebal_amt		= ldc_sharestk
lstr_shstm.entry_id			= ls_entryid
lstr_shstm.entry_bycoopid	= ls_coopid
lstr_shstm.moneytype		= "TRN"
lstr_shstm.bfsharearr_amt	= 0
lstr_shstm.sharearr_amt		= 0
lstr_shstm.item_status		= li_itemsts
lstr_shstm.ref_slipno			= ls_adjslipno
lstr_shstm.remark				= ls_adjcause

// เพิ่ม statement
if this.of_poststm_share( lstr_shstm ) < 0 then
	throw ithw_exception
end if

// ลดยอดหุ้น
update 	shsharemaster
set		sharestk_amt	= :ldc_sharestk,
			last_period		= :li_lastperiod
where 	( coop_id = :ls_memcoop ) and
			( member_no = :ls_memno ) and 
		 	( sharetype_code = '01' )
using itr_sqlca;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text = "ไม่สามารถปรับปรุงทะเบียนหุ้นได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if
			
return 1
end function

protected function integer of_postslip_adjmth_ccl_lon (n_ds ads_adj_mth_main, n_ds ads_adj_mth_det, long al_index_det) throws Exception;string ls_coopid , ls_concoop , ls_contno
string ls_adjslipno , ls_refdocno , ls_adjcause
string ls_entryid
integer li_contstatus , li_odflag , li_lastperiod
integer li_bflastperiod , li_kpseq , li_itemsts
dec{2} ldc_prnbal , ldc_prnpay , ldc_intpay , ldc_intperiod , ldc_intarrpay 
dec{2} ldc_bfprnbal , ldc_wtdbal , ldc_bfintreturn , ldc_bfmthprn , ldc_bfmthint , ldc_bfintarrset
dec{2} ldc_bfintarr , ldc_bfintmth , ldc_bfintyr , ldc_intarrbal , ldc_intarrmthbal , ldc_intarryrbal
datetime ldtm_bflastcalint , ldtm_lastcalint , ldtm_refslipdate , ldtm_adjdate , ldtm_lastproc , ldtm_lastpay
datetime ldtm_null
str_poststmloan	lstr_lnstm

setnull( ldtm_null )

ls_coopid				= ads_adj_mth_main.getitemstring( 1, "coop_id" )
ls_adjslipno			= ads_adj_mth_main.getitemstring( 1, "adjslip_no" )
ls_refdocno			= ads_adj_mth_main.getitemstring( 1, "ref_slipno" )
ls_adjcause			= ads_adj_mth_main.getitemstring( 1, "adjust_cause" )
ls_entryid			= ads_adj_mth_main.getitemstring( 1, "cancel_id" )
ldtm_refslipdate	= ads_adj_mth_main.getitemdatetime( 1, "ref_slipdate" )
ldtm_adjdate		= ads_adj_mth_main.getitemdatetime( 1, "adjslip_date" )

li_itemsts = 1
if ldtm_adjdate = ldtm_refslipdate then li_itemsts = -9

ls_concoop			= ads_adj_mth_det.getitemstring( al_index_det, "concoop_id" )
ls_contno			= ads_adj_mth_det.getitemstring( al_index_det, "loancontract_no" )

li_kpseq				= ads_adj_mth_det.object.bfmthpay_seqno[al_index_det]

ldc_prnpay			= ads_adj_mth_det.getitemdecimal( al_index_det, "principal_adjamt" )
ldc_intpay			= ads_adj_mth_det.getitemdecimal( al_index_det, "interest_adjamt" )
ldc_intarrpay		= ads_adj_mth_det.getitemdecimal( al_index_det, "intarrear_adjamt" )
ldc_bfintarrset		= ads_adj_mth_det.getitemdecimal( al_index_det, "bfintarrset_amt" )
ldc_bfintarr			= ads_adj_mth_det.getitemdecimal( al_index_det, "bfintarr_amt" )
ldc_bfmthprn		= ads_adj_mth_det.getitemdecimal( al_index_det, "bfmthpay_prnamt" )
ldc_bfmthint			= ads_adj_mth_det.getitemdecimal( al_index_det, "bfmthpay_intamt" )

ldtm_lastcalint		= ads_adj_mth_det.getitemdatetime( al_index_det, "bflastcalint_date" )
ldtm_lastproc		= ads_adj_mth_det.getitemdatetime( al_index_det, "bflastproc_date" )
ldtm_lastpay		= ads_adj_mth_det.getitemdatetime( al_index_det, "bflastpay_date" )

select		principal_balance , lastcalint_date , interest_arrear ,
			withdrawable_amt , interest_return , od_flag , last_periodpay , contract_status
into		:ldc_bfprnbal , :ldtm_bflastcalint , :ldc_intarrbal ,
			:ldc_wtdbal , :ldc_bfintreturn , :li_odflag , :li_bflastperiod , :li_contstatus
from		lncontmaster
where	loancontract_no	= :ls_contno
and		coop_id				= :ls_concoop
using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบข้อมูลสัญญาเงินกู้เลขที่ : " + ls_contno
	throw ithw_exception
end if

li_lastperiod		= li_bflastperiod

ldc_prnbal		= ldc_bfprnbal - ldc_prnpay
ldc_intarrbal		= ldc_intarrbal - ( ldc_intpay - ( ldc_bfmthint - ldc_bfintarr ) )

ldc_intperiod	= ldc_bfmthint - ldc_bfintarr

if li_odflag = 1 then
	ldc_wtdbal	= ldc_wtdbal + ldc_prnpay
else
	// ถ้าหนี้คงเหลือเป็น 0 
	if ldc_prnbal = 0 then li_contstatus = -1
end if

// ถ้ายอดปรับปรุงเป็นการปรับปรุงทั้งหมด ต้องเพิ่มงวด
if ldc_prnpay = ldc_bfmthprn then
	li_lastperiod		= li_lastperiod + 1
end if

// บันทึกลง Statement
lstr_lnstm.contcoop_id				= ls_concoop
lstr_lnstm.loancontract_no			= ls_contno
lstr_lnstm.slip_date					= ldtm_refslipdate
lstr_lnstm.operate_date				= ldtm_adjdate
lstr_lnstm.account_date				= ldtm_adjdate
lstr_lnstm.intaccum_date			= ldtm_refslipdate
lstr_lnstm.ref_slipno					= ls_adjslipno
lstr_lnstm.ref_docno					= ls_refdocno
lstr_lnstm.loanitemtype_code		= "LPM"
lstr_lnstm.period						= li_lastperiod
lstr_lnstm.principal_payment		= ldc_prnpay
lstr_lnstm.interest_payment		= ldc_intpay
lstr_lnstm.principal_balance			= ldc_prnbal
lstr_lnstm.prncalint_amt				= ( ldc_prnbal + ldc_prnpay )
lstr_lnstm.calint_from					= ldtm_bflastcalint
lstr_lnstm.calint_to					= ldtm_lastcalint
lstr_lnstm.bfinterest_arrear			= ldc_bfintarr
lstr_lnstm.bfinterest_return			= ldc_bfintreturn
lstr_lnstm.interest_period			= ldc_intperiod
lstr_lnstm.interest_arrear			= ldc_intarrbal
lstr_lnstm.interest_return			= ldc_bfintreturn
lstr_lnstm.moneytype_code			= "TRN"
lstr_lnstm.remark						= ls_adjcause
lstr_lnstm.item_status				= li_itemsts
lstr_lnstm.entry_id					= ls_entryid
lstr_lnstm.entry_bycoopid			= ls_coopid

this.of_poststm_contract( lstr_lnstm )

update	lncontmaster
set		withdrawable_amt	= :ldc_wtdbal,
			principal_balance	= :ldc_prnbal,
			interest_arrear		= :ldc_intarrbal,
			intmonth_arrear	= 0 , 
			intyear_arrear		= :ldc_bfintarrset ,
			last_periodpay		= :li_lastperiod,
			prnpayment_amt	= prnpayment_amt + :ldc_prnpay,
			intpayment_amt	= intpayment_amt + :ldc_intpay,
			interest_accum		= interest_accum + :ldc_intpay,
			contract_status	= :li_contstatus ,
			lastcalint_date		= :ldtm_lastcalint ,
			interest_return		= 0
where	( loancontract_no	= :ls_contno )
and		coop_id 				= :ls_concoop
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "ไม่สามารถปรับปรุงสัญญาสำหรับการปรับปรุงรายการรายเดือนได้ เลขสัญญา #"+ls_contno+"<br>~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ไปปรับปรุงยอด adjust kpmastreceivedet เพื่อดูว่ามีการค้างชำระเท่าไหร่
update kpmastreceivedet
set adjust_prnamt = nvl(adjust_prnamt, 0)-:ldc_prnpay,
	adjust_intamt = nvl(adjust_intamt, 0)-:ldc_intpay,
	adjust_itemamt = nvl(adjust_itemamt, 0)-(:ldc_prnpay + :ldc_intpay)
where coop_id = :is_coopcontrol
and kpslip_no = :ls_refdocno
and loancontract_no = :ls_contno
and keepitemtype_code in('L01', 'L02', 'L03')
using itr_sqlca;

return 1
end function

public function integer of_init_adjmth_ccl (ref str_keep_adjust astr_keep_adjust) throws Exception;string ls_memno , ls_adjslip
boolean lb_err

n_ds lds_main , lds_list , lds_detail

this.of_setsrvdwxmlie( true )
this.of_setsrvproc(true)

lds_main = create n_ds
lds_main.dataobject = "d_kp_adjmth_kpms_ccl"
lds_main.settransobject( itr_sqlca )

lds_list = create n_ds
lds_list.dataobject = "d_kp_adjmth_kpms_ccl_list"
lds_list.settransobject( itr_sqlca )

lds_detail = create n_ds
lds_detail.dataobject = "d_kp_adjmth_kpms_ccl_detail"
lds_detail.settransobject( itr_sqlca )

if inv_dwxmliesrv.of_xmlimport( lds_main , astr_keep_adjust.xml_main ) < 1 then
	ithw_exception.text += "<br>~r~nพบขอผิดพลาดในการนำเข้าข้อมูลยกเลิกใบปรับปรุงใบเสร็จประจำเดือน(0.1)"
	ithw_exception.text += "<br>~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ls_memno		= lds_main.object.member_no[1]

// set ค่าในการดึงข้อมูลสมาชิก
try
	inv_procsrv.of_set_sqldw_column( lds_main, " and mbmembmaster.coop_id = '" + is_coopcontrol + "' " ) // ใส่เงื่อนไขอื่นๆ
	inv_procsrv.of_set_sqldw_column( lds_main, " and mbmembmaster.member_no = '"+ ls_memno +"' " ) // ใส่เงื่อนไขอื่นๆ
catch( Exception lthw_setdwsql )
	ithw_exception.text	+= "<br>~r~nพบขอผิดพลาด (0.2)"
	ithw_exception.text	+= lthw_setdwsql.text
	lb_err = true
end try
if lb_err then Goto objdestroy

if lds_main.retrieve( ) < 1 then
	ithw_exception.text += "<br>~r~nไม่พบข้อมูลเลขสมาชิก : "+ ls_memno + "(10.1)"
	ithw_exception.text += "<br>~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

if lds_list.retrieve( is_coopcontrol , ls_memno ) > 0 then
	ls_adjslip		= lds_list.object.adjslip_no[1]
	lds_detail.retrieve( is_coopcontrol , ls_adjslip )
end if

astr_keep_adjust.xml_main			= inv_dwxmliesrv.of_xmlexport( lds_main )
astr_keep_adjust.xml_list			= inv_dwxmliesrv.of_xmlexport( lds_list )
astr_keep_adjust.xml_detail		= inv_dwxmliesrv.of_xmlexport( lds_detail )

objdestroy:
this.of_setsrvdwxmlie( false )
this.of_setsrvproc(false)

if isvalid(lds_main) then destroy lds_main
if isvalid(lds_list) then destroy lds_list
if isvalid(lds_detail) then destroy lds_detail

if lb_err then
	ithw_exception.text = "n_cst_keeping_adjust_monthly.of_init_adjmth_ccl()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

public function integer of_save_adjmth_ccl (ref str_keep_adjust astr_keep_adjust) throws Exception;string ls_adjslip
long ll_index , ll_count
boolean lb_err

n_ds lds_list , lds_adj_main , lds_adj_det

this.of_setsrvdwxmlie( true )
this.of_setsrvproc(true)

is_userid			= astr_keep_adjust.cancel_id
idtm_oper		= astr_keep_adjust.operate_date

lds_list = create n_ds
lds_list.dataobject = "d_kp_adjmth_kpms_ccl_list"
lds_list.settransobject( itr_sqlca )

lds_adj_main = create n_ds
lds_adj_main.dataobject = "d_kp_adjust_monthly_main"
lds_adj_main.settransobject( itr_sqlca )

lds_adj_det = create n_ds
lds_adj_det.dataobject = "d_kp_adjust_monthly_detail"
lds_adj_det.settransobject( itr_sqlca )

if inv_dwxmliesrv.of_xmlimport( lds_list , astr_keep_adjust.xml_list ) < 1 then
	ithw_exception.text += "<br>~r~nพบขอผิดพลาดในการนำเข้าข้อมูลยกเลิกใบปรับปรุงใบเสร็จประจำเดือน(0.1)"
	ithw_exception.text += "<br>~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
lds_list.setfilter( "operate_flag > 0" )
lds_list.filter()

// ลบพวกไม่ทำรายการทิ้งไป
lds_list.rowsdiscard( 1, lds_list.filteredcount(), filter! )

ll_count	= lds_list.rowcount()

for ll_index = 1 to ll_count
	
	ls_adjslip		= lds_list.object.adjslip_no[ll_index]
	
	lds_adj_main.retrieve( is_coopcontrol , ls_adjslip )
	
	lds_adj_det.reset()
	// set ค่าในการดึงข้อมูลสมาชิก
	try
		inv_procsrv.of_set_sqldw_column( lds_adj_det, " where slslipadjustdet.coop_id = '" + is_coopcontrol + "' " ) // ใส่เงื่อนไขอื่นๆ
		inv_procsrv.of_set_sqldw_column( lds_adj_det, " and slslipadjustdet.adjslip_no = '"+ ls_adjslip +"' " ) // ใส่เงื่อนไขอื่นๆ
	catch( Exception lthw_setdwsql )
		ithw_exception.text	+= "<br>~r~nพบขอผิดพลาด (0.2)"
		ithw_exception.text	+= "<br>~r~nเลขที่ใบทำรายการ : " + ls_adjslip
		ithw_exception.text	+= lthw_setdwsql.text
		lb_err = true
	end try
	if lb_err then Goto objdestroy
		
	lds_adj_det.retrieve()
	
	lds_adj_main.object.cancel_id[1]		= is_userid
	
	try
		this.of_postslip_adjmth_ccl( lds_adj_main , lds_adj_det )
	catch( Exception lthw_posterr )
		ithw_exception.text	+= "<br>~r~nพบขอผิดพลาดการผ่านรายยกเลิก (70.1)"
		ithw_exception.text	+= "<br>~r~nเลขที่ใบทำรายการ : " + ls_adjslip
		ithw_exception.text	+= lthw_posterr.text
		lb_err = true
	end try
	if lb_err then Goto objdestroy
	
	update slslipadjust
	set slip_status = -9 ,
	cancel_id = :is_userid ,
	cancel_date = :idtm_oper
	where coop_id = :is_coopcontrol
	and adjslip_no = :ls_adjslip
	using itr_sqlca ;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "<br>~r~nไม่สามารถปรับปรุงสถานะใบทำรายการยกเลิกได้ เลขที่ใบทำรายการ : "+ ls_adjslip 
		ithw_exception.text	+= "<br>~r~n" + itr_sqlca.sqlerrtext
		ithw_exception.text	+= "<br>~r~nกรุณาตรวจสอบ"
		throw ithw_exception
	end if
next

objdestroy:
this.of_setsrvdwxmlie( false )
this.of_setsrvproc(false)

if isvalid(lds_list) then destroy lds_list

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_keeping_adjust_monthly.of_save_adjmth_ccl()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

on n_cst_keeping_adjust_monthly.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_keeping_adjust_monthly.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_exception = create Exception
end event

event destructor;if isvalid( ithw_exception ) then destroy ithw_exception
if isvalid( inv_progress ) then destroy inv_progress
if isvalid( inv_stringsrv ) then destroy inv_stringsrv
end event
