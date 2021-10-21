#Include D:\AHKs\ahk_lib
#Include head.tds.ahk
;获取数据
IPA_EN.LoadData()
AHKTest.eq(IPA_EN.Data["Z"],"ð")

;hook
IPA_EN.Hook()

return
;unhook
^u::
	IPA_EN.ToggleHook()
return
