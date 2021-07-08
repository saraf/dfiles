#Persistent
#SingleInstance

MsgBox % "Will move mouse randomly.`n`nWinKey+N when going away`nWinkey+Z when you come back."

SetTimer, MoveMouseRandomly, 3000
return

MoveMouseRandomly:
	Random, nextsob, 0, 800
	Random,	nextbob, 0, 800
	;MsgBox, % "location", "nextsob: " %nextsob%
	MouseMove, nextsob, nextbob
	return

#z::
	Random, nextsob, 0,800
	Random,	nextbob, 0,800
	MsgBox, % "Stopping mouse movement - welcome back"
	SetTimer, MoveMouseRandomly, Off
	return
	
#n::
	SetTimer, MoveMouseRandomly, 3000
