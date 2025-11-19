; submit Pre-Dive Checklist in UniSea
; Pre_Dive_Checklist_SUBMIT v.0.0.1
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
; function to read Pre_Dive_Checklist.db by lines (1,2,3) and place into variables
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
FileReadLine, read_date, Pre_Dive_Checklist.db, 1
FileReadLine, read_dive, Pre_Dive_Checklist.db, 2
FileReadLine, read_system, Pre_Dive_Checklist.db, 3
FileReadLine, read_client, Pre_Dive_Checklist.db, 4
FileReadLine, read_vessel, Pre_Dive_Checklist.db, 5
FileReadLine, read_sup, Pre_Dive_Checklist.db, 6
FileReadLine, read_sr, Pre_Dive_Checklist.db, 7
FileReadLine, read_pt, Pre_Dive_Checklist.db, 8
FileReadLine, read_wave, Pre_Dive_Checklist.db, 9
FileReadLine, read_curdir, Pre_Dive_Checklist.db, 10
FileReadLine, read_curspd, Pre_Dive_Checklist.db, 11
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
FileReadLine, read_date, Pre_Dive_Checklist_OLD.db, 1
FileReadLine, read_dive, Pre_Dive_Checklist_OLD.db, 2
FileReadLine, read_system, Pre_Dive_Checklist_OLD.db, 3
FileReadLine, read_client, Pre_Dive_Checklist_OLD.db, 4
FileReadLine, read_vessel, Pre_Dive_Checklist_OLD.db, 5
FileReadLine, read_sup, Pre_Dive_Checklist_OLD.db, 6
FileReadLine, read_sr, Pre_Dive_Checklist_OLD.db, 7
FileReadLine, read_pt, Pre_Dive_Checklist_OLD.db, 8
FileReadLine, read_wave, Pre_Dive_Checklist_OLD.db, 9
FileReadLine, read_curdir, Pre_Dive_Checklist_OLD.db, 10
FileReadLine, read_curspd, Pre_Dive_Checklist_OLD.db, 11

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
FileAppend, %in_date%`r%in_dive%`r%in_system%`r%in_client%`r%in_vessel%`r%in_sup%`r%in_sr%`r%in_pt%`r%in_wave%`r%in_curdir%`r%in_curspd%, Pre_Dive_Checklist.db
;MsgBox, 0, Appended to file
FileSetAttrib, +H, Pre_Dive_Checklist.db
;MsgBox, 0, Set attribute
;if FileExist("RA_renew.db")   ; not sure if this is even needed?? Or what is actually doing

;ExitApp, 0
 querylist()
;MsgBox, 0, End of mkDB
}

; function that creates Pre_Dive_Checklist.db for typed inputs. Also, pulls querylist()
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
FileAppend, %in_date%`r%in_dive%`r%in_system%`r%in_client%`r%in_vessel%`r%in_sup%`r%in_sr%`r%in_pt%`r%in_wave%`r%in_curdir%`r%in_curspd%, Pre_Dive_Checklist.db
;MsgBox, 0, Appended to file
FileSetAttrib, +H, Pre_Dive_Checklist.db
;MsgBox, 0, Set attribute
;if FileExist("RA_renew.db")   ; not sure if this is even needed?? Or what is actually doing

;ExitApp, 0
 querylist()
;MsgBox, 0, End of mkDB
}


; function to read .db and query user for an action
; pulls getList, Pre_Dive, mkDB
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
;Pre_Dive()
;MsgBox, Pre Dive COmpleted backinquerylist
Return
}
IfMsgBox, No
{
FileMove, Pre_Dive_Checklist.db, Pre_Dive_Checklist_OLD.db
;FileDelete, Pre_Dive_Checklist.db
if ErrorLevel
 MsgBox, Failed to rename file

; calls this function. This may not be right.  ; v.0.3 is calling this function after ra_renew
RENEW_mkDB()
}
}


