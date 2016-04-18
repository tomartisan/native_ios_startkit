//
//  FSBaseSubViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSBaseSubViewController.h"

@implementation FSBaseSubViewController
{
    UISwipeGestureRecognizer *_backGesture;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.backUseGesture = YES;
    //自定义返回按钮
    UIButton *backBtn = [FSUICreator createButtonWithNormalImage:@"prev"
                                                highlightedImage:@"prev"
                                                          target:self
                                                          action:@selector(backToParentController)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}


-(void)backToParentController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setBackUseGesture:(BOOL)backUseGesture
{
    _backUseGesture = backUseGesture;
    if (_backUseGesture && !_backGesture) {
        _backGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(backToParentController)];
        _backGesture.direction = UISwipeGestureRecognizerDirectionRight;
        [self.view addGestureRecognizer:_backGesture];
    }else{
        [self.view removeGestureRecognizer:_backGesture];
    }
}

@end
