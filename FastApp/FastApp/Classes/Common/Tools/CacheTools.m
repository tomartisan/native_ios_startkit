//
//  CacheTools.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "CacheTools.h"

@implementation CacheTools

+ (NSString *)getRootPath
{
    NSArray *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *baseHomePath = docsPath[0];
    return baseHomePath;
}

+ (NSString *)getFilePathByName:(NSString *)fileName subffix:(NSString *)subffix
{
    return [[NSBundle mainBundle] pathForResource:fileName ofType:subffix];
}

+ (NSString *)getLocalDataWithKey:(NSString *)key
{
    NSData *data = [NSData dataWithContentsOfFile:[self getSavedPathWithKey:key]];
    return (nil == data) ? nil : [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

+ (void)saveDataToLocal:(id)data key:(NSString *)key;
{
    [NSKeyedArchiver archiveRootObject:data toFile:[self getSavedPathWithKey:key]];
}

+ (NSString *)getCachedApiServerUrl
{
    return [self getLocalDataWithKey:@"MFQCurrentApiServerUrl"];
}

+ (void)cacheCurrentApiServerUrl:(NSString *)url
{
    return [self saveDataToLocal:url key:@"MFQCurrentApiServerUrl"];
}

#pragma private method

+ (NSString *)getSavedPathWithKey:(NSString *)key
{
    NSString *baseHomePath = [self getRootPath];
    if (!baseHomePath) {
        log(@"未找到目录");
    }
    return [baseHomePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.info",key]];
}


@end
