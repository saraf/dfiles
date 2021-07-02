#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force

:*:wrg::
(

warm regards,
Aalhad Saraf
)

:*:twrg::
(
Thanks!
warm regards,
Aalhad Saraf
)

:*:tfks::
(
Thanks for your kind support!
warm regards,
Aalhad Saraf
)

:*:tfpr::
(
Thanks for your prompt and kind response!
warm regards,
Aalhad Saraf
)

;01/01/2021 10:52:43 - keep the window always on top after pressing ctrl+space
;^SPACE:: Winset, Alwaysontop, "sharedzim - Zim"

:*:]d::  ; This hotstring replaces "]d" with the current date and time via the commands below.
FormatTime, CurrentDateTime,, dddd dd-MMM-yyyy  ; It will look like Sunday 19-March-2017
SendInput %CurrentDateTime%
return

:*:]fdt::  ; This hotstring replaces "]d" with the current date and time via the commands below.
FormatTime, CurrentDateTime,, dddd dd MMMM yyyy HH:mm:ss  ; It will look like Sunday 19 March 2017 22:49:23
SendInput %CurrentDateTime%
return

:*:]cpass:: ; replace ]spass with the crpass
SendInput 294760312
return

:*:]t::  ; This hotstring replaces "]t" with the current date and time via the commands below.
FormatTime, CurrentDateTime,,dd/MM/yyyy HH:mm:ss  ; It will look like 19/03/2017 22:49:18
SendInput %CurrentDateTime%
return

:*:]shrug::  ; This hotstring replaces "]d" with the current date and time via the commands below.
SendInput ¯\_(ツ)_/¯
return

;~RCtrl:: Send +{F10}

;Right Alt + x will open a pdf file in Xodo pdf annotation tool 
>^,:: 
Clipboard =
Send ^c
ClipWait ;waits for the clipboard to have content
;MsgBox %clipboard%
SplitPath, clipboard, name, dir, ext, name_no_ext, drive
FoundPos := RegExMatch(ext, "i)pdf$")
;MsgBox, %FoundPos%
if(FoundPos){
	Send +{F10}h{Right}x{Enter}
}

;MsgBox %FoundPos%

;Run, C:\work\winstoreapplinks\Xodo.lnk `"%clipboard%`"
;return
