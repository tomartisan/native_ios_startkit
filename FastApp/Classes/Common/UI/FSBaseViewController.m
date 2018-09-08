//
//  FSBaseViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSBaseViewController.h"

@interface FSBaseViewController ()
@property (nonatomic, strong) UIButton *reConnectBtn;
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
        case FSNetStatusNotReachable:
            [FSAutolayoutor layView:self.reConnectBtn fullOfTheView:self.view];
            break;
        case HttpStatusFalseCode:
            [MBProgressHUD showError:@"请求失败，请稍后再试"];
            break;
    }
}

- (void)refreshPage:(UIButton *)btn
{
    [self.reConnectBtn removeFromSuperview];
    if ([self isKindOfClass:[FSBaseViewController class]] && [self respondsToSelector:_pageRefreshingAction]) {
        IMP imp = [self methodForSelector:_pageRefreshingAction];
        void (*func)(id,SEL) = (void *)imp;
        func(self,_pageRefreshingAction);
    }
}

//无网络链接显示
- (UIButton *)reConnectBtn
{
    if (!_reConnectBtn) {
        _reConnectBtn = [FSUICreator createButtonWithTitle:@"您已处于离线中，点击重新上线 :)"
                                                      size:CGSizeZero
                                                titleColor:[UIColor yellowColor]
                                                      font:[UIFont systemFontOfSize:20]
                                                    target:self
                                                    action:@selector(refreshPage:)];
        _reConnectBtn.backgroundColor = ColorWithAlpha(0,0,0,0.85);
    }
    return _reConnectBtn;
}

@end
