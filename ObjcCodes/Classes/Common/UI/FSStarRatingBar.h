//
//  FSStarRatingBar.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

//星星评分控件（目前为整数分，暂不支持小数打分）
@interface FSStarRatingBar : UIView

@property (nonatomic, copy, nonnull) void (^ratingSocreBlock)(int score);

- (nonnull instancetype)initWithFrame:(CGRect)frame
                          normalImage:(nonnull NSString *)normal
                       highLightImage:(nonnull NSString *)highLight
                            itemSpace:(float)space
                          ratingCount:(int)count;

@end
