//
//  FSIndexViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSIndexViewController.h"

@interface FSIndexViewController ()
@property (nonatomic, strong) UITextView *textView;
@end

@implementation FSIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [PositionTools layView:self.textView atCenterOfView:self.view maxSize:CGSizeZero margins:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.textView.attributedText = [self prepareIntrocueText];
}

- (NSAttributedString *)prepareIntrocueText
{
    NSMutableAttributedString *introText = [[NSMutableAttributedString alloc] init];
    NSArray *introTexts = [NSArray arrayWithContentsOfFile:[FSPathTools pathForKey:@"introduce.plist" type:FSBundlePathType]];
    
    [introTexts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSDictionary *attributes = @{NSFontAttributeName:SysFontWithSize(12),
                                     NSForegroundColorAttributeName:RandomColorWithAlpha(1)};
        
        NSString *introduce = [NSString stringWithFormat:@"\n%ld. %@\n\n",idx+1,obj];
        
        [introText appendAttributedString:[[NSAttributedString alloc] initWithString:introduce attributes:attributes]];
    }];
    
    return introText;
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [UICreator createTextViewWithAttrString:nil editEnable:NO scroolEnable:YES];
    }
    return _textView;
}

@end
