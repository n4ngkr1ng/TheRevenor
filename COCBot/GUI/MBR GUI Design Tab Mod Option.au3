; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Tab SmartZap
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
$hGUI_ModOption = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_MOD)
GUISetBkColor($COLOR_WHITE, $hGUI_ModOption)

GUISwitch($hGUI_ModOption)
;$tabMOD = GUICtrlCreateTabItem("MOD")
	; SmartZap Settings
	Local $x = 20, $y = 23
    $grpStatsMisc = GUICtrlCreateGroup("Smart Zap && Extreme Zap", $x - 20, $y - 20, 438, 138) ;120
		GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x - 10, $y + 20, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x - 10, $y - 7, 24, 24)
		$chkSmartLightSpell = GUICtrlCreateCheckbox("Use Lightning Spells to SmartZap Drills", $x + 20, $y - 5, -1, -1)
			$txtTip = "Check this to drop Lightning Spells on top of Dark Elixir Drills." & @CRLF & @CRLF & _
					  "Remember to go to the tab 'troops' and put the maximum capacity " & @CRLF & _
					  "of your spell factory and the number of spells so that the bot " & @CRLF & _
					  "can function perfectly."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartLightSpell")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
		$chkExtLightSpell = GUICtrlCreateCheckbox("Use ExtremeZap To Zap Dark Drill", $x + 20, $y + 21, -1, -1)
			$txtTip = "Check this to drop Extreme lightning spells on Dark Elixir Drills," & @CRLF & @CRLF & _
					  "__If You Do Not Like SmartZap, This Is The Right Choice.__"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "ExtLightSpell")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
		$chkSmartZapDB = GUICtrlCreateCheckbox("Only Zap Drills in Dead Bases", $x + 20, $y + 47, -1, -1)
			$txtTip = "It is recommended you only zap drills in dead bases as most of the " & @CRLF & _
					  "Dark Elixir in a live base will be in the storage."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartZapDB")
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblSmartZap = GUICtrlCreateLabel("Min. amount of Dark Elixir:", $x + 0, $y + 74, 160, -1, $SS_RIGHT) ;-20
		$txtMinDark = GUICtrlCreateInput("250", $x + 180, $y + 69, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER)) ;+ 45
		    $txtTip = "The value here depends a lot on what level your Town Hall is, " & @CRLF & _
					  "and what level drills you most often see." & @CRLF & @CRLF & _
					  "Input The Min Dark Elixir If You Want To Extreme Drill Zap"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetOnEvent(-1, "txtMinDark")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkSmartZapSaveHeroes = GUICtrlCreateCheckbox("Don't Zap on Town Hall Snipe when Heroes Deployed", $x + 20, $y + 94, -1, -1) ;69
			$txtTip = "This will stop SmartZap from zapping a base on a Town Hall Snipe " & @CRLF & _
					  "if your heroes were deployed. " & @CRLF & @CRLF & _
					  "This protects their health so they will be ready for battle sooner!"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSmartZapSaveHeroes")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			;GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
	Local $x = 236, $y = 25
		$picSmartZap = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 160, $y + 3, 24, 24)
		$lblSmartZap = GUICtrlCreateLabel("0", $x + 60, $y + 5, 80, 30, $SS_RIGHT)
			GUICtrlSetFont(-1, 16, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
			GUICtrlSetColor(-1, 0x279B61)
			$txtTip = "Number of dark elixir zapped during the attack with lightning."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x + 160, $y + 40, 24, 24)
		$lblLightningUsed = GUICtrlCreateLabel("0", $x + 60, $y + 40, 80, 30, $SS_RIGHT)
			GUICtrlSetFont(-1, 16, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
			GUICtrlSetColor(-1, 0x279B61)
			$txtTip = "Amount of used spells."
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
;GUICtrlCreateTabItem("")

; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Tab Mod Option
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: lakereng
; Modified ......: IceCube and TheRevenor (2016)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Local $x = 20, $y = 162 ;150
	$grpMultyFarming = GUICtrlCreateGroup( "Multy-Farming With Smart Switch", $x - 20, $y - 20, 438, 62)
	;$x -= 10
		$chkMultyFarming = GUICtrlCreateCheckbox(GetTranslated(17,1, "Multy-Farming"), $x - 10, $y -7, -1 , -1)
			$txtTip = GetTranslated(17,3, "Will switch account and attack, then switch back")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "MultiFarming")
		$chkSwitchDonate = GUICtrlCreateCheckbox(GetTranslated(6,1, "Donate"), $x - 10, $y +13, -1, -1)
			$txtTip = GetTranslated(17,4, "Will switch account For Donate, then switch back")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SwitchDonate")
		$Account = GUICtrlCreateInput("2", $x +170, $y -5, 18, 15, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(17,5, "How many account to use For multy-farming")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblmultyAcc = GUICtrlCreateLabel(GetTranslated(17,2, "How Many:"), $x +100, $y -2, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblmultyAccBtn = GUICtrlCreateLabel(GetTranslated(17, 22, "Fast Switch:"), $x +100, $y +18, -1, -1)
			$txtTip = GetTranslated(17, 22, "Fast switch between accounts")
			GUICtrlSetTip(-1, $txtTip)
		$btnmultyAcc1 = GUICtrlCreateButton("#1", $x + 170, $y +15, 20, 18)
			$txtTip = GetTranslated(17,22, "Switch to Main Account")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc1")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$btnmultyAcc2 = GUICtrlCreateButton("#2", $x + 200, $y +15, 20, 18)
			$txtTip = GetTranslated(17,23, "Switch to Second Account")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc2")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$btnmultyAcc3 = GUICtrlCreateButton("#3", $x + 230, $y +15, 20, 18)
			$txtTip = GetTranslated(17,24, "Switch to Third Account")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc3")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$btnmultyAcc4 = GUICtrlCreateButton("#4", $x + 260, $y +15, 20, 18)
			$txtTip = GetTranslated(17,25, "Switch to Fourth Account")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc4")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$btnmultyAcc5 = GUICtrlCreateButton("#5", $x + 290, $y +15, 20, 18)
			$txtTip = GetTranslated(17,26, "Switch to Fifth Account")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc5")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$btnmultyAcc6 = GUICtrlCreateButton("#6", $x + 320, $y +15, 20, 18)
			$txtTip = GetTranslated(17,27, "Switch to Sixth Account")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyAcc6")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$btnmultyDetectAcc = GUICtrlCreateButton("?", $x + 350, $y +15, 20, 18)
			$txtTip = GetTranslated(17,28, "Detect Current Account")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnmultyDetectAcc")
			GUICtrlSetState(-1, $GUI_ENABLE)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
;===================================================================================================================;

	; Android Settings
	Local $x = 20, $y = 223 ;222
	$grpHideAndroid = GUICtrlCreateGroup("Android Options", $x - 20, $y - 20, 438, 68) ; $x - 20, $y - 20, 438, 80)
		$cmbAndroid = GUICtrlCreateCombo("", $x - 10, $y - 5, 130, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Use this to select the Android Emulator to use with this profile."
			GUICtrlSetTip(-1, $txtTip)
			setupAndroidComboBox()
			GUICtrlSetState(-1, $GUI_SHOW)
			GUICtrlSetOnEvent(-1, "cmbAndroid")
		$lblAndroidInstance = GUICtrlCreateLabel("Instance:", $x + 130, $y - 2 , 60, 21, $SS_RIGHT)
		$txtAndroidInstance = GUICtrlCreateInput("", $x + 200, $y - 5, 210, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			$txtTip = "Enter the Instance to use with this profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "txtAndroidInstance")
			GUICtrlSetState(-1, $GUI_DISABLE)
		;$chkHideTaskBar = GUICtrlCreateCheckbox("Hide Taskbar Icon", $x - 10, $y + 20, 120, -1)
		;	$txtTip = "This will hide the android client from the taskbar when you press the Hide button"
		;	GUICtrlSetTip(-1, $txtTip)
		;	GUICtrlSetOnEvent(-1, "HideTaskbar")
		;$lblHideTaskBar = GUICtrlCreateLabel("Warning: May cause erratic behaviour, uncheck if you have problems.", $x - 10, $y + 45, 340, 30, $SS_LEFT)
			; Misc Battle Settings
	;Local $x = 35, $y = 450
	;$grpDontEndBattle = GUICtrlCreateGroup("Miscellaneous Battle Settings", $x - 20, $y - 20, 440, 45)
		$chkFastADBClicks = GUICtrlCreateCheckbox("Enable Fast ADB Clicks", $x - 10, $y + 20, -1, -1) ; $x + 120, $y + 20, -1, -1)
			$txtTip = "Tick this to enable faster ADB deployment of Troops for MEmu and Droid4x" & @CRLF & @CRLF & _
				      "     WARNING:  This is experimental, if you have issues with deployment, disable it."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkFastADBClicks")
	;GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	; Chalicucu & demen: switch CoC Acc GUI
	Local $x = 20, $y = 291
	GUICtrlCreateGroup(GetTranslated(636,2, "Switch CoC Accounts"), $x - 20, $y - 20, 440, 90)
		$chkSwitchAcc = GUICtrlCreateCheckbox("Enable Switch Account", $x - 10, $y - 5, -1, -1)
			$txtTip = "Switch to another account & profile when camp is less than 85%" & @CRLF & _
			          "This function supports maximum 8 CoC accounts & 8 Bot profiles" & @CRLF & _
			          "Make sure to align the accounts with profiles in listing order"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSwitchAcc")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
		$lbMapHelpAccPro = GUICtrlCreateLabel("Mapped Acc - Profile:", $x + 100, $y - 20, 130, 20)
			GUICtrlSetColor(-1, $COLOR_BLUE)
	    $lbMapHelp = GUICtrlCreateLabel("", $x + 201, $y - 20, 190, 30)
			GUICtrlSetColor(-1, $COLOR_BLUE)
		$lbTotalCoCAcc = GUICtrlCreateLabel("Total CoC Accounts:", $x + 138, $y, 100, 20)
		$txtTotalCoCAcc = GUICtrlCreateInput("0", $x + 240, $y, 18, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_AUTOHSCROLL))
			GUICtrlSetLimit(-1, 1)
			$txtTip = "Number of Google Accounts on emulator" & @CRLF & _
					  "Supporting maximum 8 Accounts."
			GUICtrlSetTip(-1,$txtTip)
		$lbActiveCoCAcc = GUICtrlCreateLabel("Active Accounts:", $x + 285, $y, 90, 20)
		$txtActiveCoCAcc = GUICtrlCreateInput("0", $x + 370, $y, 18, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_AUTOHSCROLL))
			GUICtrlSetLimit(-1, 1)
			$txtTip = "Number of Google Accounts that you set for botting."
			GUICtrlSetTip(-1,$txtTip)
		$lbAccBottingOrder = GUICtrlCreateLabel("CoC Accounts Botting order:", $x - 10, $y + 25, 135, 20)
		$txtAccBottingOrder = GUICtrlCreateInput("12345678", $x + 138, $y + 22, 70, 18,  BitOR($GUI_SS_DEFAULT_INPUT, $SS_LEFT, $ES_AUTOHSCROLL))
			$txtTip = "Input the desired order of switching CoC Accounts."
			GUICtrlSetTip(-1,$txtTip)
		$lbProfileIdxOrder = GUICtrlCreateLabel("BOT Profile Indexs order:", $x + 215, $y + 25, 130, 20)
		$txtProfileIdxOrder = GUICtrlCreateInput("12345678", $x + 340, $y + 22, 70, 18,  BitOR($GUI_SS_DEFAULT_INPUT, $SS_LEFT, $ES_AUTOHSCROLL))
			GUICtrlSetLimit(-1, 8)
			$txtTip = "Input the order of Profiles to align with CoC Accounts order" & @CRLF & _
					  "Supporting maximum 8 Profiles"
			GUICtrlSetTip(-1,$txtTip)
		$chkAtkPln = GUICtrlCreateCheckbox("Check attack plan", $x - 10, $y + 45, -1, -1)
			$txtTip = "Enable/Disable attack plan"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "chkAtkPln")
		$lbSwitchMode = GUICtrlCreateLabel("Switching Mode", $x + 220, $y + 48, 130, 20)
		$cmbSwitchMode = GUICtrlCreateCombo("", $x + 305, $y + 46, 90, 20, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "Choose switching mode for play list")
			GUICtrlSetData(-1, "Shortest Training" & "|" & "Ordered play list" & "|" & "Random")
			GUICtrlSetOnEvent(-1, "cmbSwitchMode")
			GUICtrlSetState (-1, $GUI_ENABLE)
		$chkAccRelax = GUICtrlCreateCheckbox("Attack relax together", $x + 100, $y + 45, -1, -1)
			$txtTip = "If attack is not planned for current profile" & @CRLF & _
			          "Then bot stop emulator and relax!"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "chkAccRelaxTogether")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

Global $LastControlToHideMOD = GUICtrlCreateDummy()
Global $iPrevState[$LastControlToHideMOD + 1]

