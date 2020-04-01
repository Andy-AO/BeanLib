
/*
说明:主要是对Acc-ComObj进行分析
*/

Class _Acc{
	Analyze(){
		ComObjError(False)
		oAcc := Acc_ObjectFromPoint(vChildId)
		LogPrintln(vChildId,A_LineFile  "("  A_LineNumber  ")"  " : " "vChildId >>> `r`n")
		vAccRoleNum := oAcc.accRole(vChildId)
		vAccRoleNumHex := Format("0x{:X}", vAccRoleNum)
		vAccStateNum := oAcc.accState(vChildId)
		vAccStateNumHex := Format("0x{:X}", vAccStateNum)
		oRect := Acc_Location(oAcc, vChildId)
		vAccName := oAcc.accName(vChildId)
		vAccValue := oAcc.accValue(vChildId)
		vAccRoleText := Acc_GetRoleText(oAcc.accRole(vChildId))
		vAccStateText := Acc_GetStateText(oAcc.accState(vChildId))
		vAccStateTextAll := JEE_AccGetStateTextAll(vAccStateNum)
		vAccAction := oAcc.accDefaultAction(vChildId)
		vAccFocus := oAcc.accFocus
		vAccSelection := JEE_AccSelection(oAcc)
		StrReplace(vAccSelection, ",",, vCount), vCount += 1
		vAccSelectionCount := (vAccSelection = "") ? 0 : vCount
		vAccChildCount := oAcc.accChildCount
		vAccLocation := Format("X{} Y{} W{} H{}", oRect.x, oRect.y, oRect.w, oRect.h)
		vAccDescription := oAcc.accDescription(vChildId)
		vAccKeyboard := oAcc.accKeyboardShortCut(vChildId)
		vAccHelp := oAcc.accHelp(vChildId)
		vAccHelpTopic := oAcc.accHelpTopic(vChildId)
		hWnd := Acc_WindowFromObject(oAcc)
		vAccPath := "--" ;not implemented
		oAcc := ""
		ComObjError(True)
	}
} ;Class _Acc End