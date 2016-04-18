//
//  FSWebViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSWebViewController.h"

@implementation FSWebViewController

- (instancetype)initWithTitle:(NSString *)title webUrl:(NSString *)url
{
    self = [super init];
    if (self) {
        self.title = title;
        __weak typeof(self) weakSelf = self;
        self.webView = [FSUICreator createWebViewWithSize:CGSizeZero
                                                   webUrl:url
                                                  baseURL:nil
                                               htmlString:nil
                                             scroolEnable:NO
                                                 delegate:weakSelf];
        [FSAutolayoutor layView:self.webView fullOfTheView:self.view];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - delegates
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

@end

