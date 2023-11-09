using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_keep_proc
	{
		internal str_keep_proc(c__str_keep_proc __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_keep_proc __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string xml_option;
		[DataMember] 
		public string sqlrpt_desc;
		internal void CopyTo(c__str_keep_proc __x__)
		{
			__x__.xml_option = xml_option;
			__x__.sqlrpt_desc = sqlrpt_desc;
		}
		internal static void CopyFrom(out str_keep_proc __this__, c__str_keep_proc __x__)
		{
			__this__.xml_option = __x__.xml_option;
			__this__.sqlrpt_desc = __x__.sqlrpt_desc;
		}
		public static explicit operator object[](str_keep_proc __this__)
		{
			return new object[] {
				__this__.xml_option
				,__this__.sqlrpt_desc
			};
		}
	}
} 