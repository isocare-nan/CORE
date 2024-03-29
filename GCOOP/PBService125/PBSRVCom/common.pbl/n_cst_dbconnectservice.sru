$PBExportHeader$n_cst_dbconnectservice.sru
$PBExportComments$ส่วนบริการสำหรับเชื่อมต่อฐานข้อมูล

forward
global type n_cst_dbconnectservice from NonVisualObject
end type
end forward

/// <summary> ส่วนบริการสำหรับเชื่อมต่อฐานข้อมูล
/// 
/// </summary>
global type n_cst_dbconnectservice from NonVisualObject
end type
global n_cst_dbconnectservice n_cst_dbconnectservice

type variables
Public:
transaction	itr_dbconnection
string is_coopid,is_coopcontrol, is_gcoop_path
end variables

forward prototypes
public function integer of_settransobject (ref Transaction atr_dbconnect)
public function integer of_ondbconfig ()
public function Transaction of_gettransobject ()
public function integer of_setconnectioninfo (string as_dbms, string as_database, string as_userid, string as_dbpass, string as_logid, string as_logpass, string as_server, string as_dbparm, string as_lock, boolean ab_autocommit)
public function integer of_getconnectioninfo (ref string as_dbms, ref string as_database, ref string as_userid, ref string as_dbpass, ref string as_logid, ref string as_logpass, ref string as_server, ref string as_dbparm, ref string as_lock, ref string as_autocommit)
public function integer of_initconnection ()
public function string of_getxml ()
public function integer of_disconnectdb () throws Exception
public function integer of_connectdb () throws Exception
public function string of_getelement (string as_connectionstring, string as_element_name)
public function integer of_connectdb (string as_connectionstring, string as_coopid, string as_coopcontrol, string as_gcoop_path) throws Exception
private function integer of_connectdb (string as_connectionstring, string as_coopid, string as_coopcontrol) throws Exception
public function integer of_connectdb (string as_wspass) throws Exception
end prototypes

public function integer of_settransobject (ref Transaction atr_dbconnect);
if not isvalid( atr_dbconnect ) then
	atr_dbconnect = create transaction
end if

itr_dbconnection = atr_dbconnect

return 1
end function

public function integer of_ondbconfig ();
//open( w_dlg_dbconnect_setting )


return -1
end function

public function Transaction of_gettransobject ();// get current of transaction object
return itr_dbconnection
end function

public function integer of_setconnectioninfo (string as_dbms, string as_database, string as_userid, string as_dbpass, string as_logid, string as_logpass, string as_server, string as_dbparm, string as_lock, boolean ab_autocommit);//*--------------------------------------------------------*/
//*  The source of connection information can be changed by
//*  altering the value of the 'is_connectfrom' variable.
//*--------------------------------------------------------*/

itr_dbconnection.dbms		= as_dbms
itr_dbconnection.database	= as_database
itr_dbconnection.userid		= as_userid
itr_dbconnection.dbpass		= as_dbpass
itr_dbconnection.logid			= as_logid
itr_dbconnection.logpass		= as_logpass
itr_dbconnection.servername	= as_server
itr_dbconnection.dbparm		= as_dbparm
itr_dbconnection.lock			= as_lock
itr_dbconnection.autocommit	= ab_autocommit

return 1
end function

public function integer of_getconnectioninfo (ref string as_dbms, ref string as_database, ref string as_userid, ref string as_dbpass, ref string as_logid, ref string as_logpass, ref string as_server, ref string as_dbparm, ref string as_lock, ref string as_autocommit);string		ls_urladdr, ls_default, ls_autocommit

//ixml_service.of_loadxml( ls_urladdr )

//as_dbms		= string( ixml_service.of_getxml( "DATABASE", "DBMS", "O90 Oracle9i (9.0.1)" ) )
//as_database= string( ixml_service.of_getxml( "DATABASE", "Database", "dbsaving" ) )
//as_userid	= string( ixml_service.of_getxml( "DATABASE", "UserId", ls_default ) )
//as_dbpass	= string( ixml_service.of_getxml( "DATABASE", "DBPass", ls_default ) )
//as_logid		= string( ixml_service.of_getxml( "DATABASE", "LogId", ls_default ) )
//as_logpass	= string( ixml_service.of_getxml( "DATABASE", "LogPassword", ls_default ) )
//as_server	= string( ixml_service.of_getxml( "DATABASE", "ServerName", ls_default ) )
//as_dbparm	= string( ixml_service.of_getxml( "DATABASE", "DbParm", "NLS_Charset='TH8TISASCII'" ) )
//as_lock		= string( ixml_service.of_getxml( "DATABASE", "Lock", ls_default ) )

