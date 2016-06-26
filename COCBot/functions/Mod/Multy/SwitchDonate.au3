; #FUNCTION# ====================================================================================================================
; Name ..........: Switch Account And Donate
; Description ...:
; Syntax ........:
; Parameters ....:
; Return values .:
; Author ........: Lakereng (2016)
; Modified ......: TheRevenor (2016)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func SwitchDonate()
		;..............Switch Account & Donate Then Switch Back...................
	If $ichkSwitchDonate = 1 Then
		SetLog("Loading Switching Account For Donate...", $COLOR_BLUE)
		DetectAccount()
		If _Sleep(1000) Then Return
		If $sCurrProfile = "[01] Main" Then
			SwitchAccount("Second")
			$RunState = True
			While 1
				;Collect()
				ZoomOut()
				Sleep(1000)
				DonateCC()
				RequestCC()
				DetectAccount()
				Train()
				ExitLoop
			WEnd
			SwitchAccount("Main")
		ElseIf $sCurrProfile = "[02] Second" Then
			If $iAccount = "3" Or $iAccount = "4" Or $iAccount = "5" Or $iAccount = "6" Then
				SwitchAccount("Third")
			Else
				SwitchAccount("Main")
			EndIf
			$RunState = True
			While 1
				ZoomOut()
				Sleep(1000)
				DonateCC()
				RequestCC()
				DetectAccount()
				Train()
				ExitLoop
			WEnd
			SwitchAccount("Second")
		ElseIf $sCurrProfile = "[03] Third" Then
			If $iAccount = "4" Or $iAccount = "5" Or $iAccount = "6" Then
				SwitchAccount("Fourth")
			ElseIf $iAccount = "3" Then
				SwitchAccount("Main")
			EndIf
			$RunState = True
			While 1
				ZoomOut()
				DonateCC()
				RequestCC()
				DetectAccount()
				Train()
				ExitLoop
			WEnd
			SwitchAccount("Third")
		ElseIf $sCurrProfile = "[04] Fourth" Then
			If $iAccount = "5" Or $iAccount = "6" Then
				SwitchAccount("Fifth")
			ElseIf $iAccount = "4" Then
				SwitchAccount("Main")
			EndIf
			$RunState = True
			While 1
				ZoomOut()
				DonateCC()
				RequestCC()
				DetectAccount()
				Train()
				ExitLoop
			WEnd
			SwitchAccount("Fourth")
		ElseIf $sCurrProfile = "[05] Fifth" Then
			If $iAccount = "6" Then
				SwitchAccount("Fifth")
			ElseIf $iAccount = "5" Then
				SwitchAccount("Main")
			EndIf
			$RunState = True
			While 1
				ZoomOut()
				DonateCC()
				RequestCC()
				DetectAccount()
				Train()
				ExitLoop
			WEnd
			SwitchAccount("Fifth")
		ElseIf $sCurrProfile = "[06] Sixth" Then
			$RunState = True
			SwitchAccount("Main")
			While 1
				ZoomOut()
				DonateCC()
				RequestCC()
				DetectAccount()
				Train()
				ExitLoop
			WEnd
			SwitchAccount("Sixth")
		EndIf
		If _Sleep(1000) Then Return
		SetLog("Switching Account For Donate Completed", $COLOR_BLUE)
		DetectAccount()
	EndIf

EndFunc
