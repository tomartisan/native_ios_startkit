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
@property (nonatomic, strong) UIButton *refreshButton;
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
    if ([StringTools isEmpty:message]) {
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
            [PositionTools layView:self.refreshButton
                    atCenterOfView:self.view
                         maxSize:CGSizeMake(200, 45)
                           margins:0];
            break;
    }
}

- (void)refreshPageWithErrorType:(NetWorkErrorType)type
{
    switch (type) {
        case NoConnectionError:
            [self.reConnectView removeFromSuperview];
            break;
        case RequestFailedError:
            [self.refreshButton removeFromSuperview];
            break;
    }
    SEL freshAction = NSSelectorFromString(self.refreshPageStringMethod);
    if ([self isKindOfClass:[FSBaseViewController class]] && [self respondsToSelector:freshAction]) {
        IMP imp = [self methodForSelector:freshAction];
        void (*func)(id,SEL) = (void *)imp;
        func(self,freshAction);
    }
}

- (void)refreshPage:(UIButton *)btn
{
    [self refreshPageWithErrorType:btn.tag];
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

//有网连接失败时显示
- (UIButton *)refreshButton
{
    if (!_refreshButton) {
        _refreshButton = [UICreator createButtonWithTitle:@"加载失败，点击刷新"
                                               titleColor:[UIColor whiteColor]
                                                     font:[UIFont systemFontOfSize:14]
                                                   target:self
                                                   action:@selector(refreshPage:)];
        _refreshButton.tag = RequestFailedError;
        _refreshButton.backgroundColor = FSTranslucentColor;
        _refreshButton.layer.cornerRadius = 10;
    }
    return _refreshButton;
}

@end