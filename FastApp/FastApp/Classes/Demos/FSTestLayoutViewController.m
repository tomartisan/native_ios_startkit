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

    switch (_type) {
        case FSTestLayoutType11:
            [FSAutolayoutor layView:[self textViewWithSize:CGSizeZero] fullOfTheView:self.view];
            break;
            
        default:
            break;
    }
    
}

- (UITextView *)textViewWithSize:(CGSize)size
{
    UITextView *textView = [FSUICreator createTextViewWithSize:CGSizeZero
                                                       aString:[self guideTextWithType:_type]
                                                    editEnable:NO
                                                  scroolEnable:YES];
    textView.backgroundColor = RandomColorWithAlpha(1);
    return textView;
}

- (NSAttributedString *)guideTextWithType:(NSInteger)type
{
    NSString *filePath = [FSPathTools pathForKey:@"autolayoutGuide.plist" type:FSBundlePathType];
    NSDictionary *guides = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    NSMutableParagraphStyle *pstyle = [[NSMutableParagraphStyle alloc] init];
    pstyle.firstLineHeadIndent = 20;
    pstyle.lineSpacing = 10;
    
    NSDictionary *attributes = @{NSFontAttributeName:SysFontWithSize(18),
                                 NSForegroundColorAttributeName:RandomColorWithAlpha(1),
                                 NSParagraphStyleAttributeName:pstyle};
    
    NSString *key = [NSString stringWithFormat:@"%ld",type];
    NSAttributedString *guideText = [[NSAttributedString alloc] initWithString:guides[key] attributes:attributes];

    return guideText;
}


@end
