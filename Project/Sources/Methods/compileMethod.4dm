//%attributes = {}
// ----------------------------------------------------
// User name (OS): Admin
// Date and time: 07/01/25, 11:21:32
// ----------------------------------------------------
// Method: compileMethod
// Description
// 
//
// Parameters
// ----------------------------------------------------

LOG EVENT:C667(Into system standard outputs:K38:9; "Compilation starts\r\n")
var $projectPath : Text
var $result : Integer
var $compilationReturn : Object

// Getting the string value of the --user-param parameter in the CLI
$result:=Get database parameter:C643(User param value:K37:94; $projectPath)

If ($projectPath#"")
	$compilationReturn:=Compile project:C1760(File:C1566($projectPath))
	LOG EVENT:C667(Into system standard outputs:K38:9; "Compilation returns : \r\n"+JSON Stringify:C1217($compilationReturn; *))
End if 

