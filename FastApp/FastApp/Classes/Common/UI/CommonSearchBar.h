//
//  CommonSearchBar.h
//  FastApp
//
//  Created by tangkunyin on 15/7/11.
//  Copyright (c) 2015年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UISearchBarIconStyle)
{
    UISearchIconSystemStyle,
    UISearchIconCustomStyle
};

@interface CommonSearchBar : UISearchBar

@property (nonatomic, assign) int textFieldBoderWidth;
@property (nonatomic, assign) int textFieldHeight;
@property (nonatomic, assign) int textFieldCorner;
@property (nonatomic, assign) UISearchBarIconStyle barIconStyle;

- (void)setCancelButtonTitleWithString:(NSString *)title;

@end
