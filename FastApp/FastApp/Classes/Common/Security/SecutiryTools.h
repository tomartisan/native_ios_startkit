//
//  SecutiryTools.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecutiryTools : NSObject

+ (NSString *)md5:(NSString *)str;
+ (NSString *)base64hmacsha1:(NSString *)text key:(NSString *)secret;
+ (NSData *)hmacsha1:(NSString *)text key:(NSString *)secret;
+ (NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key;
+ (NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;


@end
