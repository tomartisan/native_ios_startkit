//
//  FSUICreator.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSUICreator.h"

@implementation FSUICreator

//For UIView
+ (UIView *)createViewWithSize:(CGSize)size
                       bgColor:(UIColor *)bgColor
                        radius:(float)cornerRadius
{
    UIView *view = [[UIView alloc] initWithFrame:FSRectFromSize(size)];
    view.backgroundColor = bgColor;
    view.layer.cornerRadius = cornerRadius;
    return view;
}

+ (UIView *)createViewWithSize:(CGSize)size
                       bgColor:(UIColor *)bgColor
                        radius:(float)cornerRadius
                       gesture:(UIGestureRecognizer *)gesture
{
    UIView *view = [self createViewWithSize:size bgColor:bgColor radius:cornerRadius];
    [view addGestureRecognizer:gesture];
    return view;
}

//For UILabel
+ (UILabel *)createLabelWithSize:(CGSize)size
                            text:(NSString *)text
                     sysFontSize:(int)fontSize
{
    UILabel *label = [self createLabelWithSize:size text:text sysFontSize:fontSize adjustText:YES];
    return label;
}

+ (UILabel *)createLabelWithSize:(CGSize)size
                            text:(NSString *)text
                     sysFontSize:(int)fontSize
                      adjustText:(BOOL)scale
{
    UILabel *label = [self createLabelWithSize:size text:text color:FSBlackColor font:SysFontWithSize(fontSize)];
    if (scale) {
        label.adjustsFontSizeToFitWidth = YES;
    }else{
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return label;
}

+ (UILabel *)createLabelWithSize:(CGSize)size
                            text:(NSString *)text
                           color:(UIColor *)color
                            font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:FSRectFromSize(size)];
    label.text = text;
    label.textColor = color;
    label.font = font;
    return label;
}

+ (UILabel *)createLabelWithSize:(CGSize)size
                           aText:(NSAttributedString *)aText
                         bgColor:(UIColor *)bgColor
{
    UILabel *label = [self createLabelWithSize:size text:nil color:nil font:nil];
    label.attributedText = aText;
    label.backgroundColor = bgColor;
    return label;
}

+ (UILabel *)createLabelWithFont:(UIFont *)font
                           aText:(NSAttributedString *)aText
{
    //此处根据font确定控件大小
    UILabel *label = [self createLabelWithSize:[aText size] aText:aText bgColor:nil];
    return label;
}


//For UIButton
+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                             target:(id)target
                             action:(SEL)action
{
    return [self createButtonWithTitle:title
                                  size:(CGSize)size
                            titleColor:titleColor
                                  font:font
                            buttonType:UIButtonTypeCustom
                               bgColor:nil
                                corner:0
                                target:target
                                action:action];
}

+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                         buttonType:(UIButtonType)buttonType
                            bgColor:(UIColor *)bgColor
                             corner:(float)cornerRadius
                             target:(id)target
                             action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = FSRectFromSize(size);
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
                               size:(CGSize)size
                              image:(NSString *)imageName
                          titleEdge:(UIEdgeInsets)titleEdge
                          imageEdge:(UIEdgeInsets)imageEdge
                             target:(id)target
                             action:(SEL)action
{
    UIButton *button = [self createButtonWithTitle:title size:size titleColor:nil font:nil target:target action:action];
    [button setImage:[UIImage imageWithNamed:imageName] forState:UIControlStateNormal];
    [button setTitleEdgeInsets:titleEdge];
    [button setImageEdgeInsets:imageEdge];
    return button;
}

+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
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
                                              size:size
                                        titleColor:titleColor
                                              font:font
                                            target:target
                                            action:action];
    
    [button setImage:[UIImage imageWithNamed:imageName] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = hAlign;
    button.contentVerticalAlignment = vAlign;
    button.contentEdgeInsets = contentEdge;
    
    CGSize imageSize = button.imageView.frame.size;
    CGSize titleSize = button.titleLabel.frame.size;
    CGFloat totalWidth = (imageSize.width + titleSize.width) + span;
    CGFloat totalHeight = (imageSize.height + titleSize.height) + span;
    
    switch (type) {
        case BtnImgDirectionDefault:
        {
            if (UIControlContentHorizontalAlignmentRight == hAlign) {
                button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, span);
            }else{
                button.titleEdgeInsets = UIEdgeInsetsMake(0, span, 0, 0);
            }
        }
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

+ (UIButton *)createButtonWithNormalImage:(NSString *)normalImageName
                         highlightedImage:(NSString *)highlightedImageName
                                   target:(id)target
                                   action:(SEL)action
{
    UIButton *button = [self createButtonWithTitle:nil size:CGSizeZero titleColor:nil font:nil target:target action:action];
    [button setImage:[UIImage imageWithNamed:normalImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithNamed:highlightedImageName] forState:UIControlStateHighlighted];
    CGSize size = [button imageForState:UIControlStateNormal].size;
    button.frame = FSRectFromSize(size);;
    return button;
}

//For UIImageView
+ (UIImageView *)createImageViewWithName:(NSString *)imageName
{
    CGSize size = [UIImage imageWithNamed:imageName].size;
    return [self createImageViewWithName:imageName size:size];
}

+ (UIImageView *)createImageViewWithName:(NSString *)imageName size:(CGSize)size
{
    return [self createImageViewWithName:imageName size:size radius:0];
}

+ (UIImageView *)createImageViewWithName:(NSString *)imageName size:(CGSize)size radius:(float)cornerRadius
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:FSRectFromSize(size)];
    imageView.image = [UIImage imageWithNamed:imageName];
    imageView.userInteractionEnabled = YES;
    imageView.layer.cornerRadius = cornerRadius;
    imageView.layer.masksToBounds = YES;
    return imageView;
}


