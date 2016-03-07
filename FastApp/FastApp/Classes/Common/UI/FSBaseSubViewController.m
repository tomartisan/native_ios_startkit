//
//  FSBaseSubViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSBaseSubViewController.h"

@implementation FSBaseSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.tabBarController.tabBar.hidden = YES;
    
    UIButton *backBtn = [UICreator createButtonWithNormalImage:@"back_pic"
                                              highlightedImage:@"back_pic"
                                                        target:self
                                                        action:@selector(backToParentController)
                                                         use2X:YES];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

-(void)backToParentController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
