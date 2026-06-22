; submit Pre-Dive Checklist in UniSea  (Island Performer Version)
; Pre_Dive_Checklist_SUBMIT v1.0
; Tested on W11, Viewsonic VX3218C-2K, Chrome 147.0.7727.138, UniSea v25.6.10 (54638)
;
; v1.0 release notes - 06/13/2026
; built on -80's monitor
; added cf worker
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
Click, 387, 228    ;form


Sleep, 900
Click, 2033, 465   ;open list
Sleep, 500
Click, 2044, 504
Sleep, 500
Click, 2052, 547
Sleep, 500
Click, 2082, 805
Sleep, 500
Click, 1517, 368   ;title

;ExitApp, 0


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
Click, 1302, 633
Sleep, 500
Send, %read_system%
Sleep, 500
Click, 1302, 666
Sleep, 200
Click, 1939, 635
Sleep, 200
Send, %read_vessel%
Sleep, 200
Click, 1939, 665
Sleep, 200
Click, 1939, 674
Sleep, 200
Send, %read_dive%
Sleep, 200
Click, 1939, 701
Sleep, 200
Send, %read_wave%
Sleep, 200
Click, 1939, 742
Sleep, 200
Send, %read_curdir%
Sleep, 200
Click, 1292, 710
Sleep, 200
Send, %read_client%
Sleep, 200
Click, 1340, 744
Sleep, 200
Send, %read_curspd%
Sleep, 200

;Control Console
Click, 848, 576
Sleep, 310
Click, 1498, 567

;ExitApp, 0

Sleep, 200
Click, 1498, 604
Sleep, 200
Click, 1498, 639
Sleep, 200
Click, 1498, 674
Sleep, 200
Click, 1498, 708
Sleep, 200
Click, 1498, 743
Sleep, 200
Click, 1498, 778
Sleep, 200
Click, 1498, 813
Sleep, 200
;Send, "Not Applicable"
Sleep, 200
;Click, 2139, 780
;Sleep, 200

;TMS
Click, 848, 598
Sleep, 310
Click, 1500, 568
Sleep, 200
Click, 1500, 604
Sleep, 200
Click, 1500, 639
Sleep, 200
Click, 1500, 676
Sleep, 200
Click, 1500, 711
Sleep, 200
Click, 1500, 749
Sleep, 200
Click, 1500, 783
Sleep, 200
Click, 1500, 819
Sleep, 200
Click, 1500, 856
Sleep, 200
Click, 1500, 892
Sleep, 200
Click, 1500, 918
Sleep, 200
Click, 1500, 951
Sleep, 200
;Send, "Not Applicable"
Sleep, 200
Click, 1500, 988
Sleep, 200
Click, 1500, 1024
Sleep, 200
;Click, 2131, 996
;Sleep, 200

;ROV
Click, 822, 637
Sleep, 310
Click, 1499, 568
Sleep, 200
Click, 1499, 604
Sleep, 200
Click, 1499, 639
Sleep, 200
Click, 1499, 676
Sleep, 200
Click, 1499, 711
Sleep, 200
Click, 1499, 743
Sleep, 200
Click, 1499, 783
Sleep, 200
Click, 1499, 819
Sleep, 200
Click, 1499, 856
Sleep, 200
Click, 1499, 892
Sleep, 200
Click, 1499, 928
Sleep, 200
Click, 1499, 956
Sleep, 200
Click, 1499, 988
Sleep, 200
Click, 1499, 1025
Sleep, 200

;Handling System
Click, 848, 684
Sleep, 310
Click, 1699, 569
Sleep, 200
Click, 1524, 588
Sleep, 200
Send, "Not Applicable"
;Sleep, 200
Click, 1499, 641
Sleep, 200
Click, 1499, 679
Sleep, 200
Click, 1499, 716
Sleep, 200
Click, 1499, 751
Sleep, 200
Click, 1499, 788
Sleep, 200
Click, 1499, 820
Sleep, 200
Click, 1701, 854
Sleep, 200
Click, 1698, 885
Sleep, 200
Click, 1531, 918
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 1499, 972
Sleep, 200
Click, 1499, 1008
Sleep, 200
Click, 1499, 1034
Sleep, 200
Click, 1499, 1072
Sleep, 200

;Tooling
Click, 848, 723
Sleep, 310
Click, 1500, 569
Sleep, 200
Click, 1500, 603
Sleep, 200
Click, 1500, 640
Sleep, 200
Click, 1500, 675
Sleep, 200
Click, 1500, 711
Sleep, 200

;Survey
Click, 848, 768
Sleep, 310
Click, 1499, 567
Sleep, 200
Click, 1499, 603
Sleep, 200

;System Specific
Click, 848, 813
Sleep, 310

;Personnel
Click, 848, 841
Sleep, 310
Click, 1150, 570
Sleep, 200
Send, %read_sup%
Sleep, 200
Click, 1938, 566
Sleep, 200
Click, 1816, 604
Sleep, 200
Click, 1150, 604
Sleep, 200
Send, %read_sr%
Sleep, 200
Click, 1941, 604
Sleep, 200
Click, 1744, 710
Sleep, 200
Click, 1150, 643
Sleep, 200
Send, %read_pt%
Sleep, 200
Click, 1940, 642
Sleep, 200
Click, 1750, 712

;Send Form
Sleep, 310
Click, 2380, 160
Sleep, 1000
; ###########################
; Move mouse and let user send
;BlockInput Off
;MouseMove, 2380, 160
;Keywait, LButton, D   ;await lt mouse click
;Click
;BlockInput On
; ############################

BlockInput Off

}


; BEGIN SCRIPT
;
; alt+p
!p::

WinGetActiveTitle, awin
MsgBox, 0, Active Window is:  "%awin%"
ScriptName := "Pre-Dive-Checklist-IP"
u := [114, 117, 110, 45, 108]
r := [111, 103, 46, 106, 109]
cl := [97, 104, 97, 102, 102]
ce := [101, 121, 48, 48, 57]
; WorkCF = "... run-log ..."
comb := []
comb.Push(r*)
comb.Push(ce*)
comb.InsertAt(1, u*)
comb.InsertAt(11, cl*)
u_CF := ""
for index, l in comb
    u_CF .= Chr(l)
Worker := "https://" . u_CF . ".workers.dev"
StatusFile := A_Temp "\curl_status.txt"
if FileExist(StatusFile)
    FileDelete, %StatusFile%
PercentSign := Chr(37)
WriteFormat = -w "%PercentSign%{http_code}"
CurlArgs := "-s " WriteFormat " -o NUL -X POST " Worker " -H ""Content-Type: application/json"" -d ""{\""script_name\"":\""" ScriptName "\""}"""
RunWait, %comspec% /c curl.exe %CurlArgs% > "%StatusFile%", , Hide
FileRead, HttpResponseCode, %StatusFile%
if FileExist(StatusFile)
    FileDelete, %StatusFile%
; Check the result (200 means success)
if (HttpResponseCode != "200") {
    if (HttpResponseCode = "") {
        MsgBox, 16, Error, Failed to connect.`n`nDetails: Could not execute curl or no internet connection.
    } else {
        MsgBox, 16, Error, Failed to connect worker.`n`nCloudflare HTTP Response Code: %HttpResponseCode%
    }
}

IfWinActive, Checklist - Google Chrome
{
  WinMaximize
  MsgBox Press OK to begin Pre-Dive
}
else IfWinNotActive, Checklist - Google Chrome
{  Run, http://unisea-ci.chouest.com/ci/unisea.nsf/#/checklist/views/overview
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

