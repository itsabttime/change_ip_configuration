Set objShell = CreateObject("Shell.Application")
Set FSO = CreateObject("Scripting.FileSystemObject")
strPath = FSO.GetParentFolderName (WScript.ScriptFullName)
'If FSO.FileExists(strPath & "\MAIN.VBS") Then
   '  objShell.ShellExecute "C:\Users\Anil Bapna\Desktop\ustudp.bat", _
  '     Chr(34) & strPath & "" & Chr(34), "", "runas", 1
'MsgBox strPath
extra = "cd " & Chr(34) & strPath & Chr(34) & " & cd" 
MsgBox "/c " & Chr(34) & extra & strPath & "\dhcp.bat'" & Chr(34)
'objShell.ShellExecute "cmd", "/c " & extra & strPath & "\static.bat" & Chr(34), "", "runas"
objShell.ShellExecute "cmd", "/c " & Chr(34) & extra & "& .\static.bat" & Chr(34), "", "runas
'Else
'     MsgBox "Script file MAIN.VBS not found"
'End If