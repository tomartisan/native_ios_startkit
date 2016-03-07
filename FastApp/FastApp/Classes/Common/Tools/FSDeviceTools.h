//
//  FSDeviceTools.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSDeviceTools : NSObject

+ (BOOL)isPhone;
+ (BOOL)isPad;
//4s
+ (BOOL)is3p5InchPhone;
//5c 5s
+ (BOOL)is4InchPhone;
//6 6s
+ (BOOL)is4p7InchPhone;
//6P 6sP
+ (BOOL)isPhone6P;
//小于4.7英寸的屏幕
+ (BOOL)isLessThan4p7;

+ (BOOL)isSimulator;

+ (BOOL)isIOS7;
+ (BOOL)isIOS8;
+ (BOOL)isIOS9;


+ (float)getUIScale;

+ (NSString *)getIdentifier;
+ (NSString *)getMacAddress;

@end
