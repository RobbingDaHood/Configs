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

^#x::
^#c::                            ; Text-only cut/copy to ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard =
   StringRight x,A_ThisHotKey,1  ; C or X
   Send ^%x%                     ; For best compatibility: SendPlay
   ClipWait 2                    ; Wait for text, up to 2s
   If ErrorLevel
      ClipBoard = %Clip0%        ; Restore original ClipBoard
   Else
      ClipBoard = %ClipBoard%    ; Convert to text
   VarSetCapacity(Clip0, 0)      ; Free memory 
Return

;Make sure escape does not close a window in the chat
#IfWinActive ahk_exe lync.exe
Escape::return