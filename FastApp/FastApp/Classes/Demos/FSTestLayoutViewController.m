//
//  FSTestLayoutViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSTestLayoutViewController.h"

#define viewSize CGSizeMake(60, 60)

@implementation FSTestLayoutViewController

{
    UIView *_top1;
    UIView *_top2;
    UIView *_top3;
    
    UIView *_mid1;
    UIView *_mid2;
    UIView *_mid3;
    
    UIView *_bot1;
    UIView *_bot2;
    UIView *_bot3;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MBProgressHUD showSuccess:@"你好啊"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareSubViews];
    
    
    if (self.inView) {
        [self allInnerPositionTest];
    }else{
        [self allOutterPositionTest];
    }
}

- (void)allInnerPositionTest
{
    //实现上、左、下、右、中各处一个，自动排列
    [PositionTools layView:_top1 insideView:self.view type:LeftTop maxSize:viewSize offset:CGSizeZero];
    [PositionTools layView:_top2 insideView:self.view type:MiddleTop maxSize:viewSize offset:CGSizeZero];
    [PositionTools layView:_top3 insideView:self.view type:RightTop maxSize:viewSize offset:CGSizeZero];
    
    [PositionTools layView:_mid1 insideView:self.view type:LeftMiddle maxSize:viewSize offset:CGSizeZero];
    [PositionTools layView:_mid2 atCenterOfView:self.view maxSize:viewSize margins:0];
    [PositionTools layView:_mid3 insideView:self.view type:RightMiddle maxSize:viewSize offset:CGSizeZero];
    
    [PositionTools layView:_bot1 insideView:self.view type:LeftBottom maxSize:viewSize offset:CGSizeZero];
    [PositionTools layView:_bot2 insideView:self.view type:MiddleBottom maxSize:viewSize offset:CGSizeZero];
    [PositionTools layView:_bot3 insideView:self.view type:RightBottom maxSize:viewSize offset:CGSizeZero];
}

- (void)allOutterPositionTest
{
    //实现围绕中心自动排列
    [PositionTools layView:_mid2 atCenterOfView:self.view maxSize:viewSize margins:0];
    
    CGSize roundViewSize = CGSizeMake(30, 30);
    
    //上下
    [PositionTools layView:_top2 outsideView:_mid2 type:MiddleTop maxSize:roundViewSize offset:CGSizeMake(0, 10)];
    [PositionTools layView:_bot2 outsideView:_mid2 type:MiddleBottom maxSize:roundViewSize offset:CGSizeMake(0, 10)];
    
    //左右
    [PositionTools layView:_mid1 outsideView:_mid2 type:LeftMiddle maxSize:roundViewSize offset:CGSizeMake(10, 0)];
    [PositionTools layView:_mid3 outsideView:_mid2 type:RightMiddle maxSize:roundViewSize offset:CGSizeMake(10, 0)];
    
    //四角
    [PositionTools layView:_top1 outsideView:_mid2 type:LeftTop maxSize:roundViewSize offset:CGSizeMake(10, 10)];
    [PositionTools layView:_bot1 outsideView:_mid2 type:LeftBottom maxSize:roundViewSize offset:CGSizeMake(10, 10)];
    [PositionTools layView:_top3 outsideView:_mid2 type:RightTop maxSize:roundViewSize offset:CGSizeMake(10, 10)];
    [PositionTools layView:_bot3 outsideView:_mid2 type:RightBottom maxSize:roundViewSize offset:CGSizeMake(10, 10)];
}

- (void)prepareSubViews
{
    _top1 = [UICreator createUIViewWithBgColor:RandomColorWithAlpha(1) Corner:0];
    _top2 = [UICreator createUIViewWithBgColor:RandomColorWithAlpha(1) Corner:0];
    _top3 = [UICreator createUIViewWithBgColor:RandomColorWithAlpha(1) Corner:0];
    
    _mid1 = [UICreator createUIViewWithBgColor:RandomColorWithAlpha(1) Corner:0];
    _mid2 = [UICreator createUIViewWithBgColor:RandomColorWithAlpha(1) Corner:0];
    _mid3 = [UICreator createUIViewWithBgColor:RandomColorWithAlpha(1) Corner:0];
    
    _bot1 = [UICreator createUIViewWithBgColor:RandomColorWithAlpha(1) Corner:0];
    _bot2 = [UICreator createUIViewWithBgColor:RandomColorWithAlpha(1) Corner:0];
    _bot3 = [UICreator createUIViewWithBgColor:RandomColorWithAlpha(1) Corner:0];
}

@end
