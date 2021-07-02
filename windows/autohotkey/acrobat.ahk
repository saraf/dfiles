#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force

;add a hotkey for editing the hosts file as administrator - done
>!h::
HostsFile = %A_WinDir%\System32\drivers\etc\hosts
Notepad = %A_WinDir%\Notepad.exe
Run *RunAs "%Notepad%" "%HostsFile%"; Requires AutoHotkey_L v1.0.92.01+
return

;--------------------------------------------------------------------------------------
;Enable Vim like navigation keys in Acrobat reader
;--------------------------------------------------------------------------------------
#IfWinActive ahk_class AcrobatSDIWindow
h:: 
if (inAcrobatSearchMode)
  Send h
else Send {Left}
return

j::
if (inAcrobatSearchMode)
  Send j 
else Send {Down}
return

k::
if (inAcrobatSearchMode)
{
  Send k
}
else Send {Up}
return

l::
if (inAcrobatSearchMode)
  Send l 
else Send {Right}
return

n::
if (inAcrobatSearchMode)
  Send n
else Send {F3}{Esc}
return

+n::
if (inAcrobatSearchMode)
  Send N
else Send +{F3}{Esc}
return

+g::
if (inAcrobatSearchMode)
  Send G
else Send {End} 
return

; see http://stackoverflow.com/questions/1794258/detect-a-double-key-press-in-autohotkey

g::
if (inAcrobatSearchMode)
  Send g
else {
  if (A_PriorHotkey <> "g" or A_TimeSincePriorHotkey > 400) {
      ; Too much time between presses, so this isn't a double-press.
      KeyWait, g
      return
  }
  Send {Home}
}
return

/::
if (inAcrobatSearchMode)
  Send /
else {
  inAcrobatSearchMode := true
  Send ^f
}
return

Esc::
inAcrobatSearchMode := false
Send {Esc}
return

^[::
inAcrobatSearchMode := false
Send {Esc}
return

Enter::
if (inAcrobatSearchMode) {
  inAcrobatSearchMode := false
}
Send {Enter}
return

;go back into normal mode after scrolling with any control command

^e::
inAcrobatSearchMode := false
Send {Esc}{Down}
return

^y::
inAcrobatSearchMode := false
Send {Esc}{Up}
return

^f::
inAcrobatSearchMode := false
Send {Esc}{PgDn}
return

^b::
inAcrobatSearchMode := false
Send {Esc}{PgUp}
return

#IfWinActive