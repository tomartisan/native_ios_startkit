## FastApp（iOS开发脚手架）

> ​	The scaffold code for iOS develop 


## 使用
 
> 使用前请注意分支版本，当前为`Objective-C`版，默认使用`CocoaPods`作为依赖管理器；如果需要使用`Swift`，请切换`Swift`分支

```shell
	git clone https://github.com/tangkunyin/FastApp.git

	cd FastApp
	
	pod install --no-repo-update
	
	open FastApp.xcworkspace
```

**如果遇到了麻烦，欢迎骚扰：`鹅群`：43250524**

## 关于

由于实际开发中所用到的大部分基础代码相似或相同，所选第三方库也基本一致。为了加快项目开发效率，我写了这个基础模板。取名为`FastApp`，目的就是想减少不必要的时间损失。

目前，该项目整合了常用的第三方类库如：`Masonry`、`AFNetworking`、`MJRefresh`、`MJExtension`、`MBProgressHUD`，`SDWebImage`。部分工具对这些框架进行了进一步封装。使其使用更便捷。当然，我也尽可能加入必要的宏或字符串工具类、加密工具类、打分控件、轮播图实现等。

其中，`FSUICreator`封装了常用的UI创建方法，`FSPositionTools`和`FSAutolayoutor`则实现了更简单易用的UI布局的方法，你只需两行代 码即可搞定UI创建、自动布局。

## 其他

本项目旨在提供开发模板代码，也就是说你在实际开发中，不用【Create a new Xcode project】，直接下载这个模板就可以写代码，通用的基础配置基本OK。

关于自动打`ipa`包的脚本，已封装在[这里](https://github.com/tangkunyin/DevShell)，需要的自提，不包邮！

**代码已在实际生产中验证过多次，发现问题，会第一时间修复。请放心使用。再有目前暂不提供类似Pod库那样的支持。欢迎`fork`、`issues`和`pull requests`**




