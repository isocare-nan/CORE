//**************************************************************************
//
//                        Sybase Inc. 
//
//    THIS IS A TEMPORARY FILE GENERATED BY POWERBUILDER. IF YOU MODIFY 
//    THIS FILE, YOU DO SO AT YOUR OWN RISK. SYBASE DOES NOT PROVIDE 
//    SUPPORT FOR .NET ASSEMBLIES BUILT WITH USER-MODIFIED CS FILES. 
//
//**************************************************************************

#line 1 "c:\\gcoop_all\\core\\gcoop\\pbservice125\\pbsrvcom\\common.pbl\\common.pblx\\n_cst_dbconnectservice.sru"
#line hidden
#line 1 "n_cst_dbconnectservice"
#line hidden
[Sybase.PowerBuilder.PBGroupAttribute("n_cst_dbconnectservice",Sybase.PowerBuilder.PBGroupType.UserObject,"","c:\\gcoop_all\\core\\gcoop\\pbservice125\\pbsrvcom\\common.pbl\\common.pblx",null,"pbservice125")]
internal class c__n_cst_dbconnectservice : Sybase.PowerBuilder.PBNonVisualObject
{
	#line hidden
	[Sybase.PowerBuilder.PBVariableAttribute(Sybase.PowerBuilder.VariableTypeKind.kInstanceVar, "itr_dbconnection", null, "n_cst_dbconnectservice", null, null, Sybase.PowerBuilder.PBModifier.Public, "")]
	public Sybase.PowerBuilder.PBTransaction itr_dbconnection = null;
	[Sybase.PowerBuilder.PBVariableAttribute(Sybase.PowerBuilder.VariableTypeKind.kInstanceVar, "is_coopid", null, "n_cst_dbconnectservice", null, null, Sybase.PowerBuilder.PBModifier.Public, "")]
	public Sybase.PowerBuilder.PBString is_coopid = Sybase.PowerBuilder.PBString.DefaultValue;
	[Sybase.PowerBuilder.PBVariableAttribute(Sybase.PowerBuilder.VariableTypeKind.kInstanceVar, "is_coopcontrol", null, "n_cst_dbconnectservice", null, null, Sybase.PowerBuilder.PBModifier.Public, "")]
	public Sybase.PowerBuilder.PBString is_coopcontrol = Sybase.PowerBuilder.PBString.DefaultValue;
	[Sybase.PowerBuilder.PBVariableAttribute(Sybase.PowerBuilder.VariableTypeKind.kInstanceVar, "is_gcoop_path", null, "n_cst_dbconnectservice", null, null, Sybase.PowerBuilder.PBModifier.Public, "")]
	public Sybase.PowerBuilder.PBString is_gcoop_path = Sybase.PowerBuilder.PBString.DefaultValue;

