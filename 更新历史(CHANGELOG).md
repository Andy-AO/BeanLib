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

