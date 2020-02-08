Set sh = WScript.CreateObject("WScript.Shell")
Set http = CreateObject("Msxml2.ServerXMLHTTP")

do while 1
	http.Open "GET","https://www.google.com",0 
	http.send()
	if http.status=200 Then
		msgbox http.responsetext
	end if
	WScript.Sleep 5000
loop