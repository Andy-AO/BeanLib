**批量移动文件:**

```autohotkey
bulkMoveFile(aPathList,DestPattern)
```

### 参数 Parameters: 

- aPathList - 文件路径数组

  不支持文件夹

- DestPattern - 目标路径

### 返回 Returns: 
- aPathList.length()

### 抛出异常 Throws: 
- _EX.MoveFailed
### 示例 Example
```autohotkey
	;把桌面上所有的pdf文件移动到相应的文件夹中
	Obj:=new Everything()

	thekey="D:\MyDesktop\" .PDF
	Obj.Setkey(thekey)
	Obj.Search()

	searchResultList:=Obj.getSearchResultList()
	DeBugDeepPrintln(searchResultList,"searchResultList >>> ")
	

	DestPattern:="D:\MyDesktop\A\"
	
	bulkMoveFile(searchResultList,DestPattern)
```