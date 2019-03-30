; v1.1 (2018-7-19)
; https://github.com/tmplinshi/ExcelToArray

ExcelToList(FileName, nSheet := 1, last_row := "", last_column := ""){
	return ExcelToArrayClass.DoIt(FileName, nSheet, last_row, last_column)
}

class ExcelToArrayClass{
	DoIt(FileName, nSheet := 1, last_row := "", last_column := ""){
		if !FileExist(FileName)
			throw,_Ex.NoExistFile
		
		ListfeArr := this.GetListfeArrFromXlFile(FileName, nSheet, last_row, last_column)
		ret := this.ListfeArr_To_AHKArr(ListfeArr)
		return ret
	}

	GetListfeArrFromXlFile(FileName, nSheet := 1, last_row := "", last_column := ""){
		fPath := this.GetFullPath(FileName),wb:=xlObj:=""

		if this.IsFileInUse(fPath) {
			try wb := this.GetWorkbook(fpath)
		}
		if !wb {
			xlObj := ComObjCreate("Excel.Application")
			xlObj.Workbooks.Open(fPath)
			wb := xlObj.ActiveWorkbook
		}

		ListfeArr := this.GetListfeArr(wb, nSheet, last_row, last_column)

		xlObj.Quit

		return ListfeArr
	}

	GetWorkbook(fPath){
		xls := ComObjActive("Excel.Application")

		Loop, % xls.WorkBooks.Count
		{
			if ( xls.WorkBooks(A_Index).FullName = fPath )
			Return xls.WorkBooks(A_Index)
		}
	}

	ListfeArr_To_AHKArr(ListfeArr){
		ret := []

		rowCount := ListfeArr.MaxIndex(1)
		colCount := ListfeArr.MaxIndex(2)

		Loop, % rowCount {
			row := A_Index

			arr := []
			Loop, % colCount {
				arr.push( ListfeArr[row, A_Index] )
			}
			ret.push(arr)
		}

		return ret
	}

	GetListfeArr(oWorkbook, nSheet := 1, last_row := "", last_column := ""){
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

		return ListfeArr := sheet.Range(cell_begin, cell_end).FormulaR1C1
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