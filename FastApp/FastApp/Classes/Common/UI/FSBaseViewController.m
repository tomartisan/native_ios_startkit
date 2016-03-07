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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showRefreshActionView:)
                                                 name:ServerRequestFailure object:nil];
}

- (void)showRefreshActionView:(NSNotification *)notification
{
    switch ([notification.object intValue]) {
        case NoConnectionError:
            [PositionTools placeView:self.reConnectView atTheCenterOfTheView:self.view];
            break;
        case RequestFailedError:
            [PositionTools placeView:self.refreshButton atTheCenterOfTheView:self.view];
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
    if ([self isKindOfClass:[BaseViewController class]] && [self respondsToSelector:freshAction]) {
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
        _reConnectView = [[UIView alloc] initWithFrame:FullScreenRect];
        _reConnectView.backgroundColor = [UIColor whiteColor];
        UIButton *reConnBtn = [UICreator createButtonWithTitle:@"无网络连接，点击重试"
                                                    titleColor:MFQlightGrayColor
                                                          font:[UIFont systemFontOfSize:22]
                                                         frame:CGRectMake(0, 0, KDeviceWidth, 60)
                                                    buttonType:UIButtonTypeRoundedRect
                                                        target:self
                                                        action:@selector(refreshPage:)];
        reConnBtn.tag = NoConnectionError;
        reConnBtn.center = _reConnectView.center;
        [_reConnectView addSubview:reConnBtn];
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
                                                    frame:CGRectMake(0, 0, 200, 45)
                                               buttonType:UIButtonTypeRoundedRect
                                                   target:self
                                                   action:@selector(refreshPage:)];
        _refreshButton.tag = RequestFailedError;
        _refreshButton.backgroundColor = MFQTranslucentColor;
        _refreshButton.layer.cornerRadius = 10;
    }
    return _refreshButton;
    
    
}

