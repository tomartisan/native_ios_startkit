//
//  FSTimerButton.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSTimerButton.h"

@interface FSTimerButton ()
@property (nonatomic, strong) dispatch_source_t countDownTimer;
@property (nonatomic, assign) FSTimerButtonRemainTitleType type;
@end

@implementation FSTimerButton

- (void)dealloc
{
    NSLog(@"FSTimerButton dealloc here...");
    if (self.countDownTimer) {
        dispatch_source_cancel(self.countDownTimer);
        self.countDownTimer = nil;
    }
}

- (instancetype)initWithFrame:(CGRect)frame
                  normalTitle:(NSString *)normalTitle
                    textColor:(UIColor *)color
              remainTitleType:(FSTimerButtonRemainTitleType)type
                       target:(id)target
                       action:(SEL)action
               useDefaultSkin:(BOOL)defaultSkin
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        
        if (defaultSkin) {
            self.titleLabel.font = [UIFont systemFontOfSize:14];
            self.layer.borderWidth = 1;
            self.layer.borderColor = color.CGColor;
            self.layer.cornerRadius = 2;
            self.layer.masksToBounds = YES;
        }
        
        [self setTitle:normalTitle forState:UIControlStateNormal];
        [self setTitleColor:color forState:UIControlStateNormal];
        [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        self.type = type;
        self.countDownTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,dispatch_get_main_queue());
        dispatch_source_set_timer(self.countDownTimer,dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    }
    
    return self;
}

- (void)starTimerWithSecond:(int)seconds
{
    self.userInteractionEnabled = NO;
    __block int timeOutInSecond = seconds;
    __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(weakSelf.countDownTimer, ^{
        if(timeOutInSecond == 1){ //倒计时结束，关闭
            dispatch_source_cancel(weakSelf.countDownTimer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [weakSelf setTitle:@"重新发送" forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = YES;
            });
        }else{
            NSString *remainTime = [NSString stringWithFormat:@"%.2d秒后重新获取",timeOutInSecond];
            if (RemainTitlePureTimeType == weakSelf.type) {
                remainTime = [NSString stringWithFormat:@"(%.2ds)",timeOutInSecond];
            }
            log(remainTime)
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf setTitle:remainTime forState:UIControlStateNormal];
            });
            timeOutInSecond--;
        }
    });
    dispatch_resume(weakSelf.countDownTimer);
}


@end
