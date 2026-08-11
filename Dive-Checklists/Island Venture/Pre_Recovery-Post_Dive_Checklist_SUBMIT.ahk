; submit Pre-Recovery Checklist in UniSea  (Island Venture Version)
; Pre_Recovery_Checklist_SUBMIT v.0.0.1
; Tested on W10, Asus PA248Q, Chrome 150.0.7871.187, UniSea v25.6.10 (54638)
;
; v.1.2 release notes - 08/04/2026
; updated for newer Unisea version (see above)
;
; v.1.1 release notes - 06/22/2026
; added cf worker (see gist)
;
; v.1.0 release notes - 11/18/2025 (Pre_Recovery-Post_Dive_Checklist_SUBMIT.ahk)
; added integration of Pre-Recovery and Post-Dive.
; Pre-Recovery will run first. Then, new window will open and Post-Dive will complete.
; Added automatic submitting.
;
; v.0.2 release notes - 11/15/2025 (Post_Dive_Checklist_SUBMIT.ahk)
; removed integration with Pre-Recovery. (transition issues)
; added persistent variables.
;
; v.0.1 release notes - 11/10/2025 (Post_Dive_Checklist_SUBMIT.ahk)
; built functions.
; added integration with Pre-Recovery.
;
; v.0.1 release notes - 11/10/2025 (Pre_Recovery_Checklist_SUBMIT.ahk)
; built functions.
; added persistent variables.

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

;Start mkDB
InputBox, in_date, Pre-Recovery & Post-Dive, Date: , , , , , , , 60, %read_date%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_dive, Pre-Recovery & Post-Dive, Dive: , , , , , , , 60, %read_dive%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_system, Pre-Recovery & Post-Dive, System Name(UHD-123): , , , , , , , 60, %read_system%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_client, Pre-Recovery & Post-Dive, Client Name: , , , , , , , 60, %read_client%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_vessel, Pre-Recovery & Post-Dive, Vessel Name: , , , , , , , 60, %read_vessel%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sup, Pre-Recovery & Post-Dive, Supervisor Name: , , , , , , , 60, %read_sup%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sr, Pre-Recovery & Post-Dive, Sr Tech Name: , , , , , , , 60, %read_sr%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_pt, Pre-Recovery & Post-Dive, PT Name: , , , , , , , 60, %read_pt%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_wave, Pre-Recovery & Post-Dive, Wave Height: , , , , , , , 60, %read_wave%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curdir, Pre-Recovery & Post-Dive, Current Direction: , , , , , , , 60, %read_curdir%
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curspd, Pre-Recovery & Post-Dive, Current Speed: , , , , , , , 60, %read_curspd%
if ErrorLevel {
 ExitApp, 0
}
FileAppend, %in_date%`r%in_dive%`r%in_system%`r%in_client%`r%in_vessel%`r%in_sup%`r%in_sr%`r%in_pt%`r%in_wave%`r%in_curdir%`r%in_curspd%, Post_Dive_Checklist.db
FileSetAttrib, +H, Post_Dive_Checklist.db

;ExitApp, 0
 querylist()
;MsgBox, 0, End of mkDB
}


