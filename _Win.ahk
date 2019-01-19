
/*
说明:主要包含针对窗口的各种操作
*/


Class _Win{

SwapHidden(){

	temp:=A_DetectHiddenWindows

	if (temp="On")
	DetectHiddenWindows,Off

	else if(temp="Off")
	DetectHiddenWindows,On
	
	return A_DetectHiddenWindows

}

}