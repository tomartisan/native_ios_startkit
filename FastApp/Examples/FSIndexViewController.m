//
//  FSIndexViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSIndexViewController.h"
#import "FSWebViewController.h"
#import "FSMarkDownView.h"

@interface FSIndexViewController ()
@property (nonatomic, strong) FSMarkDownView *textView;
@end

@implementation FSIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildNavigationItems];
    [FSAutolayoutor layView:self.textView fullOfTheView:self.view];
}

- (void)viewWebsite:(UIBarButtonItem *)bar
{
    NSString *webUrl = [bar.title isEqualToString:@"Blog"] ? @"https://shuoit.net" : @"https://github.com/tangkunyin";
    FSWebViewController *webVC = [[FSWebViewController alloc] initWithTitle:bar.title webUrl:webUrl];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)buildNavigationItems
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Blog"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(viewWebsite:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Github"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(viewWebsite:)];
}

- (FSMarkDownView *)textView
{
    if (!_textView) {
        _textView = [[FSMarkDownView alloc] initWithFrame:CGRectZero];
        
        NSString *path = [FSPathTools pathForKey:@"index-readme.md" type:FSBundlePathType];
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        _textView.content = content;
    }
    return _textView;
}

@end
