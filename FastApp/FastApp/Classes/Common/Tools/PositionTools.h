//
//  PositionTools.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "Masonry.h"

//位置类型
typedef NS_ENUM(NSInteger,UIPositionType)
{
    LeftTop,        //左上角
    LeftMiddle,     //左中央
    LeftBottom,     //左下角
    RightTop,       //右上角
    RightMiddle,    //右中央
    RightBottom,    //右下角
    MiddleTop,      //中上方
    MiddleBottom    //中下方
};

//使用Masonry库封装的自动布局相关工具。支持旋屏
@interface PositionTools : NSObject


/**
 *  在父视图中央放置一个固定Size大小的子视图
 *
 *  @param view      子视图
 *  @param superView 父视图
 *  @param size      子视图大小，当size为CGSizeZero且margins为UIEdgeInsetsZero时，子视图大小与父视图相等
 *  @param margins   子视图相对父视图的内边距。
 */
+ (void)layView:(UIView *)view atCenterOfView:(UIView *)superView maxSize:(CGSize)size margins:(float)margins;


/**
 *  根据位置类型，在targetView内放置sourceView。targetView与sourceView为父子关系
 *
 *  @param sourceView 源视图
 *  @param targetView 目标视图
 *  @param type       位置类型
 *  @param size       最大值
 *  @param offset     距离位置类型处的横纵向距离
 */
+ (void)layView:(UIView *)sourceView insideView:(UIView *)targetView type:(UIPositionType)type maxSize:(CGSize)size offset:(CGSize)offset;


/**
 *  根据位置类型，在targetView外放置sourceView。targetView与sourceView为平级关系
 *
 *  @param sourceView 源视图
 *  @param targetView 目标视图
 *  @param type       位置类型
 *  @param size       最大值
 *  @param offset     距离位置类型处的横纵向距离
 */
+ (void)layView:(UIView *)sourceView outsideView:(UIView *)targetView type:(UIPositionType)type maxSize:(CGSize)size offset:(CGSize)offset;

@end
