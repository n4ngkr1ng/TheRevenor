; #FUNCTION# ====================================================================================================================
; Name ..........: MinRemainTrainAcc() - Check which account has shortest remain train time
; Description ...: This file contens the Sequence that runs all MBR Bot
; Author ........: DEMEN (made for the Switch CoC Account mod of Chalicucu)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func SetCurTrainTime($TrainTime)
	If $iSwitchMode = 0 And $CommandStop <>  0 Then
		;SetLog("Set timer")
		$accTrainTime[$nCurAtkIdx] = $TrainTime
		$aTimerStart[$nCurAtkIdx] = TimerInit()
	EndIf
EndFunc   ;==> SetCurTrainTime

Func GetMinTrain()		; demen & chalicucu
	Local $lnTimerEnd, $minIdx
	Local $lRemTrainTime = $accTrainTime
	For $i = 0 To Ubound($accAttack) - 1
		$lnTimerEnd = Round(TimerDiff($aTimerStart[$i])/1000/60,2)		;elapse of training time of an account from last army checking - in minutes
		$lRemTrainTime[$i] = $accTrainTime[$i] - $lnTimerEnd		; remain train time
		SetLog("Account " & $accAttack[$i] & " remain " & $lRemTrainTime[$i] & " minute(s)")
	Next

	$minIdx = _ArrayMinIndex($lRemTrainTime, 1)			; 1 - compare numerically
	$accTrainTime[$minIdx] =  $lRemTrainTime[$minIdx]
	$aTimerStart[$minIdx] = TimerInit()		;set new point of timer (don't set for other accs, because of Round can make wrong time)
	Return $minIdx
EndFunc   ;==> GetMinTrain

Func ResetMinTrainMode()
	If $iSwitchMode = 0 Then
		SetLog("Playing list or mode changed. Reset mode as beginning...", $COLOR_RED)
		$iSwitchCnt = 0
		Redim $aTimerStart[1]
		$aTimerStart[0] = 0
		Redim $accTrainTime[1]
		$accTrainTime[0]= 0
		Redim $accDonate[1]
		$accDonate[0] = -1
		Redim $accAttack[1]
		$accAttack[0] = -1
		$nLastDonAcc = 0
		$nCurAtkIdx =0
	EndIf
EndFunc   ;==> ResetMinTrainMode

#cs
Func ResetTrainTimer() ; Run this function first and once to set the remain train timer of all Accounts. All set to 0
   $aActiveCoCAcc = StringSplit(IniRead($Profile,"switchcocacc", "order", "1"), "", $STR_NOCOUNT)	; making an array of active acount number, by reading from profile.ini
   $nActiveCoCAcc = UBound($aActiveCoCAcc)
   Setlog("Number of active CoC accounts is: " & $nActiveCoCAcc & " account(s).")
   Setlog("Account botting order is: "& _ArrayToString($aActiveCoCAcc))

   ReDim $aTimerStart[$nTotalCOCAcc]
   ReDim $aTimerEnd[$nTotalCOCAcc]
   ReDim $aInitialRemainTrainTime[$nTotalCOCAcc]
   ReDim $aUpdateRemainTrainTime[$nTotalCOCAcc]
   ReDim $aRemainTrainTime[$nActiveCoCAcc]
   For $i = 0 to $nTotalCOCAcc - 1
	  $aTimerStart[$i] = 0
	  $aTimerEnd[$i] = 0
	  $aInitialRemainTrainTime[$i] = 0
	  $aUpdateRemainTrainTime[$i] = 0
   Next
EndFunc

Func MinRemainTrainAcc()
   ; Check remain training time of all active accounts and return the minimum remain training time
   ; Suggest the account with shortest training time as the next account for switching to
   $aInitialRemainTrainTime[$nCurCOCAcc-1] = Round(getRemainingTraining(True,False),2) 	; remaintraintime of current account - in minutes
   $aTimerStart[$nCurCOCAcc-1] = TimerInit() 						; start counting elapse of training time of current account
   For $i = 0 to $nTotalCOCAcc - 1
	  If $aTimerStart[$i] <> 0 Then
		 $aTimerEnd[$i] = Round(TimerDiff($aTimerStart[$i])/1000/60,2) 			; counting elapse of training time of an account from last army checking - in minutes
		 $aUpdateRemainTrainTime[$i] = $aInitialRemainTrainTime[$i]-$aTimerEnd[$i] 	; updating remain train time of all accounts (active & inactive)
		 If $aUpdateRemainTrainTime[$i] > 0 Then
			Setlog("Account [" & $i+1 & "] will finish troop training in: " & $aUpdateRemainTrainTime[$i] & " minutes")
		 Else
			Setlog("Account [" & $i+1 & "] finished troop training : " & -$aUpdateRemainTrainTime[$i] & " minutes ago", $COLOR_RED)
		 EndIf
	  Else ; for accounts at first run or inactive accounts which have not been read their remain train time
		 Setlog("Account [" & $i+1 & "] has not been read its remain train time")
		 $aUpdateRemainTrainTime[$i] = 0
	  EndIf
   Next
   For $i = 0 To $nActiveCoCAcc - 1
	  $aRemainTrainTime[$i] = $aUpdateRemainTrainTime[$aActiveCoCAcc[$i]-1]
   Next ;	Remain train time of active accounts only
   Local $iMinIndex = _ArrayMinIndex($aRemainTrainTime)					; Index of the account that has the shortest remain train time (among the active accounts)
   $nNextCoCAcc = $aActiveCoCAcc[$iMinIndex]  						; Number of Account has the shortest remain train time (among all account)
   Setlog("Account [" & $nNextCoCAcc & "] is suggest to be the next account for switching", $COLOR_PURPLE)
   $nMinRemainTrain = _ArrayMin($aRemainTrainTime)
   checkMainScreen()
   Return $nNextCoCAcc-1
EndFunc
#ce
