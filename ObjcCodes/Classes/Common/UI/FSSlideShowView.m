//
//  FSSlideShowView.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSSlideShowView.h"
#import "DCPicScrollView.h"

@interface FSSlideShowView ()
@property (nonatomic, strong) DCPicScrollView *adScrollView;
@end

@implementation FSSlideShowView


- (void)prepareScrollViewsWithUrls:(NSArray<NSString *> *)urls
{
    if (urls.count > 0) {
        self.adScrollView.images = urls;
        [self addSubview:self.adScrollView];
    }
}

- (void)actionForImageTaped:(void (^)(NSInteger index))action
{
    [self.adScrollView setImageViewDidTapAtIndex:^(NSInteger index) {
        if (action) {
            action(index);
        }
    }];
}

#pragma mark - getters 保证唯一性
- (DCPicScrollView *)adScrollView
{
    if (!_adScrollView) {
        _adScrollView = [[DCPicScrollView alloc] initWithFrame:self.bounds placeHolderImage:@"banner"];
        _adScrollView.pageIndicatorTintColor = FSGrayColor;
        _adScrollView.currentPageIndicatorTintColor = FSWhiteColor;
        _adScrollView.AutoScrollDelay = 3.0f;
    }
    return _adScrollView;
}

@end
