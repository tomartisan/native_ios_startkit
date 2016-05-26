//
//  FSAutolayoutor.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSAutolayoutor.h"

//布局错误提示和错误断言
#define FSLayoutZeroSizeErrorMsg @"The value of view's size must not be CGSizeZero"
#define FSLayoutZeroSizeErrorAssert(view) NSAssert(!CGSizeEqualToSize(view.fsSize, CGSizeZero), FSLayoutZeroSizeErrorMsg)

@implementation FSAutolayoutor

//中间定位
+ (void)layView:(UIView *)view fullOfTheView:(UIView *)superView
{
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView).insets(UIEdgeInsetsZero);
    }];
}
+ (void)layView:(UIView *)view atCenterOfTheView:(UIView *)superView
{
    FSLayoutZeroSizeErrorAssert(view);
    [superView addSubview:view];
    __weak typeof(self) weakSelf = self;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(superView);
        [weakSelf fs_setWidthOrHeightForView:view targetView:superView maker:make];
    }];
}
+ (void)layView:(UIView *)view atTheView:(UIView *)superView margins:(UIEdgeInsets)margins
{
    if (UIEdgeInsetsEqualToEdgeInsets(margins,UIEdgeInsetsZero)) {
        [self layView:view fullOfTheView:superView];
    }else{
        [superView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superView).insets(margins);
        }];
    }
}


//左边定位
+ (void)layView:(UIView *)subview atTheLeftTopOfTheView:(UIView *)container offset:(CGSize)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    __weak typeof(self) weakSelf = self;
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(container).with.offset(offset.width);
        make.top.equalTo(container).with.offset(offset.height);
        [weakSelf fs_setWidthOrHeightForView:subview targetView:container maker:make];
    }];
}
+ (void)layView:(UIView *)subview atTheLeftMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    __weak typeof(self) weakSelf = self;
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(container);
        make.left.equalTo(container).with.offset(offset);
        [weakSelf fs_setWidthOrHeightForView:subview targetView:container maker:make];
    }];
}
+ (void)layView:(UIView *)subview atTheLeftBottomOfTheView:(UIView *)container offset:(CGSize)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    __weak typeof(self) weakSelf = self;
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(container).with.offset(offset.width);
        make.bottom.equalTo(container).with.offset(-offset.height);
        [weakSelf fs_setWidthOrHeightForView:subview targetView:container maker:make];
    }];
}

//右边定位
+ (void)layView:(UIView *)subview atTheRightTopOfTheView:(UIView *)container offset:(CGSize)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    __weak typeof(self) weakSelf = self;
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(container).with.offset(-offset.width);
        make.top.equalTo(container).with.offset(offset.height);
        [weakSelf fs_setWidthOrHeightForView:subview targetView:container maker:make];    }];
}
+ (void)layView:(UIView *)subview atTheRightMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    __weak typeof(self) weakSelf = self;
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(container);
        make.right.equalTo(container).with.offset(-offset);
        [weakSelf fs_setWidthOrHeightForView:subview targetView:container maker:make];
    }];
}
+ (void)layView:(UIView *)subview atTheRightBottomOfTheView:(UIView *)container offset:(CGSize)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    __weak typeof(self) weakSelf = self;
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(container).with.offset(-offset.width);
        make.bottom.equalTo(container).with.offset(-offset.height);
        [weakSelf fs_setWidthOrHeightForView:subview targetView:container maker:make];
    }];
}

//上下定位
+ (void)layView:(UIView *)subview atTheTopMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    __weak typeof(self) weakSelf = self;
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(container);
        make.top.equalTo(container).with.offset(offset);
        [weakSelf fs_setWidthOrHeightForView:subview targetView:container maker:make];
    }];
}
+ (void)layView:(UIView *)subview atTheBottomMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    __weak typeof(self) weakSelf = self;
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(container);
        make.bottom.equalTo(container).with.offset(-offset);
        [weakSelf fs_setWidthOrHeightForView:subview targetView:container maker:make];
    }];
}