	#line 1 "n_cst_dbconnectservice.of_settransobject(IRCtransaction.)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_settransobject", new string[]{"ref transaction"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_settransobject_1_1528663888<T0>(ref T0 atr_dbconnect) where T0 : Sybase.PowerBuilder.PBTransaction
	{
		#line hidden
		#line 2
		if (!(Sybase.PowerBuilder.WPF.PBSystemFunctions.IsValid((Sybase.PowerBuilder.PBPowerObject)(Sybase.PowerBuilder.PBTransaction)(atr_dbconnect))))
		#line hidden
		{
			#line 3
			atr_dbconnect = (T0)(Sybase.PowerBuilder.PBTransaction)((Sybase.PowerBuilder.PBTransaction)this.CreateInstance(typeof(Sybase.PowerBuilder.PBTransaction), 0));
			#line hidden
		}
		#line 6
		itr_dbconnection = (Sybase.PowerBuilder.PBTransaction)(Sybase.PowerBuilder.PBTransaction)(atr_dbconnect);
		#line hidden
		#line 8
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_ondbconfig(I)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_ondbconfig", new string[]{}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_ondbconfig()
	{
		#line hidden
		#line 5
		return new Sybase.PowerBuilder.PBInt(-1);
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_gettransobject(Ctransaction.)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_gettransobject", new string[]{}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBTransaction of_gettransobject()
	{
		#line hidden
		#line 2
		return itr_dbconnection;
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_setconnectioninfo(ISSSSSSSSSB)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_setconnectioninfo", new string[]{"string", "string", "string", "string", "string", "string", "string", "string", "string", "boolean"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_setconnectioninfo(Sybase.PowerBuilder.PBString as_dbms, Sybase.PowerBuilder.PBString as_database, Sybase.PowerBuilder.PBString as_userid, Sybase.PowerBuilder.PBString as_dbpass, Sybase.PowerBuilder.PBString as_logid, Sybase.PowerBuilder.PBString as_logpass, Sybase.PowerBuilder.PBString as_server, Sybase.PowerBuilder.PBString as_dbparm, Sybase.PowerBuilder.PBString as_lock, Sybase.PowerBuilder.PBBoolean ab_autocommit)
	{
		#line hidden
		#line 6
		itr_dbconnection.DBMS = as_dbms;
		#line hidden
		#line 7
		itr_dbconnection.Database = as_database;
		#line hidden
		#line 8
		itr_dbconnection.UserID = as_userid;
		#line hidden
		#line 9
		itr_dbconnection.DBPass = as_dbpass;
		#line hidden
		#line 10
		itr_dbconnection.LogID = as_logid;
		#line hidden
		#line 11
		itr_dbconnection.LogPass = as_logpass;
		#line hidden
		#line 12
		itr_dbconnection.ServerName = as_server;
		#line hidden
		#line 13
		itr_dbconnection.DBParm = as_dbparm;
		#line hidden
		#line 14
		itr_dbconnection.Lock = as_lock;
		#line hidden
		#line 15
		itr_dbconnection.AutoCommit = ab_autocommit;
		#line hidden
		#line 17
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_getconnectioninfo(IRSRSRSRSRSRSRSRSRSRS)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_getconnectioninfo", new string[]{"ref string", "ref string", "ref string", "ref string", "ref string", "ref string", "ref string", "ref string", "ref string", "ref string"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_getconnectioninfo(ref Sybase.PowerBuilder.PBString as_dbms, ref Sybase.PowerBuilder.PBString as_database, ref Sybase.PowerBuilder.PBString as_userid, ref Sybase.PowerBuilder.PBString as_dbpass, ref Sybase.PowerBuilder.PBString as_logid, ref Sybase.PowerBuilder.PBString as_logpass, ref Sybase.PowerBuilder.PBString as_server, ref Sybase.PowerBuilder.PBString as_dbparm, ref Sybase.PowerBuilder.PBString as_lock, ref Sybase.PowerBuilder.PBString as_autocommit)
	{
		#line hidden
		Sybase.PowerBuilder.PBString ls_urladdr = Sybase.PowerBuilder.PBString.DefaultValue;
		Sybase.PowerBuilder.PBString ls_default = Sybase.PowerBuilder.PBString.DefaultValue;
		Sybase.PowerBuilder.PBString ls_autocommit = Sybase.PowerBuilder.PBString.DefaultValue;
		#line 17
		Sybase.PowerBuilder.PBString __PB_TEMP______switchTmpVar0 = Sybase.PowerBuilder.WPF.PBSystemFunctions.Lower(ls_autocommit);
		#line hidden
		#line 18
		if ((__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBString("1") )|| (__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBString("true") )|| (__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBString("on") )|| (__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBString("yes") ))
		#line hidden
		{
			#line 19
			itr_dbconnection.AutoCommit = new Sybase.PowerBuilder.PBBoolean(true);
			#line hidden
		}
		#line 20
		else if ((__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBString("0") )|| (__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBString("false") )|| (__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBString("off") )|| (__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBString("no") ))
		#line hidden
		{
			#line 21
			itr_dbconnection.AutoCommit = new Sybase.PowerBuilder.PBBoolean(false);
			#line hidden
		}
		else 
		{
			#line 23
			itr_dbconnection.AutoCommit = new Sybase.PowerBuilder.PBBoolean(false);
			#line hidden
		}

		#line 26
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_initconnection(I)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_initconnection", new string[]{}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_initconnection()
	{
		#line hidden
		Sybase.PowerBuilder.PBString ls_urladdr = Sybase.PowerBuilder.PBString.DefaultValue;
		Sybase.PowerBuilder.PBString ls_default = Sybase.PowerBuilder.PBString.DefaultValue;
		Sybase.PowerBuilder.PBString ls_autocommit = Sybase.PowerBuilder.PBString.DefaultValue;
		#line 16
		Sybase.PowerBuilder.PBString __PB_TEMP______switchTmpVar1 = Sybase.PowerBuilder.WPF.PBSystemFunctions.Lower(ls_autocommit);
		#line hidden
		#line 17
		if ((__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBString("1") )|| (__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBString("true") )|| (__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBString("on") )|| (__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBString("yes") ))
		#line hidden
		{
			#line 18
			itr_dbconnection.AutoCommit = new Sybase.PowerBuilder.PBBoolean(true);
			#line hidden
		}
		#line 19
		else if ((__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBString("0") )|| (__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBString("false") )|| (__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBString("off") )|| (__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBString("no") ))
		#line hidden
		{
			#line 20
			itr_dbconnection.AutoCommit = new Sybase.PowerBuilder.PBBoolean(false);
			#line hidden
		}
		else 
		{
			#line 22
			itr_dbconnection.AutoCommit = new Sybase.PowerBuilder.PBBoolean(false);
			#line hidden
		}

		#line 25
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_getxml(S)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_getxml", new string[]{}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBString of_getxml()
	{
		#line hidden
		#line 1
		return new Sybase.PowerBuilder.PBString("");
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_disconnectdb(I)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_disconnectdb", new string[]{}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_disconnectdb()
	{
		#line hidden
		Sybase.PowerBuilder.PBException e = null;

		#line 6
		Sybase.PowerBuilder.DSI.PBSQL.DSISQLFunc.Stop(Sybase.PowerBuilder.WPF.PBSession.CurrentSession, itr_dbconnection);
		#line hidden
		#line 8
		if ((Sybase.PowerBuilder.PBBoolean)(itr_dbconnection.SQLCode != (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(0))))
		#line hidden
		{
			#line 10
			e = (Sybase.PowerBuilder.PBException)this.CreateInstance(typeof(Sybase.PowerBuilder.PBException), 0);
			#line hidden
			#line 11
			e.SetMessage(itr_dbconnection.SQLErrText);
			#line hidden
			#line 12
			throw new Sybase.PowerBuilder.PBExceptionE(e);
			#line hidden
		}
		#line 15
		return (Sybase.PowerBuilder.PBInt)(itr_dbconnection.SQLCode);
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_connectdb(I)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_connectdb", new string[]{}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_connectdb()
	{
		#line hidden
		Sybase.PowerBuilder.PBException e = null;
		#line 7
		itr_dbconnection = (Sybase.PowerBuilder.PBTransaction)this.CreateInstance(typeof(Sybase.PowerBuilder.PBTransaction), 0);
		#line hidden
		#line 9
		itr_dbconnection.DBMS = new Sybase.PowerBuilder.PBString("O10 Oracle10g (10.1.0)");
		#line hidden
		#line 10
		itr_dbconnection.LogPass = new Sybase.PowerBuilder.PBString("scocbtch");
		#line hidden
		#line 11
		itr_dbconnection.ServerName = new Sybase.PowerBuilder.PBString("gco");
		#line hidden
		#line 12
		itr_dbconnection.LogID = new Sybase.PowerBuilder.PBString("scocbtch");
		#line hidden
		#line 13
		itr_dbconnection.AutoCommit = new Sybase.PowerBuilder.PBBoolean(false);
		#line hidden
		#line 14
		itr_dbconnection.DBParm = new Sybase.PowerBuilder.PBString("PBCatalogOwner='scocbtch',TableCriteria=',scocbtch'");
		#line hidden

		#line 16
		Sybase.PowerBuilder.DSI.PBSQL.DSISQLFunc.Start(Sybase.PowerBuilder.WPF.PBSession.CurrentSession, itr_dbconnection, c__pbservice125.GetCurrentApplication().FreeDBLibraries);
		#line hidden
		#line 18
		if ((Sybase.PowerBuilder.PBBoolean)(itr_dbconnection.SQLCode != (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(0))))
		#line hidden
		{
			#line 20
			e = (Sybase.PowerBuilder.PBException)this.CreateInstance(typeof(Sybase.PowerBuilder.PBException), 0);
			#line hidden
			#line 21
			e.SetMessage(itr_dbconnection.SQLErrText);
			#line hidden
			#line 22
			throw new Sybase.PowerBuilder.PBExceptionE(e);
			#line hidden
		}
		#line 25
		return (Sybase.PowerBuilder.PBInt)(itr_dbconnection.SQLCode);
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_getelement(SSS)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_getelement", new string[]{"string", "string"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBString of_getelement(Sybase.PowerBuilder.PBString as_connectionstring, Sybase.PowerBuilder.PBString as_element_name)
	{
		#line hidden
		c__n_cst_stringservice n_str = null;
		Sybase.PowerBuilder.PBArray ls_array = new Sybase.PowerBuilder.PBUnboundedStringArray();
		Sybase.PowerBuilder.PBInt li_count = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBInt li_i = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBString ls_result = Sybase.PowerBuilder.PBString.DefaultValue;
		Sybase.PowerBuilder.PBArray ls_array2 = new Sybase.PowerBuilder.PBUnboundedStringArray();
		Sybase.PowerBuilder.PBInt li_count2 = Sybase.PowerBuilder.PBInt.DefaultValue;
		#line 7
		n_str = (c__n_cst_stringservice)this.CreateInstance(typeof(c__n_cst_stringservice), 0);
		#line hidden
		#line 8
		of_parse_plus_4_345252223_4_n_1350002604(n_str, as_connectionstring, ref ls_array, ref li_count, new Sybase.PowerBuilder.PBString(";"));
		#line hidden
		#line 10
		for (li_i = new Sybase.PowerBuilder.PBInt(1);li_i <= ((Sybase.PowerBuilder.PBInt)((Sybase.PowerBuilder.PBLong)(li_count)+ (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(1))));li_i = li_i + 1)
		#line hidden
		{
				#line 11
				if ((Sybase.PowerBuilder.PBBoolean)(Sybase.PowerBuilder.WPF.PBSystemFunctions.Pos(((Sybase.PowerBuilder.PBString)ls_array[(Sybase.PowerBuilder.PBLong)(li_i)]), as_element_name) == (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(1))))
				#line hidden
				{
					#line 14
					of_parse_plus_4_345252223_4_n_1317359018(n_str, ((Sybase.PowerBuilder.PBString)ls_array[(Sybase.PowerBuilder.PBLong)(li_i)]), ref ls_array2, ref li_count2, new Sybase.PowerBuilder.PBString("="));
					#line hidden
					#line 15
					ls_result = Sybase.PowerBuilder.WPF.PBSystemFunctions.Trim(((Sybase.PowerBuilder.PBString)ls_array2[(Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(2))]));
					#line hidden
					#line 16
					break;
					#line hidden
				}
		}
		#line 20
		return ls_result;
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_connectdb(ISSSS)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_connectdb", new string[]{"string", "string", "string", "string"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_connectdb(Sybase.PowerBuilder.PBString as_connectionstring, Sybase.PowerBuilder.PBString as_coopid, Sybase.PowerBuilder.PBString as_coopcontrol, Sybase.PowerBuilder.PBString as_gcoop_path)
	{
		#line hidden
		Sybase.PowerBuilder.PBString ls_username = Sybase.PowerBuilder.PBString.DefaultValue;
		Sybase.PowerBuilder.PBException e = null;
		#line 5
		is_gcoop_path = as_gcoop_path;
		#line hidden
		#line 8
		itr_dbconnection = (Sybase.PowerBuilder.PBTransaction)this.CreateInstance(typeof(Sybase.PowerBuilder.PBTransaction), 0);
		#line hidden
		#line 9
		is_coopid = as_coopid;
		#line hidden
		#line 10
		is_coopcontrol = as_coopcontrol;
		#line hidden
		#line 15
		ls_username = this.of_getelement(as_connectionstring, new Sybase.PowerBuilder.PBString("User ID"));
		#line hidden
		#line 16
		itr_dbconnection.DBMS = new Sybase.PowerBuilder.PBString("O10 Oracle10g (10.1.0)");
		#line hidden
		#line 17
		itr_dbconnection.LogPass = this.of_getelement(as_connectionstring, new Sybase.PowerBuilder.PBString("Password"));
		#line hidden
		#line 18
		itr_dbconnection.ServerName = this.of_getelement(as_connectionstring, new Sybase.PowerBuilder.PBString("Data Source"));
		#line hidden
		#line 19
		itr_dbconnection.LogID = ls_username;
		#line hidden
		#line 20
		itr_dbconnection.AutoCommit = new Sybase.PowerBuilder.PBBoolean(false);
		#line hidden
		#line 21
		itr_dbconnection.DBParm = (((new Sybase.PowerBuilder.PBString("PBCatalogOwner='")+ ls_username)+ new Sybase.PowerBuilder.PBString("',TableCriteria=',"))+ ls_username)+ new Sybase.PowerBuilder.PBString("'");
		#line hidden

		#line 23
		Sybase.PowerBuilder.DSI.PBSQL.DSISQLFunc.Start(Sybase.PowerBuilder.WPF.PBSession.CurrentSession, itr_dbconnection, c__pbservice125.GetCurrentApplication().FreeDBLibraries);
		#line hidden
		#line 25
		if ((Sybase.PowerBuilder.PBBoolean)(itr_dbconnection.SQLCode != (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(0))))
		#line hidden
		{
			#line 27
			e = (Sybase.PowerBuilder.PBException)this.CreateInstance(typeof(Sybase.PowerBuilder.PBException), 0);
			#line hidden
			#line 28
			e.SetMessage(itr_dbconnection.SQLErrText);
			#line hidden
			#line 29
			throw new Sybase.PowerBuilder.PBExceptionE(e);
			#line hidden
		}
		#line 32
		return (Sybase.PowerBuilder.PBInt)(itr_dbconnection.SQLCode);
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_connectdb(ISSS)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_connectdb", new string[]{"string", "string", "string"}, Sybase.PowerBuilder.PBModifier.Private, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	private Sybase.PowerBuilder.PBInt of_connectdb(Sybase.PowerBuilder.PBString as_connectionstring, Sybase.PowerBuilder.PBString as_coopid, Sybase.PowerBuilder.PBString as_coopcontrol)
	{
		#line hidden
		Sybase.PowerBuilder.PBString ls_username = Sybase.PowerBuilder.PBString.DefaultValue;
		Sybase.PowerBuilder.PBException e = null;
		#line 6
		itr_dbconnection = (Sybase.PowerBuilder.PBTransaction)this.CreateInstance(typeof(Sybase.PowerBuilder.PBTransaction), 0);
		#line hidden
		#line 7
		is_coopid = as_coopid;
		#line hidden
		#line 8
		is_coopcontrol = as_coopcontrol;
		#line hidden
		#line 13
		ls_username = this.of_getelement(as_connectionstring, new Sybase.PowerBuilder.PBString("User ID"));
		#line hidden
		#line 14
		itr_dbconnection.DBMS = new Sybase.PowerBuilder.PBString("O10 Oracle10g (10.1.0)");
		#line hidden
		#line 15
		itr_dbconnection.LogPass = this.of_getelement(as_connectionstring, new Sybase.PowerBuilder.PBString("Password"));
		#line hidden
		#line 16
		itr_dbconnection.ServerName = this.of_getelement(as_connectionstring, new Sybase.PowerBuilder.PBString("Data Source"));
		#line hidden
		#line 17
		itr_dbconnection.LogID = ls_username;
		#line hidden
		#line 18
		itr_dbconnection.AutoCommit = new Sybase.PowerBuilder.PBBoolean(false);
		#line hidden
		#line 19
		itr_dbconnection.DBParm = (((new Sybase.PowerBuilder.PBString("PBCatalogOwner='")+ ls_username)+ new Sybase.PowerBuilder.PBString("',TableCriteria=',"))+ ls_username)+ new Sybase.PowerBuilder.PBString("'");
		#line hidden

		#line 21
		Sybase.PowerBuilder.DSI.PBSQL.DSISQLFunc.Start(Sybase.PowerBuilder.WPF.PBSession.CurrentSession, itr_dbconnection, c__pbservice125.GetCurrentApplication().FreeDBLibraries);
		#line hidden
		#line 23
		if ((Sybase.PowerBuilder.PBBoolean)(itr_dbconnection.SQLCode != (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(0))))
		#line hidden
		{
			#line 25
			e = (Sybase.PowerBuilder.PBException)this.CreateInstance(typeof(Sybase.PowerBuilder.PBException), 0);
			#line hidden
			#line 26
			e.SetMessage(itr_dbconnection.SQLErrText);
			#line hidden
			#line 27
			throw new Sybase.PowerBuilder.PBExceptionE(e);
			#line hidden
		}
		#line 30
		return (Sybase.PowerBuilder.PBInt)(itr_dbconnection.SQLCode);
		#line hidden
	}

	#line 1 "n_cst_dbconnectservice.of_connectdb(IS)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_connectdb", new string[]{"string"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_connectdb(Sybase.PowerBuilder.PBString as_wspass)
	{
		#line hidden
		Sybase.PowerBuilder.PBString ls_username = Sybase.PowerBuilder.PBString.DefaultValue;
		Sybase.PowerBuilder.PBException e = null;
		#line 5
		is_gcoop_path = this.of_getelement(as_wspass, new Sybase.PowerBuilder.PBString("gcoop_path"));
		#line hidden
		#line 8
		itr_dbconnection = (Sybase.PowerBuilder.PBTransaction)this.CreateInstance(typeof(Sybase.PowerBuilder.PBTransaction), 0);
		#line hidden
		#line 9
		is_coopid = this.of_getelement(as_wspass, new Sybase.PowerBuilder.PBString("coop_id"));
		#line hidden
		#line 10
		is_coopcontrol = this.of_getelement(as_wspass, new Sybase.PowerBuilder.PBString("coop_control"));
		#line hidden
		#line 13
		ls_username = this.of_getelement(as_wspass, new Sybase.PowerBuilder.PBString("User ID"));
		#line hidden
		#line 16
		itr_dbconnection.DBMS = new Sybase.PowerBuilder.PBString("ADO.Net");
		#line hidden
		#line 17
		itr_dbconnection.LogPass = this.of_getelement(as_wspass, new Sybase.PowerBuilder.PBString("Password"));
		#line hidden
		#line 18
		itr_dbconnection.LogID = ls_username;
		#line hidden
		#line 19
		itr_dbconnection.AutoCommit = new Sybase.PowerBuilder.PBBoolean(false);
		#line hidden
		#line 20
		itr_dbconnection.DBParm = (((((new Sybase.PowerBuilder.PBString("Namespace='Oracle.DataAccess.Client',DataSource='")+ this.of_getelement(as_wspass, new Sybase.PowerBuilder.PBString("Data Source")))+ new Sybase.PowerBuilder.PBString("',PBCatalogOwner='"))+ ls_username)+ new Sybase.PowerBuilder.PBString("',DefaultProcOwner='"))+ ls_username)+ new Sybase.PowerBuilder.PBString("'");
		#line hidden

		#line 22
		Sybase.PowerBuilder.DSI.PBSQL.DSISQLFunc.Start(Sybase.PowerBuilder.WPF.PBSession.CurrentSession, itr_dbconnection, c__pbservice125.GetCurrentApplication().FreeDBLibraries);
		#line hidden
		#line 24
		if ((Sybase.PowerBuilder.PBBoolean)(itr_dbconnection.SQLCode != (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(0))))
		#line hidden
		{
			#line 26
			e = (Sybase.PowerBuilder.PBException)this.CreateInstance(typeof(Sybase.PowerBuilder.PBException), 0);
			#line hidden
			#line 27
			e.SetMessage(itr_dbconnection.SQLErrText);
			#line hidden
			#line 28
			throw new Sybase.PowerBuilder.PBExceptionE(e);
			#line hidden
		}
		#line 31
		return (Sybase.PowerBuilder.PBInt)(itr_dbconnection.SQLCode);
		#line hidden
	}

	#line hidden
	[Sybase.PowerBuilder.PBEventAttribute("create")]
	public override void create()
	{
		#line hidden
		#line hidden
		base.create();
		#line hidden
		#line hidden
		;
		#line hidden
	}

	#line hidden
	[Sybase.PowerBuilder.PBEventAttribute("destroy")]
	public override void destroy()
	{
		#line hidden
		#line hidden
		this.TriggerEvent(new Sybase.PowerBuilder.PBString("destructor"));
		#line hidden
		#line hidden
		base.destroy();
		#line hidden
	}

	public Sybase.PowerBuilder.PBInt of_parse_plus_4_345252223_4_n_1350002604(c__n_cst_stringservice this__object, Sybase.PowerBuilder.PBString as_string, ref Sybase.PowerBuilder.PBArray as_array, ref Sybase.PowerBuilder.PBInt ai_count, Sybase.PowerBuilder.PBString as_delimiter)
	{
		Sybase.PowerBuilder.PBInt return_value = this__object.of_parse_plus_4_345252223(as_string, ref as_array, ref ai_count, as_delimiter);
		return return_value;
	}

	public Sybase.PowerBuilder.PBInt of_parse_plus_4_345252223_4_n_1317359018(c__n_cst_stringservice this__object, Sybase.PowerBuilder.PBString as_string, ref Sybase.PowerBuilder.PBArray as_array, ref Sybase.PowerBuilder.PBInt ai_count, Sybase.PowerBuilder.PBString as_delimiter)
	{
		Sybase.PowerBuilder.PBInt return_value = this__object.of_parse_plus_4_345252223(as_string, ref as_array, ref ai_count, as_delimiter);
		return return_value;
	}


	void _init()
	{
		this.CreateEvent += new Sybase.PowerBuilder.PBEventHandler(this.create);
		this.DestroyEvent += new Sybase.PowerBuilder.PBEventHandler(this.destroy);

		if (System.ComponentModel.LicenseManager.UsageMode != System.ComponentModel.LicenseUsageMode.Designtime)
		{
		}
	}

	public c__n_cst_dbconnectservice()
	{
		_init();
	}


	public static explicit operator c__n_cst_dbconnectservice(Sybase.PowerBuilder.PBAny v)
	{
		if (v.Value is Sybase.PowerBuilder.PBUnboundedAnyArray)
		{
			Sybase.PowerBuilder.PBUnboundedAnyArray a = (Sybase.PowerBuilder.PBUnboundedAnyArray)v.Value;
			c__n_cst_dbconnectservice vv = new c__n_cst_dbconnectservice();
			if (vv.FromUnboundedAnyArray(a) > 0)
			{
				return vv;
			}
			else
			{
				return null;
			}
		}
		else
		{
			return (c__n_cst_dbconnectservice) v.Value;
		}
	}
}
 