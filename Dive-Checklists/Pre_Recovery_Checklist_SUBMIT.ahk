; submit Pre-Recovery Checklist in UniSea
; Pre_Recovery_Checklist_SUBMIT v.0.0.1
; Tested on W10, Asus PA248Q, Chrome 142.0.7444.60, UniSea v25.2.16 (47933)
;
; v.0.1 release notes - 11/10/2025
; built functions
; added persistent variables

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Sets starting directory to that which code is run.
SetDefaultMouseSpeed, 99
SetMouseDelay, 1000
;
;
;
; START FUNCTIONS
;
;
;
; function to read Post_Dive_Checklist.db by lines (1,2,3) and place into variables
; this is the only function that doesn't pull another function
getList() {
global read_date
global read_dive
global read_system
global read_client
global read_vessel
global read_sup
global read_sr
global read_pt
global read_wave
global read_curdir
global read_curspd
FileReadLine, read_date, Post_Dive_Checklist.db, 1
FileReadLine, read_dive, Post_Dive_Checklist.db, 2
FileReadLine, read_system, Post_Dive_Checklist.db, 3
FileReadLine, read_client, Post_Dive_Checklist.db, 4
FileReadLine, read_vessel, Post_Dive_Checklist.db, 5
FileReadLine, read_sup, Post_Dive_Checklist.db, 6
FileReadLine, read_sr, Post_Dive_Checklist.db, 7
FileReadLine, read_pt, Post_Dive_Checklist.db, 8
FileReadLine, read_wave, Post_Dive_Checklist.db, 9
FileReadLine, read_curdir, Post_Dive_Checklist.db, 10
FileReadLine, read_curspd, Post_Dive_Checklist.db, 11
}


RENEW_mkDB() {

global read_date
global read_dive
global read_system
global read_client
global read_vessel
global read_sup
global read_sr
global read_pt
global read_wave
global read_curdir
global read_curspd
FileReadLine, read_date, Post_Dive_Checklist_OLD.db, 1
FileReadLine, read_dive, Post_Dive_Checklist_OLD.db, 2
FileReadLine, read_system, Post_Dive_Checklist_OLD.db, 3
FileReadLine, read_client, Post_Dive_Checklist_OLD.db, 4
FileReadLine, read_vessel, Post_Dive_Checklist_OLD.db, 5
FileReadLine, read_sup, Post_Dive_Checklist_OLD.db, 6
FileReadLine, read_sr, Post_Dive_Checklist_OLD.db, 7
FileReadLine, read_pt, Post_Dive_Checklist_OLD.db, 8
FileReadLine, read_wave, Post_Dive_Checklist_OLD.db, 9
FileReadLine, read_curdir, Post_Dive_Checklist_OLD.db, 10
FileReadLine, read_curspd, Post_Dive_Checklist_OLD.db, 11

;MsgBox, 0, Start mkDB
InputBox, in_date, Today Date, Date: , , , , , , , 60, %read_date%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_dive, Dive Number, Dive: , , , , , , , 60, %read_dive%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_system, System, System Name(UHD-123): , , , , , , , 60, %read_system%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_client, Client, Client Name: , , , , , , , 60, %read_client%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_vessel, Vessel, Vessel Name: , , , , , , , 60, %read_vessel%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sup, Supervisor, Supervisor Name: , , , , , , , 60, %read_sup%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sr, Sr Technician, Sr Tech Name: , , , , , , , 60, %read_sr%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_pt, Pilot Technician, PT Name: , , , , , , , 60, %read_pt%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_wave, Waves, Wave Height: , , , , , , , 60, %read_wave%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curdir, Current Direction, Current Direction: , , , , , , , 60, %read_curdir%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curspd, Current Speed, Current Speed: , , , , , , , 60, %read_curspd%
if ErrorLevel {
 ExitApp, 0
}
FileAppend, %in_date%`r%in_dive%`r%in_system%`r%in_client%`r%in_vessel%`r%in_sup%`r%in_sr%`r%in_pt%`r%in_wave%`r%in_curdir%`r%in_curspd%, Post_Dive_Checklist.db
;MsgBox, 0, Appended to file
FileSetAttrib, +H, Post_Dive_Checklist.db
;MsgBox, 0, Set attribute
;if FileExist("RA_renew.db")   ; not sure if this is even needed?? Or what is actually doing

;ExitApp, 0
 querylist()
;MsgBox, 0, End of mkDB
}


