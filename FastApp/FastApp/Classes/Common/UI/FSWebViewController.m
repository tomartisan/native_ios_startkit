//
//  FSWebViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSWebViewController.h"


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
        [FSAutolayoutor layView:self.webView fullOfTheView:self.view];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[FSNetTools getRequestWithURLString:_webUrl method:@"GET" timeOut:SERVER_CONNECT_TIMEOUT]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self loadingWithMessage:nil];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self stopLoadding];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [self stopLoadding];
    NSString *localErrorDes = [error.userInfo valueForKey:NSLocalizedDescriptionKey];
    NSString *errorMsg = (nil == localErrorDes) ? @"页面加载出错" : localErrorDes;
    [MBProgressHUD showError:errorMsg];
}

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.scrollView.bounces = NO;
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.delegate = self;
    }
    return _webView;
}

@end

