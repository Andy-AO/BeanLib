class Queue{
	__New(){
		this.items := Object()
	}

	push(item){
		this.items.Insert(item)
	}

	pop(){
		return this.items.Remove(1)
	}

	size(){
		return (this.items.MaxIndex() ? this.items.MaxIndex() : 0)
	}
}