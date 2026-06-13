; submit Pre-Recovery Checklist in UniSea  (Island Perfomer)
; Pre_Recovery_Checklist_SUBMIT v.0.0.1
; Tested on W11, Viewsonic VX3218C-2K, Chrome 147.0.7727.138, UniSea v25.6.10 (54638)
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
if ErrorLevel
 MsgBox, Failed to rename file

; calls this function. This may not be right.  ; v.0.3 is calling this function after ra_renew
RENEW_mkDB()
}
}


; Prerecovery function, may be too long for a function
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
Click, 400, 230    ;form
Sleep, 500
Click, 1380, 465   ;open list
Sleep, 500
Click, 1415, 510
Sleep, 500
Click, 1430, 550
Sleep, 500
Click, 1440, 870   ;start prerecovery
Sleep, 500
Click, 1090, 370   ;title
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
Click, 1200, 630    ;system
Sleep, 200
Send, %read_system%
Sleep, 200
Click, 1200, 670
Sleep, 200
Click, 1750, 638    ;vessel
Sleep, 200
Send, %read_vessel%
Sleep, 200
Click, 1760, 671
Sleep, 200
Click, 1750, 673     ;dive
Sleep, 200
Send, %read_dive%
Sleep, 200
Click, 1750, 710     ;wave
Sleep, 200
Send, %read_wave%
Sleep, 200
Click, 1750, 748     ;cur-dir
Sleep, 200
Send, %read_curdir%
Sleep, 200
Click, 1200, 712     ;client
Sleep, 200
Send, %read_client%
Sleep, 200
Click, 1200, 745     ;cur-spd
Sleep, 200
Send, %read_curspd%

;ROV
Sleep, 310
Click, 750, 560
Sleep, 200
Click, 1500, 569
Sleep, 200
Click, 1500, 604
Sleep, 200
Click, 1500, 639

;TMS
Sleep, 310
Click, 750, 600
Sleep, 200
Click, 1500, 568
Sleep, 200
Click, 1500, 604

;Handling System
Sleep, 310
Click, 750, 640
Sleep, 200
Click, 1735, 568
Sleep, 200
Click, 1500, 604
Sleep, 200
Click, 1500, 640
Sleep, 200
Click, 1500, 676
Sleep, 200
Click, 1500, 713
Sleep, 200
Click, 1500, 749
Sleep, 200
Click, 1500, 784
Sleep, 200
Click, 1500, 820
Sleep, 200
Click, 1500, 856
Sleep, 200
Click, 1500, 891

;Tooling
Sleep, 310
Click, 750, 680
Sleep, 200
Click, 1500, 570
Sleep, 200
Click, 1500, 602

;Survey
Sleep, 310
Click, 750, 723
Sleep, 200
Click, 1500, 568

;Personnel
Sleep, 310
Click, 750, 800
Sleep, 200
Click, 1200, 568    ;super
Sleep, 200
Send, %read_sup%
Sleep, 200
Click, 1940, 569
Sleep, 200
Click, 1940, 603
Sleep, 200
Click, 1200, 607    ;srtech
Sleep, 200
Send, %read_sr%
Sleep, 200
Click, 1940, 606
Sleep, 200
Click, 1940, 715
Sleep, 200
Click, 1200, 644     ;pt
Sleep, 200
Send, %read_pt%
Sleep, 200
Click, 1940, 645
Sleep, 200
Click, 1940, 715

;Submit
Sleep, 300
Click, 2380, 160
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


; #############################
; ##### BEGIN MAIN SCRIPT #####
; #############################
;
; alt+p
!p::

WinGetActiveTitle, awin
MsgBox, 0, Active Window is:  "%awin%"
ScriptName := "Pre-Recovery-Post-Dive-Checklist"
WorkerURL := "https://run-log.jmahaffey009.workers.dev"
StatusFile := A_Temp "\curl_status.txt"
if FileExist(StatusFile)
    FileDelete, %StatusFile%
PercentSign := Chr(37)
WriteFormat = -w "%PercentSign%{http_code}"
CurlArgs := "-s " WriteFormat " -o NUL -X POST " WorkerURL " -H ""Content-Type: application/json"" -d ""{\""script_name\"":\""" ScriptName "\""}"""
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

