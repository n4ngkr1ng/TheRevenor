; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Controls Tab SmartZap
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: LunaEclipse(February, 2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func chkSmartLightSpell()
    If GUICtrlRead($chkSmartLightSpell) = $GUI_CHECKED Then
        GUICtrlSetState($chkSmartZapDB, $GUI_ENABLE)
        GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_ENABLE)
        GUICtrlSetState($txtMinDark, $GUI_ENABLE)
        $ichkSmartZap = 1
    Else
        GUICtrlSetState($chkSmartZapDB, $GUI_DISABLE)
        GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_DISABLE)
        GUICtrlSetState($txtMinDark, $GUI_DISABLE)
        $ichkSmartZap = 0
    EndIf
EndFunc   ;==>chkSmartLightSpell

Func chkSmartZapDB()
    If GUICtrlRead($chkSmartZapDB) = $GUI_CHECKED Then
        $ichkSmartZapDB = 1
    Else
        $ichkSmartZapDB = 0
    EndIf
EndFunc   ;==>chkSmartZapDB

Func chkSmartZapSaveHeroes()
    If GUICtrlRead($chkSmartZapSaveHeroes) = $GUI_CHECKED Then
        $ichkSmartZapSaveHeroes = 1
    Else
        $ichkSmartZapSaveHeroes = 0
    EndIf
EndFunc   ;==>chkSmartZapSaveHeroes

Func txtMinDark()
	$itxtMinDE = GUICtrlRead($txtMinDark)
EndFunc   ;==>txtMinDark

; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Controls Tab Mod Option
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Lakareng
; Modified ......: TheRevenor
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func SwitchAndDonate()
	If GUICtrlRead($chkSwitchDonate) = $GUI_CHECKED Then
		$ichkSwitchDonate = 1
	Else
		$ichkSwitchDonate = 0
	EndIf
EndFunc   ;==>SwitchAndDonate


Func MultiFarming()
	If GUICtrlRead($chkMultyFarming) = $GUI_CHECKED Then
		$ichkMultyFarming = 1
		GUICtrlSetState($Account, $GUI_ENABLE)
		GUICtrlSetState($lblmultyAcc, $GUI_ENABLE)
		For $i = $grpControls To $cmbHoursStop
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
		If GUICtrlRead($chkBotStop) = $GUI_CHECKED Then
			GUICtrlSetState($chkBotStop, $GUI_UNCHECKED)
		EndIf
	Else
		$ichkMultyFarming = 0
		GUICtrlSetState($Account, $GUI_DISABLE)
		GUICtrlSetState($lblmultyAcc, $GUI_DISABLE)
		For $i = $grpControls To $cmbHoursStop
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
	EndIf
	
	; IceCube (Multy-Farming Revamp v1.6)
	GUICtrlSetState($btnmultyAcc1, $GUI_DISABLE)
	GUICtrlSetState($btnmultyAcc2, $GUI_DISABLE)
	GUICtrlSetState($btnmultyAcc3, $GUI_DISABLE)
	GUICtrlSetState($btnmultyAcc4, $GUI_DISABLE)
	
	If  FileExists(@ScriptDir & "\images\Multyfarming\Accmain.bmp") AND FileExists(@ScriptDir & "\images\Multyfarming\main.bmp") Then
		GUICtrlSetState($btnmultyAcc1, $GUI_ENABLE)
	EndIf
	If  FileExists(@ScriptDir & "\images\Multyfarming\AccSecond.bmp") AND FileExists(@ScriptDir & "\images\Multyfarming\Second.bmp") Then
		GUICtrlSetState($btnmultyAcc2, $GUI_ENABLE)
	EndIf
	If  FileExists(@ScriptDir & "\images\Multyfarming\AccThird.bmp") AND FileExists(@ScriptDir & "\images\Multyfarming\Third.bmp") Then
		GUICtrlSetState($btnmultyAcc3, $GUI_ENABLE)
	EndIf
	If  FileExists(@ScriptDir & "\images\Multyfarming\AccFourth.bmp") AND FileExists(@ScriptDir & "\images\Multyfarming\Fourth.bmp") Then
		GUICtrlSetState($btnmultyAcc4, $GUI_ENABLE)
	EndIf
	; IceCube (Multy-Farming Revamp v1.6)
EndFunc   ;==>MultiFarming

Func Account()
	$iAccount = GUICtrlRead($Account)
	IniWrite($config, "Multy", "Account", $iAccount)
EndFunc

; IceCube (Multy-Farming Revamp v1.6)
;Main Account
Func btnmultyDetectAcc()
	If $RunState Then Return
	LockGUI()
	SetLog("Multy-farming Account Detection Requested ...", $COLOR_BLUE)
	SetLog("DO NOT STOP OR PAUSE BOT", $COLOR_RED)
	$RunState = True
	waitMainScreen()
	if IsMainPage()  Then
		DetectAccount()
	Else
		SetLog("Multy-farming Account Detection Canceled", $COLOR_RED)
	EndIf
	$RunState = False
	UnLockGUI()
