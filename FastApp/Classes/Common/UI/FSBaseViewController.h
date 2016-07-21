//
//  FSBaseViewController.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

//控制器基类，所有共有特性或公共方法均包含于此
@interface FSBaseViewController : UIViewController

//刷新页面的方法
@property (nonatomic, assign) SEL pageRefreshingAction;

//菊花加载图
- (void)loadingWithMessage:(NSString *)message;
- (void)stopLoadding;

@end
