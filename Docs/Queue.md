# Queue Class

1.  性质：实例类
2.	开发目的：通过Array编写的先进先出(FIFO)的数据结构,常被称为'队列'.

 From：[A Queue in AutoHotkey? - Ask for Help - AutoHotkey Community](https://autohotkey.com/board/topic/94062-a-queue-in-autohotkey/)

## 域 Fields

null

## 示例 Examples
```AutoHotKey
q := new queue()
q.push("1")
q.push("2")
q.push("3")
msgbox % "pop: " q.pop() "`nnewsize: " q.size()  ;pop = 1, newsize = 2  {2,3}
q.push("4")
msgbox % "pop: " q.pop() "`nnewsize: " q.size()  ;pop = 2, newsize = 2  {3,4}
msgbox % "pop: " q.pop() "`nnewsize: " q.size()  ;pop = 3, newsize = 1  {4}
q.push("5")
msgbox % "pop: " q.pop() "`nnewsize: " q.size()  ;pop = 4, newsize = 1  {5}
msgbox % "pop: " q.pop() "`nnewsize: " q.size()  ;pop = 5, newsize = 0  {}
msgbox % "pop: " q.pop() "`nnewsize: " q.size()  ;pop = "", newsize = 0  {}
```

## 方法 Methods

### push(item)

放入队列

### Pop()

从队列尾部中取出元素并删除

### size()

获取队列中的元素数