//as_autocommit = string( ixml_service.of_getxml( "DATABASE", "AutoCommit", "False" ) )

choose case lower( ls_autocommit ) 
	case "1", "true", "on", "yes"
		itr_dbconnection.AutoCommit	= true
	case "0", "false", "off", "no"
		itr_dbconnection.AutoCommit	= false
	case else
		itr_dbconnection.AutoCommit	= false
end choose

return 1
end function

public function integer of_initconnection ();string		ls_urladdr, ls_default, ls_autocommit

//ixml_service.of_loadxml( ls_urladdr )
//
//itr_dbconnection.DBMS		= string( ixml_service.of_getxml( "DATABASE", "DBMS", "O90 Oracle9i (9.0.1)" ) )
//itr_dbconnection.Database	= string( ixml_service.of_getxml( "DATABASE", "Database", "dbsaving" ) )
//itr_dbconnection.UserID		= string( ixml_service.of_getxml( "DATABASE", "UserId", ls_default ) )
//itr_dbconnection.DBPass		= string( ixml_service.of_getxml( "DATABASE", "DBPass", ls_default ) )
//itr_dbconnection.LogID		= string( ixml_service.of_getxml( "DATABASE", "LogId", ls_default ) )
//itr_dbconnection.LogPass	= string( ixml_service.of_getxml( "DATABASE", "LogPassword", ls_default ) )
//itr_dbconnection.ServerName	= string( ixml_service.of_getxml( "DATABASE", "ServerName", ls_default ) )
//itr_dbconnection.DBParm		= string( ixml_service.of_getxml( "DATABASE", "DbParm", "NLS_Charset='TH8TISASCII'" ) )
//itr_dbconnection.Lock			= string( ixml_service.of_getxml( "DATABASE", "Lock", ls_default ) )
//
//ls_autocommit = string( ixml_service.of_getxml( "DATABASE", "AutoCommit", "False" ) )
choose case lower( ls_autocommit ) 
	case "1", "true", "on", "yes"
		itr_dbconnection.AutoCommit	= true
	case "0", "false", "off", "no"
		itr_dbconnection.AutoCommit	= false
	case else
		itr_dbconnection.AutoCommit	= false
end choose

return 1
end function

public function string of_getxml ();return ""
end function

public function integer of_disconnectdb () throws Exception;//*--------------------------------------------------------*/
//*  Disconnect from database
//*--------------------------------------------------------*/

/*  Actual DB disconnection */
disconnect using itr_dbconnection;

if itr_dbconnection.sqlcode <> 0 then
	Exception e
	e = create Exception
	e.setmessage( itr_dbconnection.sqlerrtext )
	throw e
end if

return itr_dbconnection.sqlcode
end function

public function integer of_connectdb () throws Exception;//*--------------------------------------------------------*/
//*  Make a connection to the database
//*--------------------------------------------------------*/

/*  Actual DB connection */
// Profile scocbtch@webcenter
itr_dbconnection = create transaction

itr_dbconnection.DBMS = "O10 Oracle10g (10.1.0)"
itr_dbconnection.LogPass = "scocbtch"
itr_dbconnection.ServerName = "gco"
itr_dbconnection.LogId = "scocbtch"
itr_dbconnection.AutoCommit = False
itr_dbconnection.DBParm = "PBCatalogOwner='scocbtch',TableCriteria=',scocbtch'"

connect using itr_dbconnection;

if itr_dbconnection.sqlcode <> 0 then
	Exception e
	e = create Exception
	e.setmessage( itr_dbconnection.sqlerrtext ) 
	throw e
end if

return itr_dbconnection.sqlcode
end function

public function string of_getelement (string as_connectionstring, string as_element_name);n_cst_stringservice n_str
string ls_array[]
int li_count
int li_i
string ls_result

n_str = create n_cst_stringservice;
n_str.of_parse_plus(as_connectionstring, ls_array, li_count, ";")

