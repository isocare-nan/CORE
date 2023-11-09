using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_slipinfo
	{
		internal str_slipinfo(c__str_slipinfo __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_slipinfo __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string slip_no;
		[DataMember] 
		public string from_system;
		[DataMember] 
		public string recpaytype_code;
		[DataMember] 
		public string description;
		[DataMember] 
		public string member_no;
		[DataMember] 
		public string coop_id;
		[DataMember] 
		public System.DateTime entry_date;
		[DataMember] 
		public System.DateTime operate_date;
		[DataMember] 
		public System.Int16 item_status;
		[DataMember] 
		public System.Int16 sign_flag;
		[DataMember] 
		public decimal item_amt;
		[DataMember] 
		public decimal tax_amt;
		internal void CopyTo(c__str_slipinfo __x__)
		{
			__x__.slip_no = slip_no;
			__x__.from_system = from_system;
			__x__.recpaytype_code = recpaytype_code;
			__x__.description = description;
			__x__.member_no = member_no;
			__x__.coop_id = coop_id;
			__x__.entry_date = entry_date;
			__x__.operate_date = operate_date;
			__x__.item_status = item_status;
			__x__.sign_flag = sign_flag;
			__x__.item_amt = item_amt;
			__x__.tax_amt = tax_amt;
		}
		internal static void CopyFrom(out str_slipinfo __this__, c__str_slipinfo __x__)
		{
			__this__.slip_no = __x__.slip_no;
			__this__.from_system = __x__.from_system;
			__this__.recpaytype_code = __x__.recpaytype_code;
			__this__.description = __x__.description;
			__this__.member_no = __x__.member_no;
			__this__.coop_id = __x__.coop_id;
			__this__.entry_date = __x__.entry_date;
			__this__.operate_date = __x__.operate_date;
			__this__.item_status = __x__.item_status;
			__this__.sign_flag = __x__.sign_flag;
			__this__.item_amt = __x__.item_amt;
			__this__.tax_amt = __x__.tax_amt;
		}
		public static explicit operator object[](str_slipinfo __this__)
		{
			return new object[] {
				__this__.slip_no
				,__this__.from_system
				,__this__.recpaytype_code
				,__this__.description
				,__this__.member_no
				,__this__.coop_id
				,__this__.entry_date
				,__this__.operate_date
				,__this__.item_status
				,__this__.sign_flag
				,__this__.item_amt
				,__this__.tax_amt
			};
		}
	}
} 