//
//  PositionTools.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "PositionTools.h"
#import "Masonry.h"

@implementation PositionTools

+ (void)layView:(UIView *)view atCenterOfView:(UIView *)superView maxSize:(CGSize)size margins:(float)margins
{
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (CGSizeEqualToSize(size, CGSizeZero)){
            if (margins > 0) {
                make.edges.equalTo(superView).insets(UIEdgeInsetsMake(margins, margins, margins, margins));
            }else{
                make.edges.equalTo(superView).insets(UIEdgeInsetsZero);
            }
        }else{
            make.center.equalTo(superView);
            make.size.mas_greaterThanOrEqualTo(size);
        }
    }];
}

+ (void)layView:(UIView *)sourceView insideView:(UIView *)targetView type:(UIPositionType)type maxSize:(CGSize)size offset:(CGSize)offset
{
    [self layView:sourceView toTheView:targetView type:type maxSize:size offset:offset inner:YES];
}

+ (void)layView:(UIView *)sourceView outsideView:(UIView *)targetView type:(UIPositionType)type maxSize:(CGSize)size offset:(CGSize)offset
{
    [self layView:sourceView toTheView:targetView type:type maxSize:size offset:offset inner:NO];
}

#pragma mark - private method
+ (void)layView:(UIView *)sourceView toTheView:(UIView *)targetView type:(UIPositionType)type maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
{
    @try {
        if (inner) {
            [targetView addSubview:sourceView];
        }else{
            [[targetView superview] addSubview:sourceView];
        }
        switch (type) {
            case LeftTop:
                [self placeView:sourceView atLeftTopOfTheView:targetView maxSize:size offset:offset inner:inner];
                break;
            case LeftMiddle:
                [self placeView:sourceView atLeftMiddleOfTheView:targetView maxSize:size offset:offset inner:inner];
                break;
            case LeftBottom:
                [self placeView:sourceView atLeftBottomOfTheView:targetView maxSize:size offset:offset inner:inner];
                break;
            case RightTop:
                [self placeView:sourceView atRightTopOfTheView:targetView maxSize:size offset:offset inner:inner];
                break;
            case RightMiddle:
                [self placeView:sourceView atRightMiddleOfTheView:targetView maxSize:size offset:offset inner:inner];
                break;
            case RightBottom:
                [self placeView:sourceView atRightBottomOfTheView:targetView maxSize:size offset:offset inner:inner];
                break;
            case MiddleTop:
                [self placeView:sourceView atTopMiddleOfTheView:targetView maxSize:size offset:offset inner:inner];
                break;
            case MiddleBottom:
                [self placeView:sourceView atBottomMiddleOfTheView:targetView maxSize:size offset:offset inner:inner];
                break;
        }
    }@catch (NSException *exception) {
        [MBProgressHUD showError:@"自动布局异常，请检查参数"];
    }
}

+ (void)placeView:(UIView *)sourceView atLeftTopOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        CGFloat finalX = !inner ? -(offset.width+size.width) : offset.width;
        CGFloat finalY = !inner ? -(offset.height+size.height) : offset.height;
        make.left.equalTo(targetView).with.offset(finalX);
        make.top.equalTo(targetView).with.offset(finalY);
    }];
}

+ (void)placeView:(UIView *)sourceView atLeftMiddleOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        make.centerY.equalTo(targetView);
        CGFloat finalX = !inner ? -(offset.width+size.width) : offset.width;
        make.left.equalTo(targetView).with.offset(finalX);
    }];
}

+ (void)placeView:(UIView *)sourceView atLeftBottomOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        CGFloat finalX = !inner ? -(offset.width+size.width) : offset.width;
        CGFloat finalY = !inner ? (offset.height+size.height) : offset.height;
        make.left.equalTo(targetView).with.offset(finalX);
        make.bottom.equalTo(targetView).with.offset(finalY);
    }];
}

+ (void)placeView:(UIView *)sourceView atRightTopOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        CGFloat finalX = !inner ? (offset.width+size.width) : offset.width;
        CGFloat finalY = !inner ? -(offset.height+size.height) : offset.height;
        make.right.equalTo(targetView).with.offset(finalX);
        make.top.equalTo(targetView).with.offset(finalY);
    }];
}

+ (void)placeView:(UIView *)sourceView atRightMiddleOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        make.centerY.equalTo(targetView);
        CGFloat finalX = !inner ? (offset.width+size.width) : offset.width;
        make.right.equalTo(targetView).with.offset(finalX);
    }];
}

+ (void)placeView:(UIView *)sourceView atRightBottomOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        CGFloat finalX = !inner ? (offset.width+size.width) : offset.width;
        CGFloat finalY = !inner ? (offset.height+size.height) : offset.height;
        make.right.equalTo(targetView).with.offset(finalX);
        make.bottom.equalTo(targetView).with.offset(finalY);
    }];
}

+ (void)placeView:(UIView *)sourceView atTopMiddleOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        make.centerX.equalTo(targetView);
        CGFloat finalY = !inner ? -(offset.height+size.height) : offset.height;
        make.top.equalTo(targetView).with.offset(finalY);
    }];
}

+ (void)placeView:(UIView *)sourceView atBottomMiddleOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
{
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_greaterThanOrEqualTo(size);
        make.centerX.equalTo(targetView);
        CGFloat finalY = !inner ? (offset.height+size.height) : offset.height;
        make.bottom.equalTo(targetView).with.offset(finalY);
    }];
}


@end