//根据类型，外部定位
+ (void)layView:(UIView *)sourceView toTheLeftOfTheView:(UIView *)targetView span:(float)span
{
    [self layView:sourceView toTheLeftOfTheView:targetView span:span alignmentType:AlignmentCenter];
}
+ (void)layView:(UIView *)sourceView toTheLeftOfTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{
    FSLayoutZeroSizeErrorAssert(sourceView);
    [targetView.superview addSubview:sourceView];
    __weak typeof(self) weakSelf = self;
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        [weakSelf fs_setWidthOrHeightForView:sourceView targetView:targetView.superview maker:make];
        make.left.equalTo(targetView).with.offset(-CGRectGetWidth(sourceView.frame)-span);
        if (AlignmentTop == alignmentType) {
            make.top.equalTo(targetView);
        }else if (AlignmentBottom == alignmentType){
            make.bottom.equalTo(targetView);
        }else{
            make.centerY.equalTo(targetView);
        }
    }];
}



+ (void)layView:(UIView *)sourceView toTheRightOfTheView:(UIView *)targetView span:(float)span
{
    [self layView:sourceView toTheRightOfTheView:targetView span:span alignmentType:AlignmentCenter];
}
+ (void)layView:(UIView *)sourceView toTheRightOfTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{
    FSLayoutZeroSizeErrorAssert(sourceView);
    [targetView.superview addSubview:sourceView];
    __weak typeof(self) weakSelf = self;
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        [weakSelf fs_setWidthOrHeightForView:sourceView targetView:targetView.superview maker:make];
        make.right.equalTo(targetView).with.offset(CGRectGetWidth(sourceView.frame)+span);
        if (AlignmentTop == alignmentType) {
            make.top.equalTo(targetView);
        }else if (AlignmentBottom == alignmentType){
            make.bottom.equalTo(targetView);
        }else{
            make.centerY.equalTo(targetView);
        }
    }];
}



+ (void)layView:(UIView *)sourceView aboveTheView:(UIView *)targetView span:(float)span
{
    [self layView:sourceView aboveTheView:targetView span:span alignmentType:AlignmentCenter];
}
+ (void)layView:(UIView *)sourceView aboveTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{
    FSLayoutZeroSizeErrorAssert(sourceView);
    [targetView.superview addSubview:sourceView];
    __weak typeof(self) weakSelf = self;
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        [weakSelf fs_setWidthOrHeightForView:sourceView targetView:targetView.superview maker:make];
        make.top.equalTo(targetView).with.offset(-CGRectGetHeight(sourceView.frame)-span);
        if (AlignmentLeft == alignmentType) {
            make.left.equalTo(targetView);
        }else if (AlignmentRight == alignmentType){
            make.right.equalTo(targetView);
        }else{
            make.centerX.equalTo(targetView);
        }
    }];
}


+ (void)layView:(UIView *)sourceView belowTheView:(UIView *)targetView span:(float)span
{
    [self layView:sourceView belowTheView:targetView span:span alignmentType:AlignmentCenter];
}
+ (void)layView:(UIView *)sourceView belowTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{
    FSLayoutZeroSizeErrorAssert(sourceView);
    [targetView.superview addSubview:sourceView];
    __weak typeof(self) weakSelf = self;
    [sourceView mas_makeConstraints:^(MASConstraintMaker *make) {
        [weakSelf fs_setWidthOrHeightForView:sourceView targetView:targetView.superview maker:make];
        make.bottom.equalTo(targetView).with.offset(CGRectGetHeight(sourceView.frame)+span);
        if (AlignmentLeft == alignmentType) {
            make.left.equalTo(targetView);
        }else if (AlignmentRight == alignmentType){
            make.right.equalTo(targetView);
        }else{
            make.centerX.equalTo(targetView);
        }
    }];
}

#pragma mark - 设定空间宽高
+ (void)fs_setWidthOrHeightForView:(UIView *)sourceView targetView:(UIView *)targetView maker:(MASConstraintMaker *)make
{
    if (CGRectGetWidth(sourceView.frame) == 0) {
        make.width.equalTo(targetView);
    }else{
        make.width.mas_equalTo(@(CGRectGetWidth(sourceView.frame)));
    }
    
    if (CGRectGetHeight(sourceView.frame) == 0) {
        make.height.equalTo(targetView);
    }else{
        make.height.mas_equalTo(@(CGRectGetHeight(sourceView.frame)));
    }
}

@end
