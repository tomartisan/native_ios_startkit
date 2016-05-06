//
//  FSNetTools.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSNetTools : NSObject

SharedInstanceInterfaceBuilder(FSNetTools)

//是否有网络链接
@property (nonatomic, assign) BOOL netReachable;

- (void)addNetworkStatusListener;


+ (NSURLRequest *)getRequestWithURLString:(NSString *)urlString method:(NSString *)method timeOut:(int)second;
+ (void)downloadResourceWithUrl:(NSString *)url savedPath:(NSString *)localSavedPath timeout:(int)timeout;

@end