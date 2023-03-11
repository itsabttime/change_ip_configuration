MsgBox "
  (
    	OPTION 1 Static IP Address
	OPTION 2 Dynamic IP Address
  )", "Window Title", "iconi t1"
x := MsgBox("    	PRESS NOW FOR DHCP   ", "Window Title", "iconi t1")
if x = 'OK' 
{ 
RUN A_WorkingDir "\dhcp.bat"
}
x := MsgBox("    	PRESS NOW FOR Static   ", "Window Title", "iconi t1")
if x = 'OK' 
{ 
RUN A_WorkingDir "\static.bat"
}