//For UITextFiled
+ (UITextField *)createTextFieldWithSize:(CGSize)size
                             placeholder:(NSString *)placeholder
                                delegate:(id<UITextFieldDelegate>)delegate
{
    UITextField *textField = [[UITextField alloc] initWithFrame:FSRectFromSize(size)];
    textField.placeholder = placeholder;
    textField.delegate = delegate;
    return textField;
}

+ (UITextField *)createTextFieldWithSize:(CGSize)size
                                    Font:(UIFont *)font
                               textColor:(UIColor *)textColor
                         backgroundColor:(UIColor *)backgroundColor
                             borderStyle:(UITextBorderStyle)borderStyle
                             placeholder:(NSString *)placeholder
                            keyboardType:(UIKeyboardType)keyboardType
                           returnKeyType:(UIReturnKeyType)returnKeyType
                                delegate:(id<UITextFieldDelegate>)delegate
{
    UITextField *textField = [self createTextFieldWithSize:size placeholder:placeholder delegate:delegate];
    textField.font = font;
    textField.textColor = textColor;
    textField.backgroundColor = backgroundColor;
    textField.borderStyle = borderStyle;
    textField.keyboardType = keyboardType;
    textField.returnKeyType = returnKeyType;
    return textField;
}


//For UITextView
+ (UITextView *)createTextViewWithSize:(CGSize)size
                               aString:(NSAttributedString *)atrributeString
                            editEnable:(BOOL)eEnable
                          scroolEnable:(BOOL)sEnable
{
    UITextView *textView = [[UITextView alloc] initWithFrame:FSRectFromSize(size)];
    if (atrributeString) {
        textView.attributedText = atrributeString;
    }
    textView.editable = eEnable;
    textView.scrollEnabled = sEnable;
    textView.showsHorizontalScrollIndicator = NO;
    textView.showsVerticalScrollIndicator = NO;
    return textView;
}


//For UITableView
+ (UITableView *)createTableViewWithSize:(CGSize)size
                                   style:(UITableViewStyle)style
                               rowHeight:(float)height
                                delegate:(id<UITableViewDelegate, UITableViewDataSource>)delegate
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:FSRectFromSize(size) style:style];
    if (height == 0) {
        height = 44;
    }
    tableView.rowHeight = height;
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    return tableView;
}

+ (UITableView *)createTableViewWithSize:(CGSize)size
                                   style:(UITableViewStyle)style
                              headerView:(UIView *)headerView
                              footerView:(UIView *)footerView
                            scrollEnable:(BOOL)sEnable
                           bouncesEnable:(BOOL)bEnable
                              zeroMargin:(BOOL)zeroMargin
                      seporatorLineColor:(UIColor *)seporatorLineColor
                                delegate:(id<UITableViewDelegate, UITableViewDataSource>)delegate
{
    UITableView *tableView = [self createTableViewWithSize:size style:style rowHeight:0 delegate:delegate];
    if (headerView) {
        tableView.tableHeaderView = headerView;
    }
    if (footerView) {
        tableView.tableFooterView = footerView;
    }else{
        tableView.tableFooterView = [[UIView alloc] init];
    }
    if (zeroMargin) {
        if ([tableView respondsToSelector:@selector(setSeparatorInset:)]){
            [tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([tableView respondsToSelector:@selector(setLayoutMargins:)]){
            [tableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    tableView.scrollEnabled = sEnable;
    tableView.bounces = bEnable;
    tableView.separatorColor = seporatorLineColor;
    return tableView;
}

+ (WKWebView *)createWebViewWithSize:(CGSize)size
                              webUrl:(NSString *)url
                             baseURL:(NSURL *)baseUrl
                          htmlString:(NSString *)htmlString
                            delegate:(id)delegate
{
    WKWebView *webView = [[WKWebView alloc] initWithFrame:FSRectFromSize(size)];
    webView.UIDelegate = delegate;
    webView.navigationDelegate = delegate;
    webView.scrollView.bounces = NO;

    if (![FSStringTools isEmpty:url]) {
        NSURLRequest *request = [FSNetTools getRequestWithURLString:url method:@"GET" timeOut:FS_Timeout];
        [webView loadRequest:request];
    }
    
    if (![FSStringTools isEmpty:htmlString]) {
        [webView loadHTMLString:htmlString baseURL:baseUrl];
    }
    
    return webView;
}

@end
