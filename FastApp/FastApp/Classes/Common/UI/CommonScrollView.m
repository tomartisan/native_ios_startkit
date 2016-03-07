//
//  CommonScrollView.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "CommonScrollView.h"
#import "DCPicScrollView.h"

@implementation CommonScrollView
{
    DCPicScrollView *_adScrollView;
}

- (void)prepareScrollViewsWithUrls:(NSArray<NSString *> *)urls
{
    if (urls && !_adScrollView) {
        //内部使用SDWebImage实现图片加载
        _adScrollView = [DCPicScrollView picScrollViewWithFrame:CGRectMake(0, 0,
                                                                           CGRectGetWidth(self.frame),
                                                                           CGRectGetHeight(self.frame))
                                                  WithImageUrls:urls];
        
        _adScrollView.pageIndicatorTintColor = UIColorFromRGBValue(0xcccccc);
        _adScrollView.currentPageIndicatorTintColor = [UIColor whiteColor];
        _adScrollView.AutoScrollDelay = 4.0f;
        _adScrollView.placeImage = [UIImage imageNamed:@"advertiseDefault"];
        
        [self addSubview:_adScrollView];
    }
}

- (void)actionForImageTaped:(void (^)(NSInteger index))action
{
    [_adScrollView setImageViewDidTapAtIndex:^(NSInteger index) {
        if (action) {
            action(index);
        }
    }];
}

@end
