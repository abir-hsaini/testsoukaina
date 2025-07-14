//%attributes = {}
var $build : cs:C1710.Build4D.Component
var $settings : Object
var $success : Boolean

$settings:=New object:C1471()
$settings.destinationFolder:="Test/"
$settings.buildName:="myComponent"

$settings.includePaths:=New collection:C1472
$settings.includePaths.push(New object:C1471("source"; "Documentation/"))

$settings.deletePaths:=New collection:C1472
$settings.deletePaths.push("Resources/Dev/")

$build:=cs:C1710.Build4D.Component.new($settings)
$success:=$build.build()