; MAIN function, may be too long for a function
Pre_Dive() {
;MsgBox, 0, Start pre_dive function

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
Click, 2044, 474
Sleep, 500
Click, 2052, 517
Sleep, 500
Click, 2082, 775
Sleep, 500
Click, 1517, 288   ;title
Sleep, 500
Send, ^a
Sleep, 500
;Send, BS
Sleep, 500
Send, %read_date%
Sleep, 500
Send, {Space}         ; Don't think this is right
Sleep, 500
Send, Dive {#}
Sleep, 500
Send, %read_dive%
Sleep, 500
Click, 1816, 554
Sleep, 500
Send, %read_system%
Sleep, 500
Click, 1802, 593
Sleep, 200
Click, 2439, 555
Sleep, 200
Send, %read_vessel%
Sleep, 200
Click, 2378, 591
Sleep, 200
Click, 2347, 597
Sleep, 200
Send, %read_dive%
Sleep, 200
Click, 2337, 631
Sleep, 200
Send, %read_wave%
Sleep, 200
Click, 2318, 666
Sleep, 200
Send, %read_curdir%
Sleep, 200
Click, 1792, 630
Sleep, 200
Send, %read_client%
Sleep, 200
Click, 1789, 665
Sleep, 200
Send, %read_curspd%
Sleep, 200

;Control Console
Click, 1348, 476
Sleep, 310
Click, 2139, 487
Sleep, 200
Click, 2139, 522
Sleep, 200
Click, 2139, 559
Sleep, 200
Click, 2139, 595
Sleep, 200
Click, 2139, 632
Sleep, 200
Click, 2139, 667
Sleep, 200
Click, 2337, 703
Sleep, 200
Click, 2175, 729
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 2139, 780
Sleep, 200

;TMS
Click, 1298, 518
Sleep, 310
Click, 2131, 488
Sleep, 200
Click, 2131, 524
Sleep, 200
Click, 2131, 559
Sleep, 200
Click, 2131, 596
Sleep, 200
Click, 2131, 631
Sleep, 200
Click, 2131, 669
Sleep, 200
Click, 2131, 703
Sleep, 200
Click, 2131, 739
Sleep, 200
Click, 2131, 776
Sleep, 200
Click, 2131, 812
Sleep, 200
Click, 2331, 848
Sleep, 200
Click, 2166, 871
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 2131, 924
Sleep, 200
Click, 2131, 959
Sleep, 200
Click, 2131, 996
Sleep, 200

;ROV
Click, 1299, 562
Sleep, 310
Click, 2131, 488
Sleep, 200
Click, 2131, 524
Sleep, 200
Click, 2131, 559
Sleep, 200
Click, 2131, 596
Sleep, 200
Click, 2131, 631
Sleep, 200
Click, 2131, 669
Sleep, 200
Click, 2131, 703
Sleep, 200
Click, 2131, 739
Sleep, 200
Click, 2131, 776
Sleep, 200
Click, 2131, 812
Sleep, 200
Click, 2131, 848
Sleep, 200
Click, 2131, 884
Sleep, 200
Click, 2131, 920
Sleep, 200
Click, 2131, 956
Sleep, 200

;Handling System
Click, 1348, 604
Sleep, 310
Click, 2337, 488
Sleep, 200
Click, 2162, 515
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 2131, 563
Sleep, 200
Click, 2131, 599
Sleep, 200
Click, 2131, 636
Sleep, 200
Click, 2131, 671
Sleep, 200
Click, 2131, 708
Sleep, 200
Click, 2131, 743
Sleep, 200
Click, 2330, 779
Sleep, 200
Click, 2330, 815
Sleep, 200
Click, 2179, 838
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 2131, 892
Sleep, 200
Click, 2131, 928
Sleep, 200
Click, 2131, 964
Sleep, 200
Click, 2131, 999
Sleep, 200

;Tooling
Click, 1336, 652
Sleep, 310
Click, 2140, 489
Sleep, 200
Click, 2140, 523
Sleep, 200
Click, 2140, 560
Sleep, 200
Click, 2140, 595
Sleep, 200
Click, 2140, 631
Sleep, 200

;Survey
Click, 1331, 690
Sleep, 310
Click, 2140, 487
Sleep, 200
Click, 2140, 523
Sleep, 200

;System Specific
Click, 1360, 730
Sleep, 310

;Personnel
Click, 1357, 772
Sleep, 310
Click, 1790, 491
Sleep, 200
Send, %read_sup%
Sleep, 200
Click, 2578, 488
Sleep, 200
Click, 2442, 526
Sleep, 200
Click, 1800, 526
Sleep, 200
Send, %read_sr%
Sleep, 200
Click, 2578, 527
Sleep, 200
Click, 2381, 635
Sleep, 200
Click, 1848, 563
Sleep, 200
Send, %read_pt%
Sleep, 200
Click, 2578, 565
Sleep, 200
Click, 2385, 635
Sleep, 310

;Send Form
Click, 3660, 122
Sleep, 1000

BlockInput Off

}


; BEGIN SCRIPT
;
; alt+p
!p::

WinGetActiveTitle, awin
MsgBox, 0, Active Window is:  "%awin%"

IfWinActive, Checklist - Google Chrome
{
  WinMaximize
  MsgBox Press OK to begin Pre-Dive
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
if !FileExist("Pre_Dive_Checklist.db") {
 mkDB()
}

else querylist()

Pre_Dive()

File.Close()

FileDelete, Pre_Dive_Checklist_OLD.db

;MsgBox, 0, Process Complete. User will Submit.	

ExitApp, 0