EndFunc
;Main Account
Func btnmultyAcc1()
	If $RunState Then Return
	LockGUI()
	SetLog("Multy-farming Main Account Switch Requested ...", $COLOR_BLUE)
	SetLog("DO NOT STOP OR PAUSE BOT", $COLOR_RED)
		$RunState = True
	waitMainScreen()
	if IsMainPage() AND DetectCurrentAccount("Main") Then	
		checkMainScreen()
		$iSwCount = 0
		SwitchAccount("Main")
		checkMainScreen()	
		DetectAccount()
		SetLog("Multy-farming Main Account Switch Completed", $COLOR_BLUE)
	Else
		SetLog("Multy-farming Account Switch Canceled", $COLOR_RED)
	EndIf
	$RunState = False
	UnLockGUI()
EndFunc
;Second Account
Func btnmultyAcc2()
	If $RunState Then Return
	LockGUI()
	SetLog("Multy-farming Second Account Switch Requested ...", $COLOR_BLUE)
	SetLog("DO NOT STOP OR PAUSE BOT", $COLOR_RED)
		$RunState = True
	waitMainScreen()
	SetLog("Multy-farming Second Account Switch In Progress ...", $COLOR_BLUE)
	if IsMainPage() AND DetectCurrentAccount("Second") Then
		checkMainScreen()
		$iSwCount = 0
		SwitchAccount("Second")
		checkMainScreen()
		DetectAccount()
		SetLog("Multy-farming Second Account Switch Completed", $COLOR_BLUE)
	Else
		SetLog("Multy-farming Account Switch Canceled", $COLOR_RED)
	EndIf
	$RunState = False
	UnLockGUI()
EndFunc
;Third Account
Func btnmultyAcc3()
	If $RunState Then Return
	LockGUI()
	SetLog("Multy-farming Third Account Switch Requested ...", $COLOR_BLUE)
	SetLog("DO NOT STOP OR PAUSE BOT", $COLOR_RED)
		$RunState = True
	waitMainScreen()
	SetLog("Multy-farming Third Account Switch In Progress ...", $COLOR_BLUE)
	if IsMainPage() AND DetectCurrentAccount("Third") Then
		checkMainScreen()
		$iSwCount = 0
		SwitchAccount("Third")
		checkMainScreen()
		DetectAccount()
		SetLog("Multy-farming Third Account Switch Completed", $COLOR_BLUE)
	Else
		SetLog("Multy-farming Account Switch Canceled", $COLOR_RED)
	EndIf
	$RunState = False
	UnLockGUI()
EndFunc
;Fourth Account
Func btnmultyAcc4()
	If $RunState Then Return
	LockGUI()
	SetLog("Multy-farming Fourth Account Switch Requested ...", $COLOR_BLUE)
	SetLog("DO NOT STOP OR PAUSE BOT", $COLOR_RED)
		$RunState = True
	waitMainScreen()
	SetLog("Multy-farming Fourth Account Switch In Progress ...", $COLOR_BLUE)
	if IsMainPage() AND DetectCurrentAccount("Fourth") Then
		checkMainScreen()
		$iSwCount = 0
		SwitchAccount("Fourth")
		checkMainScreen()
		DetectAccount()
		SetLog("Multy-farming Fourth Account Switch Completed", $COLOR_BLUE)
	Else
		SetLog("Multy-farming Account Switch Canceled", $COLOR_RED)
	EndIf
	$RunState = False
	UnLockGUI()
EndFunc

;Lock GUI
Func LockGUI()
	If $RunState Then ; Or BitOr(GUICtrlGetState($btnStop), $GUI_SHOW) Then ; $btnStop check added for strange $RunState inconsistencies
		GUICtrlSetState($btnStart, $GUI_HIDE)
		GUICtrlSetState($btnStop, $GUI_SHOW)
		GUICtrlSetState($btnPause, $GUI_SHOW)
		GUICtrlSetState($btnResume, $GUI_HIDE)
		GUICtrlSetState($btnSearchMode, $GUI_HIDE)
		;GUICtrlSetState($btnMakeScreenshot, $GUI_DISABLE)
		;$FirstAttack = 0

		$bTrainEnabled = True
		$bDonationEnabled = True
		$MeetCondStop = False
		$Is_ClientSyncError = False
		$bDisableBreakCheck = False  ; reset flag to check for early warning message when bot start/restart in case user stopped in middle
		$bDisableDropTrophy = False ; Reset Disabled Drop Trophy because the user has no Tier 1 or 2 Troops

		_GUICtrlEdit_SetText($txtLog, _PadStringCenter(" BOT LOG ", 71, "="))
		_GUICtrlRichEdit_SetFont($txtLog, 6, "Lucida Console")
		_GUICtrlRichEdit_AppendTextColor($txtLog, "" & @CRLF, _ColorConvert($Color_Black))

	    SaveConfig()
		readConfig()
		applyConfig(False) ; bot window redraw stays disabled!

		GUICtrlSetState($chkBackground, $GUI_DISABLE)

		$GUIControl_Disabled = True
		For $i = $FirstControlToHide To $LastControlToHide ; Save state of all controls on tabs
			If IsTab($i) Or IsDebugControl($i) Then ContinueLoop
			If $PushBulletEnabled And $i = $btnDeletePBmessages Then ContinueLoop ; exclude the DeleteAllMesages button when PushBullet is enabled
			If $i = $btnMakeScreenshot Then ContinueLoop ; exclude
			If $i = $divider Then ContinueLoop ; exclude divider
			$iPrevState[$i] = GUICtrlGetState($i)
 			GUICtrlSetState($i, $GUI_DISABLE)
		Next
		For $i = $FirstControlToHideMod To $LastControlToHideMod ; Save state of all controls on tabs
			$iPrevState[$i] = GUICtrlGetState($i)
 			GUICtrlSetState($i, $GUI_DISABLE)
		Next
		$GUIControl_Disabled = False
		
		$RunState = False
		SetRedrawBotWindow(True)
		EndIf
