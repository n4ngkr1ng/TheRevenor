; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control Attack Standard
; Description ...: This file Includes all functions to current GUI
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: MyBot.run team
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func cmbDeployAB()
   If _GUICtrlCombobox_GetCurSel($cmbDeployAB) = 4 Then
	  GUICtrlSetState($chkSmartAttackRedAreaAB, $GUI_UNCHECKED)
	  GUICtrlSetState($chkSmartAttackRedAreaAB, $GUI_DISABLE)
   Else
	  GUICtrlSetState($chkSmartAttackRedAreaAB, $GUI_ENABLE)
   EndIf
EndFunc

Func cmbDeployDB()
   If _GUICtrlCombobox_GetCurSel($cmbDeployDB) = 4 Then
	  GUICtrlSetState($chkSmartAttackRedAreaDB, $GUI_UNCHECKED)
	  GUICtrlSetState($chkSmartAttackRedAreaDB, $GUI_DISABLE)
   Else
	  GUICtrlSetState($chkSmartAttackRedAreaDB, $GUI_ENABLE)
   EndIf
EndFunc

Func chkRandomSpeedAtkAB()
	If GUICtrlRead($chkRandomSpeedAtkAB) = $GUI_CHECKED Then
		;$iChkABRandomSpeedAtk = 1
		GUICtrlSetState($cmbUnitDelayAB, $GUI_DISABLE)
		GUICtrlSetState($cmbWaveDelayAB, $GUI_DISABLE)
	Else
		;$iChkABRandomSpeedAtk = 0
		GUICtrlSetState($cmbUnitDelayAB, $GUI_ENABLE)
		GUICtrlSetState($cmbWaveDelayAB, $GUI_ENABLE)
	EndIf
EndFunc   ;==>chkRandomSpeedAtkAB

Func chkSmartAttackRedAreaAB()
	If GUICtrlRead($chkSmartAttackRedAreaAB) = $GUI_CHECKED Then
		$iChkRedArea[$LB] = 1
		For $i = $lblSmartDeployAB To $picAttackNearDarkElixirDrillAB
			GUICtrlSetState($i, $GUI_SHOW)
		Next
	Else
		$iChkRedArea[$LB] = 0
		For $i = $lblSmartDeployAB To $picAttackNearDarkElixirDrillAB
			GUICtrlSetState($i, $GUI_HIDE)
		Next
	EndIf
EndFunc   ;==>chkSmartAttackRedAreaAB
Func chkRandomSpeedAtkDB()
	If GUICtrlRead($chkRandomSpeedAtkDB) = $GUI_CHECKED Then
		;$iChkDBRandomSpeedAtk = 1
		GUICtrlSetState($cmbUnitDelayDB, $GUI_DISABLE)
		GUICtrlSetState($cmbWaveDelayDB, $GUI_DISABLE)
	Else
		;$iChkDBRandomSpeedAtk = 0
		GUICtrlSetState($cmbUnitDelayDB, $GUI_ENABLE)
		GUICtrlSetState($cmbWaveDelayDB, $GUI_ENABLE)
	EndIf
EndFunc   ;==>chkRandomSpeedAtkDB

Func chkSmartAttackRedAreaDB()
	If GUICtrlRead($chkSmartAttackRedAreaDB) = $GUI_CHECKED Then
		$iChkRedArea[$DB] = 1
		For $i = $lblSmartDeployDB To $picAttackNearDarkElixirDrillDB
			GUICtrlSetState($i, $GUI_SHOW)
		Next
	Else
		$iChkRedArea[$DB] = 0
		For $i = $lblSmartDeployDB To $picAttackNearDarkElixirDrillDB
			GUICtrlSetState($i, $GUI_HIDE)
		Next
	EndIf
EndFunc   ;==>chkSmartAttackRedAreaDB

;===== Attack Now Button (Useful for Standart Attack Testing) By TheRevenor =====
Func AttackNowDB1()
	$iMatchMode = $DB			; Select Dead Base As Attack Type
	GuiCtrlRead($cmbDeployDB)
	$iMatchMode = $DB			; Select Dead Base As Attack Type
	$RunState = True
	PrepareAttack($iMatchMode)
	Attack()					; Fire xD
EndFunc   ;==>AttackNow Dead Base
