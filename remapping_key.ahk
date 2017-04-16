#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force ; force running newest version

version = 1.0.0 ; current version
MsgBox, Run Program version %version% ; alert message starting

LWin::Ctrl ; change window key to cmd
RWin::Ctrl ; change window key to cmd

Ctrl::LWin ; change ctrl to window key

Capslock::Send, {LWin down}{Space down}{LWin up}{Space up} ; make caplock can change language

^+q::
MsgBox, Exit! ; alert message
ExitApp ; press ctrl+shift+q to exit this script
return