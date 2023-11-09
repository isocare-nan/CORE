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
	[ServiceContract(Name="n_cst_fin_vcgen_manual",Namespace="http://tempurl.org")]
	public class n_cst_fin_vcgen_manual : System.IDisposable 
	{
		internal c__n_cst_fin_vcgen_manual __nvo__;
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
		public n_cst_fin_vcgen_manual()
		{
			
			c__pbservice125.InitAssembly();
			__nvo__ = (c__n_cst_fin_vcgen_manual)Sybase.PowerBuilder.WPF.PBSession.CurrentSession.CreateInstance(typeof(c__n_cst_fin_vcgen_manual));
			c__pbservice125.RestoreOldSession();
		}
		internal n_cst_fin_vcgen_manual(c__n_cst_fin_vcgen_manual nvo)
		{
			__nvo__ = nvo;
		}
		[OperationContract(Name="of_settrans")]
		public virtual System.Int16 of_settrans(Sybase.PowerBuilder.WCFNVO.n_cst_dbconnectservice anv_db)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_cst_dbconnectservice anv_db__temp__ = new c__n_cst_dbconnectservice(); anv_db.CopyTo(anv_db__temp__);
			__retval__ = ((c__n_cst_fin_vcgen_manual)__nvo__).of_settrans(anv_db__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_vcproc")]
		public virtual System.Int16 of_vcproc(System.DateTime adtm_sysdate, System.Int16 ai_sysgencode, string as_branchid, string as_userid)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_sysdate__temp__;
			adtm_sysdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_sysdate);
			Sybase.PowerBuilder.PBInt ai_sysgencode__temp__;
			ai_sysgencode__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_sysgencode);
			Sybase.PowerBuilder.PBString as_branchid__temp__;
			as_branchid__temp__ = new Sybase.PowerBuilder.PBString((string)as_branchid);
			Sybase.PowerBuilder.PBString as_userid__temp__;
			as_userid__temp__ = new Sybase.PowerBuilder.PBString((string)as_userid);
			__retval__ = ((c__n_cst_fin_vcgen_manual)__nvo__).of_vcproc(adtm_sysdate__temp__, ai_sysgencode__temp__, as_branchid__temp__, as_userid__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_vccancel")]
		public virtual System.Int16 of_vccancel(System.DateTime adtm_vcdate, string as_vcdocno, string as_branchid, string as_userid)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_vcdate__temp__;
			adtm_vcdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_vcdate);
			Sybase.PowerBuilder.PBString as_vcdocno__temp__;
			as_vcdocno__temp__ = new Sybase.PowerBuilder.PBString((string)as_vcdocno);
			Sybase.PowerBuilder.PBString as_branchid__temp__;
			as_branchid__temp__ = new Sybase.PowerBuilder.PBString((string)as_branchid);
			Sybase.PowerBuilder.PBString as_userid__temp__;
			as_userid__temp__ = new Sybase.PowerBuilder.PBString((string)as_userid);
			__retval__ = ((c__n_cst_fin_vcgen_manual)__nvo__).of_vccancel(adtm_vcdate__temp__, as_vcdocno__temp__, as_branchid__temp__, as_userid__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
	}
} 