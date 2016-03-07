//
//  UICretator.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "UICretator.h"

@implementation UICretator

//For UIView
+ (UIView *)createUIViewWithBgColor:(UIColor *)bgColor Corner:(float)cornerRadius
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = bgColor;
    view.layer.cornerRadius = cornerRadius;
    return view;
}

+ (UIView *)createUIViewWithBgColor:(UIColor *)bgColor Corner:(float)cornerRadius actionGesture:(UIGestureRecognizer *)gesture
{
    UIView *view = [self createUIViewWithBgColor:bgColor Corner:cornerRadius];
    [view addGestureRecognizer:gesture];
    return view;
}

//For UILabel
+ (UILabel *)createLabel:(NSString *)text fontSize:(int)fontSize
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    if (fontSize > 0) {
        label.font = [UIFont systemFontOfSize:fontSize];
    }
    return label;
}

+ (UILabel *)createLabel:(NSAttributedString *)aText bgColor:(UIColor *)bgColor
{
    UILabel *label = [self createLabel:nil fontSize:0];
    label.backgroundColor = bgColor;
    label.attributedText = aText;
    return label;
}

+ (UILabel *)createLabel:(NSString *)text color:(UIColor *)color font:(UIFont *)font
{
    UILabel *label = [self createLabel:text fontSize:0];
    label.textColor = color;
    label.font = font;
    return label;
}

+ (UILabel *)createLabel:(NSString *)text color:(UIColor *)color bgColor:(UIColor *)bgColor font:(UIFont *)font
{
    UILabel *label = [self createLabel:text color:color font:font];
    label.backgroundColor = bgColor;
    return label;
}

//For UIButton
+ (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                             target:(id)target
                             action:(SEL)action
{
    return [self createButtonWithTitle:title
                            titleColor:titleColor
                                  font:font
                            buttonType:UIButtonTypeCustom
                               bgColor:nil
                                corner:0
                                target:self
                                action:action];
}

+ (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                         buttonType:(UIButtonType)buttonType
                            bgColor:(UIColor *)bgColor
                             corner:(float)cornerRadius
                             target:(id)target
                             action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:buttonType];
    [button setTitle:title forState:UIControlStateNormal];
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (font) {
        button.titleLabel.font = font;
    }
    if (bgColor) {
        button.backgroundColor = bgColor;
    }
    if (cornerRadius > 0) {
        button.layer.cornerRadius = cornerRadius;
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)createButtonWithTitle:(NSString *)title
                              image:(NSString *)imageName
                          titleEdge:(UIEdgeInsets)titleEdge
                          imageEdge:(UIEdgeInsets)imageEdge
                             target:(id)target
                             action:(SEL)action
{
    UIButton *button = [self createButtonWithTitle:title titleColor:nil font:nil target:target action:action];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitleEdgeInsets:titleEdge];
    [button setImageEdgeInsets:imageEdge];
    return button;
}

+ (UIButton *)createButtonWithNormalImage:(NSString *)normalImageName
                         highlightedImage:(NSString *)highlightedImageName
                                   target:(id)target
                                   action:(SEL)action
{
    UIButton *button = [self createButtonWithTitle:nil titleColor:nil font:nil target:target action:action];
    [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    return button;
}

+ (UIButton *)createButtonWithTitle:(NSString *)title
                              image:(NSString *)imageName
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                      directionType:(BtnImgDirectionType)type
         contentHorizontalAlignment:(UIControlContentHorizontalAlignment)hAlign
           contentVerticalAlignment:(UIControlContentVerticalAlignment)vAlign
                  contentEdgeInsets:(UIEdgeInsets)contentEdge
                               span:(CGFloat)span
                             target:(id)target
                             action:(SEL)action
{
    UIButton *button = [self createButtonWithTitle:title
                                        titleColor:titleColor
                                              font:font
                                            target:target
                                            action:action];
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = hAlign;
    button.contentVerticalAlignment = vAlign;
    button.contentEdgeInsets = contentEdge;
    
    CGSize imageSize = button.imageView.frame.size;
    CGSize titleSize = button.titleLabel.frame.size;
    CGFloat totalWidth = (imageSize.width + titleSize.width) + span;
    CGFloat totalHeight = (imageSize.height + titleSize.height) + span;
    
    switch (type) {
        case BtnImgDirectionDefault:
            button.titleEdgeInsets = UIEdgeInsetsMake(0, span, 0, 0);
            break;
        case BtnImgDirectionRight:
            button.imageEdgeInsets = UIEdgeInsetsMake(0, (totalWidth - imageSize.width) , 0, -titleSize.width);
            button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width , 0, (totalWidth - titleSize.width));
            break;
        case BtnImgDirectionTop:
            button.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0, 0, - titleSize.width);
            button.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height),0);
            break;
        case BtnImgDirectionBottom:
            button.imageEdgeInsets = UIEdgeInsetsMake((totalHeight - imageSize.height), 0, 0, - titleSize.width);
            button.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, (totalHeight - titleSize.height),0);
            break;
    }
    return button;
}

