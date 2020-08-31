# TextFile Class

1.  性质：实例类
2.	开发目的：用于操作文本文件

默认编码为`UTF-8`

## 域 Fields

Encoding := "UTF-8"

## 方法 Methods

### __New(aPathObj)

- aPathObj - 被操作对象的Path对象

### get()

获取文本

### Set(aText)

写入文本

### replace(SearchText,ReplaceText, Limit := -1)

替换文本