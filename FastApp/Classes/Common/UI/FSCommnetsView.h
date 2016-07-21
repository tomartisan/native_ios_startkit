//
//  FSCommnetsView.h
//  FastApp
//
//  Created by tangkunyin on 16/7/17.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FSCommnetsDelegate <NSObject>

@optional

- (void)actionWhenTextViewBeginEditing;
- (void)actionWhenTextViewEndEditing;

@end



typedef NS_ENUM(NSInteger,CommnetPlaceHolderPosition)
{
    CommnetPlaceHolderLeftTop,
    CommnetPlaceHolderLeftMiddle,
    CommnetPlaceHolderCenter
};


//通用评论框，可自定义placeHolder
@interface FSCommnetsView : UITextView

@property (nonatomic, copy) NSString *placeHolder;
@property (nonatomic, assign) CommnetPlaceHolderPosition position;
@property (nonatomic, strong) UIColor *placeHolderColor;
@property (nonatomic, assign) float placeHolderFontSize;

@property (nonatomic, copy) void (^commontFinishBlock)(NSString *commont);

//自定义代理
@property (nonatomic, weak) id<FSCommnetsDelegate> customDelegate;

@end

