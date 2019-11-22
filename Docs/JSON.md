# JSON Class

1.  性质：静态类
2.	开发目的：JSON String 的序列化与反序列化



 From： https://github.com/cocobelgica/AutoHotkey-JSON 

## 方法 Method

### JSON.Load(json_str)

反序列化JSON String

### JSON.Dump(json_obj)

序列化JSON Obj

```AutoHotKey
#Include %A_LineFile%\..\JSON.ahk

json_str =
(
{
	"str": "Hello World",
	"num": 12345,
	"float": 123.5,
	"true": true,
	"false": false,
	"null": null,
	"array": [
		"Auto",
		"Hot",
		"key"
	],
	"object": {
		"A": "Auto",
		"H": "Hot",
		"K": "key"
	}
}
)

parsed := JSON.Load(json_str)

parsed_out := Format("
(Join`r`n
String: {}
Number: {}
Float:  {}
true:   {}
false:  {}
null:   {}
array:  [{}, {}, {}]
object: {{}A:""{}"", H:""{}"", K:""{}""{}}
)"
, parsed.str, parsed.num, parsed.float, parsed.true, parsed.false, parsed.null
, parsed.array[1], parsed.array[2], parsed.array[3]
, parsed.object.A, parsed.object.H, parsed.object.K)

stringified := JSON.Dump(parsed,, 4)
stringified := StrReplace(stringified, "`n", "`r`n") ; for display purposes only

ListVars
WinWaitActive ahk_class AutoHotkey
ControlSetText Edit1, [PARSED]`r`n%parsed_out%`r`n`r`n[STRINGIFIED]`r`n%stringified%
WinWaitClose
return
```