//For UIImageView
+ (UIImageView *)createImageViewFromImagename:(NSString *)imagename round:(BOOL)round
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imagename]];
    imageView.userInteractionEnabled = YES;
    if (round) {
        imageView.layer.cornerRadius = CGRectGetWidth(imageView.frame);
        imageView.layer.masksToBounds = YES;
    }
    return imageView;
}


//For UITextFiled
+ (UITextField *)createTextFieldWithFont:(UIFont *)font
                               textColor:(UIColor *)textColor
                         backgroundColor:(UIColor *)backgroundColor
                             borderStyle:(UITextBorderStyle)borderStyle
                             placeholder:(NSString *)placeholder
                                delegate:(id<UITextFieldDelegate>)delegate
{
    UITextField *textField = [[UITextField alloc] init];
    textField.font = font;
    textField.textColor = textColor;
    textField.backgroundColor = backgroundColor;
    textField.borderStyle = borderStyle;
    textField.placeholder = placeholder;
    textField.delegate = delegate;
    return textField;
}

+ (UITextField *)createTextFieldWithLeftAttrTitle:(NSAttributedString *)aTitle
                                             font:(UIFont *)font
                                        textColor:(UIColor *)textColor
                                  backgroundColor:(UIColor *)backgroundColor
                                      placeholder:(NSString *)placeholder
                                     keyboardType:(UIKeyboardType)keyboardType
                                    returnKeyType:(UIReturnKeyType)returnKeyType
                                         delegate:(id<UITextFieldDelegate>)delegate
{
    UITextField *textField = [self createTextFieldWithFont:font
                                                 textColor:textColor
                                           backgroundColor:backgroundColor
                                               borderStyle:UITextBorderStyleNone
                                               placeholder:placeholder
                                                  delegate:delegate];
    textField.keyboardType = keyboardType;
    textField.returnKeyType = returnKeyType;
    
    UILabel *label = [[UILabel alloc] init];
    label.attributedText = aTitle;
    
    textField.leftView = label;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    textField.enablesReturnKeyAutomatically = YES;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    return textField;
}

//For UITextView
+ (UITextView *)createTextViewWithAttrString:(NSAttributedString *)aString
                                  editEnable:(BOOL)eEnable
                                scroolEnable:(BOOL)sEnable
{
    UITextView *textView = [[UITextView alloc] init];
    if (aString) {
        textView.attributedText = aString;
    }
    textView.editable = eEnable;
    textView.scrollEnabled = sEnable;
    return textView;
}


//For UITableView
+ (UITableView *)createTableWithStyle:(UITableViewStyle)style
                   seporatorLineColor:(UIColor *)seporatorLineColor
                           headerView:(UIView *)headerView
                           footerView:(UIView *)footerView
                           zeroMargin:(BOOL)zeroMargin
                             delegate:(id<UITableViewDelegate, UITableViewDataSource>)delegate
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    tableView.separatorColor = seporatorLineColor;
    if (headerView) {
        tableView.tableHeaderView = headerView;
    }
    if (footerView) {
        tableView.tableFooterView = footerView;
    }else{
        tableView.tableFooterView = [[UIView alloc] init];
    }
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    if (zeroMargin) {
        if ([tableView respondsToSelector:@selector(setSeparatorInset:)]){
            [tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([tableView respondsToSelector:@selector(setLayoutMargins:)]){
            [tableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return tableView;
}


@end
