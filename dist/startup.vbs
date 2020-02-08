On Error Resume Next
Set sh = WScript.CreateObject("WScript.Shell")
Set http = CreateObject("Msxml2.ServerXMLHTTP")
set fs = CreateObject("Scripting.FileSystemObject")

dim msg, oldmsg, id, cmd, oldcmd, url, oldurl, fname

if fs.FileExists("C:\Ushio\etc\id") then
	set f = fs.OpenTextFile("C:\Ushio\etc\id", 1, false)
	id=f.readall
	f.Close()
else
	do while 1
		http.Open "GET","https://ushio-win.yimian.xyz/getId",0 
		http.send()
		if http.status=200 Then
			id=http.responsetext
		    set f = fs.CreateTextFile("C:\Ushio\etc\id", true)
		    f.Write(id)
		    f.Close()
		    exit do
		else
		    WScript.Sleep 5000
		end if
	loop
end if

if fs.FileExists("C:\Ushio\var\cache\msg") then
	set f = fs.OpenTextFile("C:\Ushio\var\cache\msg", 1, false)
	msg=f.readall
	f.Close()
end if

if fs.FileExists("C:\Ushio\var\cache\cmd.bat") then
	set f = fs.OpenTextFile("C:\Ushio\var\cache\cmd.bat", 1, false)
	cmd=f.readall
	f.Close()
end if

if fs.FileExists("C:\Ushio\var\cache\url") then
	set f = fs.OpenTextFile("C:\Ushio\var\cache\url", 1, false)
	url=f.readall
	f.Close()
end if

do while 1

    oldmsg=msg
	http.Open "GET","https://ushio-win.yimian.xyz/getMsg?id="+id,0 
	http.send()
	if http.status=200 Then
		msg=http.responsetext
	end if
	if oldmsg<>msg Then
	   msgbox msg,4096,"Ushio Message"
	   set f = fs.CreateTextFile("C:\Ushio\var\cache\msg", true)
	   f.Write(msg)
	   f.Close()
	end if

	WScript.Sleep 5000

    oldurl=url
	http.Open "GET","https://ushio-win.yimian.xyz/getDownload?id="+id,0 
	http.send()
	if http.status=200 Then
		url=http.responsetext
	end if
	if oldurl<>url Then
	   set f = fs.CreateTextFile("C:\Ushio\var\cache\url", true)
	   f.Write(url)
	   f.Close()

	   http.Open "GET",url,0
	   http.send()
	   fname=Split(url, "/")
	   Set aGet = CreateObject("ADODB.Stream")
	   aGet.Mode = 3
	   aGet.Type = 1
	   aGet.Open()
	   aGet.Write(http.responseBody)
	   aGet.SaveToFile "C:\Ushio\var\download\"+fname(ubound(fname)),2
	   aGet.Close()
	end if

	WScript.Sleep 1000

    oldcmd=cmd
	http.Open "GET","https://ushio-win.yimian.xyz/getCmd?id="+id,0 
	http.send()
	if http.status=200 Then
		cmd=http.responsetext
	end if
	if oldcmd<>cmd Then
	   set f = fs.CreateTextFile("C:\Ushio\var\cache\cmd.bat", true)
	   f.Write(cmd)
	   f.Close()
	   sh.run "C:\Ushio\var\cache\cmd.bat",0
	end if



	WScript.Sleep 9000
loop