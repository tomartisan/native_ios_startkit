//
//  FSTestLayoutViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSTestLayoutViewController.h"

#define squareViewSize CGSizeMake(150, 150)
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
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheLeftMiddleOfTheView:self.view offset:20];
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
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheRightMiddleOfTheView:self.view offset:20];
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
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheTopMiddleOfTheView:self.view offset:20];
            break;
        case FSTestLayoutType43:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheBottomMiddleOfTheView:self.view offset:0];
            break;
        case FSTestLayoutType44:
            [FSAutolayoutor layView:[self viewWithSize:squareViewSize] atTheBottomMiddleOfTheView:self.view offset:20];
            break;
            
            
        default:
            break;
    }
    
}

- (UIView *)viewWithSize:(CGSize)size
{    
    UILabel *testView = [FSUICreator createLabelWithSize:size
                                                   aText:[self guideTextWithType:_type]
                                                 bgColor:RandomColorWithAlpha(1)];
    return testView;
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
