
ListLines, Off
SetBatchLines, -1
CoordMode, Pixel, Screen

verHash := 2.0
;status 1 start 0 stop 2 boom
status := 0
F1::

	showtext("start")
   	status = 1
	Loop
	{
		;ToolTip, %status%
		;ToolTip, Multiline`nTooltip, 100, 150
		If(status==1){
			runNoneLoop()
		}Else{
			return
		}
	}
   	return

F2::
	status = 0
	showtext("stop")
	return

F3::
	showtext("boom")
	return
	
X::
    showtext("wanfa")
    Send, {XButton1} x
    return


showtext(str)
{
y := A_ScreenHeight - 600   ;;y is the y-coordinate of the prompting window
Gui,Destroy
Gui,+AlwaysOnTop +Disabled -Caption -SysMenu +Owner +LastFound
WinGet,hwnd,ID
Gui, font, s26 cFF0000 w600, Verdana
Gui, Color, FF0001
WinSet, TransColor, FF0001
Gui,Add,Text,BackgroundTrans,%str%
Gui, Show, NoActivate Y%y% NA, Title of Window
Sleep,1000
Gui,Destroy
}
 
runNoneLoop(){
	Send, 1q
	Sleep 800
	Send, 1q
	Sleep 800
	Send, e
	Sleep 100
	return
}
