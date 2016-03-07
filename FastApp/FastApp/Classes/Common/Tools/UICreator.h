//
//  UICretator.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

//用于按钮中，文字和图片相对方向
typedef NS_ENUM(NSInteger,BtnImgDirectionType)
{
    BtnImgDirectionDefault, //默认：图片居左，文字居右。整体左右结构
    BtnImgDirectionRight,   //图片居右，文字居左。整体左右机构
    BtnImgDirectionTop,     //图片居上，文字居下。整体上下机构
    BtnImgDirectionBottom,  //图片居下，文字居上。整体上下机构
};

@interface UICreator : NSObject

//For UIView
+ (UIView *)createUIViewWithBgColor:(UIColor *)bgColor
                             Corner:(float)cornerRadius;
+ (UIView *)createUIViewWithBgColor:(UIColor *)bgColor
                             Corner:(float)cornerRadius
                      actionGesture:(UIGestureRecognizer *)gesture;


//For UILabel
+ (UILabel *)createLabel:(NSString *)text
                fontSize:(int)fontSize;
+ (UILabel *)createLabel:(NSAttributedString *)aText
                 bgColor:(UIColor *)bgColor;
+ (UILabel *)createLabel:(NSString *)text
                   color:(UIColor *)color
                    font:(UIFont *)font;
+ (UILabel *)createLabel:(NSString *)text
                   color:(UIColor *)color
                 bgColor:(UIColor *)bgColor
                    font:(UIFont *)font;

//For UIButton
+ (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                             target:(id)target
                             action:(SEL)action;

+ (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                         buttonType:(UIButtonType)buttonType
                            bgColor:(UIColor *)bgColor
                             corner:(float)cornerRadius
                             target:(id)target
                             action:(SEL)action;

+ (UIButton *)createButtonWithTitle:(NSString *)title
                              image:(NSString *)imageName
                          titleEdge:(UIEdgeInsets)titleEdge
                          imageEdge:(UIEdgeInsets)imageEdge
                             target:(id)target
                             action:(SEL)action;

+ (UIButton *)createButtonWithNormalImage:(NSString *)normalImageName
                         highlightedImage:(NSString *)highlightedImageName
                                   target:(id)target
                                   action:(SEL)action;

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
                             action:(SEL)action;


//For UIImageView
+ (UIImageView *)createImageViewFromImagename:(NSString *)imagename round:(BOOL)round;


//For UITextFiled
+ (UITextField *)createTextFieldWithFont:(UIFont *)font
                               textColor:(UIColor *)textColor
                         backgroundColor:(UIColor *)backgroundColor
                             borderStyle:(UITextBorderStyle)borderStyle
                             placeholder:(NSString *)placeholder
                                delegate:(id<UITextFieldDelegate>)delegate;

+ (UITextField *)createTextFieldWithLeftAttrTitle:(NSAttributedString *)aTitle
                                             font:(UIFont*)font
                                        textColor:(UIColor*)textColor
                                  backgroundColor:(UIColor*)backgroundColor
                                      placeholder:(NSString*)placeholder
                                     keyboardType:(UIKeyboardType)keyboardType
                                    returnKeyType:(UIReturnKeyType)returnKeyType
                                         delegate:(id<UITextFieldDelegate>)delegate;


//For UITextView
+ (UITextView *)createTextViewWithAttrString:(NSAttributedString *)aString
                                  editEnable:(BOOL)eEnable
                                scroolEnable:(BOOL)sEnable;


//For UITableView
+ (UITableView *)createTableWithStyle:(UITableViewStyle)style
                   seporatorLineColor:(UIColor *)seporatorLineColor
                           headerView:(UIView *)headerView
                           footerView:(UIView *)footerView
                           zeroMargin:(BOOL)zeroMargin
                             delegate:(id<UITableViewDelegate, UITableViewDataSource>)delegate;


@end
