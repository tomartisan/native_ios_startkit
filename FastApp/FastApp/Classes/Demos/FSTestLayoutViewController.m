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
        {
            UIView *targetView = [self viewWithSize:CGSizeMake(120, 120)];
            [FSAutolayoutor layView:targetView atCenterOfTheView:self.view];
            float span = 0;
            switch (_type) {
                case FSTestLayoutType51:
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] toTheLeftOfTheView:targetView span:span alignmentType:AlignmentTop];
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] toTheLeftOfTheView:targetView span:span];
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] toTheLeftOfTheView:targetView span:span alignmentType:AlignmentBottom];
                    break;
                case FSTestLayoutType52:
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] toTheRightOfTheView:targetView span:span alignmentType:AlignmentTop];
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] toTheRightOfTheView:targetView span:span];
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] toTheRightOfTheView:targetView span:span alignmentType:AlignmentBottom];
                    break;
                case FSTestLayoutType53:
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] aboveTheView:targetView span:span alignmentType:AlignmentLeft];
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] aboveTheView:targetView span:span];
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] aboveTheView:targetView span:span alignmentType:AlignmentRight];
                    break;
                case FSTestLayoutType54:
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] belowTheView:targetView span:span alignmentType:AlignmentLeft];
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] belowTheView:targetView span:span];
                    [FSAutolayoutor layView:[self viewWithSize:CGSizeMake(30, 30)] belowTheView:targetView span:span alignmentType:AlignmentRight];
                    break;
                default:break;
            }
        }
            break;
    }
    
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

    NSString *guide = [guides valueForKey:[NSString stringWithFormat:@"%ld",type]];
    NSAttributedString *guideText = [[NSAttributedString alloc] initWithString:guide attributes:attributes];

    return guideText;
}


@end
