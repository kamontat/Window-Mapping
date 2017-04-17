; hotkey prefix
;              Left | Right | Normal
; WindowKey =   <#  |  >#   |   #
; Control   =   <^  |  >^   |   ^
; Alt       =   <!  |  >!   |   !
; Shift     =   <+  |  >+   |   +

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force ; force running newest version
SetWorkingDir %A_ScriptDir%

version := "1.1.1" ; current version
enabledIcon = %A_ScriptDir%\enable.ico
disabledIcon = %A_ScriptDir%\disable.ico

get_message("Run Mapping Program (v" . version . ")", "Create by Kamontat Chantrachirathumrong", 3, 33, 64)

; set icon
SetIcon(true)

; setup env
SetCapsLockState, off

; swap
LWin::LCtrl ; change left window key to cmd
RWin::RCtrl ; change right window key to cmd
LCtrl::LWin ; change left ctrl to window key
RCtrl::RWin ; change right ctrl to window key

; search file (alt+space)
; VK53 is `s` key
!Space::
	ifWinActive, Search
		Send, {Escape down}{Escape up}
	else
		Send, {LWin down}{VK53 down}{VK53 up}{LWin up}
return

; make caplock can change language
Capslock::Send, {LWin down}{Space down}{LWin up}{Space up}

; delete file with cmd/ctrl + back occurred
^Backspace::Send, {Delete down}{Delete up}

; `permanently` delete file with cmd/ctrl + back occurred
^+Backspace::Send, {Shift down}{Delete down}{Delete up}{Shift up}

; exit program
; VK51 is `q` key
^+VK51::
	get_message("Exit!", "Program already exited", 3, 34, 48)
	Suspend, on
	ExitApp
return

; --------------- method --------------- 

; hide method (when 2 notification occurred at the time)
HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        ; Menu Tray, NoIcon
        Sleep 200  ; It may be necessary to adjust this sleep.
        ; Menu Tray, Icon
    }
}

; option: (for window10 user)	1       = info
; 				2       = warning
;          			3       = error
;          			16      = no sound
;          			32      = large icon
; option2: (for other)		0       = OK
; 				1       = OK/Cancel
; 				2       = Abort/Retry/Ignore
; 				3       = Yes/No/Cancel
; 				4       = Yes/No
; 				5       = Retry/Cancel
; 				6       = Cancel/Try Again/Continue
; 				16384   = OK/Cancel
; 				16      = Icon Hand (stop/error)
; 				32      = Icon Question
; 				48      = Icon Exclamation
; 				64      = Icon Asterisk (info)
; 				256     = Makes the 2rd button the default
; 				512     = Makes the 3rd button the default
; 				768     = Makes the 4th button the default (requires the Help button)
; 				4096    = System Modal (always on top)
; 				8192    = Task Modal
; 				262144  = Always-on-top (like System Modal but omits title bar icon)
; 				524288  = Make the text right-justified
; 				1048576 = Right-to-left reading (for Hebrew/Arabic)
get_message(title, message, seconds, option, option2:=0) {
	if SubStr(A_OSVersion,1,3) = "10." {
		TrayTip, %title%, %message%, %seconds%, %option% ; alert message
		HideTrayTip()
	} else {
		MsgBox, %option2%, %title%, %message%, %seconds%
	}
}

; for changing icon in future
SetIcon(is_enabled)
{
    local icon := is_enabled ? enabledIcon : disabledIcon
    if icon !=
    {
        ifExist, %icon%
                Menu, Tray, Icon, %icon%,, 1
        else    Menu, Tray, Icon, *
        Menu, Tray, Icon
    }
    else
        Menu, Tray, NoIcon
    ; %m_OnUpdateIcon%(icon, is_enabled)
}