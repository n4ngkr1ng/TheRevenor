; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

$hGUI_NOTIFY = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_VILLAGE)
;GUISetBkColor($COLOR_WHITE, $hGUI_NOTIFY)

$hGUI_NOTIFY_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 30, $_GUI_MAIN_HEIGHT - 255 - 30, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))
;$hGUI_NOTIFY_TAB_ITEM1 = GUICtrlCreateTabItem("How")
;	Local $x = 25, $y = 45
;GUICtrlCreateTabItem("")

$hGUI_NOTIFY_TAB_ITEM1 = GUICtrlCreateTabItem(GetTranslated(600,18,"PushBullet/Telegram"))
	Global $grpPushBullet, $chkPBenabled,$chkPBenabled2,$TelegramTokenValue,$chat_id2,$TelegramEnabled,$chkPBRemote,$chkDeleteAllPBPushes,$btnDeletePBmessages,$chkDeleteOldPBPushes,$cmbHoursPushBullet
	Global $PushBulletTokenValue, $OrigPushBullet, $chkAlertPBVMFound, $chkAlertPBLastRaid, $chkAlertPBLastRaidTxt, $chkAlertPBCampFull
	Global $chkAlertPBWallUpgrade, $chkAlertPBOOS, $chkAlertPBVBreak, $chkAlertPBVillage, $chkAlertPBLastAttack
	Global $chkAlertPBOtherDevice

	Local $x = 25, $y = 45
		$grpPushBullet = GUICtrlCreateGroup(GetTranslated(619, 2, "PushBullet && Telegram Alert"), $x - 20, $y - 20, 430, 334)
		$x -= 10
		;Modified by CDudz
		$picPushBullet = GUICtrlCreateIcon ($pIconLib, $eIcnPushBullet, $x, $y - 1, 26, 24)
		$picTelegram = GUICtrlCreateIcon ($pIconLib, $eIcnTelegram, $x, $y + 23, 25, 25)

		$chkPBenabled = GUICtrlCreateCheckbox(GetTranslated(619, 3, "Enable Pushbullet"), $x + 40, $y)
			GUICtrlSetOnEvent(-1, "chkPBenabled")
			GUICtrlSetTip(-1, GetTranslated(619, 4, "Enable PushBullet notifications"))

		$chkPBenabled2 = GUICtrlCreateCheckbox("Enable Telegram", $x + 40, $y +21)
	    GUICtrlSetOnEvent(-1, "chkPBenabled2")
	    GUICtrlSetTip(-1, "Enable Telegram notifications")
		$y += 41
		$chkPBRemote = GUICtrlCreateCheckbox(GetTranslated(619, 5, "Remote Control"), $x + 40, $y)
			GUICtrlSetTip(-1, GetTranslated(619, 6, "Enables PushBullet Remote function"))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y = 45
		$chkDeleteAllPBPushes = GUICtrlCreateCheckbox(GetTranslated(619,7, "Delete Msg on Start"), $x + 160, $y)
			GUICtrlSetTip(-1, GetTranslated(619, 8, "It will delete all previous push notification when you start bot"))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$btnDeletePBmessages = GUICtrlCreateButton(GetTranslated(619, 9, "Delete all Msg now"), $x + 300, $y, 100, 20)
			GUICtrlSetTip(-1, GetTranslated(619, 10, "Click here to delete all Pushbullet messages."))
			GUICtrlSetOnEvent(-1, "btnDeletePBMessages")
			IF $btnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 22
		$chkDeleteOldPBPushes = GUICtrlCreateCheckbox(GetTranslated(619, 11, "Delete Msg older than"), $x + 160, $y)
			GUICtrlSetTip(-1, GetTranslated(619, 12, "Delete all previous push notification older than specified hour"))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkDeleteOldPBPushes")
		$cmbHoursPushBullet = GUICtrlCreateCombo("", $x + 300, $y, 100, 35, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, GetTranslated(619, 13, "Set the interval for messages to be deleted."))
			$sTxtHours = GetTranslated(603,14, "Hours")
			GUICtrlSetData(-1, "1 " & GetTranslated(603, 15, "Hour") &"|2 " & $sTxtHours & "|3 " & $sTxtHours & "|4 " & $sTxtHours & "|5 " & $sTxtHours & "|6 " & $sTxtHours & "|7 " & $sTxtHours & "|8 " &$sTxtHours & "|9 " & $sTxtHours & "|10 " & $sTxtHours & "|11 " & $sTxtHours & "|12 " & $sTxtHours & "|13 " & $sTxtHours & "|14 " & $sTxtHours & "|15 " & $sTxtHours & "|16 " & $sTxtHours & "|17 " & $sTxtHours & "|18 " & $sTxtHours & "|19 " & $sTxtHours & "|20 " & $sTxtHours & "|21 " & $sTxtHours & "|22 " & $sTxtHours & "|23 " & $sTxtHours & "|24 " & $sTxtHours )
			_GUICtrlComboBox_SetCurSel(-1,0)
			GUICtrlSetState (-1, $GUI_DISABLE)

		$y += 45
		$lblPushBulletTokenValue = GUICtrlCreateLabel(GetTranslated(619, 14, "Access Token") & ":", $x, $y, -1, -1, $SS_RIGHT)
		$PushBulletTokenValue = GUICtrlCreateInput("", $x + 120, $y - 3, 280, 19)
			GUICtrlSetTip(-1, GetTranslated(619, 15, "You need a Token to use PushBullet notifications. Get a token from PushBullet.com"))
			GUICtrlSetState(-1, $GUI_DISABLE)
		;Modified by CDudz
		$lblTelegramTokenValue = GUICtrlCreateLabel(GetTranslated(619, 14, "Access Token") & ":", $x, $y + 23, -1, -1, $SS_RIGHT)
		$TelegramTokenValue = GUICtrlCreateInput("", $x + 85, $y +22, 315, 19)
		GUICtrlSetState(-1, $GUI_DISABLE)

		$y += 30
		$lblOrigPushBullet = GUICtrlCreateLabel(GetTranslated(619, 16, "Origin") & ":", $x, $y + 25, -1, -1, $SS_RIGHT)
			$txtTip = GetTranslated(619,17, "Your Profile/Village name - Set this on the Misc Tab under Profiles.")
			GUICtrlSetTip(-1, $txtTip)
		$OrigPushBullet = GUICtrlCreateInput("", $x + 40, $y + 20, 140, 19, $ES_CENTER)
			GUICtrlSetColor(-1, 0xB40404)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		;$y += 25
		$y += 45
		;$lblNotifyPBWhen = GUICtrlCreateLabel(GetTranslated(619, 18, "Send a PushBullet message for these options") & ":", $x, $y, -1, -1, $SS_RIGHT)
		$lblNotifyPBWhen = GUICtrlCreateGroup(GetTranslated(619, 18, "Send a PushBullet message for these options") & ":", $x, $y, 410, 105, $SS_RIGHT)
		$y += 15
		$chkAlertPBVMFound = GUICtrlCreateCheckbox(GetTranslated(619, 19, "Match Found"), $x + 10, $y)
			GUICtrlSetTip(-1, GetTranslated(619, 20, "Send the amount of available loot when bot finds a village to attack."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBLastRaid = GUICtrlCreateCheckbox(GetTranslated(619, 21, "Last raid as image"), $x + 100, $y)
			GUICtrlSetTip(-1, GetTranslated(619, 22, "Send the last raid screenshot."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBLastRaidTxt = GUICtrlCreateCheckbox(GetTranslated(619, 23, "Last raid as Text"), $x + 210, $y, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetTip(-1, GetTranslated(619, 24, "Send the last raid results as text."))
		$chkAlertPBCampFull = GUICtrlCreateCheckbox(GetTranslated(619, 25, "Army Camp Full"), $x + 315, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619, 26, "Sent an Alert when your Army Camp is full."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 20
		$chkAlertPBWallUpgrade = GUICtrlCreateCheckbox(GetTranslated(619, 27, "Wall upgrade"), $x + 10, $y, -1, -1)
			 GUICtrlSetTip(-1, GetTranslated(619, 28, "Send info about wall upgrades."))
			 GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBOOS = GUICtrlCreateCheckbox(GetTranslated(619, 29, "Error: Out Of Sync"), $x + 100, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619, 30, "Send an Alert when you get the Error: Client and Server out of sync"))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBVBreak = GUICtrlCreateCheckbox(GetTranslated(619, 31, "Take a break"), $x + 210, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619, 32, "Send an Alert when you have been playing for too long and your villagers need to rest."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		; Added by CDudz
		$chkAlertBuilderIdle = GUICtrlCreateCheckbox("Builder Idle", $x + 315, $y, -1, -1)
		GUICtrlSetTip(-1, "Send an Alert when at least one builder is idle.")
		GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 20
		$chkAlertPBVillage = GUICtrlCreateCheckbox(GetTranslated(619, 33, "Village Report"), $x + 10, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619, 34, "Send a Village Report."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBLastAttack = GUICtrlCreateCheckbox(GetTranslated(619,35, "Alert Last Attack"), $x + 100, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619, 36, "Send info about the Last Attack."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAlertPBOtherDevice = GUICtrlCreateCheckbox(GetTranslated(619, 37, "Another device connected"), $x + 210, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(619, 38, "Send an Alert when your village is connected to from another device."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateGroup("", -99, -99, 1, 1)

;Periodic village stats and Searchcount Nofications.
$y += 20
		$chkSearchNotifyCount = GUICtrlCreateCheckbox("Searchcount.  Increment:", $x + 10, $y, -1, -1)
		GUICtrlSetTip(-1, "Searchcount Notification every ____ searches.  If getting pushbullet errors or acting funny, increase increment.  ")
		GUICtrlSetState(-1, $GUI_DISABLE)
		$txtSearchNotifyCount = GUICtrlCreateInput("25", $x + 150, $y + 2, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		$txtTip = "Searchcount Notification every ____ searches."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetLimit(-1, 3)
		GUICtrlSetOnEvent(-1, "txtSearchNotifyCount")
		GUICtrlSetState(-1, $GUI_DISABLE)
		$chkVillageStatIncrement = GUICtrlCreateCheckbox("Stats.  Increment:", $x + 210, $y, -1, -1)
		GUICtrlSetTip(-1, "Send Village Stats every ____ attacks.")
		GUICtrlSetState(-1, $GUI_DISABLE)
		$txtVillageStatIncrement = GUICtrlCreateInput("5", $x + 313, $y + 2, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		$txtTip = "No. of attacks between stat updates."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetLimit(-1, 3)
		GUICtrlSetOnEvent(-1, "txtVillageStatIncrement")
		GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateTabItem("")
$hGUI_NOTIFY_TAB_ITEM2 = GUICtrlCreateTabItem(GetTranslated(600, 19, "Instructions"))
	Local $x = 25, $y = 45
		$lblgrppushbullet = GUICtrlCreateGroup(GetTranslated(620, 0, "Remote Control Functions"), $x - 20, $y - 20, 430, 334)
			$x -= 10
			$lblPBdesc = GUICtrlCreateLabel(GetTranslated(620, 1, "BOT") & " " & GetTranslated(620,14,"HELP") & GetTranslated(620,2, " - send this help message") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(620,15,"DELETE") & GetTranslated(620,3, " - delete all your previous messages") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,16,"RESTART") & GetTranslated(620,4, " - restart the bot named <Village Name> and Android Emulator") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,17,"STOP") & GetTranslated(620,5, " - stop the bot named <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,18,"PAUSE") & GetTranslated(620,6, " - pause the bot named <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,19,"RESUME") & GetTranslated(620,7, " - resume the bot named <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,20,"STATS") & GetTranslated(620,8, " - send Village Statistics of <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,21,"LOG") & GetTranslated(620,9, " - send the current log file of <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,22,"LASTRAID") & GetTranslated(620,10, " - send the last raid loot screenshot of <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,23,"LASTRAIDTXT") & GetTranslated(620,11, " - send the last raid loot values of <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " <" & GetTranslated(619,16, -1) & "> " & GetTranslated(620,24,"SCREENSHOT") & GetTranslated(620,12, " - send a screenshot of <Village Name>") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,1,"ACC <Target1><~><Target8>") & GetTranslated(638,11, " - reorder COC accounts") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,2,"PRO <Pro1><~><Pro8>") & GetTranslated(638,12, " - reorder bot profiles") & @CRLF & _
			    GetTranslated(620,1, -1) & " " & GetTranslated(638,3,"GETORDER") & GetTranslated(638,13, " - get current CoC account and bot profile") & @CRLF & _
			    GetTranslated(620,1, -1) & " " & GetTranslated(638,4,"STOPSTART") & GetTranslated(638,14, " - stop then start bot again") & @CRLF & _
			    GetTranslated(620,1, -1) & " " & GetTranslated(638,5,"ALLPRO <Pro1><~><Pro8>") & GetTranslated(638,15, " - set up profiles correspond to all exists accounts") & @CRLF & _
			    GetTranslated(620,1, -1) & " " & GetTranslated(638,6,"MAP <Pro1>-<Pro2>") & GetTranslated(638,16, " - set up profile for only one account") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,7,"ADD n") & GetTranslated(638,17, " - add account number n to playing list") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,8,"REM n") & GetTranslated(638,18, " - remove account number n from playing list") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,9,"HIDE") & GetTranslated(638,19, " - hide android emulator") & @CRLF & _
				GetTranslated(620,1, -1) & " " & GetTranslated(638,10,"ATKP 1/0") & GetTranslated(638,20, " - 1-enable/0-disable attack plan"), $x, $y - 5, -1, -1, $SS_LEFT)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")


;GUISetState()
