//
//  FSTestLayoutViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSTestLayoutViewController.h"

#define squareViewSize CGSizeMake(200, 200)
#define rectangleViewSize CGSizeMake(300, 200)

@implementation FSTestLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    switch (_type) {
        case FSTestLayoutType11:
            [FSAutolayoutor layView:[self viewWithSize:CGSizeZero] fullOfTheView:self.view];
            break;
        case FSTestLayoutType12:
            [FSAutolayoutor layView:[self viewWithSize:CGSizeZero] atTheView:self.view margins:FS_EqualMargins(10)];
            break;
        case FSTestLayoutType13:
            [FSAutolayoutor layView:[self viewWithSize:rectangleViewSize] atCenterOfTheView:self.view];
            break;
        case FSTestLayoutType14:
            [FSAutolayoutor layView:[self viewWithSize:CGSizeZero] atTheView:self.view margins:UIEdgeInsetsMake(10, 20, 30, 40)];
            break;
        case FSTestLayoutType15:
            [FSAutolayoutor layView:[self viewWithSize:CGSizeZero] atTheView:self.view margins:FS_WidthEqualMargins(50)];
            [FSAutolayoutor layView:[self viewWithSize:CGSizeZero] atTheView:self.view margins:FS_HeightEqualMargins(50)];
            break;
            
            
        case FSTestLayoutType21:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheLeftTopOfTheView:self.view offset:CGSizeZero];
            break;
        case FSTestLayoutType22:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheLeftTopOfTheView:self.view offset:CGSizeMake(10, 20)];
            break;
        case FSTestLayoutType23:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheLeftMiddleOfTheView:self.view offset:0];
            break;
        case FSTestLayoutType24:
            [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(150, 0)] atTheLeftMiddleOfTheView:self.view offset:20];
            break;
        case FSTestLayoutType25:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheLeftBottomOfTheView:self.view offset:CGSizeZero];
            break;
        case FSTestLayoutType26:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheLeftBottomOfTheView:self.view offset:CGSizeMake(10, 20)];
            break;
            
            
        case FSTestLayoutType31:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheRightTopOfTheView:self.view offset:CGSizeZero];
            break;
        case FSTestLayoutType32:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheRightTopOfTheView:self.view offset:CGSizeMake(10, 20)];
            break;
        case FSTestLayoutType33:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheRightMiddleOfTheView:self.view offset:0];
            break;
        case FSTestLayoutType34:
            [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(150, 0)] atTheRightMiddleOfTheView:self.view offset:20];
            break;
        case FSTestLayoutType35:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheRightBottomOfTheView:self.view offset:CGSizeZero];
            break;
        case FSTestLayoutType36:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheRightBottomOfTheView:self.view offset:CGSizeMake(10, 20)];
            break;
            
            
        case FSTestLayoutType41:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheTopMiddleOfTheView:self.view offset:0];
            break;
        case FSTestLayoutType42:
            [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(0, 150)] atTheTopMiddleOfTheView:self.view offset:10];
            break;
        case FSTestLayoutType43:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheBottomMiddleOfTheView:self.view offset:0];
            break;
        case FSTestLayoutType44:
            [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(0, 150)] atTheBottomMiddleOfTheView:self.view offset:10];
            break;
            
        default:
            [self outerlayoutTest];
            break;
    }
    
}

- (void)outerlayoutTest
{
    UIView *targetView = [self viewWithSize:squareViewSize];
    [FSAutolayoutor layView:targetView atCenterOfTheView:self.view];
    
    float span = 10;
    
    [FSAutolayoutor layView:[self viewWithText:@"左上"] toTheLeftOfTheView:targetView span:span alignmentType:AlignmentTop];
    [FSAutolayoutor layView:[self viewWithText:@"左中"] toTheLeftOfTheView:targetView span:span];
    [FSAutolayoutor layView:[self viewWithText:@"左下"] toTheLeftOfTheView:targetView span:span alignmentType:AlignmentBottom];
    
    [FSAutolayoutor layView:[self viewWithText:@"右上"] toTheRightOfTheView:targetView span:span alignmentType:AlignmentTop];
    [FSAutolayoutor layView:[self viewWithText:@"右中"] toTheRightOfTheView:targetView span:span];
    [FSAutolayoutor layView:[self viewWithText:@"右下"] toTheRightOfTheView:targetView span:span alignmentType:AlignmentBottom];
    
    [FSAutolayoutor layView:[self viewWithText:@"中左"] aboveTheView:targetView span:span alignmentType:AlignmentLeft];
    [FSAutolayoutor layView:[self viewWithText:@"中上"] aboveTheView:targetView span:span];
    [FSAutolayoutor layView:[self viewWithText:@"中右"] aboveTheView:targetView span:span alignmentType:AlignmentRight];
    
    [FSAutolayoutor layView:[self viewWithText:@"下左"] belowTheView:targetView span:span alignmentType:AlignmentLeft];
    [FSAutolayoutor layView:[self viewWithText:@"下中"] belowTheView:targetView span:span];
    [FSAutolayoutor layView:[self viewWithText:@"下右"] belowTheView:targetView span:span alignmentType:AlignmentRight];
}

- (UITextView *)viewWithSize:(CGSize)size
{
    UITextView *textView = [FSUICreator createTextViewWithSize:size
                                                       aString:[self guideTextWithType:_type]
                                                    editEnable:NO
                                                  scroolEnable:YES];
    textView.backgroundColor = RandomColorWithAlpha(1);
    return textView;
}

- (UILabel *)viewWithText:(NSString *)text
{
    UILabel *textLabel = [FSUICreator createLabelWithSize:CGSizeMake(35, 35) text:text sysFontSize:14];
    textLabel.backgroundColor = RandomColorWithAlpha(1);
    return textLabel;
}

- (NSAttributedString *)guideTextWithType:(NSInteger)type
{
    NSString *filePath = [FSPathTools pathForKey:@"autolayoutGuide.plist" type:FSBundlePathType];
    NSDictionary *guides = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    NSMutableParagraphStyle *pstyle = [[NSMutableParagraphStyle alloc] init];
    pstyle.firstLineHeadIndent = 20;
    pstyle.lineSpacing = 10;
    
    NSDictionary *attributes = @{NSFontAttributeName:PFBFontWithSize(16),
                                 NSForegroundColorAttributeName:RandomColorWithAlpha(1),
                                 NSParagraphStyleAttributeName:pstyle};

    NSString *guide = [guides valueForKey:[NSString stringWithFormat:@"%ld",type]];
    NSAttributedString *guideText = [[NSAttributedString alloc] initWithString:guide attributes:attributes];

    return guideText;
}


@end
