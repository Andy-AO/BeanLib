**对任意对象添加 读/写/调用 保护:**

让不存在的值不能被读写，不存在的方法，不能被调用

- Call 不存在的方法 	`throw Exception(_EX.NoExistMethod)`
- Set/Get 不存在的值	`throw Exception(_EX.NoExistValue)`

```autohotkey
Protect(Obj)
```

### 参数 Parameters: 

- Obj - 任意对象

### 返回 Returns: 
null
### 抛出异常 Throws: 
- type.afObj(Obj)
### 示例 Example
```autohotkey
;给任意对象添加保护

_EX.t ;没有保护前，不会有任何警告
protect(_EX)
_EX.t  ;保护之后抛出异常

```

```autohotkey
;给任意类的构造器添加保护，这样之后，类生成的对象都会有保护

Obj:=new cl()

;均触发了保护
Obj.set:=""
Obj.Call()
Obj.get

;调用已存在的值，均不会触发保护
Obj.set1:="x"
Obj.Call1()
Obj.get1

return

Class cl{

get1:="get1"
set1:="set1"

call1(){
	return "call1"
}

__New(){
	protect(this) ;this返回前，给其添加保护
	return this
}

}
```