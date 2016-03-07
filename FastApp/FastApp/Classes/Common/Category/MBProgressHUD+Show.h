//
//  MBProgressHUD+Show.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Show)

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;

+ (void)showMessage:(NSString *)message completion:(void (^)(void))completion;


+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

// 加载菊花图
+ (void)loadding:(BOOL)isLoadding;

/**
 *  统一错误处理
 *  @param code 错误码，字符串或数字均可
 *  @param additional 附加信息（可以是错误信息，也可以是NSHTTPURLResponse）
 */
+ (void)handleErrorWithCode:(id)code additional:(id)additional;

@end
