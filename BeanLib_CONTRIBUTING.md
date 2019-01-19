# ![*](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/AHK%E5%B0%8F%E5%9B%BE%E6%A0%87_20190105183041.png)贡献指南 CONTRIBUTING

[欢迎提交代码，任何贡献者都会被铭记。](#jumpGX)

## 如何贡献？

### 权限

- 如果您是 行思社 成员，有权直接提交。
    - 行思社 是 AHK老鸟 的小交流群，如果您想加入，可联系@心如止水 ，把您的作品发给他看看，技术文章或者软件都可以。

- 如果您不是 行思社 成员，先 Clone 再 Pull Request。审核后会决定是否并入主线。
    - 目前提交通道还未建立，建立后通过 码云 或 GitHub 提交。

### 标准

**代码应符合以下要求：**

- 已经在项目中使用过。
    - 为保证质量，不要提交未使用的代码。
- 不使用 #Include ，只使用 BeanLib 中的已有函数。
    - 为保证其他人可以正常使用，应在独立环境中测试。
- 不污染公共空间。
    - 不使用全局变量(类对象/函数除外)，不干扰自动执行。
      - 之所以类对象和函数可以除外，是因为占用这些是安全的。函数被重复定义，会发出警告；类复写在 `#Warn` 中有单独警告。
- 有简单的介绍。
    - 至少有功能/输入/返回值介绍，最好有示例，请使用MD语法，可参考[文档模板](https://www.kancloud.cn/xrvu_zen/ahk_lib/902299)。
- 支持 AHK_L
    - 请不要使用其他分支的特有语法或函数。
- 禁止触发除 `LocalSameAsGlobal` 外的任何 `#Warn` 警告
    - 之所以   `LocalSameAsGlobal` 可以，是因为这个实在是太操蛋了。谁用这玩意?简直反人类，我一般都关掉。
- 禁止使用一切 `魔法数值` 。
    - 魔法数值，指的是没有实现定义的任何数值。
    - 使用魔法数值会严重损害程序的可读性。
    - 如果数值只出现一次，可以使用这种方法缩减行数。
        - `aFuncName:=SubStr(aName,aFuncNameBegin:=1,aFuncNameLen:=2)`

### 一些建议和提醒

- 维护者和贡献者，应在关键决策上，尽可能征询公共意见。
- 如有 论坛帖子，提供地址。
    - 为了保证长期支持。
- 如有借鉴他人代码，提供出处。
    - 尊重作者的劳动。提供更多的信息。
- 尽可能使用函数语法。
    - 经典项目可以使用命令语法。
- 尽可能和已有文件的编码风格相同。
    - 尽量采用 StudlyCaps  命名风格，之后会有 编码规范 放出。
- 注释或文档可含广告。
    - 除位于底部的，不超过2行，尽量不影响阅读。
- 代码将在 LGPLv3 协议的保护下被发布。
    - LGPLv3是目前使用最广泛的开源协议。![*](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/LGPLv3_20190105183651.png)

## <span id="jumpGX">贡献者信息在哪？</span>
- 在 [GitHub页面的 Insights/contributors](https://github.com/Oilj/BeanLib/graphs/contributors) 中查询。
- 在 [码云 的"贡献者"页面](https://gitee.com/xrvu_zen/BeanLib/repository/stats/master)中查询。
- [突出贡献者会被展示在README上。](https://www.kancloud.cn/xrvu_zen/ahk_lib/902301#JumpTIGX)