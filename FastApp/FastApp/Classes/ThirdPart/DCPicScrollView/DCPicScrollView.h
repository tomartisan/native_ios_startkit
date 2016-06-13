//
//  basePicScrollView.h
//  DCWebPicScrollView
//
//  Created by dengchen on 15/12/5.
//  Updated by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PageControlStyle) {
    PageControlAtCenter,
    PageControlAtRight,
};

@interface DCPicScrollView : UIView

@property (nonatomic,assign) PageControlStyle style; //设置PageControl位置 default is PageControlAtCenter

@property (nonatomic,strong) UIImage *placeImage;//占位图片

@property (nonatomic, copy) NSArray<NSString *> *images;//如果从网络加载，则该参数为合法可用的URLs，否则将使图片名称数组

@property (nonatomic, copy) NSArray<NSString *> *titleData; //设置后显示label,自动设置PageControlAtRight

@property (nonatomic, assign) NSTimeInterval AutoScrollDelay; //default is 2.0f,如果小于0.5不自动播放

@property (nonatomic, strong) UIColor *pageIndicatorTintColor;

@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, copy) void(^imageViewDidTapAtIndex)(NSInteger index); //index从0开始,图片被点击会调用该block

/**
 *  实例化方法
 *
 *  @param frame   滚动图大小
 *  @param imgName 占位图名称
 *
 *  @return 滚动图实例
 */
- (instancetype)initWithFrame:(CGRect)frame placeHolderImage:(NSString *)imgName;

/**
 *  初始化方法
 *
 *  @param frame    滚动图大小
 *  @param imageUrl 如果从网络加载，则该参数为合法可用的URLs，否则将使图片名称数组
 *
 *  @return 滚动图实例
 */
+ (instancetype)picScrollViewWithFrame:(CGRect)frame images:(NSArray<NSString *> *)imgs;

@end

