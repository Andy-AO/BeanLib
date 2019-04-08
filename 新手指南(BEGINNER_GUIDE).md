在此之前，确保

1. 安装 [AutoHotKey](https://autohotkey.com) 的 Unicode-32 版本 和 [SciTE4AutoHotkey](https://autohotkey.com/boards/viewtopic.php?t=62)
2. 注册一个 [GitHub](https://github.com/) 账号

# 1. 下载并安装 GitHub PC 客户端

1. 下载：[点击这里下载](https://desktop.github.com/) ，如果你无法下载，可以去[百度网盘]( https://pan.baidu.com/s/170noT1wYTQIwH9t-ezruyA)下载，提取码: y2gy 。
2. 安装并登陆：安装完成后，登陆 GitHub 客户端。

# 2. 克隆 Clone 
Clone 就是『克隆』，类似『复制』或者『下载』的意思。

1. 点击 Clone 

![点击 Clone ](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/20190407100241.png)

2. 填入仓库地址和本地地址，并点击 Clone。

   - 仓库地址是 https://github.com/Oilj/BeanLib ，本地地址根据你的情况自行决定。

   ![填入仓库地址和本地地址，并点击 Clone](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/image_24.png)

3. 等待 Clone 完成。

# 3. 导入 Include

1. 复制 BeanLib.ahk 的路径

   - 找到本地地址下的 BeanLib.ahk文件，右键单击，点开『属性』菜单，点击『安全』选项卡，复制『对象名称』。比如，我这里的就是 C:\Users\Administrator\Desktop\BeanLib\BeanLib.ahk。

   ![复制 BeanLib.ahk 的路径](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/image_25.png)

2. 打开 SciTE4AutoHotkey，按下 Ctrl+N 新建文件
3. 在编辑框中输入以下代码。注意，本地路径要粘贴自己的。

  ```autohotkey
  #Include C:\Users\Administrator\Desktop\BeanLib\BeanLib.ahk
  logPrintln("Hello World！")
  
  ```
4. 按下 Ctrl+N 将脚本保存到本地，并按下 F5 运行脚本。
    如无意外，脚本会运行失败，在 SciTE4AutoHotkey 下方会显示错误。
    ![显示错误](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/image_26.png)

5. 双击该错误行，程序自动打开 BeanLib.ahk
   你需要将 #Include D:\AHKs\Stable\ahk_lib 替换为自己的目录。
   比如，替换成 #Include C:\Users\Administrator\Desktop\BeanLib
    ![BeanLib.ahk](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/20190407101441.png)

6. 重新回到刚刚的界面，再次按下 F5 运行脚本。

   出现 HelloWorld 表示库已经部署成功。


   ![成功](https://raw.githubusercontent.com/Oilj/GitHubPictureBed/master/20190407102303.png)

# 4. 后续
- 在需要导入的脚本的最顶部加入 Include 命令，即可调用库类和函数。
- 使用库时，遇到问题请先先查阅文档，大多数的问题都已经有解决方案。如果无法解决也可以联系我。
- 可以导入代码高亮，如果不导入也不影响库的使用，相关内容请查看[语法高亮(HIGHLIGHTING)](HIGHLIGHTING.md)的说明文档。