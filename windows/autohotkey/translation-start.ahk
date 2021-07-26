SetTitleMatchMode, 2
SysGet, MonLap, MonitorWorkArea, 1
SysGet, MonTv, MonitorWorkArea, 2
#SingleInstance Force

;=====================================================================================================================
;I am going to write an autohotkey script to copy the current word into the clipboard and append it to a catalog file.
;The reason being - during the translation of the ayurveda for cancer book - I want to create a glossary for the book.
;=====================================================================================================================
; SET THE CATALOG FILE HERE:
GlossaryCatalogFilePath := "C:\work\glossary.txt"

;MsgBox % "MonLapLeft: " MonLapLeft "; MonLapTop: " MonLapTop "; MonLapRight: " MonLapRight "; MonLapBottom: " MonLapBottom
;MsgBox % "MonTvLeft: " MonTvLeft "; MonTvTop: " MonTvTop "; MonTvRight: " MonTvRight "; MonTvBottom: " MonTvBottom
;msgbox, This is the first line,`nbut this is the second.`n`nThis is the second paragraph of text, but you have to check for wrapping length yourself.

;Right Alt + t will set you up for translation 
>!t:: 
MsgBox, 1, ,Will set you up for Marathi to Japanese translation.`n`nBut - I WILL NEED TO SHUT EXISTING FIREFOX WINDOWS.`n`nShould I proceed?

IfMsgBox Cancel
	return


Run, "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" "https://docs.google.com/document/d/1KC57BSINzzAM7URVDvOdHFdcOvoWvrlxbh6TMqXDxQA/edit" "https://track.saraf.systems:8095" "https://drive.google.com/drive/u/0/folders/1MW4GcVSyH6wS3Eo-csFU9Xsnls4mFG2N"
Sleep, 1000
ff1 := WinExist("ahk_class MozillaWindowClass")
Sleep, 1000

Run, "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" "-new-window" "https://docs.google.com/document/d/1KC57BSINzzAM7URVDvOdHFdcOvoWvrlxbh6TMqXDxQA/edit" "https://docs.google.com/spreadsheets/d/1QJjQqmt77DFdV_5Ox8Athz7dVRxr0Vp4/edit#gid=837682998"
Sleep, 1000
ff2 := WinExist("ahk_class MozillaWindowClass",,"ahk_id %ff1%")

Sleep, 1000
Run, "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" "-new-window" "https://translate.google.com/?sl=mr&tl=ja&op=translate"
Sleep, 1000
ff3 := WinExist("ahk_class MozillaWindowClass",,"ahk_id %ff1%" "ahk_id %ff2%")

Sleep, 1000
Run, "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" "https://translate.google.com/?sl=en&tl=ja&op=translate" "https://www.lexilogos.com/keyboard/sanskrit_conversion.htm" "https://www.sljfaq.org/cgi/e2k.cgi" "https://www.linguee.com/english-japanese/search?source=auto&query=holistic+medicine"
Sleep, 1000
ff4 := WinExist("ahk_class MozillaWindowClass",,"ahk_id %ff1%" "ahk_id %ff2%" "ahk_id %ff3%")
Sleep, 1000


WinMove, ahk_id %ff1%,, -1920, 0, 960, 1080
WinMove, ahk_id %ff2%,,-960, 0, 960, 1080
WinMove, ahk_id %ff3%,, 0, 0, 960, 1080
WinMove, ahk_id %ff4%,, 960, 0, 960, 1080
return


;
;Right Alt + C will copy the current word to the clipboard and append it to a catalog file 
>!c:: 
    Clipboard := "" ;

    MouseClick, left
    MouseClick, left

    Send ^c
    ClipWait, 2
    if ErrorLevel
    {
        MsgBox, The attempt to copy text onto the clipboard failed.
        return
    }
    else {
        FileAppend, 
        (
        %Clipboard%`n
        ), %GlossaryCatalogFilePath%, UTF-8
    }
return