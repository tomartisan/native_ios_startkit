//
//  FSCacheTools.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSCacheTools.h"

@implementation FSCacheTools


+ (id)dataForKey:(NSString *)key
{
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[FSPathTools libCachePath],key];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

+ (id)tmpDataForKey:(NSString *)key
{
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[FSPathTools tmpPath],key];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

+ (id)dataWithPath:(NSString *)path
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

+ (BOOL)cacheData:(id)data forKey:(NSString *)key
{
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[FSPathTools libCachePath],key];
    return [NSKeyedArchiver archiveRootObject:data toFile:filePath];
}

+ (BOOL)cacheTmpData:(id)data forKey:(NSString *)key
{
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[FSPathTools tmpPath],key];
    return [NSKeyedArchiver archiveRootObject:data toFile:filePath];
}

+ (BOOL)saveData:(id)data toPath:(NSString *)path
{
    return [NSKeyedArchiver archiveRootObject:data toFile:path];
}

+ (NSURL *)getCachedApiServerUrl
{
    return [[NSUserDefaults standardUserDefaults] URLForKey:@"CurrentApiServerUrl"];
}

+ (void)cacheCurrentApiServerUrl:(NSString *)url
{
    if (![FSStringTools isEmpty:url]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setURL:[NSURL URLWithString:url] forKey:@"CurrentApiServerUrl"];
        [userDefaults synchronize];
    }
}

@end
