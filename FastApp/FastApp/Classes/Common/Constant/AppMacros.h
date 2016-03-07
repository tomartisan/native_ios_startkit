
//
//  AppMacros.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

// 开发模式下开启此项，可有日志打印和服务器切换功能。上线时一定要关掉
#define isDevelopModel 1

// -------------------------------------------------    尺寸定义开始  -------------------------------//
//屏幕宽高定义
#define kVCWIDTH self.view.frame.size.width
#define kVCHEIGHT self.view.frame.size.height
#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
#define FullViewWidth self.frame.size.width
#define FullViewHeight self.frame.size.height
#define SINGLE_LINE_ADJUST_OFFSET  ((1 / [UIScreen mainScreen].scale) / 2)

//满屏CGRect
#define FullScreenRect CGRectMake(0, 0, KDeviceWidth, KDeviceHeight)

// -------------------------------------------------    颜色定义开始  -------------------------------//
#define COLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define GRAYCOLOR(c) COLOR(c,c,c)
#define ColorWithAlpha(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RandomColorWithAlpha(a) [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:a]

#define FSTranslucentColor ColorWithAlpha(0,0,0,0.55)  //半透明颜色

// -------------------------------------------------    工具定义开始  -------------------------------//
//定义构造单例的宏
#define SharedInstanceInterfaceBuilder(ClassName) \
+ (instancetype)sharedInstance;

#define SharedInstanceBuilder(ClassName) \
+ (instancetype)sharedInstance\
{\
    static dispatch_once_t onceToken;\
    static ClassName* instance;\
    dispatch_once(&onceToken, ^{\
    instance = [[ClassName alloc] init];\
    });\
    return instance;\
}

//日志打印
#if isDevelopModel
#define log(msg,...) NSLog(@"%@ ===> %s line at %d" , msg, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define log(msg) ((void)0);
#endif

//拨打电话
#define makeCall(phoneNumber) [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];


// -------------------------------------------------    UIKit自定义定义开始  -------------------------------//

//tableView 分割线左边距归零
#define clearTableViewSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath\
{\
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){\
        [cell setSeparatorInset:UIEdgeInsetsZero];\
    }\
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]){\
        [cell setLayoutMargins:UIEdgeInsetsZero];\
    }\
}

#define setTableViewSeparatorZeroMargin(_tableView) \
if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]){\
    [_tableView setSeparatorInset:UIEdgeInsetsZero];\
}\
if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]){\
    [_tableView setLayoutMargins:UIEdgeInsetsZero];\
}

