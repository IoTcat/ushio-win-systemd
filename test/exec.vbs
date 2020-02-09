set fs = CreateObject("Scripting.FileSystemObject")
set sh = CreateObject("WScript.Shell")


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

msgbox exec("help")