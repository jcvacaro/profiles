NumpadAdd::
F1::
if GetKeyState("LButton", "T") {
	Click, down
} else {
	Click, up
	clipboard =
	Send, {RButton}
	Sleep, 250
	Send, {Down}
	Send, {Enter}
	ClipWait, 2
	MsgBox % clipboard
}
return

F3::
Send, #{ESC}
Run, snippingtool
WinWaitActive, Snipping Tool, , 2
if ErrorLevel {
	return
}
Send, ^n
Sleep, 500
Send, #{NumpadAdd}
return

+F3::
SetWorkingDir, C:\Users\vacaro\Pictures

FileDelete, t1.tiff
Send, ^s
WinWaitActive, Save As, , 2
if ErrorLevel {
	return
}
Send, t1.tiff
Send, {Enter}
Sleep, 1000
Send, !{F4}

FileDelete, t1.txt
Run, C:\Program Files (x86)\Tesseract-OCR\tesseract t1.tiff t1 --oem 1 -l eng
clipboard = ; Empty the clipboard
Loop, 3 {
	FileRead, clipboard, t1.txt
	ClipWait, 2
	if not ErrorLevel {
		MsgBox % clipboard
		return
	}
}
return
