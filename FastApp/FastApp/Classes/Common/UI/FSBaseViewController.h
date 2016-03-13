//
//  FSBaseViewController.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSBaseViewController : UIViewController

//刷新页面的方法
@property (nonatomic, copy) NSString *refreshPageStringMethod;

- (void)loadingWithMessage:(NSString *)message;
- (void)stopLoadding;

@end
