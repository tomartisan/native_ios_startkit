//
//  FSPositionTools.h
//  FastApp
//
//  Created by tangkunyin on 16/5/26.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  基于相对位置的手动布局工具类，开发者无需关心控件具体的position，只需确定与父控件或同级控件的位置即可。
 */
@interface FSPositionTools : NSObject

// 针对默认为竖屏的有效
+ (void)placeView:(UIView*)subview atTheCenterOfTheView:(UIView*)container;

+ (void)placeView:(UIView*)subview atTheLeftMiddleOfTheView:(UIView*)container offset:(float)offset;
+ (void)placeView:(UIView*)subview atTheRightMiddleOfTheView:(UIView*)container offset:(float)offset;
+ (void)placeView:(UIView*)subview atTheTopMiddleOfTheView:(UIView*)container offset:(float)offset;
+ (void)placeView:(UIView*)subview atTheBottomMiddleOfTheView:(UIView*)container offset:(float)offset;

+ (void)placeView:(UIView*)subview atTheLeftTopOfTheView:(UIView*)container offset:(CGSize)offset;
+ (void)placeView:(UIView*)subview atTheRightTopOfTheView:(UIView*)container offset:(CGSize)offset;
+ (void)placeView:(UIView*)subview atTheLeftBottomOfTheView:(UIView*)container offset:(CGSize)offset;
+ (void)placeView:(UIView*)subview atTheRightBottomOfTheView:(UIView*)container offset:(CGSize)offset;

+ (void)placeView:(UIView *)sourceView toTheRightOfTheView:(UIView*)targetView span:(float)span;
+ (void)placeView:(UIView *)sourceView toTheLeftOfTheView:(UIView*)targetView span:(float)span;
+ (void)placeView:(UIView *)sourceView aboveTheView:(UIView*)targetView span:(float)span;
+ (void)placeView:(UIView *)sourceView belowTheView:(UIView*)targetView span:(float)span;

+ (void)placeView:(UIView *)sourceView toTheRightOfTheView:(UIView*)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;
+ (void)placeView:(UIView *)sourceView toTheLeftOfTheView:(UIView*)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;
+ (void)placeView:(UIView *)sourceView aboveTheView:(UIView*)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;
+ (void)placeView:(UIView *)sourceView belowTheView:(UIView*)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType;

// 用来处理横屏的情况下，在屏幕没有旋转到横屏位置之前的情况
+ (void)placeView:(UIView*)subview atTheCenterOfTheView:(UIView*)container needAlter:(BOOL)needAlter;

+ (void)placeView:(UIView*)subview atTheLeftMiddleOfTheView:(UIView*)container offset:(float)offset needAlter:(BOOL)needAlter;
+ (void)placeView:(UIView*)subview atTheRightMiddleOfTheView:(UIView*)container offset:(float)offset needAlter:(BOOL)needAlter;
+ (void)placeView:(UIView*)subview atTheTopMiddleOfTheView:(UIView*)container offset:(float)offset needAlter:(BOOL)needAlter;
+ (void)placeView:(UIView*)subview atTheBottomMiddleOfTheView:(UIView*)container offset:(float)offset needAlter:(BOOL)needAlter;

+ (void)placeView:(UIView*)subview atTheRightTopOfTheView:(UIView*)container offset:(CGSize)offset needAlter:(BOOL)needAlter;
+ (void)placeView:(UIView*)subview atTheLeftBottomOfTheView:(UIView*)container offset:(CGSize)offset needAlter:(BOOL)needAlter;
+ (void)placeView:(UIView*)subview atTheRightBottomOfTheView:(UIView*)container offset:(CGSize)offset needAlter:(BOOL)needAlter;

@end
