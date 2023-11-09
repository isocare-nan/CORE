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
	[ServiceContract(Name="n_cst_moneyorder_service",Namespace="http://tempurl.org")]
	public class n_cst_moneyorder_service : System.IDisposable 
	{
		internal c__n_cst_moneyorder_service __nvo__;
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
		public n_cst_moneyorder_service()
		{
			
			c__pbservice125.InitAssembly();
			__nvo__ = (c__n_cst_moneyorder_service)Sybase.PowerBuilder.WPF.PBSession.CurrentSession.CreateInstance(typeof(c__n_cst_moneyorder_service));
			c__pbservice125.RestoreOldSession();
		}
		internal n_cst_moneyorder_service(c__n_cst_moneyorder_service nvo)
		{
			__nvo__ = nvo;
		}
		[OperationContract(Name="of_save_moneyorder")]
		public virtual System.Int16 of_save_moneyorder(string as_moneyorder_master_xml, string as_moneyorder_detail_xml, string as_entryid, System.DateTime adtm_entry)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_moneyorder_master_xml__temp__;
			as_moneyorder_master_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_moneyorder_master_xml);
			Sybase.PowerBuilder.PBString as_moneyorder_detail_xml__temp__;
			as_moneyorder_detail_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_moneyorder_detail_xml);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			Sybase.PowerBuilder.PBDateTime adtm_entry__temp__;
			adtm_entry__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_entry);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_save_moneyorder(as_moneyorder_master_xml__temp__, as_moneyorder_detail_xml__temp__, as_entryid__temp__, adtm_entry__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_err_generate_import_xml")]
		public virtual string of_err_generate_import_xml(System.Int16 ai_error)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBInt ai_error__temp__;
			ai_error__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_error);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_err_generate_import_xml(ai_error__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_moneyorder")]
		public virtual string of_init_moneyorder(string as_moneyorder_master_xml, string as_entryid, System.DateTime adtm_entry)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBString as_moneyorder_master_xml__temp__;
			as_moneyorder_master_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_moneyorder_master_xml);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			Sybase.PowerBuilder.PBDateTime adtm_entry__temp__;
			adtm_entry__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_entry);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_init_moneyorder(as_moneyorder_master_xml__temp__, as_entryid__temp__, adtm_entry__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_approve_moneyorder")]
		public virtual System.Int16 of_approve_moneyorder(string as_moneyorder_list_xml, string as_entryid, System.DateTime adtm_entry)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_moneyorder_list_xml__temp__;
			as_moneyorder_list_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_moneyorder_list_xml);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			Sybase.PowerBuilder.PBDateTime adtm_entry__temp__;
			adtm_entry__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_entry);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_approve_moneyorder(as_moneyorder_list_xml__temp__, as_entryid__temp__, adtm_entry__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init")]
		public virtual System.Int16 of_init(Sybase.PowerBuilder.WCFNVO.n_cst_dbconnectservice anv_db)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_cst_dbconnectservice anv_db__temp__ = new c__n_cst_dbconnectservice(); anv_db.CopyTo(anv_db__temp__);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_init(anv_db__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_operate_moneyorder")]
		public virtual System.Int16 of_operate_moneyorder(string as_ptbdocno, string as_ptbtypecode, System.Int32 al_seqno, string as_ptodocno, System.Int16 ai_ptoflag, string as_entryid, System.DateTime adtm_entry)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_ptbdocno__temp__;
			as_ptbdocno__temp__ = new Sybase.PowerBuilder.PBString((string)as_ptbdocno);
			Sybase.PowerBuilder.PBString as_ptbtypecode__temp__;
			as_ptbtypecode__temp__ = new Sybase.PowerBuilder.PBString((string)as_ptbtypecode);
			Sybase.PowerBuilder.PBLong al_seqno__temp__;
			al_seqno__temp__ = new Sybase.PowerBuilder.PBLong((System.Int32)al_seqno);
			Sybase.PowerBuilder.PBString as_ptodocno__temp__;
			as_ptodocno__temp__ = new Sybase.PowerBuilder.PBString((string)as_ptodocno);
			Sybase.PowerBuilder.PBInt ai_ptoflag__temp__;
			ai_ptoflag__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_ptoflag);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			Sybase.PowerBuilder.PBDateTime adtm_entry__temp__;
			adtm_entry__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_entry);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_operate_moneyorder(as_ptbdocno__temp__, as_ptbtypecode__temp__, al_seqno__temp__, as_ptodocno__temp__, ai_ptoflag__temp__, as_entryid__temp__, adtm_entry__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_cancelappr_moneyorder")]
		public virtual System.Int16 of_cancelappr_moneyorder(string as_moneyorder_list_xml, string as_entryid, System.DateTime adtm_entry)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_moneyorder_list_xml__temp__;
			as_moneyorder_list_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_moneyorder_list_xml);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			Sybase.PowerBuilder.PBDateTime adtm_entry__temp__;
			adtm_entry__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_entry);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_cancelappr_moneyorder(as_moneyorder_list_xml__temp__, as_entryid__temp__, adtm_entry__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_cancel_moneyorder")]
		public virtual System.Int16 of_cancel_moneyorder(string as_moneyorder_list_xml, string as_entryid, System.DateTime adtm_entry)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_moneyorder_list_xml__temp__;
			as_moneyorder_list_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_moneyorder_list_xml);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			Sybase.PowerBuilder.PBDateTime adtm_entry__temp__;
			adtm_entry__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_entry);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_cancel_moneyorder(as_moneyorder_list_xml__temp__, as_entryid__temp__, adtm_entry__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_getlist_moneyorder")]
		public virtual string of_getlist_moneyorder(System.DateTime adtm_trn)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_trn__temp__;
			adtm_trn__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_trn);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_getlist_moneyorder(adtm_trn__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_getdata_moneyorder")]
		public virtual System.Int16 of_getdata_moneyorder(string as_docno, ref string as_moneyorder_master_xml, ref string as_moneyorder_detail_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_docno__temp__;
			as_docno__temp__ = new Sybase.PowerBuilder.PBString((string)as_docno);
			Sybase.PowerBuilder.PBString as_moneyorder_master_xml__temp__ = as_moneyorder_master_xml;
			Sybase.PowerBuilder.PBString as_moneyorder_detail_xml__temp__ = as_moneyorder_detail_xml;
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_getdata_moneyorder(as_docno__temp__, ref as_moneyorder_master_xml__temp__, ref as_moneyorder_detail_xml__temp__);
			as_moneyorder_master_xml = as_moneyorder_master_xml__temp__;
			as_moneyorder_detail_xml = as_moneyorder_detail_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_getlistcancel_moneyorder")]
		public virtual string of_getlistcancel_moneyorder(System.DateTime adtm_trn)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_trn__temp__;
			adtm_trn__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_trn);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_getlistcancel_moneyorder(adtm_trn__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_getlistappr_moneyorder")]
		public virtual string of_getlistappr_moneyorder(System.DateTime adtm_trn)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_trn__temp__;
			adtm_trn__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_trn);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_getlistappr_moneyorder(adtm_trn__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_getlistreappr_moneyorder")]
		public virtual string of_getlistreappr_moneyorder(System.DateTime adtm_trn)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_trn__temp__;
			adtm_trn__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_trn);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_getlistreappr_moneyorder(adtm_trn__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_postusemoneyorder")]
		public virtual System.Int16 of_postusemoneyorder(string as_docno, System.Int16 ai_seqno, string as_ref_slipno, System.Int16 ai_ref_seqno, System.Int16 ai_itemstatus, string as_entry_id, System.DateTime adtm_wdate)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_docno__temp__;
			as_docno__temp__ = new Sybase.PowerBuilder.PBString((string)as_docno);
			Sybase.PowerBuilder.PBInt ai_seqno__temp__;
			ai_seqno__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_seqno);
			Sybase.PowerBuilder.PBString as_ref_slipno__temp__;
			as_ref_slipno__temp__ = new Sybase.PowerBuilder.PBString((string)as_ref_slipno);
			Sybase.PowerBuilder.PBInt ai_ref_seqno__temp__;
			ai_ref_seqno__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_ref_seqno);
			Sybase.PowerBuilder.PBInt ai_itemstatus__temp__;
			ai_itemstatus__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_itemstatus);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			Sybase.PowerBuilder.PBDateTime adtm_wdate__temp__;
			adtm_wdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_wdate);
			__retval__ = ((c__n_cst_moneyorder_service)__nvo__).of_postusemoneyorder(as_docno__temp__, ai_seqno__temp__, as_ref_slipno__temp__, ai_ref_seqno__temp__, ai_itemstatus__temp__, as_entry_id__temp__, adtm_wdate__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
	}
} 