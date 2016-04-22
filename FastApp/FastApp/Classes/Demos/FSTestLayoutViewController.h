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
    FSTestLayoutType15=15,
    
    FSTestLayoutType21=21,
    FSTestLayoutType22=22,
    FSTestLayoutType23=23,
    FSTestLayoutType24=24,
    FSTestLayoutType25=25,
    FSTestLayoutType26=26,
    
    FSTestLayoutType31=31,
    FSTestLayoutType32=32,
    FSTestLayoutType33=33,
    FSTestLayoutType34=34,
    FSTestLayoutType35=35,
    FSTestLayoutType36=36,
    
    FSTestLayoutType41=41,
    FSTestLayoutType42=42,
    FSTestLayoutType43=43,
    FSTestLayoutType44=44,
};

//自动布局工具演示
@interface FSTestLayoutViewController : FSBaseSubViewController

@property (nonatomic, assign) FSTestLayoutType type;

@end
