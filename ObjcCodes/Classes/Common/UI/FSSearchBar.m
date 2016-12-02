//
//  FSSearchBar.m
//  FastApp
//
//  Created by tangkunyin on 15/7/11.
//  Copyright (c) 2015年 www.shuoit.net. All rights reserved.
//

#import "FSSearchBar.h"

@implementation FSSearchBar

- (instancetype)init
{
    if (self = [super init]) {
        [self p_removeSeachBarBackgroundView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_removeSeachBarBackgroundView];
    }
    return self;
}

- (void)setCancelButtonTitleWithString:(NSString *)title
{
    for(UIView *view in  [[[self subviews] objectAtIndex:0] subviews]) {
        if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]]) {
            UIButton * cancel =(UIButton *)view;
            cancel.titleLabel.font = SysFontWithSize(14);
            [cancel setTitleColor:FSlightGrayColor forState:UIControlStateNormal];
            [cancel setTitle:title forState:UIControlStateNormal];
            break;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *subViews in self.subviews) {
        UIView *searchBarTextField = [[subViews subviews] objectAtIndex:0];
        if ([searchBarTextField  isKindOfClass:[NSClassFromString(@"UISearchBarTextField") class]]) {
            UITextField *textField = (UITextField *)searchBarTextField;
            textField.layer.borderColor = FSSeparatorLineColor.CGColor;
            //改边框宽度
            if (_textFieldBoderWidth > 0) {
                textField.layer.borderWidth = _textFieldBoderWidth;
            }else{
                textField.layer.borderWidth = SINGLE_LINE_ADJUST_OFFSET;
            }
            //改边框圆角
            if (_textFieldCorner > 0) {
                textField.layer.cornerRadius = _textFieldCorner;
            }
            
            if (_textFieldHeight > 0 && self.frame.size.height >= _textFieldHeight) {
                CGRect textFieldFrame = textField.frame;
                textFieldFrame = CGRectMake(textFieldFrame.origin.x,0,
                                            textFieldFrame.size.width,
                                            _textFieldHeight);
                textField.frame = textFieldFrame;
            }
            if (_barIconStyle == UISearchIconCustomStyle) {
                UIImage *image = [UIImage imageWithNamed:@"SearchIcon"];
                UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
                imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
                textField.leftView = imageView;
                textField.leftViewMode= UITextFieldViewModeAlways;
            }
        }
    }
}

- (void)p_removeSeachBarBackgroundView
{
    [[[[self.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
}

@end
