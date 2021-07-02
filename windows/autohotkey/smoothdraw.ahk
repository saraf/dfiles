;Useful shortcuts for working with SmoothDraw
;Aalhad Saraf <aalhad@gmail.com>


#SingleInstance Force

SetTimer, SaveSmoothDrawPrompt, 300000
return

;--------------------------------------------------------------------------------------
;this was necessary for old versions of smoothdraw which would interpret a control key
;press as an invocation of the eyedropper color selection tool, hence we needed to give
;a 5 second warning tooltip  - that said "saving the file". Since 4.1.4, that behavior
;no longer holds true and we can just send a ctrl-s directly.

/*
SaveSmoothDrawPrompt:
    If WinActive("SmoothDraw 4.1.4") {
        ToolTip, Save the file
		SetTimer, RemoveToolTip, 5000
    }
    return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
If WinActive("SmoothDraw") {
        Send, ^s
}
return
*/

SaveSmoothDrawPrompt:
If WinActive("SmoothDraw 4.1.4") {
	Send, ^s
}
return



;--------------------------------------------------------------------------------------
; If SmoothDraw is open, get the filename from the title of the window
; and save the file as a png
;--------------------------------------------------------------------------------------
SetTitleMatchMode, 2
#IfWinActive SmoothDraw

;^!c::MsgBox You pressed Control+Alt+C in WordPad.
#s::

Send, ^s
Sleep,2000
WinGetTitle, Title, A
;MsgBox, The active window is %Title%.
StringReplace, NewTitle, Title, 4.1.1 - , ``, All  
; Replace each 4.1.1 - with an accent. We are doing this to get the filename from the title
; assuming that a filename will never contain an accent
; StringSplit takes a -list- of characters to split on, to split on strings we need to use this
; method to first replace the string with an unused character and then split using that unused character


StringSplit, MyArray, NewTitle, ``

;MsgBox, The filename is %MyArray2%
SplitPath, MyArray2, name, dir, ext, name_no_ext
;MsgBox, Just the name is %name_no_ext%

;Loop, %MyArray0%
;{
;    this_part := MyArray%a_index%
;    MsgBox, Part number %a_index% is %this_part%.
;}

Send, !f{Down}{Down}{Down}{Enter}
Send, !n
Sleep, 1000
Send, %dir%\%name_no_ext%{Tab}

Send,{Down}{Up}{Up}{Up}{Up}{Up}{Up}{Up}{Down}{Enter}
Send,!s

;If the png file exists and needs to be overwritten, a confirmation dialog pops up
;we wait for the user to close the dialog.
WinWaitClose, Save As

;Now re-open the sddoc file, we do not want to continue editing the png

Send, !f{Down}{Enter}
Send, !n
Sleep, 1000
;Send %name_no_ext%.sddoc
Send, %MyArray2%
Sleep, 1000
Send,!o

;ControlGet, List, List, Selected, ComboBox2, Save As
;Loop, Parse, List, `n  ; Rows are delimited by linefeeds (`n).
;{
;    RowNumber := A_Index
;    Loop, Parse, A_LoopField, %A_Tab%  ; Fields (columns) in each row are delimited by tabs (A_Tab).
;        MsgBox Row #%RowNumber% Col #%A_Index% is %A_LoopField%.
;}
#IfWinActive