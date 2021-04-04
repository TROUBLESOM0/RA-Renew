; update RA names just to Renew & Approve

!r::

WinGetActiveTitle, awin
if awin != Risk - Google Chrome
{
MsgBox, 0, Active Window is:  "%awin%"`r`n The ""ACTIVE"" Window needs to be opened to the Risk Assessment you intend to renew
}

if IfWinActive, Risk - Google Chrome
{
	WinMaximize
	MsgBox Press OK to begin the process
}
else
{	WinWait, Risk - Google Chrome, , 60
	MsgBox, 16, Get8Me, Must be in the RA form to continue, 20
	return
}
	
;CoordMode, Mouse, Screen


if FileExist("RA_renew.db")
{ 
File := FileOpen("RA_renew.db", r)
FileReadLine, read_sup, RA_renew.db, 1
FileReadLine, read_sr, RA_renew.db, 2
FileReadLine, read_pt, RA_renew.db, 3

MsgBox, 4, Would you like to use this crew?, `nSupervisor: %read_sup%`n`nSr. Tech: %read_sr%`n`nPT: %read_pt%

IfMsgBox, Yes  ;run RA_Renew
{	
BlockInput On

;SetMouseDelay, 3000
Click, 1646, 131 ;copy RA
Sleep, 2500
;MouseClick, Left

Click, 1434, 322
Sleep, 50

; add Supervisor
Click, 998, 385
Sleep, 50
Send, %read_sup%
Sleep, 50
Click, 1247, 390
Sleep, 50
Click, 1177, 466
Sleep, 50
Click, 1284, 390
Sleep, 50
Send, Supervisor
Sleep, 50
Click, 1456, 390
Sleep, 50
Send, CI

Sleep, 50
Click, 1434, 322
Sleep, 50

; next Attendee
Click, 998, 430
Sleep, 50
Send, %read_sr%
Sleep, 50
Click, 1247, 430
Sleep, 50
Click, 1247, 466
Sleep, 50
Click, 1284, 430
Sleep, 50
Send, Sr. Tech
Sleep, 50
Click, 1456, 430
Sleep, 50
Send, CI

Sleep, 50
Click, 1434, 322
Sleep, 50

Click, 998, 470
Sleep, 50
Send, %read_pt%
Sleep, 50
Click, 1247, 470
Sleep, 50
Click, 1247, 500
Sleep, 50
Click, 1284, 470
Sleep, 50
Send, Tech
Sleep, 50
Click, 1456, 470
Sleep, 50
Send, CI
Sleep, 50

; "APPROVE" button
MouseMove, 1730,140, 10
Sleep, 5
;Click
Sleep, 50
 
BlockInput Off
}

   
IfMsgBox, No
{
	InputBox, in_sup, Personnel Names, Supervisor: , , , , , , , 30, Supervisor
	InputBox, in_sr, Personnel Names, Sr. Technician: , , , , , , , 30, Sr. Tech
	InputBox, in_pt, Personnel Names, Pilot Technician: , , , , , , , 30, PT
	MsgBox, Parameters created with: `nSupervisor:  %in_sup% `n`nSr. Tech:  %in_sr% `n`nPT:  %in_pt%`n`nPlease Run Again
}
File.Close()
}
else
{
InputBox, in_sup, Personnel Names, Supervisor: , , , , , , , 30, Supervisor
InputBox, in_sr, Personnel Names, Sr. Technician: , , , , , , , 30, Sr. Tech
InputBox, in_pt, Personnel Names, Pilot Technician: , , , , , , , 30, PT
MsgBox, Parameters created with: `nSupervisor:  %in_sup% `n`nSr. Tech:  %in_sr% `n`nPT:  %in_pt%`n`nPlease Run Again
}
FileAppend, %in_sup%`r%in_sr%`r%in_pt%, RA_renew.db
FileSetAttrib, +RH, RA_renew.db


 
MsgBox, 0, Process Complete.	
ExitApp, 0
