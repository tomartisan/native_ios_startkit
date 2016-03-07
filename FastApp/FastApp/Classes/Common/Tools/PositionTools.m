//
//  PositionTools.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "PositionTools.h"

@implementation PositionTools

+ (void)layView:(UIView *)view
 atCenterOfView:(UIView *)superView
      fixedSize:(CGSize)size
        margins:(float)margins
{
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (margins > 0) {
            UIEdgeInsets padding = UIEdgeInsetsMake(margins, margins, margins, margins);
            make.edges.equalTo(superView).insets(padding);
        }else{
            make.center.equalTo(superView);
            make.size.mas_greaterThanOrEqualTo(size);
        }
    }];
}

+ (void)layView:(UIView *)sourceView
      toTheView:(UIView *)targetView
   positionType:(UIPositionType)type
      fixedSize:(CGSize)size
         offset:(CGSize)offset
        outside:(BOOL)outside
{
    if (outside) {
        [[targetView superview] addSubview:sourceView];
    }else{
        [targetView addSubview:sourceView];
    }
    switch (type) {
        case LeftTop:
            [self placeView:sourceView atLeftTopOfTheView:targetView fixedSize:size offset:offset outside:outside];
            break;
        case LeftMiddle:
            [self placeView:sourceView atLeftMiddleOfTheView:targetView fixedSize:size offset:offset outside:outside];
            break;
        case LeftBottom:
            [self placeView:sourceView atLeftBottomOfTheView:targetView fixedSize:size offset:offset outside:outside];
            break;
        case RightTop:
            [self placeView:sourceView atRightTopOfTheView:targetView fixedSize:size offset:offset outside:outside];
            break;
        case RightMiddle:
            [self placeView:sourceView atRightMiddleOfTheView:targetView fixedSize:size offset:offset outside:outside];
            break;
        case RightBottom:
            [self placeView:sourceView atRightBottomOfTheView:targetView fixedSize:size offset:offset outside:outside];
            break;
        case MiddleTop:
            [self placeView:sourceView atTopMiddleOfTheView:targetView fixedSize:size offset:offset outside:outside];
            break;
        case MiddleBottom:
            [self placeView:sourceView atBottomMiddleOfTheView:targetView fixedSize:size offset:offset outside:outside];
            break;
    }
}

+ (void)placeView:(UIView *)sourceView atLeftTopOfTheView:(UIView *)targetView fixedSize:(CGSize)size offset:(CGSize)offset outside:(BOOL)outside
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        CGFloat finalX = outside ? -(offset.width+size.width) : offset.width;
        CGFloat finalY = outside ? -(offset.height+size.height) : offset.height;
        make.left.equalTo(targetView).with.offset(finalX);
        make.top.equalTo(targetView).with.offset(finalY);
    }];
}

+ (void)placeView:(UIView *)sourceView atLeftMiddleOfTheView:(UIView *)targetView fixedSize:(CGSize)size offset:(CGSize)offset outside:(BOOL)outside
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        make.centerY.equalTo(targetView);
        CGFloat finalX = outside ? -(offset.width+size.width) : offset.width;
        make.left.equalTo(targetView).with.offset(finalX);
    }];
}

+ (void)placeView:(UIView *)sourceView atLeftBottomOfTheView:(UIView *)targetView fixedSize:(CGSize)size offset:(CGSize)offset outside:(BOOL)outside
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        CGFloat finalX = outside ? -(offset.width+size.width) : offset.width;
        CGFloat finalY = outside ? (offset.height+size.height) : offset.height;
        make.left.equalTo(targetView).with.offset(finalX);
        make.bottom.equalTo(targetView).with.offset(finalY);
    }];
}

+ (void)placeView:(UIView *)sourceView atRightTopOfTheView:(UIView *)targetView fixedSize:(CGSize)size offset:(CGSize)offset outside:(BOOL)outside
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        CGFloat finalX = outside ? (offset.width+size.width) : offset.width;
        CGFloat finalY = outside ? -(offset.height+size.height) : offset.height;
        make.right.equalTo(targetView).with.offset(finalX);
        make.top.equalTo(targetView).with.offset(finalY);
    }];
}

+ (void)placeView:(UIView *)sourceView atRightMiddleOfTheView:(UIView *)targetView fixedSize:(CGSize)size offset:(CGSize)offset outside:(BOOL)outside
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        make.centerY.equalTo(targetView);
        CGFloat finalX = outside ? (offset.width+size.width) : offset.width;
        make.right.equalTo(targetView).with.offset(finalX);
    }];
}

+ (void)placeView:(UIView *)sourceView atRightBottomOfTheView:(UIView *)targetView fixedSize:(CGSize)size offset:(CGSize)offset outside:(BOOL)outside
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        CGFloat finalX = outside ? (offset.width+size.width) : offset.width;
        CGFloat finalY = outside ? (offset.height+size.height) : offset.height;
        make.right.equalTo(targetView).with.offset(finalX);
        make.bottom.equalTo(targetView).with.offset(finalY);
    }];
}

+ (void)placeView:(UIView *)sourceView atTopMiddleOfTheView:(UIView *)targetView fixedSize:(CGSize)size offset:(CGSize)offset outside:(BOOL)outside
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        make.centerX.equalTo(targetView);
        CGFloat finalY = outside ? -(offset.height+size.height) : offset.height;
        make.top.equalTo(targetView).with.offset(finalY);
    }];
}

+ (void)placeView:(UIView *)sourceView atBottomMiddleOfTheView:(UIView *)targetView fixedSize:(CGSize)size offset:(CGSize)offset outside:(BOOL)outside
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        make.centerX.equalTo(targetView);
        CGFloat finalY = outside ? (offset.height+size.height) : offset.height;
        make.bottom.equalTo(targetView).with.offset(finalY);
    }];
}


@end
