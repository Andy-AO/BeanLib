
/*
读写控制优秀的语言编程模板
- 是以"Type"这个类为例子搞的,到时候批量替换成自己的名字就行
- 会创建两个最外层的类,一个是 Type 一个是 TypeBase ,编程的三个方法也要创建类，但是为了节约外部命名空间,所以放入 Type类 内部了.
*/


Class Type{
		
;---------------------------------------------------------------------- 

class TypeCallBase{ 
    __Call(aThis,aFuncName,aParams*){
	
		aNameLen:=StrLen(aName)

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


class TypeGetBase{ 
    __Call(aThis,aVariateName,aParams*){
		
		if(ObjHasKey(this,aVariateName)){ 
			OutPut :=this[aVariateName]
			return OutPut
		}
		else{					
			return ""		
		}
    }
}

;---------------------------------------------------------------------- 
		
;主要是为了实现保护写入,也就是保证里面的东西是常量

class TypeSetBase{
    __Call(aThis,aVariateName,aParams*){		
		throw Exception(_EX.SetConst)
		return ""
    }
}	
		
;---------------------------------------------------------------------- 

}  ;Type Class End

;---------------------------------------------------------------------- 

Type.base:=new TypeBase()

;---------------------------------------------------------------------- 


Class TypeBase{	
	Class __Set extends Type.TypeSetBase{
	;主要目的就是为了防止写入，所以里面往往什么也不用填写
	}	
	
	Class __Get extends Type.TypeGetBase{
	
	;请填写静态域
	static A:="vA",B:="vB",C:="vC",D:="vD"

	}	
	
;---------------------------------------------------------------------- 	

	Class __Call extends Type.TypeCallBase{
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
	
	}	

} ;TypeBase Class End




