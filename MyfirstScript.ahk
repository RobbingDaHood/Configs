;AutoHotkey script

;For an autohotkey script to interact with any elevated application it has to itself be launched as elevated. 
;Numpad0 & Numpad1::   
;   Run *runas C:\projects\cmd
;   Send XPogSags
;Return
;WinWaitActive Kontrol af brugerkonti
;   Send {Left}
;   Send {Enter}

;
; WND+S
;
; Search selected logtoken in splunk
; 
#s::
	Send ^c
	ClipWait
	clip = %clipboard%	
	
	Run, http://splunk/en-US/app/search/search?q=`"`"%clipboard%`"`"`"&display.page.search.mode=fast
Return

;
; WND+X
;
; Copy all the text, paste into notepad++ and format as XML
; 
#x::
	Send ^a
	Send ^c
	ClipWait
	Run, "c:\Program Files (x86)\Notepad++\notepad++.exe", ,max
	SetTitleMatchMode, 2
	WinWaitActive, Notepad++
	Send ^n
	Send !l
	Send x
	Send ^v
	Send ^a
	Send !^+b
	Send {Home}
	Send {Home}
	Send {Home}
	Send {PgUp}
	Send {PgUp}
	Send {PgUp}
Return

;Get intranet info on user
^Numpad1::
	InputBox, OutputVar
	Run, iexplore.exe https://intranet.nykredit.dk/search/Sider/peopleresults.aspx?k=%OutputVar%
return 

;HUGO lookup on whatever is selected
^Numpad2::
	Send ^c
	ClipWait
	Run, iexplore.exe http://nupo/hugo/searchobject.jsp?objname=%Clipboard%
return 

