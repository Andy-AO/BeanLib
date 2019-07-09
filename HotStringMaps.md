# Type Class

1.  静态类
2.	开发目的：接收并组织 `HotString` 对象，提供 有序的 String-HotString 关联数组。

## 域 

List 放置 String-HotString 关联数组 。

语境约束的生效与否，取决于注册的先后顺序，所以安排注册的顺序是有必要的。

如果有控制顺序和生成 String-HotString 关联数组的需求，生成 HotString 对象之后，请将其加入该数组。

## 方法 Method

### ExtractAndMerge()  ：根据 List 生成 String-HotString 关联数组

![](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/20190709100419.png)

```autohotkey



​```autohotkey
HotStringMaps.List[2]["SearchInAHKWithOutTTD"] := HotString.create(Trigger := "::;ahknd"
,FuncObj:=HotStringMaps.List[2].OpenInTheTab.bind("ahk","H:\MyLibrary\FileLocator搜索条件\搜索非TDD的AHK内容.srf")
,Remarks:=	"搜索非TDD的AHK内容"
,HotStringMaps.List[2].when)

HotStringMaps.List[2]["SearchInAHK"] := HotString.create(Trigger := "::;ahk"
,FuncObj:=HotStringMaps.List[2].OpenInTheTab.bind("ahknd","H:\MyLibrary\FileLocator搜索条件\搜索AHK文件中的内容.srf")
,Remarks:=	"搜索AHK文件中的内容"
,HotStringMaps.List[2].when)


HotStringMaps.ExtractAndMerge()
```

## 高度相关类

HotString

