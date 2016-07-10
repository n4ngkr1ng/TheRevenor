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
		GUICtrlSetState($chkExtLightSpell, $GUI_DISABLE)
        GUICtrlSetState($chkSmartZapDB, $GUI_ENABLE)
        GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_ENABLE)
        GUICtrlSetState($txtMinDark, $GUI_ENABLE)
        $ichkSmartZap = 1
    Else
		GUICtrlSetState($chkExtLightSpell, $GUI_ENABLE)
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
; Description ...: Extreme Zap
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: TheRevenor(July, 2016)
; Modified ......: None
; Remarks .......: This file is part of MyBot, MyBot.run. Copyright 2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func ExtLightSpell()
	If GUICtrlRead($chkExtLightSpell) = $GUI_CHECKED Then
		GUICtrlSetState($txtMinDark, $GUI_ENABLE)
		GUICtrlSetState($chkSmartLightSpell, $GUI_DISABLE)
		$ichkExtLightSpell = 1
	Else
		GUICtrlSetState($chkSmartLightSpell, $GUI_ENABLE)
		GUICtrlSetState($txtMinDark, $GUI_DISABLE)
		$ichkExtLightSpell = 0
	EndIf
 EndFunc   ;==>GUILightSpell

;Func DrillZapTH()
;    If GUICtrlRead($chkDrillZapTH) = 1 Then
;	  smartZap()
;   ElseIf GUICtrlRead($chkDrillZapTH) = 0 Then
;	  Return False
;  EndIf
;EndFunc

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

;Func HideTaskbar()
;	If GUICtrlRead($chkHideTaskBar) = $GUI_CHECKED Then
;		$ichkHideTaskBar = 1
;	Else
;		$ichkHideTaskBar = 0
;	EndIf
;EndFunc   ;==>HideTaskbar

Func chkFastADBClicks()
	If GUICtrlRead($chkFastADBClicks) = $GUI_CHECKED Then
		$AndroidAdbClicksEnabled = True
	Else
		$AndroidAdbClicksEnabled = False
	EndIf
 EndFunc   ;==>chkFastADBClicks

; Demen & chalicucu Switch Account
Func chkSwitchAcc()
	If GUICtrlRead($chkSwitchAcc) = $GUI_CHECKED Then
		GUICtrlSetState($chkUseTrainingClose, $GUI_UNCHECKED)
		GUICtrlSetState($chkUseTrainingClose, $GUI_DISABLE)
		For $i = $lblExtraTimeMin To $chkRandomStayORClose
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		For $i = $lbTotalCoCAcc To $chkAccRelax
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		$ichkSwitchAcc = 1
	Else
		GUICtrlSetState($chkUseTrainingClose, $GUI_ENABLE)
		GUICtrlSetState($chkUseTrainingClose, $GUI_CHECKED)
		For $i = $lblExtraTimeMin To $chkRandomStayORClose
			GUICtrlSetState($i, $GUI_SHOW)
		Next
		For $i = $lbTotalCoCAcc To $chkAccRelax
			GUICtrlSetState($i, $GUI_HIDE)
		Next
		$ichkSwitchAcc = 0
	EndIf
	IniWrite($profile, "switchcocacc", "Enable", $ichkSwitchAcc)
EndFunc   ;==>chkSwitchAcc

Func chkAccRelaxTogether()	;chalicucu
	If GUICtrlRead($chkAccRelax) = $GUI_CHECKED Then
		$AccRelaxTogether = 1
	Else
		$AccRelaxTogether = 0
	EndIf
	IniWrite($profile, "switchcocacc", "AttackRelax", $AccRelaxTogether)
EndFunc   ;==>chkAccRelaxTogether

Func chkAtkPln()	;chalicucu enable/disable attack plan
	If GUICtrlRead($chkAtkPln) = $GUI_CHECKED Then
		$iChkAtkPln = 1
	Else
		$iChkAtkPln = 0
	EndIf
	IniWrite($profile, "switchcocacc", "CheckAtkPln", $iChkAtkPln)
EndFunc   ;==>chkAtkPln
