//
//  PositionTools.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

//位置类型
typedef NS_ENUM(NSInteger,UIPositionType)
{
    LeftTop,        //左上角
    LeftMiddle,     //左中央
    LeftBottom,     //左下角
    RightTop,       //右上角
    RightMiddle,    //右中央
    RightBottom,    //右下角
    MiddleTop,      //中上方
    MiddleBottom    //中下方
};

//使用Masonry库封装的自动布局相关工具
@interface PositionTools : NSObject

//当margins不为零时，fixedSize值不生效
+ (void)layView:(UIView *)view
 atCenterOfView:(UIView *)superView
      fixedSize:(CGSize)size
        margins:(float)margins;

//当outside为YES时，sourceView与targetView为平级元素
+ (void)layView:(UIView *)sourceView
      toTheView:(UIView *)targetView
   positionType:(UIPositionType)type
      fixedSize:(CGSize)size
         offset:(CGSize)offset
        outside:(BOOL)outside;

@end
