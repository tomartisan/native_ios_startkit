//
//  FSPathTools.m
//  FastApp
//
//  Created by tangkunyin on 16/3/29.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSPathTools.h"

@implementation FSPathTools

+ (BOOL)exists:(NSString *)path autoCreate:(BOOL)autoCreate
{
    if (autoCreate) {
        return [[NSFileManager defaultManager] createDirectoryAtPath:path
                                         withIntermediateDirectories:YES
                                                          attributes:nil
                                                               error:NULL];
    }
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (NSString *)pathForKey:(NSString *)key type:(FSPathType)type
{
    if (![FSStringTools isEmpty:key]) {
        NSString *dataPath = @"";
        switch (type) {
            case FSHomePathType:
                dataPath = [NSString stringWithFormat:@"%@/%@",[self homePath],key];
                break;
            case FSBundlePathType:
                dataPath = [[NSBundle mainBundle] pathForResource:key ofType:nil];
                break;
            case FSDocPathType:
                dataPath = [NSString stringWithFormat:@"%@/%@",[self docPath],key];
                break;
            case FSLibPrefPathType:
                dataPath = [NSString stringWithFormat:@"%@/%@",[self libPrefPath],key];
                break;
            case FSLibCachePathType:
                dataPath = [NSString stringWithFormat:@"%@/%@",[self libCachePath],key];
                break;
            case FSTmpPathType:
                dataPath = [NSString stringWithFormat:@"%@%@",[self tmpPath],key];
                break;
        }
        return dataPath;
    }
    return nil;
}

+ (NSString *)homePath
{
    return NSHomeDirectory();
}

+ (NSString *)docPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)libPrefPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Preferences"];
}

+ (NSString *)libCachePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)tmpPath
{
    return NSTemporaryDirectory();
}

@end
