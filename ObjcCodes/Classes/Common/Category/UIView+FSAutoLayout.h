//
//  UIView+FSAutoLayout.h
//  FastApp
//
//  Created by tangkunyin on 16/3/12.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

//提供自动布局后的View宽高及坐标值
@interface UIView (FSAutoLayout)

@property (nonatomic, assign, readonly) CGPoint fsPoint;
@property (nonatomic, assign, readonly) CGSize fsSize;

@end
