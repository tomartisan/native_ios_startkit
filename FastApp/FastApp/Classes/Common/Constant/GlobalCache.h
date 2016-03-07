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
@property (nonatomic, copy) NSString *appServerUrl;

//当前版本号
@property (nonatomic, copy) NSString *versionNumber;
//编译版本号
@property (nonatomic, copy) NSString *buildVersion;

//银行卡对象
@property (nonatomic, copy) NSArray *banksInfo;

//地址对象列表
@property (nonatomic, copy) NSArray *addressArray;

//是否有网络链接
@property (nonatomic, assign) BOOL intenetReachable;


@end

