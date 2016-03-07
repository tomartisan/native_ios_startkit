//
//  CommonScrollView.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <UIKit/UIKit.h>

//图片轮播公用组件
@interface CommonScrollView : UIView

- (void)prepareScrollViewsWithUrls:(NSArray<NSString *> *)urls;
- (void)actionForImageTaped:(void (^)(NSInteger index))action;

@end
