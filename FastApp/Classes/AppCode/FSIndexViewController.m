//
//  FSIndexViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSIndexViewController.h"
#import "FSWebViewController.h"

@interface FSIndexViewController ()
@property (nonatomic, strong) UITextView *textView;
@end

@implementation FSIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"博客"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(viewWebsite:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"源码"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(viewWebsite:)];
    
    [FSAutolayoutor layView:self.textView fullOfTheView:self.view];
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

- (void)viewWebsite:(UIBarButtonItem *)bar
{
    NSString *webUrl = [bar.title isEqualToString:@"博客"] ? @"https://www.tangkunyin.com" : @"https://github.com/tangkunyin/FastApp";
    FSWebViewController *webVC = [[FSWebViewController alloc] initWithTitle:bar.title webUrl:webUrl];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [FSUICreator createTextViewWithSize:CGSizeZero aString:nil editEnable:NO scroolEnable:YES];
    }
    return _textView;
}

@end
