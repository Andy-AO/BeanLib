**用于监视文件夹中的变化(Notifies about changes within folders):**

```autohotkey
WatchFolder(Folder, UserFunc, SubTree := False, Watch := 0x03)
```

*下列内容都是根据原脚本文件头部注释改编和翻译而成*

由于API函数WaitForMultipleObjects()的限制，不能同时查看超过 WAIT_OBJECTS(64)个文件夹。

### 参数 Parameters: 

#### Folder

1. **要监视的文件夹的完全限定路径。**

2. 传递字符串`**PAUSE`，并且将UserFunc设置为True或False，可以分别暂停和继续监视.

3. 传递字符串`**END`并将UserFunc设为任意值，可以完全停止监视
   如果没有这么做，会在退出程序的时候自动完成停止监视

#### UserFunc

1. **回调函数的名字**

   用于调用更改的用户定义函数的名称。回调函数必须接受至少两个参数：

   1：受影响文件夹的路径(建议用`Folder`命名参数)。即使是驱动器的根目录（例如C:），也不包括最后的反斜杠。
   2 : 包含以下键的更改通知数组(建议用`Changes`命名参数)：

   - Action:指定为FILE“Action”的整数值之一...（详见下文）。
     例如,重命名操作被设置为FILE_Action_RENAMED(4)。
   - Name：更改的文件或文件夹的完整路径。
   - OldName：重命名时的上一个路径，否则不使用。
   - IsDir：如果名称是目录，则为True；否则为False。在操作2（删除）的情况下，IsDir始终为False。

2. 传递字符串`**DEL`以从监控的文件夹列表中删除该目录。

#### SubTree

如果希望监视整个子树（即所有子文件夹的内容），则设置为true,默认不监视子文件夹。

#### Watch

[通知注册值](#文件变更通知注册值).

默认值:0x03(FILE_NOTIFY_CHANGE_FILE_NAME+FILE_NOTIFY_CHANGE_DIR_NAME)

### 宏 Macro

#### 文件变更通知注册值

```AutoHotKey

;     ReadDirectoryChangesW          msdn.microsoft.com/en-us/library/aa365465(v=vs.85).aspx

;     FILE_NOTIFY_CHANGE_FILE_NAME   = 1   (0x00000001) : Notify about renaming, creating, or deleting a file.
;     FILE_NOTIFY_CHANGE_DIR_NAME    = 2   (0x00000002) : Notify about creating or deleting a directory.
;     FILE_NOTIFY_CHANGE_ATTRIBUTES  = 4   (0x00000004) : Notify about attribute changes.
;     FILE_NOTIFY_CHANGE_SIZE        = 8   (0x00000008) : Notify about any file-size change.
;     FILE_NOTIFY_CHANGE_LAST_WRITE  = 16  (0x00000010) : Notify about any change to the last write-time of files.
;     FILE_NOTIFY_CHANGE_LAST_ACCESS = 32  (0x00000020) : Notify about any change to the last access time of files.
;     FILE_NOTIFY_CHANGE_CREATION    = 64  (0x00000040) : Notify about any change to the creation time of files.
;     FILE_NOTIFY_CHANGE_SECURITY    = 256 (0x00000100) : Notify about any security-descriptor change.

;     FILE_NOTIFY_INFORMATION        msdn.microsoft.com/en-us/library/aa364391(v=vs.85).aspx
```
#### 文件变更回调动作名值
```AutoHotKey
;     FILE_ACTION_ADDED              = 1   (0x00000001) : The file was added to the directory.
;     FILE_ACTION_REMOVED            = 2   (0x00000002) : The file was removed from the directory.
;     FILE_ACTION_MODIFIED           = 3   (0x00000003) : The file was modified.
;     FILE_ACTION_RENAMED            = 4   (0x00000004) : The file was renamed (not defined by Microsoft).
;     FILE_ACTION_RENAMED_OLD_NAME   = 4   (0x00000004) : The file was renamed and this is the old name.
;     FILE_ACTION_RENAMED_NEW_NAME   = 5   (0x00000005) : The file was renamed and this is the new name.

;     GetOverlappedResult            msdn.microsoft.com/en-us/library/ms683209(v=vs.85).aspx

;     CreateFile                     msdn.microsoft.com/en-us/library/aa363858(v=vs.85).aspx
;     FILE_FLAG_BACKUP_SEMANTICS     = 0x02000000
;     FILE_FLAG_OVERLAPPED           = 0x40000000

```

### 返回 Returns: 

成功时返回True；否则返回False。
### 抛出异常 Throws: 
null

### 示例 Example

这个示例演示了,在对文件夹`H:\MyLibrary\文献库`执行监事的情况下,向文件夹中复制`htmlhelp.exe`和删除它到回收站时在回调函数中收到的参数.

```AutoHotKey
WatchFolder("H:\MyLibrary\文献库","MyUserFunc")

return

MyUserFunc(Folder, Changes) {
	LogPrintln(Folder,A_LineFile  "("  A_LineNumber  ")"  " : " "Folder >>> `r`n")
		LogPrintln(Changes,A_LineFile  "("  A_LineNumber  ")"  " : " "Changes >>> `r`n")
			return
			}
			
			
}
```



```output
D:\AHKs\Dev\TPDD_WatchFolder测试.ahk(30) : Folder >>> 
H:\MyLibrary\文献库
D:\AHKs\Dev\TPDD_WatchFolder测试.ahk(31) : Changes >>> 
[{Action:1,IsDir:0,Name:H:\MyLibrary\文献库\htmlhelp.exe}]

D:\AHKs\Dev\TPDD_WatchFolder测试.ahk(30) : Folder >>> 
H:\MyLibrary\文献库
D:\AHKs\Dev\TPDD_WatchFolder测试.ahk(31) : Changes >>> 
[{Action:2,IsDir:0,Name:H:\MyLibrary\文献库\htmlhelp.exe}]
```
### 测试 Test

原作者给出了实现良好的监控GUI脚本作为测试脚本

WatchFolder_sample.ahk

### 来源

[WatchFolder()-AutoHotkey Community](https://www.autohotkey.com/boards/viewtopic.php?t=8384)