#NoTrayIcon
Loop {
  Sleep 300000
  Random x, -500, 500
  Random y, -500, 500
  MouseMove x,y,0,R
}

^!+z::ExitApp
