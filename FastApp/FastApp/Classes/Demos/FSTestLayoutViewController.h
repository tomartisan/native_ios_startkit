//
//  FSTestLayoutViewController.h
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSBaseSubViewController.h"

typedef NS_ENUM(NSInteger,FSTestLayoutType)
{
    FSTestLayoutType11=11,
    FSTestLayoutType12=12,
    FSTestLayoutType13=13,
    FSTestLayoutType14=14,
    FSTestLayoutType15=15
};

//自动布局工具演示
@interface FSTestLayoutViewController : FSBaseSubViewController

@property (nonatomic, assign) FSTestLayoutType type;

@end
