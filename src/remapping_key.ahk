#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force ; force running newest version

version := "1.1.0" ; current version
get_message("Run Mapping Program (v" . version . ")", "Create by Kamontat Chantrachirathumrong", 3, 33)

; setup env
SetCapsLockState, off

LWin::Ctrl ; change window key to cmd
RWin::Ctrl ; change window key to cmd
Ctrl::LWin ; change ctrl to window key

; VK53 is `s` key
^Space::Send, {LWin down}{VK53 down}{VK53 up}{LWin up} ; search file
Capslock::Send, {LWin down}{Space down}{LWin up}{Space up} ; make caplock can change language

; VK51 is `q` key
^+VK51::
	get_message("Exit!", "Program already exited", 3, 34)
	Suspend, on
	ExitApp
return

; hidden feature (bug issue)
; VK44 is `d` key
; ^+VK44::
; 	if A_IsSuspended = 1
;		get_message("Re-enable Hotkey", "", 3, 17)
;	else 
;		get_message("Disable Hotkey", "", 3, 18)
;	Suspend
; return

; hide method (when 2 notification occurred at the time)
HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200  ; It may be necessary to adjust this sleep.
        Menu Tray, Icon
    }
}

; option: 1 = info
;         2 = warning
;         3 = error
;         16 = no sound
;         32 = large icon
get_message(title, message, seconds, option) {
	if SubStr(A_OSVersion,1,3) = "10." {
		TrayTip, %title%, %message%, %seconds%, %option% ; alert message
		HideTrayTip()
	} else { 
		MsgBox, %title%`n%message%
	}
}