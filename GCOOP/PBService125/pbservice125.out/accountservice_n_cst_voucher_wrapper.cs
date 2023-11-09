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
	[ServiceContract(Name="n_cst_voucher",Namespace="http://tempurl.org")]
	public class n_cst_voucher : System.IDisposable 
	{
		internal c__n_cst_voucher __nvo__;
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
		public n_cst_voucher()
		{
			
			c__pbservice125.InitAssembly();
			__nvo__ = (c__n_cst_voucher)Sybase.PowerBuilder.WPF.PBSession.CurrentSession.CreateInstance(typeof(c__n_cst_voucher));
			c__pbservice125.RestoreOldSession();
		}
		internal n_cst_voucher(c__n_cst_voucher nvo)
		{
			__nvo__ = nvo;
		}
		[OperationContract(Name="of_initservice")]
		public virtual System.Int16 of_initservice(Sybase.PowerBuilder.WCFNVO.n_cst_dbconnectservice anv_db)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_cst_dbconnectservice anv_db__temp__ = new c__n_cst_dbconnectservice(); anv_db.CopyTo(anv_db__temp__);
			__retval__ = ((c__n_cst_voucher)__nvo__).of_initservice(anv_db__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_vcpost_to_gl")]
		public virtual System.Int16 of_init_vcpost_to_gl(System.DateTime adtm_begin, System.DateTime adtm_end, System.Int16 ai_poststatus, ref string as_vclist_xml, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_begin__temp__;
			adtm_begin__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_begin);
			Sybase.PowerBuilder.PBDateTime adtm_end__temp__;
			adtm_end__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_end);
			Sybase.PowerBuilder.PBInt ai_poststatus__temp__;
			ai_poststatus__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_poststatus);
			Sybase.PowerBuilder.PBString as_vclist_xml__temp__ = as_vclist_xml;
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_voucher)__nvo__).of_init_vcpost_to_gl(adtm_begin__temp__, adtm_end__temp__, ai_poststatus__temp__, ref as_vclist_xml__temp__, as_coop_id__temp__);
			as_vclist_xml = as_vclist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_savevoucher")]
		public virtual System.Int16 of_savevoucher(string as_vcmas_xml, string as_vcdet_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_vcmas_xml__temp__;
			as_vcmas_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_vcmas_xml);
			Sybase.PowerBuilder.PBString as_vcdet_xml__temp__;
			as_vcdet_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_vcdet_xml);
			__retval__ = ((c__n_cst_voucher)__nvo__).of_savevoucher(as_vcmas_xml__temp__, as_vcdet_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_vclistday")]
		public virtual System.Int16 of_init_vclistday(System.DateTime adtm_date, ref string as_vclist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_date__temp__;
			adtm_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_date);
			Sybase.PowerBuilder.PBString as_vclist_xml__temp__ = as_vclist_xml;
			__retval__ = ((c__n_cst_voucher)__nvo__).of_init_vclistday(adtm_date__temp__, ref as_vclist_xml__temp__);
			as_vclist_xml = as_vclist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_vcmastdet")]
		public virtual System.Int16 of_init_vcmastdet(string as_vcno, ref string as_vcmas_xml, ref string as_vcdet_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_vcno__temp__;
			as_vcno__temp__ = new Sybase.PowerBuilder.PBString((string)as_vcno);
			Sybase.PowerBuilder.PBString as_vcmas_xml__temp__ = as_vcmas_xml;
			Sybase.PowerBuilder.PBString as_vcdet_xml__temp__ = as_vcdet_xml;
			__retval__ = ((c__n_cst_voucher)__nvo__).of_init_vcmastdet(as_vcno__temp__, ref as_vcmas_xml__temp__, ref as_vcdet_xml__temp__);
			as_vcmas_xml = as_vcmas_xml__temp__;
			as_vcdet_xml = as_vcdet_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_save_vcpost_to_gl")]
		public virtual System.Int16 of_save_vcpost_to_gl(string as_postlist_xml, string as_entry_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_postlist_xml__temp__;
			as_postlist_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_postlist_xml);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			__retval__ = ((c__n_cst_voucher)__nvo__).of_save_vcpost_to_gl(as_postlist_xml__temp__, as_entry_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_setsrvdoccontrol")]
		public virtual System.Int16 of_setsrvdoccontrol(bool ab_switch)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBBoolean ab_switch__temp__;
			ab_switch__temp__ = new Sybase.PowerBuilder.PBBoolean((bool)ab_switch);
			__retval__ = ((c__n_cst_voucher)__nvo__).of_setsrvdoccontrol(ab_switch__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_vclistcancel")]
		public virtual System.Int16 of_init_vclistcancel(System.DateTime adtm_date, string as_coopid, ref string as_vclist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_date__temp__;
			adtm_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_date);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_vclist_xml__temp__ = as_vclist_xml;
			__retval__ = ((c__n_cst_voucher)__nvo__).of_init_vclistcancel(adtm_date__temp__, as_coopid__temp__, ref as_vclist_xml__temp__);
			as_vclist_xml = as_vclist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_vclistcancel_by_vcno")]
		public virtual System.Int16 of_init_vclistcancel_by_vcno(string vc_no, string as_coopid, ref string as_vclist_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString vc_no__temp__;
			vc_no__temp__ = new Sybase.PowerBuilder.PBString((string)vc_no);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_vclist_xml__temp__ = as_vclist_xml;
			__retval__ = ((c__n_cst_voucher)__nvo__).of_init_vclistcancel_by_vcno(vc_no__temp__, as_coopid__temp__, ref as_vclist_xml__temp__);
			as_vclist_xml = as_vclist_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_save_vclistcancel")]
		public virtual System.Int16 of_save_vclistcancel(System.DateTime adtm_vc_date, string as_voucher, string as_coopid, string as_entryid, System.DateTime adtm_cancel_date)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_vc_date__temp__;
			adtm_vc_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_vc_date);
			Sybase.PowerBuilder.PBString as_voucher__temp__;
			as_voucher__temp__ = new Sybase.PowerBuilder.PBString((string)as_voucher);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBString as_entryid__temp__;
			as_entryid__temp__ = new Sybase.PowerBuilder.PBString((string)as_entryid);
			Sybase.PowerBuilder.PBDateTime adtm_cancel_date__temp__;
			adtm_cancel_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_cancel_date);
			__retval__ = ((c__n_cst_voucher)__nvo__).of_save_vclistcancel(adtm_vc_date__temp__, as_voucher__temp__, as_coopid__temp__, as_entryid__temp__, adtm_cancel_date__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_vcmastdet_nan")]
		public virtual System.Int16 of_init_vcmastdet_nan(string as_vcno, ref string as_vcmas_xml, ref string as_vcdet_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_vcno__temp__;
			as_vcno__temp__ = new Sybase.PowerBuilder.PBString((string)as_vcno);
			Sybase.PowerBuilder.PBString as_vcmas_xml__temp__ = as_vcmas_xml;
			Sybase.PowerBuilder.PBString as_vcdet_xml__temp__ = as_vcdet_xml;
			__retval__ = ((c__n_cst_voucher)__nvo__).of_init_vcmastdet_nan(as_vcno__temp__, ref as_vcmas_xml__temp__, ref as_vcdet_xml__temp__);
			as_vcmas_xml = as_vcmas_xml__temp__;
			as_vcdet_xml = as_vcdet_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
	}
} 