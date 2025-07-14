//%attributes = {}
#DECLARE()->$result : Object
var $build : cs:C1710.Build4D.Server
var $settings : Object
var $success : Boolean
//var $archivePath : 

LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ Running inside buildServer...\r\n")
$settings:={}
$settings.startElevated:=True:C214

// Define the external project file
$settings.projectFile:=Folder:C1567(fk desktop folder:K87:19).file("demo-Build4D-Win/Project/demo-Build4D-Win.4DProject")
LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ inside server code 1: "+$settings.projectFile.path+"\r\n")

// Define the 4D Server path
$settings.sourceAppFolder:=Folder:C1567(fk documents folder:K87:21).folder("4D 20 R8 100333/4D Server")
LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ inside server code 2: "+$settings.sourceAppFolder.path+"\r\n")

// Configure the application
$settings.buildName:="serverApp"
$settings.publishName:="myAppServ"
$settings.destinationFolder:=Folder:C1567(fk desktop folder:K87:19).folder("buildApp/Server")
LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ inside server code 3: "+$settings.destinationFolder.path+"\r\n")

// Add the application icon
//$settings.iconPath:="/RESOURCES/myIcon.ico"

// Add the application information
$settings.versioning:={}
$settings.versioning.version:="1.0.0"
$settings.versioning.copyright:="copyright"
$settings.versioning.companyName:="4D SAS"

// Add the client archive
If ($settings.destinationFolder.parent.folder("Client/").exists)
	$settings.windowsClientArchive:=$settings.destinationFolder.parent.folder("Client").file("update.win.4darchive")
End if 
If ($settings.windowsClientArchive#Null:C1517)
	LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ inside server code 4: "+$settings.windowsClientArchive.path+"\r\n")
End if 
LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ inside server code 5: "+JSON Stringify:C1217($settings)+"\r\n")

// Launch the build
$build:=cs:C1710.Build4D.Server.new($settings)
LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ inside server: "+JSON Stringify:C1217($settings)+"\r\n")

$success:=$build.build()
//$logs:=$build.logs
$result:=New object:C1471("success"; $success; "logs"; $build.logs)