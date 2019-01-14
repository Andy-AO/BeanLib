; v1.1 (2018-7-19)
; https://github.com/tmplinshi/ExcelToArray

ExcelToArray(FileName, nSheet := 1, last_row := "", last_column := ""){
	return ExcelToArray.DoIt(FileName, nSheet, last_row, last_column)
}

class ExcelToArray{
	DoIt(FileName, nSheet := 1, last_row := "", last_column := ""){
		if !FileExist(FileName)
			throw,_Ex.NoExistFile
		
		safeArr := this.GetSafeArrFromXlFile(FileName, nSheet, last_row, last_column)
		ret := this.SafeArr_To_AHKArr(safeArr)
		return ret
	}

	GetSafeArrFromXlFile(FileName, nSheet := 1, last_row := "", last_column := ""){
		fPath := this.GetFullPath(FileName),wb:=xlObj:=""

		if this.IsFileInUse(fPath) {
			try wb := this.GetWorkbook(fpath)
		}
		if !wb {
			xlObj := ComObjCreate("Excel.Application")
			xlObj.Workbooks.Open(fPath)
			wb := xlObj.ActiveWorkbook
		}

		safeArr := this.GetSafeArr(wb, nSheet, last_row, last_column)

		xlObj.Quit

		return safeArr
	}

	GetWorkbook(fPath){
		xls := ComObjActive("Excel.Application")

		Loop, % xls.WorkBooks.Count
		{
			if ( xls.WorkBooks(A_Index).FullName = fPath )
			Return xls.WorkBooks(A_Index)
		}
	}

	SafeArr_To_AHKArr(SafeArr){
		ret := []

		rowCount := SafeArr.MaxIndex(1)
		colCount := SafeArr.MaxIndex(2)

		Loop, % rowCount {
			row := A_Index

			arr := []
			Loop, % colCount {
				arr.push( SafeArr[row, A_Index] )
			}
			ret.push(arr)
		}

		return ret
	}

	GetSafeArr(oWorkbook, nSheet := 1, last_row := "", last_column := ""){
		sheet := oWorkbook.Sheets(nSheet)

		if last_row && last_column
			lastCell := {row: last_row, column: last_column}
		else
		{
			lastCell := this.xlFindLastCell(oWorkbook, nSheet)
			if last_row
				lastCell.row := last_row
			else if last_column
				lastCell.column := last_column
		}
		cell_begin := sheet.cells(1, 1)
		cell_end   := sheet.cells(lastCell.row, lastCell.column)

		return safeArr := sheet.Range(cell_begin, cell_end).FormulaR1C1
	}

	GetFullPath(FileName){
		Loop, % FileName
			return A_LoopFileLongPath
	}

	IsFileInUse(FileName){
		return FileExist(FileName) && !FileOpen(FileName, "rw")
	}

	xlFindLastCell(oWorkbook, sheet := 1){
		static xlByRows    := 1
		     , xlByColumns := 2
		     , xlPrevious  := 2

		lastRow := oWorkbook.Sheets(sheet).Cells.Find("*", , , , xlByRows   , xlPrevious).Row
		lastCol := oWorkbook.Sheets(sheet).Cells.Find("*", , , , xlByColumns, xlPrevious).Column

		return {row: lastRow, column: lastCol}
	}
}