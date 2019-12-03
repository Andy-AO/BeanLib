# ObservableMap Class

1.  性质：实例类
2.	开发目的：带有监听器的 Map，类似 JavaFX 中的 ObservableMap

为了与已有的「关联数组」做出明确区分，ObservableMap 对 __Set() 做出限制，除了写入 "Field" (初始化时)之外，任何的写入都是不被允许的。

另外，这个和「关联数组」是不同的，获取数据用 get()，加入不是用 push()，而是用 put()，删除依然是 remove()，新增了 clear() 清除所有内容。

## 域 Field

### Field

为避开对 __Set() 做出限制，而设置的变量。

### Change

内部类，用于传递信息给 Listener

#### __New(aObservableMap,aRemoved,aRemovedMap,aAdded,aAddedMap)

aObservableMap - ObservableMap本身

aRemoved - 是否移除了 `Key-Vaule` 

aRemovedMap - 移除的 subMap

aAdded - 是否添加了 `Key-Vaule` 

aAddedMap- 添加的 subMap

#### getMap()

获取 Change 所属的 ObservableMap

#### wasRemoved()

Change 是否为移除

#### wasAdded()

Change 是否为添加

#### getValueRemoved()

获取移除的 subMap

#### getValueAdded()

获取添加的 subMap

#### size()

获取 Map 中元素的数量

## 方法 Method
### __New(aMap:="")

#### 参数 Parameters: 

- aMap - 生成ObservableMap的初始Map

#### 返回 Returns: 

ObservableMap
### put(aKeyValue*)
放入 `key-value` 对

#### 参数 Parameters: 

- aKeyValue* ：被添加的 `key-value` 对

#### 返回 Returns: 

null
### remove(aKey*)

批量移除 `key-value` 对

#### 参数 Parameters: 

- aKey* ：被移除的 `Key` 列表

#### 返回 Returns: 

null
### clear()

清除所有`key-value` 对

#### 参数 Parameters: 

#### 返回 Returns: 

null
### get(aKey)

根据 `key` 获取某个 `value`

#### 参数 Parameters: 

- 需要获取的 `value` 对应的 `key` 

#### 返回 Returns: 

Obj
### addListener(aMethod)

#### 参数 Parameters: 

- 添加监听器
  监听器只有一个 `aChange` 参数

#### 返回 Returns: 

null

## 示例 Example

```AutoHotKey
map := new ObservableMap(_Container.LetterAndNumberMap)
map.addListener(new Method(Listeners.print,Listeners))

LogPrintln(map.get("A"),A_LineFile  "("  A_LineNumber  ")"  " : " "map.get(""A"") >>> `r`n")

map.remove("A","B")
map.remove("C")
map.put("W","18")
map.put("T","20","X","24")
map.clear()


map := new ObservableMap(_Container.LetterAndNumberMap)
map.addListener(new Method(Listeners.print,Listeners))


map["A"]
;~ map["A"] := "1"
map.no()
```



```AutoHotKey
D:\AHKs\Dev\TPDD_ObservableMap.ahk(28) : map.get("A") >>> 
1
减少:
D:\AHKs\Dev\TPDD_ObservableMap.ahk(62) : aChange.getValueRemoved() >>> 
{A:1,B:2}
目前:
D:\AHKs\Dev\TPDD_ObservableMap.ahk(65) : aChange.getMap() >>> 
{__Instance:ObservableMap,C:3,D:4,E:5,F:6,G:7,H:8,I:9,J:0}
减少:
D:\AHKs\Dev\TPDD_ObservableMap.ahk(62) : aChange.getValueRemoved() >>> 
{C:3}
目前:
D:\AHKs\Dev\TPDD_ObservableMap.ahk(65) : aChange.getMap() >>> 
{__Instance:ObservableMap,D:4,E:5,F:6,G:7,H:8,I:9,J:0}
增加:
D:\AHKs\Dev\TPDD_ObservableMap.ahk(58) : aChange.getValueAdded() >>> 
{W:18}
目前:
D:\AHKs\Dev\TPDD_ObservableMap.ahk(65) : aChange.getMap() >>> 
{__Instance:ObservableMap,D:4,E:5,F:6,G:7,H:8,I:9,J:0,W:18}
增加:
D:\AHKs\Dev\TPDD_ObservableMap.ahk(58) : aChange.getValueAdded() >>> 
{T:20,X:24}
目前:
D:\AHKs\Dev\TPDD_ObservableMap.ahk(65) : aChange.getMap() >>> 
{__Instance:ObservableMap,D:4,E:5,F:6,G:7,H:8,I:9,J:0,T:20,W:18,X:24}
减少:
D:\AHKs\Dev\TPDD_ObservableMap.ahk(62) : aChange.getValueRemoved() >>> 
{D:4,E:5,F:6,G:7,H:8,I:9,J:0,T:20,W:18,X:24}
目前:
D:\AHKs\Dev\TPDD_ObservableMap.ahk(65) : aChange.getMap() >>> 
{__Instance:ObservableMap,}
```

