//
//  UITextField+FSLimitString.m
//  FastApp
//
//  Created by tangkunyin on 16/4/12.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "UITextField+FSLimitString.h"

@implementation UITextField (FSLimitString)

static NSString *kLimitTextLengthKey = @"kLimitTextLengthKey";
static NSString *kPureNumberRangeKey = @"kPureNumberRangeKey";

- (void)limitTextLength:(int)length
{
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey), [NSNumber numberWithInt:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addTarget:self action:@selector(limitTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)pureNumberWithRange:(long)range relationType:(UITextFieldNumberRelationType)type
{
    objc_setAssociatedObject(self, (__bridge const void *)(kPureNumberRangeKey), @{@"range":@(range),@"type":@(type)}, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addTarget:self action:@selector(pureNumberRangeTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)limitTextFieldDidChange:(UITextField *)textField
{
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey));
    int length = [lengthNumber intValue];
    NSString *text = textField.text;
    NSString *lang = [[textField textInputMode] primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (text.length > length) {
                textField.text = [text substringToIndex:length];
            }
            // 有高亮选择的字符串，则暂不对文字进行统计和限制
        }else{
        }
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    }else{
        if (text.length > length) {
            textField.text = [text substringToIndex:length];
        }
    }
}

- (void)pureNumberRangeTextFieldDidChange:(UITextField *)textField
{
    NSDictionary *params = objc_getAssociatedObject(self, (__bridge const void *)kPureNumberRangeKey);
    long range = [[params valueForKey:@"range"] longValue];
    UITextFieldNumberRelationType type = [[params valueForKey:@"type"] integerValue];
    
    BOOL flag = NO;
    NSString *tmpText = textField.text;
    
    if (textField.text.mj_isPureInt) {
        long tmpRange = textField.text.longLongValue;
        switch (type) {
            case UITextFieldNumberRelationLess:
                flag = tmpRange < range;
                break;
            case UITextFieldNumberRelationLessEqual:
                flag = tmpRange <= range;
                break;
            case UITextFieldNumberRelationLarge:
                flag = tmpRange > range;
                break;
            case UITextFieldNumberRelationLargeEqual:
                flag = tmpRange >= range;
                break;
        }
    }
    
    if (tmpText.length > 0) {
        textField.text = flag ? tmpText : [tmpText substringToIndex:tmpText.length-1];
    }
    
}


@end
