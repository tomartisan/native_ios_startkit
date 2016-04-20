//
//  FSAutolayoutor.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "Masonry.h"

//布局错误提示和错误断言
#define FSLayoutZeroSizeErrorMsg @"The value of view's size must not be CGSizeZero"
#define FSLayoutZeroSizeErrorAssert(view) NSAssert(!CGSizeEqualToSize(view.fsSize, CGSizeZero), FSLayoutZeroSizeErrorMsg)

//等边距、全屏宽等上下、全屏高等左右
#define FS_EqualMargins(margin) UIEdgeInsetsMake(margin, margin, margin, margin)
#define FS_WidthEqualMargins(margin) UIEdgeInsetsMake(margin, 0, margin, 0)
#define FS_HeightEqualMargins(margin) UIEdgeInsetsMake(0, margin, 0, margin)

//位置类型
typedef NS_ENUM(NSInteger,FSLayoutAlignmentType)
{
    AlignmentCenter=0,//默认居中
    AlignmentTop,
    AlignmentBottom,
    AlignmentLeft,
    AlignmentRight
};


/**
 *  使用Masonry库封装的自动布局相关工具，自适应宽高（可指定最小宽高），支持旋屏
 *  其中：部分方法需要设置子控件大小(CGSize)值，否则布局系统则会抛出异常
 */
@interface FSAutolayoutor : NSObject


//以下三个方法均为中心定位
+ (void)layView:(UIView *)view fullOfTheView:(UIView *)superView;
+ (void)layView:(UIView *)view atCenterOfTheView:(UIView *)superView;
+ (void)layView:(UIView *)view atCenterOfTheView:(UIView *)superView margins:(UIEdgeInsets)margins;


//以下三个方法均为左定位（左上，左中，左下）
+ (void)layView:(UIView *)subview atTheLeftTopOfTheView:(UIView *)container offset:(CGSize)offset;
+ (void)layView:(UIView *)subview atTheLeftMiddleOfTheView:(UIView *)container offset:(float)offset;
+ (void)layView:(UIView *)subview atTheLeftBottomOfTheView:(UIView *)container offset:(CGSize)offset;

//以下三个方法均为右定位（右上，右中，右下）
+ (void)layView:(UIView *)subview atTheRightTopOfTheView:(UIView *)container offset:(CGSize)offset;
+ (void)layView:(UIView *)subview atTheRightMiddleOfTheView:(UIView *)container offset:(float)offset;
+ (void)layView:(UIView *)subview atTheRightBottomOfTheView:(UIView *)container offset:(CGSize)offset;

//以下二个方法为上下定位（中上，中下）
+ (void)layView:(UIView *)subview atTheTopMiddleOfTheView:(UIView *)container offset:(float)offset;
+ (void)layView:(UIView *)subview atTheBottomMiddleOfTheView:(UIView *)container offset:(float)offset;


//以下方法均为外部定位，如果不指定type值，则默认在目标控件中间位置
+ (void)layView:(UIView *)sourceView toTheRightOfTheView:(UIView *)targetView span:(float)span;
+ (void)layView:(UIView *)sourceView toTheRightOfTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;

+ (void)layView:(UIView *)sourceView toTheLeftOfTheView:(UIView *)targetView span:(float)span;
+ (void)layView:(UIView *)sourceView toTheLeftOfTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;

+ (void)layView:(UIView *)sourceView aboveTheView:(UIView *)targetView span:(float)span;
+ (void)layView:(UIView *)sourceView aboveTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;

+ (void)layView:(UIView *)sourceView belowTheView:(UIView *)targetView span:(float)span;
+ (void)layView:(UIView *)sourceView belowTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;

@end
