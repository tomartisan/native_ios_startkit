//
//  FSPersonCenterViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/8.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSPersonCenterViewController.h"
#import "FSWebViewController.h"
#import "FSServerCommunicator.h"

@implementation FSPersonCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"说IT"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(webViewControllerTest)];
    
}

//服务器请求演示，带进度的
- (void)loadDataTest
{
    [self loadingWithMessage:nil];
    FSServerCommunicator *serverReq = [[FSServerCommunicator alloc] init];
    __weak typeof(self) weakSelf = self;
    [serverReq doPostWithUrl:@"http://www.qq.com"
                       param:nil
                     respObj:nil
                    progress:^(NSProgress *progress) {
                       NSLog(@"已完成：%f",progress.fractionCompleted);
                 }completion:^(BOOL success, id respData) {
                     if (success) {
                         NSLog(@"服务成功返回：%@",respData);
                     }
    }];
}



- (void)webViewControllerTest
{
    FSWebViewController *webVC = [[FSWebViewController alloc] initWithTitle:@"关注技术和人文的原创IT博客" webUrl:API_SERVER_URL];
    
    [self.navigationController pushViewController:webVC animated:YES];
}

@end