Run, http://unisea-ci.chouest.com/ci/unisea.nsf/#/checklist/views/overview
Sleep, 2000
IfWinActive, Checklist - Google Chrome
{
  WinMaximize
  Sleep, 100
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
if !FileExist("Post_Dive_Checklist.db") {
 mkDB()
}

else querylist()

Pre_Recover()
; post-dive continued below

; ###################################
; ######### START POST DIVE #########
; ###################################

; Postdive function, may be too long for a function
Post_Dive() {
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
Click, 400, 230    ;form
Sleep, 500
Click, 1430, 470   ;open list
Sleep, 500
Click, 1430, 510
Sleep, 500
Click, 1430, 555
Sleep, 500
Click, 1430, 670   ;start postdive
Sleep, 500
Click, 1015, 370   ;title
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
Click, 1200, 560
Sleep, 300
Send, %read_system%
Sleep, 200
Click, 1200, 600

;Client
Sleep, 300
Click, 1200, 641
Sleep, 200
Send, %read_client%

;Vessel
Sleep, 300
Click, 1700, 569
Sleep, 200
Send, %read_vessel%
Sleep, 200
Click, 1700, 603

;Dive
Sleep, 300
Click, 1700, 604
Sleep, 200
Send, %read_dive%

;Super
Sleep, 300
Click, 1700, 641
Sleep, 200
Send, %read_sup%

;Control Consoles
Sleep, 300
Click, 700, 560
Sleep, 200
Click, 1500, 568
Sleep, 200
Click, 1500, 605
Sleep, 200
Click, 1500, 640
Sleep, 200
Click, 1500, 675
;Sleep, 200
;Send, "Spare Not Being Used"
;Sleep, 200
;Click, 2139, 634
Sleep, 200
Click, 1500, 710

;TMS
Sleep, 300
Click, 700, 595
Sleep, 200
Click, 1500, 570
Sleep, 200
Click, 1500, 604
Sleep, 200
Click, 1500, 639
Sleep, 200
Click, 1500, 673
Sleep, 200
Click, 1500, 712
Sleep, 200
Click, 1500, 748
Sleep, 200
Click, 1500, 784
Sleep, 200
Click, 1500, 820

;ROV
Sleep, 300
Click, 700, 640
Sleep, 200
Click, 1500, 567
Sleep, 200
Click, 1500, 603
Sleep, 200
Click, 1500, 639
Sleep, 200
Click, 1500, 676
Sleep, 200
Click, 1500, 712
Sleep, 200
Click, 1500, 748
Sleep, 200
Click, 1500, 784
Sleep, 200
Click, 1500, 820

;Handling System
Sleep, 300
Click, 700, 680
Sleep, 200
Click, 1500, 567
Sleep, 200
Click, 1500, 604
Sleep, 200
Click, 1500, 639
Sleep, 200
Click, 1700, 673
Sleep, 200
Click, 1500, 691
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 1700, 747
Sleep, 200
Click, 1500, 766
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 1700, 823
Sleep, 200
Click, 1500, 842
Sleep, 200
Send, "Not Applicable"
Sleep, 200
Click, 1500, 900
Sleep, 200
Click, 1500, 933
Sleep, 200
Click, 1500, 970
Sleep, 200
Click, 1700, 1000
Sleep, 200
Click, 1500, 1028
Sleep, 200
Send, "Not Applicable"

;Tooling
Sleep, 300
Click, 700, 720
Sleep, 200
Click, 1500, 570
Sleep, 200
Click, 1500, 604
Sleep, 200
Click, 1500, 639
Sleep, 200
Click, 1500, 676
Sleep, 200
Click, 1500, 712

;System Specifics
Sleep, 300
Click, 700, 760

;Send Form
Sleep, 300
Click, 2380, 160
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

; starting post dive main script here
Sleep 1000
Run, http://unisea-ci.chouest.com/ci/unisea.nsf/#/checklist/views/overview
Sleep, 2000
IfWinActive, Checklist - Google Chrome
{
  WinMaximize
}

Post_Dive()

File.Close()

FileDelete, Post_Dive_Checklist_OLD.db

;MsgBox, 0, Process Complete. User will submit.
ExitApp, 0