; function that creates Post_Dive_Checklist.db for typed inputs. Also, pulls querylist()
mkDB() {
;Start mkDB
InputBox, in_date, Pre-Recovery/Post-Dive, Date: , , , , , , , 60, 01/01/2020
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_dive, Pre-Recovery & Post-Dive, Dive: , , , , , , , 60, 1
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_system, Pre-Recovery & Post-Dive, System Name(UHD-123): , , , , , , , 60, UHD-123
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_client, Pre-Recovery & Post-Dive, Client Name: , , , , , , , 60, BP
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_vessel, Pre-Recovery & Post-Dive, Vessel Name: , , , , , , , 60, Island Venture
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sup, Pre-Recovery & Post-Dive, Supervisor Name: , , , , , , , 60, I'm Batman
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_sr, Pre-Recovery & Post-Dive, Sr Tech Name: , , , , , , , 60, Wanna-Be Batman
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_pt, Pre-Recovery & Post-Dive, PT Name: , , , , , , , 60, Not Even Close
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_wave, Pre-Recovery & Post-Dive, Wave Height: , , , , , , , 60, 60ft or 20m
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curdir, Pre-Recovery & Post-Dive, Current Direction: , , , , , , , 60, NE or 45
if ErrorLevel {
 ExitApp, 0
}
InputBox, in_curspd, Pre-Recovery & Post-Dive, Current Speed: , , , , , , , 60, 1
if ErrorLevel {
 ExitApp, 0
}
FileAppend, %in_date%`r%in_dive%`r%in_system%`r%in_client%`r%in_vessel%`r%in_sup%`r%in_sr%`r%in_pt%`r%in_wave%`r%in_curdir%`r%in_curspd%, Post_Dive_Checklist.db
FileSetAttrib, +H, Post_Dive_Checklist.db

 querylist()

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

getList()

MsgBox, 4, Data To Write, Date: %read_date%`n`nDive #: %read_dive%`n`nSystem: %read_system%`n`nClient: %read_client%`n`nVessel: %read_vessel%`n`nSupervisor: %read_sup%`n`nSrTech: %read_sr%`n`nPT: %read_pt%`n`nWaves: %read_wave%`n`nCurrent direction: %read_curdir%`n`nCurrent speed: %read_curspd%
IfMsgBox, Yes
{
Return
}
IfMsgBox, No
{
FileMove, Post_Dive_Checklist.db, Post_Dive_Checklist_OLD.db
if ErrorLevel
 MsgBox, Failed to rename file


RENEW_mkDB()
}
}


; Prerecovery function
Pre_Recover() {

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

SetDefaultMouseSpeed, 80
SetMouseDelay, 1000

;Start Form
Click, 387, 228    ;form
Sleep, 500
Click, 2033, 465   ;open list
Sleep, 500
Click, 2044, 508
Sleep, 500
Click, 2055, 545
Sleep, 500
Click, 2229, 871   ;start prerecovery
Sleep, 500
Click, 1520, 373   ;title
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
Click, 1800, 630    ;system
Sleep, 200
Send, %read_system%
Sleep, 200
Click, 1800, 670
Sleep, 200
Click, 2374, 626    ;vessel
Sleep, 200
Send, %read_vessel%
Sleep, 200
Click, 2388, 667
Sleep, 200
Click, 2355, 667     ;dive
Sleep, 200
Send, %read_dive%
Sleep, 200
Click, 2352, 710     ;wave
Sleep, 200
Send, %read_wave%
Sleep, 200
Click, 2344, 740     ;cur-dir
Sleep, 200
Send, %read_curdir%
Sleep, 200
Click, 1817, 710     ;client
Sleep, 200
Send, %read_client%
Sleep, 200
Click, 1783, 740     ;cur-spd
Sleep, 200
Send, %read_curspd%

;ROV
Sleep, 310
Click, 1406, 555
Sleep, 200
Click, 2139, 570
Sleep, 200
Click, 2139, 600
Sleep, 200
Click, 2139, 640

;TMS
Sleep, 310
Click, 1366, 610
Sleep, 200
Click, 2139, 565
Sleep, 200
Click, 2139, 600

;Handling System
Sleep, 310
Click, 1380, 640
Sleep, 200
Click, 2370, 570
Sleep, 200
Click, 2140, 604
Sleep, 200
Click, 2140, 640
Sleep, 200
Click, 2140, 676
Sleep, 200
Click, 2140, 713
Sleep, 200
Click, 2140, 749
Sleep, 200
Click, 2140, 784
Sleep, 200
Click, 2140, 813
Sleep, 200
Click, 2140, 847
Sleep, 200
Click, 2140, 884

;Tooling
Sleep, 310
Click, 1380, 680
Sleep, 200
Click, 2140, 570
Sleep, 200
Click, 2140, 600

;Survey
Sleep, 310
Click, 1380, 730
Sleep, 200
Click, 2140, 570

;Personnel
Sleep, 310
Click, 1380, 800
Sleep, 200
Click, 1790, 570    ;super
Sleep, 200
Send, %read_sup%
Sleep, 200
Click, 2580, 570
Sleep, 200
Click, 2580, 600
Sleep, 200
Click, 1811, 605    ;srtech
Sleep, 200
Send, %read_sr%
Sleep, 200
Click, 2580, 605
Sleep, 200
Click, 2580, 710
Sleep, 200
Click, 1818, 645     ;pt
Sleep, 200
Send, %read_pt%
Sleep, 200
Click, 2580, 645
Sleep, 200
Click, 2580, 720


;Submit
Sleep, 200
Click, 3660, 160

BlockInput Off

}


