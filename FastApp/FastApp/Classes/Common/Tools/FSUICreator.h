//
//  FSUICreator.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FSRectFromSize(size) CGRectMake(0,0,size.width,size,height)

//用于按钮中，文字和图片相对方向
typedef NS_ENUM(NSInteger,BtnImgDirectionType)
{
    BtnImgDirectionDefault, //默认：图片居左，文字居右。整体左右结构
    BtnImgDirectionRight,   //图片居右，文字居左。整体左右机构
    BtnImgDirectionTop,     //图片居上，文字居下。整体上下机构
    BtnImgDirectionBottom,  //图片居下，文字居上。整体上下机构
};

@interface FSUICreator : NSObject

//For UIView
+ (UIView *)createViewWithSize:(CGSize)size
                       bgColor:(UIColor *)bgColor
                        radius:(float)cornerRadius;

+ (UIView *)createViewWithSize:(CGSize)size
                       bgColor:(UIColor *)bgColor
                        radius:(float)cornerRadius
                       gesture:(UIGestureRecognizer *)gesture;


//For UILabel
+ (UILabel *)createLabelWithSize:(CGSize)size
                            text:(NSString *)text
                     sysFontSize:(int)fontSize;

+ (UILabel *)createLabelWithSize:(CGSize)size
                            text:(NSString *)text
                           color:(UIColor *)color
                            font:(UIFont *)font;

+ (UILabel *)createLabelWithSize:(CGSize)size
                           aText:(NSAttributedString *)aText
                         bgColor:(UIColor *)bgColor;

+ (UILabel *)createLabelWithFont:(UIFont *)font
                           aText:(NSAttributedString *)aText;


//For UIButton
+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                             target:(id)target
                             action:(SEL)action;

+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                         buttonType:(UIButtonType)buttonType
                            bgColor:(UIColor *)bgColor
                             corner:(float)cornerRadius
                             target:(id)target
                             action:(SEL)action;

+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                              image:(NSString *)imageName
                          titleEdge:(UIEdgeInsets)titleEdge
                          imageEdge:(UIEdgeInsets)imageEdge
                             target:(id)target
                             action:(SEL)action;

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
                             action:(SEL)action;

+ (UIButton *)createButtonWithNormalImage:(NSString *)normalImageName
                         highlightedImage:(NSString *)highlightedImageName
                                   target:(id)target
                                   action:(SEL)action;


//For UIImageView
+ (UIImageView *)createImageViewWithName:(NSString *)imageName;
+ (UIImageView *)createImageViewWithName:(NSString *)imageName size:(CGSize)size;
+ (UIImageView *)createImageViewWithName:(NSString *)imageName size:(CGSize)size radius:(float)cornerRadius;


//For UITextFiled
+ (UITextField *)createTextFieldWithSize:(CGSize)size
                             placeholder:(NSString *)placeholder
                                delegate:(id<UITextFieldDelegate>)delegate;

+ (UITextField *)createTextFieldWithSize:(CGSize)size
                                    Font:(UIFont *)font
                               textColor:(UIColor *)textColor
                         backgroundColor:(UIColor *)backgroundColor
                             borderStyle:(UITextBorderStyle)borderStyle
                             placeholder:(NSString *)placeholder
                            keyboardType:(UIKeyboardType)keyboardType
                           returnKeyType:(UIReturnKeyType)returnKeyType
                                delegate:(id<UITextFieldDelegate>)delegate;


//For UITextView
+ (UITextView *)createTextViewWithSize:(CGSize)size
                               aString:(NSAttributedString *)atrributeString
                            editEnable:(BOOL)eEnable
                          scroolEnable:(BOOL)sEnable;


//For UITableView
+ (UITableView *)createTableViewWithSize:(CGSize)size
                                   style:(UITableViewStyle)style
                               rowHeight:(float)height
                                delegate:(id<UITableViewDelegate, UITableViewDataSource>)delegate;

+ (UITableView *)createTableViewWithSize:(CGSize)size
                                   style:(UITableViewStyle)style
                              headerView:(UIView *)headerView
                              footerView:(UIView *)footerView
                            scrollEnable:(BOOL)sEnable
                           bouncesEnable:(BOOL)bEnable
                              zeroMargin:(BOOL)zeroMargin
                      seporatorLineColor:(UIColor *)seporatorLineColor
                                delegate:(id<UITableViewDelegate, UITableViewDataSource>)delegate;


//For UIWebView
+ (UIWebView *)createWebViewWithSize:(CGSize)size
                              webUrl:(NSString *)url
                             baseURL:(NSURL *)baseUrl
                          htmlString:(NSString *)htmlString
                        scroolEnable:(BOOL)sEnable
                           delegate:(id<UIWebViewDelegate>)delegate;


@end
