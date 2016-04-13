//
//  FSIndexViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSIndexViewController.h"


@implementation FSIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITextView *textView = [UICreator createTextViewWithAttrString:[self prepareIntrocueText] editEnable:NO scroolEnable:YES];
    
    [PositionTools layView:textView atCenterOfView:self.view maxSize:CGSizeZero margins:0];
}

- (NSAttributedString *)prepareIntrocueText
{
    NSMutableAttributedString *introText = [[NSMutableAttributedString alloc] init];
    NSArray *introTexts = [NSArray arrayWithContentsOfFile:[FSPathTools pathForKey:@"introduce.plist" type:FSBundlePathType]];
    
    [introTexts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSDictionary *attributes = @{NSFontAttributeName:SysFontWithSize(12),
                                     NSForegroundColorAttributeName:RandomColorWithAlpha(1)};
        
        NSString *introduce = [NSString stringWithFormat:@"%ld. %@\n\n\n\n",idx,obj];
        
        [introText appendAttributedString:[[NSAttributedString alloc] initWithString:introduce attributes:attributes]];
    }];
    
    return introText;
}

@end
