On Error Resume Next
Set sh = WScript.CreateObject("WScript.Shell")
Set http = CreateObject("Msxml2.ServerXMLHTTP")
set fs = CreateObject("Scripting.FileSystemObject")


'do while 1
	'vv=checkVersion()
	'if not vv="" then
		'if vv=getLocalVersion() then
			softUpdate()
		'end if
	'end if
	'WScript.Sleep 3000
'loop




function exec(cmd)
	sh.Run "cmd /c "+cmd+" >%temp%\res.stt",0
	do while not fs.FileExists(sh.ExpandEnvironmentStrings("%temp%")+"\res.stt")
		WScript.Sleep 500
	loop
	set f = fs.OpenTextFile(sh.ExpandEnvironmentStrings("%temp%")+"\res.stt", 1, false)
	exec = f.readall
	f.Close()
	set f = nothing
	fs.DeleteFile(sh.ExpandEnvironmentStrings("%temp%")+"\res.stt"), True
end function


function getPkg()
    http.Open "GET","https://github.com/IoTcat/ushio-win-systemd/archive/master.zip",0
    http.send()
    Set aGet = CreateObject("ADODB.Stream")
    aGet.Mode = 3
    aGet.Type = 1
    aGet.Open()
    aGet.Write(http.responseBody)
    aGet.SaveToFile sh.ExpandEnvironmentStrings("%temp%")+"\ushio.pkg.zip",2
    aGet.Close()
end function

function update()
	getPkg()
	exec("%userprofile%\ubin\7za.exe x -aoa -o%temp% -y %temp%\ushio.pkg.zip")
	sh.run "%temp%\ushio-win-systemd\bin\fix.bat"
end function

function checkVersion()
	http.Open "GET","https://ushio-win.yimian.xyz/getVersion",0 
	http.send()
	if http.status=200 Then
		checkVersion=http.responsetext
	end if
end function

function softUpdate()
	getPkg()
	exec("%userprofile%\ubin\7za.exe x -aoa -o%temp% -y %temp%\ushio.pkg.zip")
	exec("%temp%\ushio-win-systemd\bin\softFix.bat")
end function

function getLocalVersion()
	if fs.FileExists("C:\Ushio\etc\version") then
		set f = fs.OpenTextFile("C:\Ushio\etc\version", 1, false)
		getLocalVersion=f.readall
		f.Close()
	end if
end function



