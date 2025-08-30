Set args = WScript.Arguments
' Build command line with quoted script path and all passed files
scriptPath = "C:\heic2jpg\convert_to_jpg.cmd"
cmd = "\"" & scriptPath & "\""
For i = 0 To args.Count - 1
  cmd = cmd & " """ & args(i) & """"
Next
' 0 = hide window
CreateObject("Wscript.Shell").Run cmd, 0, False
