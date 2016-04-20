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
        make.width.mas_equalTo(@(view.fsSize.width));
        make.height.mas_equalTo(@(view.fsSize.height));
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
        make.width.mas_equalTo(@(subview.fsSize.width));
        make.height.mas_equalTo(@(subview.fsSize.height));
    }];
}
+ (void)layView:(UIView *)subview atTheLeftMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(container);
        make.left.equalTo(container).with.offset(offset);
        make.width.mas_equalTo(@(subview.fsSize.width));
        make.height.mas_equalTo(@(subview.fsSize.height));
    }];
}
+ (void)layView:(UIView *)subview atTheLeftBottomOfTheView:(UIView *)container offset:(CGSize)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(container).with.offset(offset.width);
        make.bottom.equalTo(container).with.offset(-offset.height);
        make.width.mas_equalTo(@(subview.fsSize.width));
        make.height.mas_equalTo(@(subview.fsSize.height));
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
        make.width.mas_equalTo(@(subview.fsSize.width));
        make.height.mas_equalTo(@(subview.fsSize.height));
    }];
}
+ (void)layView:(UIView *)subview atTheRightMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(container);
        make.right.equalTo(container).with.offset(-offset);
        make.width.mas_equalTo(@(subview.fsSize.width));
        make.height.mas_equalTo(@(subview.fsSize.height));
    }];
}
+ (void)layView:(UIView *)subview atTheRightBottomOfTheView:(UIView *)container offset:(CGSize)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(container).with.offset(-offset.width);
        make.bottom.equalTo(container).with.offset(-offset.height);
        make.width.mas_equalTo(@(subview.fsSize.width));
        make.height.mas_equalTo(@(subview.fsSize.height));
    }];
}

//中部定位
+ (void)layView:(UIView *)subview atTheTopMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(container);
        
        make.top.equalTo(container).with.offset(offset);
        make.width.mas_equalTo(@(subview.fsSize.width));
        make.height.mas_equalTo(@(subview.fsSize.height));
    }];
}
+ (void)layView:(UIView *)subview atTheBottomMiddleOfTheView:(UIView *)container offset:(float)offset
{
    FSLayoutZeroSizeErrorAssert(subview);
    [container addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(container);
        
        
        make.bottom.equalTo(container).with.offset(-offset);
        make.width.mas_equalTo(@(subview.fsSize.width));
        make.height.mas_equalTo(@(subview.fsSize.height));
    }];
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
