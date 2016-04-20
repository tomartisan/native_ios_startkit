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
            [FSAutolayoutor layView:[self textViewWithSize:CGSizeZero]
                      fullOfTheView:self.view];
            break;
        case FSTestLayoutType12:
            [FSAutolayoutor layView:[self textViewWithSize:CGSizeZero]
                  atCenterOfTheView:self.view
                            margins:FS_EqualMargins(10)];
            break;
        case FSTestLayoutType13:
            [FSAutolayoutor layView:[self textViewWithSize:CGSizeMake(300, 200)]
                  atCenterOfTheView:self.view];
            break;
        case FSTestLayoutType14:
            [FSAutolayoutor layView:[self textViewWithSize:CGSizeZero]
                  atCenterOfTheView:self.view
                            margins:UIEdgeInsetsMake(10, 20, 30, 40)];
            break;
        case FSTestLayoutType15:
            [FSAutolayoutor layView:[self textViewWithSize:CGSizeZero]
                  atCenterOfTheView:self.view
                            margins:FS_WidthEqualMargins(50)];
            [FSAutolayoutor layView:[self textViewWithSize:CGSizeZero]
                  atCenterOfTheView:self.view
                            margins:FS_HeightEqualMargins(50)];
            break;
            
        default:
            break;
    }
    
}

- (UITextView *)textViewWithSize:(CGSize)size
{
    UITextView *textView = [FSUICreator createTextViewWithSize:size
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
