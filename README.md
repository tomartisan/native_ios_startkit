## FastApp（iOS开发脚手架）

### Swift版本正在改造中，如有需要请使用稳定的Objective-C版！！！

> ​	The scaffold code for iOS develop 

### 1、使用

为保证极速上手并投入生产，避免【Create a new Xcode project】和配置浪费时间，此脚手架您只需直接下载，更改项目文件名、APP名称、资源文件后即可运行使用。

当然具体业务模块还是需要您自行开发！
 
> 使用前请注意分支版本，当前为`swift`版(基于3x)，支持iOS8以上平台，使用`Carthage`作为依赖管理器。
> **如果需要使用`Objective-C`和`CocoaPods`，请切换`master`分支**

```
git clone https://github.com/tangkunyin/FastApp.git
cd FastApp

# 如果直接carthage update，则同时编译iOS、tvOS等版本，后果就是异常的慢
carthage update --platform iOS
	
#当需要更新项目中第三方库的最新的编译版本时，请执行如下命令：
carthage update Box
## 或者
carthage update Box1 Box2	
```

**如果遇到困难或发现八阿哥，欢迎持续骚扰和疯狂的[`issues`](https://github.com/tangkunyin/FastApp/issues)：**

### 2、关于

类似爪哇系的`Spring`大法，本项目已集成业内最优秀的框架，以便节省您找寻可靠框架的纠结时间。

项目整合的第三方类库有：

1. `SnapKit`：纯swift实现的自动布局工具；
2. `Alamofire`、：继`AFNetworking`后的纯Swift网络请求工具；
3. `Kingfisher、APNGKit、Rainbow`、：喵大神系列，分别是图片、APNG播放、控制台日志工具；
4. `SwiftyJSON`：JSON工具，没啥好解释的；
5. `MBProgressHUD`：吐丝、进度的工具，由于暂时没找到更好的纯Swift版本，暂由此混合编程替代。

其中，部分工具对这些框架进行了进一步封装。使其使用更便捷。当然，我也尽可能加入必要的常量工具或字符串工具类、加密工具类、打分控件、轮播图实现等。

其中，`FSUICreator`封装了常用的UI创建方法，`FSPositionTools`和`FSAutolayoutor`则实现了更简单易用的UI布局的方法，你只需两行代 码即可搞定UI创建、自动布局。

### 3、其他

关于自动打`ipa`包的脚本，已封装在[这里](https://github.com/tangkunyin/DevShell)，需要的自提，不包邮！

**欢迎`fork`、`issues`和`pull requests`**



