//
//  StringTools.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringTools : NSObject

+ (NSString *)uuid;
+ (NSString *)urlEncodeWithUTF8:(NSString *)sourceString;
+ (NSString *)urlDecodeWithUTF8:(NSString *)sourceString;


+ (BOOL)isValidateEmail:(NSString *)email;

+ (NSString *)filtHtmlTag:(NSString *)string;
+ (NSString *)filterString:(NSString *)string;

+ (NSString *)currentDateOfToday;
+ (NSString *)getDateTimeString:(NSDate *)dateTime;
+ (NSString *)getTimeTextFromInterval:(NSTimeInterval)interval;

+ (NSString *)filterFullWidthSpace:(NSString *)text;

+ (BOOL)isEmpty:(id)object;
+ (NSString *)trimString:(NSString *)string;

+ (NSString *)jsonStringFromObject:(id)object;

+ (NSString *)dictToCommonString:(NSDictionary *)dict;

+ (NSString *)md5Strings:(NSArray *)strArray;

+ (NSString *)paramStringFromDict:(NSDictionary *)dict;

@end
