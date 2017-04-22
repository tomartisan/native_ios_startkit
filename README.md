## FastApp（iOS开发脚手架）

### Objective-C版本已停止更新，iOS10以上未曾投入使用过，如有需要请使用Swift版本！！！

>  The scaffold code for iOS develop 


### 1、使用

为保证极速上手并投入生产，避免【Create a new Xcode project】和配置浪费时间，此脚手架您只需直接下载，更改项目文件名、APP名称、资源文件后即可运行使用。

当然具体业务模块还是需要您自行开发！
 
> 使用前请注意分支版本，当前为`Objective-C`版，默认使用`CocoaPods`作为依赖管理器；如果需要使用`Swift`，请切换`Swift`分支

```
git clone https://github.com/tangkunyin/FastApp.git

cd FastApp

# --no-repo-update参数可禁止索引更新，通常会缩小等待时间
pod install --no-repo-update
	
open FastApp.xcworkspace
```

**如果遇到困难或发现八阿哥，欢迎持续骚扰和疯狂的[`issues`](https://github.com/tangkunyin/FastApp/issues)：**

### 2、关于

类似爪哇系的`Spring`大法，本项目已集成业内最优秀的框架，以便节省您找寻可靠框架的纠结时间。

目前，该项目整合了常用的第三方类库如：`Masonry`、`AFNetworking`、`MJRefresh`、`MJExtension`、`MBProgressHUD`，`SDWebImage`。

部分工具对这些框架进行了进一步封装。使其使用更便捷。当然，我也尽可能加入必要的宏或字符串工具类、加密工具类、打分控件、轮播图实现等。

其中，`FSUICreator`封装了常用的UI创建方法，`FSPositionTools`和`FSAutolayoutor`则实现了更简单易用的UI布局的方法，你只需两行代 码即可搞定UI创建、自动布局。

### 3、其他

关于自动打`ipa`包的脚本，已封装在[这里](https://github.com/tangkunyin/DevShell)，需要的自提，不包邮！

**代码已在实际生产中多次验证，发现问题，尽量会第一时间修复。再有目前暂不提供类似Pod库那样的支持。欢迎`fork`、`issues`和`pull requests`**
