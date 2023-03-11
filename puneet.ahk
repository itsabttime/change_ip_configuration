MsgBox "
  (
    	OPTION 1 Static IP Address
	OPTION 2 Dynamic IP Address
  )", "Window Title", "iconi t1"
x := MsgBox("    	PRESS NOW FOR DHCP   ", "Window Title", "iconi t1")
if x = 'OK' 
{ 
Run A_ComSpec ' /c "C:\Users\Anil Bapna\Desktop\New Folder\dhcp.bat"'
}
x := MsgBox("    	PRESS NOW FOR Static   ", "Window Title", "iconi t1")
if x = 'OK' 
{ 
Run A_ComSpec ' /c "C:\Users\Anil Bapna\Desktop\New Folder\static.bat"'
}