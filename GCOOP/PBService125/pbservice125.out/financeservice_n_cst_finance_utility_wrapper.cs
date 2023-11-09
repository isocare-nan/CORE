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
	[ServiceContract(Name="n_cst_finance_utility",Namespace="http://tempurl.org")]
	public class n_cst_finance_utility : System.IDisposable 
	{
		internal c__n_cst_finance_utility __nvo__;
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
		public n_cst_finance_utility()
		{
			
			c__pbservice125.InitAssembly();
			__nvo__ = (c__n_cst_finance_utility)Sybase.PowerBuilder.WPF.PBSession.CurrentSession.CreateInstance(typeof(c__n_cst_finance_utility));
			c__pbservice125.RestoreOldSession();
		}
		internal n_cst_finance_utility(c__n_cst_finance_utility nvo)
		{
			__nvo__ = nvo;
		}
		[OperationContract(Name="of_geterrormessage")]
		public virtual string of_geterrormessage()
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			__retval__ = ((c__n_cst_finance_utility)__nvo__).of_geterrormessage();
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_dddwbankbranch")]
		public virtual System.Int16 of_dddwbankbranch(string bank_code, ref string as_xmlbranch)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString bank_code__temp__;
			bank_code__temp__ = new Sybase.PowerBuilder.PBString((string)bank_code);
			Sybase.PowerBuilder.PBString as_xmlbranch__temp__ = as_xmlbranch;
			__retval__ = ((c__n_cst_finance_utility)__nvo__).of_dddwbankbranch(bank_code__temp__, ref as_xmlbranch__temp__);
			as_xmlbranch = as_xmlbranch__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_settrans")]
		public virtual System.Int16 of_settrans(Sybase.PowerBuilder.WCFNVO.n_cst_dbconnectservice anv_connection)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_cst_dbconnectservice anv_connection__temp__ = new c__n_cst_dbconnectservice(); anv_connection.CopyTo(anv_connection__temp__);
			__retval__ = ((c__n_cst_finance_utility)__nvo__).of_settrans(anv_connection__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_getchildbranch")]
		public virtual System.Int16 of_getchildbranch(ref string as_xmlbank)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_xmlbank__temp__ = as_xmlbank;
			__retval__ = ((c__n_cst_finance_utility)__nvo__).of_getchildbranch(ref as_xmlbank__temp__);
			as_xmlbank = as_xmlbank__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_dddwfinitemtype")]
		public virtual string of_dddwfinitemtype()
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			__retval__ = ((c__n_cst_finance_utility)__nvo__).of_dddwfinitemtype();
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_dddwbank")]
		public virtual string of_dddwbank()
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			__retval__ = ((c__n_cst_finance_utility)__nvo__).of_dddwbank();
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_getchildmoneytype")]
		public virtual string of_getchildmoneytype()
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			__retval__ = ((c__n_cst_finance_utility)__nvo__).of_getchildmoneytype();
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_getchildtaxcode")]
		public virtual string of_getchildtaxcode()
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			__retval__ = ((c__n_cst_finance_utility)__nvo__).of_getchildtaxcode();
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_getchildfinaccid")]
		public virtual string of_getchildfinaccid()
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			__retval__ = ((c__n_cst_finance_utility)__nvo__).of_getchildfinaccid();
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
	}
} 