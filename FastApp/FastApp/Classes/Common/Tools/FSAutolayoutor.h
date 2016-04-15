//
//  FSAutolayoutor.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "Masonry.h"

//位置类型
typedef NS_ENUM(NSInteger,FSLayoutAlignmentType)
{
    AlignmentCenter=0,//默认居中
    AlignmentTop,
    AlignmentBottom,
    AlignmentLeft,
    AlignmentRight
};

//使用Masonry库封装的自动布局相关工具。支持旋屏
@interface FSAutolayoutor : NSObject


+ (void)layView:(UIView *)view fullOfTheView:(UIView *)superView;
+ (void)layView:(UIView *)view atCenterOfTheView:(UIView *)superView;
+ (void)layView:(UIView *)view atCenterOfTheView:(UIView *)superView margins:(float)margins;




+ (void)layView:(UIView*)subview atTheLeftMiddleOfTheView:(UIView*)container offset:(float)offset;
+ (void)layView:(UIView*)subview atTheRightMiddleOfTheView:(UIView*)container offset:(float)offset;
+ (void)layView:(UIView*)subview atTheTopMiddleOfTheView:(UIView*)container offset:(float)offset;
+ (void)layView:(UIView*)subview atTheBottomMiddleOfTheView:(UIView*)container offset:(float)offset;

+ (void)layView:(UIView*)subview atTheLeftTopOfTheView:(UIView*)container offset:(CGSize)offset;
+ (void)layView:(UIView*)subview atTheRightTopOfTheView:(UIView*)container offset:(CGSize)offset;
+ (void)layView:(UIView*)subview atTheLeftBottomOfTheView:(UIView*)container offset:(CGSize)offset;
+ (void)layView:(UIView*)subview atTheRightBottomOfTheView:(UIView*)container offset:(CGSize)offset;

+ (void)layView:(UIView *)sourceView toTheRightOfTheView:(UIView*)targetView span:(float)span;
+ (void)layView:(UIView *)sourceView toTheLeftOfTheView:(UIView*)targetView span:(float)span;
+ (void)layView:(UIView *)sourceView aboveTheView:(UIView*)targetView span:(float)span;
+ (void)layView:(UIView *)sourceView belowTheView:(UIView*)targetView span:(float)span;

+ (void)layView:(UIView *)sourceView toTheRightOfTheView:(UIView*)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;
+ (void)layView:(UIView *)sourceView toTheLeftOfTheView:(UIView*)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;
+ (void)layView:(UIView *)sourceView aboveTheView:(UIView*)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;
+ (void)layView:(UIView *)sourceView belowTheView:(UIView*)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;


/**
 *  根据位置类型，在targetView内放置sourceView。targetView与sourceView为父子关系
 *
 *  @param sourceView 源视图
 *  @param targetView 目标视图
 *  @param type       位置类型
 *  @param size       最大值
 *  @param offset     距离位置类型处的横纵向距离
 */

/**
 *  根据位置类型，在targetView外放置sourceView。targetView与sourceView为平级关系
 *
 *  @param sourceView 源视图
 *  @param targetView 目标视图
 *  @param type       位置类型
 *  @param size       最大值
 *  @param offset     距离位置类型处的横纵向距离
 */



@end
