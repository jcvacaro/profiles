!NumpadClear::WheelUp
!NumpadDown::WheelDown
NumpadClear::^!Up
NumpadDown::^!Down
NumpadEnd::^!Left
NumpadPgDn::^!Right
NumpadLeft::LButton
NumpadRight::RButton

NumpadHome::
if not GetKeyState("LButton") {
	Click, Down
} else {
	Click, Up
	clipboard =
	Send, ^c
	ClipWait, 2
	MsgBox % clipboard
}
return

NumpadUp::
Click, Down 3
Click, Up
clipboard =
Send, ^c
ClipWait, 2
MsgBox % clipboard
return

NumpadPgUp::
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

!NumpadPgUp::
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
