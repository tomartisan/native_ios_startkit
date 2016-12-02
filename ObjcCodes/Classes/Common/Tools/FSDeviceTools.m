//
//  FSDeviceTools.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSDeviceTools.h"
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

@implementation FSDeviceTools

+ (BOOL)isPhone
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}

+ (BOOL)isPad
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

+ (BOOL)is3p5InchPhone
{
    CGFloat height = MAX(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    return ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
            && 480 == height);
}

+ (BOOL)is4InchPhone
{
    CGFloat height = MAX(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    return ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
            && 568 == height);
}

+ (BOOL)is4p7InchPhone
{
    CGFloat height = MAX(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    return ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
            && 667 == height);
    
}

+ (BOOL)isPhone6P
{
    CGFloat height = MAX(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    return ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
            && 736 == height);
}

+ (BOOL)isLessThan4p7
{
    return ([self is3p5InchPhone] || [self is4InchPhone]);
}

//该方法有可能失效...
+ (BOOL)isSimulator
{
    return ([[[UIDevice currentDevice].model lowercaseString] rangeOfString:@"simulator"].location != NSNotFound);
}

+ (BOOL)isIOS7
{
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    return (version >= 7.0 && version < 8.0);
}

+ (BOOL)isIOS8
{
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    return (version >= 8.0 && version < 9.0);
}

+ (BOOL)isIOS9
{
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    return (version >= 9.0);
}

+ (BOOL)afterIOS7
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0;
}

+ (float)getUIScale
{
    if ([self isPhone]) {
        if ([self is3p5InchPhone] || [self is4InchPhone] || [self is4p7InchPhone]) {
            return 0.5f;
        }
        return 0.33;
    } else {
        return 1.0f;
    }
}

+ (NSString*)getIdentifier
{
    UIDevice *device = [UIDevice currentDevice];
    if ([device respondsToSelector:@selector(identifierForVendor)] && [NSUUID class]) {
        NSUUID *uuid = [device identifierForVendor];
        return [uuid UUIDString];
    } else {
        return [self getMacAddress];
    }
}

+ (NSString*)getMacAddress
{
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    return [outstring uppercaseString];
}


@end
