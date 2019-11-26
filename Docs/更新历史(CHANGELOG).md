# 更新历史(CHANGELOG)

下面是 BeanLib 的更新日志

## 1.1 - 2019年01月23日

- 新增 Script 类，支持对于任意 AHK脚本 的各种控制，比如重启/暂停.
- 从该版本开始，将使用标准的 Commit Message 格式

- v1.1是第一个 BeanLib  release 版(正式版)
  - release 版大概会每月更新一次

## 1.2 - 2019年03月27日

1. 增加用于调试的LogPrintln()
2. 新增函数：getCurrentTime()、SetTimer()、UseCMD()
3. EverythingClass：修复检测Everything存在性的BUG ；新增  getSearchResultList()；新增 isEverythingExist() 、 afEverythingExist() ；增加Everything.GetVersionString()函数，获取Everything软件版本
4. 新增 AutoClassify 类，文件自动分类器
5. 新增 APPLocker，一个简单的应用锁


## 1.2.1 - 2019年04月01日

1. StringMethod

    - isNumber()  - 检测字符串是否为纯数字
    - isRegExMatch() - 检测String是否匹配某正则
    - 去掉了CharAt 的第二个参数 

2. "SA"改为"List"，放弃"SimpleArray"这种叫法. 
3. _List类新增 Match(list,aRegEx) - 找出数组中所有匹配正则表达式的元素
4. .fix : 修复APPLocker类中,UnLock与Lock函数名错误问题.
5. _Ex 增加 TooManyParas , NoExistKey 
6. 新增 ini 类 ,用于批量读取 Ini 内容
7. 新增 PathObj类 ,可以快速分割路径为 path name ext 等等，并且支持路径合法性检测

## 1.3 - 2019年07月08日

1. 目录：(1)层级更明确 (2)整齐排序
2.  UMSS ：让任何按键变成修饰键的类，代码全面重构，对效率和稳定性进行了大幅优化
3. HotString类和HotStringMaps类：可以从更接近底层的地方掌控HotString，从而实现各种批量化操作。
4. .feat : 
   (1)Contain:增加 DeleteByFunc，根据对象运行的返回值来删除容器元素.
   (2)_Ex :增加 InvalidPara 等多个常用异常
   (3)FuncTion: 修改SetTimer函数,从接收分钟变成毫秒
   (4)StringMethod:为配合(3)，加入分钟和秒转毫秒的方法,

## 1.3.5 - 2019年07月15日

1. WinEvent Class：
   新增「热窗口」(ShellHook)功能
   我们已经有了强大的「热键」和「热字串」，现在我们又有了「热窗口」。
2. Type：
   (1)断言方法支持多参数 (2)加入 Exception 类型
3. Function 
   (1)加入堆栈追踪方法 throw() 、throwWithSt()
   (2)InstanceCheck (单例类测试工具) 
   (3)新增InstanceCheck(),主要用于「单例模式」
4. 新增TimeChecker Class：
   (1)用于「检查当前时间是否位于规定范围内」,支持黑、白名单两种检查方
5. APPLock重构
   使用TimeChecker Class作为新的检查机制 
6.  _Ex
   增加关于「单例类重复实例化」的ExceptionMes

## 1.3.6 - 2019年07月23日

更换 type 类下的所有"af"方法为"assert"方法，功能不变。

## 1.3.7 - 2019年11月24日

.feat

1. Method Class：用于替代 Bind() 方法，提供良好的内部可见性，为单独使用方法(Method)提供了便利。
2. JSON：加入 JSON 字符串读写类和 JsonFile 文件读写类。
3. RunningSpeedTest Class ：用于高精度计时。
4. 增加了序列化 ObjLoad() 函数 与反序列化 ObjDump() 函数。

.fix

1. UMSS Class：修复只能注册 `Tab` 键的BUG。



