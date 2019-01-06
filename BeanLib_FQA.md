# 常见问题(FAQ)

## 目录

[TOC]

## 为什么三个平台内容不一样?

看云 是最优先更新的平台，在源代码没有更改的情况下，[GitEE](https://gitee.com/xrvu_zen/BeanLib) 和 [GitHub](https://github.com/Oilj/BeanLib) 都不会更新。

所以当内容不一致时，以 [看云](https://www.kancloud.cn/xrvu_zen/ahk_lib/902301) 为准。

## 为什么函数失效了?

- 检查类是否被覆盖。
  AHK中类是对象，直接加载到全局空间，所以类是可以被覆盖的。为了避免这一情况，BeanLib类都以"_"开头。可以开启 `#Warn ClassOverwrite` ，当类被覆盖时，将会收到提示。

- 检查是否开启强制Local。
    - Class 默认为"强制全局"，但如果函数体的第一行是Local，那么 Class 的"强制全局"会失效。
      您可以取消Local，或者在Local后声明 Class 为全局，格式为 `Global ClassName`。
    - 如果您开启Local是为了避免收到 LocalSameGlobal 警告，那么也可以单独关闭该警告。
      在`#Warn`后方添加，`#Warn LocalSameAsGlobal, Off`，即可。

- 检查输入值/返回值。

  AHK语法灵活，没有类型，所以输入值容易出错，请检查输入是否符合要求。
  如果您期待函数返回一个值，请检查该函数是否的确应当返回该值，很多时候函数只是对传入的地址中的数据进行操作，并不返回值。(尤其是传入参数为 ByRef 或者为 数组 时。)

- BUG。
  还有一种可能，就是程序设计出现了BUG。
  您可以在对应文档下方评论留言，提交issue，或者 Pull Request。
