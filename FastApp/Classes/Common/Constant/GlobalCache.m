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

- (NSURL *)appServerUrl
{
    if (!_appServerUrl) {
        NSURL *cachedUrl = [FSCacheTools  getCachedApiServerUrl];
        if (![FSStringTools isEmpty:cachedUrl]) {
            _appServerUrl = cachedUrl;
        }else{
            //默认链接线上正式服务器
            _appServerUrl = [NSURL URLWithString:FS_AppServer];
        }
    }
    return _appServerUrl;
}

@end
