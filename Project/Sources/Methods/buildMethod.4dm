//%attributes = {}
// Launch the build process
LOG EVENT:C667(Into system standard outputs:K38:9; "✅ Starting Build Process\r\n")

// Declare result objects
var $resultClient; $resultServer : Object

// Run the client build
LOG EVENT:C667(Into system standard outputs:K38:9; "📦 Running buildClient...\r\n")
$resultClient:=buildClient()
LOG EVENT:C667(Into system standard outputs:K38:9; "📦 buildClient result: "+JSON Stringify:C1217($resultClient)+"\r\n")

// Check if client build succeeded
If ($resultClient.success)
	// Proceed with server build
	LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ Running buildServer...\r\n")
	$resultServer:=buildServer()
	LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ buildServer result: "+JSON Stringify:C1217($resultServer)+"\r\n")
	
	// Final check for both builds
	If ($resultServer.success)
		LOG EVENT:C667(Into system standard outputs:K38:9; "✅ All builds succeeded!\r\n")
	Else 
		LOG EVENT:C667(Into system standard outputs:K38:9; "❌ Server build failed.\r\n")
	End if 
Else 
	// Client build failed – stop early
	LOG EVENT:C667(Into system standard outputs:K38:9; "❌ Client build failed. Aborting server build.\r\n")
End if 
