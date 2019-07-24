# HotString Class

1.  实例类
2.  全面接管HotString，以便于实现自动化提示等等等，高度自定义的内容。
    底部有自动化效果图，要注意的是，左侧的悬浮窗并没有包括在这个类中，提供数据(有序的 String-HotString 关联数组)的机制，在`HotStringMaps` 这个类中。

## 方法 Method

### isHotString(Obj)：判断一个对象是不是HotString类的实例

### create(Trigger,behavior,Remarks,Premise)：注册热键并返回HotString对象

Trigger： Str  触发器字符串，例如"::sm"

behavior : Func 触发之后的行为

Remarks ： Str 备注

Premise ：Func  语境约束。与 #if 的效果一样




![](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/20190709100419.png)

```autohotkey
HotStringMaps.List := [SciTE,FileLocator,TotalControl]

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

HotStringMaps