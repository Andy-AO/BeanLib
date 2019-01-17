# Everthing Class

使用 Everthing 进行搜索

- Everthing 是一款非常出名的搜索工具，搜索速度极快
- 使用条件 1.根目录或指定目录下存在 Everthing的DLL  2.Everthing程序正在运行
- 提取自 RunAny - 一劳永逸的快速启动 @hui-Zz

## 域 Field 

- static RNameSA:=["Chris","Joe","Marcy","Chris","Elina","Timothy","Joe","Joe","Joe"]
- static LetterSA:=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
- static NumberSA:=["1","2","3","4","5","6","7","8","9","0"]
- static TheSA1:=["SA1"]
- static TheSA2:=["SA2"]
- static ObjSA:=[SA1,SA2,SA2,SA2,SA1,SA1]

## 内部类

+ Class AA,BB,CC,DD
  + 连续继承的四个内部类：CC继承DD，BB继承CC，AA继承BB
  + 主要目的在于测试 Analyze()等，类继承关系分析函数。

