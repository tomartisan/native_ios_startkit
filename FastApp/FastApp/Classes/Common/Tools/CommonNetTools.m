//
//  CommonNetTools.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "CommonNetTools.h"
#import "AFNetworkReachabilityManager.h"

@implementation CommonNetTools

- (void)dealloc
{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

+ (void)addNetworkStatusListener
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                [GlobalCache sharedInstance].intenetReachable = NO;
                break;
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                [GlobalCache sharedInstance].intenetReachable = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                [GlobalCache sharedInstance].intenetReachable = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                [GlobalCache sharedInstance].intenetReachable = YES;
                break;
        }
    }];
}

+ (void)cacheHTMLDataWithURL:(NSString *)urlString key:(NSString *)key
{
    if (nil == urlString || urlString.length <= 0) {
        return;
    }
    NSURLRequest *request = [self getRequestWithURLString:urlString method:@"GET" timeOut:30];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (nil == error) {
            NSString *contents = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            [CacheTools saveDataToLocal:contents key:key];
            NSLog(@"%@===>已缓存",key);
        }
    }];
    [task resume];
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

@end