EndFunc
;UnLock GUI
Func UnLockGUI()
	If $RunState Then ; Or BitOr(GUICtrlGetState($btnStop), $GUI_SHOW) Then ; $btnStop check added for strange $RunState inconsistencies
		GUICtrlSetState($chkBackground, $GUI_ENABLE)
		GUICtrlSetState($btnStart, $GUI_SHOW)
		GUICtrlSetState($btnStop, $GUI_HIDE)
		GUICtrlSetState($btnPause, $GUI_HIDE)
		GUICtrlSetState($btnResume, $GUI_HIDE)
		If $iTownHallLevel > 2 Then GUICtrlSetState($btnSearchMode, $GUI_ENABLE)
		GUICtrlSetState($btnSearchMode, $GUI_SHOW)
		;GUICtrlSetState($btnMakeScreenshot, $GUI_ENABLE)

		; hide attack buttons if show
		GUICtrlSetState($btnAttackNowDB, $GUI_HIDE)
		GUICtrlSetState($btnAttackNowLB, $GUI_HIDE)
		GUICtrlSetState($btnAttackNowTS, $GUI_HIDE)
		GUICtrlSetState($pic2arrow, $GUI_SHOW)
		GUICtrlSetState($lblVersion, $GUI_SHOW)

	    ;$FirstStart = true
		EnableBS($HWnD, $SC_MINIMIZE)
		EnableBS($HWnD, $SC_MAXIMIZE)
		;EnableBS($HWnD, $SC_CLOSE) ; no need to re-enable close button

		SetRedrawBotWindow(False)

		$GUIControl_Disabled = True
		For $i = $FirstControlToHide To $LastControlToHide ; Restore previous state of controls
			If IsTab($i) Or IsDebugControl($i) Then ContinueLoop
			If $PushBulletEnabled And $i = $btnDeletePBmessages Then ContinueLoop ; exclude the DeleteAllMesages button when PushBullet is enabled
			If $i = $btnMakeScreenshot Then ContinueLoop ; exclude
			If $i = $divider Then ContinueLoop ; exclude divider
			GUICtrlSetState($i, $iPrevState[$i])
		Next
		For $i = $FirstControlToHideMod To $LastControlToHideMod ; Restore previous state of controls
			GUICtrlSetState($i, $iPrevState[$i])
		Next
		$GUIControl_Disabled = False
		
		$RunState = False
		AndroidBotStopEvent() ; signal android that bot is now stopping

		_BlockInputEx(0, "", "", $HWnD)
		SetRedrawBotWindow(True) ; must be here at bottom, after SetLog, so Log refreshes. You could also use SetRedrawBotWindow(True, False) and let the events handle the refresh.
		EndIf
EndFunc

; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Controls Tab Android
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: LunaEclipse(February, 2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func setupAndroidComboBox()
	Local $androidString = ""
	Local $aAndroid = getInstalledEmulators()

	; Convert the array into a string
	$androidString = _ArrayToString($aAndroid, "|")

	; Set the new data of valid Emulators
	GUICtrlSetData($cmbAndroid, $androidString, $aAndroid[0])
EndFunc   ;==>setupAndroidComboBox

Func cmbAndroid()
	$sAndroid = GUICtrlRead($cmbAndroid)
	modifyAndroid()
EndFunc   ;==>cmbAndroid

Func txtAndroidInstance()
	$sAndroidInstance = GUICtrlRead($txtAndroidInstance)
	modifyAndroid()
EndFunc   ;==>$txtAndroidInstance

Func HideTaskbar()
	If GUICtrlRead($chkHideTaskBar) = $GUI_CHECKED Then
		$ichkHideTaskBar = 1
	Else
		$ichkHideTaskBar = 0
	EndIf
EndFunc   ;==>HideTaskbar


Func chkFastADBClicks()
	If GUICtrlRead($chkFastADBClicks) = $GUI_CHECKED Then
		$AndroidAdbClicksEnabled = True
	Else
		$AndroidAdbClicksEnabled = False
	EndIf
EndFunc   ;==>chkFastADBClicks