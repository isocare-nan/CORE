$PBExportHeader$n_cst_utility.sru
forward
global type n_cst_utility from nonvisualobject
end type
end forward

global type n_cst_utility from nonvisualobject
end type
global n_cst_utility n_cst_utility

type variables

transaction	itr_dbconnection
throwable	ithw_exception
end variables

forward prototypes
public function string of_getdddwxml (string as_dddwobj)
public subroutine of_settrans (n_cst_dbconnectservice anv_db)
end prototypes

public function string of_getdddwxml (string as_dddwobj);datastore lds_dddwxml
string  as_xmldddw

lds_dddwxml = create datastore 
lds_dddwxml.dataobject = as_dddwobj

lds_dddwxml.settransobject(itr_dbconnection)
lds_dddwxml.retrieve()
as_xmldddw = lds_dddwxml.describe("datawindow.data.xml") 

return   as_xmldddw
end function

public subroutine of_settrans (n_cst_dbconnectservice anv_db);this.itr_dbconnection = anv_db.itr_dbconnection
end subroutine

on n_cst_utility.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_utility.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