for li_i = 1 to li_count + 1
	if Pos(ls_array[li_i], as_element_name) = 1 then
		string ls_array2[]
		int li_count2
		n_str.of_parse_plus(ls_array[li_i], ls_array2, li_count2, "=")
         ls_result = trim(ls_array2[2]);
		exit
	end if
next

return ls_result;
end function

public function integer of_connectdb (string as_connectionstring, string as_coopid, string as_coopcontrol, string as_gcoop_path) throws Exception;//*--------------------------------------------------------*/
//*  Make a connection to the database
//*--------------------------------------------------------*/

is_gcoop_path = as_gcoop_path

/*  Actual DB connection */
itr_dbconnection = create transaction
is_coopid=as_coopid
is_coopcontrol=as_coopcontrol


//"Data Source=imm/gcoop;Persist Security Info=True;User ID=scobkcat;Password=scobkcat;"
string ls_username
ls_username = of_getelement(as_connectionstring, "User ID")
itr_dbconnection.DBMS = "O10 Oracle10g (10.1.0)"
itr_dbconnection.LogPass = of_getelement(as_connectionstring, "Password")
itr_dbconnection.ServerName = of_getelement(as_connectionstring, "Data Source")
itr_dbconnection.LogId = ls_username
itr_dbconnection.AutoCommit = False
itr_dbconnection.DBParm = "PBCatalogOwner='" + ls_username + "',TableCriteria='," + ls_username + "'"

connect using itr_dbconnection;

if itr_dbconnection.sqlcode <> 0 then
	Exception e
	e = create Exception
	e.setmessage( itr_dbconnection.sqlerrtext )
	throw e
end if

return itr_dbconnection.sqlcode
end function

private function integer of_connectdb (string as_connectionstring, string as_coopid, string as_coopcontrol) throws Exception;//*--------------------------------------------------------*/
//*  Make a connection to the database
//*--------------------------------------------------------*/

/*  Actual DB connection */
itr_dbconnection = create transaction
is_coopid=as_coopid
is_coopcontrol=as_coopcontrol


//"Data Source=imm/gcoop;Persist Security Info=True;User ID=scobkcat;Password=scobkcat;"
string ls_username
ls_username = of_getelement(as_connectionstring, "User ID")
itr_dbconnection.DBMS = "O10 Oracle10g (10.1.0)"
itr_dbconnection.LogPass = of_getelement(as_connectionstring, "Password")
itr_dbconnection.ServerName = of_getelement(as_connectionstring, "Data Source")
itr_dbconnection.LogId = ls_username
itr_dbconnection.AutoCommit = False
itr_dbconnection.DBParm = "PBCatalogOwner='" + ls_username + "',TableCriteria='," + ls_username + "'"

connect using itr_dbconnection;

if itr_dbconnection.sqlcode <> 0 then
	Exception e
	e = create Exception
	e.setmessage( itr_dbconnection.sqlerrtext )
	throw e
end if

return itr_dbconnection.sqlcode
end function

public function integer of_connectdb (string as_wspass) throws Exception;//*--------------------------------------------------------*/
//*  Make a connection to the database
//*--------------------------------------------------------*/

is_gcoop_path = of_getelement(as_wspass, "gcoop_path")

/*  Actual DB connection */
itr_dbconnection = create transaction
is_coopid = of_getelement(as_wspass, "coop_id")
is_coopcontrol = of_getelement(as_wspass, "coop_control")

string ls_username
ls_username = of_getelement(as_wspass, "User ID")

// Profile 
itr_dbconnection.DBMS = "ADO.Net"
itr_dbconnection.LogPass = of_getelement(as_wspass, "Password")
itr_dbconnection.LogId = ls_username
itr_dbconnection.AutoCommit = false
itr_dbconnection.DBParm = "Namespace='Oracle.DataAccess.Client',DataSource='" + of_getelement(as_wspass, 'Data Source')+"',PBCatalogOwner='" + ls_username + "',DefaultProcOwner='" + ls_username + "'"

connect using itr_dbconnection;

if itr_dbconnection.sqlcode <> 0 then
	Exception e
	e = create Exception
	e.setmessage(itr_dbconnection.sqlerrtext)
	throw e
end if

return itr_dbconnection.sqlcode
end function

on n_cst_dbconnectservice.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_dbconnectservice.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on
