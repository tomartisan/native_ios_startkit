//
//  CacheTools.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheTools : NSObject

+ (NSString *)getRootPath;
+ (NSString *)getFilePathByName:(NSString *)fileName subffix:(NSString *)subffix;
+ (NSString *)getLocalDataWithKey:(NSString *)key;

+ (void)saveDataToLocal:(id)data key:(NSString *)key;

//获取与保持服务器地址。便于随时切换服务器
+ (NSString *)getCachedApiServerUrl;
+ (void)cacheCurrentApiServerUrl:(NSString *)url;

@end
