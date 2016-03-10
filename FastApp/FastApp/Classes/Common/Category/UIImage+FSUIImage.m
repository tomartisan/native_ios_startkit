//
//  UIImage+FSUIImage.m
//  FastApp
//
//  Created by tangkunyin on 16/3/10.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "UIImage+FSUIImage.h"

@implementation UIImage (FSUIImage)

+ (UIImage *)imageWithNamed:(NSString *)name;
{
    UIImage *image = [[self imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

@end