; #############################
; ##### BEGIN MAIN SCRIPT #####
; #############################
;
; alt+p
!p::

WinGetActiveTitle, awin
MsgBox, 48, Active Window is:  "%awin%", Island Venture Widescreen ONLY!!!`nThis completes a Pre-Recovery & Post-Dive Checklist.`nJust fill out the following parameters.`n`nYou can leave this screen to get info,`n Just ensure to return to Unisea page before continuing this app.
ScriptName := "Post-Dive-Checklist-IV"
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
   MsgBox, 16, Get8Me, Must be in the Checklist Form Area to continue`n`nthis might just a bug...keep trying...`nprobably no problem, 20
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

; post-dive continued below

; ###################################
; ######### START POST DIVE #########
; ###################################

; Postdive function
Post_Dive() {

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

SetDefaultMouseSpeed, 80
SetMouseDelay, 1000

;Start Form
Click, 387, 228    ;form
Sleep, 500
Click, 2033, 465   ;open list
Sleep, 500
Click, 2050, 508
Sleep, 500
Click, 2050, 545
Sleep, 500
Click, 2050, 670   ;start postdive
Sleep, 500
Click, 1520, 375   ;title
Sleep, 500
Send, ^a
Sleep, 500
Send, %read_date%
Sleep, 500
Send, {Space}
Sleep, 500
Send, Dive {#}
Sleep, 500
Send, %read_dive%
Sleep, 500

;System
Click, 1800, 570
Sleep, 300
Send, %read_system%
Sleep, 200
Click, 1800, 600

;Client
Sleep, 300
Click, 1800, 640
Sleep, 200
Send, %read_client%

;Vessel
Sleep, 300
Click, 2580, 570
Sleep, 200
Send, %read_vessel%
Sleep, 200
Click, 2500, 600

;Dive
Sleep, 300
Click, 2580, 600
Sleep, 200
Send, %read_dive%

;Super
Sleep, 300
Click, 2580, 640
Sleep, 200
Send, %read_sup%

;Control Consoles
Sleep, 300
Click, 1400, 560
Sleep, 200
Click, 2140, 570
Sleep, 200
Click, 2140, 605
Sleep, 200
Click, 2340, 640
Sleep, 200
Click, 2340, 660
Sleep, 200
Send, "Spare Not Being Used"
Sleep, 200
Click, 2140, 715
Sleep, 200
Click, 2140, 750

;TMS
Sleep, 300
Click, 1400, 600
Sleep, 200
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
Click, 2140, 745
Sleep, 200
Click, 2140, 780
Sleep, 200
Click, 2140, 815

;ROV
Sleep, 300
Click, 1400, 640
Sleep, 200
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
Click, 2140, 745
Sleep, 200
Click, 2140, 780
Sleep, 200
Click, 2140, 815

;Handling System
Sleep, 300
Click, 1357, 680
Sleep, 200
Click, 2140, 570
Sleep, 200
Click, 2140, 605
Sleep, 200
Click, 2140, 640
Sleep, 200
Click, 2337, 675
Sleep, 200
Click, 2337, 690
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 2337, 750
Sleep, 200
Click, 2220, 770
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 2330, 820
Sleep, 200
Click, 2330, 840
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 2130, 900
Sleep, 200
Click, 2130, 935
Sleep, 200
Click, 2130, 970
Sleep, 200
Click, 2130, 1005

;Tooling
Sleep, 300
Click, 1357, 720
Sleep, 200
Click, 2140, 570
Sleep, 200
Click, 2140, 605
Sleep, 200
Click, 2140, 640
Sleep, 200
Click, 2140, 675
Sleep, 200
Click, 2140, 710

;System Specifics
Sleep, 300
Click, 1357, 760

;Send Form
Click, 3660, 160

BlockInput Off

}

; starting post dive main script here
Sleep 1000
Run, http://192.168.60.40/ci/unisea.nsf/#/checklist/views/overview
Sleep, 2000
IfWinActive, Checklist - Google Chrome
{
  WinMaximize
}

Post_Dive()

File.Close()

FileDelete, Post_Dive_Checklist_OLD.db

ExitApp, 0
