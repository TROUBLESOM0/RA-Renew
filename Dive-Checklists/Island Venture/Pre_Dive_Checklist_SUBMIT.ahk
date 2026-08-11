; submit Pre-Dive Checklist in UniSea  (Island Venture Version)
; Pre_Dive_Checklist_SUBMIT v1.0
; Tested on W10, Asus PA248Q, Chrome 150.0.7871.187, UniSea v25.6.10 (54638)
;
; v1.2 release notes - 8/10/2026
; updated for newer Unisea version (see above)
; added title of form to message boxes
; fixed page checking (IfWinActive) to stop error on startup
;
; v1.1 release notes - No Change
; compatibility with Pre-Recovery Post-Dive
;
; v1.0 release notes - 06/22/2026
; added cf worker (see gist)
;
; v.0.2 release notes - No Change
; compatibility with Pre-Recovery Post-Dive
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
InputBox, in_date, Pre-Dive, Date: , , , , , , , 60, %read_date%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_dive, Pre-Dive, Dive: , , , , , , , 60, %read_dive%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_system, Pre-Dive, System Name(UHD-123): , , , , , , , 60, %read_system%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_client, Pre-Dive, Client Name: , , , , , , , 60, %read_client%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_vessel, Pre-Dive, Vessel Name: , , , , , , , 60, %read_vessel%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sup, Pre-Dive, Supervisor Name: , , , , , , , 60, %read_sup%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sr, Pre-Dive, Sr Tech Name: , , , , , , , 60, %read_sr%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_pt, Pre-Dive, PT Name: , , , , , , , 60, %read_pt%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_wave, Pre-Dive, Wave Height: , , , , , , , 60, %read_wave%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curdir, Pre-Dive, Current Direction: , , , , , , , 60, %read_curdir%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curspd, Pre-Dive, Current Speed: , , , , , , , 60, %read_curspd%
if ErrorLevel {
 ExitApp, 0
}
FileAppend, %in_date%`r%in_dive%`r%in_system%`r%in_client%`r%in_vessel%`r%in_sup%`r%in_sr%`r%in_pt%`r%in_wave%`r%in_curdir%`r%in_curspd%, Pre_Dive_Checklist.db
;MsgBox, 0, Appended to file
FileSetAttrib, +H, Pre_Dive_Checklist.db

 querylist()
;MsgBox, 0, End of mkDB
}

