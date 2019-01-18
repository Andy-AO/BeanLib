
protect(Bean)

Class Bean{

;---------------------------------------------------------------------- 

Class Protect{

__Call(param*){
	;~ println("Call保护")
	throw Exception(_EX.NoExistMethod)
	return
}

__Set(param*){
	;~ println("Set保护")
	throw Exception(_EX.NoExistValue)
	return
}

__Get(param*){
	;~ println("Get保护")
	throw Exception(_EX.NoExistValue)
	return
}

;---------------------------------------------------------------------- 

}


}