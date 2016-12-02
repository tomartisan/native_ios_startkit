//
//  FSTimerButton.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,FSTimerButtonRemainTitleType)
{
    RemainTitleDefaultType, //默认格式，如：60秒后重新获取
    RemainTitlePureTimeType //纯时间，如：(60s)
};


@interface FSTimerButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame
                  normalTitle:(NSString *)normalTitle
                    textColor:(UIColor *)color
              remainTitleType:(FSTimerButtonRemainTitleType)type
                       target:(id)target
                       action:(SEL)action
               useDefaultSkin:(BOOL)defaultSkin;

- (void)starTimerWithSecond:(int)seconds;

@end
