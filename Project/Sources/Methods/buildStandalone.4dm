//%attributes = {}
var $build : cs:C1710.Build4D.Standalone
var $settings; $componentFolder : Object
var $components : Collection
var $success : Boolean

$settings:={}
// Define the project file
$settings.projectFile:=Folder:C1567(fk desktop folder:K87:19).file("demo-Build4D-Win/Project/demo-Build4D-Win.4DProject")

// Configure the application
$settings.buildName:="myApp"
$settings.destinationFolder:=Folder:C1567(fk desktop folder:K87:19).folder("standaloneApp")
$settings.obfuscated:=True:C214  //??
$settings.packedProject:=False:C215  //??
$settings.useSDI:=False:C215  //??
$settings.startElevated:=True:C214  //??
$settings.lastDataPathLookup:="ByAppPath"  //??

// Define the 4D Volume Desktop path
$settings.sourceAppFolder:=Folder:C1567(fk documents folder:K87:21).folder("4D 20 R8 100333/4D Volume Desktop")

// Specify the components required for compilation
//$componentFolder:=Folder(fk documents folder).folder("4D 20 R8 100333/4D/Components")
//$components:=[]
//$components.push($componentFolder.file("4D WritePro Interface.4dbase/4D WritePro Interface.4DZ"))
//$settings.compilerOptions:={components: $components}

// Delete the unnecessary module
//$settings.excludeModules:=["CEF"; "MeCab"]

// Include the folders and files
//$settings.includePaths:=[]
//$settings.includePaths.push({source: $componentFolder.folder("4D WritePro Interface.4dbase").path; destination: "../Components/"})
//$settings.includePaths.push({source: $componentFolder.folder("4D SVG.4dbase").path; destination: "../Components/"})

// Delete the folders and files 
$settings.deletePaths:=[]
$settings.deletePaths.push("Resources/Dev/")

// Add the application icon
//$settings.iconPath:="/RESOURCES/myIcon.icns"

// Add the application information
$settings.versioning:={}
$settings.versioning.version:="version"
$settings.versioning.copyright:="copyright"
$settings.versioning.companyName:="4D"
//$settings.versioning.fileDescription:="fileDescription"
//$settings.versioning.internalName:="internalName"

// Create the deployment license file
$settings.license:=Folder:C1567(fk licenses folder:K87:16).file("R-4USD000UUR001BCQ8S11F61.license4D")

//// Sign the macOS appplication
//$settings.signApplication:={}
//$settings.signApplication.macSignature:=True
//$settings.signApplication.macCertificate:="xxxxxx"

// Launch the build
$build:=cs:C1710.Build4D.Standalone.new($settings)
$success:=$build.build()