; function that creates Post_Dive_Checklist.db for typed inputs. Also, pulls querylist()
mkDB() {
;MsgBox, 0, Start mkDB
InputBox, in_date, Today Date, Date: , , , , , , , 60, 01/01/2020
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_dive, Dive Number, Dive: , , , , , , , 60, 1
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_system, System, System Name(UHD-123): , , , , , , , 60, UHD-123
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_client, Client, Client Name: , , , , , , , 60, BP
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_vessel, Vessel, Vessel Name: , , , , , , , 60, Island Venture
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sup, Supervisor, Supervisor Name: , , , , , , , 60, I'm Batman
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sr, Sr Technician, Sr Tech Name: , , , , , , , 60, Wanna-Be Batman
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_pt, Pilot Technician, PT Name: , , , , , , , 60, Not Even Close
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_wave, Waves, Wave Height: , , , , , , , 60, 60ft or 20m
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curdir, Current Direction, Current Direction: , , , , , , , 60, NE or 45
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curspd, Current Speed, Current Speed: , , , , , , , 60, 1
if ErrorLevel {
 ExitApp, 0
}
FileAppend, %in_date%`r%in_dive%`r%in_system%`r%in_client%`r%in_vessel%`r%in_sup%`r%in_sr%`r%in_pt%`r%in_wave%`r%in_curdir%`r%in_curspd%, Post_Dive_Checklist.db
;MsgBox, 0, Appended to file
FileSetAttrib, +H, Post_Dive_Checklist.db
;MsgBox, 0, Set attribute
;if FileExist("RA_renew.db")   ; not sure if this is even needed?? Or what is actually doing

;ExitApp, 0
 querylist()
;MsgBox, 0, End of mkDB
}


; function to read .db and query user for an action
; pulls getList, Post_Dive, mkDB
querylist() {
;MsgBox, 0, Start querylist
global read_date
global read_dive
global read_system
global read_client
global read_vessel
global read_sup
global read_sr
global read_pt
global read_wave
global read_curdir
global read_curspd
;MsgBox, 0, Start getList inside querylist
getList()
MsgBox, 4, Data To Write, Date: %read_date%`n`nDive #: %read_dive%`n`nSystem: %read_system%`n`nClient: %read_client%`n`nVessel: %read_vessel%`n`nSupervisor: %read_sup%`n`nSrTech: %read_sr%`n`nPT: %read_pt%`n`nWaves: %read_wave%`n`nCurrent direction: %read_curdir%`n`nCurrent speed: %read_curspd%
IfMsgBox, Yes
{
; removed to run RA_renew; Return  ; need to revisit this RETURN
;Post_Dive()
;MsgBox, Post Dive COmpleted backinquerylist
Return
}
IfMsgBox, No
{
FileMove, Post_Dive_Checklist.db, Post_Dive_Checklist_OLD.db
;FileDelete, Post_Dive_Checklist.db
if ErrorLevel
 MsgBox, Failed to rename file

; calls this function. This may not be right.  ; v.0.3 is calling this function after ra_renew
RENEW_mkDB()
}
}


