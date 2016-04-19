//
//  FSTestLayoutViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSTestLayoutViewController.h"


@implementation FSTestLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSAttributedString *guide = [self guideTextWithType:self.type];

    switch (self.type) {
        case FSTestLayoutType11:
        {
            UIView *testView = [FSUICreator createTextViewWithSize:CGSizeZero aString:guide editEnable:NO scroolEnable:YES];
            testView.backgroundColor = RandomColorWithAlpha(1);
            [FSAutolayoutor layView:testView fullOfTheView:self.view];
        }
            break;
            
        default:
            break;
    }
    
}

- (NSAttributedString *)guideTextWithType:(NSInteger)type
{
    NSString *filePath = [FSPathTools pathForKey:@"autolayoutGuide.plist" type:FSBundlePathType];
    NSDictionary *guides = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    NSDictionary *attributes = @{NSFontAttributeName:SysFontWithSize(12),
                                 NSForegroundColorAttributeName:RandomColorWithAlpha(1)};
    
    NSString *key = [NSString stringWithFormat:@"%ld",type];
    NSAttributedString *guideText = [[NSAttributedString alloc] initWithString:guides[key] attributes:attributes];

    return guideText;
}


@end
