//
//  FSWebViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSWebViewController.h"

@interface FSWebViewController () <UIWebViewDelegate>

@end

@implementation FSWebViewController
{
    NSString *_webUrl;
}

- (instancetype)initWithTitle:(NSString *)title webUrl:(NSString *)url
{
    self = [super init];
    if (self) {
        self.title = title;
        _webUrl = url;
        [self.view addSubview:self.webView];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[CommonNetTools getRequestWithURLString:_webUrl method:@"GET" timeOut:SERVER_CONNECT_TIMEOUT]];
}

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
        _webView.scrollView.bounces = NO;
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.delegate = self;
    }
    return _webView;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD startLoadding];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD stopLoadding];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [MBProgressHUD stopLoadding];
    [MBProgressHUD showError:@"加载错误"];
}

@end

