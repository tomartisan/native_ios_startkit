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
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(superView);
        make.width.mas_equalTo(@(CGRectGetWidth(view.frame)));
        make.height.mas_equalTo(@(CGRectGetHeight(view.frame)));
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
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(container).with.offset(offset.width);
        make.top.equalTo(container).with.offset(offset.height);
        make.width.mas_equalTo(@(CGRectGetWidth(subview.frame)));
        make.height.mas_equalTo(@(CGRectGetHeight(subview.frame)));
    }];
}
+ (void)layView:(UIView *)subview atTheLeftMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(container);
        make.left.equalTo(container).with.offset(offset);
        if (0 == CGRectGetWidth(subview.frame)) {
            make.width.equalTo(container);
        }else{
            make.width.mas_equalTo(@(CGRectGetWidth(subview.frame)));
        }
        
        if (0 == CGRectGetHeight(subview.frame)) {
            make.height.equalTo(container);
        }else{
            make.height.mas_equalTo(@(CGRectGetHeight(subview.frame)));
        }
    }];
}
+ (void)layView:(UIView *)subview atTheLeftBottomOfTheView:(UIView *)container offset:(CGSize)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(container).with.offset(offset.width);
        make.bottom.equalTo(container).with.offset(-offset.height);
        make.width.mas_equalTo(@(CGRectGetWidth(subview.frame)));
        make.height.mas_equalTo(@(CGRectGetHeight(subview.frame)));
    }];
}

//右边定位
+ (void)layView:(UIView *)subview atTheRightTopOfTheView:(UIView *)container offset:(CGSize)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(container).with.offset(-offset.width);
        make.top.equalTo(container).with.offset(offset.height);
        make.width.mas_equalTo(@(CGRectGetWidth(subview.frame)));
        make.height.mas_equalTo(@(CGRectGetHeight(subview.frame)));
    }];
}
+ (void)layView:(UIView *)subview atTheRightMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(container);
        make.right.equalTo(container).with.offset(-offset);
        if (0 == CGRectGetWidth(subview.frame)) {
            make.width.equalTo(container);
        }else{
            make.width.mas_equalTo(@(CGRectGetWidth(subview.frame)));
        }
        
        if (0 == CGRectGetHeight(subview.frame)) {
            make.height.equalTo(container);
        }else{
            make.height.mas_equalTo(@(CGRectGetHeight(subview.frame)));
        }
    }];
}
+ (void)layView:(UIView *)subview atTheRightBottomOfTheView:(UIView *)container offset:(CGSize)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(container).with.offset(-offset.width);
        make.bottom.equalTo(container).with.offset(-offset.height);
        make.width.mas_equalTo(@(CGRectGetWidth(subview.frame)));
        make.height.mas_equalTo(@(CGRectGetHeight(subview.frame)));
    }];
}

//上下定位
+ (void)layView:(UIView *)subview atTheTopMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(container);
        make.top.equalTo(container).with.offset(offset);
        
        if (0 == CGRectGetWidth(subview.frame)) {
            make.width.equalTo(container);
        }else{
            make.width.mas_equalTo(@(CGRectGetWidth(subview.frame)));
        }
        
        if (0 == CGRectGetHeight(subview.frame)) {
            make.height.equalTo(container);
        }else{
            make.height.mas_equalTo(@(CGRectGetHeight(subview.frame)));
        }
        
    }];
}
+ (void)layView:(UIView *)subview atTheBottomMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(container);
        make.bottom.equalTo(container).with.offset(-offset);
        
        if (0 == CGRectGetWidth(subview.frame)) {
            make.width.equalTo(container);
        }else{
            make.width.mas_equalTo(@(CGRectGetWidth(subview.frame)));
        }
        
        if (0 == CGRectGetHeight(subview.frame)) {
            make.height.equalTo(container);
        }else{
            make.height.mas_equalTo(@(CGRectGetHeight(subview.frame)));
        }
        
    }];
}


//根据类型，外部定位
+ (void)layView:(UIView *)sourceView toTheLeftOfTheView:(UIView *)targetView span:(float)span
{
    [self layView:sourceView toTheLeftOfTheView:targetView span:span alignmentType:AlignmentCenter];
}
+ (void)layView:(UIView *)sourceView toTheLeftOfTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{
    
}



+ (void)layView:(UIView *)sourceView toTheRightOfTheView:(UIView *)targetView span:(float)span
{
    [self layView:sourceView toTheRightOfTheView:targetView span:span alignmentType:AlignmentCenter];
}
+ (void)layView:(UIView *)sourceView toTheRightOfTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{

}



+ (void)layView:(UIView *)sourceView aboveTheView:(UIView *)targetView span:(float)span
{
    [self layView:sourceView aboveTheView:targetView span:span alignmentType:AlignmentCenter];
}
+ (void)layView:(UIView *)sourceView aboveTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{

}


+ (void)layView:(UIView *)sourceView belowTheView:(UIView *)targetView span:(float)span
{
    [self layView:sourceView belowTheView:targetView span:span alignmentType:AlignmentCenter];
}
+ (void)layView:(UIView *)sourceView belowTheView:(UIView *)targetView span:(float)span alignmentType:(FSLayoutAlignmentType)alignmentType
{

}


@end
