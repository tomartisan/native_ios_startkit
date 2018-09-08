//
//  FSStarRatingBar.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSStarRatingBar.h"

@implementation FSStarRatingBar
{
    NSMutableArray *_starArray;
    
    UIImage *_normalImage;
    UIImage *_hightImage;
    
    CGFloat _imageWidth;
    CGFloat _imageHeight;
    
    //星星之间的间距
    float _itemSpace;
}

- (nonnull instancetype)initWithFrame:(CGRect)frame
                          normalImage:(nonnull NSString *)normal
                       highLightImage:(nonnull NSString *)highLight
                            itemSpace:(float)space
                          ratingCount:(int)count
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _starArray = [NSMutableArray arrayWithCapacity:count];
        _normalImage = [UIImage imageWithNamed:normal];
        _hightImage = [UIImage imageWithNamed:highLight];
        
        _imageWidth = _normalImage.size.width;
        _imageHeight = _normalImage.size.height;
        
        _itemSpace = space;
        
        for (int i = 0; i < count; i++) {
            UIImageView *star = [[UIImageView alloc] initWithImage:_normalImage highlightedImage:_hightImage];
            star.frame = CGRectMake(i*(_imageWidth + _itemSpace),
                                    (CGRectGetHeight(self.frame)-_imageHeight)/2,
                                    _imageWidth,
                                    _imageHeight);
            [self addSubview:star];
            [_starArray addObject:star];
        }
    }
    return self;
}

- (void)lightStarWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    CGFloat maxTouchPoint = _starArray.count * (_imageWidth + _itemSpace);
    [_starArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = [self->_starArray objectAtIndex:idx];
        if ((touchPoint.x > 0) && (touchPoint.x < maxTouchPoint) && (touchPoint.y > 0) && (touchPoint.y < self->_imageWidth)) {
            imageView.highlighted = (imageView.frame.origin.x < touchPoint.x) ? YES : NO;
            //            int score = (int)(touchPoint.x/_imageWidth);  该方式打分不准，待优化...
        }
    }];
    //根据实际上亮的星星数决定分数
    __block int lightStarCount = 0;
    [_starArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = [self->_starArray objectAtIndex:idx];
        if (imageView.highlighted) {
            lightStarCount++;
        }
    }];
    if (_ratingSocreBlock) {
        self.ratingSocreBlock(lightStarCount);
    }
}

#pragma mark - 点击的坐标
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self lightStarWithTouches:touches];
}
#pragma mark - 滑动的坐标
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self lightStarWithTouches:touches];
}

@end

