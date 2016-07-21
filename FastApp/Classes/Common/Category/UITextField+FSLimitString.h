//
//  UITextField+FSLimitString.h
//  FastApp
//
//  Created by tangkunyin on 16/4/12.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,UITextFieldNumberRelationType)
{
    UITextFieldNumberRelationLess,
    UITextFieldNumberRelationLessEqual,
    UITextFieldNumberRelationLarge,
    UITextFieldNumberRelationLargeEqual
};

@interface UITextField (FSLimitString)

/**
 *  使用时只要调用此方法，加上一个长度(int)，就可以实现了字数限制,汉字不可以
 *
 *  @param length
 */
- (void)limitTextLength:(int)length;


/**
 *  对纯数字最大界限值判定
 *
 *  @param range 临界值
 *  @param type  越界关系
 */
- (void)pureNumberWithRange:(long)range relationType:(UITextFieldNumberRelationType)type;


@end
