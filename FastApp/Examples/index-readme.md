### 欢迎探险这个模板

当模拟器跑起来能看到现在这些字的时候，就表示已经具备纯Coding撸代码的环境了。这里将按Tab分别介绍相关类库的使用。正如你现在看到的样子，没有特异功能，只是集成或整合了常用的代码，你可以想象着英语句子去寻找工具类或类的方法。

> 提示：所有二级页自定义了返回且支持左滑动返回上层，如果字体颜色看不清，请重新进一次 :）

#### 下面简单介绍下

1. 首页，你现在在看的，使用**JSC**做了MarkDown文本解析并显示；
2. 界面，演示了UI摆放工具`FSAutolayoutor`和UI创建工具`FSUICreator`及自动布局的使用；
3. 购物，演示了电商模块常用的功能，如购物车，商品详情页等；
4. 用户，顾名思义，就是跟用户相关的通用代码，例如登录、注册、意见反馈等；
5. 其他，将演示一些常用工具类，比如字符串工具类、加密解密工具、服务器交互工具、提示工具等，这些工具类或者分类，看看名字就知道什么意思了，这里我也就不多说；
6. ...


### 诗和

```

                            _ooOoo_
                           o8888888o
                           88" . "88
                           (| -_- |)
                            O\ = /O
                        ____/`---'\____
                      .   ' \\| |// `.
                       / \\||| : |||// \
                     / _||||| -:- |||||- \
                       | | \\\ - /// | |
                     | \_| ''\---/'' | |
                      \ .-\__ `-` ___/-. /
                   ___`. .' /--.--\ `. . __
                ."" '< `.___\_<|>_/___.' >'"".
               | | : `- \`.;`\ _ /`;.`/ - ` : | |
                 \ \ `-. \_ __\ /__ _/ .-` / /
         ======`-.____`-.___\_____/___.-`____.-'======
                            `=---='
         .............................................
          佛曰:          Hello  World

                  写字楼里写字间，写字间里程序员；
                  程序人员写程序，又拿程序换酒钱。
                  酒醒只在网上坐，酒醉还来网下眠；
                  酒醉酒醒日复日，网上网下年复年。
                  但愿老死电脑间，不愿鞠躬老板前；
                  奔驰宝马贵者趣，公交自行程序员。
                  别人笑我忒疯癫，我笑自己命太贱；
                  不见满街漂亮妹，哪个归得程序员？

```

#### C

``` c

#include <stdio.h>

int main(int argc, const char * argv[]) {
    printf("Hello, World!\n");
    return 0;
}

```

#### Objective-C

``` objective-c

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
    }
    return 0;
}

```

#### Swift

``` swift
import Foundation

print("Hello, World!")

```


#### Java

``` java
public class HelloWorld {
    public static void main( String[] args ) {
        System.out.println( "Hello World!" );
    }
}
```

#### JavaScript

``` javascript
#!/usr/local/bin/node

var http = require( "http" );
http.createServer( function ( request, response ) {
  response.writeHeader( 200, {
    "Content-Type": "text/html"
  } );
  response.write( "Hello World!" );
  response.end();
} ).listen( 8080 ); // Activates this server, listening on port 8080.
```

#### PHP

``` php

 <?php echo '<p>Hello World!</p>'; ?>

```



### 远方

以上提到的模块，不见得每个都实现了。如果有帮助到你了，我很高兴。如果没有你要的功能，不要生气。说不定哪一天实在闲的蛋疼了，我就会加上...

欢迎到我博客，源码提意见。感谢！

> Keep Learning && Coding && Producting...

![codingMyLife](https://dn-coding-net-production-static.qbox.me/91d0106b-7774-4878-b72e-304fcf2059af.png?imageMogr2/auto-orient/format/png/crop/!250x250a19a0)



