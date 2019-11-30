


class ObservableMap{
	field := Object("map","","listenerList",[])
	;------------------------------
	__Set(key,value,para*){
		if(key = "field","base")
			return	ObjRawSet(this,key,value)
		else{
			LogPrintln(key,A_LineFile  "("  A_LineNumber  ")"  " : " "key >" ">> `r`n")
			throwWithST(A_ThisFunc)
		}
		return
	}
	;------------------------------
	_NewEnum(){
		return new BeanEnum(this.field.map)
	}
	;------------------------------
	__New(aMap:=""){
		if(aMap=""){
			this.field.map := Object()
		}
		else{
			Type.assertObj(aMap)
			this.field.map := aMap
		}
		return this
	}
	;------------------------------
	addListener(aMethod){
		this.field.listenerList.push(aMethod)
		return
	}
	;------------------------------
	get(aKey){
		return this.field.map[aKey]
	}
	;------------------------------
	clear(){
		theRemovedMap := this.field.map
		this.field.map := Object()
		theChange := new ObservableMap.Change(aObservableMap:=this,aRemoved:=true,theRemovedMap,aAdded:=false,aAddedMap:=Object())
		this.callListener(theChange)
		return
	}
	;------------------------------
	remove(aKey*){
		theRemovedMap := _Container.Extract(this.field.map,aKey)
		this.field.map.remove(aKey*)
		theChange := new ObservableMap.Change(aObservableMap:=this,aRemoved:=true,theRemovedMap,aAdded:=false,aAddedMap:=Object())
		this.callListener(theChange)
		return
	}
	;------------------------------
	put(aKeyValue*){
		theAddedMap := Object(aKeyValue*)
		this.field.map := _Map.merge(this.field.map,theAddedMap)
		theChange := new ObservableMap.Change(aObservableMap:=this,aRemoved:=false,aRemovedMap:=Object(),aAdded:=true,theAddedMap)
		this.callListener(theChange)
		return
	}
	;------------------------------
	callListener(aChange){
		for i,v in this.field.listenerList {
			v.call(aChange)
		}
		return
	}
	;------------------------------
	class Change{
		__New(aObservableMap,aRemoved,aRemovedMap,aAdded,aAddedMap){
			this.observableMap := aObservableMap
			this.removed := aRemoved
			this.removedMap := aRemovedMap
			this.added := aAdded
			this.addedMap := aAddedMap
			return this
		}
		;------------------------------
		getMap(){
			return this.observableMap
		}
		;------------------------------
		wasRemoved(){
			return this.removed
		}
		;------------------------------
		wasAdded(){
			return this.added
		}
		;------------------------------
		getValueRemoved(){
			return this.removedMap
		}		
		;------------------------------
		getValueAdded(){
			return this.addedMap
		}
	} ;---------class change End
} ;---------class ObservableMap End
