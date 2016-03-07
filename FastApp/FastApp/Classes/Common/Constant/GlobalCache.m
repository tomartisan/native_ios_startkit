//
//  GlobalCache.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "GlobalCache.h"

@implementation GlobalCache

SharedInstanceBuilder(GlobalCache)

- (NSString *)appServerUrl
{
    if (!_appServerUrl) {
        NSString *cachedUrl = [CacheTools  getCachedApiServerUrl];
        if (![StringTools isEmpty:cachedUrl]) {
            _appServerUrl = cachedUrl;
        }else{
            //默认链接线上正式服务器
            _appServerUrl = API_SERVER_URL;
        }
    }
    return _appServerUrl;
}

- (NSString *)versionNumber
{
    if (!_versionNumber) {
        _versionNumber = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"];
    }
    return _versionNumber;
}

- (NSString *)buildVersion
{
    if (!_buildVersion) {
        _buildVersion = [[[NSBundle mainBundle] infoDictionary] valueForKey:(NSString *)kCFBundleVersionKey];
    }
    return _buildVersion;
}

- (void)setIntenetReachable:(BOOL)intenetReachable
{
    _intenetReachable = intenetReachable;
    log(_intenetReachable ? @"网络已连接" : @"网络已断开")
}


@end
