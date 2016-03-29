//
//  FSNetTools.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSNetTools.h"
#import "AFNetworkReachabilityManager.h"

@implementation FSNetTools

SharedInstanceBuilder(FSNetTools)

- (void)dealloc
{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

- (void)addNetworkStatusListener
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                self.netReachable = NO;
                break;
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                self.netReachable = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                self.netReachable = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                self.netReachable = YES;
                break;
        }
    }];
}

+ (NSURLRequest *)getRequestWithURLString:(NSString *)urlString method:(NSString *)method timeOut:(int)second
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:second];
    [request setHTTPMethod:method];
    return request;
}

+ (void)downloadResourceWithUrl:(NSString *)url savedPath:(NSString *)localSavedPath timeout:(int)timeout
{
    NSURLRequest *request = [self getRequestWithURLString:url method:@"GET" timeOut:timeout];
    NSURLSessionDownloadTask *downloadTask = [[NSURLSession sharedSession] downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (nil == error) {
            NSData *data = [NSData dataWithContentsOfURL:location];
            if ([data writeToFile:localSavedPath options:NSDataWritingAtomic error:nil]) {
                NSLog(@"资源下载成功，并成功写入文件：%@",localSavedPath);
            }
        }else{
            NSLog(@"资源下载失败 >_< \n%@",error);
        }
    }];
    [downloadTask resume];
}

- (void)setNetReachable:(BOOL)netReachable
{
    _netReachable = netReachable;
    log(_netReachable ? @"网络已连接" : @"网络已断开")
}

@end