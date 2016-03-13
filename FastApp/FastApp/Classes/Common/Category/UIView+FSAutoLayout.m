//
//  UIView+FSAutoLayout.m
//  FastApp
//
//  Created by tangkunyin on 16/3/12.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "UIView+FSAutoLayout.h"

@implementation UIView (FSAutoLayout)

- (CGPoint)fsPoint
{
    [self layoutIfNeeded];
    return self.frame.origin;
}

- (CGSize)fsSize
{
    [self layoutIfNeeded];
    return self.frame.size;
}

@end
