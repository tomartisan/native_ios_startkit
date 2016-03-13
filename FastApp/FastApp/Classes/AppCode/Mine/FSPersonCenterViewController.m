//
//  FSPersonCenterViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/8.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSPersonCenterViewController.h"
#import "FSServerCommunicator.h"

@implementation FSPersonCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadDataTest];
}

- (void)loadDataTest
{
    [self loadingWithMessage:nil];
    FSServerCommunicator *serverReq = [[FSServerCommunicator alloc] init];
    __weak typeof(self) weakSelf = self;
    [serverReq doGetWithUri:@"/iOS/1449725518.html"
                      param:nil
                    respObj:nil
                    useSign:NO
                   progress:^(NSProgress *progress) {
                       NSLog(@"已完成：%f",progress.fractionCompleted);
                }completion:^(BOOL success, id respData) {
                     if (success) {
                         [weakSelf prepareViewWithData:respData];
                     }
    }];
}

- (void)prepareViewWithData:(NSString *)stringData
{
    UIWebView *webView = [UICreator createWebViewWithUrl:nil
                                                 baseURL:[NSURL URLWithString:API_SERVER_URL]
                                              htmlString:stringData
                                            scroolEnable:YES
                                                delegate:nil];
    [PositionTools layView:webView atCenterOfView:self.view maxSize:CGSizeZero margins:0];
    [self stopLoadding];
}


@end
