


class RunningSpeedTest{
	freq := DllCall("QueryPerformanceFrequency", "Int64*", freq)
;------------------------------
	__New(){
		return this
	}
;------------------------------
	Start(){
		DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)
		this.CounterBefore := CounterBefore
		return
	}
;------------------------------
	End(){
		DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
		result := ((CounterAfter - this.CounterBefore) / (this.freq * 1000))
		this.CounterBefore := ""
		return result
	}
}
 From：https://wyagd001.github.io/zh-cn/docs/commands/DllCall.htm#QPC
