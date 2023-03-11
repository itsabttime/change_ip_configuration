Set objShell = CreateObject("Shell.Application")
Set FSO = CreateObject("Scripting.FileSystemObject")
strPath = FSO.GetParentFolderName (WScript.ScriptFullName)
'If FSO.FileExists(strPath & "\MAIN.VBS") Then
   '  objShell.ShellExecute "C:\Users\Anil Bapna\Desktop\ustudp.bat", _
  '     Chr(34) & strPath & "" & Chr(34), "", "runas", 1
'MsgBox strPath
objShell.ShellExecute "cmd", "/c " & Chr(34) & strPath & "\dhcp.bat" & Chr(34), "", "runas"
'Else
'     MsgBox "Script file MAIN.VBS not found"
'End If