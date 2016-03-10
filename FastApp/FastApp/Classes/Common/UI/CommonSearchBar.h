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

/**
 * 
    使用Getter初始化
    - (CommonSearchBar *)searchBar
    {
        if (!_searchBar) {
            _searchBar = [[CommonSearchBar alloc] init];
            _searchBar.placeholder = @"搜索";
            _searchBar.textFieldBoderWidth = 1;
            _searchBar.textFieldCorner = 2;
            _searchBar.bounds = CGRectMake(0, 0, 250, 44);
        }
        return _searchBar;
    }
 */

@interface CommonSearchBar : UISearchBar

@property (nonatomic, assign) int textFieldBoderWidth;
@property (nonatomic, assign) int textFieldHeight;
@property (nonatomic, assign) int textFieldCorner;
@property (nonatomic, assign) UISearchBarIconStyle barIconStyle;

- (void)setCancelButtonTitleWithString:(NSString *)title;

@end
