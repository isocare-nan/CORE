using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct n_ds
	{
		internal n_ds(c__n_ds __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__n_ds __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string is_errmsg;
		internal void CopyTo(c__n_ds __x__)
		{
			__x__.is_errmsg = is_errmsg;
		}
		internal static void CopyFrom(out n_ds __this__, c__n_ds __x__)
		{
			__this__.is_errmsg = __x__.is_errmsg;
		}
		public static explicit operator object[](n_ds __this__)
		{
			return new object[] {
				__this__.is_errmsg
			};
		}
	}
} 