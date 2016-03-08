//
//  FSPersonCenterViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/8.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSPersonCenterViewController.h"
#import "FSServerCommunicator.h"

@interface FSPersonCenterViewController () <UIWebViewDelegate>

@end

@implementation FSPersonCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIWebView *webView = [UICreator createWebViewWithUrl:API_SERVER_URL
                                                 baseURL:nil
                                              htmlString:nil
                                            scroolEnable:YES
                                                delegate:self];
    
    [PositionTools layView:webView atCenterOfView:self.view maxSize:CGSizeZero margins:0];
    
    [self loadDataTest];
}

- (void)loadDataTest
{
    FSServerCommunicator *serverReq = [[FSServerCommunicator alloc] init];
    [serverReq doGetWithUri:@"/iOS/1449725518.html"
                      param:nil
                    respObj:nil
                    useSign:NO
                 completion:^(BOOL success, id respData) {
                     if (success) {
                         NSLog(@"服务器返回：%@",respData);
                     }
                 }];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD loadding:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD loadding:NO];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [MBProgressHUD loadding:NO];
    [MBProgressHUD showError:@"加载错误"];
}

@end