; function that creates Pre_Dive_Checklist.db for typed inputs. Also, pulls querylist()
mkDB() {
;MsgBox, 0, Start mkDB
InputBox, in_date, Pre-Dive, Date: , , , , , , , 60, 01/01/2020
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_dive, Pre-Dive, Dive: , , , , , , , 60, 1
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_system, Pre-Dive, System Name(UHD-123): , , , , , , , 60, UHD-123
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_client, Pre-Dive, Client Name: , , , , , , , 60, BP
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_vessel, Pre-Dive, Vessel Name: , , , , , , , 60, Island Venture
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sup, Pre-Dive, Supervisor Name: , , , , , , , 60, I'm Batman
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sr, Pre-Dive, Sr Tech Name: , , , , , , , 60, Wanna-Be Batman
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_pt, Pre-Dive, PT Name: , , , , , , , 60, Not Even Close
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_wave, Pre-Dive, Wave Height: , , , , , , , 60, 60ft or 20m
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curdir, Pre-Dive, Current Direction: , , , , , , , 60, NE or 45
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curspd, Pre-Dive, Current Speed: , , , , , , , 60, 1
if ErrorLevel {
 ExitApp, 0
}
FileAppend, %in_date%`r%in_dive%`r%in_system%`r%in_client%`r%in_vessel%`r%in_sup%`r%in_sr%`r%in_pt%`r%in_wave%`r%in_curdir%`r%in_curspd%, Pre_Dive_Checklist.db
;MsgBox, 0, Appended to file
FileSetAttrib, +H, Pre_Dive_Checklist.db

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
Click, 375, 235    ;form
Sleep, 500
Click, 2050, 470   ;open list ;operations
Sleep, 500
Click, 2050, 510   ;checklist
Sleep, 500
Click, 2050, 550   ;ROV
Sleep, 500
Click, 2050, 810   ;pre-dive
Sleep, 500
Click, 1550, 370   ;title
Sleep, 500
Send, ^a
Sleep, 500
;Send, BS
Sleep, 500
Send, %read_date%
Sleep, 500
Send, {space}         ; Don't think this is right
Sleep, 500
Send, Dive {#}
Sleep, 500
Send, %read_dive%
Sleep, 500
Click, 1800, 630
Sleep, 500
Send, %read_system%
Sleep, 500
Click, 1800, 670
Sleep, 200
Click, 2400, 635
Sleep, 200
Send, %read_vessel%
Sleep, 200
Click, 2400, 665
Sleep, 200
Click, 2400, 675
Sleep, 200
Send, %read_dive%
Sleep, 200
Click, 2400, 710
Sleep, 200
Send, %read_wave%
Sleep, 200
Click, 2400, 745
Sleep, 200
Send, %read_curdir%
Sleep, 200
Click, 1800, 710
Sleep, 200
Send, %read_client%
Sleep, 200
Click, 1800, 745
Sleep, 200
Send, %read_curspd%
Sleep, 200

;Control Console
Click, 1400, 555
Sleep, 310
Click, 2139, 568
Sleep, 200
Click, 2139, 603
Sleep, 200
Click, 2139, 639
Sleep, 200
Click, 2139, 673
Sleep, 200
Click, 2139, 709
Sleep, 200
Click, 2139, 744
Sleep, 200
Click, 2339, 778
Sleep, 200
Click, 2339, 800
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 2139, 855
Sleep, 200

;TMS
Click, 1400, 600
Sleep, 310
Click, 2130, 568
Sleep, 200
Click, 2130, 603
Sleep, 200
Click, 2130, 638
Sleep, 200
Click, 2130, 673
Sleep, 200
Click, 2130, 708
Sleep, 200
Click, 2130, 742
Sleep, 200
Click, 2130, 779
Sleep, 200
Click, 2130, 814
Sleep, 200
Click, 2130, 848
Sleep, 200
Click, 2130, 883
Sleep, 200
Click, 2130, 919
Sleep, 200
Click, 2130, 952
Sleep, 200
;Send, "Not Applicable"
;Sleep, 200
;Click, 2130, 924
;Sleep, 200
Click, 2130, 989
Sleep, 200
Click, 2130, 1023
Sleep, 200

;ROV
Click, 1400, 640
Sleep, 310
Click, 2130, 568
Sleep, 200
Click, 2130, 604
Sleep, 200
Click, 2130, 639
Sleep, 200
Click, 2130, 674
Sleep, 200
Click, 2130, 709
Sleep, 200
Click, 2130, 744
Sleep, 200
Click, 2130, 778
Sleep, 200
Click, 2130, 814
Sleep, 200
Click, 2130, 848
Sleep, 200
Click, 2130, 884
Sleep, 200
Click, 2130, 918
Sleep, 200
Click, 2130, 954
Sleep, 200
Click, 2130, 989
Sleep, 200
Click, 2130, 1024
Sleep, 200

;Handling System
Click, 1400, 680
Sleep, 310
Click, 2330, 567   ;Remove covers
Sleep, 200
Click, 2330, 590
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 2130, 643
Sleep, 200
Click, 2130, 679
Sleep, 200
Click, 2130, 713
Sleep, 200
Click, 2130, 748
Sleep, 200
Click, 2130, 783
Sleep, 200
Click, 2130, 817
Sleep, 200
Click, 2330, 853   ;band brake rod
Sleep, 200
Click, 2330, 888   ;band brake release valve
Sleep, 200
Click, 2330, 906
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 2130, 964
Sleep, 200
Click, 2130, 997
Sleep, 200
Click, 2130, 1033
Sleep, 200
;move to off-page row
Send, {Tab}
Send, {Tab}
Send, {Tab}
Send, {space}
Sleep, 200

;Tooling
Click, 1400, 590
Sleep, 1310
Click, 2140, 570
Sleep, 200
Click, 2140, 605
Sleep, 200
Click, 2140, 640
Sleep, 200
Click, 2140, 675
Sleep, 200
Click, 2140, 710
Sleep, 200

;Survey
Click, 1400, 760
Sleep, 310
Click, 2140, 570
Sleep, 200
Click, 2140, 605
Sleep, 200

;System Specific
Click, 1400, 805
Sleep, 310

;Personnel
Click, 1400, 845
Sleep, 310
Click, 1800, 575
Sleep, 200
Send, %read_sup%
Sleep, 200
Click, 2580, 569
Sleep, 200
Click, 2580, 600
Sleep, 200
Click, 1800, 605
Sleep, 200
Send, %read_sr%
Sleep, 200
Click, 2580, 605
Sleep, 200
Click, 2580, 715
Sleep, 200
Click, 1800, 640
Sleep, 200
Send, %read_pt%
Sleep, 200
Click, 2580, 645
Sleep, 200
Click, 2580, 715
Sleep, 310

;Send Form
Click, 3660, 160
Sleep, 1000

BlockInput Off

}


; BEGIN SCRIPT
;
; alt+p
!p::

WinGetActiveTitle, awin
MsgBox, 48, Active Window is:  "%awin%", Island Venture Widescreen ONLY!!!`nThis completes a LPre-Dive Checklist.`nJust fill out the following parameters.`n`nYou can leave this screen to get info,`n Just ensure to return to Unisea page before continuing this app.
ScriptName := "Pre-Dive-Checklist-IV"
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



;;;; NEW VERSION TO FIX ERROR MESSAGE

Run, http://192.168.60.40/ci/unisea.nsf/#/checklist/views/overview
Sleep, 2000
;;; added above

IfWinActive, Checklist - Google Chrome
{
  WinMaximize
  Sleep, 100
  ;MsgBox Press OK to begin Pre-Dive
}
else IfWinNotActive, Checklist - Google Chrome
{  Run, http://192.168.60.40/ci/unisea.nsf/#/checklist/views/overview
   Sleep, 2000
   MsgBox, 16, Get8Me, Must be in the Checklist Form Area to continue`n`nthis may just a bug...keep trying..., 20
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

