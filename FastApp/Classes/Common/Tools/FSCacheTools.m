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
    
    return [NSKeyedUnarchiver unarchivedObjectOfClass:[NSString  class] fromData:[NSData dataWithContentsOfFile:filePath] error:nil];
}

+ (id)tmpDataForKey:(NSString *)key
{
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[FSPathTools tmpPath],key];
    return [NSKeyedUnarchiver unarchivedObjectOfClass:[NSString  class] fromData:[NSData dataWithContentsOfFile:filePath] error:nil];
}

+ (id)dataWithPath:(NSString *)path
{
    return [NSKeyedUnarchiver unarchivedObjectOfClass:[NSString  class] fromData:[NSData dataWithContentsOfFile:path] error:nil];
}

+ (BOOL)cacheData:(id)data forKey:(NSString *)key
{
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[FSPathTools libCachePath],key];
    return [[NSKeyedArchiver archivedDataWithRootObject:data requiringSecureCoding:YES error:nil] writeToFile:filePath atomically:YES];
}

+ (BOOL)cacheTmpData:(id)data forKey:(NSString *)key
{
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[FSPathTools tmpPath],key];
    return [[NSKeyedArchiver archivedDataWithRootObject:data requiringSecureCoding:YES error:nil] writeToFile:filePath atomically:YES];
}

+ (BOOL)saveData:(id)data toPath:(NSString *)path
{
    return [[NSKeyedArchiver archivedDataWithRootObject:data requiringSecureCoding:YES error:nil] writeToFile:path atomically:YES];
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
