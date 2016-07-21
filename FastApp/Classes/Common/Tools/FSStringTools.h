//
//  FSStringTools.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSStringTools : NSObject

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

/**
 *  将数组遍历返回由值拼接的字符串
 *
 *  @param array     字符串数组
 *  @param connector 值之间连接的符号，默认英文逗号
 *
 *  @return 拼接后的字符串
 */
+ (NSString *)stringFromArray:(NSArray<NSString *> *)array connector:(NSString *)connector;

@end
