//
//  FSBaseModel.m
//  FastApp
//
//  Created by tangkunyin on 16/6/11.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSBaseModel.h"

@implementation FSBaseModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id",
             @"desc":@"description"};
}

@end
