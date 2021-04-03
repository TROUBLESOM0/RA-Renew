﻿; update RA names just to Renew & Approve
; RA_renew v.0.3
; Tested on W10, Asus PA248Q, Chrome 89.0.4389.90, UniSea v21.1.4
;
; v.0.3 release notes - x/xx/xx
; built functions
; removed read-only attribute
; removed RA_renew from querylist
;
; v.0.2 release notes - created 3/30/21
; speed increased
; auto open RA in web browser if not open
; changed queryList to querylist

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Sets starting directory to that which code is run.
;
;
;
; START FUNCTIONS
;
;
;
; function to read RA_renew.db by lines (1,2,3) and place into variables
; this is the only function that doesn't pull another function
getList() {
global read_sup
global read_sr
global read_pt
FileReadLine, read_sup, RA_renew.db, 1
FileReadLine, read_sr, RA_renew.db, 2
FileReadLine, read_pt, RA_renew.db, 3
}


; function that creates RA_renew.db for crew names. Also, pulls querylist()
mkDB() {
;MsgBox, 0, Start mkDB
InputBox, in_sup, Personnel Names, Supervisor: , , , , , , , 30, Supervisor
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sr, Personnel Names, Sr. Technician: , , , , , , , 30, Sr. Tech
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_pt, Personnel Names, Pilot Technician: , , , , , , , 30, PT
if ErrorLevel {
 ExitApp, 0
}
FileAppend, %in_sup%`r%in_sr%`r%in_pt%, RA_renew.db
FileSetAttrib, +H, RA_renew.db
;if FileExist("RA_renew.db")   ; not sure if this is even needed?? Or what is actually doing
 querylist()
;MsgBox, 0, End of mkDB
}


; function to read .db and query user for an action
; pulls getList, RA_renew, mkDB
querylist() {
; MsgBox, 0, Start querylist
global read_sup
global read_sr
global read_pt
; MsgBox, 0, Start getList inside querylist
getList()
MsgBox, 4, Do you want to use this list?, Supervisor: %read_sup%`n`nSr.Tech: %read_sr%`n`nPT: %read_pt%
 IfMsgBox, Yes
; removed to run RA_renew; Return  ; need to revisit this RETURN
;RA_renew()
Return
 IfMsgBox, No
FileDelete, RA_renew.db
if ErrorLevel {
 MsgBox, Failed to delete file
}
; calls this function. This may not be right.  ; v.0.3 is calling this function after ra_renew
mkDB()
}


; MAIN function, may be too long for a function
RA_renew() {

global read_sup
global read_sr
global read_pt
	
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
Return  ; this stopped loop on mkDB after RA_renew
}
;
;
;
; END FUNCTIONS
;
;
;
; look into getting rid of this for more streamlining
!r::

; this begins the mouse/clicks, this needs alot of work

WinGetActiveTitle, win1
MsgBox, 0, Active Window is:  "%win1%"

IfWinActive, Risk - Google Chrome
{
	WinMaximize  ; this has an error that chrome must be at 100%
	MsgBox Press OK to begin the process
}
else IfWinNotActive, Risk - Google Chrome
{	Run, chrome.exe http://unisea.chouest.com/ci/unisea.nsf/#/risk/risk-assessment/my-location
	Sleep, 2000
	MsgBox, 16, Get8Me, YOUR MUST FIRST OPEN THE RISK ASSESSMENT FORM YOU WISH TO RENEW, 20
}
	
;CoordMode, Mouse, Screen  ;why is this here?

; trying to get rid of File Failed to Delete Error
if !FileExist("RA_renew.db") {
 mkDB()
}

else querylist()

RA_renew()

File.Close()
 
MsgBox, 0, Process Complete.	
ExitApp, 0