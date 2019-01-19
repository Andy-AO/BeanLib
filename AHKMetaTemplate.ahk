
/*
AHK元编程模板 - @心如止水_Zen
(目前还无法支持 UniCode 字符,原因未知)
- 主要功能:完全控制 __Get __Set __Call , 实现类的高度自定义
- 小提示:是以"Test"这个类为例子搞的,到时候批量替换成自己的名字就行
- 关于Class:会创建两个最外层的类,一个是 Test 一个是 TestBase ,编程的三个方法也要创建类，但是为了节约外部命名空间,所以放入 Test类 内部了.
*/

Class Test{
		
;---------------------------------------------------------------------- 

class TestCallBase{ 
    __Call(aThis,aFuncName,aParams*){
	
		aNameLen:=StrLen(aFuncName)

		if(ObjHasKey(this,aFuncName)){ ;这里的this指代，真正的元函数本身
			OutPut :=this[aFuncName].Call(aThis,aParams) ;第一个参数必须是 this ，另外,aParams已经是数组了
			return OutPut
		}
		else{					
			throw Exception(_Ex.NoExistMethod)	;找不到方法,就抛出异常
		}
		
    }
}

;---------------------------------------------------------------------- 

class TestGetBase{ 
    __Call(aThis,aVariateName,aParams*){
		
		if(ObjHasKey(this,aVariateName)){ 
			OutPut :=this[aVariateName]
			return OutPut
		}
		else{
			throw Exception(_EX.NoExistVariate) ;如果找不到，那么就抛出值不存在异常
			return ""		
		}
    }
}

;---------------------------------------------------------------------- 
		
;主要是为了实现保护写入,也就是保证里面的东西是常量

class TestSetBase{
    __Call(aThis,aVariateName,aParams*){
		
		if(ObjHasKey(TestBase.__Get,aVariateName)){ 
			throw Exception(_EX.SetConst) ;如果已经存在,那么就抛出常量写入异常
			return ""
		}
		else{					
			throw Exception(_EX.NoExistVariate)	;如果找不到，那么就抛出变量不存在异常	
		}
    }
}	
		
;---------------------------------------------------------------------- 

}  ;Test Class End

;---------------------------------------------------------------------- 
;---------------------------------------------------------------------- 

Test.base:=new TestBase()

;---------------------------------------------------------------------- 
;---------------------------------------------------------------------- 


Class TestBase{	
	Class __Set extends Test.TestSetBase{
	;主要目的就是为了防止写入，所以里面往往什么也不用填写
	}	
	
	Class __Get extends Test.TestGetBase{
	
	;请填写静态域
	static A:="vA",B:="vB",C:="vC",D:="vD"

	}	
	
;---------------------------------------------------------------------- 	

	Class __Call extends Test.TestCallBase{
	;可以在里面填写各种方法
	FuncA(){
		MsgBox,% A_LineNumber " : " A_ThisFunc
		return
	}
	
	FuncB(){
		MsgBox,% A_LineNumber " : " A_ThisFunc
		return
	}
	
	FuncC(){
		MsgBox,% A_LineNumber " : " A_ThisFunc
		return
	}
	
	}
	
;---------------------------------------------------------------------- 
	
} ;TestBase Class End
