
;用来进行极其简单的单元测试，可用于TDD或TDS，如果发现断言失败，就会抛出异常，弹出MsgBox提醒
Class AHKTest{
	;断言两个值相等
	eq(a,b){
		if(a!=b){
			throwWithSt("⚠test failed⚠：" toString(a) " != " toString(b))
		}
	}
	;断言会抛出异常(堆栈跟踪信息去不掉)
	throw(FuncObj){
		HadException:=false
		try {
			FuncObj.Call()
		} catch e {
			HadException:=true
		}
		if(NOT HadException){
			throwWithSt("⚠test failed⚠：No exceptions were thrown.")
		}
	}
}
