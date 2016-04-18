//
//  FSAutolayoutor.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSAutolayoutor.h"

@implementation FSAutolayoutor

//中间定位
+ (void)layView:(UIView *)view fullOfTheView:(UIView *)superView
{

}
+ (void)layView:(UIView *)view atCenterOfTheView:(UIView *)superView
{

}
+ (void)layView:(UIView *)view atCenterOfTheView:(UIView *)superView margins:(float)margins
{

}


//左边定位
+ (void)layView:(UIView *)subview atTheLeftTopOfTheView:(UIView *)container offset:(CGSize)offset
{

}
+ (void)layView:(UIView *)subview atTheLeftMiddleOfTheView:(UIView *)container offset:(float)offset
{

}
+ (void)layView:(UIView *)subview atTheLeftBottomOfTheView:(UIView *)container offset:(CGSize)offset
{

}

//右边定位
+ (void)layView:(UIView *)subview atTheRightTopOfTheView:(UIView *)container offset:(CGSize)offset
{

}
+ (void)layView:(UIView *)subview atTheRightMiddleOfTheView:(UIView *)container offset:(float)offset
{

}
+ (void)layView:(UIView *)subview atTheRightBottomOfTheView:(UIView *)container offset:(CGSize)offset
{

}

//中部定位
+ (void)layView:(UIView *)subview atTheTopMiddleOfTheView:(UIView *)container offset:(float)offset
{

}
+ (void)layView:(UIView *)subview atTheBottomMiddleOfTheView:(UIView *)container offset:(float)offset
{

}


//根据类型，外部定位
+ (void)layView:(UIView *)sourceView toTheRightOfTheView:(UIView *)targetView span:(float)span
{

}
+ (void)layView:(UIView *)sourceView toTheRightOfTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{

}


+ (void)layView:(UIView *)sourceView toTheLeftOfTheView:(UIView *)targetView span:(float)span
{

}
+ (void)layView:(UIView *)sourceView toTheLeftOfTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{

}


+ (void)layView:(UIView *)sourceView aboveTheView:(UIView *)targetView span:(float)span
{

}
+ (void)layView:(UIView *)sourceView aboveTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{

}


+ (void)layView:(UIView *)sourceView belowTheView:(UIView *)targetView span:(float)span
{

}
+ (void)layView:(UIView *)sourceView belowTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{

}


@end