; MAIN function, may be too long for a function
Pre_Recover() {
;MsgBox, 0, Start post_dive function

global read_date
global read_dive
global read_system
global read_client
global read_vessel
global read_sup
global read_sr
global read_pt
global read_wave
global read_curdir
global read_curspd

BlockInput On

;MsgBox, 0, ran global and block

SetDefaultMouseSpeed, 80
SetMouseDelay, 1000

;Start Form
Click, 387, 198    ;form
Sleep, 500
Click, 2033, 435   ;open list
Sleep, 500
Click, 2044, 478
Sleep, 500
Click, 2055, 515
Sleep, 500
Click, 2229, 841   ;start prerecovery
Sleep, 500
Click, 1566, 287   ;title
Sleep, 500
Send, ^a
Sleep, 500
Send, %read_date%
Sleep, 500
Send, {space}
Sleep, 500
Send, Dive {#}
Sleep, 500
Send, %read_dive%
Sleep, 200
Click, 1869, 555    ;system
Sleep, 200
Send, %read_system%
Sleep, 200
Click, 1843, 590
Sleep, 200
Click, 2374, 558    ;vessel
Sleep, 200
Send, %read_vessel%
Sleep, 200
Click, 2388, 594
Sleep, 200
Click, 2355, 595     ;dive
Sleep, 200
Send, %read_dive%
Sleep, 200
Click, 2352, 630     ;wave
Sleep, 200
Send, %read_wave%
Sleep, 200
Click, 2344, 668     ;cur-dir
Sleep, 200
Send, %read_curdir%
Sleep, 200
Click, 1817, 630     ;client
Sleep, 200
Send, %read_client%
Sleep, 200
Click, 1783, 665     ;cur-spd
Sleep, 200
Send, %read_curspd%

;ROV
Sleep, 310
Click, 1406, 472
Sleep, 200
Click, 2139, 489
Sleep, 200
Click, 2139, 524
Sleep, 200
Click, 2139, 559

;TMS
Sleep, 310
Click, 1366, 514
Sleep, 200
Click, 2139, 486
Sleep, 200
Click, 2139, 524

;Handling System
Sleep, 310
Click, 1380, 563
Sleep, 200
Click, 2370, 487
Sleep, 200
Click, 2140, 524
Sleep, 200
Click, 2140, 560
Sleep, 200
Click, 2140, 596
Sleep, 200
Click, 2140, 633
Sleep, 200
Click, 2140, 669
Sleep, 200
Click, 2140, 704
Sleep, 200
Click, 2140, 740
Sleep, 200
Click, 2140, 776
Sleep, 200
Click, 2140, 811

;Tooling
Sleep, 310
Click, 1353, 606
Sleep, 200
Click, 2140, 487
Sleep, 200
Click, 2140, 524

;Survey
Sleep, 310
Click, 1373, 649
Sleep, 200
Click, 2140, 488

;Personnel
Sleep, 310
Click, 1376, 728
Sleep, 200
Click, 1790, 488    ;super
Sleep, 200
Send, %read_sup%
Sleep, 200
Click, 2581, 489
Sleep, 200
Click, 2403, 524
Sleep, 200
Click, 1811, 527    ;srtech
Sleep, 200
Send, %read_sr%
Sleep, 200
Click, 2577, 526
Sleep, 200
Click, 2378, 635
Sleep, 200
Click, 1818, 564     ;pt
Sleep, 200
Send, %read_pt%
Sleep, 200
Click, 2578, 565
Sleep, 200
Click, 2392, 635


;Submit
;Sleep, 200
;Click, 3661, 122

BlockInput Off

}


; BEGIN SCRIPT
;
; alt+p
!p::

WinGetActiveTitle, awin
MsgBox, 0, Active Window is:  "%awin%"

Run, http://192.168.60.40/ci/unisea.nsf/#/checklist/views/overview
Sleep, 2000
IfWinActive, Checklist - Google Chrome
{
  WinMaximize
  Sleep, 100
}
else IfWinNotActive, Checklist - Google Chrome
{  Run, http://192.168.60.40/ci/unisea.nsf/#/checklist/views/overview
   Sleep, 2000
   MsgBox, 16, Get8Me, Must be in the Checklist Form Area to continue, 20
}
IfWinActive, Checklist - Google Chrome
{
  WinMaximize
}

;CoordMode, Mouse, Screen  ;does nothing

; trying to get rid of File Failed to Delete Error
if !FileExist("Post_Dive_Checklist.db") {
 mkDB()
}

else querylist()

Pre_Recover()

File.Close()

FileDelete, Post_Dive_Checklist_OLD.db

MsgBox, 0, Process Complete. User will submit.
ExitApp, 0