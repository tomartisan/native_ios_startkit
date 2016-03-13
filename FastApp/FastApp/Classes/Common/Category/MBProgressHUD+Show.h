//
//  MBProgressHUD+Show.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Show)

//操作提示
+ (void)showError:(NSString *)error;
+ (void)showSuccess:(NSString *)success;

//加载提示。默认菊花方式
+ (void)startLoadding;
+ (void)stopLoadding;
+ (void)loaddingWithMessage:(NSString *)message;
+ (void)loaddingWithMessage:(NSString *)message mode:(MBProgressHUDMode)mode;

//进度条显示。默认圆圈
+ (void)showProgress:(float)fractionCompleted;
+ (void)showProgress:(float)fractionCompleted message:(NSString *)message;
+ (void)showProgress:(float)fractionCompleted message:(NSString *)message mode:(MBProgressHUDMode)mode;

// 提示后响应某个动作
+ (void)showMessage:(NSString *)message completion:(void (^)(void))completion;

/**
 *  统一错误处理
 *  @param code 错误码，字符串或数字均可
 *  @param additional 附加信息（可以是错误信息，也可以是NSHTTPURLResponse）
 */
+ (void)handleErrorWithCode:(id)code additional:(id)additional;

@end
