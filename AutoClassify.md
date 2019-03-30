# AutoClassify Class

文件自动分类(依赖 Everything Class)

## 域 Field 

- sSearchCriteria - 搜索关键词字符串

- sDestPattern - 文件存放目录

- searchResultList - 用于存放文件路径的数组

- EverthingObj - 用于执行搜索的Everything对象

- sCheckIntervalMin:= 执行搜索的间隔(分钟)

  默认 0.5 分钟

## 方法 Method

### __New(sSearchCriteria,sDestPattern)

构造对象

### BuildSearchObj()

建立EverthingObj 

### Search()

搜索文件

### SearchAndRemove()

搜索并且移动文件到目标文件夹

### SetTimer(sCheckIntervalMin)

定时执行SearchAndRemove()

## 示例

```autohotkey
;电子书自动分类：每两分钟把电子书移动到对应文件夹
SearchCriteria="G:\MyDownload\" .mobi|.azw|.epub
DestPattern:="X:\MyLibrary"	

azwClassify:=new AutoClassify(SearchCriteria,DestPattern)
azwClassify.SearchAndRemove()
azwClassify.SetTimer(0.3)
```

