//
//  MBProgressHUD+Show.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "MBProgressHUD+Show.h"

@implementation MBProgressHUD (Show)

#pragma mark 显示失败/成功信息。会自动隐藏
+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error  view:view];
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success  view:view];
}

#pragma mark 显示信息
+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessag:message toView:nil];
}

+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view
{
    return [self show:message view:view];
}

+ (void)showMessage:(NSString *)message completion:(void (^)(void))completion
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.labelText = message;
    hud.mode = MBProgressHUDModeCustomView;
    [UIView animateWithDuration:0.8 animations:^{
        hud.alpha = 0;
    } completion:^(BOOL finished) {
        [hud removeFromSuperview];
        if (completion) {
            completion();
        }
    }];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (!view) view = [[[UIApplication sharedApplication].keyWindow subviews] lastObject];
    if (![self hideHUDForView:view animated:YES] && [view isKindOfClass:[MBProgressHUD class]]) {
        [NSThread sleepForTimeInterval:0.4];
        [view removeFromSuperview];
    }
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

+(void)loadding:(BOOL)isLoadding
{
    if (isLoadding) {
        UIView *loadingView = [[[UIApplication sharedApplication].keyWindow subviews] lastObject];
        if (![loadingView isKindOfClass:[MBProgressHUD class]]) {
            UIWindow * window = [UIApplication sharedApplication].keyWindow;
            MBProgressHUD * mbHud = [[MBProgressHUD alloc] initWithWindow:window];
            [window addSubview:mbHud];
            mbHud.dimBackground = NO;
            mbHud.opacity = 0.5;
            [mbHud show:YES];
        }
    }else{
        [self hideHUD];
    }
}

+ (void)handleErrorWithCode:(id)code additional:(id)additional
{
    switch ([code integerValue]) {
        case HttpStatusReturnNullCode:
            [self showError:@"数据返回为空"];
            break;
        case DataParseErrorCode:
            [self showError:@"数据解析失败"];
            break;
        case HttpStatusNotModifyCode:
            [self showError:@"请求资源未更改"];
            break;
        case HttpStatusUnAuthoriztionCode:
            [self showError:@"请求未授权"];
            break;
        case HttpStatusForbiddenCode:
            [self showError:@"请求被禁止访问"];
            break;
        case HttpStatusNotFoundCode:
            [self showError:@"资源不存在"];
            break;
        case HttpStatusReqMethodErrorCode:
            [self showError:@"请求方法错误"];
            break;
        case HttpStatusServerErrorCode:
            [self showError:@"请求出错，请稍后尝试"];
            break;
        case HttpStatusMissingArgsCode:
            [self showError:@"缺少参数或参数不符合要求"];
            break;
        case HttpStatusMissingSignCode:
            [self showError:@"缺少签名或签名无效"];
            break;
        case HttpStatusSignErrorCode:
            [self showError:@"加密验证错误"];
            break;
        default:
        {
            if ([additional isKindOfClass:[NSString class]]) {
                [self showError:additional];
            }else if ([additional isKindOfClass:[NSHTTPURLResponse class]]) {
                NSHTTPURLResponse *resp = (NSHTTPURLResponse *)additional;
                [self showError:[NSHTTPURLResponse localizedStringForStatusCode:resp.statusCode]];
            }else{
                [self handleNetWorkConnectError];
            }
        }
            break;
    }
}

+ (void)handleNetWorkConnectError
{
    [MBProgressHUD loadding:NO];
    if ([GlobalCache sharedInstance].intenetReachable) {
        [[NSNotificationCenter defaultCenter] postNotificationName:ServerRequestFailure
                                                            object:@(RequestFailedError)];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:ServerRequestFailure
                                                            object:@(NoConnectionError)];
    }
}

#pragma mark 私有方法：显示信息，然后自动隐藏
+ (MBProgressHUD *)show:(NSString *)text  view:(UIView *)view
{
    if (![StringTools isEmpty:text]) {
        if (view == nil) view = [UIApplication sharedApplication].keyWindow;
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.labelText = text;
        hud.mode = MBProgressHUDModeText;
        hud.removeFromSuperViewOnHide = YES;
        hud.opacity = 0.6;
        hud.labelFont = [UIFont systemFontOfSize:22];
        [hud hide:YES afterDelay:1.4];
        return hud;
    }
    return nil;
}

@end