//
//  GlobalCache.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

//全局缓存对象
@interface GlobalCache : NSObject

SharedInstanceInterfaceBuilder(GlobalCache)

//当前api服务器名称和地址
@property (nonatomic, copy) NSURL *appServerUrl;


@end

