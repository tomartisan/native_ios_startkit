//
//  CommonNetTools.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NetWorkErrorType)
{
    NoConnectionError,//无网络
    RequestFailedError//请求失败
};

@interface CommonNetTools : NSObject

+ (void)addNetworkStatusListener;

+ (void)cacheHTMLDataWithURL:(NSString *)urlString key:(NSString *)key;
+ (NSURLRequest *)getRequestWithURLString:(NSString *)urlString method:(NSString *)method timeOut:(int)second;
+ (void)downloadResourceWithUrl:(NSString *)url savedPath:(NSString *)localSavedPath timeout:(int)timeout;

@end