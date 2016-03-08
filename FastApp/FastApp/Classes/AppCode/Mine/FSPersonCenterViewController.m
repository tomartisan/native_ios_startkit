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
    
    [MBProgressHUD loadding:YES];
    
    FSServerCommunicator *serverReq = [[FSServerCommunicator alloc] init];
    __weak typeof(self) weakSelf = self;
    [serverReq doGetWithUri:@"/iOS/1449725518.html"
                      param:nil
                    respObj:nil
                    useSign:NO
                 completion:^(BOOL success, id respData) {
                     if (success) {
                         [weakSelf prepareViewWithContent:respData];
                     }
    }];
    
}

- (void)prepareViewWithContent:(NSString *)content
{
    UIWebView *webView = [UICreator createWebViewWithUrl:nil
                                                 baseURL:nil
                                              htmlString:content
                                            scroolEnable:YES
                                                delegate:nil];
    
    [PositionTools layView:webView atCenterOfView:self.view fixedSize:CGSizeMake(kVCWIDTH, kVCHEIGHT) margins:0];
}

@end
