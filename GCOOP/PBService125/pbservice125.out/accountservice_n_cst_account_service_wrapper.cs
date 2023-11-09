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
	[ServiceContract(Name="n_cst_account_service",Namespace="http://tempurl.org")]
	public class n_cst_account_service : System.IDisposable 
	{
		internal c__n_cst_account_service __nvo__;
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
		public n_cst_account_service()
		{
			
			c__pbservice125.InitAssembly();
			__nvo__ = (c__n_cst_account_service)Sybase.PowerBuilder.WPF.PBSession.CurrentSession.CreateInstance(typeof(c__n_cst_account_service));
			c__pbservice125.RestoreOldSession();
		}
		internal n_cst_account_service(c__n_cst_account_service nvo)
		{
			__nvo__ = nvo;
		}
		[OperationContract(Name="of_add_newaccount_id")]
		public virtual System.Int16 of_add_newaccount_id(string as_account_iddetail_xml, System.Int16 ai_update_add)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_account_iddetail_xml__temp__;
			as_account_iddetail_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_account_iddetail_xml);
			Sybase.PowerBuilder.PBInt ai_update_add__temp__;
			ai_update_add__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_update_add);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_add_newaccount_id(as_account_iddetail_xml__temp__, ai_update_add__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_save_contuseprofit")]
		public virtual System.Int16 of_save_contuseprofit(string as_conuse_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_conuse_xml__temp__;
			as_conuse_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_conuse_xml);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_save_contuseprofit(as_conuse_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_update_cashpaper_detail")]
		public virtual System.Int16 of_update_cashpaper_detail(string as_cash_detail_xml, System.Int16 ai_sheet, string as_type_activity)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_cash_detail_xml__temp__;
			as_cash_detail_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cash_detail_xml);
			Sybase.PowerBuilder.PBInt ai_sheet__temp__;
			ai_sheet__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_sheet);
			Sybase.PowerBuilder.PBString as_type_activity__temp__;
			as_type_activity__temp__ = new Sybase.PowerBuilder.PBString((string)as_type_activity);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_update_cashpaper_detail(as_cash_detail_xml__temp__, ai_sheet__temp__, as_type_activity__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_cancel_post_to_gl")]
		public virtual System.Int16 of_cancel_post_to_gl(string as_postlist_xml, string as_entry_id, string as_coop_id, System.DateTime adtm_date)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_postlist_xml__temp__;
			as_postlist_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_postlist_xml);
			Sybase.PowerBuilder.PBString as_entry_id__temp__;
			as_entry_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_entry_id);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBDateTime adtm_date__temp__;
			adtm_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_date);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_cancel_post_to_gl(as_postlist_xml__temp__, as_entry_id__temp__, as_coop_id__temp__, adtm_date__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_cancel_voucher")]
		public virtual System.Int16 of_cancel_voucher(System.DateTime adtm_vc_date, string as_voucher, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_vc_date__temp__;
			adtm_vc_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_vc_date);
			Sybase.PowerBuilder.PBString as_voucher__temp__;
			as_voucher__temp__ = new Sybase.PowerBuilder.PBString((string)as_voucher);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_cancel_voucher(adtm_vc_date__temp__, as_voucher__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_delete_accountid")]
		public virtual System.Int16 of_delete_accountid(string as_accountid, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_accountid__temp__;
			as_accountid__temp__ = new Sybase.PowerBuilder.PBString((string)as_accountid);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_delete_accountid(as_accountid__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_gen_balance_sheet")]
		public virtual System.Int16 of_gen_balance_sheet(string as_acc_bs_head_xml, string as_moneysheet_code, string as_coop_id, ref string as_acc_bs_ret_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_acc_bs_head_xml__temp__;
			as_acc_bs_head_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_acc_bs_head_xml);
			Sybase.PowerBuilder.PBString as_moneysheet_code__temp__;
			as_moneysheet_code__temp__ = new Sybase.PowerBuilder.PBString((string)as_moneysheet_code);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBString as_acc_bs_ret_xml__temp__ = as_acc_bs_ret_xml;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_gen_balance_sheet(as_acc_bs_head_xml__temp__, as_moneysheet_code__temp__, as_coop_id__temp__, ref as_acc_bs_ret_xml__temp__);
			as_acc_bs_ret_xml = as_acc_bs_ret_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_gen_cashflow_sheet")]
		public virtual System.Int16 of_gen_cashflow_sheet(string as_acc_bs_head_xml, string as_moneysheet_code, string as_coop_id, ref string as_acc_bs_ret_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_acc_bs_head_xml__temp__;
			as_acc_bs_head_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_acc_bs_head_xml);
			Sybase.PowerBuilder.PBString as_moneysheet_code__temp__;
			as_moneysheet_code__temp__ = new Sybase.PowerBuilder.PBString((string)as_moneysheet_code);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBString as_acc_bs_ret_xml__temp__ = as_acc_bs_ret_xml;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_gen_cashflow_sheet(as_acc_bs_head_xml__temp__, as_moneysheet_code__temp__, as_coop_id__temp__, ref as_acc_bs_ret_xml__temp__);
			as_acc_bs_ret_xml = as_acc_bs_ret_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_gen_cashpaper_activities")]
		public virtual string of_gen_cashpaper_activities(System.DateTime adtm_start, System.DateTime adtm_end, System.Int16 ai_sum_period, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_start__temp__;
			adtm_start__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_start);
			Sybase.PowerBuilder.PBDateTime adtm_end__temp__;
			adtm_end__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_end);
			Sybase.PowerBuilder.PBInt ai_sum_period__temp__;
			ai_sum_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_sum_period);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_gen_cashpaper_activities(adtm_start__temp__, adtm_end__temp__, ai_sum_period__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_gen_cashpaper_drcr")]
		public virtual string of_gen_cashpaper_drcr(System.DateTime adtm_start, System.DateTime adtm_end, System.Int16 ai_sum_period, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_start__temp__;
			adtm_start__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_start);
			Sybase.PowerBuilder.PBDateTime adtm_end__temp__;
			adtm_end__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_end);
			Sybase.PowerBuilder.PBInt ai_sum_period__temp__;
			ai_sum_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_sum_period);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_gen_cashpaper_drcr(adtm_start__temp__, adtm_end__temp__, ai_sum_period__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_gen_trial_bs")]
		public virtual System.Int16 of_gen_trial_bs(string as_choose_report_xml, string as_coop_id, ref string as_trial_report_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_choose_report_xml__temp__;
			as_choose_report_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_choose_report_xml);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBString as_trial_report_xml__temp__ = as_trial_report_xml;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_gen_trial_bs(as_choose_report_xml__temp__, as_coop_id__temp__, ref as_trial_report_xml__temp__);
			as_trial_report_xml = as_trial_report_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_is_headquater")]
		public virtual System.Int16 of_is_headquater(string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_is_headquater(as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_gen_day_journalreport")]
		public virtual string of_gen_day_journalreport(System.DateTime adtm_start_date, System.DateTime adtm_end_date, System.Int16 ai_type_group, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_start_date__temp__;
			adtm_start_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_start_date);
			Sybase.PowerBuilder.PBDateTime adtm_end_date__temp__;
			adtm_end_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_end_date);
			Sybase.PowerBuilder.PBInt ai_type_group__temp__;
			ai_type_group__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_type_group);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_gen_day_journalreport(adtm_start_date__temp__, adtm_end_date__temp__, ai_type_group__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_gen_ledger_report")]
		public virtual string of_gen_ledger_report(System.DateTime adtm_start, System.DateTime adtm_end, string as_account_id1, string as_account_id2, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_start__temp__;
			adtm_start__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_start);
			Sybase.PowerBuilder.PBDateTime adtm_end__temp__;
			adtm_end__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_end);
			Sybase.PowerBuilder.PBString as_account_id1__temp__;
			as_account_id1__temp__ = new Sybase.PowerBuilder.PBString((string)as_account_id1);
			Sybase.PowerBuilder.PBString as_account_id2__temp__;
			as_account_id2__temp__ = new Sybase.PowerBuilder.PBString((string)as_account_id2);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_gen_ledger_report(adtm_start__temp__, adtm_end__temp__, as_account_id1__temp__, as_account_id2__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_result_gencash")]
		public virtual decimal of_get_result_gencash(string as_acclist, System.DateTime adtm_start, System.DateTime adtm_end, System.Int16 ai_choose, System.DateTime adtm_year_begin, string as_coop_id, System.Int16 ai_cash_only)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			decimal __retval__;
			Sybase.PowerBuilder.PBString as_acclist__temp__;
			as_acclist__temp__ = new Sybase.PowerBuilder.PBString((string)as_acclist);
			Sybase.PowerBuilder.PBDateTime adtm_start__temp__;
			adtm_start__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_start);
			Sybase.PowerBuilder.PBDateTime adtm_end__temp__;
			adtm_end__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_end);
			Sybase.PowerBuilder.PBInt ai_choose__temp__;
			ai_choose__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_choose);
			Sybase.PowerBuilder.PBDateTime adtm_year_begin__temp__;
			adtm_year_begin__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_year_begin);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBInt ai_cash_only__temp__;
			ai_cash_only__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_cash_only);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_result_gencash(as_acclist__temp__, adtm_start__temp__, adtm_end__temp__, ai_choose__temp__, adtm_year_begin__temp__, as_coop_id__temp__, ai_cash_only__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_balance_begin")]
		public virtual decimal of_get_balance_begin(string as_account_id, System.DateTime adtm_date_find, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			decimal __retval__;
			Sybase.PowerBuilder.PBString as_account_id__temp__;
			as_account_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_account_id);
			Sybase.PowerBuilder.PBDateTime adtm_date_find__temp__;
			adtm_date_find__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_date_find);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_balance_begin(as_account_id__temp__, adtm_date_find__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_balance_begin_1")]
		public virtual decimal of_get_balance_begin_1(string as_account_id, System.Int16 ai_account_year, System.Int16 ai_period, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			decimal __retval__;
			Sybase.PowerBuilder.PBString as_account_id__temp__;
			as_account_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_account_id);
			Sybase.PowerBuilder.PBInt ai_account_year__temp__;
			ai_account_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_account_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_balance_begin(as_account_id__temp__, ai_account_year__temp__, ai_period__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_balance_begin_2")]
		public virtual decimal of_get_balance_begin_2(string as_account_id1, string as_account_id2, System.DateTime adtm_date_find, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			decimal __retval__;
			Sybase.PowerBuilder.PBString as_account_id1__temp__;
			as_account_id1__temp__ = new Sybase.PowerBuilder.PBString((string)as_account_id1);
			Sybase.PowerBuilder.PBString as_account_id2__temp__;
			as_account_id2__temp__ = new Sybase.PowerBuilder.PBString((string)as_account_id2);
			Sybase.PowerBuilder.PBDateTime adtm_date_find__temp__;
			adtm_date_find__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_date_find);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_balance_begin(as_account_id1__temp__, as_account_id2__temp__, adtm_date_find__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_show_bs")]
		public virtual System.Int16 of_show_bs(string as_bs_code, System.Int16 ai_year, System.Int16 ai_period, string as_balance_data, string as_balance_percent, System.Int16 ai_mas, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_bs_code__temp__;
			as_bs_code__temp__ = new Sybase.PowerBuilder.PBString((string)as_bs_code);
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			Sybase.PowerBuilder.PBString as_balance_data__temp__;
			as_balance_data__temp__ = new Sybase.PowerBuilder.PBString((string)as_balance_data);
			Sybase.PowerBuilder.PBString as_balance_percent__temp__;
			as_balance_percent__temp__ = new Sybase.PowerBuilder.PBString((string)as_balance_percent);
			Sybase.PowerBuilder.PBInt ai_mas__temp__;
			ai_mas__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_mas);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_show_bs(as_bs_code__temp__, ai_year__temp__, ai_period__temp__, as_balance_data__temp__, as_balance_percent__temp__, ai_mas__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_cash_bg_fw")]
		public virtual System.Int16 of_get_cash_bg_fw(System.DateTime adtm_startdate, string as_coop_id, ref decimal adc_begin, ref decimal adc_forward)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_startdate__temp__;
			adtm_startdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_startdate);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBDecimal adc_begin__temp__ = adc_begin;
			Sybase.PowerBuilder.PBDecimal adc_forward__temp__ = adc_forward;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_cash_bg_fw(adtm_startdate__temp__, as_coop_id__temp__, ref adc_begin__temp__, ref adc_forward__temp__);
			adc_begin = adc_begin__temp__;
			adc_forward = adc_forward__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_cashpaper_detail")]
		public virtual string of_get_cashpaper_detail(System.Int16 ai_sheet, string as_type_activity, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBInt ai_sheet__temp__;
			ai_sheet__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_sheet);
			Sybase.PowerBuilder.PBString as_type_activity__temp__;
			as_type_activity__temp__ = new Sybase.PowerBuilder.PBString((string)as_type_activity);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_cashpaper_detail(ai_sheet__temp__, as_type_activity__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_max_period")]
		public virtual System.Int16 of_get_max_period(System.Int16 ai_account_year, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_account_year__temp__;
			ai_account_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_account_year);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_max_period(ai_account_year__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_period_date")]
		public virtual System.Int16 of_get_period_date(System.Int16 ai_year, System.Int16 ai_period, string as_coop_id, ref System.DateTime adtm_begin_date, ref System.DateTime adtm_end_date)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBDateTime adtm_begin_date__temp__ = adtm_begin_date;
			Sybase.PowerBuilder.PBDateTime adtm_end_date__temp__ = adtm_end_date;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_period_date(ai_year__temp__, ai_period__temp__, as_coop_id__temp__, ref adtm_begin_date__temp__, ref adtm_end_date__temp__);
			adtm_begin_date = adtm_begin_date__temp__;
			adtm_end_date = adtm_end_date__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_result_gencash_begin")]
		public virtual decimal of_get_result_gencash_begin(string as_acclist, System.DateTime adtm_start, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			decimal __retval__;
			Sybase.PowerBuilder.PBString as_acclist__temp__;
			as_acclist__temp__ = new Sybase.PowerBuilder.PBString((string)as_acclist);
			Sybase.PowerBuilder.PBDateTime adtm_start__temp__;
			adtm_start__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_start);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_result_gencash_begin(as_acclist__temp__, adtm_start__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_is_closemonth")]
		public virtual System.Int16 of_is_closemonth(System.Int16 ai_year, System.Int16 ai_period, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_is_closemonth(ai_year__temp__, ai_period__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_is_closeyear")]
		public virtual System.Int16 of_is_closeyear(System.Int16 ai_year, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_is_closeyear(ai_year__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_is_postall_voucher")]
		public virtual System.Int16 of_is_postall_voucher(System.DateTime adtm_begin, System.DateTime adtm_end, System.Int16 ai_post_status, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_begin__temp__;
			adtm_begin__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_begin);
			Sybase.PowerBuilder.PBDateTime adtm_end__temp__;
			adtm_end__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_end);
			Sybase.PowerBuilder.PBInt ai_post_status__temp__;
			ai_post_status__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_post_status);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_is_postall_voucher(adtm_begin__temp__, adtm_end__temp__, ai_post_status__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_is_postall_voucher_1")]
		public virtual System.Int16 of_is_postall_voucher_1(string as_voucher, System.Int16 ai_post_status, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_voucher__temp__;
			as_voucher__temp__ = new Sybase.PowerBuilder.PBString((string)as_voucher);
			Sybase.PowerBuilder.PBInt ai_post_status__temp__;
			ai_post_status__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_post_status);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_is_postall_voucher(as_voucher__temp__, ai_post_status__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_isexits_sumledger")]
		public virtual System.Int16 of_isexits_sumledger(string as_account_id, System.Int16 ai_account_year, System.Int16 ai_period, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_account_id__temp__;
			as_account_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_account_id);
			Sybase.PowerBuilder.PBInt ai_account_year__temp__;
			ai_account_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_account_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_isexits_sumledger(as_account_id__temp__, ai_account_year__temp__, ai_period__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_profit_year")]
		public virtual System.Int16 of_profit_year(System.Int16 ai_year, System.Int16 ai_period, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_profit_year(ai_year__temp__, ai_period__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_save_account_splitactivity")]
		public virtual System.Int16 of_save_account_splitactivity(string as_splitactivity_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_splitactivity_xml__temp__;
			as_splitactivity_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_splitactivity_xml);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_save_account_splitactivity(as_splitactivity_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_sum_foradd_profit")]
		public virtual System.Int16 of_sum_foradd_profit(System.Int16 ai_account_year, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_account_year__temp__;
			ai_account_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_account_year);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_sum_foradd_profit(ai_account_year__temp__, as_coop_id__temp__);
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
			__retval__ = ((c__n_cst_account_service)__nvo__).of_err_generate_import_xml(ai_error__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_year_period")]
		public virtual System.Int16 of_get_year_period(System.DateTime adtm_date, string as_coop_id, ref System.Int16 ai_year, ref System.Int16 ai_period)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_date__temp__;
			adtm_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_date);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBInt ai_year__temp__ = ai_year;
			Sybase.PowerBuilder.PBInt ai_period__temp__ = ai_period;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_year_period(adtm_date__temp__, as_coop_id__temp__, ref ai_year__temp__, ref ai_period__temp__);
			ai_year = ai_year__temp__;
			ai_period = ai_period__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_set_default_accountid")]
		public virtual System.Int16 of_set_default_accountid(string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_set_default_accountid(as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_initservice")]
		public virtual System.Int16 of_initservice(Sybase.PowerBuilder.WCFNVO.n_cst_dbconnectservice anv_db)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			c__n_cst_dbconnectservice anv_db__temp__ = new c__n_cst_dbconnectservice(); anv_db.CopyTo(anv_db__temp__);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_initservice(anv_db__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_close_month")]
		public virtual System.Int16 of_close_month(System.Int16 ai_year, System.Int16 ai_period)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_close_month(ai_year__temp__, ai_period__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_cancel_closemonth")]
		public virtual System.Int16 of_cancel_closemonth(System.Int16 ai_year, System.Int16 ai_period)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_cancel_closemonth(ai_year__temp__, ai_period__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_consstant_bs")]
		public virtual System.Int16 of_init_consstant_bs(string as_data_desc, ref string as_buzz_display_xml, ref string as_usr_type_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_data_desc__temp__;
			as_data_desc__temp__ = new Sybase.PowerBuilder.PBString((string)as_data_desc);
			Sybase.PowerBuilder.PBString as_buzz_display_xml__temp__ = as_buzz_display_xml;
			Sybase.PowerBuilder.PBString as_usr_type_xml__temp__ = as_usr_type_xml;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_init_consstant_bs(as_data_desc__temp__, ref as_buzz_display_xml__temp__, ref as_usr_type_xml__temp__);
			as_buzz_display_xml = as_buzz_display_xml__temp__;
			as_usr_type_xml = as_usr_type_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_save_constant_bs")]
		public virtual System.Int16 of_save_constant_bs(string as_main_xml, string as_detail_xml, string as_money_code, System.Int16 an_sheet_seq)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_detail_xml__temp__;
			as_detail_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_detail_xml);
			Sybase.PowerBuilder.PBString as_money_code__temp__;
			as_money_code__temp__ = new Sybase.PowerBuilder.PBString((string)as_money_code);
			Sybase.PowerBuilder.PBInt an_sheet_seq__temp__;
			an_sheet_seq__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)an_sheet_seq);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_save_constant_bs(as_main_xml__temp__, as_detail_xml__temp__, as_money_code__temp__, an_sheet_seq__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_formular_fc")]
		public virtual System.Int16 of_init_formular_fc(string as_money_sheetcode, System.Int16 an_data_group, ref string as_formular_fc_xml, ref string as_formular_fc_choose_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_money_sheetcode__temp__;
			as_money_sheetcode__temp__ = new Sybase.PowerBuilder.PBString((string)as_money_sheetcode);
			Sybase.PowerBuilder.PBInt an_data_group__temp__;
			an_data_group__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)an_data_group);
			Sybase.PowerBuilder.PBString as_formular_fc_xml__temp__ = as_formular_fc_xml;
			Sybase.PowerBuilder.PBString as_formular_fc_choose_xml__temp__ = as_formular_fc_choose_xml;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_init_formular_fc(as_money_sheetcode__temp__, an_data_group__temp__, ref as_formular_fc_xml__temp__, ref as_formular_fc_choose_xml__temp__);
			as_formular_fc_xml = as_formular_fc_xml__temp__;
			as_formular_fc_choose_xml = as_formular_fc_choose_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_save_formula_fc")]
		public virtual System.Int16 of_save_formula_fc(string as_main_xml, string as_money_code, string as_data_group)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_money_code__temp__;
			as_money_code__temp__ = new Sybase.PowerBuilder.PBString((string)as_money_code);
			Sybase.PowerBuilder.PBString as_data_group__temp__;
			as_data_group__temp__ = new Sybase.PowerBuilder.PBString((string)as_data_group);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_save_formula_fc(as_main_xml__temp__, as_money_code__temp__, as_data_group__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_formula_sm")]
		public virtual System.Int16 of_init_formula_sm(string as_money_sheetcode, System.Int16 an_data_group, ref string as_formular_sm_xml, ref string as_formular_sm_choose_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_money_sheetcode__temp__;
			as_money_sheetcode__temp__ = new Sybase.PowerBuilder.PBString((string)as_money_sheetcode);
			Sybase.PowerBuilder.PBInt an_data_group__temp__;
			an_data_group__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)an_data_group);
			Sybase.PowerBuilder.PBString as_formular_sm_xml__temp__ = as_formular_sm_xml;
			Sybase.PowerBuilder.PBString as_formular_sm_choose_xml__temp__ = as_formular_sm_choose_xml;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_init_formula_sm(as_money_sheetcode__temp__, an_data_group__temp__, ref as_formular_sm_xml__temp__, ref as_formular_sm_choose_xml__temp__);
			as_formular_sm_xml = as_formular_sm_xml__temp__;
			as_formular_sm_choose_xml = as_formular_sm_choose_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_save_formula_sm")]
		public virtual System.Int16 of_save_formula_sm(string as_main_xml, string as_money_code, string as_data_group)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_money_code__temp__;
			as_money_code__temp__ = new Sybase.PowerBuilder.PBString((string)as_money_code);
			Sybase.PowerBuilder.PBString as_data_group__temp__;
			as_data_group__temp__ = new Sybase.PowerBuilder.PBString((string)as_data_group);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_save_formula_sm(as_main_xml__temp__, as_money_code__temp__, as_data_group__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_close_year")]
		public virtual System.Int16 of_close_year(System.Int16 ai_year)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_close_year(ai_year__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_save_money_sheet")]
		public virtual System.Int16 of_save_money_sheet(string as_main_xml, string as_money_code, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_main_xml__temp__;
			as_main_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_main_xml);
			Sybase.PowerBuilder.PBString as_money_code__temp__;
			as_money_code__temp__ = new Sybase.PowerBuilder.PBString((string)as_money_code);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_save_money_sheet(as_main_xml__temp__, as_money_code__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_sersrvdwxml")]
		public virtual System.Int16 of_sersrvdwxml(bool ab_switch)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBBoolean ab_switch__temp__;
			ab_switch__temp__ = new Sybase.PowerBuilder.PBBoolean((bool)ab_switch);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_sersrvdwxml(ab_switch__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_cancel_closeyear")]
		public virtual System.Int16 of_cancel_closeyear(System.Int16 ai_year)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_cancel_closeyear(ai_year__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_contuseprofit")]
		public virtual string of_init_contuseprofit(System.Int16 ai_year, System.Int16 ai_period)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_init_contuseprofit(ai_year__temp__, ai_period__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_account_splitactivity")]
		public virtual string of_init_account_splitactivity(System.Int16 ai_year, System.Int16 ai_period)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_init_account_splitactivity(ai_year__temp__, ai_period__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_save_vcset_noncash")]
		public virtual System.Int16 of_save_vcset_noncash(string as_cash_detail_xml, System.DateTime adtm_date_begin, System.DateTime adtm_date_end, string as_account_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_cash_detail_xml__temp__;
			as_cash_detail_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_cash_detail_xml);
			Sybase.PowerBuilder.PBDateTime adtm_date_begin__temp__;
			adtm_date_begin__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_date_begin);
			Sybase.PowerBuilder.PBDateTime adtm_date_end__temp__;
			adtm_date_end__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_date_end);
			Sybase.PowerBuilder.PBString as_account_id__temp__;
			as_account_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_account_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_save_vcset_noncash(as_cash_detail_xml__temp__, adtm_date_begin__temp__, adtm_date_end__temp__, as_account_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_candel_year")]
		public virtual System.Int16 of_candel_year(System.Int16 ai_year)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_candel_year(ai_year__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_candel_period")]
		public virtual System.Int16 of_candel_period(System.Int16 ai_year, System.Int16 ai_period)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_candel_period(ai_year__temp__, ai_period__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_init_vcset_noncash")]
		public virtual string of_init_vcset_noncash(System.DateTime adtm_datebegin, System.DateTime adtm_dateend, string as_account_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			string __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_datebegin__temp__;
			adtm_datebegin__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_datebegin);
			Sybase.PowerBuilder.PBDateTime adtm_dateend__temp__;
			adtm_dateend__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_dateend);
			Sybase.PowerBuilder.PBString as_account_id__temp__;
			as_account_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_account_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_init_vcset_noncash(adtm_datebegin__temp__, adtm_dateend__temp__, as_account_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_save_accbegin")]
		public virtual System.Int16 of_save_accbegin(string as_begindata_xml, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_begindata_xml__temp__;
			as_begindata_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_begindata_xml);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_save_accbegin(as_begindata_xml__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_add_first_sumleger_period")]
		public virtual System.Int16 of_add_first_sumleger_period(System.Int16 ai_year, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_add_first_sumleger_period(ai_year__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_cash_bg_fw_notpost")]
		public virtual System.Int16 of_get_cash_bg_fw_notpost(System.DateTime adtm_startdate, string as_coop_id, ref decimal adc_begin, ref decimal adc_forward)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_startdate__temp__;
			adtm_startdate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_startdate);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBDecimal adc_begin__temp__ = adc_begin;
			Sybase.PowerBuilder.PBDecimal adc_forward__temp__ = adc_forward;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_cash_bg_fw_notpost(adtm_startdate__temp__, as_coop_id__temp__, ref adc_begin__temp__, ref adc_forward__temp__);
			adc_begin = adc_begin__temp__;
			adc_forward = adc_forward__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_add_contnext_year")]
		public virtual System.Int16 of_add_contnext_year(System.Int16 ai_year, string as_coop_id, System.Int16 ai_yearadd)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBInt ai_yearadd__temp__;
			ai_yearadd__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_yearadd);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_add_contnext_year(ai_year__temp__, as_coop_id__temp__, ai_yearadd__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_get_budgetpay")]
		public virtual System.Int16 of_get_budgetpay(System.Int16 ai_year, System.Int16 ai_period, string as_coop, string as_account_desc, ref decimal adc_account_real, ref decimal adc_account_period, decimal adc_budget)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			Sybase.PowerBuilder.PBString as_coop__temp__;
			as_coop__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop);
			Sybase.PowerBuilder.PBString as_account_desc__temp__;
			as_account_desc__temp__ = new Sybase.PowerBuilder.PBString((string)as_account_desc);
			Sybase.PowerBuilder.PBDecimal adc_account_real__temp__ = adc_account_real;
			Sybase.PowerBuilder.PBDecimal adc_account_period__temp__ = adc_account_period;
			Sybase.PowerBuilder.PBDecimal adc_budget__temp__;
			adc_budget__temp__ = new Sybase.PowerBuilder.PBDecimal((decimal)adc_budget);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_get_budgetpay(ai_year__temp__, ai_period__temp__, as_coop__temp__, as_account_desc__temp__, ref adc_account_real__temp__, ref adc_account_period__temp__, adc_budget__temp__);
			adc_account_real = adc_account_real__temp__;
			adc_account_period = adc_account_period__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_process_budget")]
		public virtual System.Int16 of_process_budget(string as_coopid, System.Int16 ai_year, System.Int16 ai_period)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_process_budget(as_coopid__temp__, ai_year__temp__, ai_period__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_set_budget")]
		public virtual System.Int16 of_set_budget(string as_xml, string as_coopid, System.Int16 an_year, string as_budget_type)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_xml__temp__;
			as_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_xml);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBInt an_year__temp__;
			an_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)an_year);
			Sybase.PowerBuilder.PBString as_budget_type__temp__;
			as_budget_type__temp__ = new Sybase.PowerBuilder.PBString((string)as_budget_type);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_set_budget(as_xml__temp__, as_coopid__temp__, an_year__temp__, as_budget_type__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_gen_data_paytrnbank")]
		public virtual System.Int16 of_gen_data_paytrnbank(string as_head_xml, string as_share_xml, string as_loan_xml, string as_etc_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_head_xml__temp__;
			as_head_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_head_xml);
			Sybase.PowerBuilder.PBString as_share_xml__temp__;
			as_share_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_share_xml);
			Sybase.PowerBuilder.PBString as_loan_xml__temp__;
			as_loan_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_loan_xml);
			Sybase.PowerBuilder.PBString as_etc_xml__temp__;
			as_etc_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_etc_xml);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_gen_data_paytrnbank(as_head_xml__temp__, as_share_xml__temp__, as_loan_xml__temp__, as_etc_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_add_accyear")]
		public virtual System.Int16 of_add_accyear(string as_year_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_year_xml__temp__;
			as_year_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_year_xml);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_add_accyear(as_year_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_add_accperiod")]
		public virtual System.Int16 of_add_accperiod(System.Int16 ai_year, string as_accperiod_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBString as_accperiod_xml__temp__;
			as_accperiod_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_accperiod_xml);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_add_accperiod(ai_year__temp__, as_accperiod_xml__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_cancel_closemonth_clear_vcno")]
		public virtual System.Int16 of_cancel_closemonth_clear_vcno(System.Int16 ai_year, System.Int16 ai_period)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_cancel_closemonth_clear_vcno(ai_year__temp__, ai_period__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_close_month_clear_vcno")]
		public virtual System.Int16 of_close_month_clear_vcno(System.Int16 ai_year, System.Int16 ai_period)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_close_month_clear_vcno(ai_year__temp__, ai_period__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_gen_delseries")]
		public virtual System.Int16 of_gen_delseries(System.DateTime adtm_cal_delseries)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_cal_delseries__temp__;
			adtm_cal_delseries__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_cal_delseries);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_gen_delseries(adtm_cal_delseries__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_add_newemployee")]
		public virtual System.Int16 of_add_newemployee(string as_employee_detail_xml, System.Int16 ai_update_add)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_employee_detail_xml__temp__;
			as_employee_detail_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_employee_detail_xml);
			Sybase.PowerBuilder.PBInt ai_update_add__temp__;
			ai_update_add__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_update_add);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_add_newemployee(as_employee_detail_xml__temp__, ai_update_add__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_set_employee_salary")]
		public virtual System.Int16 of_set_employee_salary(string as_xml, string as_coopid, System.Int16 an_year)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_xml__temp__;
			as_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_xml);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBInt an_year__temp__;
			an_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)an_year);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_set_employee_salary(as_xml__temp__, as_coopid__temp__, an_year__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_process_pension")]
		public virtual System.Int16 of_process_pension(string as_coopid, System.Int16 ai_year)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_process_pension(as_coopid__temp__, ai_year__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_save_asset")]
		public virtual System.Int16 of_save_asset(string as_xml, string as_ratexml, string as_coop)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_xml__temp__;
			as_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_xml);
			Sybase.PowerBuilder.PBString as_ratexml__temp__;
			as_ratexml__temp__ = new Sybase.PowerBuilder.PBString((string)as_ratexml);
			Sybase.PowerBuilder.PBString as_coop__temp__;
			as_coop__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_save_asset(as_xml__temp__, as_ratexml__temp__, as_coop__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_calculate_dp")]
		public virtual decimal of_calculate_dp(string as_assetdoc, string as_coop, decimal adc_assetprice, System.DateTime adtm_calfrom, System.DateTime adtm_calto, ref string as_calrate)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			decimal __retval__;
			Sybase.PowerBuilder.PBString as_assetdoc__temp__;
			as_assetdoc__temp__ = new Sybase.PowerBuilder.PBString((string)as_assetdoc);
			Sybase.PowerBuilder.PBString as_coop__temp__;
			as_coop__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop);
			Sybase.PowerBuilder.PBDecimal adc_assetprice__temp__;
			adc_assetprice__temp__ = new Sybase.PowerBuilder.PBDecimal((decimal)adc_assetprice);
			Sybase.PowerBuilder.PBDateTime adtm_calfrom__temp__;
			adtm_calfrom__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_calfrom);
			Sybase.PowerBuilder.PBDateTime adtm_calto__temp__;
			adtm_calto__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_calto);
			Sybase.PowerBuilder.PBString as_calrate__temp__ = as_calrate;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_calculate_dp(as_assetdoc__temp__, as_coop__temp__, adc_assetprice__temp__, adtm_calfrom__temp__, adtm_calto__temp__, ref as_calrate__temp__);
			as_calrate = as_calrate__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_cal_dp")]
		public virtual System.Int16 of_cal_dp(System.DateTime adtm_caltodate, string as_coop)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_caltodate__temp__;
			adtm_caltodate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_caltodate);
			Sybase.PowerBuilder.PBString as_coop__temp__;
			as_coop__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_cal_dp(adtm_caltodate__temp__, as_coop__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_close_depreciation")]
		public virtual System.Int16 of_close_depreciation(System.Int16 ai_year, System.DateTime adtm_caltodate, string as_coopid)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBDateTime adtm_caltodate__temp__;
			adtm_caltodate__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_caltodate);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_close_depreciation(ai_year__temp__, adtm_caltodate__temp__, as_coopid__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_cancel_dpyear")]
		public virtual System.Int16 of_cancel_dpyear(System.Int16 ai_year, string as_coopid)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_cancel_dpyear(ai_year__temp__, as_coopid__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_process_member_balance")]
		public virtual System.Int16 of_process_member_balance(System.Int16 ai_year, System.Int16 ai_period, string as_coopid)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_process_member_balance(ai_year__temp__, ai_period__temp__, as_coopid__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_gen_trial_bs_coop")]
		public virtual System.Int16 of_gen_trial_bs_coop(string as_choose_report_xml, string as_coop_id, ref string as_trial_report_xml)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBString as_choose_report_xml__temp__;
			as_choose_report_xml__temp__ = new Sybase.PowerBuilder.PBString((string)as_choose_report_xml);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			Sybase.PowerBuilder.PBString as_trial_report_xml__temp__ = as_trial_report_xml;
			__retval__ = ((c__n_cst_account_service)__nvo__).of_gen_trial_bs_coop(as_choose_report_xml__temp__, as_coop_id__temp__, ref as_trial_report_xml__temp__);
			as_trial_report_xml = as_trial_report_xml__temp__;
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_gen_trial_bs2")]
		public virtual System.Int16 of_gen_trial_bs2(System.DateTime adtm_start_date, System.DateTime adtm_end_date, string as_check_flag, string as_coop_id)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBDateTime adtm_start_date__temp__;
			adtm_start_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_start_date);
			Sybase.PowerBuilder.PBDateTime adtm_end_date__temp__;
			adtm_end_date__temp__ = new Sybase.PowerBuilder.PBDateTime((System.DateTime)adtm_end_date);
			Sybase.PowerBuilder.PBString as_check_flag__temp__;
			as_check_flag__temp__ = new Sybase.PowerBuilder.PBString((string)as_check_flag);
			Sybase.PowerBuilder.PBString as_coop_id__temp__;
			as_coop_id__temp__ = new Sybase.PowerBuilder.PBString((string)as_coop_id);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_gen_trial_bs2(adtm_start_date__temp__, adtm_end_date__temp__, as_check_flag__temp__, as_coop_id__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
		[OperationContract(Name="of_process_member_balance_compair")]
		public virtual System.Int16 of_process_member_balance_compair(System.Int16 ai_year, System.Int16 ai_period, string as_coopid)
		{
			c__pbservice125.InitSession(__nvo__.Session);
			System.Int16 __retval__;
			Sybase.PowerBuilder.PBInt ai_year__temp__;
			ai_year__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_year);
			Sybase.PowerBuilder.PBInt ai_period__temp__;
			ai_period__temp__ = new Sybase.PowerBuilder.PBInt((System.Int16)ai_period);
			Sybase.PowerBuilder.PBString as_coopid__temp__;
			as_coopid__temp__ = new Sybase.PowerBuilder.PBString((string)as_coopid);
			__retval__ = ((c__n_cst_account_service)__nvo__).of_process_member_balance_compair(ai_year__temp__, ai_period__temp__, as_coopid__temp__);
			c__pbservice125.RestoreOldSession();
			return __retval__;
		}
	}
} 