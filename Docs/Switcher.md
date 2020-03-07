# Switcher Class

1.  性质：静态类、实例类
2.	开发目的：为软件提供切换快捷键

## 域 Field

### static Options := "Max"

Run命令的Options，默认是"Max"，也就是以最大化窗口形式运行。

## 方法 Method

### switch(aWinTitle,aPathOrFuncObj)

**切换窗口(软件)**

算法如下：

如果窗口存在{

​	如果窗口处于激活状态

​		最小化

​	否则，如果窗口未处于激活状态

​		激活

}

否则，如果窗口不存在{

​	以最大化窗口形式运行软件

}

返回 winExist(aWinTitle)

#### 参数 Parameters: 

- aWinTitle - 窗口的title
- aPathOrFuncObj - 路径或者方法
  如果是路径，则以最大化形式Run；否则，如果是方法，则直接运行方法

#### 返回 Returns: 

如果是路径，则以最大化形式Run命令的 OutputVarPID 变量；否则，如果是方法，则返回方法的结果。

#### 抛出异常 Throws: 

- null

#### 示例 Example

```autohotkey
		Switcher.switch("ahk_exe SourceTree.exe","C:\Users\Administrator\AppData\Local\SourceTree\app-3.1.2\SourceTree.exe")
```

### toggle(aWinTitle)

**切换窗口(软件)**

算法如下：

如果窗口存在{

​	如果窗口处于激活状态

​		最小化

​	否则，如果窗口未处于激活状态

​		激活

}

返回 winExist(aWinTitle)

#### 参数 Parameters: 

- aWinTitle - 窗口的title

#### 返回 Returns: 

null

#### 抛出异常 Throws: 

- null

#### 示例 Example

```autohotkey
		Switcher.toggle("ahk_exe SourceTree.exe","C:\Users\Administrator\AppData\Local\SourceTree\app-3.1.2\SourceTree.exe")
```

