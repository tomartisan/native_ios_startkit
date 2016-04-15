//
//  FSAutolayoutor.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSAutolayoutor.h"

@implementation FSAutolayoutor







//+ (void)layView:(UIView *)view atCenterOfView:(UIView *)superView maxSize:(CGSize)size margins:(float)margins
//{
//    [superView addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        if (CGSizeEqualToSize(size, CGSizeZero)){
//            if (margins > 0) {
//                make.edges.equalTo(superView).insets(UIEdgeInsetsMake(margins, margins, margins, margins));
//            }else{
//                make.edges.equalTo(superView).insets(UIEdgeInsetsZero);
//            }
//        }else{
//            make.center.equalTo(superView);
//            make.size.mas_greaterThanOrEqualTo(size);
//        }
//    }];
//}

//+ (void)placeView:(UIView *)sourceView atLeftTopOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
//{
//    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_greaterThanOrEqualTo(size);
//        CGFloat finalX = !inner ? -(offset.width+size.width) : offset.width;
//        CGFloat finalY = !inner ? -(offset.height+size.height) : offset.height;
//        make.left.equalTo(targetView).with.offset(finalX);
//        make.top.equalTo(targetView).with.offset(finalY);
//    }];
//}
//
//+ (void)placeView:(UIView *)sourceView atLeftMiddleOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
//{
//    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_greaterThanOrEqualTo(size);
//        make.centerY.equalTo(targetView);
//        CGFloat finalX = !inner ? -(offset.width+size.width) : offset.width;
//        make.left.equalTo(targetView).with.offset(finalX);
//    }];
//}
//
//+ (void)placeView:(UIView *)sourceView atLeftBottomOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
//{
//    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_greaterThanOrEqualTo(size);
//        CGFloat finalX = !inner ? -(offset.width+size.width) : offset.width;
//        CGFloat finalY = !inner ? (offset.height+size.height) : offset.height;
//        make.left.equalTo(targetView).with.offset(finalX);
//        make.bottom.equalTo(targetView).with.offset(finalY);
//    }];
//}
//
//+ (void)placeView:(UIView *)sourceView atRightTopOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
//{
//    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_greaterThanOrEqualTo(size);
//        CGFloat finalX = !inner ? (offset.width+size.width) : offset.width;
//        CGFloat finalY = !inner ? -(offset.height+size.height) : offset.height;
//        make.right.equalTo(targetView).with.offset(finalX);
//        make.top.equalTo(targetView).with.offset(finalY);
//    }];
//}
//
//+ (void)placeView:(UIView *)sourceView atRightMiddleOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
//{
//    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_greaterThanOrEqualTo(size);
//        make.centerY.equalTo(targetView);
//        CGFloat finalX = !inner ? (offset.width+size.width) : offset.width;
//        make.right.equalTo(targetView).with.offset(finalX);
//    }];
//}
//
//+ (void)placeView:(UIView *)sourceView atRightBottomOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
//{
//    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_greaterThanOrEqualTo(size);
//        CGFloat finalX = !inner ? (offset.width+size.width) : offset.width;
//        CGFloat finalY = !inner ? (offset.height+size.height) : offset.height;
//        make.right.equalTo(targetView).with.offset(finalX);
//        make.bottom.equalTo(targetView).with.offset(finalY);
//    }];
//}
//
//+ (void)placeView:(UIView *)sourceView atTopMiddleOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
//{
//    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_greaterThanOrEqualTo(size);
//        make.centerX.equalTo(targetView);
//        CGFloat finalY = !inner ? -(offset.height+size.height) : offset.height;
//        make.top.equalTo(targetView).with.offset(finalY);
//    }];
//}
//
//+ (void)placeView:(UIView *)sourceView atBottomMiddleOfTheView:(UIView *)targetView maxSize:(CGSize)size offset:(CGSize)offset inner:(BOOL)inner
//{
//    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_greaterThanOrEqualTo(size);
//        make.centerX.equalTo(targetView);
//        CGFloat finalY = !inner ? (offset.height+size.height) : -offset.height;
//        make.bottom.equalTo(targetView).with.offset(finalY);
//    }];
//}
//

@end
