//
//  FSPathTools.h
//  FastApp
//
//  Created by tangkunyin on 16/3/29.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,FSPathType)
{
    FSHomePathType,
    FSBundlePathType,
    FSDocPathType,
    FSLibPrefPathType,
    FSLibCachePathType,
    FSTmpPathType
};

@interface FSPathTools : NSObject

/**
 *  判断目录是否存在，不存在则创建
 *
 *  @param path       目录名称
 *  @param autoCreate 如果目录不存在，是否自动创建
 *
 *  @return 目录是否存在或创建成功
 */
+ (BOOL)exists:(NSString *)path autoCreate:(BOOL)autoCreate;


/**
 *  根据key和目录类型返回数据存放的地址
 *
 *  @param key  数据名称
 *  @param type 目录类型
 *
 *  @return 数据存放位置
 */
+ (NSString *)pathForKey:(NSString *)key type:(FSPathType)type;


/**
 *  @return 沙盒主目录，可见子目录(3个):Documents、Library、tmp
 */
+ (NSString *)homePath;

/**
 *  @return 文档目录，需要ITUNES同步备份的数据存这里，可存放用户数据
 */
+ (NSString *)docPath;

/**
 *  @return 配置目录，偏好设置存这里
 */
+ (NSString *)libPrefPath;

/**
 *  @return 缓存目录，系统永远不会删除这里的文件，ITUNES会删除
 */
+ (NSString *)libCachePath;

/**
 *  @return 临时缓存目录，APP退出后，系统可能会删除这里的内容
 */
+ (NSString *)tmpPath;

@end
