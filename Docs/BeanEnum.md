# BeanEnum Class

1.  性质：实例类
2.	开发目的：用于自定义元函数_NewEnum

## 方法 Method

### __New(aMap)

**创建一个自定义的_NewEnum枚举器**

#### 参数 Parameters: 

- aMap - 需要被枚举返回的Map

#### 返回 Returns: 

_NewEnum

#### 示例 Example

适用于一切与自定义枚举相关的内容，最常见的就是对枚举操作隐藏某些数据域。

在 Method Class 的设计中，有域 FuncThis，但是当 Method 实例被放入 aFuncThi s本身时，会因为枚举原因造成死循环，所以通过自定义枚举器，让枚举器不返回域 FuncThis，从而解决了这一问题。

```autohotkey
class Method{
	func := Object()
	funcThis := Object()
	bindParas := Object()
	
......

	_NewEnum(){
		return new BeanEnum(Object("func",this.func,"bindParas",this.bindParas))
	}
} ;---------class Method End

```

