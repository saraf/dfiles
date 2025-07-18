﻿SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
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
FormatTime, CurrentDateTime,,yyyy/MM/dd HH:mm:ss  ; It will look like 2017/02/19 22:49:18
SendInput %CurrentDateTime%
return

:*:]shrug::  ; This hotstring replaces "]d" with the current date and time via the commands below.
SendInput ¯\_(ツ)_/¯
return


; Prepend Timestamp to Markdown Clipboard Content
; This is used to add timestamps to content copied in from Gen AI tools like Perplexity
; 1. Copy the answer from the web interface 
; 2. Create a new note in Notable
; 3. Type in the title of the note in Notable
; 4. Press Right Ctrl + M to run
RCtrl & m::
    ; 1. Prompt for title
    ; InputBox, userTitle, Enter Title, Please enter the title for your note:
    if ErrorLevel
        return

    ; 2. Get current clipboard content (assumed Markdown)
    mdContent := Clipboard

    ; 3. Get ISO 8601 timestamp
    FormatTime, isoTime,, yyyy-MM-ddTHH:mm:ss

    ; 4. Build new content
    newContent := "`r`nCreated on: " . isoTime . "`r`n`r`n" . mdContent

    ; 5. Set clipboard to new content
    Clipboard := newContent
    ClipWait, 1

    ; 6. Paste the new content
    Send, ^v
    
    ; 6. Notify user
    ; MsgBox, 64, Done, Markdown with heading and timestamp is now on your clipboard.
return


