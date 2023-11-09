using System.ServiceModel; 
using System.Runtime.Serialization; 
using System.Net.Security; 
using System.ServiceModel.Web; 
using System.ServiceModel.Activation; 
using System.Transactions; 
using Sybase.PowerBuilder.WCFNVO; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[System.Diagnostics.DebuggerStepThrough]
	[ServiceContract(Name="n_cst_finance_service",Namespace="http://tempurl.org")]
	public class n_cst_finance_service : System.IDisposable 
	{
		internal c__n_cst_finance_service __nvo__;
		private bool ____disposed____ = false;
		public void Dispose()
		{
			if (____disposed____)
				return;
			____disposed____ = true;
			c__pbservice125.InitSession(__nvo__.Session);
			Sybase.PowerBuilder.WPF.PBSession.CurrentSession.DestroyObject(__nvo__);
			c__pbservice125.RestoreOldSession();
		}
		public n_cst_finance_service()
		{
			
			c__pbservice125.InitAssembly();
			__nvo__ = (c__n_cst_finance_service)Sybase.PowerBuilder.WPF.PBSession.CurrentSession.CreateInstance(typeof(c__n_cst_finance_service));
			c__pbservice125.RestoreOldSession();
		}
		internal n_cst_finance_service(c__n_cst_finance_service nvo)
		{
			__nvo__ = nvo;
		}
		[OperationContract(Name="of_defaultaccid")]
		public virtual string of_defaultaccid(string as_moneytype)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_moneytype__temp__;
			as_moneytype__temp__ = new Sybase.PowerBuilder.PBString((string)as_moneytype);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_defaultaccid(as_moneytype__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_settrans")]
		public virtual System.Int16 of_settrans(Sybase.PowerBuilder.WCFNVO.n_cst_dbconnectservice anv_conn)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_cst_dbconnectservice anv_conn__temp__ = new c__n_cst_dbconnectservice(); anv_conn.CopyTo(anv_conn__temp__);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_settrans(anv_conn__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postchqmas")]
		public virtual System.Int16 of_postchqmas(string as_chqbook_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_chqbook_xml__temp__;
			as_chqbook_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqbook_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postchqmas(as_chqbook_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_fin_posttobank")]
		public virtual System.Int16 of_fin_posttobank(string as_branch, string as_entry_id, System.DateTime adtm_wdate, string as_machine, string as_item_xmt)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_branch__temp__;
			as_branch__temp__ = new Sybase.PowerBuilder.PBString((string)as_branch);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_item_xmt__temp__;
			as_item_xmt__temp__ = new Sybase.PowerBuilder.PBString((string)as_item_xmt);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_fin_posttobank(as_branch__temp__, as_entry_id__temp__, adtm_wdate__temp__, as_machine__temp__, as_item_xmt__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_chq_bookno")]
		public virtual System.Int16 of_init_chq_bookno(ref string as_chqbook_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_chqbook_xml__temp__ = as_chqbook_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_chq_bookno(ref as_chqbook_xml__temp__);
			as_chqbook_xml = as_chqbook_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_fincashcontrol_process")]
		public virtual System.Int16 of_fincashcontrol_process(string as_fincashcontrol_xml, string as_machined, string as_appname)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_fincashcontrol_xml__temp__;
			as_fincashcontrol_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_fincashcontrol_xml);
			Sybase.PowerBuilder.PBString as_machined__temp__;
			as_machined__temp__ = new Sybase.PowerBuilder.PBString((string)as_machined);
			Sybase.PowerBuilder.PBString as_appname__temp__;
			as_appname__temp__ = new Sybase.PowerBuilder.PBString((string)as_appname);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_fincashcontrol_process(as_fincashcontrol_xml__temp__, as_machined__temp__, as_appname__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_finquery")]
		public virtual System.Int16 of_finquery(string as_appname, string as_user_xml, ref string as_userdetail_xml, ref string as_recv_xml, ref string as_pay_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_appname__temp__;
			as_appname__temp__ = new Sybase.PowerBuilder.PBString((string)as_appname);
			Sybase.PowerBuilder.PBString as_user_xml__temp__;
			as_user_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_user_xml);
			Sybase.PowerBuilder.PBString as_userdetail_xml__temp__ = as_userdetail_xml;
			Sybase.PowerBuilder.PBString as_recv_xml__temp__ = as_recv_xml;
			Sybase.PowerBuilder.PBString as_pay_xml__temp__ = as_pay_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_finquery(as_appname__temp__, as_user_xml__temp__, ref as_userdetail_xml__temp__, ref as_recv_xml__temp__, ref as_pay_xml__temp__);
			as_userdetail_xml = as_userdetail_xml__temp__;
			as_recv_xml = as_recv_xml__temp__;
			as_pay_xml = as_pay_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_payrecv_member")]
		public virtual System.Int16 of_init_payrecv_member(ref string as_main_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_main_xml__temp__ = as_main_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_payrecv_member(ref as_main_xml__temp__);
			as_main_xml = as_main_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_bankaccount_open")]
		public virtual System.Int16 of_init_bankaccount_open(ref Sybase.PowerBuilder.WCFNVO.n_ds ads_data)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_ds ads_data__temp__ = new c__n_ds(); ads_data.CopyTo(ads_data__temp__);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_bankaccount_open_1_1438817508(ref ads_data__temp__);
			ads_data.CopyFrom(ads_data__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postslipbank")]
		public virtual System.Int16 of_postslipbank(string as_main_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postslipbank(as_main_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_posttobank")]
		public virtual System.Int16 of_init_posttobank(string as_branch, System.DateTime adtm_wdate, ref string as_xmlinfo)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_branch__temp__;
			as_branch__temp__ = new Sybase.PowerBuilder.PBString((string)as_branch);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_xmlinfo__temp__ = as_xmlinfo;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_posttobank(as_branch__temp__, adtm_wdate__temp__, ref as_xmlinfo__temp__);
			as_xmlinfo = as_xmlinfo__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_bankaccount_slip")]
		public virtual System.Int16 of_init_bankaccount_slip(ref string as_main_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_main_xml__temp__ = as_main_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_bankaccount_slip(ref as_main_xml__temp__);
			as_main_xml = as_main_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_fincashcontrol_user")]
		public virtual System.Int16 of_init_fincashcontrol_user(ref string as_fincashcontrol_xml, ref string as_fullname)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_fincashcontrol_xml__temp__ = as_fincashcontrol_xml;
			Sybase.PowerBuilder.PBString as_fullname__temp__ = as_fullname;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_fincashcontrol_user(ref as_fincashcontrol_xml__temp__, ref as_fullname__temp__);
			as_fincashcontrol_xml = as_fincashcontrol_xml__temp__;
			as_fullname = as_fullname__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_chkcardtax")]
		public virtual System.Int16 of_chkcardtax(string as_cardtax, string as_memb_no)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_cardtax__temp__;
			as_cardtax__temp__ = new Sybase.PowerBuilder.PBString((string)as_cardtax);
			Sybase.PowerBuilder.PBString as_memb_no__temp__;
			as_memb_no__temp__ = new Sybase.PowerBuilder.PBString((string)as_memb_no);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_chkcardtax(as_cardtax__temp__, as_memb_no__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_bankaccount_else")]
		public virtual System.Int16 of_init_bankaccount_else(System.DateTime adtm_wdate, ref Sybase.PowerBuilder.WCFNVO.n_ds ads_data)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			c__n_ds ads_data__temp__ = new c__n_ds(); ads_data.CopyTo(ads_data__temp__);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_bankaccount_else_2_1438817508(adtm_wdate__temp__, ref ads_data__temp__);
			ads_data.CopyFrom(ads_data__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_chkchqfullfill")]
		public virtual System.Int16 of_chkchqfullfill(string as_branch, Sybase.PowerBuilder.WCFNVO.n_ds ads_chqspilt, ref Sybase.PowerBuilder.WCFNVO.n_ds ads_chqlist)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_branch__temp__;
			as_branch__temp__ = new Sybase.PowerBuilder.PBString((string)as_branch);
			c__n_ds ads_chqspilt__temp__ = new c__n_ds(); ads_chqspilt.CopyTo(ads_chqspilt__temp__);
			c__n_ds ads_chqlist__temp__ = new c__n_ds(); ads_chqlist.CopyTo(ads_chqlist__temp__);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_chkchqfullfill_3_1438817508(as_branch__temp__, ads_chqspilt__temp__, ref ads_chqlist__temp__);
			ads_chqlist.CopyFrom(ads_chqlist__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_paychq_split")]
		public virtual System.Int16 of_init_paychq_split(string as_branch, System.DateTime adtm_wdate, ref string as_chqcond_xml, ref string as_cutbank_xml, ref string as_chqtype_xml, ref string as_chqlist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_branch__temp__;
			as_branch__temp__ = new Sybase.PowerBuilder.PBString((string)as_branch);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_chqcond_xml__temp__ = as_chqcond_xml;
			Sybase.PowerBuilder.PBString as_cutbank_xml__temp__ = as_cutbank_xml;
			Sybase.PowerBuilder.PBString as_chqtype_xml__temp__ = as_chqtype_xml;
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__ = as_chqlist_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_paychq_split(as_branch__temp__, adtm_wdate__temp__, ref as_chqcond_xml__temp__, ref as_cutbank_xml__temp__, ref as_chqtype_xml__temp__, ref as_chqlist_xml__temp__);
			as_chqcond_xml = as_chqcond_xml__temp__;
			as_cutbank_xml = as_cutbank_xml__temp__;
			as_chqtype_xml = as_chqtype_xml__temp__;
			as_chqlist_xml = as_chqlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_setcolumndatamodified")]
		public virtual System.Int16 of_setcolumndatamodified(ref Sybase.PowerBuilder.WCFNVO.n_ds ads_data)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_ds ads_data__temp__ = new c__n_ds(); ads_data.CopyTo(ads_data__temp__);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_setcolumndatamodified_1_1438817508(ref ads_data__temp__);
			ads_data.CopyFrom(ads_data__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_close_day")]
		public virtual System.Int16 of_close_day(string as_appname, string as_closeday_xml, string as_chqwait_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_appname__temp__;
			as_appname__temp__ = new Sybase.PowerBuilder.PBString((string)as_appname);
			Sybase.PowerBuilder.PBString as_closeday_xml__temp__;
			as_closeday_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_closeday_xml);
			Sybase.PowerBuilder.PBString as_chqwait_xml__temp__;
			as_chqwait_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqwait_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_close_day(as_appname__temp__, as_closeday_xml__temp__, as_chqwait_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postfincontrol")]
		public virtual System.Int16 of_postfincontrol(Sybase.PowerBuilder.WCFNVO.n_ds ads_cashmas, string as_machine_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_ds ads_cashmas__temp__ = new c__n_ds(); ads_cashmas.CopyTo(ads_cashmas__temp__);
			Sybase.PowerBuilder.PBString as_machine_id__temp__;
			as_machine_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine_id);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postfincontrol(ads_cashmas__temp__, as_machine_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_fincontact")]
		public virtual System.Int16 of_init_fincontact(ref string as_contact_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_contact_xml__temp__ = as_contact_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_fincontact(ref as_contact_xml__temp__);
			as_contact_xml = as_contact_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postfincontact")]
		public virtual System.Int16 of_postfincontact(string as_contact_xml, string as_action)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_contact_xml__temp__;
			as_contact_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_contact_xml);
			Sybase.PowerBuilder.PBString as_action__temp__;
			as_action__temp__ = new Sybase.PowerBuilder.PBString((string)as_action);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postfincontact(as_contact_xml__temp__, as_action__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postcancelposttobank")]
		public virtual System.Int16 of_postcancelposttobank(string as_branch, string as_entry, System.DateTime adtm_wdate, string as_machine, string as_banklist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_branch__temp__;
			as_branch__temp__ = new Sybase.PowerBuilder.PBString((string)as_branch);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_banklist_xml__temp__;
			as_banklist_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_banklist_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postcancelposttobank(as_branch__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, as_banklist_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_caltax")]
		public virtual System.Int16 of_caltax(ref string as_main_xml, ref string as_taxdet_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_main_xml__temp__ = as_main_xml;
			Sybase.PowerBuilder.PBString as_taxdet_xml__temp__ = as_taxdet_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_caltax(ref as_main_xml__temp__, ref as_taxdet_xml__temp__);
			as_main_xml = as_main_xml__temp__;
			as_taxdet_xml = as_taxdet_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init")]
		public virtual void of_init()
		{
			c__pbservice125.InitSession(__nvo__.Session);
			((c__n_cst_finance_service)__nvo__).of_init();
			c__pbservice125.RestoreOldSession();
		}
		[OperationContract(Name="of_postupdatebankaccount")]
		public virtual System.Int16 of_postupdatebankaccount(string as_bank_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_bank_xml__temp__;
			as_bank_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_bank_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postupdatebankaccount(as_bank_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_postotherto_fin")]
		public virtual System.Int16 of_init_postotherto_fin(ref string as_memb_xml, ref string as_slipmain_xml, ref string as_slipcancel_xml, string as_appname)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_memb_xml__temp__ = as_memb_xml;
			Sybase.PowerBuilder.PBString as_slipmain_xml__temp__ = as_slipmain_xml;
			Sybase.PowerBuilder.PBString as_slipcancel_xml__temp__ = as_slipcancel_xml;
			Sybase.PowerBuilder.PBString as_appname__temp__;
			as_appname__temp__ = new Sybase.PowerBuilder.PBString((string)as_appname);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_postotherto_fin(ref as_memb_xml__temp__, ref as_slipmain_xml__temp__, ref as_slipcancel_xml__temp__, as_appname__temp__);
			as_memb_xml = as_memb_xml__temp__;
			as_slipmain_xml = as_slipmain_xml__temp__;
			as_slipcancel_xml = as_slipcancel_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postpaylon")]
		public virtual System.Int16 of_postpaylon(string as_slipmain_xml, string as_slipdet_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_slipmain_xml__temp__;
			as_slipmain_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipmain_xml);
			Sybase.PowerBuilder.PBString as_slipdet_xml__temp__;
			as_slipdet_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipdet_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postpaylon(as_slipmain_xml__temp__, as_slipdet_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postpayshr")]
		public virtual System.Int16 of_postpayshr(string as_slipmain_xml, string as_slipdet_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_slipmain_xml__temp__;
			as_slipmain_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipmain_xml);
			Sybase.PowerBuilder.PBString as_slipdet_xml__temp__;
			as_slipdet_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipdet_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postpayshr(as_slipmain_xml__temp__, as_slipdet_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postcancelpayout")]
		public virtual System.Int16 of_postcancelpayout(string as_payout_no, string as_branch_id, string as_entry_id, System.DateTime adtm_entry_date)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_payout_no__temp__;
			as_payout_no__temp__ = new Sybase.PowerBuilder.PBString((string)as_payout_no);
			Sybase.PowerBuilder.PBString as_branch_id__temp__;
			as_branch_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_branch_id);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			Sybase.PowerBuilder.PBDateTime adtm_entry_date__temp__;
			adtm_entry_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_entry_date);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postcancelpayout(as_payout_no__temp__, as_branch_id__temp__, as_entry_id__temp__, adtm_entry_date__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postcancelpayin")]
		public virtual System.Int16 of_postcancelpayin(string as_payin_no, string as_branch_id, string as_entry_id, System.DateTime adtm_entry_date)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_payin_no__temp__;
			as_payin_no__temp__ = new Sybase.PowerBuilder.PBString((string)as_payin_no);
			Sybase.PowerBuilder.PBString as_branch_id__temp__;
			as_branch_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_branch_id);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			Sybase.PowerBuilder.PBDateTime adtm_entry_date__temp__;
			adtm_entry_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_entry_date);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postcancelpayin(as_payin_no__temp__, as_branch_id__temp__, as_entry_id__temp__, adtm_entry_date__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postcanceldeptslip")]
		public virtual System.Int16 of_postcanceldeptslip(string as_deptslip_no, string as_branch_id, string as_entry_id, System.DateTime adtm_entry_date)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_deptslip_no__temp__;
			as_deptslip_no__temp__ = new Sybase.PowerBuilder.PBString((string)as_deptslip_no);
			Sybase.PowerBuilder.PBString as_branch_id__temp__;
			as_branch_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_branch_id);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			Sybase.PowerBuilder.PBDateTime adtm_entry_date__temp__;
			adtm_entry_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_entry_date);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postcanceldeptslip(as_deptslip_no__temp__, as_branch_id__temp__, as_entry_id__temp__, adtm_entry_date__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrieveformatchq")]
		public virtual System.Int16 of_retrieveformatchq(string as_branch, string as_bankcode, System.Int16 ai_chqtype, System.Int16 ai_printtype, ref string as_format_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_branch__temp__;
			as_branch__temp__ = new Sybase.PowerBuilder.PBString((string)as_branch);
			Sybase.PowerBuilder.PBString as_bankcode__temp__;
			as_bankcode__temp__ = new Sybase.PowerBuilder.PBString((string)as_bankcode);
			Sybase.PowerBuilder.PBInt ai_chqtype__temp__;
			ai_chqtype__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_chqtype);
			Sybase.PowerBuilder.PBInt ai_printtype__temp__;
			ai_printtype__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_printtype);
			Sybase.PowerBuilder.PBString as_format_xml__temp__ = as_format_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrieveformatchq(as_branch__temp__, as_bankcode__temp__, ai_chqtype__temp__, ai_printtype__temp__, ref as_format_xml__temp__);
			as_format_xml = as_format_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievelistformatchq")]
		public virtual System.Int16 of_retrievelistformatchq(string as_branch, ref string as_formatlist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_branch__temp__;
			as_branch__temp__ = new Sybase.PowerBuilder.PBString((string)as_branch);
			Sybase.PowerBuilder.PBString as_formatlist_xml__temp__ = as_formatlist_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievelistformatchq(as_branch__temp__, ref as_formatlist_xml__temp__);
			as_formatlist_xml = as_formatlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postrecvshrlon")]
		public virtual System.Int16 of_postrecvshrlon(string as_slipmain_xml, string as_slipdet_xml, ref string as_receiveno)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_slipmain_xml__temp__;
			as_slipmain_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipmain_xml);
			Sybase.PowerBuilder.PBString as_slipdet_xml__temp__;
			as_slipdet_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipdet_xml);
			Sybase.PowerBuilder.PBString as_receiveno__temp__ = as_receiveno;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postrecvshrlon(as_slipmain_xml__temp__, as_slipdet_xml__temp__, ref as_receiveno__temp__);
			as_receiveno = as_receiveno__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_printfinstatus")]
		public virtual string of_init_printfinstatus(string as_branch, System.DateTime adtm_wdate)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_branch__temp__;
			as_branch__temp__ = new Sybase.PowerBuilder.PBString((string)as_branch);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_printfinstatus(as_branch__temp__, adtm_wdate__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postfinstatusexport")]
		public virtual System.Int16 of_postfinstatusexport(string as_coopname, string as_mainxml, string as_path)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopname__temp__;
			as_coopname__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopname);
			Sybase.PowerBuilder.PBString as_mainxml__temp__;
			as_mainxml__temp__ = new Sybase.PowerBuilder.PBString((string)as_mainxml);
			Sybase.PowerBuilder.PBString as_path__temp__;
			as_path__temp__ = new Sybase.PowerBuilder.PBString((string)as_path);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postfinstatusexport(as_coopname__temp__, as_mainxml__temp__, as_path__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_openday")]
		public virtual System.Int16 of_init_openday(string as_coop_id, string as_entry_id, System.DateTime adtm_wdate, string as_machine_id, ref string as_startday_info, ref string as_errmessage)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine_id__temp__;
			as_machine_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine_id);
			Sybase.PowerBuilder.PBString as_startday_info__temp__ = as_startday_info;
			Sybase.PowerBuilder.PBString as_errmessage__temp__ = as_errmessage;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_openday(as_coop_id__temp__, as_entry_id__temp__, adtm_wdate__temp__, as_machine_id__temp__, ref as_startday_info__temp__, ref as_errmessage__temp__);
			as_startday_info = as_startday_info__temp__;
			as_errmessage = as_errmessage__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievebankaccount")]
		public virtual System.Int16 of_retrievebankaccount(string as_coopid, ref string as_bank_xml, ref string as_bankstm_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_bank_xml__temp__ = as_bank_xml;
			Sybase.PowerBuilder.PBString as_bankstm_xml__temp__ = as_bankstm_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievebankaccount(as_coopid__temp__, ref as_bank_xml__temp__, ref as_bankstm_xml__temp__);
			as_bank_xml = as_bank_xml__temp__;
			as_bankstm_xml = as_bankstm_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_open_day")]
		public virtual System.Int16 of_open_day(string as_openday_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_openday_xml__temp__;
			as_openday_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_openday_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_open_day(as_openday_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_fincashcontrol")]
		public virtual System.Int16 of_init_fincashcontrol(string as_coop_id, System.DateTime adtm_wdate, string as_permis_id, ref string as_fincashctl_info)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_permis_id__temp__;
			as_permis_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_permis_id);
			Sybase.PowerBuilder.PBString as_fincashctl_info__temp__ = as_fincashctl_info;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_fincashcontrol(as_coop_id__temp__, adtm_wdate__temp__, as_permis_id__temp__, ref as_fincashctl_info__temp__);
			as_fincashctl_info = as_fincashctl_info__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievefinslipdet")]
		public virtual System.Int16 of_retrievefinslipdet(string as_coopid, string as_slipno, ref string as_slipdet_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_slipno__temp__;
			as_slipno__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipno);
			Sybase.PowerBuilder.PBString as_slipdet_xml__temp__ = as_slipdet_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievefinslipdet(as_coopid__temp__, as_slipno__temp__, ref as_slipdet_xml__temp__);
			as_slipdet_xml = as_slipdet_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postcancelslip")]
		public virtual System.Int16 of_postcancelslip(string as_coopid, string as_entry_id, string as_head_xml, string as_cancle_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			Sybase.PowerBuilder.PBString as_head_xml__temp__;
			as_head_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_head_xml);
			Sybase.PowerBuilder.PBString as_cancle_xml__temp__;
			as_cancle_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cancle_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postcancelslip(as_coopid__temp__, as_entry_id__temp__, as_head_xml__temp__, as_cancle_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postotherto_fin")]
		public virtual string of_postotherto_fin(string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_appname, string as_main_xml, string as_itemdet_xml, string as_cancelslip_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_appname__temp__;
			as_appname__temp__ = new Sybase.PowerBuilder.PBString((string)as_appname);
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_itemdet_xml__temp__;
			as_itemdet_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_itemdet_xml);
			Sybase.PowerBuilder.PBString as_cancelslip_xml__temp__;
			as_cancelslip_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cancelslip_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postotherto_fin(as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_appname__temp__, as_main_xml__temp__, as_itemdet_xml__temp__, as_cancelslip_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_itemcaltax")]
		public virtual System.Int16 of_itemcaltax(string as_coopid, System.Int16 ai_recv_pay, System.Int16 ai_calvat, System.Int16 ai_taxcode, decimal adc_itemamt, ref decimal adc_taxamt, ref decimal adc_itemamt_net, ref decimal adc_vatamt)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBInt ai_recv_pay__temp__;
			ai_recv_pay__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_recv_pay);
			Sybase.PowerBuilder.PBInt ai_calvat__temp__;
			ai_calvat__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_calvat);
			Sybase.PowerBuilder.PBInt ai_taxcode__temp__;
			ai_taxcode__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_taxcode);
			Sybase.PowerBuilder.PBDecimal adc_itemamt__temp__;
			adc_itemamt__temp__ = new Sybase.PowerBuilder.PBDecimal((decimal)adc_itemamt);
			Sybase.PowerBuilder.PBDecimal adc_taxamt__temp__ = adc_taxamt;
			Sybase.PowerBuilder.PBDecimal adc_itemamt_net__temp__ = adc_itemamt_net;
			Sybase.PowerBuilder.PBDecimal adc_vatamt__temp__ = adc_vatamt;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_itemcaltax(as_coopid__temp__, ai_recv_pay__temp__, ai_calvat__temp__, ai_taxcode__temp__, adc_itemamt__temp__, ref adc_taxamt__temp__, ref adc_itemamt_net__temp__, ref adc_vatamt__temp__);
			adc_taxamt = adc_taxamt__temp__;
			adc_itemamt_net = adc_itemamt_net__temp__;
			adc_vatamt = adc_vatamt__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_getaddress")]
		public virtual System.Int16 of_getaddress(ref string as_taxaddr, ref string as_taxid, string as_coopid, string as_memberno, System.Int16 ai_memberflag)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_taxaddr__temp__ = as_taxaddr;
			Sybase.PowerBuilder.PBString as_taxid__temp__ = as_taxid;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_memberno__temp__;
			as_memberno__temp__ = new Sybase.PowerBuilder.PBString((string)as_memberno);
			Sybase.PowerBuilder.PBInt ai_memberflag__temp__;
			ai_memberflag__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_memberflag);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_getaddress(ref as_taxaddr__temp__, ref as_taxid__temp__, as_coopid__temp__, as_memberno__temp__, ai_memberflag__temp__);
			as_taxaddr = as_taxaddr__temp__;
			as_taxid = as_taxid__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_payslip")]
		public virtual string of_payslip(string as_main_xml, string as_item_xml, string as_taxdetail_xml, string as_appname)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_item_xml__temp__;
			as_item_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_item_xml);
			Sybase.PowerBuilder.PBString as_taxdetail_xml__temp__;
			as_taxdetail_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_taxdetail_xml);
			Sybase.PowerBuilder.PBString as_appname__temp__;
			as_appname__temp__ = new Sybase.PowerBuilder.PBString((string)as_appname);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_payslip(as_main_xml__temp__, as_item_xml__temp__, as_taxdetail_xml__temp__, as_appname__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_chqlistfrom_slip")]
		public virtual System.Int16 of_init_chqlistfrom_slip(string as_coopid, System.DateTime adtm_wdate, ref string as_chqcond_xml, ref string as_cutbank_xml, ref string as_chqtype_xml, ref string as_chqlist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_chqcond_xml__temp__ = as_chqcond_xml;
			Sybase.PowerBuilder.PBString as_cutbank_xml__temp__ = as_cutbank_xml;
			Sybase.PowerBuilder.PBString as_chqtype_xml__temp__ = as_chqtype_xml;
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__ = as_chqlist_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_chqlistfrom_slip(as_coopid__temp__, adtm_wdate__temp__, ref as_chqcond_xml__temp__, ref as_cutbank_xml__temp__, ref as_chqtype_xml__temp__, ref as_chqlist_xml__temp__);
			as_chqcond_xml = as_chqcond_xml__temp__;
			as_cutbank_xml = as_cutbank_xml__temp__;
			as_chqtype_xml = as_chqtype_xml__temp__;
			as_chqlist_xml = as_chqlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievechqfromslip")]
		public virtual System.Int16 of_retrievechqfromslip(string as_coopid, System.DateTime adtm_wdate, ref string as_chqlist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__ = as_chqlist_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievechqfromslip(as_coopid__temp__, adtm_wdate__temp__, ref as_chqlist_xml__temp__);
			as_chqlist_xml = as_chqlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_chqnoandbank")]
		public virtual System.Int16 of_init_chqnoandbank(string as_coopid, string as_bank, string as_bankbranch, string as_chqbookno, ref string as_accno, ref string as_startchqno)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_bank__temp__;
			as_bank__temp__ = new Sybase.PowerBuilder.PBString((string)as_bank);
			Sybase.PowerBuilder.PBString as_bankbranch__temp__;
			as_bankbranch__temp__ = new Sybase.PowerBuilder.PBString((string)as_bankbranch);
			Sybase.PowerBuilder.PBString as_chqbookno__temp__;
			as_chqbookno__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqbookno);
			Sybase.PowerBuilder.PBString as_accno__temp__ = as_accno;
			Sybase.PowerBuilder.PBString as_startchqno__temp__ = as_startchqno;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_chqnoandbank(as_coopid__temp__, as_bank__temp__, as_bankbranch__temp__, as_chqbookno__temp__, ref as_accno__temp__, ref as_startchqno__temp__);
			as_accno = as_accno__temp__;
			as_startchqno = as_startchqno__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_posttobank")]
		public virtual System.Int16 of_posttobank(string as_coopid, string as_entryid, System.DateTime adtm_wdate, string as_machine, System.Int16 ai_seqno)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBInt ai_seqno__temp__;
			ai_seqno__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_seqno);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_posttobank(as_coopid__temp__, as_entryid__temp__, adtm_wdate__temp__, as_machine__temp__, ai_seqno__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postpaychq_split")]
		public virtual System.Int16 of_postpaychq_split(string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, string as_cond_xml, string as_bankcut_xml, string as_chqtype_xml, string as_chqlist_xml, string as_chqsplit_xml, string as_formset)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_cond_xml__temp__;
			as_cond_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cond_xml);
			Sybase.PowerBuilder.PBString as_bankcut_xml__temp__;
			as_bankcut_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_bankcut_xml);
			Sybase.PowerBuilder.PBString as_chqtype_xml__temp__;
			as_chqtype_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqtype_xml);
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__;
			as_chqlist_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqlist_xml);
			Sybase.PowerBuilder.PBString as_chqsplit_xml__temp__;
			as_chqsplit_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqsplit_xml);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postpaychq_split(as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, as_cond_xml__temp__, as_bankcut_xml__temp__, as_chqtype_xml__temp__, as_chqlist_xml__temp__, as_chqsplit_xml__temp__, as_formset__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postprintpreviewchq")]
		public virtual System.Int16 of_postprintpreviewchq(string as_coopid, string as_bank, System.Int16 ai_chqsize, string as_prnttype, string as_formset)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_bank__temp__;
			as_bank__temp__ = new Sybase.PowerBuilder.PBString((string)as_bank);
			Sybase.PowerBuilder.PBInt ai_chqsize__temp__;
			ai_chqsize__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_chqsize);
			Sybase.PowerBuilder.PBString as_prnttype__temp__;
			as_prnttype__temp__ = new Sybase.PowerBuilder.PBString((string)as_prnttype);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postprintpreviewchq(as_coopid__temp__, as_bank__temp__, ai_chqsize__temp__, as_prnttype__temp__, as_formset__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postpaychq_apvloancbt")]
		public virtual System.Int16 of_postpaychq_apvloancbt(string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, string as_main_xml, string as_payoutslip, string as_formset)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_payoutslip__temp__;
			as_payoutslip__temp__ = new Sybase.PowerBuilder.PBString((string)as_payoutslip);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postpaychq_apvloancbt(as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, as_main_xml__temp__, as_payoutslip__temp__, as_formset__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievecancelchq")]
		public virtual System.Int16 of_retrievecancelchq(string as_coopid, string as_cond_xml, ref string as_chqcancel_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_cond_xml__temp__;
			as_cond_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cond_xml);
			Sybase.PowerBuilder.PBString as_chqcancel_xml__temp__ = as_chqcancel_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievecancelchq(as_coopid__temp__, as_cond_xml__temp__, ref as_chqcancel_xml__temp__);
			as_chqcancel_xml = as_chqcancel_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postcancelchq")]
		public virtual System.Int16 of_postcancelchq(string as_coopid, System.DateTime adtm_wdate, string as_cancleid, string as_machine, string as_cancellist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_cancleid__temp__;
			as_cancleid__temp__ = new Sybase.PowerBuilder.PBString((string)as_cancleid);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_cancellist_xml__temp__;
			as_cancellist_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cancellist_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postcancelchq(as_coopid__temp__, adtm_wdate__temp__, as_cancleid__temp__, as_machine__temp__, as_cancellist_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postbridgechqcancel")]
		public virtual System.Int16 of_postbridgechqcancel(string as_coopid, string as_referslip, string as_bank, string as_bankbranch, string as_chqbookno, string as_chqno, System.Int16 ai_seqno)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_referslip__temp__;
			as_referslip__temp__ = new Sybase.PowerBuilder.PBString((string)as_referslip);
			Sybase.PowerBuilder.PBString as_bank__temp__;
			as_bank__temp__ = new Sybase.PowerBuilder.PBString((string)as_bank);
			Sybase.PowerBuilder.PBString as_bankbranch__temp__;
			as_bankbranch__temp__ = new Sybase.PowerBuilder.PBString((string)as_bankbranch);
			Sybase.PowerBuilder.PBString as_chqbookno__temp__;
			as_chqbookno__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqbookno);
			Sybase.PowerBuilder.PBString as_chqno__temp__;
			as_chqno__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqno);
			Sybase.PowerBuilder.PBInt ai_seqno__temp__;
			ai_seqno__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_seqno);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postbridgechqcancel(as_coopid__temp__, as_referslip__temp__, as_bank__temp__, as_bankbranch__temp__, as_chqbookno__temp__, as_chqno__temp__, ai_seqno__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrieve_cancleslip")]
		public virtual System.Int16 of_retrieve_cancleslip(string as_coopid, string as_head_xml, ref string as_itemlist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_head_xml__temp__;
			as_head_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_head_xml);
			Sybase.PowerBuilder.PBString as_itemlist_xml__temp__ = as_itemlist_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrieve_cancleslip(as_coopid__temp__, as_head_xml__temp__, ref as_itemlist_xml__temp__);
			as_itemlist_xml = as_itemlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievechangchqdetail")]
		public virtual System.Int16 of_retrievechangchqdetail(string as_coopid, string as_chqno, string as_bookno, string as_bank, string as_bankbranch, System.Int16 ai_seqno, ref string as_chqdetail_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_chqno__temp__;
			as_chqno__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqno);
			Sybase.PowerBuilder.PBString as_bookno__temp__;
			as_bookno__temp__ = new Sybase.PowerBuilder.PBString((string)as_bookno);
			Sybase.PowerBuilder.PBString as_bank__temp__;
			as_bank__temp__ = new Sybase.PowerBuilder.PBString((string)as_bank);
			Sybase.PowerBuilder.PBString as_bankbranch__temp__;
			as_bankbranch__temp__ = new Sybase.PowerBuilder.PBString((string)as_bankbranch);
			Sybase.PowerBuilder.PBInt ai_seqno__temp__;
			ai_seqno__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_seqno);
			Sybase.PowerBuilder.PBString as_chqdetail_xml__temp__ = as_chqdetail_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievechangchqdetail(as_coopid__temp__, as_chqno__temp__, as_bookno__temp__, as_bank__temp__, as_bankbranch__temp__, ai_seqno__temp__, ref as_chqdetail_xml__temp__);
			as_chqdetail_xml = as_chqdetail_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievechangechqstatus")]
		public virtual System.Int16 of_retrievechangechqstatus(string as_coopid, ref string as_chqlist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__ = as_chqlist_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievechangechqstatus(as_coopid__temp__, ref as_chqlist_xml__temp__);
			as_chqlist_xml = as_chqlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postchangedstatuschq")]
		public virtual System.Int16 of_postchangedstatuschq(string as_coopid, string as_entry_id, System.DateTime adtm_wdate, string as_machine, string as_chqno, string as_chqbookno, string as_bank, string as_bankbranch, System.Int16 as_chqseq_no, System.Int16 ai_chqstatus)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_chqno__temp__;
			as_chqno__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqno);
			Sybase.PowerBuilder.PBString as_chqbookno__temp__;
			as_chqbookno__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqbookno);
			Sybase.PowerBuilder.PBString as_bank__temp__;
			as_bank__temp__ = new Sybase.PowerBuilder.PBString((string)as_bank);
			Sybase.PowerBuilder.PBString as_bankbranch__temp__;
			as_bankbranch__temp__ = new Sybase.PowerBuilder.PBString((string)as_bankbranch);
			Sybase.PowerBuilder.PBInt as_chqseq_no__temp__;
			as_chqseq_no__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)as_chqseq_no);
			Sybase.PowerBuilder.PBInt ai_chqstatus__temp__;
			ai_chqstatus__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_chqstatus);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postchangedstatuschq(as_coopid__temp__, as_entry_id__temp__, adtm_wdate__temp__, as_machine__temp__, as_chqno__temp__, as_chqbookno__temp__, as_bank__temp__, as_bankbranch__temp__, as_chqseq_no__temp__, ai_chqstatus__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievepaychqlist")]
		public virtual System.Int16 of_retrievepaychqlist(string as_coopid, System.DateTime adtm_wdate, ref string as_chqlist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__ = as_chqlist_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievepaychqlist(as_coopid__temp__, adtm_wdate__temp__, ref as_chqlist_xml__temp__);
			as_chqlist_xml = as_chqlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_paychq")]
		public virtual System.Int16 of_init_paychq(string as_coopid, System.DateTime adtm_wdate, ref string as_main_xml, ref string as_chqlist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_main_xml__temp__ = as_main_xml;
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__ = as_chqlist_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_paychq(as_coopid__temp__, adtm_wdate__temp__, ref as_main_xml__temp__, ref as_chqlist_xml__temp__);
			as_main_xml = as_main_xml__temp__;
			as_chqlist_xml = as_chqlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postcancelsendchq")]
		public virtual System.Int16 of_postcancelsendchq(string as_coopid, string as_chqno, string as_bank, string as_bankbranch, System.Int16 ai_seqno)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_chqno__temp__;
			as_chqno__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqno);
			Sybase.PowerBuilder.PBString as_bank__temp__;
			as_bank__temp__ = new Sybase.PowerBuilder.PBString((string)as_bank);
			Sybase.PowerBuilder.PBString as_bankbranch__temp__;
			as_bankbranch__temp__ = new Sybase.PowerBuilder.PBString((string)as_bankbranch);
			Sybase.PowerBuilder.PBInt ai_seqno__temp__;
			ai_seqno__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_seqno);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postcancelsendchq(as_coopid__temp__, as_chqno__temp__, as_bank__temp__, as_bankbranch__temp__, ai_seqno__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_sendchq")]
		public virtual System.Int16 of_init_sendchq(string as_coopid, string as_entry, System.DateTime adtm_wdate, ref string as_sendchq_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_sendchq_xml__temp__ = as_sendchq_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_sendchq(as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, ref as_sendchq_xml__temp__);
			as_sendchq_xml = as_sendchq_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postsavesendchq")]
		public virtual System.Int16 of_postsavesendchq(string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, string as_sendchq_xml, string as_waitchq_xml, string as_sendchqacc_xml, System.Int16 ai_accknow)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_sendchq_xml__temp__;
			as_sendchq_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_sendchq_xml);
			Sybase.PowerBuilder.PBString as_waitchq_xml__temp__;
			as_waitchq_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_waitchq_xml);
			Sybase.PowerBuilder.PBString as_sendchqacc_xml__temp__;
			as_sendchqacc_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_sendchqacc_xml);
			Sybase.PowerBuilder.PBInt ai_accknow__temp__;
			ai_accknow__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_accknow);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postsavesendchq(as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, as_sendchq_xml__temp__, as_waitchq_xml__temp__, as_sendchqacc_xml__temp__, ai_accknow__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievecancel_sendchq")]
		public virtual System.Int16 of_retrievecancel_sendchq(string as_coopid, System.DateTime adtm_wdate, string as_bank_xml, ref string as_cancellist)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_bank_xml__temp__;
			as_bank_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_bank_xml);
			Sybase.PowerBuilder.PBString as_cancellist__temp__ = as_cancellist;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievecancel_sendchq(as_coopid__temp__, adtm_wdate__temp__, as_bank_xml__temp__, ref as_cancellist__temp__);
			as_cancellist = as_cancellist__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postcancel_sendchq")]
		public virtual System.Int16 of_postcancel_sendchq(string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, string as_bank_xml, string as_cancellist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_bank_xml__temp__;
			as_bank_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_bank_xml);
			Sybase.PowerBuilder.PBString as_cancellist_xml__temp__;
			as_cancellist_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cancellist_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postcancel_sendchq(as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, as_bank_xml__temp__, as_cancellist_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievereprintreceipt")]
		public virtual System.Int16 of_retrievereprintreceipt(string as_coopid, string as_cond_xml, ref string as_list_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_cond_xml__temp__;
			as_cond_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cond_xml);
			Sybase.PowerBuilder.PBString as_list_xml__temp__ = as_list_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievereprintreceipt(as_coopid__temp__, as_cond_xml__temp__, ref as_list_xml__temp__);
			as_list_xml = as_list_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postreprintreceipt")]
		public virtual System.Int16 of_postreprintreceipt(string as_coopid, System.DateTime adtm_wdate, string as_list_xml, string as_formset, ref string as_message)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_list_xml__temp__;
			as_list_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_list_xml);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			Sybase.PowerBuilder.PBString as_message__temp__ = as_message;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postreprintreceipt(as_coopid__temp__, adtm_wdate__temp__, as_list_xml__temp__, as_formset__temp__, ref as_message__temp__);
			as_message = as_message__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postprintslip")]
		public virtual System.Int16 of_postprintslip(string as_coopid, string as_slipno, string as_formset)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_slipno__temp__;
			as_slipno__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipno);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postprintslip(as_coopid__temp__, as_slipno__temp__, as_formset__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievereprintpayslip")]
		public virtual System.Int16 of_retrievereprintpayslip(string as_coopid, string as_cond_xml, ref string as_slip_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_cond_xml__temp__;
			as_cond_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cond_xml);
			Sybase.PowerBuilder.PBString as_slip_xml__temp__ = as_slip_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievereprintpayslip(as_coopid__temp__, as_cond_xml__temp__, ref as_slip_xml__temp__);
			as_slip_xml = as_slip_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postreprintpayslip")]
		public virtual System.Int16 of_postreprintpayslip(string as_coopid, System.DateTime adtm_wdate, string as_list_xml, string as_formset, ref string as_message)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_list_xml__temp__;
			as_list_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_list_xml);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			Sybase.PowerBuilder.PBString as_message__temp__ = as_message;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postreprintpayslip(as_coopid__temp__, adtm_wdate__temp__, as_list_xml__temp__, as_formset__temp__, ref as_message__temp__);
			as_message = as_message__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievetaxpay")]
		public virtual System.Int16 of_retrievetaxpay(string as_coopid, string as_main_xml, ref string as_list_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_list_xml__temp__ = as_list_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievetaxpay(as_coopid__temp__, as_main_xml__temp__, ref as_list_xml__temp__);
			as_list_xml = as_list_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postreprinttaxpay")]
		public virtual System.Int16 of_postreprinttaxpay(string as_coopid, System.DateTime adtm_wdate, string as_slipno, System.Int16 ai_topay, System.Int16 ai_keep, System.Int16 ai_formcoop, string as_formset)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_slipno__temp__;
			as_slipno__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipno);
			Sybase.PowerBuilder.PBInt ai_topay__temp__;
			ai_topay__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_topay);
			Sybase.PowerBuilder.PBInt ai_keep__temp__;
			ai_keep__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_keep);
			Sybase.PowerBuilder.PBInt ai_formcoop__temp__;
			ai_formcoop__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_formcoop);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postreprinttaxpay(as_coopid__temp__, adtm_wdate__temp__, as_slipno__temp__, ai_topay__temp__, ai_keep__temp__, ai_formcoop__temp__, as_formset__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postprinttaxpay")]
		public virtual System.Int16 of_postprinttaxpay(string as_coopid, string as_slipno, string as_formset)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_slipno__temp__;
			as_slipno__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipno);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postprinttaxpay(as_coopid__temp__, as_slipno__temp__, as_formset__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_close_day")]
		public virtual System.Int16 of_init_close_day(string as_coopid, string as_entry_id, System.DateTime adtm_wdate, string as_appname, ref string as_closeday_xml, ref string as_chqwait_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_appname__temp__;
			as_appname__temp__ = new Sybase.PowerBuilder.PBString((string)as_appname);
			Sybase.PowerBuilder.PBString as_closeday_xml__temp__ = as_closeday_xml;
			Sybase.PowerBuilder.PBString as_chqwait_xml__temp__ = as_chqwait_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_close_day(as_coopid__temp__, as_entry_id__temp__, adtm_wdate__temp__, as_appname__temp__, ref as_closeday_xml__temp__, ref as_chqwait_xml__temp__);
			as_closeday_xml = as_closeday_xml__temp__;
			as_chqwait_xml = as_chqwait_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievechq")]
		public virtual System.Int16 of_retrievechq(string as_coopid, System.DateTime adtm_wdate)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievechq(as_coopid__temp__, adtm_wdate__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievereprintchq")]
		public virtual System.Int16 of_retrievereprintchq(string as_coopid, string as_retreive_xml, ref string as_chqlist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_retreive_xml__temp__;
			as_retreive_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_retreive_xml);
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__ = as_chqlist_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievereprintchq(as_coopid__temp__, as_retreive_xml__temp__, ref as_chqlist_xml__temp__);
			as_chqlist_xml = as_chqlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postprintslipcashctrl")]
		public virtual System.Int16 of_postprintslipcashctrl(string as_coopid, string as_coopname, string as_apprv_id, string as_username, System.DateTime adtm_workdate, System.Int16 ai_slipcastseq_no, string as_formset)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_coopname__temp__;
			as_coopname__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopname);
			Sybase.PowerBuilder.PBString as_apprv_id__temp__;
			as_apprv_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_apprv_id);
			Sybase.PowerBuilder.PBString as_username__temp__;
			as_username__temp__ = new Sybase.PowerBuilder.PBString((string)as_username);
			Sybase.PowerBuilder.PBDateTime adtm_workdate__temp__;
			adtm_workdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_workdate);
			Sybase.PowerBuilder.PBInt ai_slipcastseq_no__temp__;
			ai_slipcastseq_no__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_slipcastseq_no);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postprintslipcashctrl(as_coopid__temp__, as_coopname__temp__, as_apprv_id__temp__, as_username__temp__, adtm_workdate__temp__, ai_slipcastseq_no__temp__, as_formset__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_payrecv_slip")]
		public virtual System.Int16 of_init_payrecv_slip(string as_coop_id, string as_entry_id, string as_machine, System.DateTime adtm_wdate, System.Int16 as_recvpay_status, ref string as_slipmain_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBInt as_recvpay_status__temp__;
			as_recvpay_status__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)as_recvpay_status);
			Sybase.PowerBuilder.PBString as_slipmain_xml__temp__ = as_slipmain_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_payrecv_slip(as_coop_id__temp__, as_entry_id__temp__, as_machine__temp__, adtm_wdate__temp__, as_recvpay_status__temp__, ref as_slipmain_xml__temp__);
			as_slipmain_xml = as_slipmain_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_paychq_apvloancbt")]
		public virtual System.Int16 of_init_paychq_apvloancbt(string as_coopid, System.DateTime adtm_wdate, ref string as_main_xml, ref string as_chqlist_xml, string as_cashtype)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_main_xml__temp__ = as_main_xml;
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__ = as_chqlist_xml;
			Sybase.PowerBuilder.PBString as_cashtype__temp__;
			as_cashtype__temp__ = new Sybase.PowerBuilder.PBString((string)as_cashtype);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_paychq_apvloancbt(as_coopid__temp__, adtm_wdate__temp__, ref as_main_xml__temp__, ref as_chqlist_xml__temp__, as_cashtype__temp__);
			as_main_xml = as_main_xml__temp__;
			as_chqlist_xml = as_chqlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievechqfrom_apvloancbt")]
		public virtual System.Int16 of_retrievechqfrom_apvloancbt(string as_coopid, System.DateTime adtm_wdate, string as_bankcode, string as_lngroupcode, ref string as_chqlist_xml, string as_cashtype)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_bankcode__temp__;
			as_bankcode__temp__ = new Sybase.PowerBuilder.PBString((string)as_bankcode);
			Sybase.PowerBuilder.PBString as_lngroupcode__temp__;
			as_lngroupcode__temp__ = new Sybase.PowerBuilder.PBString((string)as_lngroupcode);
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__ = as_chqlist_xml;
			Sybase.PowerBuilder.PBString as_cashtype__temp__;
			as_cashtype__temp__ = new Sybase.PowerBuilder.PBString((string)as_cashtype);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievechqfrom_apvloancbt(as_coopid__temp__, adtm_wdate__temp__, as_bankcode__temp__, as_lngroupcode__temp__, ref as_chqlist_xml__temp__, as_cashtype__temp__);
			as_chqlist_xml = as_chqlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_paychq_manual")]
		public virtual System.Int16 of_init_paychq_manual(string as_coopid, System.DateTime adtm_wdate, ref string as_main_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_main_xml__temp__ = as_main_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_paychq_manual(as_coopid__temp__, adtm_wdate__temp__, ref as_main_xml__temp__);
			as_main_xml = as_main_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postdeptslip_tofin")]
		public virtual System.Int16 of_postdeptslip_tofin(string as_coopid, string as_member_no, string as_deptslip_no, System.DateTime adtm_operate, string as_entryid)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_member_no__temp__;
			as_member_no__temp__ = new Sybase.PowerBuilder.PBString((string)as_member_no);
			Sybase.PowerBuilder.PBString as_deptslip_no__temp__;
			as_deptslip_no__temp__ = new Sybase.PowerBuilder.PBString((string)as_deptslip_no);
			Sybase.PowerBuilder.PBDateTime adtm_operate__temp__;
			adtm_operate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_operate);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postdeptslip_tofin(as_coopid__temp__, as_member_no__temp__, as_deptslip_no__temp__, adtm_operate__temp__, as_entryid__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postprocessotherto_fin")]
		public virtual System.Int16 of_postprocessotherto_fin(string as_coopid, string as_entryid, System.DateTime adtm_wdate, string as_machineid, string as_procxml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machineid__temp__;
			as_machineid__temp__ = new Sybase.PowerBuilder.PBString((string)as_machineid);
			Sybase.PowerBuilder.PBString as_procxml__temp__;
			as_procxml__temp__ = new Sybase.PowerBuilder.PBString((string)as_procxml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postprocessotherto_fin(as_coopid__temp__, as_entryid__temp__, adtm_wdate__temp__, as_machineid__temp__, as_procxml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postpaychq_fromslip")]
		public virtual string of_postpaychq_fromslip(string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, string as_cond_xml, string as_cutbank_xml, string as_chqtype_xml, string as_chqllist_xml, string as_formset)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_cond_xml__temp__;
			as_cond_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cond_xml);
			Sybase.PowerBuilder.PBString as_cutbank_xml__temp__;
			as_cutbank_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cutbank_xml);
			Sybase.PowerBuilder.PBString as_chqtype_xml__temp__;
			as_chqtype_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqtype_xml);
			Sybase.PowerBuilder.PBString as_chqllist_xml__temp__;
			as_chqllist_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqllist_xml);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postpaychq_fromslip(as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, as_cond_xml__temp__, as_cutbank_xml__temp__, as_chqtype_xml__temp__, as_chqllist_xml__temp__, as_formset__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postreprintchq")]
		public virtual string of_postreprintchq(string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, string as_formset, string as_cond_xml, string as_retreive_xml, string as_chqlist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			Sybase.PowerBuilder.PBString as_cond_xml__temp__;
			as_cond_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cond_xml);
			Sybase.PowerBuilder.PBString as_retreive_xml__temp__;
			as_retreive_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_retreive_xml);
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__;
			as_chqlist_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqlist_xml);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postreprintchq(as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, as_formset__temp__, as_cond_xml__temp__, as_retreive_xml__temp__, as_chqlist_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postpaychq_manual")]
		public virtual string of_postpaychq_manual(string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, string as_main_xml, string as_formset)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postpaychq_manual(as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, as_main_xml__temp__, as_formset__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postpaychq")]
		public virtual string of_postpaychq(string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, string as_main_xml, string as_slipno, string as_formset)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_slipno__temp__;
			as_slipno__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipno);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postpaychq(as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, as_main_xml__temp__, as_slipno__temp__, as_formset__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievechqfromapvloan")]
		public virtual System.Int16 of_retrievechqfromapvloan(string as_coopcltr, System.DateTime adtm_wdate, string as_cashtype, ref string as_chqlist_xml, string as_bankcode, string as_bankbranch)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopcltr__temp__;
			as_coopcltr__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopcltr);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_cashtype__temp__;
			as_cashtype__temp__ = new Sybase.PowerBuilder.PBString((string)as_cashtype);
			Sybase.PowerBuilder.PBString as_chqlist_xml__temp__ = as_chqlist_xml;
			Sybase.PowerBuilder.PBString as_bankcode__temp__;
			as_bankcode__temp__ = new Sybase.PowerBuilder.PBString((string)as_bankcode);
			Sybase.PowerBuilder.PBString as_bankbranch__temp__;
			as_bankbranch__temp__ = new Sybase.PowerBuilder.PBString((string)as_bankbranch);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievechqfromapvloan(as_coopcltr__temp__, adtm_wdate__temp__, as_cashtype__temp__, ref as_chqlist_xml__temp__, as_bankcode__temp__, as_bankbranch__temp__);
			as_chqlist_xml = as_chqlist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postpaychq_fromapvloan")]
		public virtual string of_postpaychq_fromapvloan(string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, string as_cond_xml, string as_cutbank_xml, string as_chqtype_xml, string as_payoutslip, string as_formset)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_cond_xml__temp__;
			as_cond_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cond_xml);
			Sybase.PowerBuilder.PBString as_cutbank_xml__temp__;
			as_cutbank_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cutbank_xml);
			Sybase.PowerBuilder.PBString as_chqtype_xml__temp__;
			as_chqtype_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_chqtype_xml);
			Sybase.PowerBuilder.PBString as_payoutslip__temp__;
			as_payoutslip__temp__ = new Sybase.PowerBuilder.PBString((string)as_payoutslip);
			Sybase.PowerBuilder.PBString as_formset__temp__;
			as_formset__temp__ = new Sybase.PowerBuilder.PBString((string)as_formset);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postpaychq_fromapvloan(as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, as_cond_xml__temp__, as_cutbank_xml__temp__, as_chqtype_xml__temp__, as_payoutslip__temp__, as_formset__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_payrcv_listslipcmf")]
		public virtual string of_init_payrcv_listslipcmf(System.DateTime adtm_workdate, string as_coopid, string as_refsys, System.Int16 ai_payrecv)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_workdate__temp__;
			adtm_workdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_workdate);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_refsys__temp__;
			as_refsys__temp__ = new Sybase.PowerBuilder.PBString((string)as_refsys);
			Sybase.PowerBuilder.PBInt ai_payrecv__temp__;
			ai_payrecv__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_payrecv);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_payrcv_listslipcmf(adtm_workdate__temp__, as_coopid__temp__, as_refsys__temp__, ai_payrecv__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postshrlonto_fincfm")]
		public virtual System.Int16 of_postshrlonto_fincfm(string as_slipno, string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, ref string as_cancelslipno, System.Int16 ai_status)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_slipno__temp__;
			as_slipno__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipno);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_cancelslipno__temp__ = as_cancelslipno;
			Sybase.PowerBuilder.PBInt ai_status__temp__;
			ai_status__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_status);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postshrlonto_fincfm(as_slipno__temp__, as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, ref as_cancelslipno__temp__, ai_status__temp__);
			as_cancelslipno = as_cancelslipno__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_isexistfinslip")]
		public virtual System.Int16 of_isexistfinslip(string as_slipno, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_slipno__temp__;
			as_slipno__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipno);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_isexistfinslip(as_slipno__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_payrecv_slipcfm")]
		public virtual System.Int16 of_init_payrecv_slipcfm(string as_coopid, string as_slipno, string as_entryid, string as_machine, System.DateTime adtm_wdate, ref string as_xmlfinslip, ref string as_xmlfinslipdet)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_slipno__temp__;
			as_slipno__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipno);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_xmlfinslip__temp__ = as_xmlfinslip;
			Sybase.PowerBuilder.PBString as_xmlfinslipdet__temp__ = as_xmlfinslipdet;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_payrecv_slipcfm(as_coopid__temp__, as_slipno__temp__, as_entryid__temp__, as_machine__temp__, adtm_wdate__temp__, ref as_xmlfinslip__temp__, ref as_xmlfinslipdet__temp__);
			as_xmlfinslip = as_xmlfinslip__temp__;
			as_xmlfinslipdet = as_xmlfinslipdet__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postlonlwdto_fin")]
		public virtual System.Int16 of_postlonlwdto_fin(Sybase.PowerBuilder.WCFNVO.n_ds ads_data, string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, ref string as_cancelslipno)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_ds ads_data__temp__ = new c__n_ds(); ads_data.CopyTo(ads_data__temp__);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_cancelslipno__temp__ = as_cancelslipno;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postlonlwdto_fin(ads_data__temp__, as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, ref as_cancelslipno__temp__);
			as_cancelslipno = as_cancelslipno__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postcash")]
		public virtual System.Int16 of_postcash(Sybase.PowerBuilder.WCFNVO.str_slipinfo astr_slipinfo, System.Int16 as_row, string as_entryid)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__str_slipinfo astr_slipinfo__temp__ = new c__str_slipinfo(); astr_slipinfo.CopyTo(astr_slipinfo__temp__);
			Sybase.PowerBuilder.PBInt as_row__temp__;
			as_row__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)as_row);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postcash(astr_slipinfo__temp__, as_row__temp__, as_entryid__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_payrecv_slipdlg")]
		public virtual System.Int16 of_init_payrecv_slipdlg(string as_coopid, string as_slipno, string as_entryid, string as_machine, System.DateTime adtm_wdate, ref string as_xmlfinslip, ref string as_xmlfinslipdet)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_slipno__temp__;
			as_slipno__temp__ = new Sybase.PowerBuilder.PBString((string)as_slipno);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_xmlfinslip__temp__ = as_xmlfinslip;
			Sybase.PowerBuilder.PBString as_xmlfinslipdet__temp__ = as_xmlfinslipdet;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_init_payrecv_slipdlg(as_coopid__temp__, as_slipno__temp__, as_entryid__temp__, as_machine__temp__, adtm_wdate__temp__, ref as_xmlfinslip__temp__, ref as_xmlfinslipdet__temp__);
			as_xmlfinslip = as_xmlfinslip__temp__;
			as_xmlfinslipdet = as_xmlfinslipdet__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_payslip_pea")]
		public virtual string of_payslip_pea(string as_main_xml, string as_item_xml, string as_taxdetail_xml, string as_appname)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_item_xml__temp__;
			as_item_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_item_xml);
			Sybase.PowerBuilder.PBString as_taxdetail_xml__temp__;
			as_taxdetail_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_taxdetail_xml);
			Sybase.PowerBuilder.PBString as_appname__temp__;
			as_appname__temp__ = new Sybase.PowerBuilder.PBString((string)as_appname);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_payslip_pea(as_main_xml__temp__, as_item_xml__temp__, as_taxdetail_xml__temp__, as_appname__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postetcto_fin")]
		public virtual System.Int16 of_postetcto_fin(Sybase.PowerBuilder.WCFNVO.n_ds ads_data, string as_coopid, string as_entry, System.DateTime adtm_wdate, string as_machine, string as_cancelslipno)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_ds ads_data__temp__ = new c__n_ds(); ads_data.CopyTo(ads_data__temp__);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entry__temp__;
			as_entry__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			Sybase.PowerBuilder.PBString as_machine__temp__;
			as_machine__temp__ = new Sybase.PowerBuilder.PBString((string)as_machine);
			Sybase.PowerBuilder.PBString as_cancelslipno__temp__;
			as_cancelslipno__temp__ = new Sybase.PowerBuilder.PBString((string)as_cancelslipno);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postetcto_fin(ads_data__temp__, as_coopid__temp__, as_entry__temp__, adtm_wdate__temp__, as_machine__temp__, as_cancelslipno__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_payslip_pia")]
		public virtual string of_payslip_pia(string as_main_xml, string as_item_xml, string as_taxdetail_xml, string as_appname)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_item_xml__temp__;
			as_item_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_item_xml);
			Sybase.PowerBuilder.PBString as_taxdetail_xml__temp__;
			as_taxdetail_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_taxdetail_xml);
			Sybase.PowerBuilder.PBString as_appname__temp__;
			as_appname__temp__ = new Sybase.PowerBuilder.PBString((string)as_appname);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_payslip_pia(as_main_xml__temp__, as_item_xml__temp__, as_taxdetail_xml__temp__, as_appname__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postyrto_fin")]
		public virtual System.Int16 of_postyrto_fin(Sybase.PowerBuilder.WCFNVO.n_ds ads_data)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_ds ads_data__temp__ = new c__n_ds(); ads_data.CopyTo(ads_data__temp__);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postyrto_fin(ads_data__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postdivto_fin")]
		public virtual System.Int16 of_postdivto_fin(System.DateTime adtm_date, string as_coopid)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_date__temp__;
			adtm_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_date);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_postdivto_fin(adtm_date__temp__, as_coopid__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_retrievereprintpayslip_ir")]
		public virtual System.Int16 of_retrievereprintpayslip_ir(string as_coopid, string as_cond_xml, ref string as_slip_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_cond_xml__temp__;
			as_cond_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cond_xml);
			Sybase.PowerBuilder.PBString as_slip_xml__temp__ = as_slip_xml;
			__retval__ = ((c__n_cst_finance_service)__nvo__).of_retrievereprintpayslip_ir(as_coopid__temp__, as_cond_xml__temp__, ref as_slip_xml__temp__);
			as_slip_xml = as_slip_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
	}
} 