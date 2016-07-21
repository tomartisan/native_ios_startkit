//
//  FSCommnetsView.m
//  FastApp
//
//  Created by tangkunyin on 16/7/17.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSCommnetsView.h"

@interface FSCommnetsView () <UITextViewDelegate>
@property (nonatomic, strong) UILabel *placeHolderLabel;
@end

@implementation FSCommnetsView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.returnKeyType = UIReturnKeyDone;
        self.position = CommnetPlaceHolderLeftTop;
        self.placeHolderColor = COLOR(153, 153, 153);
        self.placeHolderFontSize = 13;
    }
    return self;
}

#pragma mark - setters
- (void)setPlaceHolder:(NSString *)placeHolder
{
    if (![FSStringTools isEmpty:placeHolder]) {
        self.placeHolderLabel.text = placeHolder;
        //根据字数字体大小动态计算label的宽高
        CGSize size = [placeHolder sizeWithAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:self.placeHolderFontSize] }];
        self.placeHolderLabel.frame = CGRectMake(5,5,size.width,size.height);
    }
}

- (void)setPosition:(CommnetPlaceHolderPosition)position
{
    switch (position) {
        case CommnetPlaceHolderLeftTop:
            [FSPositionTools placeView:self.placeHolderLabel atTheLeftTopOfTheView:self offset:CGSizeZero];
            break;
        case CommnetPlaceHolderLeftMiddle:
            [FSPositionTools placeView:self.placeHolderLabel atTheLeftMiddleOfTheView:self offset:10];
            break;
        case CommnetPlaceHolderCenter:
            [FSPositionTools placeView:self.placeHolderLabel atTheCenterOfTheView:self];
            break;
    }
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor
{
    _placeHolderColor = placeHolderColor;
    self.placeHolderLabel.textColor = _placeHolderColor;
}

- (void)setPlaceHolderFontSize:(float)placeHolderFontSize
{
    _placeHolderFontSize = placeHolderFontSize;
    self.placeHolderLabel.font = [UIFont systemFontOfSize:_placeHolderFontSize];
}

#pragma mark - delegates
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.placeHolderLabel.alpha = 0;
    if (self.customDelegate) {
        [self.customDelegate actionWhenTextViewBeginEditing];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([FSStringTools isEmpty:textView.text]) {
        self.placeHolderLabel.alpha = 1;
    }else{
        if (self.commontFinishBlock) {
            self.commontFinishBlock(textView.text);
        }
    }
    //执行自定义代理事件
    if (self.customDelegate) {
        [self.customDelegate actionWhenTextViewEndEditing];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark - getter
- (UILabel *)placeHolderLabel
{
    if (!_placeHolderLabel) {
        _placeHolderLabel = [UILabel new];
        _placeHolderLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _placeHolderLabel;
}



@end

