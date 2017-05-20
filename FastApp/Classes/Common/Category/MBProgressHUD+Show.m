//
//  MBProgressHUD+Show.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

typedef NS_ENUM(NSInteger,MBProgressTipType)
{
    MBProgressTipNone,      //无提示符
    MBProgressTipSuccess,   //正确提示符
    MBProgressTipError      //错误提示符
};

#import "MBProgressHUD+Show.h"

@implementation MBProgressHUD (Show)

//错误提示
+ (void)showError:(NSString *)error
{
    [self show:error type:MBProgressTipError completion:nil];
}
//正确提示
+ (void)showSuccess:(NSString *)success
{
    [self show:success type:MBProgressTipSuccess completion:nil];
}

//加载提示。默认菊花方式
+ (void)startLoadding
{
    [self loaddingWithMessage:nil];
}
+ (void)stopLoadding
{
    [self hideHUDForView:nil];
}
+ (void)loaddingWithMessage:(NSString *)message
{
    UIView *loadingView = [[[UIApplication sharedApplication].keyWindow subviews] lastObject];
    if (![loadingView isKindOfClass:[MBProgressHUD class]]) {
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        MBProgressHUD *mbHud = [[MBProgressHUD alloc] initWithView:window];
        mbHud.mode = MBProgressHUDModeIndeterminate;
        
        mbHud.bezelView.color = GRAYCOLOR(200);
        
        mbHud.detailsLabel.text = message;
        mbHud.detailsLabel.textColor = FSBlackColor;
        mbHud.removeFromSuperViewOnHide = YES;
        
        [window addSubview:mbHud];
        [mbHud showAnimated:YES];
        
//      mbHud.activityIndicatorColor = FSBlackColor; Deprecate: use this below

        [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = FSBlackColor;
    }
}

//进度条显示。默认圆圈
+ (void)showProgress:(float)fractionCompleted
{
    [self showProgress:fractionCompleted message:nil];
}

+ (void)showProgress:(float)fractionCompleted message:(NSString *)message
{
    [self showProgress:fractionCompleted message:message mode:MBProgressHUDModeAnnularDeterminate];
}

+ (void)showProgress:(float)fractionCompleted message:(NSString *)message mode:(MBProgressHUDMode)mode
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *mbHud = [MBProgressHUD HUDForView:[UIApplication sharedApplication].keyWindow];
        if (!mbHud) {
            mbHud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
            mbHud.mode = mode;
            mbHud.bezelView.color = GRAYCOLOR(200);
            mbHud.label.textColor = FSBlackColor;
        }
        if (fractionCompleted == 1.0f) {
            [mbHud hideAnimated:YES];
        }else{
            mbHud.progress = fractionCompleted;
            mbHud.label.text = message;
        }
    });
}

// 提示后响应某个动作
+ (void)showMessage:(NSString *)message completion:(void (^)(void))completion
{
    [self show:message type:MBProgressTipNone completion:completion];
}

+ (void)handleErrorWithCode:(NSInteger)code additional:(id)additional
{
    switch (code) {
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
                NSString *description = [NSHTTPURLResponse localizedStringForStatusCode:resp.statusCode];
                [self handleErrorWithCode:resp.statusCode additional:description];
            }else{
                [self handleNetWorkConnectError];
            }
        }
            break;
    }
}


+ (void)hideHUDForView:(UIView *)view
{
    if (!view) view = [[[UIApplication sharedApplication].keyWindow subviews] lastObject];
    if (![self hideHUDForView:view animated:YES] && [view isKindOfClass:[MBProgressHUD class]]) {
        [NSThread sleepForTimeInterval:0.4];
        [view removeFromSuperview];
    }
}

+ (void)handleNetWorkConnectError
{
    [MBProgressHUD stopLoadding];
    if ([FSNetTools sharedInstance].netReachable) {
        [[NSNotificationCenter defaultCenter] postNotificationName:ServerRequestFailure object:@(HttpStatusFalseCode)];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:ServerRequestFailure object:@(FSNetStatusNotReachable)];
    }
}

#pragma mark 私有方法：显示信息，然后自动隐藏
+ (void)show:(NSString *)text  type:(MBProgressTipType)type completion:(void (^)(void))completion
{
    if (![FSStringTools isEmpty:text]) {
        [self hideHUDForView:[UIApplication sharedApplication].keyWindow animated:NO];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:NO];
        hud.mode = MBProgressHUDModeCustomView;
        switch (type) {
            case MBProgressTipNone:
                hud.mode = MBProgressHUDModeText;
                break;
            case MBProgressTipSuccess:
                hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageWithNamed:@"Checkmark-success"]];
                break;
            case MBProgressTipError:
                hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageWithNamed:@"Checkmark-error"]];
                break;
        }
        hud.bezelView.color = GRAYCOLOR(200);
        hud.detailsLabel.text = text;
        hud.detailsLabel.textColor = FSBlackColor;
        hud.removeFromSuperViewOnHide = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(600 * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.2f animations:^{
                    hud.transform = CGAffineTransformMakeScale(0.8, 0.8);
                } completion:^(BOOL finished) {
                    //800毫秒延迟
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(800 * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
                        [hud removeFromSuperview];
                        if (completion) {
                            completion();
                        }
                    });
                }];
            });
        });
    }
}

@end
