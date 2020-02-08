rem var %command% in, %res% out
for /F "delims=" %%i in ('%command%') do ( set res=%%i)