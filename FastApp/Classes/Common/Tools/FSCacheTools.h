//
//  FSCacheTools.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSCacheTools : NSObject

//根据key值获取缓存目录数据
+ (id)dataForKey:(NSString *)key;

//根据key值获取临时目录数据
+ (id)tmpDataForKey:(NSString *)key;

//从指定地址获取数据
+ (id)dataWithPath:(NSString *)path;

//保存数据到 Library/Caches 目录，用于存放应用程序专用的支持文件，保存应用程序再次启动过程中需要的信息
+ (BOOL)cacheData:(id)data forKey:(NSString *)key;

//保存数据到 Library/tmp 目录，用于存放临时文件，保存应用程序再次启动过程中不需要的信息
+ (BOOL)cacheTmpData:(id)data forKey:(NSString *)key;

//保存数据到指定位置
+ (BOOL)saveData:(id)data toPath:(NSString *)path;

//获取与保存当前服务器地址，用于多个服务器切换测试
+ (NSURL *)getCachedApiServerUrl;
+ (void)cacheCurrentApiServerUrl:(NSString *)url;

@end
