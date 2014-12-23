#NoTrayIcon
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 1
OnExit UnRegister ; unregister before exiting
Gui +LastFound
hwnd := WinExist() ; getting a handle to the script gui
DllCall("Wtsapi32.dll\WTSRegisterSessionNotification", "uint", hwnd, "uint", 0) ; registering the gui, but only for this session
OnMessage(0x02B1, "sessionChange") ; start listening
OnMessage(0x7E, "displayChange") ; start listening

sessionChange(wparam, lparam, msg, hwnd){
  global top, x, y
  top=0
  while(top==0){
    MouseMove 0, 0, 0
    Sleep 20
    SendInput ^!{Up}
    Sleep 500
  }
  MouseMove x, y, 0
}

displayChange(wparam, lparam, msg, hwnd){
  global top
  top=1
}

#l::
  MouseGetPos x, y
  MouseMove 0, 0, 0
  Sleep 20
  SendInput ^!{Down}
  Sleep 250
  RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 0
  DllCall("LockWorkStation")
  sleep, 1000
  RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 1
  top=0
return

^!+z::Gosub Unregister

Unregister:
  DllCall("Wtsapi32.dll\WTSUnRegisterSessionNotification", "uint", hwnd) ; unregister
  RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 0
  ExitApp ; and exit
return
