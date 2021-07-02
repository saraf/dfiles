;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Aalhad Saraf <aalhad@gmail.com>
;
; Script Function:
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

#-::
Send --------------------------------------------------------------------------------------{Enter}
return

;--------------------------------------------------------------------------------------
; Left Alt+h  - Runs Notepad as Administrator for UAC in Windows Vista and 7+
;--------------------------------------------------------------------------------------
>!h::
HostsFile = %A_WinDir%\System32\drivers\etc\hosts
Notepad = %A_WinDir%\Notepad.exe
Run *RunAs "%Notepad%" "%HostsFile%"; Requires AutoHotkey_L v1.0.92.01+
return



;--------------------------------------------------------------------------------------
;In WebStorm, sometimes we are in the middle of an autocompleted line and need to 
;go to the end of the line by pressing "End" and then the line terminator
;instead this shortcut traps a double press of the ; key and automatically inserts 
;a semi-colon at the end of the line
--------------------------------------------------------------------------------------
#IfWinActive ahk_class SunAwtFrame

; Example #3: Detection of single, double, and triple-presses of a hotkey. This
; allows a hotkey to perform a different operation depending on how many times
; you press it:
`;::
if semicol_presses > 0 ; SetTimer already started, so we log the keypress instead.
{
    semicol_presses += 1
    return
}
; Otherwise, this is the first press of a new series. Set count to 1 and start
; the timer:
semicol_presses = 1
SetTimer, Keysemicol, 200 ; Wait for more presses within a 400 millisecond window.
return

Keysemicol:
SetTimer, Keysemicol, off
if semicol_presses = 1 ; The key was pressed once.
{
    Send `;
    ;Run, m:\  ; Open a folder.
}
else if semicol_presses = 2 ; The key was pressed twice.
{
    Send {End}`;
    ;Run, m:\multimedia  ; Open a different folder.
}
else if semicol_presses > 2
{
   ; MsgBox, Three or more clicks detected.
}
; Regardless of which action above was triggered, reset the count to
; prepare for the next series of presses:
semicol_presses = 0
return

;--------------------------------------------------------------------------------------
;do the same thing for a comma - for example when typing out a parameter list, if there
;is a string within  quotes, pressing a comma twice should 
;  a. send a right cursor keystroke to take the cursor after the automatically inserted double quotes, 
;  b. then send a comma followed by a space so that the next parameter can be typed

; Detection of single, double, and triple-presses of a hotkey. This
; allows a hotkey to perform a different operation depending on how many times
; you press it:
$,::
if comma_presses > 0 ; SetTimer already started, so we log the keypress instead.
{
    comma_presses += 1
    return
}
; Otherwise, this is the first press of a new series. Set count to 1 and start
; the timer:
comma_presses = 1
SetTimer, Keycomma, 200 ; Wait for more presses within a 400 millisecond window.
return

Keycomma:
SetTimer, Keycomma, off
if comma_presses = 1 ; The key was pressed once.
{
    Send {,}
    ;Run, m:\  ; Open a folder.
}
else if comma_presses = 2 ; The key was pressed twice.
{
    ;MsgBox, 0, comma, comma pressed twice
    Send {Right}{,}{Space}
    ;Run, m:\multimedia  ; Open a different folder.
}
else if comma_presses > 2
{
   ; MsgBox, Three or more clicks detected.
}
; Regardless of which action above was triggered, reset the count to
; prepare for the next series of presses:
comma_presses = 0
return
;--------------------------------------------------------------------------------------

;--------------------------------------------------------------------------------------
;do the same thing for a rbrace - for example when typing out a parameter list, if there
;is a string within  quotes, pressing a rbrace twice should 
;  a. send a right cursor keystroke to take the cursor after the automatically inserted double quotes, 
;  b. then send a rbrace followed by a space so that the next parameter can be typed

; Detection of single, double, and triple-presses of a hotkey. This
; allows a hotkey to perform a different operation depending on how many times
; you press it:
${::
if rbrace_presses > 0 ; SetTimer already started, so we log the keypress instead.
{
    rbrace_presses += 1
    return
}
; Otherwise, this is the first press of a new series. Set count to 1 and start
; the timer:
rbrace_presses = 1
SetTimer, Keyrbrace, 200 ; Wait for more presses within a 400 millisecond window.
return

Keyrbrace:
SetTimer, Keyrbrace, off
if rbrace_presses = 1 ; The key was pressed once.
{
    Send {`{}
    ;Run, m:\  ; Open a folder.
}
else if rbrace_presses = 2 ; The key was pressed twice.
{
    ;MsgBox, 0, rbrace, rbrace pressed twice
    Send {Right}{`{}{Enter}
    ;Run, m:\multimedia  ; Open a different folder.
}
else if rbrace_presses > 2
{
   ; MsgBox, Three or more clicks detected.
}
; Regardless of which action above was triggered, reset the count to
; prepare for the next series of presses:
rbrace_presses = 0
return

;--------------------------------------------------------------------------------------
;do the same thing for a colon - for example when typing out an object in javascript, if there
;is a string within  quotes, pressing a colon twice should 
;  a. send a right cursor keystroke to take the cursor after the automatically inserted double quotes, 
;  b. then send a colon followed by a space so that the next parameter can be typed
; for example {
;       "after typing this press a colon twice rapidly":
; Detection of single, double, and triple-presses of a hotkey. This
; allows a hotkey to perform a different operation depending on how many times
; you press it:
:::
if colon_presses > 0 ; SetTimer already started, so we log the keypress instead.
{
    colon_presses += 1
    return
}
; Otherwise, this is the first press of a new series. Set count to 1 and start
; the timer:
colon_presses = 1
SetTimer, Keycolon, 200 ; Wait for more presses within a 200 millisecond window.
return

Keycolon:
SetTimer, Keycolon, off
if colon_presses = 1 ; The key was pressed once.
{
    Send {:}
    ;Run, m:\  ; Open a folder.
}
else if colon_presses = 2 ; The key was pressed twice.
{
    ;MsgBox, 0, colon, colon pressed twice
    Send {Right}{:}{Space}
    ;Run, m:\multimedia  ; Open a different folder.
}
else if colon_presses > 2
{
   ; MsgBox, Three or more clicks detected.
}
; Regardless of which action above was triggered, reset the count to
; prepare for the next series of presses:
colon_presses = 0
return
;--------------------------------------------------------------------------------------
#IfWinActive
;--------------------------------------------------------------------------------------