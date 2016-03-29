//
//  FSBaseViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSBaseViewController.h"

@interface FSBaseViewController ()
@property (nonatomic, strong) UIView *reConnectView;
@end

@implementation FSBaseViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = FSCommonBgColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showRefreshActionView:)
                                                 name:ServerRequestFailure object:nil];
}

- (void)loadingWithMessage:(NSString *)message
{
    if ([FSStringTools isEmpty:message]) {
        message = @"玩儿命加载中...";
    }
    [MBProgressHUD loaddingWithMessage:message];
}

- (void)stopLoadding
{
    [MBProgressHUD stopLoadding];
}

- (void)showRefreshActionView:(NSNotification *)notification
{
    switch ([notification.object intValue]) {
        case NoConnectionError:
            [PositionTools layView:self.reConnectView
                    atCenterOfView:self.view
                         maxSize:CGSizeZero
                           margins:0];
            break;
        case RequestFailedError:
            [MBProgressHUD showError:@"请求失败，请稍后再试"];
            break;
    }
}

- (void)refreshPage:(UIButton *)btn
{
    [self.reConnectView removeFromSuperview];
    SEL freshAction = NSSelectorFromString(self.refreshPageStringMethod);
    if ([self isKindOfClass:[FSBaseViewController class]] && [self respondsToSelector:freshAction]) {
        IMP imp = [self methodForSelector:freshAction];
        void (*func)(id,SEL) = (void *)imp;
        func(self,freshAction);
    }
}

//无网络链接显示
- (UIView *)reConnectView
{
    if (!_reConnectView) {
        _reConnectView = [UICreator createUIViewWithBgColor:[UIColor whiteColor] Corner:0];
        UIButton *reConnBtn = [UICreator createButtonWithTitle:@"无网络连接，点击重试"
                                                    titleColor:[UIColor lightGrayColor]
                                                          font:[UIFont systemFontOfSize:22]
                                                        target:self
                                                        action:@selector(refreshPage:)];
        reConnBtn.tag = NoConnectionError;
        reConnBtn.center = _reConnectView.center;
        [PositionTools layView:reConnBtn atCenterOfView:_reConnectView maxSize:CGSizeMake(KDeviceHeight, 60) margins:0];
    }
    return _reConnectView;
}

@end