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
    self.navigationItem.hidesBackButton = YES;
    
    self.navigationItem.hidesBackButton = YES;
    
    //自定义返回按钮
    UIButton *backBtn = [FSUICreator createButtonWithNormalImage:@"prev"
                                                highlightedImage:@"prev"
                                                          target:self
                                                          action:@selector(backToParentController)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    //增加左划返回的手势支持
    UISwipeGestureRecognizer *backGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(backToParentController)];
    backGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:backGesture];
}


-(void)backToParentController
{
    if ([self.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
