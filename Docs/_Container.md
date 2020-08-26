# \_Container Class

1.  **静态类**
2.  主要包含对于容器(List和Map的统称)各种增强操作
4.  提供一些测试用对象
4.  **还有大量的方法没有被写成文档**，其中有一些很难复用，需要特殊处理。

## 域 Field 

- static LetterAndNumberMap := Object("A","1","B","2","C","3","D","4","E","5","F","6","G","7","H","8","I","9","J","0")

## 方法

### Contains(ListorMap,value)

**检查容器内是否包含某值:**


#### 参数 Parameters: 

- ListorMap - 容器
- value - 任意类型值

#### 返回 Returns: 
Boolean
#### 抛出异常 Throws: 
- null
#### 示例 Example
```autohotkey
Result1:=_Container.Contains(_List.LetterList,"A")
;true
Result2:=_Container.Contains(_List.LetterList,"0")
;false
```
